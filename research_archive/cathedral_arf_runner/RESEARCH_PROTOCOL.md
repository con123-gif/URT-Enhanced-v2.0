# Research protocol — every agent session (Claude, GPT, Grok)

Every scheduled or manual research session follows this file exactly. Agents do not edit it; only
Con changes it. Entry point: `AGENTS.md` at the repository root.

## 0. Environment facts (do not rediscover)
- Repository `con123-gif/URT-Enhanced-v2.0`, branch `newtons-cathedral`.
- **Claude's sandbox:**
  - Attach the repository with push access and clone it `--depth 1`.
  - numpy, scipy, networkx and pytest are installed; **sympy and mpmath are not, and pip has no network.** Prefer exact stdlib arithmetic (`fractions.Fraction`, integers, explicit Q(√5) pairs) so certificates run locally too.
  - `gh api` can read runs, jobs and job logs. It cannot dispatch workflows, delete branches or download artifacts.
- **GPT and Grok:** sandboxes and GitHub access vary. If you cannot run code, or cannot write to the repository, use §8.
- **GitHub Actions** has numpy, scipy, sympy, mpmath, networkx and pytest. A push touching research code runs the orchestrator (~10 min).
- Run `python research_archive/2026-10-17_recovery_assets/restore_matrices.py` before using the native H64 data.
- The latest CI verdict is `summary.md` on branch `cathedral-research-state`; compute-job results are under `compute/` on the same branch.

## 1. Read, in this order
1. `AGENTS.md`, then `docs/RESEARCH_STATE.md`.
2. `research_archive/cathedral_arf_runner/RESEARCH_LOG.md`: the **Queue** and the newest entries.
3. The `[[gate]]` table in `registry.toml`, and `summary.md` on `cathedral-research-state`.
4. Only the archive files your task needs. Recover archived constructions before writing substitutes.

## 2. Choose exactly one task
1. If the latest orchestrator verdict is FAIL, fix the failing gating check. That is the whole session. A tolerance may change only with a derived error bound written into the code.
2. Otherwise take the first open Queue item in your lane (`AGENTS.md`).
3. Otherwise take any open Queue item.
4. Otherwise take the most concrete sub-question of the lowest open gate's frontier (`RESEARCH_STATE.md` §8), and add it to the Queue as you take it.

## 3. What counts as a result
Each session delivers **one** of these:
- **THEOREM:** exact statement, proof, and an executable certificate.
- **OBSTRUCTION:** an exact no-go or non-uniqueness statement with its scope, plus a certificate.
- **VERIFIED-ARCHIVE:** an archived claim marked "not yet run" or "PASS locally" executed now, with the exact outcome (including failure).
- **REVIEW:** an independent re-derivation of a named recent result, ending AGREE, DISAGREE or PARTIAL. A disagreement states the exact point, with a counterexample or computation. Paraphrase is not a review.
- **INCONCLUSIVE:** what was tried and why it failed, recorded as a dead end so it is not repeated. This commits the log entry only, with no scripts.

Give each result its `docs/CONTINUITY_PROTOCOL.md` status class. Finite results are normally CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Hard rules:
- No fitted constants and no measured physical values as inputs. Historical ARF values may appear only as a final comparison, never upstream.
- No random or synthetic matrices standing in for a named Cathedral operator (v61 Wilson, Q96, H64, U_h, the 24-clock, the five-solid cochains).
- Preserve the full Cathedral scope: five solids / 190 cochains, π–φ–e recurrence, D6→H3, A4/A5, 64 histories with H13⊕H51, hidden 4₃⊕4₅, the 24-clock, the charged sector.
- Check `RESEARCH_STATE.md` §3 before starting; do not retry a listed dead end without a new premise that escapes its stated hypotheses.
- No scripts that merely restate generic identities (Ward identities for arbitrary matrices, partial fractions of a given resolvent).
- Never set a gate's `status` to `closed`. If you believe a gate is closed, add the proof and a `claim = "derivation"` check and say so in the log; Con decides.
- Never edit sha-pinned archive files, `.github/workflows/`, `AGENTS.md` or this protocol. Never commit James's Yang–Mills material.
- Never write PASS, "proved" or "verified" for anything not executed. Say where code ran.

## 4. Where work goes
- New work goes in `research_archive/<YYYY-MM-DD>_<short_topic>/`:
  - `<NAME>.py`: the certificate. It exits non-zero on failure and prints what it proved.
  - `<NAME>.md`: the statement, proof or obstruction, its scope and status class, and what remains open.
- Register the certificate in `registry.toml` as a `[[check]]` with `stage = "research"` and an honest `claim` (`conditional`, `native` or `independent`). Use `gating = true` only if it is deterministic and runs in under 5 minutes.
- **Anything needing more than ~10 minutes of computation** goes in as a `[[job]]` in `registry.toml`; the format is in the file. GitHub runs it back to back with other jobs, up to 330 min each. Its results appear under `compute/<id>/` on `cathedral-research-state`, and a later session reads them and records the result.
- When a result changes the state, update `docs/RESEARCH_STATE.md`. Edit the relevant bullet; do not append a new section.

## 5. Log entry (prepend under `## Log`, newest first)
```
### YYYY-MM-DD HH:MM UTC — <Agent> — Gate X — <title>
- Task: <Queue id and what was attempted>
- Result: THEOREM | OBSTRUCTION | VERIFIED-ARCHIVE | REVIEW | INCONCLUSIVE — <status class>
- Statement: <exact>
- Evidence: <check id or job id>; CI <run URL> <verdict>; executed in <where>
- Dead ends: <approaches that failed, so later sessions skip them>
- Next step: <one precise, executable sub-question>, also added to the Queue with a lane
```

## 6. Commit and verify
1. Exactly one commit per session to `newtons-cathedral`, holding your files, the Queue update (mark the item done with a pointer to your log entry; add follow-up items with lanes) and the log entry.
2. Run `git fetch origin newtons-cathedral && git rebase origin/newtons-cathedral` and push. If the push is rejected, fetch, rebase and retry. On a log or Queue conflict keep both sides' entries.
3. Wait for the orchestrator run your push triggered, and read its verdict.
4. If your check fails on CI, fix it in one follow-up commit or `git revert` yours, and record that. Leave `newtons-cathedral` green.
5. Time box: about 90 minutes. Stop at a clean, pushed state.

## 7. Final message (it reaches Con's phone)
Five lines: task · result type · one-line exact statement · evidence + CI verdict · next step.

## 8. No-write mode (agents that cannot push or cannot run code)
- Do the task anyway.
- Reply with:
  - (a) every new file's full contents, with its repository path;
  - (b) the exact log entry;
  - (c) the Queue line change.
- Con, or the next Claude session, commits it and CI executes it.
- Say plainly which parts you computed by hand and which you executed, and where.

## 9. Queue rules
- Item format: `- [ ] Qn [lane] (gate) task`. When done: `- [x] Qn … — <Agent> <date>: <RESULT> (log entry title)`.
- There is no separate claim commit. If you find on rebase that someone finished your item, record yours as a REVIEW of theirs.
- Number new items with the next free Qn. Keep each one a single, precise, executable sub-question.
