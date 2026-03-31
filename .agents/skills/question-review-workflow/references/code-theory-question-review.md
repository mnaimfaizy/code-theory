# Code Theory Question Review Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.claude/skills/question-review-workflow/references/` and `.agents/skills/question-review-workflow/references/`.

Use these notes when applying the `question-review-workflow` skill in this repository.

## Recommended Copilot customization shape

- use a retrieval-focused custom agent to export certification questions into a temp artifact
- use a separate reviewer custom agent to refine questions and explanations in batches
- use a separate apply custom agent to write approved review changes back to the database
- use handoffs between those agents instead of loading the full certification bank into one chat context
- use a mirrored skill for the durable artifact rules and command guidance

This keeps large review workflows more reliable than relying on one agent to both fetch and rewrite hundreds of questions in one pass.

## Current repository support

- export artifact service: `src/server/services/question-review-artifact-service.ts`
- review edits: `src/server/services/review-service.ts`
- export CLI: `scripts/export-certification-review.ts`
- apply CLI: `scripts/apply-question-review.ts`

## Review artifact shape

Use a JSON artifact shaped like this:

```json
{
  "workflow": "certification-question-review",
  "artifactVersion": 1,
  "certification": {
    "id": "7001f806-ee7e-41d6-bd31-7ee6c9b80096",
    "slug": "javascript-junior-developer",
    "title": "JavaScript Junior Developer"
  },
  "exportedAt": "2026-03-31T12:00:00.000Z",
  "updatedAt": "2026-03-31T12:00:00.000Z",
  "filters": {
    "statuses": ["draft", "approved", "rejected"]
  },
  "reviewProgress": {
    "batchSize": 25,
    "reviewedCount": 0,
    "remainingCount": 195,
    "totalExported": 195
  },
  "questions": [
    {
      "questionId": "0ff6ec34-b388-47c3-8bca-e3a146d46f46",
      "orderIndex": 12,
      "batch": 1,
      "current": {
        "status": "approved",
        "difficulty": "easy",
        "text": "What does git pull do?",
        "explanation": "It pulls changes.",
        "options": [
          {
            "optionId": "17cb1ab6-f2ef-4cf6-83e3-e8f514a04db1",
            "text": "Downloads and merges changes from the tracked remote branch.",
            "isCorrect": true,
            "orderIndex": 0
          },
          {
            "optionId": "ab0b0ce4-05e4-4633-9ec4-1f9f40bf0fc0",
            "text": "Deletes the current local branch.",
            "isCorrect": false,
            "orderIndex": 1
          }
        ],
        "source": {
          "sourceId": "1ad4181c-c60f-40f2-8c71-9ceb828feb22",
          "type": "url",
          "ref": "https://git-scm.com/docs/git-pull"
        }
      },
      "proposed": {
        "text": "A developer runs `git pull` on a local branch that tracks `origin/main`. What happens?",
        "explanation": "`git pull` first fetches new commits from the tracked remote branch and then integrates them into the current local branch, usually by merge unless configured otherwise.",
        "options": [
          {
            "optionId": "17cb1ab6-f2ef-4cf6-83e3-e8f514a04db1",
            "text": "It fetches changes from the tracked remote branch and integrates them into the current local branch.",
            "isCorrect": true,
            "orderIndex": 0
          },
          {
            "optionId": "ab0b0ce4-05e4-4633-9ec4-1f9f40bf0fc0",
            "text": "It deletes the current branch and recreates it from the remote branch.",
            "isCorrect": false,
            "orderIndex": 1
          }
        ]
      },
      "changeSummary": [
        "Reframed the stem as a scenario.",
        "Expanded the explanation so it teaches the behavior."
      ]
    }
  ]
}
```

## Critical workflow notes

1. Preserve `questionId` and `optionId` values exactly. The apply step maps reviewed changes back to existing database rows with those ids.

2. If you rewrite `proposed.options`, include the full option array with the same option ids and order. The current apply path updates existing option rows in place; it does not add or remove option records.

3. Never generate replacement option ids inside `proposed.options`. Copy the ids from `current.options` verbatim and keep the same option count and order.

4. Remove unchanged questions from the artifact once reviewed. The temp file is supposed to shrink to only the questions that require database updates.

5. Keep `current` intact. The apply step compares the artifact's `current` snapshot with the live database and refuses to apply stale edits when the source question has changed.

6. The export artifact is a review snapshot, not a forever-current database view. If the database changes while review is in progress, export a fresh artifact and reconcile retained edits before applying.

7. Update `reviewProgress.reviewedCount`, `reviewProgress.remainingCount`, and `updatedAt` as the review advances so the artifact remains a useful checkpoint.

8. Prefer structured JSON rewrites or precise edits for large prune operations, then validate immediately. Manual deletion of large JSON spans is a common way to corrupt the artifact.

9. Validate with the supported command after each batch and before apply:

```bash
npm run questions:validate-review -- --file tmp/<artifact>.json
```

10. If apply reports stale snapshots, run the supported reconcile command to export a fresh snapshot, drop already-live edits, carry forward still-pending `proposed` blocks, and flag materially changed questions for manual re-review:

```bash
npm run questions:reconcile-review -- --file tmp/<artifact>.json
```

11. The `sql/` directory is a full backup, but it is not the normal path for review/apply. Use it for investigation or recovery only.

## Commands

Export:

```bash
npm run questions:export-review -- --cert-slug <slug>
```

Apply:

```bash
npm run questions:apply-review -- --file tmp/<artifact>.json
```

Optional flags:

- `--cert-id <id>`
- `--batch-size <n>`
- `--status draft,approved,rejected`
- `--out temp/<artifact>.json`
- `--remove-file`
