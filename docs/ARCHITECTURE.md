# Architecture

## System Overview

```
┌─────────────────────────────────────────────────┐
│                   Browser (UI)                  │
│  Next.js App Router · React · Tailwind/shadcn   │
└──────────────────────┬──────────────────────────┘
                       │ Server Actions / API Routes
┌──────────────────────▼──────────────────────────┐
│              Server Service Layer               │
│  quiz · ingestion · generation · dedupe · review │
└──────────────────────┬──────────────────────────┘
                       │ Drizzle ORM
┌──────────────────────▼──────────────────────────┐
│           Database (SQLite / PostgreSQL)         │
└─────────────────────────────────────────────────┘
         ┌─────────────┘
┌────────▼────────┐    ┌──────────────────────┐
│  Terminal CLI    │    │  Local LLM Provider  │
│  scripts/*.ts    │    │  (Ollama / LM Studio)│
└─────────────────┘    └──────────────────────┘
```

## Key Principles

1. **Shared services** — GUI routes and CLI scripts call the same service functions. No duplicated logic.
2. **Dual-dialect runtime** — Local development defaults to SQLite, while production or cPanel can run against PostgreSQL through the same service layer.
3. **Provider-agnostic AI** — The LLM layer targets the OpenAI-compatible API format so any local runtime works.
4. **Mobile-first responsive** — Breakpoints: mobile ≤640px, tablet 641–1024px, desktop ≥1025px.
5. **Draft-by-default** — All auto-generated content requires manual approval before becoming active.

## Directory Layout

```
src/
├── app/                  # Next.js App Router pages & layouts
│   ├── (auth)/           # Sign-in / sign-up routes
│   ├── (app)/            # Protected app routes
│   │   ├── certifications/
│   │   ├── quiz/
│   │   ├── results/
│   │   ├── review/
│   │   └── manage/
│   └── api/              # API routes (if needed)
├── components/
│   ├── ui/               # shadcn/ui primitives
│   ├── quiz/             # Quiz-specific components
│   └── common/           # Shared layout components
├── db/
│   ├── schema.ts         # Runtime-selected Drizzle schema exports
│   ├── schema-sqlite.ts  # SQLite schema definitions
│   ├── schema-postgres.ts # PostgreSQL schema definitions
│   ├── runtime.ts        # DATABASE_URL helpers
│   ├── index.ts          # DB client singleton
│   └── seed.ts           # Demo/seed data
├── server/
│   └── services/         # Business logic services
├── lib/                  # Utilities, auth config, constants
└── types/                # Shared TypeScript types
scripts/                  # Terminal CLI entry points
docs/                     # Project documentation
```
