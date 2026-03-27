import { completeAttempt } from "@/server/services/quiz-service";
import { db } from "@/db";
import { attempts } from "@/db/schema";
import { eq } from "drizzle-orm";
import { notFound } from "next/navigation";
import { ResultsClient } from "./results-client";

interface Props {
  params: Promise<{ attemptId: string }>;
}

export default async function ResultsPage({ params }: Props) {
  const { attemptId } = await params;

  const [attempt] = await db
    .select()
    .from(attempts)
    .where(eq(attempts.id, attemptId))
    .limit(1);

  if (!attempt) notFound();

  // If not completed yet, complete it
  const result = await completeAttempt(attemptId);

  return <ResultsClient result={result} />;
}
