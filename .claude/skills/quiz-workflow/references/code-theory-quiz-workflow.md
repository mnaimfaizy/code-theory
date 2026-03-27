# Code Theory Quiz Workflow Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/quiz-workflow/references/` and `.agents/skills/quiz-workflow/references/`.

Use these notes when applying the `quiz-workflow` skill in this repository.

## Core workflow rules

- Generated questions begin as `draft`
- Draft questions require manual review before becoming quiz-eligible
- Only approved questions should appear in the quiz pool unless a task explicitly changes that rule
- Rejected questions are not active quiz content
- Deduplication creates flags that require explicit resolution

## Important user journeys

- browse certification -> choose mode -> start quiz -> answer -> submit -> review results
- create certification -> add/import questions -> review drafts -> approve or reject -> active pool
- run dedupe -> inspect unresolved duplicates -> resolve flagged items

## Where logic lives

- quiz execution: `src/server/services/quiz-service.ts`
- review and approval: `src/server/services/review-service.ts`
- dedupe scanning and resolution: `src/server/services/dedupe-service.ts`
- route handlers should stay thin and call services

## What to watch for

- accidental inclusion of draft questions in quiz selection
- moderation steps bypassed in APIs or UI flows
- results logic drifting from attempt persistence
- dedupe flags being created or resolved inconsistently
- workflow logic duplicated across routes or components instead of shared services
