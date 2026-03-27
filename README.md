# Code Theory

Code Theory is a certification quiz platform built with Next.js App Router, React 19, TypeScript, Drizzle ORM, NextAuth credentials auth, Tailwind CSS v4, and shadcn/ui.

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

For repository-specific setup and conventions, see `docs/DEVELOPMENT.md`, `docs/ARCHITECTURE.md`, and `.github/copilot-instructions.md`.

## AI Customizations

This repository includes shared AI customization files for multiple tools.

- `.github/copilot-instructions.md`: repository-wide GitHub Copilot instructions
- `.github/skills/frontend-design/`: project skill for GitHub Copilot and VS Code skill discovery
- `.github/skills/ingestion-generation/`: project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.github/skills/quiz-workflow/`: project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.github/skills/shadcn/`: project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.github/skills/tailwind-design-system/`: project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.github/skills/web-design-guidelines/`: project skill for UI review and guideline-based frontend audits
- `.claude/skills/frontend-design/`: mirrored project skill for Claude-compatible tools
- `.claude/skills/ingestion-generation/`: mirrored project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.claude/skills/quiz-workflow/`: mirrored project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.claude/skills/shadcn/`: mirrored project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.claude/skills/tailwind-design-system/`: mirrored project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.claude/skills/web-design-guidelines/`: mirrored project skill for UI review and guideline-based frontend audits
- `.agents/skills/frontend-design/`: mirrored project skill for Agent Skills-compatible tools and editors
- `.agents/skills/ingestion-generation/`: mirrored project skill for source import, LLM generation, provenance, and review-gated draft persistence
- `.agents/skills/quiz-workflow/`: mirrored project skill for quiz rules, review flow, approval gating, results, and deduplication behavior
- `.agents/skills/shadcn/`: mirrored project skill for safe shadcn/ui component reuse, composition, and conservative CLI-driven updates
- `.agents/skills/tailwind-design-system/`: mirrored project skill for Tailwind v4 tokens, component variants, and CSS-first design-system work
- `.agents/skills/web-design-guidelines/`: mirrored project skill for UI review and guideline-based frontend audits

The `frontend-design`, `ingestion-generation`, `quiz-workflow`, `shadcn`, `tailwind-design-system`, and `web-design-guidelines` skills are intentionally mirrored across all three skill directories so different AI tools can discover the same workflows.

## Skill Sync Note

When editing mirrored skills, keep the corresponding directories synchronized:

- `.github/skills/frontend-design/`
- `.claude/skills/frontend-design/`
- `.agents/skills/frontend-design/`
- `.github/skills/ingestion-generation/`
- `.claude/skills/ingestion-generation/`
- `.agents/skills/ingestion-generation/`
- `.github/skills/quiz-workflow/`
- `.claude/skills/quiz-workflow/`
- `.agents/skills/quiz-workflow/`
- `.github/skills/shadcn/`
- `.claude/skills/shadcn/`
- `.agents/skills/shadcn/`
- `.github/skills/tailwind-design-system/`
- `.claude/skills/tailwind-design-system/`
- `.agents/skills/tailwind-design-system/`
- `.github/skills/web-design-guidelines/`
- `.claude/skills/web-design-guidelines/`
- `.agents/skills/web-design-guidelines/`

If you change `SKILL.md`, also update any referenced files under each skill's `references/` directory so all agents load the same guidance.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
