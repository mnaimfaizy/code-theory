# Deployment

## Supported Hosting Path

This repository can be deployed to cPanel shared hosting when the host exposes the Node.js App or Application Manager feature.
The deployment flow in this repo is built around three constraints:

1. cPanel runs Node.js apps behind Passenger and expects an application root plus a startup file.
2. FTP or FTPS is the transport for code updates.
3. the deployed application should use PostgreSQL through `DATABASE_URL`.

The supported deployment flow is therefore:

```text
next build (standalone) -> prepare .deploy/cpanel/ -> FTP sync to cPanel app root -> Passenger starts app.js -> restart via tmp/restart.txt
```

## Official Guidance Behind This Flow

This repository's cPanel deployment path follows the current official guidance from both Next.js and cPanel:

- Next.js recommends `output: "standalone"` for self-hosted deployments when you want a minimal traced runtime bundle.
- Next.js documents that standalone output should be started with `node .next/standalone/server.js`, not `next start`.
- Next.js also documents that `public/` and `.next/static/` are not copied into the standalone folder automatically and must be copied manually if the same server should serve them.
- Next.js self-hosting guidance recommends running behind a reverse proxy. cPanel's Node.js App / Passenger model provides that reverse-proxy layer, so the app should not try to own a public port directly.
- cPanel's official Passenger and Application Manager guidance expects a startup file such as `app.js`, manages the external HTTP port itself, and supports restarts via `tmp/restart.txt`.

For this repo, that means:

- keep `output: "standalone"`
- upload the prepared `.deploy/cpanel/` bundle instead of raw source files
- let Passenger start `app.js`, which delegates to the traced standalone server
- keep `public/`, `.next/static/`, and `.next/node_modules/` wrapper modules in the prepared bundle

## Best Practices

- Keep the cPanel Node.js major version aligned with the Node.js major version used in CI or local production builds.
- Prefer building once and deploying the resulting standalone artifact rather than rebuilding different outputs per environment.
- Keep runtime secrets and the real `DATABASE_URL` out of the build pipeline. Configure them in cPanel.
- Treat Passenger as the reverse proxy and process manager. Do not hardcode a public port or add an extra custom Node server layer.
- Use request-time rendering for pages that must reflect runtime-only data sources or runtime environment variables.
- Restart the Passenger app explicitly after uploads, dependency changes, or environment-variable changes.

## Prerequisites

- cPanel hosting with Node.js App or Application Manager enabled
- FTP or FTPS access to the same account
- a reachable PostgreSQL database
- a Node.js version in cPanel that matches the build environment major version
- enough disk space for the standalone Next.js bundle and traced runtime dependencies

Server-level prerequisites from cPanel's official Node.js documentation:

- Application Manager must be enabled by the host
- Passenger support must be installed by the host
- a supported EasyApache Node.js package such as `ea-nodejs20` should be installed by the host
- the Apache env module used for application environment variables should be installed by the host

Important notes for this repository:

- Passenger manages the HTTP port for the app. Do not hardcode a public port in the deployment flow.
- Runtime secrets and `DATABASE_URL` belong in cPanel, not in GitHub Actions.
- If your PostgreSQL provider requires SSL or other connection parameters, include them directly in `DATABASE_URL`.
- The build pipeline may use a placeholder SQLite `DATABASE_URL`, but runtime data pages that must read PostgreSQL content need request-time rendering rather than build-time prerendering.

## One-Time cPanel Setup

Create the application in cPanel before the first deploy.

Recommended settings:

- Node.js version: `20` if you keep the provided GitHub Actions workflow unchanged
- Application mode: `production`
- Application root: a directory under your cPanel home, for example `nodeapps/code-theory`
- Application URL: your chosen domain or subpath
- Startup file: `app.js`

Use `app.js` as the startup file even though Next.js emits `server.js`. The deploy bundle creates an `app.js` wrapper so the setup remains compatible with cPanel's default Passenger expectations.

This matches cPanel's documented Passenger convention that an `app.js` startup file is the default expected entrypoint unless the host configures a custom startup file.

## PostgreSQL Setup

Create the PostgreSQL database and user through your host or managed PostgreSQL provider.
Then set the cPanel application environment variables to point at that database:

