import { NextResponse } from "next/server";
import { createCertification } from "@/server/services/certification-service";

export async function POST(request: Request) {
  const body = await request.json();

  const {
    title,
    slug,
    description,
    timeLimitMinutes,
    passingScore,
    createdBy,
  } = body;

  if (!title || !slug || !createdBy) {
    return NextResponse.json(
      { error: "Missing required fields" },
      { status: 400 },
    );
  }

  const result = await createCertification({
    title,
    slug,
    description,
    timeLimitMinutes,
    passingScore,
    createdBy,
  });

  return NextResponse.json(result, { status: 201 });
}
