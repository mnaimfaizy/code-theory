---
name: frontend-design
description: Design and implement polished frontend pages and components for this repository. Use when the task involves page or component design, UI redesign, visual polish, responsive layout work, typography, color systems, motion, dashboards, landing sections, or making an interface feel more intentional and less generic. For existing product surfaces, preserve Code Theory patterns and improve them with restraint. For new surfaces, choose a distinct visual direction and implement it with production-ready Next.js, React, Tailwind, and shadcn/ui code.
argument-hint: component or page, audience, goal, constraints
---

Sync note: this skill is mirrored in `.github/skills/frontend-design/`, `.claude/skills/frontend-design/`, and `.agents/skills/frontend-design/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Frontend Design

Use this skill when the work is primarily about frontend craft: layout, visual hierarchy, styling, responsive behavior, motion, or turning a vague design request into production-ready UI.

Start by deciding which mode applies:

1. Existing product surface: preserve the established Code Theory visual language and improve clarity, spacing, emphasis, and usability without redesigning the app from scratch.
2. New or isolated surface: choose a strong aesthetic direction before coding and carry it through consistently.

## Workflow

### 1. Read the existing context first

For edits inside the app, inspect nearby files and then read [repo UI notes](./references/code-theory-ui.md). Prefer working with existing layout, typography, motion, and component patterns before inventing new ones.

### 2. Define the design direction

Before writing code, make the visual direction explicit:

- Purpose: what the screen helps the user accomplish
- Audience: who uses it and in what context
- Tone: calm, editorial, technical, playful, severe, luxe, dense, airy, and so on
- Memorable trait: the one design choice that gives the screen identity
- Constraints: accessibility, responsiveness, performance, existing design system, and framework limits

If the request is for a new experience, commit to a clear direction rather than averaging multiple styles together.

### 3. Implement with discipline

Produce working, maintainable UI code, not mockup-like fragments.

- Match the repository stack: Next.js App Router, React, Tailwind CSS v4, and shadcn/ui primitives
- Prefer existing UI building blocks in `src/components/ui/*`
- Keep layouts responsive from mobile upward
- Use clear typographic hierarchy and deliberate spacing
- Use color tokens or CSS variables when introducing a richer theme
- Use motion sparingly but intentionally; prioritize a few high-value transitions over many small ones
- When React motion is needed, prefer the existing `framer-motion` dependency instead of adding new animation libraries
- Preserve semantics, keyboard access, and visible focus states

### 4. Avoid generic output

Do not produce interchangeable UI.

- Avoid default-looking component arrangements and boilerplate hero sections
- Avoid timid palettes with no point of view
- Avoid overusing common AI-generated combinations of bland typography, symmetric card grids, and vague gradients
- Do not introduce novelty that fights the product unless the task explicitly asks for a bold redesign

For app screens, polish should come from composition, contrast, rhythm, and restrained motion. For new surfaces, stronger visual experimentation is acceptable if the result still feels intentional and usable.

### 5. Verify before finishing

Check the implementation against the task:

- Mobile and desktop layouts both work
- Empty, loading, and dense-content states are still readable when applicable
- The visual emphasis matches the most important actions and data
- There are no obvious hydration, client/server, or dependency mistakes
- Run the normal repo verification command after edits

## Repo-specific guardrails

- This repository already has global fonts, shared providers, and a shared header. Reuse them unless a task explicitly asks for a different experience.
- For established app views, improve the current design language instead of replacing it.
- When a request is explicitly for redesign, keep the result consistent with the app architecture and component structure.
- When adding custom styling, keep it local and purposeful; do not destabilize global styles without a good reason.

## Output expectations

When this skill is active, frontend work should usually result in:

- production-ready code rather than loose design notes
- a visible design point of view
- sensible responsiveness and accessibility
- changes that fit the repo instead of feeling pasted in from another stack

If the request is ambiguous, infer a direction and proceed, but keep the implementation consistent with the product context.
