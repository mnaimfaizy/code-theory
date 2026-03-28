-- Table: attempts
-- Generated: 2026-03-28T06:55:27.011Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "attempts" CASCADE;

CREATE TABLE IF NOT EXISTS "attempts" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "user_id" TEXT NOT NULL,
  "certification_id" TEXT NOT NULL,
  "mode" TEXT NOT NULL DEFAULT 'random',
  "timed" BOOLEAN NOT NULL DEFAULT false,
  "time_limit_seconds" INTEGER,
  "question_count" INTEGER NOT NULL,
  "score" INTEGER,
  "passed" BOOLEAN,
  "started_at" TEXT NOT NULL,
  "completed_at" TEXT,
  FOREIGN KEY ("certification_id") REFERENCES "certifications" ("id"),
  FOREIGN KEY ("user_id") REFERENCES "users" ("id")
);


-- Data: 1 row(s)
INSERT INTO "attempts" ("id", "user_id", "certification_id", "mode", "timed", "time_limit_seconds", "question_count", "score", "passed", "started_at", "completed_at") VALUES ('0a030907-8bcd-4091-a891-f71eb2627e77', 'bceebee1-34a6-4842-86b6-17aa6318e70f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'random', FALSE, NULL, 5, 60, FALSE, '2026-03-27T08:45:06.182Z', '2026-03-27T08:52:05.272Z');
