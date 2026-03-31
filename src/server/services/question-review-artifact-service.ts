import { db } from "@/db";
import { questionOptions, questions, questionSources } from "@/db/schema";
import { and, eq, inArray } from "drizzle-orm";
import { z } from "zod";
import {
  getCertificationById,
  getCertificationBySlug,
} from "./certification-service";
import { editQuestion } from "./review-service";

const QUESTION_STATUSES = ["draft", "approved", "rejected"] as const;
const QUESTION_DIFFICULTIES = ["easy", "medium", "hard"] as const;

const questionStatusSchema = z.enum(QUESTION_STATUSES);
const questionDifficultySchema = z.enum(QUESTION_DIFFICULTIES);

const reviewOptionSchema = z.object({
  optionId: z.string().trim().min(1),
  text: z.string().trim().min(1),
  isCorrect: z.boolean(),
  orderIndex: z.number().int().nonnegative(),
});

const reviewSourceSchema = z
  .object({
    sourceId: z.string().trim().min(1),
    type: z.enum(["url", "file"]),
    ref: z.string().trim().min(1),
  })
  .nullable();

const currentQuestionReviewSchema = z.object({
  status: questionStatusSchema,
  difficulty: questionDifficultySchema,
  text: z.string().trim().min(1),
  explanation: z.string(),
  options: z.array(reviewOptionSchema).min(2),
  source: reviewSourceSchema,
});

const proposedQuestionReviewSchema = z
  .object({
    text: z.string().trim().min(1).optional(),
    explanation: z.string().trim().min(1).optional(),
    difficulty: questionDifficultySchema.optional(),
    options: z
      .array(reviewOptionSchema)
      .min(2)
      .superRefine((options, ctx) => validateSingleCorrectOption(options, ctx))
      .optional(),
  })
  .refine(
    (proposed) =>
      proposed.text !== undefined ||
      proposed.explanation !== undefined ||
      proposed.difficulty !== undefined ||
      proposed.options !== undefined,
    {
      message: "A proposed review entry must include at least one change.",
    },
  );

const questionReviewItemSchema = z.object({
  questionId: z.string().trim().min(1),
  orderIndex: z.number().int().nonnegative(),
  batch: z.number().int().positive(),
  current: currentQuestionReviewSchema,
  proposed: proposedQuestionReviewSchema.optional(),
  changeSummary: z.array(z.string().trim().min(1)).default([]),
  reviewNotes: z.string().trim().min(1).optional(),
});

export const certificationQuestionReviewArtifactSchema = z.object({
  workflow: z.literal("certification-question-review"),
  artifactVersion: z.literal(1),
  certification: z.object({
    id: z.string().trim().min(1),
    slug: z.string().trim().min(1),
    title: z.string().trim().min(1),
  }),
  exportedAt: z.string().trim().min(1),
  updatedAt: z.string().trim().min(1),
  filters: z.object({
    statuses: z.array(questionStatusSchema).min(1),
  }),
  reviewProgress: z.object({
    batchSize: z.number().int().positive(),
    reviewedCount: z.number().int().nonnegative(),
    remainingCount: z.number().int().nonnegative(),
    totalExported: z.number().int().nonnegative(),
  }),
  questions: z.array(questionReviewItemSchema),
});

export type QuestionReviewStatus = (typeof QUESTION_STATUSES)[number];

export type CertificationQuestionReviewArtifact = z.infer<
  typeof certificationQuestionReviewArtifactSchema
>;

type ExportCertificationQuestionReviewOptions = {
  certificationId?: string;
  certificationSlug?: string;
  statuses?: QuestionReviewStatus[];
  batchSize?: number;
};

type ApplyCertificationQuestionReviewResult = {
  certificationId: string;
  certificationSlug: string;
  appliedCount: number;
  skippedCount: number;
};

export type InspectCertificationQuestionReviewArtifactResult = {
  certificationId: string;
  certificationSlug: string;
  totalQuestionCount: number;
  proposedQuestionCount: number;
  actionableQuestionCount: number;
  skippedQuestionCount: number;
  noOpQuestionIds: string[];
  incompatibleOptionQuestionIds: string[];
  outOfDateQuestionIds: string[];
  missingQuestionIds: string[];
  readyToApply: boolean;
};

