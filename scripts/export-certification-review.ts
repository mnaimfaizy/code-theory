import fs from "fs/promises";
import path from "path";
import {
  allQuestionReviewStatuses,
  exportCertificationQuestionReviewArtifact,
  type QuestionReviewStatus,
} from "../src/server/services/question-review-artifact-service";

async function main() {
  const args = process.argv.slice(2);
  const certificationId = getFlagValue(args, "--cert-id");
  const certificationSlug = getFlagValue(args, "--cert-slug");
  const batchSizeArg = getFlagValue(args, "--batch-size");
  const statusArg = getFlagValue(args, "--status");
  const outArg = getFlagValue(args, "--out");

  if (!certificationId && !certificationSlug) {
    console.error(
      "Usage: npm run questions:export-review -- --cert-id <id> | --cert-slug <slug> [--batch-size <number>] [--status draft,approved,rejected] [--out tmp/file.json]",
    );
    process.exit(1);
  }

  const batchSize = batchSizeArg ? Number(batchSizeArg) : 25;
  if (!Number.isInteger(batchSize) || batchSize <= 0) {
    console.error("--batch-size must be a positive integer.");
    process.exit(1);
  }

  const statuses = statusArg ? parseStatuses(statusArg) : undefined;
  const artifact = await exportCertificationQuestionReviewArtifact({
    certificationId,
    certificationSlug,
    batchSize,
    statuses,
  });

  const outputPath = path.resolve(
    outArg ??
      path.join(
        "tmp",
        `${artifact.certification.slug}-question-review-${toTimestamp(new Date())}.json`,
      ),
  );

  await fs.mkdir(path.dirname(outputPath), { recursive: true });
  await fs.writeFile(
    outputPath,
    JSON.stringify(artifact, null, 2) + "\n",
    "utf8",
  );

  console.log(`Certification: ${artifact.certification.title}`);
  console.log(`Slug: ${artifact.certification.slug}`);
  console.log(`Questions exported: ${artifact.reviewProgress.totalExported}`);
  console.log(`Batch size: ${artifact.reviewProgress.batchSize}`);
  console.log(`Statuses: ${artifact.filters.statuses.join(", ")}`);
  console.log(`Review artifact: ${outputPath}`);
}

function getFlagValue(args: string[], flag: string) {
  const index = args.indexOf(flag);
  if (index === -1) {
    return undefined;
  }

  return args[index + 1];
}

function parseStatuses(value: string): QuestionReviewStatus[] {
  const statuses = value
    .split(",")
    .map((status) => status.trim())
    .filter(Boolean);

  if (statuses.length === 0) {
    console.error("--status must include at least one comma-separated status.");
    process.exit(1);
  }

  for (const status of statuses) {
    if (!allQuestionReviewStatuses.includes(status as QuestionReviewStatus)) {
      console.error(
        `Unsupported review status \"${status}\". Expected one of: ${allQuestionReviewStatuses.join(", ")}.`,
      );
      process.exit(1);
    }
  }

  return statuses as QuestionReviewStatus[];
}

function toTimestamp(date: Date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");

  return `${year}${month}${day}-${hours}${minutes}${seconds}`;
}

main().catch((error) => {
  console.error("Fatal:", error);
  process.exit(1);
});
