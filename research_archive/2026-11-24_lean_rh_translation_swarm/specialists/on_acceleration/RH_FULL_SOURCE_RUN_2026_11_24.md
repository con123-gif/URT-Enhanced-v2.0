# Pinned Alpöge RH — full-source O(N) indexing dispatch

**Date:** 2026-11-24 UTC. **Status:** SOURCE IMPORT SCAN COMPUTE JOB RUNNING; complete human-readable proof OPEN. **Not Lean kernel verification.**

## Live job
- Registered job id: `rh-lean-pinned-full-source-index-20261124` in `research_archive/cathedral_arf_runner/registry.toml`.
- **First GitHub compute run:** https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/45347142308 — runner successfully selected and started job. Completion and outputs not yet inspected.
- Source pinned: `leanprover-community/riemann-hypothesis` commit `40e56bab026552e089d7afcfeff08d2defb9c005`.
- Executable: `specialists/on_acceleration/RH_FULL_SOURCE_SCAN.py`; tests `RH_FULL_SOURCE_SCAN_TEST.py`.
- Script acquires pinned source via Git partial-clone fetch and exact commit-SHA check, reads every Lean module under `src/`, records exact per-file SHA-256 and line/byte counts, builds full reversible `Main` module-import closure, computes a pi/e golden-angle fixed-rank O(V+E) Woodbury rank-2 scheduling vector, and writes `summary.json`, `root_import_dag.json.gz`, `source_file_shas.json.gz`. Warm cache checks compare exact source hashes and graph; unchanged cached scan reopens 0 source bytes.
- **Crucial type boundary:** import closure is NOT elaborated theorem/constant dependency, does not itself simplify an RH theorem, and does not verify any math. Golden ratio schedule is unproven as a prioritization improvement over a conventional graph baseline.

## Executed locally (model's working container)
- Four fail-on-error tests in `RH_FULL_SOURCE_SCAN_TEST.py`: 4/4 passed.
- Extended incremental engine from prior conversational artifact: 12/12 tests passed on local staged implementation, including cache invalidation, comment parsing, graph reversibility and dense Woodbury agreement; this latter engine is not asserted to be the same as the GitHub runner.
- Real Alpöge source excerpt recovery: 11 `.lean` files, 174 lines, 10,879 bytes; reachable modules 8; internal import edges 7; unresolved external imports 12 (expected from incomplete excerpt); fixed-rank residual 2.22e-16; warm source bytes read 0. First local run measured cold ~0.0063 s vs warm ~0.00079 s; such tiny timings fluctuate and do not establish full-scale speedups.
- The full 175k-file archive was **not downloaded in the local container** because the container has no GitHub network DNS; the actual full run must be independently checked in the GitHub compute output.

## Exact asymptotic scope
- Source scanner: O(B) byte processing plus O(F) file enumeration (B all source bytes, F file count), assuming bounded imported-name token parsing per byte.
- Graph reachable traversal: O(V+E), where V reachable modules and E local import edges.
- URT rank-2 Woodbury scheduling: O(V+E) time, O(V) storage with the supplied fixed-rank model, numerical residual checked.
- Cache re-indexing: O(F+E) to enumerate paths and rebuild graph + O(bytes changed); hashing warm files deliberately avoided using mtime_ns+size, so cold pin-verification is retained. Python sorting modules for reproducible manifest contributes O(F log F) work.
- This is an engineering combination of standard graph algorithms and Woodbury elimination with a *fixed* URT phase. Neither a universal O(N) symbolic theorem prover nor a superior URT scheduling quality has been demonstrated.

## RESUME HERE
1. Read `compute/rh-lean-pinned-full-source-index-20261124/status.json` and `outputs/summary.json` on `cathedral-research-state`; inspect the GitHub run 45347142308 and CI test output; distinguish failure from success.
2. If full runner succeeded, report exact 175k-scale module, byte, line and reachable import counts and confirm no source SHA mismatch; distribute artifact locations to kernel extractor and integration bots.
3. Next substantive mathematical step: **extract Lean elaborated constant dependency graph** for `riemannHypothesis` (not just imports); use it to filter proof obligations while preserving every dependent statement and axiom. Compare URT selection to deterministic graph baseline on number of verified, correct human-explanatory lemmas per unit time.
4. If source checkout fails, inspect job stderr and correct the specific shell/Git issue; never claim completed full-source translation from a started job.
