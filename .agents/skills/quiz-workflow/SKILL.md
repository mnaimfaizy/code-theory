---
name: quiz-workflow
description: Work safely on quiz behavior, review flow, moderation, approval, results, and duplicate-resolution logic in this repository. Use when the task affects quiz modes, attempt lifecycle, question approval, review queues, certification management, or deduplication behavior. Keep product rules intact: generated questions start as draft, approval gates quiz eligibility, and workflow changes should remain consistent across UI, API routes, and shared services.
argument-hint: workflow area, page, route, or service to change
---

Sync note: this skill is mirrored in `.github/skills/quiz-workflow/`, `.claude/skills/quiz-workflow/`, and `.agents/skills/quiz-workflow/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Quiz Workflow

Use this skill for domain workflow work: quizzes, approvals, review, question lifecycle, results, and deduplication.

## Workflow

### 1. Read workflow rules first

Before editing behavior, read [repo workflow notes](./references/code-theory-quiz-workflow.md) and inspect the nearest relevant services and routes.

The core sources of truth are:

- `docs/WORKFLOW.md`
- `src/server/services/quiz-service.ts`
- `src/server/services/review-service.ts`
- `src/server/services/dedupe-service.ts`
- related `src/app/api/**/route.ts` files

### 2. Preserve core product rules

These rules are high priority and should not be broken unless the task explicitly changes them:

- generated questions start as `draft`
- only approved questions belong in the active quiz pool
- review is the gate between draft content and active content
- deduplication produces flags that require explicit resolution
- quiz modes remain coherent: timed or untimed, fixed or random

If a requested change conflicts with those rules, make the conflict explicit rather than silently bypassing the workflow.

### 3. Keep logic in the service layer

When making changes:

- put business logic in `src/server/services/*`
- keep route handlers thin
- keep UI components focused on presentation and interaction
- update CLI and GUI paths consistently when they rely on shared services

Do not split the workflow into duplicated logic across routes, pages, and scripts.

### 4. Think in lifecycle transitions

Model changes in terms of state transitions and user journeys.

- draft -> approved -> active pool
- draft -> rejected
- attempt started -> answers saved -> attempt submitted -> results shown
- duplicate flagged -> duplicate reviewed -> resolution stored

Prefer explicit and auditable transitions over hidden side effects.

### 5. Verify behavior, not just types

After changes, check that:

- approved-only quiz selection still holds unless intentionally changed
- review and moderation flows still match the product lifecycle
- dedupe flags and resolutions still make sense
- results, attempts, and answer persistence still align with mode and timing behavior
- UI and API entry points still call the same service logic where they should

## Output expectations

When this skill is active, changes should usually preserve domain integrity first and code shape second.

Favor workflow correctness, service-layer cohesion, and explicit state transitions over quick UI-only patches.
