# Code Theory — Documentation

A local-first certification quiz application for personal study and exam preparation.

## Documents

| Document                             | Description                                                  |
| ------------------------------------ | ------------------------------------------------------------ |
| [WORKFLOW.md](WORKFLOW.md)           | End-to-end user and content-management workflows             |
| [ARCHITECTURE.md](ARCHITECTURE.md)   | System boundaries, service layer, data flow                  |
| [DEVELOPMENT.md](DEVELOPMENT.md)     | Local setup, commands, project structure, conventions        |
| [DATABASE.md](DATABASE.md)           | Schema design, SQLite/PostgreSQL portability, migrations     |
| [INGESTION.md](INGESTION.md)         | URL/file import, chunking, provenance, local LLM integration |
| [DEDUPLICATION.md](DEDUPLICATION.md) | Duplicate detection rules, thresholds, review behaviour      |
| [DEPLOYMENT.md](DEPLOYMENT.md)       | Local-first operation and optional production deployment     |

## Quick Start

```bash
npm install
cp .env.example .env.local
npm run db:push        # create SQLite database
npm run db:seed        # seed demo data
npm run dev            # start dev server on http://localhost:3000
```
