# Development

## Prerequisites

- Node.js 20+
- npm 10+
- (Optional) Ollama or LM Studio for question generation

## Local Setup

```bash
git clone <repo-url> && cd code-theory
npm install
cp .env.example .env.local   # edit as needed
npm run db:push               # create SQLite database
npm run db:seed               # seed demo data
npm run dev                   # http://localhost:3000
```

## Scripts

| Command               | Description                     |
| --------------------- | ------------------------------- |
| `npm run dev`         | Start dev server with Turbopack |
| `npm run build`       | Production build                |
| `npm run start`       | Start production server         |
| `npm run lint`        | Run ESLint                      |
| `npm run db:push`     | Push schema to database         |
| `npm run db:studio`   | Open Drizzle Studio             |
| `npm run db:seed`     | Seed demo data                  |
| `npm run db:generate` | Generate migration files        |
| `npm run db:export`   | Export SQLite tables to root `sql/` as PostgreSQL SQL files |
| `npm run db:apply-sql`| Apply root `sql/` files to a PostgreSQL database |

### PostgreSQL SQL Exports

Generate PostgreSQL-compatible SQL files from the local SQLite database into the root `sql/` directory:

```bash
npm run db:export
npm run db:export -- all
npm run db:export -- users certifications
```

The exporter removes existing `sql/*.sql` files before writing the new output so the directory always reflects the latest export request.

### Applying SQL To PostgreSQL

After generating the SQL files, point `DATABASE_URL` at a PostgreSQL database and apply them in foreign-key-safe order:

```bash
npm run db:apply-sql
npm run db:apply-sql -- all
npm run db:apply-sql -- users certifications
```

The apply step reads the root `sql/` directory and executes one table file at a time against PostgreSQL.

## Project Structure

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full directory layout.

## Conventions

- **TypeScript strict mode** — no `any` unless unavoidable.
- **Server-first** — prefer Server Components and Server Actions over client-side fetching.
- **Mobile-first CSS** — write base styles for small screens, add breakpoints for larger ones.
- **Zod validation** — validate all user inputs at the boundary with Zod schemas.
- **Named exports** — prefer named exports over default exports except for page/layout components.
