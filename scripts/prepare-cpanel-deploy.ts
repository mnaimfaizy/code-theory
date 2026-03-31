#!/usr/bin/env npx tsx

import * as fs from "fs";
import * as path from "path";

const PROJECT_ROOT = process.cwd();
const NEXT_OUTPUT_DIR = path.join(PROJECT_ROOT, ".next");
const STANDALONE_DIR = path.join(NEXT_OUTPUT_DIR, "standalone");
const STATIC_DIR = path.join(NEXT_OUTPUT_DIR, "static");
const PUBLIC_DIR = path.join(PROJECT_ROOT, "public");
const DEPLOY_DIR = path.join(PROJECT_ROOT, ".deploy", "cpanel");

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

function copyDirectory(sourceDir: string, targetDir: string): void {
  if (!fs.existsSync(sourceDir)) {
    return;
  }

  fs.cpSync(sourceDir, targetDir, { recursive: true, force: true });
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

  copyDirectory(STANDALONE_DIR, DEPLOY_DIR);

  const deployNextDir = path.join(DEPLOY_DIR, ".next");
  fs.mkdirSync(deployNextDir, { recursive: true });
  copyDirectory(STATIC_DIR, path.join(deployNextDir, "static"));
  copyDirectory(PUBLIC_DIR, path.join(DEPLOY_DIR, "public"));

  writePassengerEntryFile();
  writeRestartFile();

  console.log("Prepared cPanel deploy bundle:");
  console.log("  Source: .next/standalone");
  console.log("  Output: .deploy/cpanel");
  console.log("  Startup file: app.js");
  console.log("  Restart trigger: tmp/restart.txt");
}

main();
