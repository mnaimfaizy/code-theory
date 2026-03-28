import { db } from "@/db";
import {
  certifications,
  questions,
  questionOptions,
  attempts,
  attemptAnswers,
} from "@/db/schema";
import { eq, and, sql, count } from "drizzle-orm";
import { v4 as uuid } from "uuid";
import {
  getDefaultQuizDurationMinutes,
  sanitizeQuizDurationMinutes,
  sanitizeQuizQuestionCount,
} from "@/lib/quiz-options";
import type {
  QuizConfig,
  QuizQuestion,
  QuizAttempt,
  QuizResult,
  QuizAnswerResult,
} from "@/types";

/**
 * Get approved questions for a certification, optionally shuffled.
 */
export async function getQuizQuestions(
  config: QuizConfig,
): Promise<QuizQuestion[]> {
  const rows = await db
    .select({
      id: questions.id,
      text: questions.text,
      explanation: questions.explanation,
      difficulty: questions.difficulty,
      orderIndex: questions.orderIndex,
    })
    .from(questions)
    .where(
      and(
        eq(questions.certificationId, config.certificationId),
        eq(questions.status, "approved"),
      ),
    )
    .orderBy(questions.orderIndex);

  let selected = rows;

  if (config.mode === "random") {
    selected = shuffleArray([...rows]);
  }

  const questionCount = sanitizeQuizQuestionCount(
    config.questionCount,
    selected.length,
  );

  if (questionCount) {
    selected = selected.slice(0, questionCount);
  }

  if (selected.length === 0) {
    return [];
  }

  // Fetch options for each question
  const questionIds = selected.map((q) => q.id);
  const allOptions = await db
    .select()
    .from(questionOptions)
    .where(
      sql`${questionOptions.questionId} IN (${sql.join(
        questionIds.map((id) => sql`${id}`),
        sql`, `,
      )})`,
    );

  const optionsByQuestion = new Map<string, typeof allOptions>();
  for (const opt of allOptions) {
    const existing = optionsByQuestion.get(opt.questionId) ?? [];
    existing.push(opt);
    optionsByQuestion.set(opt.questionId, existing);
  }

  return selected.map((q) => ({
    id: q.id,
    text: q.text,
    explanation: q.explanation,
    difficulty: q.difficulty as "easy" | "medium" | "hard",
    options: (optionsByQuestion.get(q.id) ?? [])
      .sort((a, b) => a.orderIndex - b.orderIndex)
      .map((o) => ({
        id: o.id,
        text: o.text,
        orderIndex: o.orderIndex,
      })),
  }));
}

/**
 * Create a new quiz attempt.
 */
export async function createAttempt(
  userId: string,
  config: QuizConfig,
  questionCount: number,
): Promise<QuizAttempt> {
  const [cert] = await db
    .select()
    .from(certifications)
    .where(eq(certifications.id, config.certificationId))
    .limit(1);

  if (!cert) throw new Error("Certification not found");

  const configuredTimeLimitMinutes = config.timed
    ? (sanitizeQuizDurationMinutes(config.timeLimitMinutes) ??
      sanitizeQuizDurationMinutes(cert.timeLimitMinutes) ??
      getDefaultQuizDurationMinutes(cert.timeLimitMinutes))
    : null;

  const timeLimitSeconds = configuredTimeLimitMinutes
    ? configuredTimeLimitMinutes * 60
    : null;

  const id = uuid();
  const now = new Date().toISOString();

  await db.insert(attempts).values({
    id,
    userId,
    certificationId: config.certificationId,
    mode: config.mode,
    timed: config.timed,
    timeLimitSeconds,
    questionCount,
    startedAt: now,
  });

  return {
    id,
    certificationId: config.certificationId,
    certificationTitle: cert.title,
    mode: config.mode,
    timed: config.timed,
    timeLimitSeconds,
    questionCount,
    score: null,
    passed: null,
    startedAt: now,
    completedAt: null,
  };
}

/**
 * Save an answer for a question within an attempt.
 */
