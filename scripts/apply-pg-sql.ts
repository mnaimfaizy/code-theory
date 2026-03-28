#!/usr/bin/env npx tsx
/**
 * Apply generated PostgreSQL-compatible SQL files to a PostgreSQL database.
 *
 * Usage:
 *   npx tsx scripts/apply-pg-sql.ts                         # apply all tables
 *   npx tsx scripts/apply-pg-sql.ts all                     # apply all tables
 *   npx tsx scripts/apply-pg-sql.ts users certifications    # apply selected tables
 *
 * npm shorthand:
 *   npm run db:apply-sql                    # all tables
 *   npm run db:apply-sql -- all             # all tables
 *   npm run db:apply-sql -- users           # specific table(s)
 */

import * as fs from "fs";
import * as path from "path";
import { Client } from "pg";

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
] as const;

type TableName = (typeof ALL_TABLES)[number];

function resolveTablesToApply(args: string[]): TableName[] {
  if (args.length === 0 || args.some((arg) => ALL_TABLE_TOKENS.has(arg))) {
    return [...ALL_TABLES];
  }

  const invalid = args.filter(
    (tableName) => !(ALL_TABLES as readonly string[]).includes(tableName),
  );

  if (invalid.length > 0) {
    console.error(`Unknown table(s): ${invalid.join(", ")}`);
    console.error(`Valid tables: ${ALL_TABLES.join(", ")}`);
    process.exit(1);
  }

  return ALL_TABLES.filter((tableName) => args.includes(tableName));
}

function resolvePostgresUrl(): string {
  const databaseUrl = process.env.DATABASE_URL;

  if (!databaseUrl) {
    console.error("DATABASE_URL is required to apply SQL files to PostgreSQL.");
    process.exit(1);
  }

  if (!/^postgres(ql)?:\/\//i.test(databaseUrl)) {
    console.error(
      "DATABASE_URL must point to a PostgreSQL database before running db:apply-sql.",
    );
    process.exit(1);
  }

  return databaseUrl;
}

function readTableSql(tableName: TableName): string {
  const filePath = path.join(SQL_DIR, `${tableName}.sql`);

  if (!fs.existsSync(filePath)) {
    console.error(`Missing SQL file: sql/${tableName}.sql`);
    console.error("Run `npm run db:export` first to generate the SQL files.");
    process.exit(1);
  }

  return fs.readFileSync(filePath, "utf-8");
}

async function main(): Promise<void> {
  const args = process.argv.slice(2);
  const tablesToApply = resolveTablesToApply(args);
  const connectionString = resolvePostgresUrl();

  if (!fs.existsSync(SQL_DIR)) {
    console.error("The sql/ directory does not exist.");
    console.error("Run `npm run db:export` first to generate the SQL files.");
    process.exit(1);
  }

  const client = new Client({ connectionString });
  await client.connect();

  try {
    for (const tableName of tablesToApply) {
      const sql = readTableSql(tableName);
      await client.query(sql);
      console.log(`  Applied: sql/${tableName}.sql`);
    }

    console.log(
      `\nDone - ${tablesToApply.length} table(s) applied to PostgreSQL`,
    );
  } finally {
    await client.end();
  }
}

void main();
