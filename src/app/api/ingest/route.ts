import { NextResponse } from "next/server";
import { ingestContent } from "@/server/services/ingestion-service";

export async function POST(request: Request) {
  const body = await request.json();
  const { certificationId, url } = body;

  if (!certificationId || !url) {
    return NextResponse.json({ error: "Missing fields" }, { status: 400 });
  }

  try {
    const result = await ingestContent(certificationId, url);
    return NextResponse.json({ generated: result.generated });
  } catch {
    return NextResponse.json({ error: "Ingestion failed" }, { status: 500 });
  }
}