export type ReconcileCertificationQuestionReviewArtifactResult = {
  certificationId: string;
  certificationSlug: string;
  reconciledArtifact: CertificationQuestionReviewArtifact;
  carriedForwardQuestionIds: string[];
  alreadyLiveQuestionIds: string[];
  manualReviewQuestionIds: string[];
  missingQuestionIds: string[];
  repairedOptionIdQuestionIds: string[];
};

type QuestionReviewItem =
  CertificationQuestionReviewArtifact["questions"][number];
type QuestionReviewCurrent = QuestionReviewItem["current"];
type QuestionReviewProposed = NonNullable<QuestionReviewItem["proposed"]>;

type LiveQuestionSnapshot = {
  orderIndex: number;
  current: QuestionReviewCurrent;
};

export const allQuestionReviewStatuses = [...QUESTION_STATUSES];

export function parseCertificationQuestionReviewArtifact(
  rawArtifact: string,
): CertificationQuestionReviewArtifact {
  const parsed = JSON.parse(rawArtifact) as unknown;
  return certificationQuestionReviewArtifactSchema.parse(parsed);
}

export async function exportCertificationQuestionReviewArtifact(
  options: ExportCertificationQuestionReviewOptions,
): Promise<CertificationQuestionReviewArtifact> {
  const certification = await resolveReviewCertification(options);
  const statuses = normalizeStatuses(options.statuses);
  const batchSize = options.batchSize ?? 25;

  const questionRows = await db
    .select({
      questionId: questions.id,
      orderIndex: questions.orderIndex,
      status: questions.status,
      difficulty: questions.difficulty,
      text: questions.text,
      explanation: questions.explanation,
      sourceId: questionSources.id,
      sourceType: questionSources.sourceType,
      sourceRef: questionSources.sourceRef,
    })
    .from(questions)
    .leftJoin(questionSources, eq(questions.sourceId, questionSources.id))
    .where(
      and(
        eq(questions.certificationId, certification.id),
        inArray(questions.status, statuses),
      ),
    )
    .orderBy(questions.orderIndex, questions.createdAt);

  const questionIds = questionRows.map((row) => row.questionId);
  const optionRows = questionIds.length
    ? await db
        .select({
          optionId: questionOptions.id,
          questionId: questionOptions.questionId,
          text: questionOptions.text,
          isCorrect: questionOptions.isCorrect,
          orderIndex: questionOptions.orderIndex,
        })
        .from(questionOptions)
        .where(inArray(questionOptions.questionId, questionIds))
        .orderBy(questionOptions.questionId, questionOptions.orderIndex)
    : [];

  const optionsByQuestionId = new Map<
    string,
    CertificationQuestionReviewArtifact["questions"][number]["current"]["options"]
  >();

  for (const option of optionRows) {
    const existingOptions = optionsByQuestionId.get(option.questionId) ?? [];
    existingOptions.push({
      optionId: option.optionId,
      text: option.text,
      isCorrect: Boolean(option.isCorrect),
      orderIndex: option.orderIndex,
    });
    optionsByQuestionId.set(option.questionId, existingOptions);
  }

  const now = new Date().toISOString();
  const reviewQuestions = questionRows.map((row, index) => ({
    questionId: row.questionId,
    orderIndex: row.orderIndex,
    batch: Math.floor(index / batchSize) + 1,
    current: {
      status: normalizeQuestionStatus(row.status),
      difficulty: normalizeQuestionDifficulty(row.difficulty),
      text: row.text,
      explanation: row.explanation ?? "",
      options: optionsByQuestionId.get(row.questionId) ?? [],
      source:
        row.sourceId && row.sourceType && row.sourceRef
          ? {
              sourceId: row.sourceId,
              type: row.sourceType,
              ref: row.sourceRef,
            }
          : null,
    },
    changeSummary: [],
  }));

  return certificationQuestionReviewArtifactSchema.parse({
    workflow: "certification-question-review",
    artifactVersion: 1,
    certification: {
      id: certification.id,
      slug: certification.slug,
      title: certification.title,
    },
    exportedAt: now,
    updatedAt: now,
    filters: {
      statuses,
    },
    reviewProgress: {
      batchSize,
      reviewedCount: 0,
      remainingCount: reviewQuestions.length,
      totalExported: reviewQuestions.length,
    },
    questions: reviewQuestions,
  });
}

