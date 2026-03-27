# Code Theory Tailwind Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/tailwind-design-system/references/` and `.claude/skills/tailwind-design-system/references/`.

Use these notes when applying `tailwind-design-system` in this repository.

## Current setup

- Tailwind CSS v4 is configured in `src/app/globals.css`
- The project uses CSS-first configuration with `@import "tailwindcss"`
- Tokens are exposed through `@theme inline`
- Dark mode uses `@custom-variant dark`
- Color tokens use OKLCH values
- `tw-animate-css` and `shadcn/tailwind.css` are already imported

## Where to change what

- shared tokens and base rules: `src/app/globals.css`
- reusable primitives: `src/components/ui/*`
- class merging helper: `src/lib/utils.ts`

## Existing conventions

- semantic token names such as `background`, `foreground`, `primary`, `muted`, `accent`, `border`, and `ring`
- radius scales derived from `--radius`
- shadcn-style token usage in components
- CVA for variants in reusable controls
- `cn()` for merging Tailwind class strings

## Guidance for changes

- prefer semantic classes over raw color values when the style is part of the design system
- preserve the existing token model unless the task explicitly justifies broader changes
- keep shared components cohesive across size, variant, and state behavior
- do not add Tailwind configuration files just to solve a token or utility problem already handled in CSS
- review both light and dark token behavior when changing shared styles

## Watchouts

- avoid arbitrary values when a token or shared utility would be more durable
- avoid component-local color decisions that should be global tokens
- avoid diverging from existing UI primitive patterns unless you are intentionally refactoring them
