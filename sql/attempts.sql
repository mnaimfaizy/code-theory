-- Table: attempts
-- Generated: 2026-03-30T05:32:06.523Z
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


-- Data: 4 row(s)
INSERT INTO "attempts" ("id", "user_id", "certification_id", "mode", "timed", "time_limit_seconds", "question_count", "score", "passed", "started_at", "completed_at") VALUES ('0a030907-8bcd-4091-a891-f71eb2627e77', 'bceebee1-34a6-4842-86b6-17aa6318e70f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'random', FALSE, NULL, 5, 60, FALSE, '2026-03-27T08:45:06.182Z', '2026-03-27T08:52:05.272Z');
INSERT INTO "attempts" ("id", "user_id", "certification_id", "mode", "timed", "time_limit_seconds", "question_count", "score", "passed", "started_at", "completed_at") VALUES ('4f88d56d-bf06-4d46-bf33-db23e02422e7', 'bceebee1-34a6-4842-86b6-17aa6318e70f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'random', FALSE, NULL, 10, 50, FALSE, '2026-03-28T07:40:46.104Z', '2026-03-28T10:45:52.543Z');
INSERT INTO "attempts" ("id", "user_id", "certification_id", "mode", "timed", "time_limit_seconds", "question_count", "score", "passed", "started_at", "completed_at") VALUES ('f05d33b8-d0b8-40ee-998f-687509af001b', 'bceebee1-34a6-4842-86b6-17aa6318e70f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'random', FALSE, NULL, 5, NULL, NULL, '2026-03-29T07:04:43.521Z', NULL);
INSERT INTO "attempts" ("id", "user_id", "certification_id", "mode", "timed", "time_limit_seconds", "question_count", "score", "passed", "started_at", "completed_at") VALUES ('d09a4db1-3de1-456e-9640-8b8fdd1d1ea0', 'bceebee1-34a6-4842-86b6-17aa6318e70f', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'random', FALSE, NULL, 5, 0, FALSE, '2026-03-29T07:06:03.414Z', '2026-03-29T07:08:52.057Z');
