import { relations } from "drizzle-orm";
import { boolean, integer, pgTable, text } from "drizzle-orm/pg-core";

export const users = pgTable("users", {
  id: text("id").primaryKey(),
  name: text("name").notNull(),
  email: text("email").notNull().unique(),
  passwordHash: text("password_hash").notNull(),
  createdAt: text("created_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
});

export const usersRelations = relations(users, ({ many }) => ({
  certifications: many(certifications),
  attempts: many(attempts),
}));

export const certifications = pgTable("certifications", {
  id: text("id").primaryKey(),
  title: text("title").notNull(),
  slug: text("slug").notNull().unique(),
  description: text("description"),
  icon: text("icon"),
  timeLimitMinutes: integer("time_limit_minutes"),
  passingScore: integer("passing_score").notNull().default(70),
  createdBy: text("created_by").references(() => users.id),
  createdAt: text("created_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
  updatedAt: text("updated_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
});

export const certificationsRelations = relations(
  certifications,
  ({ one, many }) => ({
    creator: one(users, {
      fields: [certifications.createdBy],
      references: [users.id],
    }),
    questions: many(questions),
    questionSources: many(questionSources),
    attempts: many(attempts),
  }),
);

export const questions = pgTable("questions", {
  id: text("id").primaryKey(),
  certificationId: text("certification_id")
    .notNull()
    .references(() => certifications.id, { onDelete: "cascade" }),
  text: text("text").notNull(),
  explanation: text("explanation"),
  difficulty: text("difficulty", {
    enum: ["easy", "medium", "hard"],
  }).default("medium"),
  status: text("status", {
    enum: ["draft", "approved", "rejected"],
  })
    .notNull()
    .default("draft"),
  sourceId: text("source_id").references(() => questionSources.id),
  orderIndex: integer("order_index").notNull().default(0),
  createdAt: text("created_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
  updatedAt: text("updated_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
});

export const questionsRelations = relations(questions, ({ one, many }) => ({
  certification: one(certifications, {
    fields: [questions.certificationId],
    references: [certifications.id],
  }),
  options: many(questionOptions),
  source: one(questionSources, {
    fields: [questions.sourceId],
    references: [questionSources.id],
  }),
}));

export const questionOptions = pgTable("question_options", {
  id: text("id").primaryKey(),
  questionId: text("question_id")
    .notNull()
    .references(() => questions.id, { onDelete: "cascade" }),
  text: text("text").notNull(),
  isCorrect: boolean("is_correct").notNull().default(false),
  orderIndex: integer("order_index").notNull().default(0),
});

export const questionOptionsRelations = relations(
  questionOptions,
  ({ one }) => ({
    question: one(questions, {
      fields: [questionOptions.questionId],
      references: [questions.id],
    }),
  }),
);

export const questionSources = pgTable("question_sources", {
  id: text("id").primaryKey(),
  certificationId: text("certification_id")
    .notNull()
    .references(() => certifications.id, { onDelete: "cascade" }),
  sourceType: text("source_type", {
    enum: ["url", "file"],
  }).notNull(),
  sourceRef: text("source_ref").notNull(),
  rawContent: text("raw_content"),
  chunkCount: integer("chunk_count").default(0),
  createdAt: text("created_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
  processedAt: text("processed_at"),
});

export const questionSourcesRelations = relations(
  questionSources,
  ({ one, many }) => ({
    certification: one(certifications, {
      fields: [questionSources.certificationId],
      references: [certifications.id],
    }),
    questions: many(questions),
  }),
);

export const attempts = pgTable("attempts", {
  id: text("id").primaryKey(),
  userId: text("user_id")
    .notNull()
    .references(() => users.id),
  certificationId: text("certification_id")
    .notNull()
    .references(() => certifications.id),
  mode: text("mode", { enum: ["fixed", "random"] })
    .notNull()
    .default("random"),
  timed: boolean("timed").notNull().default(false),
  timeLimitSeconds: integer("time_limit_seconds"),
  questionCount: integer("question_count").notNull(),
  score: integer("score"),
  passed: boolean("passed"),
  startedAt: text("started_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
  completedAt: text("completed_at"),
});

export const attemptsRelations = relations(attempts, ({ one, many }) => ({
  user: one(users, {
    fields: [attempts.userId],
    references: [users.id],
  }),
  certification: one(certifications, {
    fields: [attempts.certificationId],
    references: [certifications.id],
  }),
  answers: many(attemptAnswers),
}));

export const attemptAnswers = pgTable("attempt_answers", {
  id: text("id").primaryKey(),
  attemptId: text("attempt_id")
    .notNull()
    .references(() => attempts.id, { onDelete: "cascade" }),
  questionId: text("question_id")
    .notNull()
    .references(() => questions.id),
  selectedOptionId: text("selected_option_id").references(
    () => questionOptions.id,
  ),
  isCorrect: boolean("is_correct"),
  answeredAt: text("answered_at"),
});

export const attemptAnswersRelations = relations(attemptAnswers, ({ one }) => ({
  attempt: one(attempts, {
    fields: [attemptAnswers.attemptId],
    references: [attempts.id],
  }),
  question: one(questions, {
    fields: [attemptAnswers.questionId],
    references: [questions.id],
  }),
  selectedOption: one(questionOptions, {
    fields: [attemptAnswers.selectedOptionId],
    references: [questionOptions.id],
  }),
}));

export const duplicateFlags = pgTable("duplicate_flags", {
  id: text("id").primaryKey(),
  questionId: text("question_id")
    .notNull()
    .references(() => questions.id, { onDelete: "cascade" }),
  duplicateOfId: text("duplicate_of_id")
    .notNull()
    .references(() => questions.id, { onDelete: "cascade" }),
  matchType: text("match_type", {
    enum: ["exact", "near", "semantic"],
  }).notNull(),
  similarity: integer("similarity"),
  resolved: boolean("resolved").notNull().default(false),
  resolution: text("resolution", {
    enum: ["kept_both", "merged", "rejected"],
  }),
  createdAt: text("created_at")
    .notNull()
    .$defaultFn(() => new Date().toISOString()),
  resolvedAt: text("resolved_at"),
});

export const duplicateFlagsRelations = relations(duplicateFlags, ({ one }) => ({
  question: one(questions, {
    fields: [duplicateFlags.questionId],
    references: [questions.id],
  }),
  duplicateOf: one(questions, {
    fields: [duplicateFlags.duplicateOfId],
    references: [questions.id],
  }),
}));
