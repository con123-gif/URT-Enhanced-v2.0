# Cathedral orchestrator — ✅ PASS

2026-11-10T23:23:18Z · [run 42921089675](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42921089675) · `a6d617f` · push on `newtons-cathedral` · checkpoint #13

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 13 | 0.07s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 13 | 0.01s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 13 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 13 | 9.7s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 13 | 10.89s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 13 | 0.43s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 13 | 4.78s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 13 | 4.55s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 13 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 13 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 10 | 11.24s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 13 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 13 | 1.62s |
| native | `native.output_gate` | native | ✅ pass | 13 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 13 | 0.43s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 13 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 13 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 13 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 7 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 3 | 0.21s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 6 | 0.98s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 5 | 50.1s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 4 | 5.32s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 2 | 7.73s |

## Archive sweep

Executed at least once: **265/265** research scripts. Latest status: missing_file 24, pass 241.
This run: 265 executed (missing_file 24, pass 241).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