export async function saveAnswer(
  attemptId: string,
  questionId: string,
  selectedOptionId: string | null,
) {
  // Check if correct
  let isCorrect = false;
  if (selectedOptionId) {
    const [option] = await db
      .select()
      .from(questionOptions)
      .where(eq(questionOptions.id, selectedOptionId))
      .limit(1);
    isCorrect = option?.isCorrect ?? false;
  }

  // Upsert answer
  const existing = await db
    .select()
    .from(attemptAnswers)
    .where(
      and(
        eq(attemptAnswers.attemptId, attemptId),
        eq(attemptAnswers.questionId, questionId),
      ),
    )
    .limit(1);

  if (existing.length > 0) {
    await db
      .update(attemptAnswers)
      .set({
        selectedOptionId,
        isCorrect,
        answeredAt: new Date().toISOString(),
      })
      .where(eq(attemptAnswers.id, existing[0].id));
  } else {
    await db.insert(attemptAnswers).values({
      id: uuid(),
      attemptId,
      questionId,
      selectedOptionId,
      isCorrect,
      answeredAt: new Date().toISOString(),
    });
  }
}

/**
 * Complete an attempt, calculate score, and return results.
 */
export async function completeAttempt(attemptId: string): Promise<QuizResult> {
  const [attempt] = await db
    .select()
    .from(attempts)
    .where(eq(attempts.id, attemptId))
    .limit(1);

  if (!attempt) throw new Error("Attempt not found");

  const [cert] = await db
    .select()
    .from(certifications)
    .where(eq(certifications.id, attempt.certificationId))
    .limit(1);

  if (!cert) throw new Error("Certification not found");

  const answers = await db
    .select()
    .from(attemptAnswers)
    .where(eq(attemptAnswers.attemptId, attemptId));

  const totalCorrect = answers.filter((a) => a.isCorrect).length;
  const totalQuestions = attempt.questionCount;
  const percentage =
    totalQuestions > 0 ? Math.round((totalCorrect / totalQuestions) * 100) : 0;
  const passed = percentage >= cert.passingScore;

  // Update attempt
  const now = new Date().toISOString();
  await db
    .update(attempts)
    .set({
      score: percentage,
      passed,
      completedAt: now,
    })
    .where(eq(attempts.id, attemptId));

  // Build detailed answer results
  const answerResults: QuizAnswerResult[] = [];
  for (const answer of answers) {
    const [question] = await db
      .select()
      .from(questions)
      .where(eq(questions.id, answer.questionId))
      .limit(1);

    const opts = await db
      .select()
      .from(questionOptions)
      .where(eq(questionOptions.questionId, answer.questionId))
      .orderBy(questionOptions.orderIndex);

    const correctOpt = opts.find((o) => o.isCorrect);

    answerResults.push({
      questionId: answer.questionId,
      questionText: question?.text ?? "",
      explanation: question?.explanation ?? null,
      selectedOptionId: answer.selectedOptionId,
      correctOptionId: correctOpt?.id ?? "",
      isCorrect: answer.isCorrect ?? false,
      options: opts.map((o) => ({
        id: o.id,
        text: o.text,
        orderIndex: o.orderIndex,
      })),
    });
  }

  return {
    attempt: {
      id: attempt.id,
      certificationId: attempt.certificationId,
      certificationTitle: cert.title,
      mode: attempt.mode as "fixed" | "random",
      timed: attempt.timed,
      timeLimitSeconds: attempt.timeLimitSeconds,
      questionCount: totalQuestions,
      score: percentage,
      passed,
      startedAt: attempt.startedAt,
      completedAt: now,
    },
    answers: answerResults,
    totalCorrect,
    totalQuestions,
    percentage,
  };
}

/**
 * Get the question count for a certification (approved only).
 */
export async function getApprovedQuestionCount(
  certificationId: string,
): Promise<number> {
  const [result] = await db
    .select({ count: count() })
    .from(questions)
    .where(
      and(
        eq(questions.certificationId, certificationId),
        eq(questions.status, "approved"),
      ),
    );
  return result?.count ?? 0;
}

// ─── Helpers ─────────────────────────────────────────

function shuffleArray<T>(array: T[]): T[] {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}
