-- Table: attempt_answers
-- Generated: 2026-03-30T05:32:06.529Z
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


-- Data: 20 row(s)
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('8c2c4a30-c1de-4bb2-92d2-b4d8a35785aa', '0a030907-8bcd-4091-a891-f71eb2627e77', '4a77019e-661e-40a4-9be0-cf63b4f9719e', 'f8f9cd71-90bf-449a-8d15-197c2252b788', TRUE, '2026-03-27T08:50:34.157Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('8586183b-b956-49b1-b8ba-38bc5473920e', '0a030907-8bcd-4091-a891-f71eb2627e77', '8b730d13-fbba-4558-9a91-d6bd2a38a4cc', 'eb6840b4-6a11-40da-b91f-61d1d2ba7eb9', TRUE, '2026-03-27T08:50:44.760Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('3cdb9ca2-03fa-44bc-86aa-dd592b24fcc1', '0a030907-8bcd-4091-a891-f71eb2627e77', '4e8dbbb4-0fce-4f16-b4c5-b9feb3b6ebbc', 'b79656bc-3f2a-4b0c-8602-74c8af4e4ba1', TRUE, '2026-03-27T08:51:05.190Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('d90131f8-e591-4f68-8801-1df933e96698', '0a030907-8bcd-4091-a891-f71eb2627e77', '69d1d3bf-5137-4911-a830-ff9723f5caf6', '1e5474ca-4067-4bcc-a1b4-0940ed957fd3', FALSE, '2026-03-27T08:51:28.677Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('5be3ae2a-2ae9-4712-90cf-a49a9d348a91', '0a030907-8bcd-4091-a891-f71eb2627e77', 'fefb3d71-f092-4fb8-ac62-e4ac670db048', 'f9ee5e22-5ef6-4aa5-b27b-8942a94d328f', FALSE, '2026-03-27T08:52:00.693Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('58944903-3ee8-43d8-82a4-cc4a2daa86d0', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '6cf43e64-6402-4101-948b-bc1977fa427b', 'a5fb34e3-cf88-4522-a4f6-3f7f3c039b60', FALSE, '2026-03-28T07:41:27.691Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('c0e2c5da-fdf8-4b97-9e97-f0fa9c7820e5', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '4a77019e-661e-40a4-9be0-cf63b4f9719e', 'f8f9cd71-90bf-449a-8d15-197c2252b788', TRUE, '2026-03-28T07:41:49.771Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('c0839d88-4f04-4aba-b53a-bfef45472703', '4f88d56d-bf06-4d46-bf33-db23e02422e7', 'e828f64d-30a1-4192-aba4-6ba1b8c5cd81', '337b121d-ccda-4916-8e70-d51fcb0008c5', FALSE, '2026-03-28T07:44:03.565Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('c4611870-f31b-4578-9f1f-113ff898e533', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '4e8dbbb4-0fce-4f16-b4c5-b9feb3b6ebbc', 'b79656bc-3f2a-4b0c-8602-74c8af4e4ba1', TRUE, '2026-03-28T07:44:19.395Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('6557e424-4e26-4eaf-8cb9-334dc01a8157', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '39d8453f-172d-446a-92a7-7830661d4516', '985992ef-916a-4637-af27-393cf7e40a3c', TRUE, '2026-03-28T07:45:00.665Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('a09941e0-0ff5-40c2-846f-5dd489290986', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '1ae6e15a-9420-4165-a3d0-9f6a1c6e1891', '27e6f340-ec8a-4c72-ab9b-76beb97c134d', TRUE, '2026-03-28T07:49:43.774Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('f1f13fec-7c4a-4cc0-b2a8-d8da513dd931', '4f88d56d-bf06-4d46-bf33-db23e02422e7', 'c2cbed98-e81c-4357-8630-1431ab6378d3', '0721d880-3be7-4e5d-9168-65cfceaf9d49', FALSE, '2026-03-28T07:50:40.172Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('069a9600-3c58-4e39-b492-0d60c26199e5', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '889cc361-14d4-4528-a805-85e619262a08', '51f3879a-3999-496a-828e-b842e8e1d31e', FALSE, '2026-03-28T07:51:15.795Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('75ef1a3f-f250-419e-b332-3b03a43327f4', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '68a5b0a6-c893-469f-b88c-9e8e1dad8871', '92c61d2f-5f70-42de-bec3-329748ab296d', TRUE, '2026-03-28T07:52:37.683Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('8eaa3fe1-d12f-467f-bc48-c07e81780232', '4f88d56d-bf06-4d46-bf33-db23e02422e7', '8b68cdf0-57a8-4c31-9751-eaee9875946c', '23da9c86-1f76-4a69-b32a-1597f78c6de8', FALSE, '2026-03-28T07:53:10.050Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('af4a9333-2776-42f4-9c59-8410170ad92f', 'd09a4db1-3de1-456e-9640-8b8fdd1d1ea0', 'f4f84b4e-dcc8-4226-9f02-47e9c5b73d14', '51640111-49b6-4df4-95bd-d623059ea9b9', FALSE, '2026-03-29T07:06:57.708Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('906680a8-5e5b-4e23-9424-6f4d33e4d7a2', 'd09a4db1-3de1-456e-9640-8b8fdd1d1ea0', 'e63b963d-a602-41d8-a41e-f0d47b9977b9', 'c5940daf-4eee-474a-a3f7-0c2d80019e40', FALSE, '2026-03-29T07:07:30.884Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('fcaf47f7-16a7-4010-b45f-4650a7053b4a', 'd09a4db1-3de1-456e-9640-8b8fdd1d1ea0', '528bf0bc-d65f-42bf-b13d-93682b21768e', '63034c24-834a-45fb-b702-ed515542b706', FALSE, '2026-03-29T07:08:17.230Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('9b52bd85-cc1e-401d-81e5-2f14f64b151c', 'd09a4db1-3de1-456e-9640-8b8fdd1d1ea0', '405d865f-defd-481e-8de3-57a0f28545d4', '5ad48284-04f7-4893-820e-c4af4de0e7df', FALSE, '2026-03-29T07:08:43.521Z');
INSERT INTO "attempt_answers" ("id", "attempt_id", "question_id", "selected_option_id", "is_correct", "answered_at") VALUES ('c79f3409-22b7-4a38-9dc7-ad8df3c3605d', 'd09a4db1-3de1-456e-9640-8b8fdd1d1ea0', '1b0c221e-834a-469c-97b6-b1982da430ed', '5437eff1-8bee-4105-af27-7757c4e5c2b3', FALSE, '2026-03-29T07:08:47.445Z');
