import fs from "fs/promises";
import path from "path";
import {
  applyCertificationQuestionReviewArtifact,
  parseCertificationQuestionReviewArtifact,
} from "../src/server/services/question-review-artifact-service";

async function main() {
  const args = process.argv.slice(2);
  const fileArg = getFlagValue(args, "--file");
  const removeFile = args.includes("--remove-file");

  if (!fileArg) {
    console.error(
      "Usage: npm run questions:apply-review -- --file tmp/review.json [--remove-file]",
    );
    process.exit(1);
  }

  const filePath = path.resolve(fileArg);
  const rawArtifact = await fs.readFile(filePath, "utf8");
  const artifact = parseCertificationQuestionReviewArtifact(rawArtifact);
  const result = await applyCertificationQuestionReviewArtifact(artifact);

  if (removeFile) {
    await fs.unlink(filePath);
  }

  console.log(`Applied ${result.appliedCount} reviewed question(s).`);
  console.log(`Skipped ${result.skippedCount} question(s).`);
  console.log(
    `Certification: ${result.certificationSlug} (${result.certificationId})`,
  );

  if (removeFile) {
    console.log(`Removed review artifact: ${filePath}`);
  } else {
    console.log(`Retained review artifact: ${filePath}`);
  }
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
