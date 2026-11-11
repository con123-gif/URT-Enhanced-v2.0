# Cathedral orchestrator — ❌ FAIL

2026-11-11T00:58:54Z · [run 42933514639](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42933514639) · `4454d1a` · schedule on `newtons-cathedral` · checkpoint #18

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 18 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 18 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 18 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 18 | 5.95s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 18 | 6.16s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 18 | 0.28s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 18 | 3.45s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 18 | 3.26s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 18 | 0.31s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 18 | 0.25s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 15 | 8.23s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 18 | 0.47s |
| native | `native.wilson_source` | native | ✅ pass | 18 | 1.5s |
| native | `native.output_gate` | native | ✅ pass | 18 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 18 | 0.43s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 18 | 0.3s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 18 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 18 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 12 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 8 | 0.24s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 11 | 1.1s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 10 | 53.87s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 9 | 5.79s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 7 | 8.29s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 5 | 17.48s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 4 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 4 | 5.2s |
| research | `research.native_signed_dictionary_k23` | native | ❌ error — KeyError: 'K' | 0 | 8.33s |

## Archive sweep

Executed at least once: **270/270** research scripts. Latest status: error 1, missing_file 24, pass 245.
This run: 270 executed (error 1, missing_file 24, pass 245).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

