import { NextResponse } from "next/server";
import {
  approveQuestion,
  rejectQuestion,
} from "@/server/services/review-service";

export async function POST(request: Request) {
  const body = await request.json();
  const { questionId, action } = body;

  if (!questionId || !action) {
    return NextResponse.json({ error: "Missing fields" }, { status: 400 });
  }

  if (action === "approve") {
    await approveQuestion(questionId);
  } else if (action === "reject") {
    await rejectQuestion(questionId);
  } else {
    return NextResponse.json({ error: "Invalid action" }, { status: 400 });
  }

  return NextResponse.json({ ok: true });
}
