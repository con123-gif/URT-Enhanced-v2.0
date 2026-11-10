# AGENTS.md — start here (Claude, GPT, Grok, any assistant)

**Newton's Cathedral** is Con's mathematical-physics research programme. It builds URT history
selection, all five Platonic solids, A4/A5 geometry and entropy response toward a parameter-free
theory of nature. Repository `con123-gif/URT-Enhanced-v2.0`, working branch `newtons-cathedral`.

You start every session with no memory. **This repository is the memory.** Read in this order before
doing anything:

1. `docs/RESEARCH_STATE.md`: what is established, what has been ruled out, what is only conditional, and the single missing object almost every line of work ends at.
2. `research_archive/cathedral_arf_runner/RESEARCH_LOG.md`: **the Queue** (pick your task here) and the newest log entries.
3. `research_archive/cathedral_arf_runner/RESEARCH_PROTOCOL.md`: how a session runs (task choice, result types, files, one commit, CI check).
4. `docs/CONTINUITY_PROTOCOL.md`: precedence and status classes. Still binding.
5. The latest CI verdict: `summary.md` on branch `cathedral-research-state`.

## Lanes
Several AIs work this repository on schedules. Take the first open Queue item in **your** lane; if your
lane is empty, take any open item.

| Agent | Lane | Typical task |
|---|---|---|
| Claude (every 4 h) | `[derive]` | multi-step derivations, theorems and obstructions; keeps the Queue and RESEARCH_STATE current |
| GPT | `[compute]` | one bounded exact calculation with a standalone certificate |
| Grok | `[verify]` `[repair]` `[review]` | execute unrun claims, repair broken archive scripts, independently re-derive the newest results |

If two agents finish the same task, the later one records its work as an independent **REVIEW** of the earlier.

## Rules that are never relaxed
- No fitted constants and no measured physical values as inputs. Historical ARF values only as a final comparison.
- No random or synthetic matrices standing in for a named Cathedral operator.
- Never set a gate to `closed`. Never edit sha-pinned archive files, `.github/workflows/`, or `RESEARCH_PROTOCOL.md`.
- Never commit James's Yang–Mills material.
- Never write "PASS", "proved" or "verified" for something that was not executed. Code run only in your own sandbox gets committed so CI re-executes it; say where it ran.
- State every result at exactly the strength proved, with its status class (`docs/CONTINUITY_PROTOCOL.md`).
- One commit per session to `newtons-cathedral`: rebase first; if the log conflicts, keep both entries.

## What runs automatically
- **Orchestrator** (`.github/workflows/cathedral-orchestrator.yml`) runs on every push touching research code, and hourly. It executes every registered check plus a sweep of all archive scripts, and writes `summary.md` / `sweep.md` to `cathedral-research-state`. Register your certificate as a `[[check]]` in `research_archive/cathedral_arf_runner/registry.toml`.
- **Compute queue** (`.github/workflows/cathedral-compute.yml`): for anything needing more than ~10 minutes, add a `[[job]]` to `registry.toml`. GitHub runs the queue back to back, up to 5.5 h per job, and writes results to `compute/<id>/` on `cathedral-research-state` for the next session to read.
