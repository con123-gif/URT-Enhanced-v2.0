# Cathedral orchestrator

One GitHub Actions workflow — `.github/workflows/cathedral-orchestrator.yml` — runs every
automated check in this repository. It replaces the ten separate ARF/recovery workflows of
October–November 2026.

## When it runs
- every hour at :23 (UTC)
- on every push to `newtons-cathedral` that touches research code, tests or `cathedral_core`
- on pull requests into `newtons-cathedral`
- on demand: **Actions → Cathedral orchestrator → Run workflow**

## Where to read results
Branch **`cathedral-research-state`** (only the orchestrator writes it; never merge it):
- `summary.md` — latest verdict, physical status (gates A–F), every check, sweep coverage
- `sweep.md` — latest status of every archived research script
- `state.json` — the checkpoint the next run resumes from
- `history.jsonl` — one line per run, append-only

Each run's page under Actions shows the same summary, and keeps full logs and outputs
(including the native NPZ/JSON) as artifacts for 14 days.

## What it runs
Everything is declared in `registry.toml`. To add, remove or retune a check, edit that
file only — no YAML.

| Stage | What it checks |
|---|---|
| integrity | H64 matrix snapshot sha256; 2026-11-10 manifest; independent recomputation of the handover's numbers (`handover_claims.py`) |
| tests | the full `tests/` suite |
| geometry | all-Platonic hidden algebra; hidden isometry, 24-clock resolvent, Q⁶ = J/64 |
| history | the five 2026-11-10 new_gate scripts |
| native | the archived v61 Wilson / Q96 charged source, then its output gate |
| conditional | source-moment recurrence, observable non-uniqueness, 2×2 and 13+51 Ward algebra |
| sweep | every `research_archive/**/*.py`, resumable: unseen → changed → oldest first |

A gating failure turns the run red (GitHub emails you). Sweep results are reported, never gating:
many archived scripts depend on files or sandboxes (`/mnt/data`) that no longer exist.

## Physical status and the claim guard
The `[[gate]]` entries in `registry.toml` are the research queue: the open problems A–F of the
2026-11-10 handover. A script exiting 0 verifies a computation; it never closes a gate. A gate can be
set to `closed` only with a `proof_check` whose `claim = "derivation"` passes in the same run;
otherwise the run fails. The summary prints the gate table on every run.

## Research sessions (Claude, GPT, Grok)
Each agent works one lane of the Queue in `RESEARCH_LOG.md`, following `RESEARCH_PROTOCOL.md`; the
entry point is `AGENTS.md`.
- **Claude**, every 4 hours, takes `[derive]`.
- **GPT** takes `[compute]`.
- **Grok** takes `[verify]`, `[repair]` and `[review]`.

Paste-ready briefs for GPT and Grok are in `AGENT_BRIEFS.md`. Each session does one unit of work,
registers its certificate here as a `[[check]]`, logs it with the next step, pushes one commit, and
confirms the orchestrator verdict.

## Compute queue
`.github/workflows/cathedral-compute.yml` runs the `[[job]]` entries of `registry.toml` one at a time,
back to back, up to 330 minutes each. When a job finishes it records the result under `compute/<id>/`
on `cathedral-research-state` and dispatches the next job itself; an hourly schedule is the backstop.
Agents queue a job for anything needing more than ~10 minutes of computation.

## Two things worth knowing
- **`run_native_source.py`** executes the archived `microscopic_source_currents.py` unmodified
  (its sha256 is pinned in `RECOVERY_MANIFEST.json`). That script hashes
  `common_action_work/recovery/theory_input_v5.md`, which is not in the repository; run directly it
  computes everything, writes the NPZ and then crashes before writing its checks JSON. The shim records
  that hash as `ABSENT_FROM_REPOSITORY` instead of inventing one. If the file turns up, add it at that
  path and its real hash is recorded automatically.
- **`handover_claims.py`** recomputes the handover's numbers from scratch. One erratum is documented:
  the handover gives p₅ = 6.19613×10⁻⁶; Δ²/(1+Δ²) = 6.196027670655×10⁻⁶, as the repository records.

## Run it locally
```
pip install -r research_archive/cathedral_arf_runner/requirements.txt
python research_archive/2026-10-17_recovery_assets/restore_matrices.py
python research_archive/cathedral_arf_runner/orchestrator.py local --sweep-minutes 5
```
