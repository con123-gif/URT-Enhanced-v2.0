# Cathedral orchestrator — ❌ FAIL

2026-11-11T00:33:58Z · [run 42931024568](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42931024568) · `6b2eee1` · push on `newtons-cathedral` · checkpoint #16

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 16 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 16 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 16 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 16 | 7.09s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 16 | 5.96s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 16 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 16 | 6.24s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 16 | 6.15s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 16 | 0.59s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 16 | 0.43s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 13 | 15.13s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 16 | 0.85s |
| native | `native.wilson_source` | native | ✅ pass | 16 | 1.47s |
| native | `native.output_gate` | native | ✅ pass | 16 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 16 | 0.36s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 16 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 16 | 0.5s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 16 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 10 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 6 | 0.19s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 9 | 1.03s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 8 | 46.01s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 7 | 4.98s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 5 | 7.23s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 3 | 14.85s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 2 | 1.69s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 2 | 4.81s |
| research | `research.native_signed_dictionary_k23` | native | ❌ error — KeyError: 'K' | 0 | 7.27s |

## Archive sweep

Executed at least once: **269/269** research scripts. Latest status: error 1, missing_file 24, pass 244.
This run: 269 executed (error 1, missing_file 24, pass 244).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

