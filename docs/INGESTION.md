# Content Ingestion

## Overview

The ingestion pipeline turns documentation (URLs, Markdown, HTML, PDF files) into draft multiple-choice questions attached to a certification.

## Pipeline

```
Input (URL / File) → Fetch / Parse → Extract readable text → Chunk
→ Generate MCQs via local LLM → Store as draft questions → Review queue
```

## Input Sources

| Source     | Method                                                         |
| ---------- | -------------------------------------------------------------- |
| URL (GUI)  | User pastes URL in certification management screen             |
| URL (CLI)  | `npx tsx scripts/import-source.ts --cert <slug> --url <url>`   |
| File (GUI) | User uploads Markdown, HTML, or PDF in management screen       |
| File (CLI) | `npx tsx scripts/import-source.ts --cert <slug> --file <path>` |

## Extraction

- **HTML/URL**: Fetch page, strip nav/header/footer/scripts, extract main content.
- **Markdown**: Parse directly to plain text sections.
- **PDF**: Extract text with quality warnings if extraction is poor.

## Chunking

Content is split into chunks of ~1,000–2,000 tokens with overlap to preserve context across boundaries. Each chunk stores its position and source reference.

## Question Generation

- Provider-agnostic: targets any OpenAI-compatible API (Ollama, LM Studio, etc.).
- Requests structured JSON output: question text, 4 options, correct answer index, explanation, difficulty, confidence.
- Each generated question links back to its source and chunk for provenance.
- All generated questions are created with `status = 'draft'`.

## AI-Supervised Approved Import

For Copilot-driven authoring workflows, the repository also supports a supervisor-reviewed JSON artifact flow:

```text
Input (URL / File) -> Agent reads source -> Ask for desired question types
-> Write review artifact to tmp/*.json -> Human supervisor approves artifact
-> Import approved questions -> Publish directly -> Remove temp artifact
```

- Temp review artifacts should be written under `tmp/` or `temp/`, both ignored by git.
- Use `npm run questions:import-approved -- --file tmp/<artifact>.json` to publish an approved artifact.
- If the artifact requests direct publish and supervisor approval is present, imported questions are stored as `approved`.
- The current database persists `sourceId` and explanations, but detailed per-question references remain in the JSON artifact unless the schema is extended.

## Configuration

Set in `.env.local`:

```env
LLM_BASE_URL=http://localhost:11434/v1   # Ollama default
LLM_MODEL=llama3                          # Model name
LLM_API_KEY=ollama                        # Required by API format but unused locally
```
