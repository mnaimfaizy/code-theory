# Database

## Strategy

- **Development**: SQLite via `better-sqlite3` — zero-config, single file at `./data/code-theory.db`.
- **Production**: PostgreSQL — switch by setting `DATABASE_URL` to a `postgres://` connection string.
- **ORM**: Drizzle ORM with a shared schema that works for both drivers.

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
- Timestamps use ISO 8601 text in SQLite, `timestamp` type in PostgreSQL.
- Boolean columns use integer (0/1) in SQLite, native boolean in PostgreSQL.
- Drizzle handles these differences transparently via its driver abstraction.

## Exporting PostgreSQL SQL Files

Use the SQL export script to generate PostgreSQL-compatible table files from the local SQLite database into the root `sql/` directory:

```bash
npm run db:export
npm run db:export -- all
npm run db:export -- users question_sources questions
```

Each run deletes previously generated `sql/*.sql` files first, then writes one `.sql` file per requested table.

## Applying Generated SQL To PostgreSQL

Once the SQL files exist, set `DATABASE_URL` to a PostgreSQL connection string and apply them in order:

```bash
npm run db:apply-sql
npm run db:apply-sql -- all
npm run db:apply-sql -- users certifications
```

The apply script expects the generated files to exist under the root `sql/` directory and executes each requested table file sequentially against PostgreSQL.

## Local PostgreSQL Test Stack

The repository includes a root `docker-compose.yml` for local PostgreSQL and pgAdmin so you can test the generated SQL files without installing PostgreSQL directly on your machine.

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
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:apply-sql
```
