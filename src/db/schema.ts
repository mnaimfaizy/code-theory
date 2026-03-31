import { isPostgresDatabaseUrl } from "./runtime";
import * as postgresSchema from "./schema-postgres";
import * as sqliteSchema from "./schema-sqlite";

const activeSchema = (
  isPostgresDatabaseUrl(process.env.DATABASE_URL)
    ? postgresSchema
    : sqliteSchema
) as typeof sqliteSchema;

export type AppSchema = typeof sqliteSchema;

export const {
  attempts,
  attemptsRelations,
  attemptAnswers,
  attemptAnswersRelations,
  certifications,
  certificationsRelations,
  duplicateFlags,
  duplicateFlagsRelations,
  questionOptions,
  questionOptionsRelations,
  questions,
  questionsRelations,
  questionSources,
  questionSourcesRelations,
  users,
  usersRelations,
} = activeSchema;
