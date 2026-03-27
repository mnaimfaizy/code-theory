# Code Theory Drizzle Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.claude/skills/drizzle-database/references/` and `.agents/skills/drizzle-database/references/`.

Use these notes when applying the `drizzle-database` skill in this repository.

## Current database strategy

- Development defaults to SQLite via `better-sqlite3`
- Production can switch via `DATABASE_URL` to PostgreSQL
- Drizzle is the ORM and `src/db/schema.ts` is the main schema source of truth

## Current conventions

- primary keys are text UUIDs
- timestamps are stored as ISO strings with `.$defaultFn(() => new Date().toISOString())`
- booleans in SQLite use integer columns with `{ mode: "boolean" }`
- enum-like fields use text columns with explicit enum arrays
- relations are declared with `relations(...)`

## Important files

- schema: `src/db/schema.ts`
- database entry point: `src/db/index.ts`
- Drizzle config: `drizzle.config.ts`
- docs: `docs/DATABASE.md`

## Safe change rules

- update relations when adding or changing foreign keys
- preserve cascade behavior intentionally, not accidentally
- do not break SQLite-first local development for convenience
- keep service-layer assumptions in sync with schema changes
- if schema changes are introduced, expect follow-up commands such as `npm run db:generate` or `npm run db:push`

## Watchouts

- mixed timestamp conventions
- introducing numeric IDs into a text UUID schema
- forgetting relation updates when adding new entities
- making PostgreSQL-only assumptions in shared schema code
