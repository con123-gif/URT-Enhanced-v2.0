# Cathedral orchestrator — ✅ PASS

2026-11-12T16:40:49Z · [run 43257699774](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43257699774) · `c538882` · push on `newtons-cathedral` · checkpoint #69

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 69 | 0.06s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 69 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 69 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 69 | 7.37s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 69 | 10.88s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 69 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 69 | 4.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 69 | 4.55s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 69 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 69 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 66 | 11.22s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 69 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 69 | 1.83s |
| native | `native.output_gate` | native | ✅ pass | 69 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 69 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 69 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 69 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 69 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 63 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 42 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 42 | 0.07s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 62 | 1.32s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 61 | 46.58s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 60 | 4.99s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 58 | 7.4s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 56 | 15.35s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 55 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 55 | 5.36s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 51 | 31.87s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 51 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 51 | 0.65s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 51 | 0.6s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 51 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 51 | 2.95s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 50 | 0.19s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 49 | 31.58s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 48 | 3.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 47 | 0.63s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 46 | 1.44s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 46 | 240.58s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 46 | 4.92s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 46 | 19.29s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 45 | 0.57s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 45 | 52.52s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 45 | 2.44s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 44 | 0.18s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 44 | 0.55s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 43 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 41 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 40 | 73.1s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 39 | 1.57s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 38 | 1.7s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 37 | 3.43s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 35 | 66.86s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 34 | 174.76s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 33 | 33.77s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 32 | 6.08s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 28 | 98.49s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 31 | 11.91s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 29 | 39.24s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 27 | 0.29s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 26 | 2.83s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 25 | 4.31s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 24 | 1.33s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 23 | 2.63s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 22 | 1.73s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 21 | 1.88s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 20 | 1.73s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 18 | 7.12s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 16 | 2.57s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 7 | 0.48s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 6 | 0.54s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 6 | 0.54s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 5 | 0.48s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 5 | 0.49s |
| research | `research.q59_time_generator` | native | ✅ pass | 3 | 0.67s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 1 | 15.13s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 4 | 0.71s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 3 | 1.08s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 13 | 7.19s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 12 | 2.5s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 11 | 1.01s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 10 | 2.52s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 9 | 0.8s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 8 | 5.77s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 7 | 0.69s |

## Archive sweep

Executed at least once: **334/334** research scripts. Latest status: missing_file 23, pass 310, timeout 1.
This run: 289 executed (missing_file 23, pass 265, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

