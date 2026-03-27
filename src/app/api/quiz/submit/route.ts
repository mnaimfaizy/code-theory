import { NextResponse } from "next/server";
import { completeAttempt } from "@/server/services/quiz-service";

export async function POST(request: Request) {
  const body = await request.json();
  const { attemptId } = body;

  if (!attemptId) {
    return NextResponse.json({ error: "Missing attemptId" }, { status: 400 });
  }

  const result = await completeAttempt(attemptId);

  return NextResponse.json(result);
}
