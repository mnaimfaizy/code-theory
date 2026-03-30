---
name: question-import-workflow
description: Orchestrate supervisor-reviewed question imports from URLs or local documents into Code Theory using temp JSON artifacts, explicit approvals, and direct publish only after review.
argument-hint: source URL or file path, target certification, desired question types, or approved artifact path
---

Sync note: this skill is mirrored in `.github/skills/question-import-workflow/`, `.claude/skills/question-import-workflow/`, and `.agents/skills/question-import-workflow/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Question Import Workflow

Use this skill when the task is to turn a URL or local document into certification questions through a human-supervised JSON approval flow.

## Workflow

### 1. Load the repo workflow first

Before changing code or creating artifacts, read [question import notes](./references/code-theory-question-import.md) and inspect:

- `docs/INGESTION.md`
- `docs/WORKFLOW.md`
- `src/server/services/certification-service.ts`
- `src/server/services/question-import-service.ts`
- `scripts/import-approved-questions.ts`

### 2. Treat source reading and publication as separate phases

The preferred workflow is:

- read the source URL or file
- ask which question types are needed
- create a temp JSON artifact in `tmp/`
- wait for a human supervisor to approve the artifact
- import the approved artifact into the database
- remove the temp artifact after success

Do not collapse approval and publish into one hidden step.

### 3. Artifact schema (must match exactly)

The artifact is validated by the Zod schema in `src/server/services/question-import-service.ts`. Non-conforming artifacts will be rejected. Key requirements:

#### `source` object (required)

```json
"source": {
  "type": "url",           // REQUIRED — "url" or "file"
  "ref": "https://...",    // REQUIRED — the URL or file path
  "title": "Page title",  // optional
  "coverageNotes": "..."  // optional
}
```

**Do NOT** use keys like `url`, `fetchedAt`, `link`, or `path` — the only accepted keys are `type`, `ref`, `title`, `coverageNotes`.

#### `approval` object (required)

```json
"approval": {
  "approved": false,                     // REQUIRED — false during intake, true when approved
  "supervisor": "Pending human review",  // REQUIRED — non-empty string
  "approvedAt": "",                      // REQUIRED — non-empty string (placeholder ok during intake)
  "publishDirectly": true                // optional, defaults to true
}
```

#### Per-question `approved` field (critical behavior)

The import service resolves each question's approval as: **`question.approved ?? artifact.approval.approved`**.

- If a question has `"approved": false`, it is **skipped** even when the artifact-level `approval.approved` is `true`.
- **During intake**: omit the `approved` field on individual questions entirely. All questions inherit the artifact-level flag.
- **During review**: a reviewer may set `"approved": false` on specific questions to reject them. Unrejected questions should omit the field or set it to `true`.

### 4. Preserve references in the artifact

Each generated question should include:

- the question text
- answer options with one correct answer
- an explanation for the correct answer
- a detailed source reference with locator and excerpt when available

The current database preserves `sourceId` and explanations, but not detailed per-question citation fields. Keep detailed references in the temp artifact unless the schema is explicitly extended.

### 5. Require approval before publish

Questions should not be imported until the JSON artifact shows explicit supervisor approval.

- use `approval.approved` for whole-artifact approval
- use `question.approved` only when a reviewer explicitly rejects specific questions
- if the approved artifact requests direct publish, store imported questions as `approved`

### 6. Resolve certification explicitly

If the target certification is missing, ask whether to:

- use an existing certification id or slug
- create a new certification first

If creating a new certification, do that first and then import the approved questions.

### 7. Use the supported import path

Prefer the dedicated import script over ad hoc database manipulation:

```bash
npm run questions:import-approved -- --file tmp/<artifact>.json
```

Add `--cert-id`, `--cert-slug`, or `--create-cert` when the artifact does not already identify the target certification cleanly.

The script automatically deletes the temp artifact file on successful import.
