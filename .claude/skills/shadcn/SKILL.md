---
name: shadcn
description: Work safely with shadcn/ui components in this repository. Use when the task involves adding, updating, fixing, composing, or styling shadcn/ui primitives, checking whether a component already exists, aligning with the project's shadcn configuration, or deciding whether a UI problem should be solved with an existing component instead of custom markup. Prefer installed components, local source inspection, and preview-first updates over blindly running CLI commands.
argument-hint: component name, ui task, or shadcn change
---

Sync note: this skill is mirrored in `.github/skills/shadcn/`, `.claude/skills/shadcn/`, and `.agents/skills/shadcn/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# shadcn

Use this skill for shadcn/ui-specific work in this repository.

The goal is not to run the shadcn CLI by default. The goal is to make good decisions about whether to reuse, compose, inspect, or carefully update shadcn-based source code that already lives in the repo.

## Safe-first workflow

### 1. Read local project context before doing anything else

Start with local files, not shell commands.

- inspect `components.json`
- inspect `src/components/ui/*`
- inspect `src/app/globals.css`
- read [repo shadcn notes](./references/code-theory-shadcn.md)

Use the local project state as the primary source of truth.

### 2. Prefer installed components over adding new ones

Before suggesting or adding anything, check whether the repository already has a suitable component.

- reuse installed components first
- compose existing primitives before inventing custom markup
- do not assume upstream examples match local component APIs exactly

This repository already contains customized source files under `src/components/ui/`. Treat them as owned application code, not disposable generated output.

### 3. Use the CLI only when necessary and only with guardrails

If the task explicitly requires adding or updating components from upstream, use the official shadcn CLI conservatively.

- prefer local inspection over CLI where possible
- use the project package runner and run commands from the repo root
- preview changes with `--dry-run` and `--diff` before applying updates
- never use `--overwrite` unless the user explicitly approves it
- never switch presets, reinstall, or bulk-add components without explicit user approval
- do not use community registries unless the user explicitly asks for a specific registry

If a component can be implemented by editing an existing local primitive, prefer that over reinstalling or replacing it.

### 4. Keep changes aligned with this repository

This project uses a shadcn setup that matters:

- style: `base-nova`
- RSC enabled
- Tailwind CSS v4 with CSS variables in `src/app/globals.css`
- icon library: `lucide`
- UI alias: `@/components/ui`

Do not assume Radix-style examples are correct without checking the actual local implementation. Some local primitives use Base UI packages and may differ from generic upstream snippets.

### 5. Apply shadcn principles without forcing upstream patterns blindly

Good defaults:

- use existing components before custom markup
- prefer semantic tokens and existing variants
- use `gap-*` over `space-*`
- use `size-*` when width and height are equal
- use `cn()` for conditional classes
- preserve accessible structure, titles, labels, and state attributes

But always reconcile those rules with the actual local component code. The repo's source wins over generic assumptions.

## Security and change-control rules

- Local files first, remote registries last
- Official shadcn CLI only when needed
- No manual fetching of raw component files from GitHub to replace local code
- No community registry installs unless the user explicitly names the registry
- No destructive overwrite flows without approval
- Review every added or changed file after CLI output before considering the task complete

## Output expectations

When this skill is active, shadcn work should usually result in:

- use or extension of existing local primitives when possible
- minimal, auditable changes
- correct imports for this repo's aliases and icon library
- Tailwind v4- and RSC-compatible code
- conservative upgrade behavior with previews before writes

If the task is broader frontend design work, combine this skill with the repo's frontend-design or tailwind-design-system guidance rather than using shadcn rules alone.
