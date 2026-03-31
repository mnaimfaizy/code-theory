import type { Config } from "drizzle-kit";
import { isPostgresDatabaseUrl, resolveSqliteDbPath } from "./src/db/runtime";

const databaseUrl = process.env.DATABASE_URL;
const isPostgres = isPostgresDatabaseUrl(databaseUrl);

const config: Config = isPostgres
  ? {
      schema: "./src/db/schema.ts",
      out: "./drizzle",
      dialect: "postgresql",
      dbCredentials: {
        url: databaseUrl!,
      },
    }
  : {
      schema: "./src/db/schema.ts",
      out: "./drizzle",
      dialect: "sqlite",
      dbCredentials: {
        url: resolveSqliteDbPath(databaseUrl),
      },
    };

export default config;
