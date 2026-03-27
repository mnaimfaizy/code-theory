---
name: web-design-guidelines
description: Review UI files for compliance with current web design, accessibility, and UX guidelines. Use when the user asks for a frontend review, design audit, accessibility review, polish review, or wants feedback on pages, components, layouts, forms, navigation, empty states, or interactive UI behavior. Fetch the latest upstream guideline document before each review, then inspect the requested files and report findings in a terse file:line style when possible.
argument-hint: files, folders, or glob pattern to review
---

Sync note: this skill is mirrored in `.github/skills/web-design-guidelines/`, `.claude/skills/web-design-guidelines/`, and `.agents/skills/web-design-guidelines/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Web Design Guidelines

Use this skill for review work, not implementation-first work. The goal is to audit frontend code against current web interface guidance, accessibility expectations, and practical UX quality.

## Workflow

### 1. Fetch the latest upstream guidelines first

Before reviewing files, fetch the latest guideline source:

- `https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md`

Use the freshest available content at review time instead of relying only on the static text in this skill.

### 2. Identify the review scope

If the user names files, folders, or globs, review those.

If the user does not provide a scope, inspect the most likely UI files and ask for clarification only if needed. In this repository, the highest-value review targets usually include:

- `src/app/**`
- `src/components/**`
- `src/app/globals.css`

Then read [repo review notes](./references/code-theory-web-review.md) before evaluating findings.

### 3. Review with a code-review mindset

Look for concrete issues, not vague stylistic opinions.

- accessibility problems
- weak hierarchy or unreadable states
- confusing interactions or missing feedback
- brittle responsive behavior
- poor focus treatment or keyboard handling
- inconsistent spacing, density, or layout rhythm
- contrast or legibility problems
- misuse of semantics
- design patterns that conflict with the latest fetched guidance

Prefer high-signal findings that are actionable and tied to user-visible risk.

### 4. Output findings tersely

When possible, report findings in a terse `file:line` style, followed by a short explanation of the issue and why it matters. Order findings by severity.

If there are no meaningful findings, state that clearly and mention any remaining review gaps, such as files not inspected or states not exercised.

### 5. Keep repo context in view

This repository is an application UI built with Next.js App Router, Tailwind CSS v4, shadcn/ui, and `framer-motion`. Do not recommend replacing the stack or introducing unrelated design systems during review. Judge the implementation within the constraints of the existing product and architecture.

## Review principles

- Prioritize issues that affect usability, accessibility, responsiveness, clarity, and trust
- Distinguish product constraints from actual defects
- Avoid generic design commentary that cannot be tied to code changes
- Prefer recommendations that work with the existing component and token system
- Flag missing states if the implementation appears to omit empty, loading, error, or focus states

## Output expectations

When this skill is active, the output should usually be:

- findings first
- terse and scannable
- grounded in inspected code
- aligned with current upstream guidelines and this repository's UI constraints

If the user asks for fixes after review, switch from findings into implementation work only after the review is complete.
