-- Table: certifications
-- Generated: 2026-03-28T06:55:26.986Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "certifications" CASCADE;

CREATE TABLE IF NOT EXISTS "certifications" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "slug" TEXT NOT NULL,
  "description" TEXT,
  "icon" TEXT,
  "time_limit_minutes" INTEGER,
  "passing_score" INTEGER NOT NULL DEFAULT 70,
  "created_by" TEXT,
  "created_at" TEXT NOT NULL,
  "updated_at" TEXT NOT NULL,
  FOREIGN KEY ("created_by") REFERENCES "users" ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "certifications_slug_unique" ON "certifications" ("slug");

-- Data: 3 row(s)
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Junior React Developer', 'junior-react-developer', 'Test your foundational React knowledge — components, props, state, JSX, and basic hooks.', 'Code2', 30, 70, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.044Z', '2026-03-27T07:37:11.044Z');
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('e051f9ba-375a-425b-bbf2-7c5145b8cce7', 'Mid-level React Developer', 'mid-level-react-developer', 'Intermediate React concepts — context, reducers, custom hooks, performance optimization, and patterns.', 'Layers', 45, 75, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.045Z', '2026-03-27T07:37:11.045Z');
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'JavaScript Fundamentals', 'javascript-fundamentals', 'Core JavaScript — types, closures, prototypes, async/await, and ES6+ features.', 'FileCode', 25, 70, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.046Z', '2026-03-27T07:37:11.046Z');
