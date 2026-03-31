#!/usr/bin/env node
/**
 * Apply generated PostgreSQL-compatible SQL files to a PostgreSQL database.
 *
 * Usage:
 *   node scripts/apply-pg-sql.mjs                         # apply all tables
 *   node scripts/apply-pg-sql.mjs all                     # apply all tables
 *   node scripts/apply-pg-sql.mjs users certifications    # apply selected tables
 *
 * npm shorthand:
 *   npm run db:apply-sql                    # all tables
 *   npm run db:migrate-sql                  # all tables
 *   npm run db:apply-sql -- all             # all tables
 *   npm run db:apply-sql -- users           # specific table(s)
 */

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import pg from "pg";

const { Client } = pg;

const SQL_DIR = path.join(process.cwd(), "sql");
const ALL_TABLE_TOKENS = new Set(["all", "--all"]);
const ALL_TABLES = [
  "users",
  "certifications",
  "question_sources",
  "questions",
  "question_options",
  "attempts",
  "attempt_answers",
  "duplicate_flags",
];

const GUARDED_TABLES = new Set(["users"]);

function exitWithError(...messages) {
  for (const message of messages) {
    console.error(message);
  }

  process.exit(1);
}

function resolveTablesToApply(args) {
  if (args.length === 0 || args.some((arg) => ALL_TABLE_TOKENS.has(arg))) {
    return [...ALL_TABLES];
  }

  const invalid = args.filter((tableName) => !ALL_TABLES.includes(tableName));

  if (invalid.length > 0) {
    exitWithError(
      `Unknown table(s): ${invalid.join(", ")}`,
      `Valid tables: ${ALL_TABLES.join(", ")}`,
    );
  }

  return ALL_TABLES.filter((tableName) => args.includes(tableName));
}

function resolvePostgresUrl() {
  const databaseUrl = process.env.DATABASE_URL;

  if (!databaseUrl) {
    exitWithError("DATABASE_URL is required to apply SQL files to PostgreSQL.");
  }

  if (!/^postgres(ql)?:\/\//i.test(databaseUrl)) {
    exitWithError(
      "DATABASE_URL must point to a PostgreSQL database before running db:apply-sql.",
    );
  }

  return databaseUrl;
}

function readTableSql(tableName) {
  const filePath = path.join(SQL_DIR, `${tableName}.sql`);

  if (!fs.existsSync(filePath)) {
    exitWithError(
      `Missing SQL file: sql/${tableName}.sql`,
      "Run `npm run db:export` first to generate the SQL files.",
    );
  }

  return fs.readFileSync(filePath, "utf-8");
}

export function applyTableGuards(tableName, sql) {
  if (!GUARDED_TABLES.has(tableName)) {
    return sql;
  }

  return sql
    .replace(/^DROP TABLE IF EXISTS "users" CASCADE;\s*$/gim, "")
    .replace(
      /^TRUNCATE TABLE "users"(?:\s+RESTART IDENTITY)?(?:\s+CASCADE)?;\s*$/gim,
      "",
    )
    .replace(/^DELETE FROM "users".*;\s*$/gim, "")
    .replace(
      /^INSERT INTO "users" \((.+)\) VALUES \((.+)\);$/gim,
      'INSERT INTO "users" ($1) VALUES ($2) ON CONFLICT DO NOTHING;',
    )
    .trim()
    .concat("\n");
}

async function main() {
  const args = process.argv.slice(2);
  const tablesToApply = resolveTablesToApply(args);
  const connectionString = resolvePostgresUrl();

  if (!fs.existsSync(SQL_DIR)) {
    exitWithError(
      "The sql/ directory does not exist.",
      "Run `npm run db:export` first to generate the SQL files.",
    );
  }

  const client = new Client({ connectionString });
  await client.connect();

  try {
    for (const tableName of tablesToApply) {
      const sql = applyTableGuards(tableName, readTableSql(tableName));

      if (!sql.trim()) {
        console.log(
          `  Skipped: sql/${tableName}.sql (no executable statements)`,
        );
        continue;
      }

      await client.query("BEGIN");

      try {
        await client.query(sql);
        await client.query("COMMIT");
      } catch (error) {
        await client.query("ROLLBACK");
        throw error;
      }

      if (GUARDED_TABLES.has(tableName)) {
        console.log(
          `  Applied with guard: sql/${tableName}.sql (existing users preserved)`,
        );
      } else {
        console.log(`  Applied: sql/${tableName}.sql`);
      }
    }

    console.log(
      `\nDone - ${tablesToApply.length} table(s) applied to PostgreSQL`,
    );
  } finally {
    await client.end();
  }
}

const currentFilePath = fileURLToPath(import.meta.url);

if (process.argv[1] && path.resolve(process.argv[1]) === currentFilePath) {
  void main();
}
