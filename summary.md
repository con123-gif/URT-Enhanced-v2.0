# Cathedral orchestrator — ❌ FAIL

2026-11-11T00:43:17Z · [run 42932002146](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42932002146) · `4454d1a` · push on `newtons-cathedral` · checkpoint #17

**Gating failures:** `research.native_signed_dictionary_k23`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 17 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 17 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 17 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 17 | 9.62s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 17 | 10.54s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 17 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 17 | 3.37s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 17 | 3.22s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 17 | 0.3s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 17 | 0.23s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 14 | 7.82s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 17 | 0.42s |
| native | `native.wilson_source` | native | ✅ pass | 17 | 1.65s |
| native | `native.output_gate` | native | ✅ pass | 17 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 17 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 17 | 0.36s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 17 | 0.9s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 17 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 11 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 7 | 0.21s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 10 | 1.09s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 9 | 50.16s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 8 | 5.4s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 6 | 8.01s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 4 | 16.4s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 3 | 2.02s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 3 | 5.45s |
| research | `research.native_signed_dictionary_k23` | native | ❌ error — KeyError: 'K' | 0 | 7.87s |

## Archive sweep

Executed at least once: **270/270** research scripts. Latest status: error 1, missing_file 24, pass 245.
This run: 270 executed (error 1, missing_file 24, pass 245).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

