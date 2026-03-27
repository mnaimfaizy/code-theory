# Deduplication

## Strategy

Two-pass duplicate detection:

### Pass 1 — Exact / Near-Exact (Fast)

1. Normalize question text: lowercase, strip punctuation, collapse whitespace.
2. Compare normalized hash against all existing approved + draft questions in the same certification.
3. Flag matches as `exact_duplicate`.

### Pass 2 — Fuzzy Similarity

1. Compute string similarity (Levenshtein ratio or similar) between the new question and all pool questions.
2. Flag pairs with similarity ≥ 0.85 as `near_duplicate`.

### Future: Semantic Similarity

Once the core pipeline is stable, add local embedding-based cosine similarity for deeper semantic matching across paraphrased questions.

## Review

- Duplicates are **flagged, never auto-deleted**.
- Flagged groups appear in the review queue with side-by-side comparison.
- User can: keep both, merge (edit one and reject the other), or reject duplicates.

## Usage

**GUI**: Available from the certification management screen under "Scan for Duplicates".

**CLI**:

```bash
npx tsx scripts/dedupe-questions.ts --cert <slug>
npx tsx scripts/dedupe-questions.ts --all
```
