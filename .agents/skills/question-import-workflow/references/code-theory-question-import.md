# Code Theory Question Import Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/question-import-workflow/references/` and `.claude/skills/question-import-workflow/references/`.

Use these notes when applying the `question-import-workflow` skill in this repository.

## Recommended Copilot customization shape

- use a custom agent for intake and artifact creation
- use a second custom agent for publishing approved artifacts
- use handoffs between those agents instead of a fully opaque one-shot workflow
- use a mirrored skill for the durable rules and schema

This is more reliable than relying on experimental nested custom subagents for the full flow.

## Why this shape fits the docs

- custom agents are the right tool for persistent personas, tool restrictions, and handoffs
- skills are the right tool for reusable domain instructions and artifact schema guidance
- prompt files are optional, but not required, because this workflow depends more on behavior than on a one-off prompt template

## Current repository support

- certification creation: `src/server/services/certification-service.ts`
- source registration: `src/server/services/certification-service.ts`
- question publishing: `src/server/services/certification-service.ts`
- approved artifact import: `src/server/services/question-import-service.ts`
- CLI entry point: `scripts/import-approved-questions.ts`

## Artifact shape

Use a JSON artifact similar to this:

```json
{
  "certification": {
    "slug": "react-fundamentals",
    "title": "React Fundamentals",
    "description": "Core React concepts and day-to-day usage.",
    "createIfMissing": false
  },
  "source": {
    "type": "url",
    "ref": "https://react.dev/learn",
    "title": "React Learn",
    "coverageNotes": "Read the full page set in sections because the source exceeded one context window."
  },
  "questionTypes": ["multiple-choice"],
  "approval": {
    "supervisor": "Pending human review",
    "approvedAt": "",
    "approved": false,
    "publishDirectly": true
  },
  "questions": [
    {
      "text": "Why does React require keys when rendering a list?",
      "questionType": "multiple-choice",
      "difficulty": "medium",
      "explanation": "Keys help React match list items across renders so it can preserve state and apply updates efficiently.",
      "approved": false,
      "reference": {
        "sourceRef": "https://react.dev/learn/rendering-lists",
        "locator": "Rendering Lists",
        "excerpt": "Keys tell React which array item each component corresponds to..."
      },
      "options": [
        { "text": "They improve CSS specificity.", "isCorrect": false },
        {
          "text": "They let React identify items between renders.",
          "isCorrect": true
        },
        { "text": "They make lists sortable by default.", "isCorrect": false },
        { "text": "They eliminate the need for props.", "isCorrect": false }
      ]
    }
  ]
}
```

## Import command

```bash
npm run questions:import-approved -- --file tmp/<artifact>.json
```

Optional flags:

- `--cert-id <id>`
- `--cert-slug <slug>`
- `--create-cert`
- `--created-by <userId>`

## Known limitation

The current schema stores `sourceId` on each question, but not the detailed citation object from the temp artifact. Detailed references remain in the JSON file unless you extend the database schema and the quiz/review UI.
