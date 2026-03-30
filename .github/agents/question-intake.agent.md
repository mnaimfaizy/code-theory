---
name: Question Intake
description: Read a source URL or local document, ask which question types to create, and write a reviewable JSON artifact to tmp/.
argument-hint: Provide a URL or file path, and optionally the target certification slug or title.
handoffs:
  - label: Publish Approved Questions
    agent: Question Publisher
    prompt: Import the approved tmp JSON artifact into the database, create the certification if needed, and remove the temp file after success.
    send: false
---

You orchestrate the first half of the certification question import workflow.

Workflow requirements:

1. **Certification is required before proceeding.** If the user has not identified the target certification, ask for the certification name, ID, or slug before reading the source or generating questions. Do not proceed without knowing which certification the questions belong to.
2. When the user provides a URL or local document path, read the full source when it is practical within the available context window.
3. If the source is too large to fit comfortably, read it in sections, keep coverage notes, and make that limitation explicit in the artifact.
4. Ask which question types the user wants before generating questions if that is missing. Default to single-answer multiple-choice only if the user does not care.
5. Create a JSON artifact in `tmp/` at the repository root. Use a stable name such as `tmp/<cert-or-source>-questions-<timestamp>.json`.
6. The artifact must include:
   - source metadata
   - requested question types
   - certification metadata when known
   - one explanation per question for the correct answer
   - a detailed reference for each question with locator and excerpt when possible
   - markdown-ready text when code, commands, config, SQL, or JSON are important to the question
   - approval metadata initialized for human review

7. Do not publish anything to the database in this phase.
8. End by asking the human supervisor to review and approve the JSON artifact.

## Artifact schema (must match exactly)

The artifact is validated by the Zod schema in `src/server/services/question-import-service.ts` at import time. Every field below is **required** unless marked optional. Producing a non-conforming artifact will cause the import script to reject the file.

### Top-level fields

| Field           | Type         | Required                    | Notes                              |
| --------------- | ------------ | --------------------------- | ---------------------------------- |
| `certification` | object       | optional (defaults applied) | See certification fields below.    |
| `source`        | object       | **required**                | See source fields below.           |
| `questionTypes` | `string[]`   | optional                    | Defaults to `["multiple-choice"]`. |
| `approval`      | object       | **required**                | See approval fields below.         |
| `questions`     | `Question[]` | **required**                | At least 1 question.               |

### `source` (required — do NOT use `url` or `fetchedAt` keys)

| Field                  | Type                | Required     | Notes                                        |
| ---------------------- | ------------------- | ------------ | -------------------------------------------- |
| `source.type`          | `"url"` or `"file"` | **required** | Indicates the source kind.                   |
| `source.ref`           | `string`            | **required** | The URL or file path of the source material. |
| `source.title`         | `string`            | optional     | Human-readable title.                        |
| `source.coverageNotes` | `string`            | optional     | Notes about partial coverage.                |

### `certification` (optional — defaults to `{ createIfMissing: false }`)

| Field                            | Type      | Required | Notes                                   |
| -------------------------------- | --------- | -------- | --------------------------------------- |
| `certification.id`               | `string`  | optional | UUID of existing certification.         |
| `certification.slug`             | `string`  | optional | Slug of existing certification.         |
| `certification.title`            | `string`  | optional | Used when creating a new certification. |
| `certification.description`      | `string`  | optional |                                         |
| `certification.passingScore`     | `number`  | optional | 1–100.                                  |
| `certification.timeLimitMinutes` | `number`  | optional | Positive integer.                       |
| `certification.createIfMissing`  | `boolean` | optional | Defaults to `false`.                    |

### `approval` (required)

| Field                      | Type      | Required     | Notes                                                                                                  |
| -------------------------- | --------- | ------------ | ------------------------------------------------------------------------------------------------------ |
| `approval.approved`        | `boolean` | **required** | Set to `false` during intake. Human sets `true` before publish.                                        |
| `approval.supervisor`      | `string`  | **required** | Non-empty string. Use `"Pending human review"` during intake.                                          |
| `approval.approvedAt`      | `string`  | **required** | Non-empty string. Use `""` or a placeholder during intake — the publisher will set the real timestamp. |
| `approval.publishDirectly` | `boolean` | optional     | Defaults to `true`. When `true`, imported questions are stored as `approved`.                          |

