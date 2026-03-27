---
name: ingestion-generation
description: Work safely on documentation import, content extraction, chunking, LLM-backed question generation, and provenance tracking in this repository. Use when the task affects URL or file ingestion, local LLM integration, source registration, chunk-to-question generation, or generated question persistence. Preserve the repo rules that generation is OpenAI-compatible, sources retain provenance, and generated questions remain drafts until reviewed.
argument-hint: ingestion flow, source type, service, or generation change
---

Sync note: this skill is mirrored in `.github/skills/ingestion-generation/`, `.claude/skills/ingestion-generation/`, and `.agents/skills/ingestion-generation/`. When editing this file, keep the mirrored `SKILL.md` and `references/` files aligned.

# Ingestion Generation

Use this skill for source import, parsing, chunking, MCQ generation, and provenance-preserving persistence.

## Workflow

### 1. Read ingestion and generation context first

Before changing behavior, read [repo ingestion notes](./references/code-theory-ingestion.md) and inspect the current generation and ingestion services.

The main source files are:

- `docs/INGESTION.md`
- `src/server/services/ingestion-service.ts`
- `src/server/services/generation-service.ts`
- `src/server/services/certification-service.ts`
- `scripts/import-source.ts`

### 2. Preserve the ingestion contract

These rules should hold unless the task explicitly changes them:

- ingestion accepts URL and file-based sources
- content is extracted to readable text before chunking
- chunking preserves context with overlap
- generation uses an OpenAI-compatible API contract
- generated questions keep source provenance
- generated questions are stored as `draft`

Do not optimize away provenance or review gating.

### 3. Keep provider integration generic

The LLM integration targets a local OpenAI-compatible endpoint. Maintain that abstraction.

- use `LLM_BASE_URL`, `LLM_MODEL`, and `LLM_API_KEY`
- do not hardcode provider-specific assumptions
- keep request and response handling resilient to malformed model output
- preserve structured output expectations where possible

### 4. Treat ingestion as a pipeline

Think in stages:

- register source
- fetch or parse content
- normalize text
- chunk content
- generate MCQs per chunk
- filter low-confidence or bad output
- persist source-linked draft questions

Changes should preserve pipeline clarity and failure isolation.

### 5. Verify end-to-end behavior

After edits, check that:

- sources still register correctly
- URL/file paths still map to the right extraction path
- chunking still produces sane boundaries
- generation failures do not corrupt the whole import flow
- stored questions remain linked to their source and remain drafts
- CLI and UI ingestion paths still align with the same services

## Output expectations

When this skill is active, favor robustness, provenance, and reviewability over maximizing raw generation count.

Generated content is only useful if it can be traced, reviewed, and safely promoted into the active question pool.
