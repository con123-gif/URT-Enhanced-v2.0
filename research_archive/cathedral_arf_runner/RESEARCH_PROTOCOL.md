# Research protocol — scheduled Cathedral sessions

Every scheduled research session follows this file exactly. Sessions do not edit it; only Con changes it.

## 0. Environment facts (do not rediscover)
- Repo `con123-gif/URT-Enhanced-v2.0`, default branch `newtons-cathedral`. Attach with push access, clone `--depth 1`.
- Session sandbox: numpy, scipy, networkx, pytest available; **sympy and mpmath are NOT installed and pip has no network.** Prefer exact stdlib arithmetic (`fractions.Fraction`, integers, explicit Q(√5) pairs) so certificates run locally too. GitHub Actions has numpy, scipy, sympy, mpmath, networkx, pytest.
- Before using numpy/scipy locally, run `python research_archive/2026-10-17_recovery_assets/restore_matrices.py` (restores the H64 snapshot, sha256-checked).
- `gh api` can read runs, jobs and job logs. It cannot dispatch workflows, delete branches or download artifacts. A push to `newtons-cathedral` that touches research code triggers `.github/workflows/cathedral-orchestrator.yml` (~10 min).
- Latest CI verdict: `summary.md` on branch `cathedral-research-state` (clone that branch with `--depth 1`).

## 1. Read, in this order
1. `research_archive/cathedral_arf_runner/RESEARCH_LOG.md`: the top entry's **Next step** is your default task.
2. `research_archive/cathedral_arf_runner/registry.toml`: the `[[gate]]` table (A–F) is the research queue.
3. `summary.md` on `cathedral-research-state`.
4. Only the archive files the chosen step needs. Recover archived constructions before writing substitutes.

## 2. Choose exactly one task
1. If the latest orchestrator verdict is FAIL, fix the failing gating check. That is the whole session. A tolerance may only change with a derived error bound written into the code.
2. Otherwise do the top log entry's **Next step**.
3. Otherwise take the lowest-lettered open gate and the most concrete sub-question its `missing` text implies.

## 3. What counts as a result
Each session delivers **one** of these:
- **THEOREM:** exact statement, proof, and an executable certificate that checks it.
- **OBSTRUCTION:** an exact no-go or non-uniqueness statement (e.g. "a one-parameter family survives every stated constraint") with a certificate.
- **VERIFIED-ARCHIVE:** an archived claim marked "not yet run" or "PASS locally" that has now been executed, with the exact outcome recorded (including failure).
- **INCONCLUSIVE:** what was tried and why it failed, recorded as a dead end so it is not repeated. Commit the log entry only; no scripts.

Hard rules:
- No fitted constants and no measured physical values as inputs. Historical ARF values may appear only as a final comparison, never upstream.
- No random or synthetic matrices standing in for a named Cathedral operator (v61 Wilson, Q96, H64, U_h, the 24-clock, the five-solid cochains).
- Preserve the full Cathedral scope: five solids / 190 cochains, π–φ–e recurrence, D6→H3, A4/A5, 64 histories with H13⊕H51, hidden 4₃⊕4₅, the 24-clock, the charged sector.
- No scripts that merely restate generic identities (Ward identities for arbitrary matrices, partial fractions of a given resolvent).
- Never set a gate's `status` to `closed`. If you believe a gate is closed, add the proof and a `claim = "derivation"` check and say so in the log. Con decides.
- Never edit sha-pinned archive files (`RECOVERY_MANIFEST.json`, any `MANIFEST.sha256` entry) or this protocol. Never commit James's Yang–Mills material.
- State results at exactly the strength proved. "Conditional on X" when conditional.

## 4. Where work goes
- New work: `research_archive/<YYYY-MM-DD>_<short_topic>/` with
  - `<NAME>.py`: the certificate; exits non-zero on failure; prints what it proved
  - `<NAME>.md`: the statement, proof or obstruction, scope, and what remains open
- Register the certificate in `registry.toml` as a `[[check]]` with `stage = "research"` and the honest `claim` (`conditional`, `native` or `independent`). Use `gating = true` only if it is deterministic and runs in under 5 minutes.
- Run it locally if the sandbox allows (`python research_archive/cathedral_arf_runner/orchestrator.py run-stage research --out /tmp/r`); otherwise CI runs it.

## 5. Log entry (prepend under `## Log`, newest first)
```
### YYYY-MM-DD HH:MM UTC — Gate X — <title>
- Task: <what was attempted and why it was the next step>
- Result: THEOREM | OBSTRUCTION | VERIFIED-ARCHIVE | INCONCLUSIVE
- Statement: <exact>
- Evidence: <check id>; CI <run URL> <verdict>
- Dead ends: <approaches that failed, so later sessions skip them>
- Next step: <one precise, executable sub-question>
```

## 6. Commit and verify
1. Exactly one commit per session, to `newtons-cathedral`: `git fetch origin newtons-cathedral && git rebase origin/newtons-cathedral`, then push. If the push is rejected (others push here too), fetch, rebase and retry.
2. Wait for the orchestrator run your push triggered and read its verdict through `gh api`.
3. If your check fails on CI, fix it in one follow-up commit or `git revert` yours, and record that in the log. Leave `newtons-cathedral` green.
4. Time box: about 90 minutes. Stop at a clean, pushed state.

## 7. Final message (it is sent to Con's phone)
Five lines: gate · result type · one-line exact statement · check id + CI verdict · next step.
