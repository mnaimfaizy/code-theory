import { NextResponse } from "next/server";

export async function POST(request: Request) {
  const body = await request.json();
  const { certificationId, url } = body;

  if (!certificationId || !url) {
    return NextResponse.json({ error: "Missing fields" }, { status: 400 });
  }

  try {
    const { fetchUrlContent, ingestContent } =
      await import("@/server/services/ingestion-service");

    const rawContent = await fetchUrlContent(url);
    const result = await ingestContent({
      certificationId,
      sourceType: "url",
      sourceRef: url,
      rawContent,
    });

    return NextResponse.json({ generated: result.questionsGenerated });
  } catch {
    return NextResponse.json({ error: "Ingestion failed" }, { status: 500 });
  }
}
