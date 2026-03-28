-- Table: attempt_answers
-- Generated: 2026-03-28T06:35:32.123Z
-- Source: SQLite → PostgreSQL

DROP TABLE IF EXISTS "attempt_answers" CASCADE;

CREATE TABLE IF NOT EXISTS "attempt_answers" (
  "id" TEXT NOT NULL PRIMARY KEY,
  "attempt_id" TEXT NOT NULL,
  "question_id" TEXT NOT NULL,
  "selected_option_id" TEXT,
  "is_correct" BOOLEAN,
  "answered_at" TEXT,
  FOREIGN KEY ("selected_option_id") REFERENCES "question_options" ("id"),
  FOREIGN KEY ("question_id") REFERENCES "questions" ("id"),
  FOREIGN KEY ("attempt_id") REFERENCES "attempts" ("id") ON DELETE CASCADE
);


-- Data: 5 row(s)
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('8c2c4a30-c1de-4bb2-92d2-b4d8a35785aa', '0a030907-8bcd-4091-a891-f71eb2627e77', '4a77019e-661e-40a4-9be0-cf63b4f9719e', 'f8f9cd71-90bf-449a-8d15-197c2252b788', TRUE, '2026-03-27T08:50:34.157Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('8586183b-b956-49b1-b8ba-38bc5473920e', '0a030907-8bcd-4091-a891-f71eb2627e77', '8b730d13-fbba-4558-9a91-d6bd2a38a4cc', 'eb6840b4-6a11-40da-b91f-61d1d2ba7eb9', TRUE, '2026-03-27T08:50:44.760Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('3cdb9ca2-03fa-44bc-86aa-dd592b24fcc1', '0a030907-8bcd-4091-a891-f71eb2627e77', '4e8dbbb4-0fce-4f16-b4c5-b9feb3b6ebbc', 'b79656bc-3f2a-4b0c-8602-74c8af4e4ba1', TRUE, '2026-03-27T08:51:05.190Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('d90131f8-e591-4f68-8801-1df933e96698', '0a030907-8bcd-4091-a891-f71eb2627e77', '69d1d3bf-5137-4911-a830-ff9723f5caf6', '1e5474ca-4067-4bcc-a1b4-0940ed957fd3', FALSE, '2026-03-27T08:51:28.677Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('5be3ae2a-2ae9-4712-90cf-a49a9d348a91', '0a030907-8bcd-4091-a891-f71eb2627e77', 'fefb3d71-f092-4fb8-ac62-e4ac670db048', 'f9ee5e22-5ef6-4aa5-b27b-8942a94d328f', FALSE, '2026-03-27T08:52:00.693Z');
