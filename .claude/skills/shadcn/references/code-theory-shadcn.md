# Code Theory shadcn Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/shadcn/references/` and `.agents/skills/shadcn/references/`.

Use these notes when applying the `shadcn` skill in this repository.

## Current project context

- `components.json` is present and should be treated as the local shadcn source of truth
- style: `base-nova`
- `rsc: true`
- `tsx: true`
- Tailwind CSS file: `src/app/globals.css`
- CSS variables enabled
- icon library: `lucide`
- UI alias: `@/components/ui`

## Existing local primitives

The repository already has local UI components under `src/components/ui/`, including:

- `button.tsx`
- `card.tsx`
- `dialog.tsx`
- `dropdown-menu.tsx`
- `input.tsx`
- `label.tsx`
- `tabs.tsx`
- `textarea.tsx`
- and other base UI elements

Treat these as application-owned source code. They may have drifted intentionally from upstream shadcn examples.

## Safe usage rules

- inspect local components before suggesting installs
- prefer editing existing source over re-adding a component from the CLI
- if the user asks to add or update a component, preview with `--dry-run` and `--diff` first
- do not overwrite local components without explicit user approval
- do not use community registries unless the user names one explicitly
- verify imports, aliases, and icon usage after any CLI-generated change

## Repo-specific reminders

- this repo uses Tailwind v4 and semantic tokens from `src/app/globals.css`
- this repo uses `lucide-react`
- this repo already has customized button and primitive implementations; do not assume stock upstream code should replace them
- check whether a task is really a shadcn problem versus a general frontend or Tailwind problem before reaching for the CLI
