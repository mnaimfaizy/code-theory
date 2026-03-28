import { redirect } from "next/navigation";
import { z } from "zod";
import { auth } from "@/lib/auth";
import {
  sanitizeQuizDurationMinutes,
  sanitizeQuizQuestionCount,
} from "@/lib/quiz-options";
import {
  getQuizQuestions,
  createAttempt,
} from "@/server/services/quiz-service";
import type { QuizConfig } from "@/types";
import { QuizClient } from "./quiz-client";

const quizStartSearchParamsSchema = z.object({
  cert: z.string().min(1),
  mode: z.enum(["fixed", "random"]).optional().default("random"),
  timed: z
    .enum(["true", "false"])
    .optional()
    .default("false")
    .transform((value) => value === "true"),
  count: z.coerce.number().int().positive().optional(),
  minutes: z.coerce.number().int().positive().optional(),
});

interface Props {
  searchParams: Promise<{ cert?: string; mode?: string; timed?: string }>;
}

export default async function QuizStartPage({ searchParams }: Props) {
  const session = await auth();
  if (!session?.user?.id) redirect("/sign-in");

  const parsed = quizStartSearchParamsSchema.safeParse(await searchParams);
  if (!parsed.success) redirect("/");

  const { cert, mode, timed, count, minutes } = parsed.data;

  const config: QuizConfig = {
    certificationId: cert,
    mode,
    timed,
    questionCount: sanitizeQuizQuestionCount(count),
    timeLimitMinutes: sanitizeQuizDurationMinutes(minutes),
  };

  const questions = await getQuizQuestions(config);
  if (questions.length === 0) redirect(`/`);

  const attempt = await createAttempt(
    session.user.id,
    config,
    questions.length,
  );

  return <QuizClient attempt={attempt} questions={questions} />;
}