export async function applyCertificationQuestionReviewArtifact(
  artifact: CertificationQuestionReviewArtifact,
): Promise<ApplyCertificationQuestionReviewResult> {
  const certification = await resolveReviewCertification({
    certificationId: artifact.certification.id,
    certificationSlug: artifact.certification.slug,
  });

  const reviewItems = artifact.questions.filter(hasProposedChanges);
  if (reviewItems.length === 0) {
    return {
      certificationId: certification.id,
      certificationSlug: certification.slug,
      appliedCount: 0,
      skippedCount: artifact.questions.length,
    };
  }

  const inspection = await inspectCertificationQuestionReviewArtifact(artifact);

  if (inspection.outOfDateQuestionIds.length > 0) {
    throw new Error(
      `The review artifact is out of date for question(s): ${inspection.outOfDateQuestionIds.join(", ")}. Run the review reconciliation workflow or re-export the certification review artifact before applying changes.`,
    );
  }

  if (inspection.incompatibleOptionQuestionIds.length > 0) {
    throw new Error(
      `Reviewed question(s) ${inspection.incompatibleOptionQuestionIds.join(", ")} must preserve the existing option ids and count. Rewrite option text in place instead of adding, removing, or reordering options.`,
    );
  }

  let appliedCount = 0;
  let skippedCount = artifact.questions.length - reviewItems.length;

  for (const item of reviewItems) {
    const updates = buildQuestionEditPayload(item);
    if (!updates) {
      skippedCount++;
      continue;
    }

    await editQuestion(item.questionId, updates);
    appliedCount++;
  }

  return {
    certificationId: certification.id,
    certificationSlug: certification.slug,
    appliedCount,
    skippedCount,
  };
}

export async function inspectCertificationQuestionReviewArtifact(
  artifact: CertificationQuestionReviewArtifact,
): Promise<InspectCertificationQuestionReviewArtifactResult> {
  const certification = await resolveReviewCertification({
    certificationId: artifact.certification.id,
    certificationSlug: artifact.certification.slug,
  });

  const reviewItems = artifact.questions.filter(hasProposedChanges);
  const noOpQuestionIds = reviewItems
    .filter((item) => buildQuestionEditPayload(item) === null)
    .map((item) => item.questionId);
  const incompatibleOptionQuestionIds = reviewItems
    .filter((item) => !proposedOptionsAreCompatible(item))
    .map((item) => item.questionId);

  const liveSnapshots = reviewItems.length
    ? await loadLiveQuestionSnapshots(
        certification.id,
        reviewItems.map((item) => item.questionId),
      )
    : new Map<string, LiveQuestionSnapshot>();

  const outOfDateQuestionIds: string[] = [];
  const missingQuestionIds: string[] = [];

  for (const item of reviewItems) {
    const liveSnapshot = liveSnapshots.get(item.questionId);
    if (!liveSnapshot) {
      missingQuestionIds.push(item.questionId);
      outOfDateQuestionIds.push(item.questionId);
      continue;
    }

    if (
      liveSnapshot.orderIndex !== item.orderIndex ||
      !snapshotsMatch(liveSnapshot.current, item.current)
    ) {
      outOfDateQuestionIds.push(item.questionId);
    }
  }

  const actionableQuestionCount = reviewItems.length - noOpQuestionIds.length;

  return {
    certificationId: certification.id,
    certificationSlug: certification.slug,
    totalQuestionCount: artifact.questions.length,
    proposedQuestionCount: reviewItems.length,
    actionableQuestionCount,
    skippedQuestionCount: artifact.questions.length - actionableQuestionCount,
    noOpQuestionIds,
    incompatibleOptionQuestionIds,
    outOfDateQuestionIds,
    missingQuestionIds,
    readyToApply:
      incompatibleOptionQuestionIds.length === 0 &&
      outOfDateQuestionIds.length === 0,
  };
}

