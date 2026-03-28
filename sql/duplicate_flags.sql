-- Table: duplicate_flags
-- Generated: 2026-03-28T06:35:32.126Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "duplicate_flags" CASCADE;

CREATE TABLE IF NOT EXISTS "duplicate_flags" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "question_id" TEXT NOT NULL,
  "duplicate_of_id" TEXT NOT NULL,
  "match_type" TEXT NOT NULL,
  "similarity" INTEGER,
  "resolved" BOOLEAN NOT NULL DEFAULT false,
  "resolution" TEXT,
  "created_at" TEXT NOT NULL,
  "resolved_at" TEXT,
  FOREIGN KEY ("duplicate_of_id") REFERENCES "questions" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("question_id") REFERENCES "questions" ("id") ON DELETE CASCADE
);


-- No data
