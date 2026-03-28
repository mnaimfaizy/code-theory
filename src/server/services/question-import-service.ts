import { z } from "zod";
import {
  addQuestion,
  createCertification,
  getCertificationById,
  getCertificationBySlug,
  registerSource,
} from "./certification-service";

const optionSchema = z.object({
  text: z.string().trim().min(1),
  isCorrect: z.boolean(),
});

const referenceSchema = z
  .object({
    sourceRef: z.string().trim().min(1).optional(),
    locator: z.string().trim().min(1).optional(),
    excerpt: z.string().trim().min(1).optional(),
    notes: z.string().trim().min(1).optional(),
  })
  .optional();

const questionSchema = z.object({
  text: z.string().trim().min(1),
  questionType: z.string().trim().min(1).default("multiple-choice"),
  difficulty: z.enum(["easy", "medium", "hard"]).default("medium"),
  explanation: z.string().trim().min(1),
  options: z
    .array(optionSchema)
    .min(2)
    .superRefine((options, ctx) => {
      const correctCount = options.filter((option) => option.isCorrect).length;
      if (correctCount !== 1) {
        ctx.addIssue({
          code: z.ZodIssueCode.custom,
          message: "Each question must have exactly one correct option.",
        });
      }
    }),
  approved: z.boolean().optional(),
  reference: referenceSchema,
});

export const approvedQuestionImportArtifactSchema = z.object({
  certification: z
    .object({
      id: z.string().trim().min(1).optional(),
      slug: z.string().trim().min(1).optional(),
      title: z.string().trim().min(1).optional(),
      description: z.string().trim().min(1).optional(),
      passingScore: z.number().int().min(1).max(100).optional(),
      timeLimitMinutes: z.number().int().positive().optional(),
      createIfMissing: z.boolean().default(false),
    })
    .default({ createIfMissing: false }),
  source: z.object({
    type: z.enum(["url", "file"]),
    ref: z.string().trim().min(1),
    title: z.string().trim().min(1).optional(),
    coverageNotes: z.string().trim().min(1).optional(),
  }),
  questionTypes: z.array(z.string().trim().min(1)).default(["multiple-choice"]),
  approval: z.object({
    supervisor: z.string().trim().min(1),
    approvedAt: z.string().trim().min(1),
    approved: z.boolean(),
    publishDirectly: z.boolean().default(true),
  }),
  questions: z.array(questionSchema).min(1),
});

export type ApprovedQuestionImportArtifact = z.infer<
  typeof approvedQuestionImportArtifactSchema
>;

export type ApprovedQuestionImportOptions = {
  certificationId?: string;
  certificationSlug?: string;
  createCertificationIfMissing?: boolean;
  createdBy?: string;
};

export type ApprovedQuestionImportResult = {
  certificationId: string;
  certificationSlug: string;
  sourceId: string;
  importedCount: number;
  skippedCount: number;
  publishedCount: number;
};

export function parseApprovedQuestionImportArtifact(
  rawArtifact: string,
): ApprovedQuestionImportArtifact {
  const parsed = JSON.parse(rawArtifact) as unknown;
  return approvedQuestionImportArtifactSchema.parse(parsed);
}

export async function importApprovedQuestionArtifact(
  artifact: ApprovedQuestionImportArtifact,
  options: ApprovedQuestionImportOptions = {},
): Promise<ApprovedQuestionImportResult> {
  if (!artifact.approval.approved) {
    throw new Error(
      "The artifact is not supervisor-approved yet. Review and approve the JSON file before importing.",
    );
  }

  const certification = await resolveCertification(artifact, options);
  const publishDirectly = artifact.approval.publishDirectly;

  const source = await registerSource({
    certificationId: certification.id,
    sourceType: artifact.source.type,
    sourceRef: artifact.source.ref,
  });

  let importedCount = 0;
  let skippedCount = 0;
  let publishedCount = 0;

  for (const question of artifact.questions) {
    if (!isSupportedQuestionType(question.questionType)) {
      skippedCount++;
      continue;
    }

    const isApproved = question.approved ?? artifact.approval.approved;
    if (!isApproved) {
      skippedCount++;
      continue;
    }

    const status = publishDirectly ? "approved" : "draft";

    await addQuestion({
      certificationId: certification.id,
      text: question.text,
      explanation: question.explanation,
      difficulty: question.difficulty,
      status,
      sourceId: source.id,
      options: question.options,
    });

    importedCount++;
    if (status === "approved") {
      publishedCount++;
    }
  }

  if (importedCount === 0) {
    throw new Error(
      "No approved, supported questions were found in the artifact. Nothing was imported.",
    );
  }

  return {
    certificationId: certification.id,
    certificationSlug: certification.slug,
    sourceId: source.id,
    importedCount,
    skippedCount,
    publishedCount,
  };
}

async function resolveCertification(
  artifact: ApprovedQuestionImportArtifact,
  options: ApprovedQuestionImportOptions,
) {
  const explicitCertificationId =
    options.certificationId ?? artifact.certification.id;
  if (explicitCertificationId) {
    const existingById = await getCertificationById(explicitCertificationId);
    if (existingById) {
      return existingById;
    }

    throw new Error(
      `Certification id \"${explicitCertificationId}\" was not found.`,
    );
  }

  const explicitCertificationSlug =
    options.certificationSlug ?? artifact.certification.slug;
  if (explicitCertificationSlug) {
    const existingBySlug = await getCertificationBySlug(
      explicitCertificationSlug,
    );
    if (existingBySlug) {
      return existingBySlug;
    }

    const shouldCreate =
      options.createCertificationIfMissing ??
      artifact.certification.createIfMissing;
    if (!shouldCreate) {
      throw new Error(
        `Certification slug \"${explicitCertificationSlug}\" was not found. Provide an existing certification or enable creation.`,
      );
    }
  }

  const shouldCreate =
    options.createCertificationIfMissing ??
    artifact.certification.createIfMissing;
  if (!shouldCreate) {
    throw new Error(
      "No certification id or slug was provided. Provide a target certification or request a new certification first.",
    );
  }

  const title = artifact.certification.title;
  if (!title) {
    throw new Error(
      "Creating a certification requires artifact.certification.title.",
    );
  }

  const slug = artifact.certification.slug ?? slugify(title);
  const existingBySlug = await getCertificationBySlug(slug);
  if (existingBySlug) {
    return existingBySlug;
  }

  const created = await createCertification({
    title,
    slug,
    description: artifact.certification.description,
    timeLimitMinutes: artifact.certification.timeLimitMinutes,
    passingScore: artifact.certification.passingScore,
    createdBy: options.createdBy,
  });

  const certification = await getCertificationBySlug(created.slug);
  if (!certification) {
    throw new Error("The certification was created but could not be reloaded.");
  }

  return certification;
}

function isSupportedQuestionType(questionType: string) {
  const normalized = questionType.trim().toLowerCase();
  return [
    "mcq",
    "multiple-choice",
    "multiple choice",
    "single-select",
  ].includes(normalized);
}

function slugify(value: string) {
  return value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}
