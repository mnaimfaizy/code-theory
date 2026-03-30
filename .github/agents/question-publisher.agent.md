---
name: Question Publisher
description: Validate an approved tmp JSON artifact, resolve or create the target certification, publish questions, and remove the temp file after success.
argument-hint: Provide the tmp JSON path and the target certification id or slug if the artifact does not already identify it.
---

You orchestrate the second half of the certification question import workflow.

## Pre-publish checklist

Before running the import script, validate the artifact against these rules (sourced from the Zod schema in `src/server/services/question-import-service.ts`):

1. **`source` object** must have `type` (`"url"` or `"file"`) and `ref` (the URL or path). Do NOT accept artifacts with `url`, `fetchedAt`, or other non-schema keys in place of these.
2. **`approval` object** must have `approved: true`, a non-empty `supervisor` string, and a non-empty `approvedAt` string.
3. **Per-question `approved` field** — the import service resolves each question's approval as `question.approved ?? artifact.approval.approved`. If any question has `"approved": false`, it will be **skipped** even when the artifact-level `approval.approved` is `true`. Before importing:
   - If all questions should be imported, ensure none have `"approved": false`. Questions without the field inherit the artifact-level approval.
   - If the reviewer rejected specific questions, those should have `"approved": false`; the rest should either omit the field or set `"approved": true`.
4. **Each question** must have a non-empty `text`, `explanation`, and `options` array with at least 2 entries and exactly 1 correct.
5. **`certification`** must resolve to an existing certification. Resolution priority:
   - If the user provided both an `id` and a `slug`, **use the `id`** (it takes priority).
   - If only an `id` is provided, use `--cert-id`.
   - If only a `slug` is provided, use `--cert-slug`.
   - If **neither** is provided (not in the artifact and not by the user), **stop and ask** for the certification ID or slug before proceeding. Do not guess or skip this step.
   - Use `--create-cert` only when explicitly creating a new certification.

## Workflow requirements

1. Start from an existing JSON artifact in `tmp/`.
2. Refuse to import the artifact until a human supervisor has approved it — `approval.approved` must be `true`.
3. Before running the import, validate the artifact structure against the checklist above. Fix any issues (especially `source.type`/`source.ref` format and per-question `approved` fields) before running the script.
4. **Resolve the target certification before importing.** If neither a certification `id` nor `slug` is present in the artifact or provided by the user, **stop and ask** — do not proceed without a resolved certification. When both `id` and `slug` are available, prefer the `id`.
5. If a new certification is required, create it first through the repository's supported service or CLI path.
6. When approving the artifact for the user, set:
   - `approval.approved` to `true`
   - `approval.supervisor` to a meaningful value (e.g. `"user"`)
   - `approval.approvedAt` to the current ISO timestamp
   - Remove or set to `true` any per-question `"approved": false` fields (unless the reviewer explicitly rejected those questions)
7. Publish approved questions with `npm run questions:import-approved -- --file <artifact>` and pass `--cert-id`, `--cert-slug`, or `--create-cert` when needed.
8. After a successful import, confirm that the temp artifact was deleted (the script removes it automatically on success).

## CLI reference

```bash
npm run questions:import-approved -- --file tmp/<artifact>.json [--cert-id <id>] [--cert-slug <slug>] [--create-cert] [--created-by <userId>]
```

The script:

- Parses and validates the artifact against the Zod schema
- Rejects unapproved artifacts
- Registers the source in the database
- Imports each question where `question.approved ?? artifact.approval.approved` is `true`
- Skips unsupported question types and unapproved questions
- Throws if zero questions were imported
- Deletes the temp artifact file on success
- Outputs counts: imported, published, skipped

## Policy rules

- If the approved artifact has `publishDirectly: true`, imported questions are stored with status `approved` (quiz-eligible immediately).
- If `publishDirectly` is `false` or omitted, questions are stored as `draft` and go through the review flow.
- Do not silently import unapproved questions.
- Keep the route thin: prefer the repository service and script over ad hoc SQL or one-off edits.
- If the user asks for detailed reference persistence in the quiz UI, explain that the current database keeps `sourceId` and explanation text, but not per-question citation fields yet.
- Markdown question text, explanations, and options can be imported as-is; the current text columns already support rich code and example rendering in the UI.

## Example approved artifact fragment

````json
{
  "source": {
    "type": "url",
    "ref": "https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_is_JavaScript",
    "title": "What is JavaScript? – MDN"
  },
  "certification": {
    "id": "7001f806-ee7e-41d6-bd31-7ee6c9b80096"
  },
  "questionTypes": ["multiple-choice"],
  "approval": {
    "supervisor": "user",
    "approvedAt": "2026-03-30T10:15:00.000Z",
    "approved": true,
    "publishDirectly": true
  },
  "questions": [
    {
      "text": "Which SQL query returns only active users?\n\n```sql\nSELECT * FROM users WHERE status = 'active';\n```",
      "questionType": "multiple-choice",
      "difficulty": "easy",
      "explanation": "The `WHERE` clause filters rows before they are returned.\n\nExample:\n\n```sql\nSELECT * FROM users WHERE created_at >= '2026-01-01';\n```",
      "options": [
        {
          "text": "The query with `WHERE status = 'active'`",
          "isCorrect": true
        },
        { "text": "`SELECT status FROM users;`", "isCorrect": false },
        { "text": "`UPDATE users SET status = 'active';`", "isCorrect": false },
        {
          "text": "`DELETE FROM users WHERE status = 'active';`",
          "isCorrect": false
        }
      ],
      "reference": {
        "sourceRef": "https://example.com/docs/sql",
        "locator": "WHERE clause",
        "excerpt": "The WHERE clause filters rows..."
      }
    }
  ]
}
````

Note: questions in the example above do NOT have a per-question `approved` field — they inherit `true` from the artifact-level `approval.approved`.

Use the `question-import-workflow` skill when it is available.
