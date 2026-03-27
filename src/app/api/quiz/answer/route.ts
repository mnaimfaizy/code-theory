import { NextResponse } from "next/server";
import { saveAnswer } from "@/server/services/quiz-service";

export async function POST(request: Request) {
  const body = await request.json();
  const { attemptId, questionId, selectedOptionId } = body;

  if (!attemptId || !questionId) {
    return NextResponse.json(
      { error: "Missing required fields" },
      { status: 400 },
    );
  }

  await saveAnswer(attemptId, questionId, selectedOptionId ?? null);

  return NextResponse.json({ ok: true });
}
