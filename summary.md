# Cathedral orchestrator — ✅ PASS

2026-11-11T00:24:25Z · [run 42929531988](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42929531988) · `216b173` · push on `newtons-cathedral` · checkpoint #15

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 15 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 15 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 15 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 15 | 5.96s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 15 | 10.94s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 15 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 15 | 3.7s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 15 | 3.25s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 15 | 0.3s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 15 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 12 | 7.93s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 15 | 0.42s |
| native | `native.wilson_source` | native | ✅ pass | 15 | 0.98s |
| native | `native.output_gate` | native | ✅ pass | 15 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 15 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 15 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 15 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 15 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 9 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 5 | 0.24s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 8 | 1.22s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 7 | 54.65s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 6 | 5.93s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 4 | 8.48s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 2 | 17.65s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 1 | 1.9s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 1 | 5.31s |

## Archive sweep

Executed at least once: **268/268** research scripts. Latest status: missing_file 24, pass 244.
This run: 268 executed (missing_file 24, pass 244).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