export async function reconcileCertificationQuestionReviewArtifact(
  artifact: CertificationQuestionReviewArtifact,
): Promise<ReconcileCertificationQuestionReviewArtifactResult> {
  const freshArtifact = await exportCertificationQuestionReviewArtifact({
    certificationId: artifact.certification.id,
    certificationSlug: artifact.certification.slug,
    statuses: artifact.filters.statuses,
    batchSize: artifact.reviewProgress.batchSize,
  });

  const freshItemsByQuestionId = new Map(
    freshArtifact.questions.map((item) => [item.questionId, item]),
  );

  const carriedForwardItems: QuestionReviewItem[] = [];
  const unresolvedItems: QuestionReviewItem[] = [];
  const carriedForwardQuestionIds: string[] = [];
  const alreadyLiveQuestionIds: string[] = [];
  const manualReviewQuestionIds: string[] = [];
  const missingQuestionIds: string[] = [];
  const repairedOptionIdQuestionIds: string[] = [];

  for (const oldItem of artifact.questions) {
    const freshItem = freshItemsByQuestionId.get(oldItem.questionId);
    if (!freshItem) {
      if (oldItem.proposed || oldItem.reviewNotes) {
        missingQuestionIds.push(oldItem.questionId);
      }
      continue;
    }

    if (!oldItem.proposed) {
      unresolvedItems.push({
        ...freshItem,
        changeSummary: oldItem.changeSummary,
        reviewNotes: oldItem.reviewNotes,
      });
      continue;
    }

    const normalizedProposed = normalizeQuestionReviewProposal(oldItem);
    if (normalizedProposed.incompatibleOptions) {
      manualReviewQuestionIds.push(oldItem.questionId);
      unresolvedItems.push({
        ...freshItem,
        changeSummary: oldItem.changeSummary,
        reviewNotes: buildReconciliationReviewNote({
          oldItem,
          conflictingFields: ["options"],
          alreadyLiveFields: [],
          repairedOptionIds: false,
          incompatibleOptions: true,
        }),
      });
      continue;
    }

    if (normalizedProposed.repairedOptionIds) {
      repairedOptionIdQuestionIds.push(oldItem.questionId);
    }

    const reconciliation = reconcileQuestionReviewProposal({
      oldCurrent: oldItem.current,
      freshCurrent: freshItem.current,
      proposed: normalizedProposed.proposed,
    });

    if (reconciliation.kind === "already-live") {
      alreadyLiveQuestionIds.push(oldItem.questionId);
      continue;
    }

    if (reconciliation.kind === "carried-forward") {
      carriedForwardQuestionIds.push(oldItem.questionId);
      carriedForwardItems.push({
        ...freshItem,
        proposed: reconciliation.proposed,
        changeSummary: oldItem.changeSummary,
        reviewNotes: oldItem.reviewNotes,
      });
      continue;
    }

    manualReviewQuestionIds.push(oldItem.questionId);
    unresolvedItems.push({
      ...freshItem,
      changeSummary: oldItem.changeSummary,
      reviewNotes: buildReconciliationReviewNote({
        oldItem,
        conflictingFields: reconciliation.conflictingFields,
        alreadyLiveFields: reconciliation.alreadyLiveFields,
        repairedOptionIds: normalizedProposed.repairedOptionIds,
        incompatibleOptions: false,
      }),
    });
  }

  freshArtifact.updatedAt = new Date().toISOString();
  freshArtifact.questions = [...carriedForwardItems, ...unresolvedItems].sort(
    (left, right) => left.orderIndex - right.orderIndex,
  );
  freshArtifact.reviewProgress.reviewedCount = Math.max(
    0,
    freshArtifact.reviewProgress.totalExported - unresolvedItems.length,
  );
  freshArtifact.reviewProgress.remainingCount = unresolvedItems.length;

  return {
    certificationId: freshArtifact.certification.id,
    certificationSlug: freshArtifact.certification.slug,
    reconciledArtifact: freshArtifact,
    carriedForwardQuestionIds,
    alreadyLiveQuestionIds,
    manualReviewQuestionIds,
    missingQuestionIds,
    repairedOptionIdQuestionIds,
  };
}

