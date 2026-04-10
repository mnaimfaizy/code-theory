# Dependency and Supply Chain Security Plan

Last updated: 2026-04-10

## Purpose

This document records the current npm, Yarn, pnpm, and CI supply-chain posture of the Code Theory repository and the measures required to reduce dependency compromise risk. It is written for future maintenance, incident response, and dependency review work.

## Current Repository Assessment

### Confirmed facts from this repository

- The project is an npm-based Next.js application with a committed `package-lock.json`.
- The repository remains npm-first via `packageManager: npm@11.12.1`, while checked-in Yarn and pnpm config files provide hardened local-use defaults for developers who intentionally bypass npm.
- Direct dependencies are pinned to exact versions, and `.npmrc` is configured with `save-exact=true` so new `^` or `~` ranges are not introduced by default.
- The repository now configures `min-release-age=14` in `.npmrc` so newly published package versions are delayed during version resolution, and Dependabot mirrors that delay for npm version-update PRs.
- Root `.yarnrc.yml` and `pnpm-workspace.yaml` now mirror that package-aging policy for secondary local package-manager use with `npmMinimalAgeGate: 14d` and `minimumReleaseAge: 20160` respectively.
- `package.json` now includes Axios override guardrails so the compromised releases `axios@1.14.1` and `axios@0.30.4` are replaced with safe versions if Axios is ever introduced.
- The current lockfile does not contain `axios`.
- The directly vulnerable top-level package `drizzle-orm` has been remediated to `0.45.2`.
- The remaining advisories are currently limited to a dev-only `drizzle-kit -> @esbuild-kit/* -> esbuild <=0.24.2` chain. `drizzle-kit@0.31.10` is still the newest published version at the time of this update.
- The current lockfile includes install-time script packages. Confirmed examples include `better-sqlite3`, `sharp`, `esbuild`, `fsevents`, `msw`, and `unrs-resolver`, plus nested toolchain copies of `esbuild` used by `drizzle-kit` and `tsx`.
- pnpm local use is now configured to fail closed on new dependency build scripts unless they are explicitly allowlisted, and to block exotic transitive dependency sources.
- Yarn local use is now configured with hardened registry validation, the npm registry pinned explicitly, and `node-modules` linking.
- The repository now includes a root `SECURITY.md`, a supply-chain policy document under `docs/SECURITY/`, pinned GitHub Actions workflows, Dependabot, CODEOWNERS, an npm defaults file, a Yarn rc file, and a pnpm workspace policy file.

### Vulnerability snapshot from npm audit

- `npm audit --audit-level=high` passes. No high or critical advisories remain after remediation.
- A plain `npm audit` run still reports 4 moderate advisories, all in the dev-only `drizzle-kit` transitive `esbuild` chain described above.
- The actionable high-severity advisory in `drizzle-orm` was removed without introducing a breaking change.

### Current CI posture and remaining governance gaps

- The main CI workflow now pins all referenced GitHub Actions to full commit SHAs.
- The CI and deploy workflows now declare explicit least-privilege permissions with `contents: read` at the workflow level.
- A pull-request dependency review job has been added and is configured to fail when a PR introduces moderate-or-higher vulnerabilities in `development`, `runtime`, or `unknown` scopes.
- The CI workflow now includes a `Secure Install Review` job that runs `npm ci --ignore-scripts` for metadata-only dependency review before the regular build jobs.
- The CI and deploy workflows now verify that `package-lock.json` remains unchanged after every `npm ci` run.
- The CI workflow now rejects pull requests that introduce or modify `yarn.lock` or `pnpm-lock.yaml`, keeping `package-lock.json` as the only authoritative lockfile.
- Dependabot is configured for both npm and GitHub Actions updates.
- npm version updates now use a 14-day Dependabot cooldown window. GitHub Actions updates remain on the normal schedule because Dependabot cooldown does not apply to the `github-actions` ecosystem.
- `CODEOWNERS` now protects workflows, dependency manifests, lockfiles, and security documentation.
- A repository `SECURITY.md` policy file now defines supported branches and private reporting expectations.
- Remaining gap: the moderate dev-only `drizzle-kit` advisory chain is unresolved upstream today, so the repository should continue isolating it to development workflows and re-check on every `drizzle-kit` release.

### Local tooling observations

