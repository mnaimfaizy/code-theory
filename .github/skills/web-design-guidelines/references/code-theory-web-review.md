# Code Theory Web Review Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.claude/skills/web-design-guidelines/references/` and `.agents/skills/web-design-guidelines/references/`.

Use these notes when applying `web-design-guidelines` in this repository.

## Review targets

- `src/app/**` for page structure, layouts, server/client boundaries, and route-level UI
- `src/components/**` for reusable UI, interaction patterns, and visual consistency
- `src/app/globals.css` for tokens, typography, and global visual rules

## Repo constraints

- The app uses Next.js App Router, React 19, Tailwind CSS v4, and shadcn/ui
- Global fonts come from Geist in `src/app/layout.tsx`
- `framer-motion` is available and already used in the app
- Existing UI is restrained and product-oriented; do not review it as though it were a marketing microsite

## What to prioritize in findings

- inaccessible controls, labels, focus states, or contrast
- awkward mobile layouts or fragile breakpoints
- confusing hierarchy, weak affordances, or unclear calls to action
- inconsistent spacing and density across related surfaces
- empty states, error states, and loading states that are missing or hard to understand
- motion that distracts, obscures state changes, or harms usability

## What not to over-penalize

- deliberate product restraint
- neutral color palettes that are still legible and coherent
- use of existing shadcn/ui patterns when implemented correctly

## Reporting style

- prefer concrete findings over taste-based commentary
- tie each finding to user impact
- if no serious issues are found, say so explicitly and mention any review limitations
