-- Table: users
-- Generated: 2026-04-13T05:48:40.392Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "users" CASCADE;

CREATE TABLE IF NOT EXISTS "users" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "password_hash" TEXT NOT NULL,
  "created_at" TEXT NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS "users_email_unique" ON "users" ("email");

-- Data: 1 row(s)
INSERT INTO "users" ("id", "name", "email", "password_hash", "created_at") VALUES ('bceebee1-34a6-4842-86b6-17aa6318e70f', 'Admin', 'admin@codetheory.local', '$2b$12$CAvyWO./PldkrIesSmSYIuLngomvXHDIF9EL.d.IsLv/Whthds662', '2026-03-27T07:37:11.034Z');
