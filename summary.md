# Cathedral orchestrator — ✅ PASS

2026-11-12T20:51:47Z · [run 43300505238](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43300505238) · `906bae5` · push on `newtons-cathedral` · checkpoint #70

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 70 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 70 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 70 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 70 | 7.74s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 70 | 11.15s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 70 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 70 | 4.99s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 70 | 4.66s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 70 | 0.43s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 70 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 67 | 11.42s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 70 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 70 | 1.23s |
| native | `native.output_gate` | native | ✅ pass | 70 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 70 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 70 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 70 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 70 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 64 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 43 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 43 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 63 | 1.14s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 62 | 52.88s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 61 | 5.67s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 59 | 8.22s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 57 | 17.33s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 56 | 1.95s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 56 | 5.43s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 52 | 36.05s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 52 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 52 | 0.67s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 52 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 52 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 52 | 3.38s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 51 | 0.21s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 50 | 35.66s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 49 | 4.29s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 48 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 47 | 1.7s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 47 | 322.13s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 47 | 5.9s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 47 | 23.57s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 46 | 0.7s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 46 | 73.57s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 46 | 2.88s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 45 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 45 | 0.65s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 44 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 42 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 41 | 84.91s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 40 | 2.1s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 39 | 2.22s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 38 | 4.55s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 36 | 112.01s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 35 | 198.34s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 34 | 39.81s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 33 | 8.93s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 29 | 115.03s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 32 | 18.63s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 30 | 60.43s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 28 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 27 | 3.92s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 26 | 5.93s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 25 | 1.67s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 24 | 3.57s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 23 | 2.38s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 22 | 2.57s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 21 | 2.38s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 19 | 8.57s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 17 | 3.29s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 8 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 7 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 7 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 6 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 6 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 4 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 2 | 17.63s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 1 | 65.64s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 5 | 0.82s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 4 | 1.28s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 14 | 7.09s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 13 | 2.52s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 12 | 1.09s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 11 | 3.06s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 10 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 9 | 6.91s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 8 | 0.8s |

## Archive sweep

Executed at least once: **335/335** research scripts. Latest status: missing_file 23, pass 311, timeout 1.
This run: 306 executed (missing_file 23, pass 283).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

