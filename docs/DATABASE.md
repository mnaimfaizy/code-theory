# Database

## Strategy

- **Local default**: SQLite via `better-sqlite3` when `DATABASE_URL` is omitted or points at a file path.
- **Production or cPanel runtime**: PostgreSQL when `DATABASE_URL` is a `postgres://` or `postgresql://` connection string.
- **ORM**: Drizzle ORM with runtime-selected schema exports in `src/db/schema.ts`, backed by dialect-specific definitions in `src/db/schema-sqlite.ts` and `src/db/schema-postgres.ts`.
- **Migration tooling**: The repository still ships SQLite-to-PostgreSQL export and apply scripts under `sql/` for moving existing data into PostgreSQL.

## Runtime Selection

The application and Drizzle config choose the active database target from `DATABASE_URL`:

- no `DATABASE_URL`, or a `file:` value, uses SQLite
- a `postgres://` or `postgresql://` value uses PostgreSQL

That means local development can stay SQLite-first, while deployed environments such as cPanel can run against PostgreSQL without a separate service layer.

## Core Entities

```
users
├── id (text PK)
├── name
├── email (unique)
├── password_hash
└── created_at

certifications
├── id (text PK)
├── title
├── slug (unique)
├── description
├── icon
├── time_limit_minutes (nullable — null means untimed available)
├── passing_score (default 70)
├── created_by → users.id
├── created_at
└── updated_at

questions
├── id (text PK)
├── certification_id → certifications.id
├── text
├── explanation
├── difficulty (easy | medium | hard)
├── status (draft | approved | rejected)
├── source_id → question_sources.id (nullable)
├── order_index
├── created_at
└── updated_at

question_options
├── id (text PK)
├── question_id → questions.id
├── text
├── is_correct (boolean)
└── order_index

question_sources
├── id (text PK)
├── certification_id → certifications.id
├── source_type (url | file)
├── source_ref (URL or filename)
├── raw_content (text)
├── chunk_count
├── created_at
└── processed_at

attempts
├── id (text PK)
├── user_id → users.id
├── certification_id → certifications.id
├── mode (fixed | random)
├── timed (boolean)
├── time_limit_seconds
├── question_count
├── score
├── passed (boolean)
├── started_at
└── completed_at

attempt_answers
├── id (text PK)
├── attempt_id → attempts.id
├── question_id → questions.id
├── selected_option_id → question_options.id (nullable)
├── is_correct (boolean)
└── answered_at
```

## Portability Notes

- All IDs are UUIDs stored as `text` — works identically in SQLite and PostgreSQL.
- Timestamps are stored as ISO 8601 text in both dialect-specific schema modules so service-layer shapes stay consistent across environments.
- Boolean columns use integer (0/1) in SQLite, native boolean in PostgreSQL.
- Drizzle handles these differences transparently via its driver abstraction.

## Rich Question Content

- Question text, explanations, and option text are stored in existing text columns and may contain markdown.
- The UI renders paragraphs, inline code, short lists, and fenced code blocks from those fields.
- Because rich question content is presentation-focused rather than relational data, the current schema does not need extra tables or JSON columns for code snippets and examples.
- If future requirements need structured per-question citations or reusable example fragments, extend the schema deliberately rather than duplicating markdown content into separate fields.

## Exporting PostgreSQL SQL Files

Use the SQL export script to generate PostgreSQL-compatible table files from the local SQLite database into the root `sql/` directory:

```bash
npm run db:export
npm run db:export -- all
npm run db:export -- users question_sources questions
```

Each run deletes previously generated `sql/*.sql` files first, then writes one `.sql` file per requested table.

Even though the files are generated in a PostgreSQL-friendly format, the repository now ships apply scripts for both targets:

- `npm run db:migrate-sql` applies the files into PostgreSQL
- `npm run db:migrate-sqlite` applies the same files back into SQLite

## Applying Generated SQL To PostgreSQL

Once the SQL files exist, set `DATABASE_URL` to a PostgreSQL connection string and apply them in order:

```bash
npm run db:migrate-sql
npm run db:migrate-sql -- all
npm run db:migrate-sql -- users certifications
```

The migration script expects the generated files to exist under the root `sql/` directory and executes each requested table file sequentially against PostgreSQL.
Each table runs inside its own transaction.

### `users` table guard

When `users.sql` is applied, the migration adds a protection layer before executing the file:

- `DROP TABLE IF EXISTS "users" CASCADE;` is removed
- `TRUNCATE TABLE "users" ...;` is removed
- `DELETE FROM "users" ...;` is removed
- each `INSERT INTO "users" ...;` becomes `INSERT INTO "users" ... ON CONFLICT DO NOTHING;`

That means the script can create the `users` table if it does not exist yet, but it will not wipe or overwrite users that already exist in the target PostgreSQL database.

## Applying Generated SQL To SQLite

If you want to rebuild or clone a SQLite database from the generated `sql/` files, point `DATABASE_URL` at a SQLite file path and apply them with:

```bash
npm run db:migrate-sqlite
DATABASE_URL=file:./data/ npm run db:migrate-sqlite
DATABASE_URL=file:./data/custom-import.db npm run db:migrate-sqlite -- users certifications
```

The SQLite apply script expects the same root `sql/` directory used by the PostgreSQL workflow.
Because those files contain PostgreSQL-style `DROP TABLE ... CASCADE` statements, the script normalizes that syntax for SQLite before execution.

Implementation details:

- foreign keys are temporarily disabled during import so referenced parent tables can be dropped and recreated safely
- each requested table file is executed inside one surrounding SQLite transaction
- the script runs `PRAGMA foreign_key_check` before commit and aborts on integrity violations
- when no file name is provided, the target database name defaults to `code-theory.db`
- omitting `DATABASE_URL` uses `data/code-theory.db`
- setting `DATABASE_URL=file:./some-directory/` also resolves to `some-directory/code-theory.db`
- setting `DATABASE_URL` to a full file path such as `file:./data/custom-import.db` uses that explicit file name instead

## Local PostgreSQL Test Stack

The repository includes a root `docker-compose.yml` for local PostgreSQL and pgAdmin so you can run the app or test the generated SQL files without installing PostgreSQL directly on your machine.

Start the stack:

```bash
docker compose up -d
```

Local connection details:

```env
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory
```

pgAdmin is available at `http://localhost:5050` with:

```text
Email: admin@codetheory.dev
Password: code_theory_admin
```

Once the stack is running, you can export from SQLite and apply into PostgreSQL with:

```bash
npm run db:export
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:migrate-sql
```

You can also run the application directly against PostgreSQL:

```bash
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:push
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:seed
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run dev
```