async function resolveReviewCertification(options: {
  certificationId?: string;
  certificationSlug?: string;
}) {
  if (options.certificationId) {
    const certificationById = await getCertificationById(
      options.certificationId,
    );
    if (!certificationById) {
      throw new Error(
        `Certification id "${options.certificationId}" was not found.`,
      );
    }

    return certificationById;
  }

  if (options.certificationSlug) {
    const certificationBySlug = await getCertificationBySlug(
      options.certificationSlug,
    );
    if (!certificationBySlug) {
      throw new Error(
        `Certification slug "${options.certificationSlug}" was not found.`,
      );
    }

    return certificationBySlug;
  }

  throw new Error(
    "A certification id or slug is required for question review export and apply workflows.",
  );
}

async function loadLiveQuestionSnapshots(
  certificationId: string,
  questionIds: string[],
) {
  const questionRows = await db
    .select({
      questionId: questions.id,
      orderIndex: questions.orderIndex,
      status: questions.status,
      difficulty: questions.difficulty,
      text: questions.text,
      explanation: questions.explanation,
      sourceId: questionSources.id,
      sourceType: questionSources.sourceType,
      sourceRef: questionSources.sourceRef,
    })
    .from(questions)
    .leftJoin(questionSources, eq(questions.sourceId, questionSources.id))
    .where(
      and(
        eq(questions.certificationId, certificationId),
        inArray(questions.id, questionIds),
      ),
    )
    .orderBy(questions.orderIndex, questions.createdAt);

  const optionRows = questionIds.length
    ? await db
        .select({
          optionId: questionOptions.id,
          questionId: questionOptions.questionId,
          text: questionOptions.text,
          isCorrect: questionOptions.isCorrect,
          orderIndex: questionOptions.orderIndex,
        })
        .from(questionOptions)
        .where(inArray(questionOptions.questionId, questionIds))
        .orderBy(questionOptions.questionId, questionOptions.orderIndex)
    : [];

  const optionsByQuestionId = new Map<
    string,
    CertificationQuestionReviewArtifact["questions"][number]["current"]["options"]
  >();
  for (const option of optionRows) {
    const existingOptions = optionsByQuestionId.get(option.questionId) ?? [];
    existingOptions.push({
      optionId: option.optionId,
      text: option.text,
      isCorrect: Boolean(option.isCorrect),
      orderIndex: option.orderIndex,
    });
    optionsByQuestionId.set(option.questionId, existingOptions);
  }

  const result = new Map<string, LiveQuestionSnapshot>();
  for (const row of questionRows) {
    result.set(row.questionId, {
      orderIndex: row.orderIndex,
      current: {
        status: normalizeQuestionStatus(row.status),
        difficulty: normalizeQuestionDifficulty(row.difficulty),
        text: row.text,
        explanation: row.explanation ?? "",
        options: optionsByQuestionId.get(row.questionId) ?? [],
        source:
          row.sourceId && row.sourceType && row.sourceRef
            ? {
                sourceId: row.sourceId,
                type: row.sourceType,
                ref: row.sourceRef,
              }
            : null,
      },
    });
  }

  return result;
}

