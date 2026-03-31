#!/usr/bin/env npx tsx
/**
 * Apply generated PostgreSQL-compatible SQL files to a SQLite database.
 *
 * The sql/ files in this repository are generated for PostgreSQL, so this
 * script normalizes the small amount of PostgreSQL-only syntax they contain
 * before executing them against SQLite.
 *
 * Usage:
 *   npx tsx scripts/apply-sqlite-sql.ts                         # apply all tables
 *   npx tsx scripts/apply-sqlite-sql.ts all                     # apply all tables
 *   npx tsx scripts/apply-sqlite-sql.ts users certifications    # apply selected tables
 *
 * npm shorthand:
 *   npm run db:apply-sqlite-sql                 # all tables
 *   npm run db:migrate-sqlite                   # all tables
 *   npm run db:apply-sqlite-sql -- all          # all tables
 *   npm run db:apply-sqlite-sql -- users        # specific table(s)
 */

import Database from "better-sqlite3";
import * as fs from "fs";
import * as path from "path";
import { fileURLToPath } from "url";
import { resolveSqliteDbPath } from "../src/db/runtime";

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
const SQLITE_BUSY_TIMEOUT_MS = 30000;

type TableName = (typeof ALL_TABLES)[number];

interface ForeignKeyViolation {
  table: string;
  rowid: number;
  parent: string;
  fkid: number;
}

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

function readTableSql(tableName: TableName): string {
  const filePath = path.join(SQL_DIR, `${tableName}.sql`);

  if (!fs.existsSync(filePath)) {
    console.error(`Missing SQL file: sql/${tableName}.sql`);
    console.error("Run `npm run db:export` first to generate the SQL files.");
    process.exit(1);
  }

  return fs.readFileSync(filePath, "utf-8");
}

export function transformPostgresSqlForSqlite(sql: string): string {
  return sql
    .replace(
      /^DROP TABLE IF EXISTS "([^"]+)" CASCADE;\s*$/gim,
      'DROP TABLE IF EXISTS "$1";\n',
    )
    .trim()
    .concat("\n");
}

function ensureTargetDirectoryExists(databasePath: string): void {
  const dir = path.dirname(databasePath);

  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function formatTargetPath(databasePath: string): string {
  const relativePath = path.relative(process.cwd(), databasePath);
  return relativePath.length > 0 && !relativePath.startsWith("..")
    ? relativePath
    : databasePath;
}

function validateForeignKeys(db: Database.Database): void {
  const violations = db
    .prepare("PRAGMA foreign_key_check")
    .all() as ForeignKeyViolation[];

  if (violations.length === 0) {
    return;
  }

  const details = violations
    .slice(0, 5)
    .map(
      (violation) =>
        `table=${violation.table} rowid=${violation.rowid} parent=${violation.parent} fkid=${violation.fkid}`,
    )
    .join("; ");

  throw new Error(
    `Foreign key validation failed after SQLite import (${violations.length} violation(s)): ${details}`,
  );
}

function main(): void {
  const args = process.argv.slice(2);
  const tablesToApply = resolveTablesToApply(args);

  if (!fs.existsSync(SQL_DIR)) {
    console.error("The sql/ directory does not exist.");
    console.error("Run `npm run db:export` first to generate the SQL files.");
    process.exit(1);
  }

  const databasePath = resolveSqliteDbPath();
  ensureTargetDirectoryExists(databasePath);

  const db = new Database(databasePath, {
    timeout: SQLITE_BUSY_TIMEOUT_MS,
  });

  db.pragma(`busy_timeout = ${SQLITE_BUSY_TIMEOUT_MS}`);

  try {
    db.pragma("foreign_keys = OFF");
    db.exec("BEGIN");

    try {
      for (const tableName of tablesToApply) {
        const sql = transformPostgresSqlForSqlite(readTableSql(tableName));

        if (!sql.trim()) {
          console.log(
            `  Skipped: sql/${tableName}.sql (no executable statements)`,
          );
          continue;
        }

        db.exec(sql);
        console.log(`  Applied: sql/${tableName}.sql`);
      }

      validateForeignKeys(db);
      db.exec("COMMIT");
    } catch (error) {
      try {
        db.exec("ROLLBACK");
      } catch {
        // Ignore rollback failures and rethrow the original error.
      }

      throw error;
    }

    db.pragma("foreign_keys = ON");
    console.log(
      `\nDone - ${tablesToApply.length} table(s) applied to SQLite (${formatTargetPath(databasePath)})`,
    );
  } finally {
    db.close();
  }
}

const currentFilePath = fileURLToPath(import.meta.url);

if (process.argv[1] && path.resolve(process.argv[1]) === currentFilePath) {
  main();
}
