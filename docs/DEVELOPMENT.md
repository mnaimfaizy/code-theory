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
npm run db:push               # create local database (SQLite by default)
npm run db:seed               # seed demo data
npm run dev                   # http://localhost:3000
```

## Optional Local PostgreSQL Stack

If you want to run the app or test the generated SQL files against PostgreSQL locally, start the included Docker Compose stack:

```bash
docker compose up -d
```

Services:

- PostgreSQL: `localhost:5432`
- pgAdmin: `http://localhost:5050`

Default local credentials:

```env
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory
PGADMIN_DEFAULT_EMAIL=admin@codetheory.dev
PGADMIN_DEFAULT_PASSWORD=code_theory_admin
```

To stop the stack:

```bash
docker compose down
```

To run the app locally against PostgreSQL instead of SQLite:

```bash
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:push
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:seed
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run dev
```

## Scripts

| Command                              | Description                                                 |
| ------------------------------------ | ----------------------------------------------------------- |
| `npm run dev`                        | Start dev server with Turbopack                             |
| `npm run build`                      | Production build                                            |
| `npm run build:cpanel`               | Build and prepare the FTP bundle for cPanel                 |
| `npm run start`                      | Start production server                                     |
| `npm run lint`                       | Run ESLint                                                  |
| `npm run db:push`                    | Push schema to database                                     |
| `npm run db:studio`                  | Open Drizzle Studio                                         |
| `npm run db:seed`                    | Seed demo data                                              |
| `npm run db:generate`                | Generate migration files                                    |
| `npm run db:export`                  | Export SQLite tables to root `sql/` as PostgreSQL SQL files |
| `npm run db:apply-sql`               | Apply root `sql/` files to a PostgreSQL database            |
| `npm run db:migrate-sql`             | Alias for `db:apply-sql` with guarded `users` handling      |
| `npm run deploy:prepare-cpanel`      | Assemble `.deploy/cpanel/` from the standalone build        |
| `npm run questions:export-review`    | Export an existing certification to a temp review artifact  |
| `npm run questions:validate-review`  | Validate a review artifact before apply                     |
| `npm run questions:reconcile-review` | Refresh a stale review artifact onto a fresh export         |
| `npm run questions:apply-review`     | Apply reviewed question updates from a temp artifact        |
| `npm run questions:import-approved`  | Import a human-approved generated question artifact         |

`DATABASE_URL` selects the active database target for the app and Drizzle commands:

- omit it, or use a `file:` path, to use SQLite
- use a `postgres://` or `postgresql://` URL to use PostgreSQL

The `db:export` script remains SQLite-sourced and writes PostgreSQL-compatible SQL files into the root `sql/` directory.

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
npm run db:migrate-sql
npm run db:migrate-sql -- all
npm run db:migrate-sql -- users certifications
```

The apply step reads the root `sql/` directory and executes one table file at a time against PostgreSQL.
When the `users` table is included, the migration strips destructive `DROP`, `TRUNCATE`, and `DELETE` statements and rewrites inserts to `ON CONFLICT DO NOTHING` so existing users are preserved.

With the Docker Compose stack running, you can test the generated SQL files locally with:

```bash
DATABASE_URL=postgres://code_theory:code_theory@localhost:5432/code_theory npm run db:migrate-sql
```

### cPanel FTP Bundle

Prepare the standalone deployment bundle that is intended for cPanel shared hosting:

```bash
npm run build:cpanel
```

This writes a ready-to-upload bundle into `.deploy/cpanel/` with:

- the Next.js standalone server output
- copied `.next/static` assets
- copied `public/` assets
- an `app.js` Passenger-friendly startup file
- `tmp/restart.txt` so a fresh upload can trigger an app restart

The GitHub Actions workflow uses a build-time placeholder SQLite `DATABASE_URL` so `next build` can complete without a live production database. The deployed cPanel application itself should still use a PostgreSQL `DATABASE_URL` configured in cPanel.

### GitHub Actions

The repository ships two workflows under `.github/workflows/`:

- `ci.yml` prepares dependencies once, saves a cache for `node_modules` and `~/.npm`, restores and saves `.next/cache` for the build job, runs lint and test jobs in parallel, and runs `npm run build` only after `prepare`, `lint`, and `test` finish.
- `deploy-cpanel.yml` builds the standalone cPanel bundle and deploys it over FTPS.

There is currently no dedicated `test` script in `package.json`, so the CI workflow reports that tests are skipped until one is added.

### Question Review Artifacts

Export an existing certification into a temp JSON artifact for batch review:

```bash
npm run questions:export-review -- --cert-slug react-fundamentals --batch-size 20
npm run questions:export-review -- --cert-id <uuid> --out temp/react-fundamentals-review.json
```

The export includes question ids, option ids, current question content, and batch metadata so an agent can prune unchanged questions and keep only actionable updates.

Apply an approved review artifact back to the database:

```bash
npm run questions:validate-review -- --file tmp/react-fundamentals-question-review-20260331-120000.json
npm run questions:apply-review -- --file tmp/react-fundamentals-question-review-20260331-120000.json
npm run questions:apply-review -- --file temp/react-fundamentals-review.json --remove-file
```

If the artifact is stale, reconcile it onto a fresh export before retrying apply:

```bash
npm run questions:reconcile-review -- --file tmp/react-fundamentals-question-review-20260331-120000.json
npm run questions:apply-review -- --file tmp/react-fundamentals-question-review-20260331-120000-reconciled.json
```

The apply step refuses to overwrite drifted questions, and the validation step catches option-id drift before you hit the apply command.

## Project Structure

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full directory layout.

## Conventions

- **TypeScript strict mode** — no `any` unless unavoidable.
- **Server-first** — prefer Server Components and Server Actions over client-side fetching.
- **Mobile-first CSS** — write base styles for small screens, add breakpoints for larger ones.
- **Zod validation** — validate all user inputs at the boundary with Zod schemas.
- **Named exports** — prefer named exports over default exports except for page/layout components.
