/**
 * CLI: Import an approved question artifact from tmp/ into the database.
 *
 * Usage:
 *   npm run questions:import-approved -- --file tmp/questions.json
 *   npm run questions:import-approved -- --file tmp/questions.json --cert-slug react-fundamentals
 *   npm run questions:import-approved -- --file tmp/questions.json --create-cert
 */

import fs from "fs/promises";
import path from "path";
import {
  importApprovedQuestionArtifact,
  parseApprovedQuestionImportArtifact,
} from "../src/server/services/question-import-service";

async function main() {
  const args = process.argv.slice(2);
  const fileArg = getFlagValue(args, "--file");
  const certificationId = getFlagValue(args, "--cert-id");
  const certificationSlug = getFlagValue(args, "--cert-slug");
  const createdBy = getFlagValue(args, "--created-by");
  const createCertificationIfMissing = args.includes("--create-cert");

  if (!fileArg) {
    console.error(
      "Usage: npm run questions:import-approved -- --file tmp/questions.json [--cert-id <id> | --cert-slug <slug>] [--create-cert] [--created-by <userId>]",
    );
    process.exit(1);
  }

  const filePath = path.resolve(fileArg);
  const rawArtifact = await fs.readFile(filePath, "utf8");
  const artifact = parseApprovedQuestionImportArtifact(rawArtifact);

  const result = await importApprovedQuestionArtifact(artifact, {
    certificationId,
    certificationSlug,
    createCertificationIfMissing,
    createdBy,
  });

  await fs.unlink(filePath);

  console.log(`Imported ${result.importedCount} question(s).`);
  console.log(`Published ${result.publishedCount} question(s).`);
  console.log(`Skipped ${result.skippedCount} question(s).`);
  console.log(
    `Certification: ${result.certificationSlug} (${result.certificationId})`,
  );
  console.log(`Source: ${result.sourceId}`);
  console.log(`Removed temp artifact: ${filePath}`);
}

function getFlagValue(args: string[], flag: string) {
  const index = args.indexOf(flag);
  if (index === -1) {
    return undefined;
  }

  return args[index + 1];
}

main().catch((error) => {
  console.error("Fatal:", error);
  process.exit(1);
});
