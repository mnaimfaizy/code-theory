import { db } from "@/db";
import { questions, questionOptions } from "@/db/schema";
import { eq, and } from "drizzle-orm";

/**
 * Get draft questions for review (across all certifications or for a specific one).
 */
export async function getDraftQuestions(certificationId?: string) {
  const conditions = [eq(questions.status, "draft")];
  if (certificationId) {
    conditions.push(eq(questions.certificationId, certificationId));
  }

  const drafts = await db
    .select()
    .from(questions)
    .where(and(...conditions))
    .orderBy(questions.createdAt);

  const result = [];
  for (const q of drafts) {
    const opts = await db
      .select()
      .from(questionOptions)
      .where(eq(questionOptions.questionId, q.id))
      .orderBy(questionOptions.orderIndex);

    result.push({ ...q, options: opts });
  }

  return result;
}

/**
 * Approve a draft question.
 */
export async function approveQuestion(questionId: string) {
  await db
    .update(questions)
    .set({ status: "approved", updatedAt: new Date().toISOString() })
    .where(eq(questions.id, questionId));
}

/**
 * Reject a draft question.
 */
export async function rejectQuestion(questionId: string) {
  await db
    .update(questions)
    .set({ status: "rejected", updatedAt: new Date().toISOString() })
    .where(eq(questions.id, questionId));
}

/**
 * Edit a question's text and options.
 */
export async function editQuestion(
  questionId: string,
  data: {
    text?: string;
    explanation?: string;
    difficulty?: "easy" | "medium" | "hard";
    options?: { id: string; text: string; isCorrect: boolean }[];
  },
) {
  const updates: Record<string, unknown> = {
    updatedAt: new Date().toISOString(),
  };
  if (data.text !== undefined) updates.text = data.text;
  if (data.explanation !== undefined) updates.explanation = data.explanation;
  if (data.difficulty !== undefined) updates.difficulty = data.difficulty;

  await db.update(questions).set(updates).where(eq(questions.id, questionId));

  if (data.options) {
    for (const opt of data.options) {
      await db
        .update(questionOptions)
        .set({ text: opt.text, isCorrect: opt.isCorrect })
        .where(eq(questionOptions.id, opt.id));
    }
  }
}
