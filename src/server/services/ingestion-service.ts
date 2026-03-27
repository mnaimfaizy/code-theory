import { registerSource } from "./certification-service";
import { generateMCQsFromChunk, chunkContent } from "./generation-service";
import { addQuestion } from "./certification-service";

/**
 * Ingest content from raw text, chunk it, generate MCQs, and store as drafts.
 */
export async function ingestContent(data: {
  certificationId: string;
  sourceType: "url" | "file";
  sourceRef: string;
  rawContent: string;
}): Promise<{ sourceId: string; questionsGenerated: number }> {
  // 1. Register the source
  const chunks = chunkContent(data.rawContent);
  const source = await registerSource({
    certificationId: data.certificationId,
    sourceType: data.sourceType,
    sourceRef: data.sourceRef,
    rawContent: data.rawContent,
    chunkCount: chunks.length,
  });

  // 2. Generate questions from each chunk
  let totalGenerated = 0;

  for (const chunk of chunks) {
    try {
      const mcqs = await generateMCQsFromChunk(chunk, 3);

      for (const mcq of mcqs) {
        // Only store questions with reasonable confidence
        if (mcq.confidence < 30) continue;

        await addQuestion({
          certificationId: data.certificationId,
          text: mcq.question,
          explanation: mcq.explanation,
          difficulty: mcq.difficulty,
          status: "draft",
          sourceId: source.id,
          options: mcq.options.map((opt, idx) => ({
            text: opt,
            isCorrect: idx === mcq.correctIndex,
          })),
        });
        totalGenerated++;
      }
    } catch (error) {
      // Log but continue with other chunks
      console.error(`Failed to generate MCQs from chunk: ${error}`);
    }
  }

  return { sourceId: source.id, questionsGenerated: totalGenerated };
}

/**
 * Fetch content from a URL and return the extracted text.
 */
export async function fetchUrlContent(url: string): Promise<string> {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch URL: ${response.status}`);
  }

  const html = await response.text();

  // Basic HTML to text extraction — strips tags and normalizes whitespace.
  // A more robust implementation could use a library like cheerio.
  const text = html
    .replace(/<script[^>]*>[\s\S]*?<\/script>/gi, "")
    .replace(/<style[^>]*>[\s\S]*?<\/style>/gi, "")
    .replace(/<nav[^>]*>[\s\S]*?<\/nav>/gi, "")
    .replace(/<header[^>]*>[\s\S]*?<\/header>/gi, "")
    .replace(/<footer[^>]*>[\s\S]*?<\/footer>/gi, "")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"')
    .replace(/\s+/g, " ")
    .trim();

  return text;
}
