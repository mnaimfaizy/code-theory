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

type LiveQuestionSnapshot = {
  orderIndex: number;
  current: CertificationQuestionReviewArtifact["questions"][number]["current"];
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

  const liveSnapshots = await loadLiveQuestionSnapshots(
    certification.id,
    reviewItems.map((item) => item.questionId),
  );

  const conflictedQuestionIds: string[] = [];

  for (const item of reviewItems) {
    const liveSnapshot = liveSnapshots.get(item.questionId);
    if (!liveSnapshot) {
      conflictedQuestionIds.push(item.questionId);
      continue;
    }

    if (
      liveSnapshot.orderIndex !== item.orderIndex ||
      !snapshotsMatch(liveSnapshot.current, item.current)
    ) {
      conflictedQuestionIds.push(item.questionId);
    }
  }

  if (conflictedQuestionIds.length > 0) {
    throw new Error(
      `The review artifact is out of date for question(s): ${conflictedQuestionIds.join(", ")}. Re-export the certification review artifact before applying changes.`,
    );
  }

  let appliedCount = 0;
  let skippedCount = artifact.questions.length - reviewItems.length;

  for (const item of reviewItems) {
    validateProposedOptionsCompatibility(item);

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

function buildQuestionEditPayload(
  item: CertificationQuestionReviewArtifact["questions"][number],
) {
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
  item: CertificationQuestionReviewArtifact["questions"][number],
): item is CertificationQuestionReviewArtifact["questions"][number] & {
  proposed: NonNullable<
    CertificationQuestionReviewArtifact["questions"][number]["proposed"]
  >;
} {
  return item.proposed !== undefined;
}

function validateProposedOptionsCompatibility(
  item: CertificationQuestionReviewArtifact["questions"][number],
) {
  if (!item.proposed?.options) {
    return;
  }

  const currentOptionIds = item.current.options.map(
    (option) => option.optionId,
  );
  const proposedOptionIds = item.proposed.options.map(
    (option) => option.optionId,
  );

  if (
    currentOptionIds.length !== proposedOptionIds.length ||
    currentOptionIds.some(
      (optionId, index) => optionId !== proposedOptionIds[index],
    )
  ) {
    throw new Error(
      `Reviewed question "${item.questionId}" must preserve the existing option ids and count. Rewrite option text in place instead of adding, removing, or reordering options.`,
    );
  }
}

function snapshotsMatch(
  left: CertificationQuestionReviewArtifact["questions"][number]["current"],
  right: CertificationQuestionReviewArtifact["questions"][number]["current"],
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
  left: CertificationQuestionReviewArtifact["questions"][number]["current"]["options"],
  right: CertificationQuestionReviewArtifact["questions"][number]["current"]["options"],
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
  left: CertificationQuestionReviewArtifact["questions"][number]["current"]["source"],
  right: CertificationQuestionReviewArtifact["questions"][number]["current"]["source"],
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
