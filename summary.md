# Cathedral orchestrator — ✅ PASS

2026-11-10T20:26:37Z · [run 42892169483](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42892169483) · `7fc0078` · push on `newtons-cathedral` · checkpoint #4

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 4 | 0.06s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 4 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 4 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 4 | 9.47s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 4 | 8.84s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 4 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 4 | 4.67s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 4 | 4.63s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 4 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 4 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 1 | 11.49s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 4 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 4 | 1.7s |
| native | `native.output_gate` | native | ✅ pass | 4 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 4 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 4 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 4 | 0.58s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 4 | 0.09s |

## Archive sweep

Executed at least once: **256/256** research scripts. Latest status: assertion_failed 1, missing_file 33, pass 222.
This run: 256 executed (assertion_failed 1, missing_file 33, pass 222).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

