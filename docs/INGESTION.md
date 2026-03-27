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

## Configuration

Set in `.env.local`:

```env
LLM_BASE_URL=http://localhost:11434/v1   # Ollama default
LLM_MODEL=llama3                          # Model name
LLM_API_KEY=ollama                        # Required by API format but unused locally
```
