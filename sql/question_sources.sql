-- Table: question_sources
-- Generated: 2026-03-28T06:55:26.991Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "question_sources" CASCADE;

CREATE TABLE IF NOT EXISTS "question_sources" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "certification_id" TEXT NOT NULL,
  "source_type" TEXT NOT NULL,
  "source_ref" TEXT NOT NULL,
  "raw_content" TEXT,
  "chunk_count" INTEGER DEFAULT 0,
  "created_at" TEXT NOT NULL,
  "processed_at" TEXT,
  FOREIGN KEY ("certification_id") REFERENCES "certifications" ("id") ON DELETE CASCADE
);


-- Data: 5 row(s)
INSERT INTO "question_sources" ("id", "certification_id", "source_type", "source_ref", "raw_content", "chunk_count", "created_at", "processed_at") VALUES ('682e61d7-5c66-44b8-af9d-53a5bbc28713', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'url', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export', NULL, 0, '2026-03-28T04:31:23.598Z', NULL);
INSERT INTO "question_sources" ("id", "certification_id", "source_type", "source_ref", "raw_content", "chunk_count", "created_at", "processed_at") VALUES ('932b1bc7-cbfd-4c66-8683-817cb5a18ec6', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'url', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let', NULL, 0, '2026-03-28T05:00:15.902Z', NULL);
INSERT INTO "question_sources" ("id", "certification_id", "source_type", "source_ref", "raw_content", "chunk_count", "created_at", "processed_at") VALUES ('0dbe4cb8-9e8b-42b6-8e6a-eb31cb000573', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'url', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax', NULL, 0, '2026-03-28T05:20:26.528Z', NULL);
INSERT INTO "question_sources" ("id", "certification_id", "source_type", "source_ref", "raw_content", "chunk_count", "created_at", "processed_at") VALUES ('2ffcfb48-a80f-471b-89fe-c2bccee1411e', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'url', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#instance_methods
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise', NULL, 0, '2026-03-28T05:36:01.535Z', NULL);
INSERT INTO "question_sources" ("id", "certification_id", "source_type", "source_ref", "raw_content", "chunk_count", "created_at", "processed_at") VALUES ('ddd2571b-e567-45f9-a725-b966dade095b', '3a0be6de-d504-4cda-8a65-da3f2cecb3f9', 'url', 'https://react.dev/reference/react-dom/client/createRoot
https://react.dev/learn/add-react-to-an-existing-project
https://18.react.dev/reference/react/createElement', NULL, 0, '2026-03-28T06:31:35.347Z', NULL);
