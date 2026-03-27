import { redirect } from "next/navigation";
import { auth } from "@/lib/auth";
import {
  getQuizQuestions,
  createAttempt,
} from "@/server/services/quiz-service";
import type { QuizConfig } from "@/types";
import { QuizClient } from "./quiz-client";

interface Props {
  searchParams: Promise<{ cert?: string; mode?: string; timed?: string }>;
}

export default async function QuizStartPage({ searchParams }: Props) {
  const session = await auth();
  if (!session?.user?.id) redirect("/sign-in");

  const params = await searchParams;
  const certId = params.cert;
  const mode = (params.mode === "fixed" ? "fixed" : "random") as
    | "fixed"
    | "random";
  const timed = params.timed === "true";

  if (!certId) redirect("/");

  const config: QuizConfig = {
    certificationId: certId,
    mode,
    timed,
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
