import fs from "fs";
import path from "path";

export const DEFAULT_SQLITE_DB_FILE_NAME = "code-theory.db";

export const DEFAULT_SQLITE_DB_PATH = path.join(
  /* turbopackIgnore: true */ process.cwd(),
  "data",
  DEFAULT_SQLITE_DB_FILE_NAME,
);

export function isPostgresDatabaseUrl(databaseUrl?: string | null): boolean {
  return (
    typeof databaseUrl === "string" && /^postgres(ql)?:\/\//i.test(databaseUrl)
  );
}

export function resolveSqliteDbPath(databaseUrl = process.env.DATABASE_URL) {
  if (!databaseUrl) {
    return DEFAULT_SQLITE_DB_PATH;
  }

  if (isPostgresDatabaseUrl(databaseUrl)) {
    throw new Error(
      "Expected a SQLite file path but received a PostgreSQL connection string.",
    );
  }

  const rawPath = databaseUrl.startsWith("file:")
    ? databaseUrl.slice("file:".length)
    : databaseUrl;

  if (!rawPath.trim()) {
    return DEFAULT_SQLITE_DB_PATH;
  }

  const resolvedPath = path.isAbsolute(rawPath)
    ? rawPath
    : path.join(/* turbopackIgnore: true */ process.cwd(), rawPath);

  const pointsToDirectory =
    /[\\/]$/.test(rawPath) ||
    rawPath === "." ||
    rawPath === "./" ||
    rawPath === ".\\" ||
    (fs.existsSync(resolvedPath) && fs.statSync(resolvedPath).isDirectory());

  if (pointsToDirectory) {
    return path.join(resolvedPath, DEFAULT_SQLITE_DB_FILE_NAME);
  }

  return resolvedPath;
}
