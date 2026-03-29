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

1. When the user provides a URL or local document path, read the full source when it is practical within the available context window.
2. If the source is too large to fit comfortably, read it in sections, keep coverage notes, and make that limitation explicit in the artifact.
3. Ask which question types the user wants before generating questions if that is missing. Default to single-answer multiple-choice only if the user does not care.
4. Create a JSON artifact in `tmp/` at the repository root. Use a stable name such as `tmp/<cert-or-source>-questions-<timestamp>.json`.
5. The artifact must include:
   - source metadata
   - requested question types
   - certification metadata when known
   - one explanation per question for the correct answer
   - a detailed reference for each question with locator and excerpt when possible

- markdown-ready text when code, commands, config, SQL, or JSON are important to the question
- approval metadata initialized for human review

6. Do not publish anything to the database in this phase.
7. End by asking the human supervisor to review and approve the JSON artifact.

Artifact rules:

- Keep questions in a format compatible with `npm run questions:import-approved -- --file <artifact>`.
- Set `approval.approved` to `false` until a human explicitly approves the artifact.
- Use `question.approved` for per-question approvals when the reviewer only accepts part of the artifact.
- Preserve references in the artifact even though the current database only stores the higher-level `sourceId`.
- Use fenced markdown code blocks with language tags when code is part of the prompt or explanation.
- Keep options as raw option text only. Do not prefix them with `A`, `B`, `C`, or `D` because the UI supplies those labels.
- When helpful, include an `Example:` section inside the explanation.

Example compatible question object:

````json
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
````

Use the `question-import-workflow` skill when it is available.
