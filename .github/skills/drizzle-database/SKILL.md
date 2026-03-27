---
name: drizzle-database
description: Work safely on Drizzle ORM schema, relations, queries, and database configuration in this repository. Use when the task affects `src/db/schema.ts`, `src/db/index.ts`, Drizzle configuration, schema evolution, relations, or persistence logic that depends on SQLite/PostgreSQL portability. Preserve the repo's conventions for text UUIDs, ISO timestamps, enum-like text fields, and SQLite-first development.
argument-hint: schema file, relation, query, or database change
---

Sync note: this skill is mirrored in `.github/skills/drizzle-database/`, `.claude/skills/drizzle-database/`, and `.agents/skills/drizzle-database/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Drizzle Database

Use this skill for schema, relation, migration, and persistence work specific to Drizzle in this repository.

## Workflow

### 1. Read the current database shape first

Before changing persistence behavior, inspect the schema and then read [repo Drizzle notes](./references/code-theory-drizzle.md).

The primary files are:

- `docs/DATABASE.md`
- `src/db/schema.ts`
- `src/db/index.ts`
- `drizzle.config.ts`
- nearby services that read or write the affected entities

### 2. Preserve repo-level persistence conventions

Unless the task explicitly changes them, keep these conventions intact:

- IDs are text UUIDs
- timestamps are ISO strings in the schema
- SQLite is the default development database
- PostgreSQL portability should not be broken casually
- relations and cascade behavior should stay explicit and coherent
- enum-like fields remain consistent with the existing text enum pattern

Do not introduce mixed ID formats, inconsistent timestamp handling, or database-specific shortcuts that make portability worse.

### 3. Treat schema changes as domain changes

When editing the schema:

- update relations alongside new foreign keys
- check affected services, types, and workflow assumptions
- keep naming aligned with existing tables and fields
- think through cascade behavior and nullability

If a field changes business behavior, follow that through the service layer instead of stopping at the schema.

### 4. Keep queries and persistence logic close to the existing architecture

This project keeps database access in the shared data layer and service layer.

- prefer `src/db/schema.ts` and `src/db/index.ts` for persistence structure
- keep routes thin and call services
- avoid scattering raw SQL or duplicate query logic across the app
- keep query shapes understandable and type-safe

### 5. Verify operational impact

After changes, check that:

- schema and relations still model the domain correctly
- persistence changes do not break SQLite-first local development
- PostgreSQL portability is still reasonable
- affected services still read and write the expected shapes
- required database commands are identified when schema changes are introduced

## Output expectations

When this skill is active, favor schema integrity, portability, and consistency with existing Drizzle patterns over fast one-off data changes.

If a task needs a migration plan, include the schema impact, service impact, and any required `db:*` follow-up commands.