```env
NODE_ENV=production
AUTH_SECRET=replace-with-a-long-random-string
AUTH_URL=https://your-domain.example
DATABASE_URL=postgres://user:password@host:5432/code_theory
LLM_BASE_URL=http://127.0.0.1:11434/v1
LLM_MODEL=llama3
LLM_API_KEY=ollama
```

If you do not use local LLM-backed ingestion in production, you can omit the `LLM_*` variables.

### Fresh Schema Setup

From any machine that can reach the PostgreSQL server and has the full development toolchain installed, you can initialize the schema with:

```bash
DATABASE_URL=postgres://user:password@host:5432/code_theory npm run db:push
```

For cPanel or any runtime-only deployment where dependencies are installed with `npm ci --omit=dev`, do not use `db:push`.
That command depends on `drizzle-kit`, which is intentionally a development dependency.
Instead, upload the bundled `sql/` directory and apply it with the production-safe runner after installing runtime dependencies:

```bash
DATABASE_URL=postgres://user:password@host:5432/code_theory npm run db:migrate-sql
```

That path works from the deployed app root because the cPanel bundle now ships `sql/` plus `scripts/apply-pg-sql.mjs`.

If you want demo content in that PostgreSQL database, you can then run:

```bash
DATABASE_URL=postgres://user:password@host:5432/code_theory npm run db:seed
```

### Migrating Existing SQLite Data

If you already have local SQLite data that should be moved into PostgreSQL:

```bash
npm run db:export
DATABASE_URL=postgres://user:password@host:5432/code_theory npm run db:migrate-sql
```

The `users` table is guarded during this import so existing PostgreSQL users are not dropped or overwritten.

## Build Artifact For cPanel

Run the cPanel build locally or in CI:

```bash
npm run build:cpanel
```

This produces `.deploy/cpanel/` with:

- the Next.js standalone server output
- the required `.next/static` assets copied into place
- the `public/` directory copied into place
- the root `sql/` directory for PostgreSQL imports in production
- `scripts/apply-pg-sql.mjs` as a runtime-safe PostgreSQL SQL importer
- `package.json` and `package-lock.json` for server-side dependency installation
- `CPANEL_README.md` with the server-side runbook for the Ops team
- `app.js` as the Passenger entrypoint
- `tmp/restart.txt` as a restart trigger file

The deploy bundle intentionally excludes the top-level `node_modules/`.
After upload, install production dependencies on the server in the application root with `npm ci --omit=dev` before restarting the app.
If PostgreSQL schema or data import is still required at that point, run `npm run db:migrate-sql` from the deployed app root.

This layout is intentionally close to the official Next standalone pattern:

- traced server files come from `.next/standalone`
- static assets are copied into `.next/static`
- public assets are copied into `public/`
- the app is started through the generated standalone server, wrapped by `app.js` for Passenger

Upload the contents of `.deploy/cpanel/` to the cPanel application root, not to the repo root and not to a public document root unless that directory is also the Node.js application root.

## Manual FTP Deployment

Use this flow for the first deployment or whenever you want a fully manual release.

1. Build the bundle locally with `npm run build:cpanel`.
2. Open your FTP client and enable hidden files, because the bundle contains a `.next/` directory.
3. Upload the contents of `.deploy/cpanel/` into the cPanel application root.
4. Verify that `app.js`, `server.js`, `.next/`, `public/`, `sql/`, `scripts/apply-pg-sql.mjs`, `package.json`, and `tmp/restart.txt` exist in the application root after upload.
5. Install runtime dependencies in the application root with `npm ci --omit=dev`.
6. If PostgreSQL schema or data import is required from the bundled SQL files, run `npm run db:migrate-sql` in the application root.
7. Restart the application from cPanel. If the app is already running, uploading a fresh `tmp/restart.txt` usually triggers Passenger to reload it.

If the file upload finishes but the site still serves the old version, use the cPanel restart button explicitly and inspect the application log directory that cPanel exposes for the Node.js app.

## GitHub Actions FTP Deployment

This repository now includes `.github/workflows/deploy-cpanel.yml`.

What it does:

- runs on pushes to `main`
- also supports manual `workflow_dispatch`
- pins every referenced third-party action to a full commit SHA
- sets least-privilege workflow permissions with `contents: read`
- splits the pipeline into dependent `build` and `deploy` jobs
- restores and saves `.next/cache` in the `build` job so repeated deploy builds can reuse the Next.js build cache
- installs dependencies with `npm ci`, verifies that `package-lock.json` stays unchanged, and then runs `npm run lint` and `npm run build:cpanel` in the `build` job
- uploads the generated bundle as a workflow artifact from the `build` job, including hidden files such as `.next/`
- downloads that artifact and syncs `.deploy/cpanel/` to cPanel over FTPS in the `deploy` job using `SamKirkland/FTP-Deploy-Action`
- excludes only the top-level `node_modules/` from upload, while keeping `.next/node_modules/` runtime wrappers that the standalone server still needs

