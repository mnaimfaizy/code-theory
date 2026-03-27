# Deployment

## Local-First (Default)

This application is designed primarily for local personal use.

### Running Locally

```bash
npm install
cp .env.example .env.local
npm run db:push
npm run db:seed
npm run dev
```

The app runs at `http://localhost:3000` with SQLite — no external services required.

### Building for Local Production

```bash
npm run build
npm run start
```

## Optional: PostgreSQL

To switch from SQLite to PostgreSQL:

1. Install and start PostgreSQL locally or use a cloud instance.
2. Set `DATABASE_URL` in `.env.local`:
   ```env
   DATABASE_URL=postgres://user:password@localhost:5432/code_theory
   ```
3. Run `npm run db:push` to create tables in PostgreSQL.
4. Run `npm run db:seed` if you want demo data.

## Optional: Hosting

If you decide to host the app later:

1. **Platform**: Vercel, Railway, or any Node.js host.
2. **Database**: Use a managed PostgreSQL instance (Neon, Supabase, Railway).
3. **Environment**: Set all `.env` variables in the hosting platform's settings.
4. **Build**: The standard `npm run build` output works with any Node.js host.

No queues, object storage, or distributed infrastructure are needed for v1.
