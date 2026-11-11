# Cathedral orchestrator — ✅ PASS

2026-11-11T09:37:07Z · [run 42994056331](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42994056331) · `316cbdf` · push on `newtons-cathedral` · checkpoint #37

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 37 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 37 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 37 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 37 | 7.2s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 37 | 6.88s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 37 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 37 | 3.46s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 37 | 3.41s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 37 | 0.35s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 37 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 34 | 8.15s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 37 | 0.46s |
| native | `native.wilson_source` | native | ✅ pass | 37 | 1.31s |
| native | `native.output_gate` | native | ✅ pass | 37 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 37 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 37 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 37 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 37 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 31 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 10 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 10 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 30 | 1.15s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 29 | 56.55s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 28 | 5.82s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 26 | 8.38s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 24 | 18.37s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 23 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 23 | 5.23s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 19 | 36.71s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 19 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 19 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 19 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 19 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 19 | 3.88s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 18 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 17 | 36.74s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 16 | 4.47s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 15 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 14 | 1.63s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 14 | 329.36s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 14 | 5.66s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 14 | 23.28s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 13 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 13 | 61.75s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 13 | 2.94s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 12 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 12 | 0.64s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 11 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 9 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 8 | 88.92s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 7 | 1.82s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 6 | 2.02s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 5 | 4.02s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 3 | 95.52s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 2 | 192.87s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 1 | 38.17s |

## Archive sweep

Executed at least once: **302/302** research scripts. Latest status: missing_file 22, pass 279, timeout 1.
This run: 249 executed (missing_file 17, pass 231, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

