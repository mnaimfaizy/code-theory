# Code Theory Ingestion Notes

Sync note: if you update this reference, make the same change in the mirrored copies under `.github/skills/ingestion-generation/references/` and `.claude/skills/ingestion-generation/references/`.

Use these notes when applying the `ingestion-generation` skill in this repository.

## Core pipeline

- input source: URL or file
- fetch/parse to text
- chunk content with overlap
- generate MCQs through an OpenAI-compatible API
- persist source-linked draft questions
- send generated content into review, not directly into the active pool

## Important constraints

- generation should remain provider-agnostic
- environment variables: `LLM_BASE_URL`, `LLM_MODEL`, `LLM_API_KEY`
- each generated question should keep source provenance through `sourceId`
- generated questions must remain `draft` until reviewed

## Main implementation areas

- ingestion pipeline: `src/server/services/ingestion-service.ts`
- LLM calls and chunking: `src/server/services/generation-service.ts`
- question/source persistence: `src/server/services/certification-service.ts`
- CLI import path: `scripts/import-source.ts`

## What to watch for

- bypassing source registration
- losing question provenance
- letting one bad chunk abort the whole import unnecessarily
- storing generated questions as approved or otherwise active by default
- adding provider-specific assumptions that reduce portability