Add these repository secrets before enabling the workflow:

- `CPANEL_FTP_SERVER`: FTP or FTPS hostname
- `CPANEL_FTP_USERNAME`: FTP username
- `CPANEL_FTP_PASSWORD`: FTP password
- `CPANEL_FTP_SERVER_DIR`: remote application root as seen by FTP, with a trailing `/`

Operational notes:

- The workflow defaults to `ftps` on port `21`. If your host only provides plain FTP or uses another port, update the workflow to match the host.
- The deploy bundle excludes the top-level `node_modules`, but it still keeps `.next/node_modules` because Next standalone output may reference hashed external wrapper modules from there at runtime.
- In this repository, those `.next/node_modules/*` entries are materialized into portable wrapper modules during bundle preparation so they survive ZIP/artifact/FTP transport even when the original standalone output used symlinks.
- The deploy bundle also includes `sql/` and `scripts/apply-pg-sql.mjs` so the server can run `npm run db:migrate-sql` after `npm ci --omit=dev`.
- After upload, install runtime dependencies on the server with `npm ci --omit=dev`.
- The workflow uses a build-time placeholder SQLite `DATABASE_URL` only so `next build` can complete without access to the live production database. The deployed cPanel application must still use the PostgreSQL `DATABASE_URL` configured in cPanel.
- If a page must reflect runtime PostgreSQL data but the build runs against a placeholder database, that page must opt into request-time rendering. In Next.js 16, `connection()` is the recommended way to do that when no other Request-time API is involved.
- Keep the workflow Node.js major version aligned with the version selected in cPanel.

The manual dispatch input `dry_run` lets you test the FTP sync plan without uploading files.

## SQL Migration Utility

If you are moving an existing local SQLite dataset into the PostgreSQL database that cPanel will use, generate and apply the SQL files with:

```bash
npm run db:export
DATABASE_URL=postgres://user:password@host:5432/code_theory npm run db:migrate-sql
```

The `users` table is guarded during this migration:

- existing users are never dropped
- destructive `TRUNCATE` or `DELETE` statements are ignored
- imported users use `ON CONFLICT DO NOTHING`

That makes the script safe for environments where user accounts already exist and must survive subsequent migrations.

## Troubleshooting

- If the app crashes immediately after deployment, confirm the cPanel Node.js version matches the version used to build the bundle.
- If the upload succeeds but the app does not refresh, restart it in cPanel and then verify that `tmp/restart.txt` changed on the server.
- If the server reports `Could not find a production build in the './.next' directory`, verify that the deployed app root contains `.next/BUILD_ID` and `.next/server/`. In the GitHub Actions path, the build artifact must be uploaded with hidden files included so `.next/` is preserved between the `build` and `deploy` jobs.
- If the server reports `Failed to load external module pg-...` or another hashed external module name, verify that `.next/node_modules/` was deployed. Those wrapper modules are generated by Next standalone output and must not be filtered out with a broad `**/node_modules/**` exclusion rule.
- If production connects to PostgreSQL correctly but a page still shows empty build-time data, check whether that route was prerendered during `next build`. For runtime-only data, opt the route into request-time rendering with `connection()` or another Request-time API.
- If the app cannot connect to PostgreSQL, verify the `DATABASE_URL` host, port, credentials, SSL parameters, and network access from cPanel to the database server.
- If manual FTP uploads appear incomplete, make sure your FTP client is configured to show and upload dot-directories such as `.next/`.
- If Passenger logs a startup-file error, keep the configured startup file as `app.js` and upload the generated wrapper from `.deploy/cpanel/app.js`.

## References

- https://nextjs.org/docs/app/api-reference/config/next-config-js/output
- https://nextjs.org/docs/app/guides/self-hosting
- https://nextjs.org/docs/app/api-reference/functions/connection
- https://docs.cpanel.net/cpanel/software/application-manager/
- https://docs.cpanel.net/knowledge-base/web-services/how-to-install-a-node.js-application/
