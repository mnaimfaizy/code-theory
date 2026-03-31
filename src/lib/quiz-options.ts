import type { QuizConfig } from "@/types";

const QUIZ_QUESTION_COUNT_PRESETS = [5, 10, 15, 20, 25, 30, 40, 50] as const;

export const QUIZ_DURATION_PRESETS = [10, 15, 20, 30, 45, 60, 90, 120] as const;

export const MIN_QUIZ_QUESTION_COUNT = 1;
export const MIN_QUIZ_DURATION_MINUTES = 10;
export const MAX_QUIZ_DURATION_MINUTES = 180;

function getUniqueSorted(values: number[]) {
  return [...new Set(values)].sort((left, right) => left - right);
}

export function sanitizeQuizQuestionCount(
  value: number | null | undefined,
  totalQuestions?: number,
): number | undefined {
  if (
    typeof value !== "number" ||
    !Number.isInteger(value) ||
    value < MIN_QUIZ_QUESTION_COUNT
  ) {
    return undefined;
  }

  if (typeof totalQuestions === "number" && totalQuestions > 0) {
    return Math.min(value, totalQuestions);
  }

  return value;
}

export function getDefaultQuizQuestionCount(totalQuestions: number) {
  if (totalQuestions <= 0) {
    return 0;
  }

  return totalQuestions >= 10 ? 10 : totalQuestions;
}

export function getQuizQuestionCountOptions(totalQuestions: number) {
  if (totalQuestions <= 0) {
    return [];
  }

  return getUniqueSorted([
    ...QUIZ_QUESTION_COUNT_PRESETS.filter((count) => count < totalQuestions),
    totalQuestions,
  ]);
}

export function sanitizeQuizDurationMinutes(
  value: number | null | undefined,
): number | undefined {
  if (typeof value !== "number" || !Number.isInteger(value)) {
    return undefined;
  }

  if (value < MIN_QUIZ_DURATION_MINUTES || value > MAX_QUIZ_DURATION_MINUTES) {
    return undefined;
  }

  return value;
}

export function getDefaultQuizDurationMinutes(
  recommendedMinutes?: number | null,
) {
  return (
    sanitizeQuizDurationMinutes(recommendedMinutes) ?? QUIZ_DURATION_PRESETS[0]
  );
}

export function getQuizDurationOptions(recommendedMinutes?: number | null) {
  const recommended = sanitizeQuizDurationMinutes(recommendedMinutes);

  return getUniqueSorted([
    ...QUIZ_DURATION_PRESETS,
    ...(recommended ? [recommended] : []),
  ]);
}

export function buildQuizStartHref(config: QuizConfig) {
  const searchParams = new URLSearchParams({
    cert: config.certificationId,
    mode: config.mode,
    timed: String(config.timed),
  });

  const questionCount = sanitizeQuizQuestionCount(config.questionCount);
  if (questionCount) {
    searchParams.set("count", String(questionCount));
  }

  if (config.timed) {
    const timeLimitMinutes =
      sanitizeQuizDurationMinutes(config.timeLimitMinutes) ??
      getDefaultQuizDurationMinutes();
    searchParams.set("minutes", String(timeLimitMinutes));
  }

  return `/quiz/start?${searchParams.toString()}`;
}
