import fs from "fs/promises";
import path from "path";
import {
  parseCertificationQuestionReviewArtifact,
  reconcileCertificationQuestionReviewArtifact,
} from "../src/server/services/question-review-artifact-service";

async function main() {
  const args = process.argv.slice(2);
  const fileArg = getFlagValue(args, "--file");
  const outArg = getFlagValue(args, "--out");

  if (!fileArg) {
    console.error(
      "Usage: npm run questions:reconcile-review -- --file tmp/review.json [--out tmp/review-reconciled.json]",
    );
    process.exit(1);
  }

  const filePath = path.resolve(fileArg);
  const outputPath = path.resolve(outArg ?? buildDefaultOutputPath(filePath));
  const rawArtifact = await fs.readFile(filePath, "utf8");
  const artifact = parseCertificationQuestionReviewArtifact(rawArtifact);
  const result = await reconcileCertificationQuestionReviewArtifact(artifact);

  await fs.mkdir(path.dirname(outputPath), { recursive: true });
  await fs.writeFile(
    outputPath,
    JSON.stringify(result.reconciledArtifact, null, 2) + "\n",
    "utf8",
  );

  console.log(
    `Certification: ${result.certificationSlug} (${result.certificationId})`,
  );
  console.log(
    `Carried forward question(s): ${result.carriedForwardQuestionIds.length}`,
  );
  console.log(
    `Already live question(s): ${result.alreadyLiveQuestionIds.length}`,
  );
  console.log(`Needs manual review: ${result.manualReviewQuestionIds.length}`);

  if (result.repairedOptionIdQuestionIds.length > 0) {
    console.log(
      `Repaired regenerated option ids: ${result.repairedOptionIdQuestionIds.join(", ")}`,
    );
  }

  if (result.manualReviewQuestionIds.length > 0) {
    console.log(
      `Manual review question ids: ${result.manualReviewQuestionIds.join(", ")}`,
    );
  }

  if (result.missingQuestionIds.length > 0) {
    console.log(
      `Missing question ids from fresh export: ${result.missingQuestionIds.join(", ")}`,
    );
  }

  console.log(
    `Remaining review count: ${result.reconciledArtifact.reviewProgress.remainingCount}`,
  );
  console.log(`Reconciled review artifact: ${outputPath}`);
}

function getFlagValue(args: string[], flag: string) {
  const index = args.indexOf(flag);
  if (index === -1) {
    return undefined;
  }

  return args[index + 1];
}

function buildDefaultOutputPath(filePath: string) {
  const extension = path.extname(filePath) || ".json";
  const basename = path.basename(filePath, extension);
  return path.join(
    path.dirname(filePath),
    `${basename}-reconciled${extension}`,
  );
}

main().catch((error) => {
  console.error("Fatal:", error);
  process.exit(1);
});
