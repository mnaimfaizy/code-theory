# Dependency and Supply Chain Security Plan

Last updated: 2026-04-10

## Purpose

This document records the current npm and CI supply-chain posture of the Code Theory repository and the measures required to reduce dependency compromise risk. It is written for future maintenance, incident response, and dependency review work.

## Current Repository Assessment

### Confirmed facts from this repository

- The project is an npm-based Next.js application with a committed `package-lock.json`.
- The repository is now explicitly npm-only via `packageManager: npm@10.9.3`.
- Direct dependencies are pinned to exact versions, and `.npmrc` is configured with `save-exact=true` so new `^` or `~` ranges are not introduced by default.
- `package.json` now includes Axios override guardrails so the compromised releases `axios@1.14.1` and `axios@0.30.4` are replaced with safe versions if Axios is ever introduced.
- The current lockfile does not contain `axios`.
- The directly vulnerable top-level package `drizzle-orm` has been remediated to `0.45.2`.
- The remaining advisories are currently limited to a dev-only `drizzle-kit -> @esbuild-kit/* -> esbuild <=0.24.2` chain. `drizzle-kit@0.31.10` is still the newest published version at the time of this update.
- The current lockfile includes install-time script packages. Confirmed examples include `better-sqlite3`, `sharp`, `esbuild`, `fsevents`, `msw`, and `unrs-resolver`, plus nested toolchain copies of `esbuild` used by `drizzle-kit` and `tsx`.
- The repository now includes a root `SECURITY.md`, a supply-chain policy document under `docs/SECURITY/`, pinned GitHub Actions workflows, Dependabot, CODEOWNERS, and an npm defaults file.

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
- Dependabot is configured for both npm and GitHub Actions updates.
- npm version updates now use a 14-day Dependabot cooldown window. GitHub Actions updates remain on the normal schedule because Dependabot cooldown does not apply to the `github-actions` ecosystem.
- `CODEOWNERS` now protects workflows, dependency manifests, lockfiles, and security documentation.
- A repository `SECURITY.md` policy file now defines supported branches and private reporting expectations.
- Remaining gap: the moderate dev-only `drizzle-kit` advisory chain is unresolved upstream today, so the repository should continue isolating it to development workflows and re-check on every `drizzle-kit` release.

### Local tooling observations

- `npm audit signatures` does not currently produce a usable provenance result in this workspace. The current CLI reports: `found no dependencies to audit that were installed from a supported registry`.
- `npm config get min-release-age` returns `undefined`, so the current npm CLI should not be assumed to support release-cooldown policy yet.
- Until the repository upgrades to an npm release that supports `min-release-age`, Dependabot's 14-day npm cooldown is the active release-age control for version update PRs.
- Because this repository still relies on install-time script packages, a blanket `ignore-scripts=true` policy for normal local installs would be disruptive unless the toolchain changes first.
- The practical safe flow for this repo is: review dependencies first with `npm ci --ignore-scripts` in a disposable environment or dedicated CI job, then use normal `npm ci` only when build, lint, runtime, or native module execution is actually required.

### Validation after remediation

- `npm audit --audit-level=high` passes: 0 high, 0 critical.
- `npm audit --json` reports 4 remaining moderate advisories, all in the dev-only `drizzle-kit` transitive `esbuild` chain.
- The current audited dependency footprint is 959 packages: 552 prod, 371 dev, and 164 optional entries in the lockfile metadata.
- `npm run lint` completes with 0 errors and 3 pre-existing warnings unrelated to this security hardening change.

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
6. Completed 2026-04-10: protected `.github/workflows/**`, `package.json`, `package-lock.json`, `.npmrc`, and security documentation with `CODEOWNERS` review.
7. Completed 2026-04-10: enforced frozen lockfile checks after `npm ci` in CI and deployment builds.
8. Completed 2026-04-10: added a no-scripts dependency review install stage with `npm ci --ignore-scripts`.
9. Keep preferring OIDC-based authentication over long-lived cloud or registry secrets in workflows if future automation needs cloud or package publishing access.

### 4. Package manager policy

1. This repository is npm-only. Do not use Yarn or pnpm here unless the repo is formally migrated and equivalent security controls are added.
2. Keep `package-lock.json` committed at all times.
3. Use `npm ci` in CI and automation. Avoid `npm install`, `npm update`, and `npm audit fix` inside CI because they can rewrite the lockfile or change resolution behavior.
4. Verify that `package-lock.json` remains unchanged after every CI install.
5. Use exact versions for direct dependencies. Avoid `^` and `~`, and keep `.npmrc` configured with `save-exact=true`.
6. For metadata-only dependency review, prefer `npm ci --ignore-scripts` in disposable environments or dedicated security jobs.
7. Do not enable a blanket `ignore-scripts=true` setting for normal local installs yet. This repository currently depends on toolchain components that use reviewed install-time scripts.
8. Preserve the Axios override guardrails in `package.json` so the compromised releases `1.14.1` and `0.30.4` cannot be selected.
9. Keep Dependabot's npm cooldown aligned with the desired package aging policy until npm is upgraded to a version that supports `min-release-age`.
10. If the organization manages multiple apps, consider an internal npm proxy or policy-enforcing registry so newly published public packages can be delayed or blocked centrally.

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
- If the repo is ever migrated to Yarn or pnpm, mirror the current npm protections with immutable lockfile mode, disabled lifecycle scripts by default, and equivalent Axios version blocking.

## References

- npm docs: `npm audit`, `npm audit signatures`, trusted publishing, and scopes
- GitHub docs: security hardening for GitHub Actions, dependency review, Dependabot, and `GITHUB_TOKEN` permissions
- Public Axios incident reporting from March and April 2026, including Snyk, Dark Reading, Mondoo, eSentire, and SANS summaries
