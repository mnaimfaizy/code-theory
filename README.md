# Code Theory

Code Theory is a certification quiz platform built with Next.js App Router, React 19, TypeScript, Drizzle ORM, NextAuth credentials auth, Tailwind CSS v4, and shadcn/ui.

## Getting Started

This repository is npm-only. Install the reviewed dependency set from the committed lockfile, then start the app:

```bash
npm ci
cp .env.example .env.local
npm run db:push
npm run db:seed
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

For repository-specific setup, security posture, and conventions, see `docs/DEVELOPMENT.md`, `docs/ARCHITECTURE.md`, `SECURITY.md`, `docs/SECURITY/Dependency-Supply-Chain-Security-Plan.md`, and `.github/copilot-instructions.md`.

## AI Customizations

This repository includes shared AI customization files for multiple tools.

- `.github/copilot-instructions.md`: repository-wide GitHub Copilot instructions
- `.github/agents/question-intake.agent.md`: GitHub Copilot custom agent for source reading, question drafting, and temp JSON artifact creation
- `.github/agents/question-publisher.agent.md`: GitHub Copilot custom agent for approved artifact import, certification resolution, and temp cleanup
- `.github/agents/question-review-retriever.agent.md`: GitHub Copilot custom agent for exporting existing certification questions and answers into temp review artifacts
- `.github/agents/question-reviewer.agent.md`: GitHub Copilot custom agent for reviewing exported certification question artifacts in batches and pruning unchanged entries
- `.github/agents/question-review-applier.agent.md`: GitHub Copilot custom agent for validating reviewed artifacts, applying proposed changes, and optionally removing the temp file
- `.github/skills/frontend-design/`: project skill for GitHub Copilot and VS Code skill discovery
- `.github/skills/drizzle-database/`: project skill for Drizzle schema, relations, queries, and SQLite/PostgreSQL portability work
- `.github/skills/ingestion-generation/`: project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.github/skills/question-import-workflow/`: project skill for supervisor-reviewed JSON question import and direct publish workflows
- `.github/skills/question-review-workflow/`: project skill for retrieving, reviewing, pruning, and applying existing certification question updates through temp artifacts
- `.github/skills/quiz-workflow/`: project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.github/skills/shadcn/`: project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.github/skills/tailwind-design-system/`: project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.github/skills/web-design-guidelines/`: project skill for UI review and guideline-based frontend audits
- `.claude/skills/frontend-design/`: mirrored project skill for Claude-compatible tools
- `.claude/skills/drizzle-database/`: mirrored project skill for Drizzle schema, relations, queries, and SQLite/PostgreSQL portability work
- `.claude/skills/ingestion-generation/`: mirrored project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.claude/skills/question-import-workflow/`: mirrored project skill for supervisor-reviewed JSON question import and direct publish workflows
- `.claude/skills/question-review-workflow/`: mirrored project skill for retrieving, reviewing, pruning, and applying existing certification question updates through temp artifacts
- `.claude/skills/quiz-workflow/`: mirrored project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.claude/skills/shadcn/`: mirrored project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.claude/skills/tailwind-design-system/`: mirrored project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.claude/skills/web-design-guidelines/`: mirrored project skill for UI review and guideline-based frontend audits
- `.agents/skills/frontend-design/`: mirrored project skill for Agent Skills-compatible tools and editors
- `.agents/skills/drizzle-database/`: mirrored project skill for Drizzle schema, relations, queries, and SQLite/PostgreSQL portability work
- `.agents/skills/ingestion-generation/`: mirrored project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.agents/skills/question-import-workflow/`: mirrored project skill for supervisor-reviewed JSON question import and direct publish workflows
- `.agents/skills/question-review-workflow/`: mirrored project skill for retrieving, reviewing, pruning, and applying existing certification question updates through temp artifacts
- `.agents/skills/quiz-workflow/`: mirrored project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.agents/skills/shadcn/`: mirrored project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.agents/skills/tailwind-design-system/`: mirrored project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.agents/skills/web-design-guidelines/`: mirrored project skill for UI review and guideline-based frontend audits

The `drizzle-database`, `frontend-design`, `ingestion-generation`, `question-import-workflow`, `question-review-workflow`, `quiz-workflow`, `shadcn`, `tailwind-design-system`, and `web-design-guidelines` skills are intentionally mirrored across all three skill directories so different AI tools can discover the same workflows.

## Using The Question Import Agents

This repository includes a two-agent workflow for turning a source document or URL into approved certification questions.

### What Each Agent Does

- `Question Intake`: reads the source, asks which question types to create, and writes a reviewable JSON artifact under `tmp/`
- `Question Publisher`: validates a human-approved JSON artifact, resolves or creates the certification, imports the questions, and removes the temp file after success

The two agents are defined in:

- `.github/agents/question-intake.agent.md`
- `.github/agents/question-publisher.agent.md`

The shared workflow rules and artifact expectations live in:

- `.github/skills/question-import-workflow/`

### Prerequisites

Before using the workflow:

1. Open the repository in VS Code with GitHub Copilot Chat enabled.
2. Use Agent mode in chat.
3. Make sure the repository root has a `tmp/` or `temp/` directory available for artifacts. Both are ignored by git.
4. If you plan to publish questions, ensure the local database and app setup are working for this repository.

### Recommended Flow

1. Select the `Question Intake` agent in Copilot Chat.
2. Give it a URL or local document path.
3. If you did not specify question types, answer the follow-up question about which question types you want.
4. Let the agent create a JSON review artifact in `tmp/`.
5. Review the generated JSON manually and mark the artifact as approved.
6. Switch to the `Question Publisher` agent, or use the handoff from `Question Intake`.
7. Give it the approved artifact path and, if needed, the certification slug or id.
8. Let it import the questions and remove the temp artifact after a successful publish.

### Intake Example

Example prompt for `Question Intake`:

```text
Read https://react.dev/learn and generate questions for the React Fundamentals certification.
Create only multiple-choice questions for now.
Write the review artifact under tmp/.
```

Example prompt for a local file:

```text
Read docs/internal/react-hooks-guide.pdf and create questions for a new certification called Advanced React Hooks.
Ask me which question types you should generate before writing the artifact.
```

Expected outcome from `Question Intake`:

- a JSON file such as `tmp/react-fundamentals-questions-20260328-153000.json`
- one explanation per question
- one detailed source reference per question when available
- `approval.approved: false` until a human reviewer updates the file

### Approval Artifact Example

The artifact written by `Question Intake` should look like this shape:

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
    "coverageNotes": "Source was read in sections because it exceeded one context window."
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

Before publishing, a human supervisor should update the artifact to reflect approval. For example:

```json
"approval": {
	"supervisor": "Jane Smith",
	"approvedAt": "2026-03-28T15:42:00Z",
	"approved": true,
	"publishDirectly": true
}
```

If only some questions are approved, set `question.approved` per question and leave unapproved questions out of publication.

### Publisher Example

Example prompt for `Question Publisher` when the certification already exists:

```text
Publish tmp/react-fundamentals-questions-20260328-153000.json to the existing certification with slug react-fundamentals.
```

Example prompt for `Question Publisher` when a new certification is needed:

```text
Publish tmp/advanced-react-hooks-questions.json.
If the certification does not exist yet, create a new certification called Advanced React Hooks first.
```

Under the hood, the publishing path uses:

```bash
npm run questions:import-approved -- --file tmp/<artifact>.json
```

Optional flags:

- `--cert-id <id>`
- `--cert-slug <slug>`
- `--create-cert`
- `--created-by <userId>`

### Direct Command Example

If you want to bypass the chat handoff and run the importer yourself after approval:

```bash
npm run questions:import-approved -- --file tmp/react-fundamentals-questions-20260328-153000.json --cert-slug react-fundamentals
```

If the certification should be created during import:

```bash
npm run questions:import-approved -- --file tmp/advanced-react-hooks-questions.json --create-cert
```

After a successful import, the script deletes the temp JSON artifact automatically.

## Using The Question Review Agents

This repository also includes a two-agent workflow for reviewing and improving existing certification questions already stored in the database.

This repository also includes a three-agent workflow for reviewing and improving existing certification questions already stored in the database.

### What Each Agent Does

- `Question Review Retriever`: exports all questions and answers for one certification into a temp JSON artifact with preserved ids and batch metadata
- `Question Reviewer`: reviews them in batches instead of trying to rewrite a large certification in one pass, then removes unchanged questions so the file shrinks to only actionable updates
- `Question Review Applier`: validates the reviewed artifact, applies its proposed changes to the database, and optionally removes the temp file after success

The agents are defined in:

- `.github/agents/question-review-retriever.agent.md`
- `.github/agents/question-reviewer.agent.md`
- `.github/agents/question-review-applier.agent.md`

The shared workflow rules live in:

- `.github/skills/question-review-workflow/`

Under the hood, the workflow uses two CLI commands:

```bash
npm run questions:export-review -- --cert-slug react-fundamentals
npm run questions:apply-review -- --file tmp/react-fundamentals-question-review-20260331-120000.json
```

### Recommended Flow

1. Select the `Question Review Retriever` agent in Copilot Chat.
2. Give it the certification slug or id and, if needed, a preferred batch size or status filter.
3. Let it export the review artifact into `tmp/` or `temp/`.
4. Hand off to `Question Reviewer`.
5. Let it review one batch at a time and prune unchanged questions from the JSON file.
6. Review the remaining proposed changes.
7. Hand off to `Question Review Applier` when you are satisfied.
8. Let it apply the artifact back to the database and optionally remove the temp file.

### Export Example

```bash
npm run questions:export-review -- --cert-slug react-fundamentals --batch-size 20
```

Optional flags:

- `--cert-id <id>`
- `--status <draft,approved,rejected>`
- `--out temp/<artifact>.json`

### Apply Example

```bash
npm run questions:apply-review -- --file tmp/react-fundamentals-question-review-20260331-120000.json
```

Optional flags:

- `--remove-file`

### Review Artifact Note

When rewriting options, preserve the same `optionId` values and option count. The current apply workflow updates existing option rows in place; it does not add or remove answer rows.

### Current Limitation

The temp review and import artifacts can store detailed references for each question, but the current database schema only persists `sourceId` plus the question explanation. If you want those detailed citations to appear later in the review UI, quiz UI, or results UI, that requires an additional schema and UI change.

## Skill Sync Note

When editing mirrored skills, keep the corresponding directories synchronized:

- `.github/skills/frontend-design/`
- `.claude/skills/frontend-design/`
- `.agents/skills/frontend-design/`
- `.github/skills/drizzle-database/`
- `.claude/skills/drizzle-database/`
- `.agents/skills/drizzle-database/`
- `.github/skills/ingestion-generation/`
- `.claude/skills/ingestion-generation/`
- `.agents/skills/ingestion-generation/`
- `.github/skills/question-import-workflow/`
- `.github/skills/question-review-workflow/`
- `.claude/skills/question-import-workflow/`
- `.claude/skills/question-review-workflow/`
- `.agents/skills/question-import-workflow/`
- `.agents/skills/question-review-workflow/`
- `.github/skills/quiz-workflow/`
- `.claude/skills/quiz-workflow/`
- `.agents/skills/quiz-workflow/`
- `.github/skills/shadcn/`
- `.claude/skills/shadcn/`
- `.agents/skills/shadcn/`
- `.github/skills/tailwind-design-system/`
- `.claude/skills/tailwind-design-system/`
- `.agents/skills/tailwind-design-system/`
- `.github/skills/web-design-guidelines/`
- `.claude/skills/web-design-guidelines/`
- `.agents/skills/web-design-guidelines/`

If you change `SKILL.md`, also update any referenced files under each skill's `references/` directory so all agents load the same guidance.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
