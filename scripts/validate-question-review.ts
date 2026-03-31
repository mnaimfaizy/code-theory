import fs from "fs/promises";
import path from "path";
import {
  inspectCertificationQuestionReviewArtifact,
  parseCertificationQuestionReviewArtifact,
} from "../src/server/services/question-review-artifact-service";

async function main() {
  const args = process.argv.slice(2);
  const fileArg = getFlagValue(args, "--file");
  const jsonOutput = args.includes("--json");

  if (!fileArg) {
    console.error(
      "Usage: npm run questions:validate-review -- --file tmp/review.json [--json]",
    );
    process.exit(1);
  }

  const filePath = path.resolve(fileArg);
  const rawArtifact = await fs.readFile(filePath, "utf8");
  const artifact = parseCertificationQuestionReviewArtifact(rawArtifact);
  const inspection = await inspectCertificationQuestionReviewArtifact(artifact);

  if (jsonOutput) {
    console.log(
      JSON.stringify(
        {
          artifactPath: filePath,
          ...inspection,
        },
        null,
        2,
      ),
    );
  } else {
    console.log(`Artifact: ${filePath}`);
    console.log(
      `Certification: ${inspection.certificationSlug} (${inspection.certificationId})`,
    );
    console.log(`Questions in artifact: ${inspection.totalQuestionCount}`);
    console.log(
      `Questions with proposed changes: ${inspection.proposedQuestionCount}`,
    );
    console.log(
      `Questions that would apply updates: ${inspection.actionableQuestionCount}`,
    );
    console.log(
      `Questions that would be skipped: ${inspection.skippedQuestionCount}`,
    );

    if (inspection.noOpQuestionIds.length > 0) {
      console.log(
        `No-op proposed question(s): ${inspection.noOpQuestionIds.join(", ")}`,
      );
    }

    if (inspection.incompatibleOptionQuestionIds.length > 0) {
      console.log(
        `Incompatible proposed option ids/order: ${inspection.incompatibleOptionQuestionIds.join(", ")}`,
      );
    }

    if (inspection.outOfDateQuestionIds.length > 0) {
      console.log(
        `Out-of-date question(s): ${inspection.outOfDateQuestionIds.join(", ")}`,
      );
    }

    if (inspection.missingQuestionIds.length > 0) {
      console.log(
        `Missing question(s) in the live certification: ${inspection.missingQuestionIds.join(", ")}`,
      );
    }

    console.log(`Ready to apply: ${inspection.readyToApply ? "yes" : "no"}`);
  }

  process.exit(inspection.readyToApply ? 0 : 1);
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
