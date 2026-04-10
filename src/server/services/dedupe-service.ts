import { db } from "@/db";
import { questions, duplicateFlags } from "@/db/schema";
import { eq, and } from "drizzle-orm";
import { v4 as uuid } from "uuid";

/**
 * Normalize question text for comparison: lowercase, strip punctuation,
 * collapse whitespace.
 */
function normalizeText(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^\w\s]/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

/**
 * Simple Levenshtein distance ratio between two strings.
 * Returns a value between 0 (completely different) and 1 (identical).
 */
function similarityRatio(a: string, b: string): number {
  const longer = a.length > b.length ? a : b;
  const shorter = a.length > b.length ? b : a;

  if (longer.length === 0) return 1;

  const distance = levenshteinDistance(longer, shorter);
  return (longer.length - distance) / longer.length;
}

function levenshteinDistance(a: string, b: string): number {
  const matrix: number[][] = [];

  for (let i = 0; i <= b.length; i++) {
    matrix[i] = [i];
  }
  for (let j = 0; j <= a.length; j++) {
    matrix[0][j] = j;
  }

  for (let i = 1; i <= b.length; i++) {
    for (let j = 1; j <= a.length; j++) {
      if (b[i - 1] === a[j - 1]) {
        matrix[i][j] = matrix[i - 1][j - 1];
      } else {
        matrix[i][j] = Math.min(
          matrix[i - 1][j - 1] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j] + 1,
        );
      }
    }
  }

  return matrix[b.length][a.length];
}

/**
 * Scan for duplicates within a certification's question pool.
 * Returns the number of new duplicate flags created.
 */
export async function scanForDuplicates(
  certificationId: string,
): Promise<{ flagged: number }> {
  const allQuestions = await db
    .select({
      id: questions.id,
      text: questions.text,
      status: questions.status,
    })
    .from(questions)
    .where(eq(questions.certificationId, certificationId));

  const normalized = allQuestions.map((q) => ({
    ...q,
    normalizedText: normalizeText(q.text),
  }));

  let flagged = 0;

  for (let i = 0; i < normalized.length; i++) {
    for (let j = i + 1; j < normalized.length; j++) {
      const a = normalized[i];
      const b = normalized[j];

      // Check if already flagged
      const existingFlag = await db
        .select()
        .from(duplicateFlags)
        .where(
          and(
            eq(duplicateFlags.questionId, a.id),
            eq(duplicateFlags.duplicateOfId, b.id),
          ),
        )
        .limit(1);

      if (existingFlag.length > 0) continue;

      // Exact match
      if (a.normalizedText === b.normalizedText) {
        await db.insert(duplicateFlags).values({
          id: uuid(),
          questionId: a.id,
          duplicateOfId: b.id,
          matchType: "exact",
          similarity: 100,
          createdAt: new Date().toISOString(),
        });
        flagged++;
        continue;
      }

      // Near-duplicate check (similarity >= 85%)
      const sim = similarityRatio(a.normalizedText, b.normalizedText);
      if (sim >= 0.85) {
        await db.insert(duplicateFlags).values({
          id: uuid(),
          questionId: a.id,
          duplicateOfId: b.id,
          matchType: "near",
          similarity: Math.round(sim * 100),
          createdAt: new Date().toISOString(),
        });
        flagged++;
      }
    }
  }

  return { flagged };
}

/**
 * Get unresolved duplicate flags for a certification.
 */
export async function getUnresolvedDuplicates(certificationId: string) {
  const allFlags = await db
    .select()
    .from(duplicateFlags)
    .where(eq(duplicateFlags.resolved, false));

  // Filter to only flags for questions in this certification
  const certQuestionIds = new Set(
    (
      await db
        .select({ id: questions.id })
        .from(questions)
        .where(eq(questions.certificationId, certificationId))
    ).map((q) => q.id),
  );

  return allFlags.filter(
    (f) =>
      certQuestionIds.has(f.questionId) || certQuestionIds.has(f.duplicateOfId),
  );
}

/**
 * Resolve a duplicate flag.
 */
export async function resolveDuplicate(
  flagId: string,
  resolution: "kept_both" | "merged" | "rejected",
) {
  await db
    .update(duplicateFlags)
    .set({
      resolved: true,
      resolution,
      resolvedAt: new Date().toISOString(),
    })
    .where(eq(duplicateFlags.id, flagId));
}
