# Workflow

## User Journeys

### 1. Browse & Take a Quiz

```
Home (certification cards) → Select certification → Choose mode (timed / untimed, fixed / random)
→ Start quiz → Answer questions → Submit → View results → Review answers → Retry or return home
```

### 2. Manage Content (Admin)

```
Create certification → Add questions manually  OR  Import from documentation
→ Review draft questions → Approve / Edit / Reject → Questions enter active pool
→ Run deduplication → Resolve flagged duplicates
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

| Mode        | Description                             |
| ----------- | --------------------------------------- |
| **Timed**   | Countdown timer; auto-submits on expiry |
| **Untimed** | No time pressure; submit when ready     |
| **Fixed**   | Questions in their stored order         |
| **Random**  | Questions shuffled each attempt         |

## Question Lifecycle

```
Draft → (Review) → Approved → Active in pool
                  → Rejected → Archived
```

All generated questions begin as **Draft** and require manual approval before appearing in quizzes.
