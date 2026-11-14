# Cathedral orchestrator — ✅ PASS

2026-11-14T19:35:45Z · [run 43631122148](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43631122148) · `c8bcf3b` · schedule on `newtons-cathedral` · checkpoint #139

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 139 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 139 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 139 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 139 | 16.38s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 139 | 5.68s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 139 | 0.24s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 139 | 4.41s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 139 | 4.0s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 139 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 139 | 0.29s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 136 | 9.6s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 139 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 139 | 1.27s |
| native | `native.output_gate` | native | ✅ pass | 139 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 139 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 139 | 0.38s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 139 | 0.94s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 139 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 133 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 112 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 112 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 132 | 0.9s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 131 | 40.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 130 | 4.38s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 128 | 6.4s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 126 | 13.55s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 125 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 125 | 4.36s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 121 | 27.88s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 121 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 121 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 121 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 121 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 121 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 120 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 119 | 27.81s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 118 | 3.36s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 117 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 116 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 116 | 1.82s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 116 | 4.69s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 116 | 17.38s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 115 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 115 | 53.2s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 115 | 2.2s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 114 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 114 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 113 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 111 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 110 | 90.39s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 109 | 1.53s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 108 | 1.71s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 107 | 3.46s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 105 | 95.39s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 104 | 192.66s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 103 | 30.94s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 102 | 6.92s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 98 | 115.3s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 101 | 14.33s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 99 | 45.92s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 97 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 96 | 2.87s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 95 | 4.25s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 94 | 1.28s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 93 | 2.65s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 92 | 1.73s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 91 | 1.92s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 90 | 1.67s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 88 | 6.68s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 86 | 2.49s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 77 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 76 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 76 | 0.51s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 75 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 75 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 73 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 71 | 13.48s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 70 | 50.57s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 68 | 14.56s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 67 | 18.5s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 62 | 24.16s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 56 | 15.56s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 50 | 52.17s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 46 | 24.83s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 44 | 25.95s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 74 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 73 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 83 | 5.44s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 82 | 1.96s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 81 | 0.83s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 80 | 2.38s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 79 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 78 | 5.4s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 77 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 65 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 64 | 0.5s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 63 | 0.39s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 63 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 63 | 0.27s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 62 | 1.59s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 61 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 61 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 61 | 18.58s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 61 | 0.28s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 61 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 59 | 0.78s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 58 | 0.6s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 57 | 1.03s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 55 | 2.71s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 53 | 0.71s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 51 | 3.26s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 49 | 8.62s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 47 | 0.87s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 43 | 12.19s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 42 | 19.24s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 41 | 5.34s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 41 | 3.63s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 36 | 36.73s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 31 | 30.65s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 20 | 26.57s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 41 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 41 | 124.8s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 39 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 37 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 35 | 1.11s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 34 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 33 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 32 | 0.39s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 30 | 0.69s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 28 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 28 | 2.03s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 28 | 7.28s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 28 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 27 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 27 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 26 | 0.76s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 26 | 0.23s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 25 | 6.44s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 24 | 1.83s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 21 | 24.03s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 21 | 23.98s |
| research | `research.q102_born_current` | conditional | ✅ pass | 21 | 24.27s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 21 | 24.38s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 19 | 33.12s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 18 | 3.42s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 18 | 27.29s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 17 | 27.43s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 16 | 27.54s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 13 | 30.3s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 13 | 47.7s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 14 | 30.25s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 13 | 70.79s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 13 | 52.83s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 12 | 0.4s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 9 | 52.77s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 10 | 2.04s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 8 | 1.02s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 2 | 73.77s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 5 | 0.64s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 4 | 0.72s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 4 | 38.12s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 3 | 0.52s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 2 | 0.52s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 2 | 0.32s |

## Archive sweep

Executed at least once: **412/412** research scripts. Latest status: missing_file 23, pass 388, timeout 1.
This run: 198 executed (missing_file 18, pass 179, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

