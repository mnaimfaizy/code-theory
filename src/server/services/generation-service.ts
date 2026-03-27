import type { GeneratedMCQ, LLMProviderConfig } from "@/types";

/**
 * Get the LLM provider configuration from environment variables.
 */
export function getLLMConfig(): LLMProviderConfig {
  return {
    baseUrl: process.env.LLM_BASE_URL ?? "http://localhost:11434/v1",
    model: process.env.LLM_MODEL ?? "llama3",
    apiKey: process.env.LLM_API_KEY ?? "ollama",
  };
}

/**
 * Generate MCQs from a text chunk using a local LLM via OpenAI-compatible API.
 */
export async function generateMCQsFromChunk(
  chunk: string,
  count: number = 3,
  config?: LLMProviderConfig,
): Promise<GeneratedMCQ[]> {
  const llm = config ?? getLLMConfig();

  const systemPrompt = `You are an expert instructor creating multiple-choice exam questions.
Given a passage of documentation or learning material, generate exactly ${count} multiple-choice questions.

RULES:
- Each question must test understanding, not just recall.
- Provide exactly 4 options for each question.
- Only ONE option should be correct.
- Include a clear explanation for the correct answer.
- Assign difficulty: easy, medium, or hard.
- Assign a confidence score 0-100 for question quality.

Respond ONLY with valid JSON matching this structure:
{
  "questions": [
    {
      "question": "...",
      "options": ["A) ...", "B) ...", "C) ...", "D) ..."],
      "correctIndex": 0,
      "explanation": "...",
      "difficulty": "medium",
      "confidence": 85
    }
  ]
}`;

  const response = await fetch(`${llm.baseUrl}/chat/completions`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${llm.apiKey}`,
    },
    body: JSON.stringify({
      model: llm.model,
      messages: [
        { role: "system", content: systemPrompt },
        {
          role: "user",
          content: `Generate ${count} multiple-choice questions from the following content:\n\n${chunk}`,
        },
      ],
      temperature: 0.7,
      response_format: { type: "json_object" },
    }),
  });

  if (!response.ok) {
    const error = await response.text();
    throw new Error(`LLM request failed: ${response.status} — ${error}`);
  }

  const data = await response.json();
  const content = data.choices?.[0]?.message?.content;

  if (!content) {
    throw new Error("No content in LLM response");
  }

  const parsed = JSON.parse(content);
  const rawQuestions = parsed.questions ?? parsed;

  if (!Array.isArray(rawQuestions)) {
    throw new Error("LLM response did not contain a questions array");
  }

  return rawQuestions.map((q: Record<string, unknown>) => ({
    question: String(q.question ?? ""),
    options: Array.isArray(q.options)
      ? q.options.map(String)
      : ["", "", "", ""],
    correctIndex: Number(q.correctIndex ?? 0),
    explanation: String(q.explanation ?? ""),
    difficulty: validateDifficulty(q.difficulty),
    confidence: Number(q.confidence ?? 50),
  }));
}

function validateDifficulty(val: unknown): "easy" | "medium" | "hard" {
  if (val === "easy" || val === "medium" || val === "hard") return val;
  return "medium";
}

/**
 * Simple content chunker: splits text into chunks of roughly `maxTokens` word count
 * with overlap.
 */
export function chunkContent(
  text: string,
  maxTokens: number = 1500,
  overlapTokens: number = 200,
): string[] {
  const words = text.split(/\s+/);
  const chunks: string[] = [];
  let start = 0;

  while (start < words.length) {
    const end = Math.min(start + maxTokens, words.length);
    chunks.push(words.slice(start, end).join(" "));
    start += maxTokens - overlapTokens;
  }

  return chunks;
}
