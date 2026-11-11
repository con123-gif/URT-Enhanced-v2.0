# Cathedral orchestrator — ✅ PASS

2026-11-11T01:16:35Z · [run 42935248782](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42935248782) · `bd731d3` · push on `newtons-cathedral` · checkpoint #19

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 19 | 0.03s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 19 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 19 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 19 | 9.25s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 19 | 9.74s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 19 | 0.35s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 19 | 4.78s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 19 | 4.67s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 19 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 19 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 16 | 11.51s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 19 | 0.62s |
| native | `native.wilson_source` | native | ✅ pass | 19 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 19 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 19 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 19 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 19 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 19 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 13 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 9 | 0.25s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 12 | 1.17s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 11 | 57.21s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 10 | 5.88s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 8 | 8.42s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 6 | 17.88s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 5 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 5 | 5.26s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 1 | 36.72s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 1 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 1 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 1 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 1 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 1 | 3.93s |

**Changed since last run:** `research.native_signed_dictionary_k23` error → pass

## Archive sweep

Executed at least once: **279/279** research scripts. Latest status: missing_file 24, pass 255.
This run: 279 executed (missing_file 24, pass 255).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

