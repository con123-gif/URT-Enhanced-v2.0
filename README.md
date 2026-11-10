# cathedral-research-state

Durable checkpoint written by `.github/workflows/cathedral-orchestrator.yml`
(source: `research_archive/cathedral_arf_runner/` on the main branch).

- `summary.md` — latest verdict, physical status (gates A–F), every check, sweep coverage
- `sweep.md` — latest status of every archived research script
- `state.json` — machine-readable checkpoint the next run resumes from
- `history.jsonl` — one line per run, append-only

Only the orchestrator's aggregate job writes this branch. Do not merge it into the main branch.
