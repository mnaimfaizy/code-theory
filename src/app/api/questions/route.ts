import { NextResponse } from "next/server";
import { addQuestion } from "@/server/services/certification-service";

export async function POST(request: Request) {
  const body = await request.json();
  const { certificationId, text, explanation, difficulty, options } = body;

  if (!certificationId || !text || !options || options.length < 2) {
    return NextResponse.json({ error: "Missing fields" }, { status: 400 });
  }

  const question = await addQuestion({
    certificationId,
    text,
    explanation: explanation ?? null,
    difficulty: difficulty ?? "medium",
    status: "approved",
    options: options.map((o: { text: string; isCorrect: boolean }) => ({
      text: o.text,
      isCorrect: o.isCorrect,
    })),
  });

  return NextResponse.json({ id: question.id });
}
