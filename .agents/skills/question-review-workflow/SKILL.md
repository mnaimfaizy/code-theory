---
name: question-review-workflow
description: Orchestrate export, batch review, pruning, and re-apply of existing certification questions through temp JSON artifacts that preserve question ids and option ids.
argument-hint: certification slug or id, review artifact path, batch size, status filters, or request to apply reviewed changes
---

Sync note: this skill is mirrored in `.github/skills/question-review-workflow/`, `.claude/skills/question-review-workflow/`, and `.agents/skills/question-review-workflow/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Question Review Workflow

Use this skill when the task is to retrieve, inspect, improve, or apply changes to existing certification questions already stored in Code Theory.

## Workflow

### 1. Load the repo workflow first

Before exporting or reviewing questions, read [question review notes](./references/code-theory-question-review.md) and inspect:

- `docs/WORKFLOW.md`
- `docs/DEVELOPMENT.md`
- `src/server/services/review-service.ts`
- `src/server/services/question-review-artifact-service.ts`
- `scripts/export-certification-review.ts`
- `scripts/apply-question-review.ts`

### 2. Keep retrieval and review as separate phases

The preferred workflow is:

- export the certification questions into `tmp/` or `temp/`
- review the artifact in batches
- remove unchanged questions from the artifact
- keep only `proposed` rewrites for questions that truly need updates
- apply the reviewed artifact back to the database only when the user asks

Do not collapse retrieval, review, and apply into one opaque step when the temp artifact workflow is available.

### 3. Use the export artifact as the review working snapshot

The review artifact is validated by the Zod schema in `src/server/services/question-review-artifact-service.ts`. Key rules:

- top level fields must retain `workflow`, `artifactVersion`, `certification`, `exportedAt`, `updatedAt`, `filters`, `reviewProgress`, and `questions`
- each review item must retain `questionId`, `orderIndex`, `batch`, and `current`
- `current` is the concurrency guard used to detect drift before apply; do not remove or rewrite it casually
- the export is a point-in-time snapshot for review, not a forever-current copy of the database
- put edits under `proposed` only when a database update is actually needed
- when rewriting options, preserve the original `optionId` values, option count, and exact order; the apply path updates existing option rows in place rather than creating or deleting them
- never generate replacement option ids for `proposed.options`; copy the ids from `current.options` verbatim
- keep exactly one correct option

### 4. Review in batches and prune aggressively

For large certifications, work one batch at a time.

- respect the exported batch size unless the user asks for a different one at export time
- improve stems, explanations, and distractors only where the current version is weak
- remove questions from the artifact after reviewing them when they do not need changes
- update `reviewProgress.reviewedCount`, `reviewProgress.remainingCount`, and `updatedAt` as the artifact evolves
- prefer structured JSON rewrites or precise small edits when pruning many items, then validate immediately; large manual JSON surgery is easy to corrupt

The final artifact should be much smaller than the initial export because it should contain only actionable updates.

### 5. Validate after each batch

Use the supported validation command after each batch and before apply handoff.

```bash
npm run questions:validate-review -- --file tmp/<artifact>.json
```

### 6. Match difficulty honestly

Review questions like an experienced university instructor and assessment author:

- `easy`: direct recall, recognition, or a basic concept check
- `medium`: applied reasoning or distinction between similar concepts
- `hard`: deeper judgment, subtle tradeoffs, or multi-step reasoning without becoming unfair

Keep questions engaging, but do not turn simple questions into trick questions.

### 7. Reconcile stale artifacts before apply

The apply command correctly refuses stale artifacts. When that happens, do not force the old file through.

- run `npm run questions:reconcile-review -- --file tmp/<artifact>.json`
- inspect the reconciled artifact output and remaining review count
- if the reconciled artifact still has unresolved manual-review entries, finish that review before applying
- retry the apply command with the reconciled artifact once the remaining review count reaches `0`

Use `sql/` backups only for diagnosis or disaster recovery, not as a shortcut around artifact concurrency checks.

### 8. Use the supported commands

Export:

```bash
npm run questions:export-review -- --cert-slug <slug>
```

Apply:

```bash
npm run questions:apply-review -- --file tmp/<artifact>.json
```

Useful flags:

- `--cert-id <id>`
- `--batch-size <n>`
- `--status draft,approved,rejected`
- `--out temp/<artifact>.json`
- `--remove-file`

Additional workflow commands:

```bash
npm run questions:validate-review -- --file tmp/<artifact>.json
npm run questions:reconcile-review -- --file tmp/<artifact>.json
```

The apply step refuses stale artifacts when the live database no longer matches the stored `current` snapshot.

### 9. Prefer dedicated agents when available

The most reliable customization shape in this repository is:

- `Question Review Retriever` for retrieval and artifact export
- `Question Reviewer` for pedagogical review and pruning
- `Question Review Applier` for validation, apply, and optional temp cleanup
- this mirrored skill for the durable workflow rules and artifact contract
