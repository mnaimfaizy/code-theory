# Code Theory Copilot Instructions

This repository is a certification quiz platform built with Next.js App Router, React 19, TypeScript strict mode, Drizzle ORM, NextAuth credentials auth, Tailwind CSS v4, and shadcn/ui. Prefer small, targeted changes that preserve the existing service-oriented architecture and mobile-first UI patterns.

Trust this file and the docs in `docs/` as the primary source of repository context. Search the codebase or the web only when the instructions or docs are incomplete, outdated, or contradicted by the current implementation.

## Primary references

- Read `docs/ARCHITECTURE.md` for the system layout and layering.
- Read `docs/DEVELOPMENT.md` for local setup, conventions, and core commands.
- Read `docs/DATABASE.md` before changing schema or persistence behavior.
- Read `docs/INGESTION.md` before changing LLM-backed ingestion or generation flows.
- Read `docs/WORKFLOW.md` when changing quiz behavior, moderation, or question lifecycle rules.
- Root `AGENTS.md` also applies in this repository.

## Architecture rules

- Keep business logic in `src/server/services/*`. API routes, pages, and scripts should call services instead of re-implementing logic.
- Keep API routes in `src/app/api/*/route.ts` thin. Parse input, validate it, call a service, and return `NextResponse.json(...)`.
- Use `src/db/schema.ts` and `src/db/index.ts` for persistence concerns. Do not scatter raw database logic throughout the app.
- Put reusable types in `src/types/index.ts` and reuse the existing `@/*` path alias for imports from `src/*`.
- Use Server Components by default. Add or keep client components only when state, effects, event handlers, or browser APIs are actually needed.

## Framework and stack constraints

- This project uses Next.js `16.2.1`, which may differ from older conventions. Before changing framework-specific behavior, routing, metadata, or server/client boundaries, consult the relevant guide in `node_modules/next/dist/docs/` and heed deprecations.
- Authentication is configured in `src/lib/auth.ts` with NextAuth v5 credentials provider. Reuse that setup instead of creating parallel auth flows.
- UI primitives live in `src/components/ui/*`. Prefer existing shadcn/ui-based components and current Tailwind utility patterns over introducing new component libraries.
- Preserve the current visual language unless a task explicitly asks for redesign. The app already uses Geist fonts and a shared header/providers layout.

## Data and domain rules

- Preserve SQLite-first development and PostgreSQL portability. Development defaults to SQLite under `data/`; production can use `DATABASE_URL` with PostgreSQL.
- Keep IDs as text UUIDs and timestamps as ISO strings in the Drizzle schema unless there is a deliberate migration plan.
- Generated questions start as `draft`. Do not make ingestion or generation features bypass the review flow.
- Only approved questions should be selectable for quizzes unless a task explicitly changes that product rule.
- Keep question provenance intact when working on ingestion, generation, or deduplication features.
- When adding schema fields or entities, keep Drizzle relations, cascade behavior, and existing enum patterns consistent with the current schema.

## Validation and coding conventions

- Follow TypeScript strict mode. Avoid `any` unless there is no practical alternative.
- Prefer named exports except where Next.js requires default exports for page or layout modules.
- Validate user input at the boundary. Use Zod for new request, form, or configuration validation work.
- Keep comments sparse and useful. Do not add noise comments.
- Match existing file structure and naming. Prefer editing the nearest relevant service, route, or component instead of introducing duplicate abstractions.

## LLM and ingestion conventions

- Local LLM integration targets an OpenAI-compatible API. Reuse `src/server/services/generation-service.ts` patterns instead of inventing a provider-specific client.
- Relevant environment variables are `LLM_BASE_URL`, `LLM_MODEL`, and `LLM_API_KEY`. Do not hardcode secrets or provider values.
- Ingestion supports URL and file-based sources. If you change supported formats, extraction, chunking, or generation assumptions, update `docs/INGESTION.md`.

## Commands and verification

- Use `npm run dev` for local development.
- Use `npm run lint` as the default verification step after code changes.
- Database commands are `npm run db:push`, `npm run db:generate`, `npm run db:studio`, and `npm run db:seed`.
- CLI entry points live in `scripts/`, especially `scripts/import-source.ts` and `scripts/dedupe-questions.ts`.
- There is no dedicated automated test suite configured in `package.json`. When changing behavior, run lint when possible and describe any manual verification performed or remaining gaps.

## Documentation expectations

- Update the relevant docs in `docs/` when changing architecture, workflow, schema, ingestion behavior, or developer setup.
- If a change affects both UI and CLI flows, verify that shared services still support both entry points.