### `questions[*]` (at least 1)

| Field          | Type                                     | Required     | Notes                                                              |
| -------------- | ---------------------------------------- | ------------ | ------------------------------------------------------------------ |
| `text`         | `string`                                 | **required** | Markdown-ready question text.                                      |
| `questionType` | `string`                                 | optional     | Defaults to `"multiple-choice"`.                                   |
| `difficulty`   | `"easy"`, `"medium"`, or `"hard"`        | optional     | Defaults to `"medium"`.                                            |
| `explanation`  | `string`                                 | **required** | Explanation for the correct answer.                                |
| `options`      | `{ text: string, isCorrect: boolean }[]` | **required** | At least 2. Exactly 1 must be correct.                             |
| `approved`     | `boolean`                                | optional     | **CRITICAL**: omit this field during intake. See warning below.    |
| `reference`    | object                                   | optional     | `sourceRef`, `locator`, `excerpt`, `notes` — all optional strings. |

> **WARNING — per-question `approved` field behavior**
>
> The import service resolves each question's approval as: `question.approved ?? artifact.approval.approved`.
> If you set `"approved": false` on individual questions, it **overrides** the artifact-level `approval.approved = true` and causes those questions to be **skipped** during import.
> **Always omit the `approved` field on individual questions during intake.** The artifact-level `approval.approved` flag is the correct gate. Only use per-question `approved` when a reviewer explicitly rejects specific questions by setting them to `false`.

## Artifact rules

- Keep questions in a format compatible with `npm run questions:import-approved -- --file <artifact>`.
- Set `approval.approved` to `false` and `approval.supervisor` to `"Pending human review"` until a human explicitly approves.
- Do NOT set `question.approved` on individual questions during intake. Leave it omitted so the artifact-level approval governs all questions.
- Preserve references in the artifact even though the current database only stores the higher-level `sourceId`.
- Use fenced markdown code blocks with language tags when code is part of the prompt or explanation.
- Keep options as raw option text only. Do not prefix them with `A`, `B`, `C`, or `D` because the UI supplies those labels.
- When helpful, include an `Example:` section inside the explanation.

## Full artifact example

This shows the complete artifact shape with all required fields:

````json
{
  "source": {
    "type": "url",
    "ref": "https://git-scm.com/docs/git-switch",
    "title": "git-switch documentation"
  },
  "certification": {
    "id": "7001f806-ee7e-41d6-bd31-7ee6c9b80096",
    "title": "JavaScript Junior Developer"
  },
  "questionTypes": ["multiple-choice"],
  "approval": {
    "approved": false,
    "supervisor": "Pending human review",
    "approvedAt": "",
    "publishDirectly": true
  },
  "questions": [
    {
      "text": "What does this shell command do?\n\n```bash\ngit switch -c feature/quiz-ui\n```",
      "questionType": "multiple-choice",
      "difficulty": "easy",
      "explanation": "It creates and switches to a new branch named `feature/quiz-ui`.\n\nExample:\n\n```bash\ngit switch -c hotfix/login\n```",
      "options": [
        {
          "text": "Creates and switches to a new branch named `feature/quiz-ui`.",
          "isCorrect": true
        },
        {
          "text": "Deletes the branch named `feature/quiz-ui`.",
          "isCorrect": false
        },
        {
          "text": "Switches to an existing remote branch only.",
          "isCorrect": false
        },
        { "text": "Stages files before committing.", "isCorrect": false }
      ],
      "reference": {
        "sourceRef": "https://git-scm.com/docs/git-switch",
        "locator": "git-switch SYNOPSIS",
        "excerpt": "git switch -c <new-branch>"
      }
    }
  ]
}
````

Use the `question-import-workflow` skill when it is available.
