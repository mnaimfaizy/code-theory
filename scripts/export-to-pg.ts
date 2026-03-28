#!/usr/bin/env npx tsx
/**
 * Export SQLite database tables to PostgreSQL-compatible SQL files.
 *
 * Each table is written to sql/<tablename>.sql containing a DROP, CREATE TABLE,
 * UNIQUE index definitions, and INSERT statements for all current rows.
 *
 * Usage:
 *   npx tsx scripts/export-to-pg.ts                         # export all tables
 *   npx tsx scripts/export-to-pg.ts all                     # export all tables
 *   npx tsx scripts/export-to-pg.ts users                   # export one table
 *   npx tsx scripts/export-to-pg.ts users certifications    # export several tables
 *
 * npm shorthand:
 *   npm run db:export                    # all tables
 *   npm run db:export -- all             # all tables
 *   npm run db:export -- users           # specific table(s)
 */

import Database from "better-sqlite3";
import * as fs from "fs";
import * as path from "path";

// ─── Configuration ──────────────────────────────────────────────────────────

const DEFAULT_DB_PATH = "./data/code-theory.db";
const SQL_DIR = path.join(process.cwd(), "sql");
const ALL_TABLE_TOKENS = new Set(["all", "--all"]);

/** Tables in FK-safe creation order (each table's dependencies come before it). */
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

/**
 * Columns stored as INTEGER in SQLite but logically boolean.
 * These are emitted as BOOLEAN in PostgreSQL with TRUE/FALSE values.
 */
const BOOLEAN_COLUMNS: Partial<Record<TableName, Set<string>>> = {
  question_options: new Set(["is_correct"]),
  attempts: new Set(["timed", "passed"]),
  attempt_answers: new Set(["is_correct"]),
  duplicate_flags: new Set(["resolved"]),
};

// ─── Types ──────────────────────────────────────────────────────────────────

interface ColumnInfo {
  cid: number;
  name: string;
  type: string;
  notnull: number;
  dflt_value: string | null;
  pk: number;
}

interface ForeignKeyInfo {
  id: number;
  seq: number;
  table: string;
  from: string;
  to: string;
  on_update: string;
  on_delete: string;
}

interface IndexInfo {
  seq: number;
  name: string;
  unique: number;
  origin: string;
  partial: number;
}

interface IndexColumnInfo {
  seqno: number;
  cid: number;
  name: string;
}

// ─── Type Mapping ────────────────────────────────────────────────────────────

function sqliteTypeToPg(
  sqliteType: string,
  tableName: string,
  columnName: string,
): string {
  if ((BOOLEAN_COLUMNS[tableName as TableName] ?? new Set()).has(columnName)) {
    return "BOOLEAN";
  }
  const t = sqliteType.toUpperCase();
  if (t === "INTEGER" || t === "INT") return "INTEGER";
  if (t === "REAL" || t === "FLOAT" || t === "DOUBLE")
    return "DOUBLE PRECISION";
  if (t === "BLOB") return "BYTEA";
  if (t === "NUMERIC" || t === "DECIMAL") return "NUMERIC";
  // TEXT and anything unrecognised → TEXT
  return "TEXT";
}

// ─── Value Serialisation ─────────────────────────────────────────────────────

function escapeValue(
  value: unknown,
  tableName: string,
  columnName: string,
): string {
  if (value === null || value === undefined) return "NULL";

  const isBool = (BOOLEAN_COLUMNS[tableName as TableName] ?? new Set()).has(
    columnName,
  );

  if (isBool) {
    return value === 1 || value === true ? "TRUE" : "FALSE";
  }

  if (typeof value === "number") return String(value);
  if (typeof value === "boolean") return value ? "TRUE" : "FALSE";

  // String: escape single quotes and wrap
  return `'${String(value).replace(/'/g, "''")}'`;
}

// ─── Default Value Conversion ────────────────────────────────────────────────

function convertDefault(
  dflt: string,
  tableName: string,
  columnName: string,
): string {
  const isBool = (BOOLEAN_COLUMNS[tableName as TableName] ?? new Set()).has(
    columnName,
  );

  if (isBool) {
    if (dflt === "0") return "DEFAULT FALSE";
    if (dflt === "1") return "DEFAULT TRUE";
  }
  return `DEFAULT ${dflt}`;
}

// ─── SQL Generation ──────────────────────────────────────────────────────────

