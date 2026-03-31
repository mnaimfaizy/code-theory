import path from "path";

export const DEFAULT_SQLITE_DB_PATH = path.join(
  /* turbopackIgnore: true */ process.cwd(),
  "data",
  "code-theory.db",
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

  if (path.isAbsolute(rawPath)) {
    return rawPath;
  }

  return path.join(/* turbopackIgnore: true */ process.cwd(), rawPath);
}
