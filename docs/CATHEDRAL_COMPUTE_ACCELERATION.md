# Cathedral exact-computation acceleration — GPT / Claude / Grok handoff

Date: 2026-11-13. Owner direction: stop duplicating calculations, preserve results, and direct computation toward first-principles ARFs. Applies to **all agents**, interactive and scheduled. Read after RESEARCH_STATE; subordinate to AGENTS.md, RESEARCH_PROTOCOL.md and CONTINUITY_PROTOCOL.md. This is an operational improvement, **not** a new physical theorem and not permission to change gates.

## Non-negotiable workflow

1. **Preflight and coordination.** Read the required files in prescribed order, latest CI summary, Queue and newest work-in-progress. If CI FAIL, repair first. Stay on ACTIVE PROBLEM A; choose an untried, nonoverlapping exact subquestion. Before proposing a calculation, search registry, logs, original code, and prior Q81–Q89 artifacts for an equivalent result. Explicitly record what is reused and what is genuinely new. Claude handles derivation, GPT bounded exact certificates, Grok independent review; these are coordination lanes, not permission to work on unrelated gates.
2. **Canonical source, never substitutes.** Load original named Cathedral operators, preserving the five solids/190 cochains, D6→H3, H13⊕H51, hidden 4₃⊕4₅, 24-clock and charged sectors as applicable. Keep exact input provenance and SHA. No synthetic stand-ins, fitted coefficients, empirical values, or historical ARF outputs upstream.
3. **Reuse verified algebra.** Factor repeated dictionary construction, exact projectors, symmetry orbit maps, and source evaluation into reusable modules, **only after** reproducing original source outputs. Cache exact immutable matrices and intermediate rational/algebraic representations with input hashes. A cached object is invalid if operator provenance or assumptions change. Do not silently treat Q84–Q89 local-only artifacts as CI-certified or as repository files.
4. **Reduce before expanding.** First compute orbit stabilizers, invariant subspaces, ranks, minimal polynomials, and independent constraint rows. Evaluate only an exact basis of genuinely independent conditions, then transport to other dictionaries with a proved covariance map. If covariance is not proved, execute each case. For radicals use explicit algebraic-number fields or minimal-polynomial reduction; use floating point only as a diagnostic, never as proof.
5. **Three verification channels.** (a) symbolic proof/certificate, (b) independent exact or high-precision counterexample search with clearly distinct status, (c) reproducibility review on fresh process/CI. Parallelise only independent, nonoverlapping calculations and never have two agents claim the same Queue item. Use the compute registry for runs exceeding 10 minutes; do not hold fragile interactive context open for hours.
6. **One decisive question per run.** Each task must state a falsifiable exact claim, an executable failure condition, and the specific Gate A missing object it advances: native chronology coefficient, its primitive selection, or physical source/observable map. Prefer Q90's exact unnormalised Fourier energies **only after** verifying Q89's local-only source certificate and its source provenance. Two clock Fourier modes are not four physical ARFs.
7. **Persist and verify.** Execute a standalone fail-on-error certificate locally. Commit script, mathematical statement, registry [[check]], Queue transition and dated log entry together with fresh-parent lease; do not edit protected files/workflows, close gates or commit James's Yang–Mills work. Check the next GitHub Actions verdict. Report **pending** until CI actually passes. If write or execution fails, provide complete proposed files and exact patches, labeled NOT COMMITTED / NOT EXECUTED.
8. **Stop conditions and handoff.** End each run with the smallest exact new result, evidence, a named obstruction if encountered, and exactly one next executable question. Add a RESUME HERE line with the next command and source paths. No repeated long exposition, no unsupported breakthroughs, no re-running a closed result without a new contradiction.

## Shared reusable engine — implementation order

- **Phase 1: source inventory.** Index original operator constructors, input hashes, and their existing exact certificates; establish a single canonical import path without altering SHA-pinned files.
- **Phase 2: exact invariant kernel.** Implement reusable exact matrix/orbit/rank/constraint functions (stdlib Fraction and Q(√5) pairs where possible; SymPy on CI where necessary); test against already certified native values.
- **Phase 3: source adapter.** Evaluate the original Q81 nonlinear source with exact algebraic reduction; verify Q89's three constraints independently across eight dictionaries. Preserve failures and timeouts as evidence, not success.
- **Phase 4: Q90 and beyond.** Compute exact unnormalised k=6,18 Fourier energies and dictionary invariance; then map only proved invariants toward the Gate A chronology coefficient and A5 quartet residues.

## Efficiency metrics (record in each handoff)

- Exact independent constraints before/after symmetry reduction.
- Local and CI wall time, peak memory if available, cache hits and input hashes.
- Number of **new** certified mathematical claims, and whether the physical gate actually advanced.
- Duplicate calculations avoided and unresolved source assumptions.

**Scope warning:** The current orchestrator PASS verifies registered repo checks, not Q84–Q89 local-only claims, the four ARFs, or a physical theory. The source weights (4,2,2,0) are already reported as c-independent on the selected orbit in Q82; do not confuse those A5 quartet weights with Q89's clock Fourier modes.

## Implementation status (2026-11-13, Claude)

Phases 1–4 are implemented in `cathedral_engine/`; see `docs/CATHEDRAL_ENGINE.md`.

- Every ported operator is regression-tested against the original code (`tests/test_cathedral_engine.py`).
- The arithmetic is exact: stdlib and numpy only, with certified radical towers.
- Caches are content-addressed.
- Verified results go in `research_archive/cathedral_arf_runner/evidence.jsonl`.
- Phase 3 is done: Q88 is reconstructed and Q89 is independently confirmed (`research_archive/2026-11-13_q88_q89_engine_recovery/`).
- Phase 4 is done: the Q90 exact energies are GPT's `2026-11-13_q90_exact_fourier/` and Claude's independent review with extensions, `2026-11-13_q90_source_clock_energies/`.
- Speed-ups are measured, not estimated: `research_archive/2026-11-13_cathedral_engine/BENCHMARK_LOCAL.md`, and on CI in `engine.benchmark`.

Resume with `python -m cathedral_engine status`.
