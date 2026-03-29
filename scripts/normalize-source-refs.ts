import { eq } from "drizzle-orm";
import { db } from "../src/db";
import { questionSources } from "../src/db/schema";
import { normalizeStoredSourceRef } from "../src/lib/source-ref";

async function main() {
  const sources = await db
    .select({
      id: questionSources.id,
      sourceType: questionSources.sourceType,
      sourceRef: questionSources.sourceRef,
    })
    .from(questionSources);

  let updatedCount = 0;

  for (const source of sources) {
    const normalizedRef = normalizeStoredSourceRef(
      source.sourceType,
      source.sourceRef,
    );

    if (normalizedRef === source.sourceRef) {
      continue;
    }

    await db
      .update(questionSources)
      .set({ sourceRef: normalizedRef })
      .where(eq(questionSources.id, source.id));

    updatedCount++;
    console.log(`Normalized source ${source.id}`);
  }

  console.log(`Normalized ${updatedCount} source ref(s).`);
}

main().catch((error) => {
  console.error("Failed to normalize source refs:", error);
  process.exit(1);
});