function buildQuestionEditPayload(item: QuestionReviewItem) {
  if (!item.proposed) {
    return null;
  }

  const updates: Parameters<typeof editQuestion>[1] = {};

  if (
    item.proposed.text !== undefined &&
    item.proposed.text !== item.current.text
  ) {
    updates.text = item.proposed.text;
  }

  if (
    item.proposed.explanation !== undefined &&
    item.proposed.explanation !== item.current.explanation
  ) {
    updates.explanation = item.proposed.explanation;
  }

  if (
    item.proposed.difficulty !== undefined &&
    item.proposed.difficulty !== item.current.difficulty
  ) {
    updates.difficulty = item.proposed.difficulty;
  }

  if (
    item.proposed.options !== undefined &&
    !optionArraysMatch(item.proposed.options, item.current.options)
  ) {
    updates.options = item.proposed.options.map((option) => ({
      id: option.optionId,
      text: option.text,
      isCorrect: option.isCorrect,
    }));
  }

  return Object.keys(updates).length > 0 ? updates : null;
}

function normalizeStatuses(statuses?: QuestionReviewStatus[]) {
  if (!statuses || statuses.length === 0) {
    return [...QUESTION_STATUSES];
  }

  return Array.from(new Set(statuses));
}

function normalizeQuestionStatus(status: string | null) {
  if (status === "draft" || status === "approved" || status === "rejected") {
    return status;
  }

  return "draft";
}

function normalizeQuestionDifficulty(difficulty: string | null) {
  if (
    difficulty === "easy" ||
    difficulty === "medium" ||
    difficulty === "hard"
  ) {
    return difficulty;
  }

  return "medium";
}

function hasProposedChanges(
  item: QuestionReviewItem,
): item is QuestionReviewItem & {
  proposed: QuestionReviewProposed;
} {
  return item.proposed !== undefined;
}

function proposedOptionsAreCompatible(item: QuestionReviewItem) {
  if (!item.proposed?.options) {
    return true;
  }

  const currentOptionIds = item.current.options.map(
    (option) => option.optionId,
  );
  const proposedOptionIds = item.proposed.options.map(
    (option) => option.optionId,
  );

  return (
    currentOptionIds.length === proposedOptionIds.length &&
    currentOptionIds.every(
      (optionId, index) => optionId === proposedOptionIds[index],
    )
  );
}

function snapshotsMatch(
  left: QuestionReviewCurrent,
  right: QuestionReviewCurrent,
) {
  return (
    left.status === right.status &&
    left.difficulty === right.difficulty &&
    left.text === right.text &&
    left.explanation === right.explanation &&
    sourcesMatch(left.source, right.source) &&
    optionArraysMatch(left.options, right.options)
  );
}

function optionArraysMatch(
  left: QuestionReviewCurrent["options"],
  right: QuestionReviewCurrent["options"],
) {
  if (left.length !== right.length) {
    return false;
  }

  return left.every((option, index) => {
    const other = right[index];
    return (
      option.optionId === other.optionId &&
      option.text === other.text &&
      option.isCorrect === other.isCorrect &&
      option.orderIndex === other.orderIndex
    );
  });
}

function sourcesMatch(
  left: QuestionReviewCurrent["source"],
  right: QuestionReviewCurrent["source"],
) {
  if (left === null || right === null) {
    return left === right;
  }

  return (
    left.sourceId === right.sourceId &&
    left.type === right.type &&
    left.ref === right.ref
  );
}

function validateSingleCorrectOption(
  options: { isCorrect: boolean }[],
  ctx: z.RefinementCtx,
) {
  const correctCount = options.filter((option) => option.isCorrect).length;
  if (correctCount !== 1) {
    ctx.addIssue({
      code: z.ZodIssueCode.custom,
      message: "Each reviewed question must keep exactly one correct option.",
    });
  }
}

function normalizeQuestionReviewProposal(item: QuestionReviewItem) {
  if (!item.proposed?.options) {
    return {
      proposed: item.proposed as QuestionReviewProposed,
      repairedOptionIds: false,
      incompatibleOptions: false,
    };
  }

  if (item.proposed.options.length !== item.current.options.length) {
    return {
      proposed: item.proposed,
      repairedOptionIds: false,
      incompatibleOptions: true,
    };
  }

  const reorderedOptions = item.proposed.options.some(
    (option, index) =>
      option.orderIndex !== item.current.options[index]?.orderIndex,
  );

  if (reorderedOptions) {
    return {
      proposed: item.proposed,
      repairedOptionIds: false,
      incompatibleOptions: true,
    };
  }

  const normalizedOptions = item.proposed.options.map((option, index) => ({
    ...option,
    optionId: item.current.options[index].optionId,
    orderIndex: item.current.options[index].orderIndex,
  }));

  return {
    proposed: {
      ...item.proposed,
      options: normalizedOptions,
    },
    repairedOptionIds: item.proposed.options.some(
      (option, index) => option.optionId !== normalizedOptions[index].optionId,
    ),
    incompatibleOptions: false,
  };
}

