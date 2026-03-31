/**
 * CLI: Scan for duplicate questions within a certification.
 *
 * Usage:
 *   npx tsx scripts/dedupe-questions.ts <certification-slug>
 *
 * Example:
 *   npx tsx scripts/dedupe-questions.ts junior-react-developer
 */

import { getCertificationBySlug } from "../src/server/services/certification-service";
import {
  scanForDuplicates,
  getUnresolvedDuplicates,
} from "../src/server/services/dedupe-service";

async function main() {
  const [slug] = process.argv.slice(2);

  if (!slug) {
    console.error(
      "Usage: npx tsx scripts/dedupe-questions.ts <certification-slug>",
    );
    process.exit(1);
  }

  const cert = await getCertificationBySlug(slug);
  if (!cert) {
    console.error(`Certification "${slug}" not found.`);
    process.exit(1);
  }

  console.log(`🔍 Scanning "${cert.title}" for duplicate questions...`);
  const found = await scanForDuplicates(cert.id);
  console.log(`   Found ${found.flagged} new potential duplicate(s).`);

  const unresolved = await getUnresolvedDuplicates(cert.id);
  if (unresolved.length === 0) {
    console.log("✅ No unresolved duplicates.");
  } else {
    console.log(`\n⚠️  ${unresolved.length} unresolved duplicate(s):\n`);
    for (const dup of unresolved) {
      console.log(`  [${dup.id}]`);
      console.log(`    Q1: ${dup.questionId}`);
      console.log(`    Q2: ${dup.duplicateOfId}`);
      console.log(`    Similarity: ${dup.similarity}%  Type: ${dup.matchType}`);
      console.log();
    }
    console.log("   Resolve these in the UI or mark them manually.");
  }
}

main().catch((err) => {
  console.error("Fatal:", err);
  process.exit(1);
});
