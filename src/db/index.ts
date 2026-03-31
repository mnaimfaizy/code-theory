import fs from "fs";
import { createRequire } from "module";
import path from "path";
import type { BetterSQLite3Database } from "drizzle-orm/better-sqlite3";
import type { AppSchema } from "./schema";
import { isPostgresDatabaseUrl, resolveSqliteDbPath } from "./runtime";

type DB = BetterSQLite3Database<AppSchema>;
const require = createRequire(import.meta.url);
const SQLITE_BUSY_TIMEOUT_MS = 30000;

function isSqliteBusyError(error: unknown): boolean {
  return (
    typeof error === "object" &&
    error !== null &&
    "code" in error &&
    error.code === "SQLITE_BUSY"
  );
}

function createSqliteDb(): DB {
  const resolvedPath = resolveSqliteDbPath();
  const dir = path.dirname(resolvedPath);

  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }

  const Database = require("better-sqlite3") as typeof import("better-sqlite3");
  const { drizzle } =
    require("drizzle-orm/better-sqlite3") as typeof import("drizzle-orm/better-sqlite3");
  const schema = require("./schema-sqlite") as typeof import("./schema-sqlite");

  const sqlite = new Database(resolvedPath, {
    timeout: SQLITE_BUSY_TIMEOUT_MS,
  });

  sqlite.pragma(`busy_timeout = ${SQLITE_BUSY_TIMEOUT_MS}`);

  try {
    sqlite.pragma("journal_mode = WAL");
  } catch (error) {
    // Concurrent build workers can race when they all try to switch a fresh
    // placeholder SQLite file into WAL mode at the same time.
    if (!isSqliteBusyError(error)) {
      throw error;
    }
  }

  sqlite.pragma("foreign_keys = ON");

  return drizzle(sqlite, { schema }) as DB;
}

function createPostgresDb(connectionString: string): DB {
  const { Pool } = require("pg") as typeof import("pg");
  const { drizzle } =
    require("drizzle-orm/node-postgres") as typeof import("drizzle-orm/node-postgres");
  const schema =
    require("./schema-postgres") as typeof import("./schema-postgres");

  const pool = new Pool({
    connectionString,
    allowExitOnIdle: true,
  });

  return drizzle(pool, { schema }) as unknown as DB;
}

function createDb(): DB {
  const databaseUrl = process.env.DATABASE_URL;

  if (databaseUrl && isPostgresDatabaseUrl(databaseUrl)) {
    return createPostgresDb(databaseUrl);
  }

  return createSqliteDb();
}

export const db = createDb();

export type { DB };