function reconcileQuestionReviewProposal({
  oldCurrent,
  freshCurrent,
  proposed,
}: {
  oldCurrent: QuestionReviewCurrent;
  freshCurrent: QuestionReviewCurrent;
  proposed: QuestionReviewProposed;
}) {
  const nextProposed: Partial<QuestionReviewProposed> = {};
  const alreadyLiveFields: string[] = [];
  const conflictingFields: string[] = [];

  if (proposed.text !== undefined) {
    if (freshCurrent.text === proposed.text) {
      alreadyLiveFields.push("text");
    } else if (freshCurrent.text === oldCurrent.text) {
      nextProposed.text = proposed.text;
    } else {
      conflictingFields.push("text");
    }
  }

  if (proposed.explanation !== undefined) {
    if (freshCurrent.explanation === proposed.explanation) {
      alreadyLiveFields.push("explanation");
    } else if (freshCurrent.explanation === oldCurrent.explanation) {
      nextProposed.explanation = proposed.explanation;
    } else {
      conflictingFields.push("explanation");
    }
  }

  if (proposed.difficulty !== undefined) {
    if (freshCurrent.difficulty === proposed.difficulty) {
      alreadyLiveFields.push("difficulty");
    } else if (freshCurrent.difficulty === oldCurrent.difficulty) {
      nextProposed.difficulty = proposed.difficulty;
    } else {
      conflictingFields.push("difficulty");
    }
  }

  if (proposed.options !== undefined) {
    if (optionArraysMatch(freshCurrent.options, proposed.options)) {
      alreadyLiveFields.push("options");
    } else if (optionArraysMatch(freshCurrent.options, oldCurrent.options)) {
      nextProposed.options = proposed.options;
    } else {
      conflictingFields.push("options");
    }
  }

  if (conflictingFields.length > 0) {
    return {
      kind: "needs-review" as const,
      conflictingFields,
      alreadyLiveFields,
    };
  }

  if (Object.keys(nextProposed).length === 0) {
    return {
      kind: "already-live" as const,
    };
  }

  return {
    kind: "carried-forward" as const,
    proposed: nextProposed as QuestionReviewProposed,
  };
}

function buildReconciliationReviewNote({
  oldItem,
  conflictingFields,
  alreadyLiveFields,
  repairedOptionIds,
  incompatibleOptions,
}: {
  oldItem: QuestionReviewItem;
  conflictingFields: string[];
  alreadyLiveFields: string[];
  repairedOptionIds: boolean;
  incompatibleOptions: boolean;
}) {
  const notes = [
    incompatibleOptions
      ? "The previous proposal changed the option structure in a way that is not compatible with this workflow. Re-review the options in place before applying."
      : `Fresh export diverged from the reviewed snapshot for field(s): ${conflictingFields.join(", ")}. Re-review this question before applying.`,
  ];

  if (alreadyLiveFields.length > 0) {
    notes.push(
      `These reviewed fields are already live in the database: ${alreadyLiveFields.join(", ")}.`,
    );
  }

  if (repairedOptionIds) {
    notes.push(
      "The previous artifact regenerated option ids. Reconciliation normalized those ids only for comparison; inspect the live options before proposing another option edit.",
    );
  }

  if (oldItem.changeSummary.length > 0) {
    notes.push(`Previous review intent: ${oldItem.changeSummary.join(" ")}`);
  }

  if (oldItem.reviewNotes) {
    notes.push(`Previous notes: ${oldItem.reviewNotes}`);
  }

  return notes.join("\n\n");
}
