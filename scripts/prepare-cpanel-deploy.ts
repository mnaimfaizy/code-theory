#!/usr/bin/env npx tsx

import * as fs from "fs";
import * as path from "path";

const PROJECT_ROOT = process.cwd();
const NEXT_OUTPUT_DIR = path.join(PROJECT_ROOT, ".next");
const STANDALONE_DIR = path.join(NEXT_OUTPUT_DIR, "standalone");
const STATIC_DIR = path.join(NEXT_OUTPUT_DIR, "static");
const STANDALONE_NEXT_NODE_MODULES_DIR = path.join(
  STANDALONE_DIR,
  ".next",
  "node_modules",
);
const PUBLIC_DIR = path.join(PROJECT_ROOT, "public");
const DEPLOY_DIR = path.join(PROJECT_ROOT, ".deploy", "cpanel");
const ROOT_PACKAGE_JSON_PATH = path.join(PROJECT_ROOT, "package.json");
const ROOT_PACKAGE_LOCK_PATH = path.join(PROJECT_ROOT, "package-lock.json");

function ensureBuildOutput(): void {
  if (!fs.existsSync(STANDALONE_DIR)) {
    console.error("Missing .next/standalone output.");
    console.error(
      "Run `npm run build` first so Next.js can generate the standalone bundle.",
    );
    process.exit(1);
  }
}

function resetDeployDirectory(): void {
  fs.rmSync(DEPLOY_DIR, { recursive: true, force: true });
  fs.mkdirSync(DEPLOY_DIR, { recursive: true });
}

function copyDirectory(
  sourceDir: string,
  targetDir: string,
  options?: { excludeTopLevelNodeModules?: boolean },
): void {
  if (!fs.existsSync(sourceDir)) {
    return;
  }

  fs.cpSync(sourceDir, targetDir, {
    recursive: true,
    force: true,
    filter: (sourcePath) => {
      if (!options?.excludeTopLevelNodeModules) {
        return true;
      }

      const relativePath = path.relative(sourceDir, sourcePath);

      if (!relativePath || relativePath.startsWith("..")) {
        return true;
      }

      const segments = relativePath.split(path.sep);

      if (segments.length > 0 && segments[0] === "node_modules") {
        return false;
      }

      if (
        segments.length > 1 &&
        segments[0] === ".next" &&
        segments[1] === "node_modules"
      ) {
        return false;
      }

      return true;
    },
  });
}

function copyFileIfExists(sourcePath: string, targetPath: string): void {
  if (!fs.existsSync(sourcePath)) {
    return;
  }

  fs.copyFileSync(sourcePath, targetPath);
}

function writeStandaloneModuleWrappers(): void {
  if (!fs.existsSync(STANDALONE_NEXT_NODE_MODULES_DIR)) {
    return;
  }

  const targetNodeModulesDir = path.join(DEPLOY_DIR, ".next", "node_modules");
  fs.mkdirSync(targetNodeModulesDir, { recursive: true });

  for (const entryName of fs.readdirSync(STANDALONE_NEXT_NODE_MODULES_DIR)) {
    const sourceEntryPath = path.join(
      STANDALONE_NEXT_NODE_MODULES_DIR,
      entryName,
    );
    const sourceEntryStat = fs.lstatSync(sourceEntryPath);
    const targetEntryPath = path.join(targetNodeModulesDir, entryName);

    if (sourceEntryStat.isSymbolicLink()) {
      const linkTarget = fs.readlinkSync(sourceEntryPath);
      const packageName = path.basename(linkTarget);

      fs.mkdirSync(targetEntryPath, { recursive: true });
      fs.writeFileSync(
        path.join(targetEntryPath, "index.js"),
        `module.exports = require(${JSON.stringify(packageName)});\n`,
        "utf8",
      );
      fs.writeFileSync(
        path.join(targetEntryPath, "package.json"),
        JSON.stringify(
          {
            name: entryName,
            private: true,
            main: "index.js",
          },
          null,
          2,
        ).concat("\n"),
        "utf8",
      );
      continue;
    }

    copyDirectory(sourceEntryPath, targetEntryPath);
  }
}

function writePassengerEntryFile(): void {
  const entryFilePath = path.join(DEPLOY_DIR, "app.js");
  const entryFile = [
    'process.env.NODE_ENV ??= "production";',
    'require("./server.js");',
    "",
  ].join("\n");

  fs.writeFileSync(entryFilePath, entryFile, "utf8");
}

