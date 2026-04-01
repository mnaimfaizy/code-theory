-- Table: certifications
-- Generated: 2026-04-01T07:58:19.268Z
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

-- Data: 4 row(s)
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'Junior React Developer', 'junior-react-developer', 'Test your foundational React knowledge — components, props, state, JSX, and basic hooks.', 'Code2', 30, 70, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.044Z', '2026-03-27T07:37:11.044Z');
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('e051f9ba-375a-425b-bbf2-7c5145b8cce7', 'Mid-level React Developer', 'mid-level-react-developer', 'Intermediate React concepts — context, reducers, custom hooks, performance optimization, and patterns.', 'Layers', 45, 75, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.045Z', '2026-03-27T07:37:11.045Z');
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('7001f806-ee7e-41d6-bd31-7ee6c9b80096', 'JavaScript Junior Developer', 'javascript-junior-developer', 'Core JavaScript — types, closures, prototypes, async/await, and ES6+ features.', 'FileCode', 25, 70, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-27T07:37:11.046Z', '2026-03-27T07:37:11.046Z');
INSERT INTO "certifications" ("id", "title", "slug", "description", "icon", "time_limit_minutes", "passing_score", "created_by", "created_at", "updated_at") VALUES ('9872b186-472e-4391-a150-7239315fc8b1', 'Mid-Level Javascript Developer', 'mid-level-javascript-developer', 'You know the basics of interacting with the DOM. You can handle async code with promises and async/await. You can work with fetch and APIs. You grasp advanced function concepts like higher-order functions, callbacks, and IIFEs. You’re also proficient with ES6+ syntaxes, and advanced object and array methods. You can easily work with npm and common build tools like Vite and Rollup. Lastly, you can effectively handle errors with try/catch and are familiar with popular JS frameworks like Vue, Angular, or React.', NULL, 50, 70, 'bceebee1-34a6-4842-86b6-17aa6318e70f', '2026-03-31T21:00:24.864Z', '2026-03-31T21:00:24.864Z');
