import { db } from "@/db";
import {
  certifications,
  questions,
  questionOptions,
  questionSources,
} from "@/db/schema";
import { eq, and, count } from "drizzle-orm";
import { v4 as uuid } from "uuid";

/**
 * Create a new certification.
 */
export async function createCertification(data: {
  title: string;
  slug: string;
  description?: string;
  icon?: string;
  timeLimitMinutes?: number;
  passingScore?: number;
  createdBy: string;
}) {
  const id = uuid();
  const now = new Date().toISOString();

  await db.insert(certifications).values({
    id,
    title: data.title,
    slug: data.slug,
    description: data.description ?? null,
    icon: data.icon ?? null,
    timeLimitMinutes: data.timeLimitMinutes ?? null,
    passingScore: data.passingScore ?? 70,
    createdBy: data.createdBy,
    createdAt: now,
    updatedAt: now,
  });

  return { id, slug: data.slug };
}

/**
 * Get all certifications with question counts.
 */
export async function getAllCertifications() {
  const certs = await db
    .select()
    .from(certifications)
    .orderBy(certifications.title);

  const result = [];
  for (const cert of certs) {
    const [qCount] = await db
      .select({ count: count() })
      .from(questions)
      .where(
        and(
          eq(questions.certificationId, cert.id),
          eq(questions.status, "approved"),
        ),
      );

    result.push({
      ...cert,
      questionCount: qCount?.count ?? 0,
    });
  }

  return result;
}

/**
 * Get a certification by slug.
 */
export async function getCertificationBySlug(slug: string) {
  const [cert] = await db
    .select()
    .from(certifications)
    .where(eq(certifications.slug, slug))
    .limit(1);

  return cert ?? null;
}

/**
 * Add a question with options to a certification.
 */
export async function addQuestion(data: {
  certificationId: string;
  text: string;
  explanation?: string;
  difficulty?: "easy" | "medium" | "hard";
  status?: "draft" | "approved" | "rejected";
  sourceId?: string;
  options: { text: string; isCorrect: boolean }[];
}) {
  const questionId = uuid();
  const now = new Date().toISOString();

  // Get the next order index
  const existingQuestions = await db
    .select({ count: count() })
    .from(questions)
    .where(eq(questions.certificationId, data.certificationId));

  const orderIndex = existingQuestions[0]?.count ?? 0;

  await db.insert(questions).values({
    id: questionId,
    certificationId: data.certificationId,
    text: data.text,
    explanation: data.explanation ?? null,
    difficulty: data.difficulty ?? "medium",
    status: data.status ?? "draft",
    sourceId: data.sourceId ?? null,
    orderIndex,
    createdAt: now,
    updatedAt: now,
  });

  // Insert options
  for (let i = 0; i < data.options.length; i++) {
    await db.insert(questionOptions).values({
      id: uuid(),
      questionId,
      text: data.options[i].text,
      isCorrect: data.options[i].isCorrect,
      orderIndex: i,
    });
  }

  return { id: questionId };
}

/**
 * Update question status (approve, reject, etc.)
 */
export async function updateQuestionStatus(
  questionId: string,
  status: "draft" | "approved" | "rejected",
) {
  await db
    .update(questions)
    .set({ status, updatedAt: new Date().toISOString() })
    .where(eq(questions.id, questionId));
}

/**
 * Get all questions for a certification, optionally filtered by status.
 */
export async function getQuestionsByCertification(
  certificationId: string,
  status?: "draft" | "approved" | "rejected",
) {
  const conditions = [eq(questions.certificationId, certificationId)];
  if (status) {
    conditions.push(eq(questions.status, status));
  }

  const rows = await db
    .select()
    .from(questions)
    .where(and(...conditions))
    .orderBy(questions.orderIndex);

  // Fetch options for each question
  const result = [];
  for (const q of rows) {
    const opts = await db
      .select()
      .from(questionOptions)
      .where(eq(questionOptions.questionId, q.id))
      .orderBy(questionOptions.orderIndex);

    result.push({
      ...q,
      options: opts,
    });
  }

  return result;
}

/**
 * Register a content source for a certification.
 */
export async function registerSource(data: {
  certificationId: string;
  sourceType: "url" | "file";
  sourceRef: string;
  rawContent?: string;
  chunkCount?: number;
}) {
  const id = uuid();
  await db.insert(questionSources).values({
    id,
    certificationId: data.certificationId,
    sourceType: data.sourceType,
    sourceRef: data.sourceRef,
    rawContent: data.rawContent ?? null,
    chunkCount: data.chunkCount ?? 0,
    createdAt: new Date().toISOString(),
  });

  return { id };
}