function writeCpanelReadmeFile(): void {
  const readmeFilePath = path.join(DEPLOY_DIR, "CPANEL_README.md");
  const readme = [
    "# cPanel Ops Runbook",
    "",
    "This bundle is prebuilt for cPanel Node.js App / Passenger hosting.",
    "Do not run next build on the server.",
    "",
    "## Expected Files In App Root",
    "",
    "- app.js",
    "- server.js",
    "- .next/",
    "- public/",
    "- package.json",
    "- package-lock.json",
    "- tmp/restart.txt",
    "",
    "## Required Ops Actions",
    "",
    "1. Upload the full contents of this bundle into the cPanel application root.",
    "2. Verify the application startup file in cPanel is set to app.js.",
    "3. Verify the Node.js version in cPanel matches the build environment major version. This bundle is prepared for Node.js 20.",
    "4. Install runtime dependencies in the application root:",
    "",
    "```bash",
    "npm ci --omit=dev",
    "```",
    "",
    "If npm ci is not available in the hosting environment, use:",
    "",
    "```bash",
    "npm install --omit=dev",
    "```",
    "",
    "5. Set or verify the required environment variables in cPanel.",
    "6. Restart the Node.js application from cPanel.",
    "",
    "## Required Environment Variables",
    "",
    "```env",
    "NODE_ENV=production",
    "AUTH_SECRET=<set a long random secret>",
    "AUTH_URL=https://your-domain.example",
    "DATABASE_URL=postgres://user:password@host:5432/code_theory",
    "```",
    "",
    "Optional LLM variables only if ingestion or generation is used in production:",
    "",
    "```env",
    "LLM_BASE_URL=http://127.0.0.1:11434/v1",
    "LLM_MODEL=llama3",
    "LLM_API_KEY=ollama",
    "```",
    "",
    "## Required Runtime Checks",
    "",
    "After upload and dependency installation, verify that these paths exist in the application root:",
    "",
    "- .next/BUILD_ID",
    "- .next/server/",
    "- .next/static/",
    "- .next/node_modules/",
    "",
    "## Database Notes",
    "",
    "- Production is expected to use PostgreSQL.",
    "- Do not point DATABASE_URL at SQLite in cPanel production.",
    "- If schema setup is still required, run db:push from a machine that can reach the PostgreSQL server.",
    "",
    "## Common Failure Modes",
    "",
    "- If the server says it cannot find a production build, verify .next/BUILD_ID and .next/server/ were uploaded.",
    "- If the server says it cannot load a module like pg-<hash>, verify .next/node_modules/ was uploaded.",
    "- If the app fails to start after upload, restart it explicitly in cPanel after dependency installation.",
    "- If the app cannot connect to PostgreSQL, verify host, port, credentials, SSL requirements, and network access.",
    "",
    "## Restart Note",
    "",
    "Updating tmp/restart.txt can help trigger Passenger reloads, but use the cPanel restart control if the old version still appears to be running.",
    "",
  ].join("\n");

  fs.writeFileSync(readmeFilePath, readme, "utf8");
}

function writeRestartFile(): void {
  const tmpDir = path.join(DEPLOY_DIR, "tmp");
  const restartFilePath = path.join(tmpDir, "restart.txt");

  fs.mkdirSync(tmpDir, { recursive: true });
  fs.writeFileSync(restartFilePath, `${new Date().toISOString()}\n`, "utf8");
}

function main(): void {
  ensureBuildOutput();
  resetDeployDirectory();

  copyDirectory(STANDALONE_DIR, DEPLOY_DIR, {
    excludeTopLevelNodeModules: true,
  });

  const deployNextDir = path.join(DEPLOY_DIR, ".next");
  fs.mkdirSync(deployNextDir, { recursive: true });
  copyDirectory(STATIC_DIR, path.join(deployNextDir, "static"));
  writeStandaloneModuleWrappers();
  copyDirectory(PUBLIC_DIR, path.join(DEPLOY_DIR, "public"));
  copyFileIfExists(
    ROOT_PACKAGE_JSON_PATH,
    path.join(DEPLOY_DIR, "package.json"),
  );
  copyFileIfExists(
    ROOT_PACKAGE_LOCK_PATH,
    path.join(DEPLOY_DIR, "package-lock.json"),
  );

  writePassengerEntryFile();
  writeCpanelReadmeFile();
  writeRestartFile();

  console.log("Prepared cPanel deploy bundle:");
  console.log("  Source: .next/standalone");
  console.log("  Output: .deploy/cpanel");
  console.log(
    "  node_modules: top-level excluded; .next/node_modules wrappers kept",
  );
  console.log("  Package manifests: package.json, package-lock.json");
  console.log("  Ops handoff: CPANEL_README.md");
  console.log("  Startup file: app.js");
  console.log("  Restart trigger: tmp/restart.txt");
}

main();