function generateTableSql(db: Database.Database, tableName: string): string {
  const columns = db
    .prepare(`PRAGMA table_info("${tableName}")`)
    .all() as ColumnInfo[];

  const foreignKeys = db
    .prepare(`PRAGMA foreign_key_list("${tableName}")`)
    .all() as ForeignKeyInfo[];

  const indexes = db
    .prepare(`PRAGMA index_list("${tableName}")`)
    .all() as IndexInfo[];

  const lines: string[] = [];

  lines.push(`-- Table: ${tableName}`);
  lines.push(`-- Generated: ${new Date().toISOString()}`);
  lines.push(`-- Source: SQLite → PostgreSQL`);
  lines.push("");
  lines.push(`DROP TABLE IF EXISTS "${tableName}" CASCADE;`);
  lines.push("");

  const pkColumns = columns.filter((c) => c.pk > 0).sort((a, b) => a.pk - b.pk);

  // Build column definitions
  const columnDefs: string[] = columns.map((col) => {
    const pgType = sqliteTypeToPg(col.type, tableName, col.name);
    let def = `  "${col.name}" ${pgType}`;

    if (col.notnull) def += " NOT NULL";

    if (col.dflt_value !== null) {
      def += ` ${convertDefault(col.dflt_value, tableName, col.name)}`;
    }

    // Inline PK for single-column primary keys
    if (pkColumns.length === 1 && col.pk === 1) {
      def += " PRIMARY KEY";
    }

    return def;
  });

  // Composite primary key constraint
  if (pkColumns.length > 1) {
    const pkCols = pkColumns.map((c) => `"${c.name}"`).join(", ");
    columnDefs.push(`  PRIMARY KEY (${pkCols})`);
  }

  // Foreign key constraints
  const fkGroups = new Map<number, ForeignKeyInfo[]>();
  for (const fk of foreignKeys) {
    if (!fkGroups.has(fk.id)) fkGroups.set(fk.id, []);
    fkGroups.get(fk.id)!.push(fk);
  }

  for (const [, fkCols] of fkGroups) {
    const sorted = fkCols.sort((a, b) => a.seq - b.seq);
    const fromCols = sorted.map((f) => `"${f.from}"`).join(", ");
    const toCols = sorted.map((f) => `"${f.to}"`).join(", ");
    const refTable = sorted[0].table;
    let fkDef = `  FOREIGN KEY (${fromCols}) REFERENCES "${refTable}" (${toCols})`;
    const onDelete = sorted[0].on_delete;
    if (onDelete && onDelete !== "NO ACTION") {
      fkDef += ` ON DELETE ${onDelete}`;
    }
    columnDefs.push(fkDef);
  }

  lines.push(`CREATE TABLE IF NOT EXISTS "${tableName}" (`);
  lines.push(columnDefs.join(",\n"));
  lines.push(");");
  lines.push("");

  // Unique indexes (skip those created automatically for PKs)
  for (const idx of indexes) {
    if (idx.unique && idx.origin !== "pk") {
      const idxCols = (
        db
          .prepare(`PRAGMA index_info("${idx.name}")`)
          .all() as IndexColumnInfo[]
      )
        .sort((a, b) => a.seqno - b.seqno)
        .map((c) => `"${c.name}"`)
        .join(", ");

      lines.push(
        `CREATE UNIQUE INDEX IF NOT EXISTS "${idx.name}" ON "${tableName}" (${idxCols});`,
      );
    }
  }

  // Row data
  const rows = db.prepare(`SELECT * FROM "${tableName}"`).all() as Record<
    string,
    unknown
  >[];

  if (rows.length > 0) {
    lines.push("");
    lines.push(`-- Data: ${rows.length} row(s)`);
    const colNames = columns.map((c) => `"${c.name}"`).join(", ");
    for (const row of rows) {
      const values = columns
        .map((c) => escapeValue(row[c.name], tableName, c.name))
        .join(", ");
      lines.push(
        `INSERT INTO "${tableName}" (${colNames}) VALUES (${values});`,
      );
    }
  } else {
    lines.push("");
    lines.push(`-- No data`);
  }

  lines.push("");
  return lines.join("\n");
}

// ─── Main ────────────────────────────────────────────────────────────────────

function resolveDbPath(): string {
  const databaseUrl = process.env.DATABASE_URL;

  if (!databaseUrl) {
    return DEFAULT_DB_PATH;
  }

  if (databaseUrl.startsWith("file:")) {
    return databaseUrl.replace("file:", "");
  }

  if (
    databaseUrl.endsWith(".db") ||
    databaseUrl.endsWith(".sqlite") ||
    databaseUrl.endsWith(".sqlite3")
  ) {
    return databaseUrl;
  }

  return DEFAULT_DB_PATH;
}

function resolveTablesToExport(args: string[]): TableName[] {
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

function ensureSqlDir(): void {
  if (!fs.existsSync(SQL_DIR)) {
    fs.mkdirSync(SQL_DIR, { recursive: true });
    console.log("Created sql/ directory");
  }
}

function removeExistingSqlFiles(): void {
  const existingFiles = fs
    .readdirSync(SQL_DIR)
    .filter((fileName) => fileName.endsWith(".sql"));

  for (const fileName of existingFiles) {
    fs.unlinkSync(path.join(SQL_DIR, fileName));
    console.log(`  Removed stale: sql/${fileName}`);
  }
}

function main(): void {
  const args = process.argv.slice(2);

  const dbPath = resolveDbPath();
  const tablesToExport = resolveTablesToExport(args);

  ensureSqlDir();

  if (!fs.existsSync(dbPath)) {
    console.error(`Database not found: ${dbPath}`);
    console.error("Run \`npm run db:push\` first to initialise the database.");
    process.exit(1);
  }

  removeExistingSqlFiles();

  const db = new Database(dbPath, { readonly: true });

  try {
    for (const tableName of tablesToExport) {
      const sql = generateTableSql(db, tableName);
      const filePath = path.join(SQL_DIR, `${tableName}.sql`);
      fs.writeFileSync(filePath, sql, "utf-8");

      const { count } = db
        .prepare(`SELECT COUNT(*) AS count FROM "${tableName}"`)
        .get() as { count: number };

      console.log(`  Exported: sql/${tableName}.sql  (${count} row(s))`);
    }

    console.log(`\nDone - ${tablesToExport.length} table(s) written to sql/`);
  } finally {
    db.close();
  }
}

main();
