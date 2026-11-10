# Cathedral orchestrator — ✅ PASS

2026-11-10T20:01:36Z · [run 42888823899](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42888823899) · `340ee1c` · pull_request on `claude/cathedral-orchestrator` · checkpoint #2

## Physical status

**Four ARFs: NOT DERIVED.** A passing check verifies a computation; it never closes a gate.

| Gate | | Status | Missing |
|---|---|---|---|
| A | Primitive selection | open | The A5 chronology coefficient and the source weights (4,2,2,0) are not derived from the recurrence; the 24-clock is not derived from the six-bit mixing. |
| B | Charged operator | open | The 192×192 Wilson operator and the Q96 registry are not mapped to H64/H13⊕H51; the 13+51 Ward test uses random blocks, not that operator. |
| C | Gauge selection | open | native.output_gate reports physical_photon_residue = unselected. |
| D | Ward completion | open | Ward identities hold separately on the history sector and on the Wilson sea; not on a joined physical operator. |
| E | Physical observables | open | Six distinct admissible observables of the same source spectrum exist; the history spectrum alone selects none. |
| F | Four ARFs | open | Requires A–E. |

## Checks

| Stage | Check | Claim | Status | Passing runs | Wall |
|---|---|---|---|---|---|
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 2 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 2 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 2 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 2 | 9.58s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 2 | 10.56s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 2 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 2 | 6.21s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 2 | 6.08s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 2 | 0.58s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 2 | 0.42s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 2 | 0.8s |
| native | `native.wilson_source` | native | ✅ pass | 2 | 1.65s |
| native | `native.output_gate` | native | ✅ pass | 2 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 2 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 2 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 2 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 2 | 0.11s |

## Archive sweep

Executed at least once: **256/256** research scripts. Latest status: assertion_failed 1, missing_file 33, pass 222.
This run: 256 executed (assertion_failed 1, missing_file 33, pass 222).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

