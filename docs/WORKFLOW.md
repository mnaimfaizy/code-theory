# Workflow

## User Journeys

### 1. Browse & Take a Quiz

```
Home (certification cards) → Select certification → Choose mode, presets or custom question count, and time window
→ Start quiz → Answer questions → Submit → View results → Review answers with detailed explanations and source references when available
→ Retry or return home
```

### 2. Manage Content (Admin)

```
Create certification → Add questions manually  OR  Import from documentation
→ Review draft questions → Approve / Edit / Reject → Questions enter active pool
→ Run deduplication → Resolve flagged duplicates
```

AI-assisted imports can also follow a supervisor-reviewed artifact flow:

```
Provide URL / document → Generate temp JSON artifact with references and explanations
→ Human supervisor approves artifact → Import artifact into target certification
→ Questions publish directly when the approved artifact requests direct publish
```

Existing question banks can also follow a temp review artifact flow:

```
Select certification → Export existing questions and answers to tmp/ or temp/
→ Review in batches → Remove unchanged questions from the artifact
→ Keep only proposed rewrites with preserved question and option ids
→ Validate the artifact before apply
→ Reconcile onto a fresh export if the live database changed during review
→ Apply the reviewed artifact back to the database
```

### 3. Import Documentation

```
Select certification → Provide URL / upload file (Markdown, HTML, PDF)
→ System fetches & extracts content → Chunks content → Generates MCQs via local LLM
→ Questions stored as drafts → Review queue → Approve into pool
```

### 4. Deduplicate Questions

```
Run dedup scan (GUI or terminal) → System flags exact & near-duplicate groups
→ Review flagged groups → Keep / merge / reject duplicates
```

## Quiz Modes

| Mode        | Description                                                                              |
| ----------- | ---------------------------------------------------------------------------------------- |
| **Timed**   | Countdown timer with selectable durations starting at 10 minutes; auto-submits on expiry |
| **Untimed** | No time pressure; submit when ready                                                      |
| **Fixed**   | Questions in their stored order                                                          |
| **Random**  | Questions shuffled each attempt                                                          |

The quiz setup screen remembers the last-used practice settings per certification on the current device.

## Question Lifecycle

```
Draft → (Review) → Approved → Active in pool
                  → Rejected → Archived
```

All generated questions begin as **Draft** and require manual approval before appearing in quizzes.

Question content may include markdown for richer presentation. When a question depends on code, commands, config, JSON, or SQL, store that snippet directly in the question or explanation with fenced code blocks so the quiz UI can render it like an editor surface.