- `npm audit signatures` does not currently produce a usable provenance result in this workspace. The current CLI reports: `found no dependencies to audit that were installed from a supported registry`.
- The repository now pins npm 11.12.1 and configures `min-release-age=14` in `.npmrc`.
- The repository now also ships `.yarnrc.yml` and `pnpm-workspace.yaml` so local Yarn and pnpm use inherits the same 14-day version-aging policy instead of bypassing it.
- npm 11.12.1 currently has an upstream reporting bug where `npm config ls -l` can still display `min-release-age = null` even when the setting is present and honored during installs. Do not use `config ls` output as the source of truth for this setting.
- `min-release-age` affects version resolution work such as `npm install`, while CI still uses `npm ci` against the committed lockfile for deterministic installs.
- Because this repository still relies on install-time script packages, a blanket `ignore-scripts=true` policy for normal local installs would be disruptive unless the toolchain changes first.
- Yarn keeps install scripts enabled because this repository currently relies on reviewed native/toolchain install-time scripts such as `better-sqlite3`, `sharp`, and `esbuild`; the Yarn hardening here focuses on package aging, registry verification, and exact-version defaults.
- pnpm is configured more strictly: `strictDepBuilds: true` plus a reviewed `allowBuilds` list means newly introduced dependency build scripts fail until they are deliberately approved.
- The practical safe flow for this repo is: review dependencies first with `npm ci --ignore-scripts` in a disposable environment or dedicated CI job, then use normal `npm ci` only when build, lint, runtime, or native module execution is actually required.

### Validation after remediation

- `npm audit --audit-level=high` passes: 0 high, 0 critical.
- `npm audit --json` reports 4 remaining moderate advisories, all in the dev-only `drizzle-kit` transitive `esbuild` chain.
- The current audited dependency footprint is 959 packages: 552 prod, 371 dev, and 164 optional entries in the lockfile metadata.
- `npm run lint` completes with 0 errors and 0 warnings.

## Axios 2026 Lessons That Apply Here

Public reporting in March and April 2026 described a real compromise of the npm `axios` package through a maintainer-account takeover. The reported malicious releases were `axios@1.14.1` and `axios@0.30.4`, and multiple incident write-ups also identified a malicious dependency path involving `plain-crypto-js`.

The useful lesson for this repository is not "avoid Axios only." The lesson is that package popularity does not reduce supply-chain risk. Controls must assume that any popular package, including foundational web tooling, can become hostile for a short window.

Required takeaways:

- Lockfile discipline matters because it prevents silent resolver drift.
- Dependency updates need review, not blind automation.
- Install-time scripts must be treated as executable code, not metadata.
- CI secrets and deploy credentials must be minimized and rotated when compromise is suspected.
- Workflow actions themselves are part of the supply chain and must be pinned.

## Required Measures

### 1. Immediate actions for this repository

1. Completed 2026-04-10: pinned direct dependencies and devDependencies to exact reviewed versions.
2. Completed 2026-04-10: remediated the direct `drizzle-orm` advisory by updating to `0.45.2` and regenerating the lockfile.
3. Completed 2026-04-10: added `.npmrc` defaults so new installs stay exact-version, lockfile-backed, audited, and deduped when safe.
4. Keep reviewing lockfile diffs for all newly introduced packages and call out any package with install-time scripts.
5. Monitor upstream `drizzle-kit` releases for a fix to the remaining dev-only `esbuild` advisory chain.

### 2. Immediate organization-wide actions related to Axios

1. Search all active repositories, CI caches, artifact caches, and developer workstations for `axios@1.14.1`, `axios@0.30.4`, and `plain-crypto-js`.
2. Block those versions in any internal registry or proxy if one exists.
3. If any environment installed those versions, rotate developer, CI, cloud, and package-registry secrets that were present on the host at install time.
4. Rebuild affected environments from a clean baseline instead of attempting in-place trust restoration.

### 3. CI and workflow hardening

1. Completed 2026-04-10: pinned all referenced GitHub Actions in CI and deploy workflows to full commit SHAs.
2. Completed 2026-04-10: added explicit workflow permissions with a least-privilege default.
3. Completed 2026-04-10: added a pull-request dependency review job so manifest and lockfile changes are surfaced before merge.
4. Completed 2026-04-10: added Dependabot for both npm dependencies and GitHub Actions updates.
5. Completed 2026-04-10: configured a 14-day cooldown for npm version-update PRs so newly published package versions are not proposed immediately.
6. Completed 2026-04-10: upgraded the repository package-manager pin to `npm@11.12.1` and configured native `min-release-age=14` in `.npmrc`.
7. Completed 2026-04-10: protected `.github/workflows/**`, `package.json`, `package-lock.json`, `.npmrc`, and security documentation with `CODEOWNERS` review.
8. Completed 2026-04-10: enforced frozen lockfile checks after `npm ci` in CI and deployment builds.
9. Completed 2026-04-10: added a no-scripts dependency review install stage with `npm ci --ignore-scripts`.
10. Completed 2026-04-11: added a pull-request lockfile policy check that fails when `yarn.lock` or `pnpm-lock.yaml` is introduced or modified.
11. Keep preferring OIDC-based authentication over long-lived cloud or registry secrets in workflows if future automation needs cloud or package publishing access.

### 4. Package manager policy

