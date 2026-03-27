---
name: tailwind-design-system
description: Build and evolve Tailwind CSS v4 design-system code for this repository. Use when the task involves Tailwind tokens, `@theme` blocks, CSS variables, component variants, semantic color usage, responsive layout primitives, shadcn/ui styling, or standardizing UI patterns in Tailwind. Prefer CSS-first Tailwind v4 patterns, accessible component APIs, and repo-consistent token usage over one-off utility sprawl.
argument-hint: component, token set, css file, or design-system change
---

Sync note: this skill is mirrored in `.github/skills/tailwind-design-system/`, `.claude/skills/tailwind-design-system/`, and `.agents/skills/tailwind-design-system/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Tailwind Design System

Use this skill for Tailwind CSS v4 design-system work: token design, semantic color mapping, component variant architecture, shared utilities, and standardizing UI primitives.

## Workflow

### 1. Read the existing Tailwind setup first

Before changing styling primitives, inspect the current CSS-first Tailwind configuration and then read [repo Tailwind notes](./references/code-theory-tailwind.md).

In this repository, the most important files usually include:

- `src/app/globals.css`
- `src/components/ui/*`
- `src/lib/utils.ts`

### 2. Work with Tailwind v4, not against it

Prefer the current v4 model:

- CSS-first configuration in CSS files
- `@theme` blocks for tokens
- CSS variables for semantic tokens
- `@custom-variant dark` for dark mode behavior
- semantic utility classes such as `bg-primary` and `text-muted-foreground`

Do not reintroduce old configuration patterns unless the repository explicitly requires them.

### 3. Build systems, not one-off patches

When styling or refactoring components:

- prefer semantic tokens over raw color utilities
- extend existing token sets rather than scattering arbitrary values
- keep variants consistent across similar controls
- preserve accessible focus, hover, pressed, disabled, and invalid states
- use CVA-based variants when the component already follows that pattern
- keep utility composition readable and maintainable

When a change belongs in global tokens or shared primitives, make it there instead of copying classes across many components.

### 4. Respect repo-specific constraints

This repository already uses Tailwind v4, OKLCH tokens, `@theme inline`, `tw-animate-css`, shadcn styles, and shared UI components. Tailwind work should fit that system.

- preserve existing token naming unless there is a strong reason to rename
- prefer updating `src/app/globals.css` for shared tokens
- prefer editing `src/components/ui/*` for reusable primitives
- avoid introducing a parallel token system or ad hoc utility conventions
- keep motion and visual complexity aligned with the product UI, not a marketing site

### 5. Verify system quality

After edits, check for:

- semantic token usage instead of hardcoded presentation values where reuse matters
- responsive behavior that still works on small screens
- accessible states and contrast
- consistent sizing, radius, spacing, and interaction behavior across related components
- no unnecessary regression in dark-mode or themed states

## Good patterns for this repo

- Use `@theme` and CSS variables for reusable design tokens
- Keep component APIs small and predictable
- Reuse `cn()` for class merging
- Keep CVA variants coherent across components
- Use shared primitives and tokenized utilities instead of duplicating long utility strings everywhere

## Avoid

- reviving `tailwind.config.*` as the main design-system entry point
- hardcoding colors where semantic tokens should exist
- mixing multiple token naming schemes
- adding arbitrary values repeatedly when a token or shared utility is the better abstraction
- overengineering primitives that the current app does not need

## Output expectations

When this skill is active, Tailwind work should usually result in:

- clean Tailwind v4-compatible code
- token-aware styling
- reusable component/system improvements
- changes that fit the existing shadcn and product UI structure

If the user asks for a visual redesign, combine this skill with the repository's frontend design guidance rather than using Tailwind mechanics alone to drive design decisions.
