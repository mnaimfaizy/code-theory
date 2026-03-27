# Code Theory UI Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/frontend-design/references/` and `.agents/skills/frontend-design/references/`.

Use these notes when working on frontend tasks in this repository.

## Current stack

- Next.js App Router with React 19
- Tailwind CSS v4 and shadcn/ui primitives
- Global typography comes from Geist in `src/app/layout.tsx`
- Shared styling tokens live in `src/app/globals.css`
- `framer-motion` is already available and used in app screens

## Existing visual language

- The app is currently clean, restrained, and product-oriented rather than highly expressive
- Header, layout shell, and common surfaces already exist; preserve them unless a redesign is requested
- Neutral tokens and restrained contrast are already established in global styles
- Existing pages use rounded cards, soft borders, muted backgrounds, and selective motion

## Practical rules for this repo

- Prefer improving the current product UI over replacing it with a completely different style
- Reuse existing components from `src/components/ui/*` before building custom primitives
- Keep new pages and components mobile-first
- Use client components only when state, effects, browser APIs, or interactive handlers are required
- Keep route handlers and services separate from frontend-only concerns

## When stronger design direction is appropriate

Push harder on aesthetics when the task is clearly a redesign, landing page, marketing-style surface, or visual refresh. Even then:

- keep the implementation in Next.js and Tailwind
- maintain accessibility and readability
- avoid introducing a parallel design system unless the task calls for one
- make sure the result still feels deliberate, not random or overworked

## Verification

- Run `npm run lint` after making frontend changes
- Check both compact and wide layouts
- Review interaction states for buttons, menus, dialogs, and form controls when touched