1. npm remains the authoritative package manager for this repository. Keep `package-lock.json` committed and continue using `npm ci` in CI, automation, and documented setup.
2. Yarn and pnpm are permitted only as local, secondary workflows. Their checked-in configs are guardrails for developers who intentionally use them, not a signal to replace the npm lockfile or CI install path.
3. Keep `package-lock.json` committed at all times. Do not add or rely on `yarn.lock` or `pnpm-lock.yaml` in pull requests unless the repository is formally migrated.
4. Use exact versions for direct dependencies. Avoid `^` and `~`, keep `.npmrc` configured with `save-exact=true`, keep `.yarnrc.yml` configured with `defaultSemverRangePrefix: ""`, and keep `pnpm-workspace.yaml` configured with `savePrefix: ""`.
5. Keep the 14-day release-age policy aligned across supported managers: npm `min-release-age=14`, Yarn `npmMinimalAgeGate: 14d`, pnpm `minimumReleaseAge: 20160`, and Dependabot npm cooldowns of 14 days.
6. For Yarn local use, keep `nodeLinker: node-modules`, `enableHardenedMode: true`, and the npm registry pinned explicitly. Keep install scripts enabled there only because this repository currently needs reviewed native/toolchain install-time scripts.
7. For pnpm local use, keep `packageManagerStrict: false`, `blockExoticSubdeps: true`, `strictDepBuilds: true`, and the reviewed `allowBuilds` list aligned with the current lockfile's install-script packages.
8. Use `npm ci` in CI and automation. Avoid `npm install`, `npm update`, and `npm audit fix` inside CI because they can rewrite the lockfile or change resolution behavior.
9. Verify that `package-lock.json` remains unchanged after every CI install.
10. For metadata-only dependency review, prefer `npm ci --ignore-scripts` in disposable environments or dedicated security jobs.
11. Do not enable a blanket `ignore-scripts=true` setting for normal npm local installs yet. This repository currently depends on toolchain components that use reviewed install-time scripts.
12. Preserve the Axios override guardrails in `package.json` so the compromised releases `1.14.1` and `0.30.4` cannot be selected.
13. Keep Dependabot's npm cooldown aligned with the desired package aging policy so dependency PR timing matches npm's local `min-release-age` behavior.
14. If the organization manages multiple apps, consider an internal npm proxy or policy-enforcing registry so newly published public packages can be delayed or blocked centrally.

### 5. Approval checklist for new dependencies

Every new direct dependency should answer all of the following before merge:

1. Why is a new package necessary instead of existing code, browser APIs, or an already-approved dependency?
2. What is the exact version being introduced?
3. Does it add install-time scripts, native binaries, or external network behavior?
4. Does it significantly expand the transitive dependency graph?
5. Does it have open advisories, suspicious publish patterns, or a weak maintainer posture?
6. Is there a simpler or better-maintained alternative?

### 6. Incident response playbook for dependency compromise

1. Detect: identify the compromised package, versions, affected repos, and affected build agents.
2. Contain: block the versions, stop builds that resolve them, and freeze related dependency updates.
3. Eradicate: remove the package, clear package caches, and rotate any reachable secrets.
4. Recover: rebuild from a known-good lockfile, re-run audit and provenance checks, and compare the new SBOM to the prior one.
5. Review: document timeline, blast radius, and permanent control changes in `docs/SECURITY`.

## Commands To Use During Reviews

```bash
npm audit --json
npm audit --audit-level=high
npm outdated --json
rg '"axios"' package-lock.json
rg 'hasInstallScript' package-lock.json
```

If dependencies are installed locally or in CI, also run:

```bash
npm audit signatures
npm sbom --sbom-format cyclonedx
```

## Planned Follow-up Work

- Re-check `drizzle-kit` on each release until the dev-only `esbuild` advisory chain is resolved upstream.
- Use this checklist on each `drizzle-kit` release review:
  1.  Update only `drizzle-kit` in a disposable branch and regenerate `package-lock.json`.
  2.  Run `npm audit --json` and confirm whether the `@esbuild-kit/* -> esbuild` chain is removed, reduced, or unchanged.
  3.  Run `npm run lint` to catch breakage from CLI or type-generation changes.
  4.  If advisories remain dev-only and no safer stable release exists, keep the current pin, record the result in this document, and defer until the next upstream release.
- Review Dependabot PR cadence after a few update cycles and tune grouping or limits if it creates too much churn.
- Add OIDC-based authentication if future workflows need cloud or package-registry access.
- Keep the secondary Yarn and pnpm configs aligned with the npm policy whenever dependency-management settings change, especially package aging, exact-version defaults, script execution posture, and transitive-source restrictions.

## References

- npm docs: `npm audit`, `npm audit signatures`, trusted publishing, and scopes
- GitHub docs: security hardening for GitHub Actions, dependency review, Dependabot, and `GITHUB_TOKEN` permissions
- Public Axios incident reporting from March and April 2026, including Snyk, Dark Reading, Mondoo, eSentire, and SANS summaries
