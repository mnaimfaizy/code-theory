/**
 * CLI: Import content from a URL and generate draft MCQ questions.
 *
 * Usage:
 *   npx tsx scripts/import-source.ts <certification-slug> <url>
 *
 * Example:
 *   npx tsx scripts/import-source.ts junior-react-developer https://react.dev/learn
 */

import { getCertificationBySlug } from "../src/server/services/certification-service";
import { ingestContent } from "../src/server/services/ingestion-service";

async function main() {
  const [slug, url] = process.argv.slice(2);

  if (!slug || !url) {
    console.error(
      "Usage: npx tsx scripts/import-source.ts <certification-slug> <url>",
    );
    process.exit(1);
  }

  const cert = await getCertificationBySlug(slug);
  if (!cert) {
    console.error(`Certification "${slug}" not found.`);
    process.exit(1);
  }

  console.log(`📥 Importing from: ${url}`);
  console.log(`📝 Target certification: ${cert.title}`);
  console.log();

  const result = await ingestContent(cert.id, url);
  console.log(`✅ Generated ${result.generated} draft question(s).`);
  console.log("   Run the review queue in the UI or approve via CLI.");
}

main().catch((err) => {
  console.error("Fatal:", err);
  process.exit(1);
});
