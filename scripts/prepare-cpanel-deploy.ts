#!/usr/bin/env npx tsx

import * as fs from "fs";
import * as path from "path";

const PROJECT_ROOT = process.cwd();
const NEXT_OUTPUT_DIR = path.join(PROJECT_ROOT, ".next");
const STANDALONE_DIR = path.join(NEXT_OUTPUT_DIR, "standalone");
const STATIC_DIR = path.join(NEXT_OUTPUT_DIR, "static");
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
  options?: { excludeNodeModules?: boolean },
): void {
  if (!fs.existsSync(sourceDir)) {
    return;
  }

  fs.cpSync(sourceDir, targetDir, {
    recursive: true,
    force: true,
    filter: (sourcePath) => {
      if (!options?.excludeNodeModules) {
        return true;
      }

      const relativePath = path.relative(sourceDir, sourcePath);

      if (!relativePath || relativePath.startsWith("..")) {
        return true;
      }

      const segments = relativePath.split(path.sep);
      return !segments.includes("node_modules");
    },
  });
}

function copyFileIfExists(sourcePath: string, targetPath: string): void {
  if (!fs.existsSync(sourcePath)) {
    return;
  }

  fs.copyFileSync(sourcePath, targetPath);
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

function writeRestartFile(): void {
  const tmpDir = path.join(DEPLOY_DIR, "tmp");
  const restartFilePath = path.join(tmpDir, "restart.txt");

  fs.mkdirSync(tmpDir, { recursive: true });
  fs.writeFileSync(restartFilePath, `${new Date().toISOString()}\n`, "utf8");
}

function main(): void {
  ensureBuildOutput();
  resetDeployDirectory();

  copyDirectory(STANDALONE_DIR, DEPLOY_DIR, { excludeNodeModules: true });

  const deployNextDir = path.join(DEPLOY_DIR, ".next");
  fs.mkdirSync(deployNextDir, { recursive: true });
  copyDirectory(STATIC_DIR, path.join(deployNextDir, "static"));
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
  writeRestartFile();

  console.log("Prepared cPanel deploy bundle:");
  console.log("  Source: .next/standalone");
  console.log("  Output: .deploy/cpanel");
  console.log("  node_modules: excluded from deploy bundle");
  console.log("  Package manifests: package.json, package-lock.json");
  console.log("  Startup file: app.js");
  console.log("  Restart trigger: tmp/restart.txt");
}

main();
