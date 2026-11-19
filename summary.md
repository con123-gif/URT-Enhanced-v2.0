# Cathedral orchestrator — ✅ PASS

2026-11-19T13:34:24Z · [run 44531624624](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44531624624) · `ef364ca` · push on `newtons-cathedral` · checkpoint #241

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 241 | 0.06s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 241 | 0.01s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 241 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 241 | 21.19s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 241 | 6.66s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 241 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 241 | 6.28s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 241 | 6.0s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 241 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 241 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 238 | 14.95s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 241 | 0.76s |
| native | `native.wilson_source` | native | ✅ pass | 241 | 1.42s |
| native | `native.output_gate` | native | ✅ pass | 241 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 241 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 241 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 241 | 0.92s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 241 | 0.11s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 64 | 0.1s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 64 | 0.25s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 64 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 64 | 1.25s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 64 | 45.73s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 64 | 4.51s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 64 | 8.49s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 64 | 17.57s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 64 | 1.62s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 64 | 4.32s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 64 | 36.77s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 64 | 0.25s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 64 | 0.71s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 64 | 0.49s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 64 | 0.65s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 64 | 4.04s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 64 | 0.18s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 64 | 28.21s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 64 | 4.53s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 64 | 0.73s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 64 | 1.33s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 218 | 1.69s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 64 | 4.69s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 64 | 23.11s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 64 | 0.75s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 64 | 52.66s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 64 | 2.28s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 64 | 0.2s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 64 | 0.63s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 64 | 0.09s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 64 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 212 | 56.99s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 64 | 1.83s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 64 | 2.04s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 64 | 3.33s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 207 | 64.61s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 206 | 137.57s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 64 | 31.28s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 64 | 8.09s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 200 | 78.57s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 64 | 16.69s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 64 | 39.27s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 64 | 0.26s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 64 | 3.38s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 64 | 5.11s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 64 | 1.32s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 64 | 2.68s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 64 | 2.05s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 64 | 2.3s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 64 | 1.74s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 64 | 6.78s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 64 | 3.1s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 64 | 0.63s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 64 | 0.55s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 64 | 0.5s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 64 | 0.6s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 64 | 0.64s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 64 | 0.67s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 64 | 13.91s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 64 | 67.49s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 64 | 19.01s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 64 | 20.23s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 64 | 24.75s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 64 | 20.14s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 64 | 68.68s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 64 | 25.01s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 64 | 25.99s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 64 | 0.99s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 64 | 1.45s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 64 | 7.23s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 64 | 1.9s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 64 | 1.16s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 64 | 3.11s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 64 | 0.8s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 64 | 5.4s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 64 | 0.96s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 64 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 64 | 0.52s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 64 | 0.41s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 64 | 0.33s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 64 | 0.36s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 64 | 1.69s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 64 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 64 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 64 | 27.33s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 64 | 0.32s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 64 | 0.34s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 64 | 0.99s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 64 | 0.77s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 64 | 1.12s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 64 | 2.6s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 64 | 0.97s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 64 | 4.41s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 64 | 11.4s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 64 | 0.83s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 64 | 18.3s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 64 | 30.98s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 143 | 2.92s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 143 | 1.9s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 138 | 21.32s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 64 | 30.75s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 64 | 27.63s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 143 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 143 | 74.58s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 64 | 0.39s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 64 | 0.56s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 64 | 1.39s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 64 | 0.37s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 64 | 1.48s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 64 | 0.55s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 64 | 0.81s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 64 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 64 | 2.73s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 64 | 11.46s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 64 | 0.08s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 64 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 64 | 0.06s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 64 | 1.09s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 64 | 0.26s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 64 | 6.3s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 64 | 2.39s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 64 | 38.25s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 64 | 32.0s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 64 | 23.64s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 64 | 38.32s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 64 | 51.36s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 64 | 3.72s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 64 | 27.12s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 64 | 42.52s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 64 | 42.51s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 64 | 37.77s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 115 | 33.09s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 64 | 30.47s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 115 | 44.35s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 64 | 69.7s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 64 | 0.51s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 64 | 57.01s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 64 | 2.0s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 64 | 1.3s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 104 | 45.71s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 64 | 0.87s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 64 | 0.85s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 106 | 24.55s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 64 | 0.51s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 64 | 0.7s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 64 | 0.42s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 64 | 57.68s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 64 | 43.87s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 64 | 4.44s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 99 | 25.12s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 64 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 64 | 0.34s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 64 | 0.26s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 64 | 0.28s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 64 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 64 | 1.88s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 64 | 0.57s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 64 | 0.76s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 64 | 0.8s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 64 | 0.81s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 64 | 2.11s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 64 | 1.79s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 64 | 26.92s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 64 | 0.18s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 64 | 0.92s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 64 | 0.33s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 64 | 2.6s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 64 | 2.12s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 64 | 6.18s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 64 | 23.48s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 63 | 11.69s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 62 | 1.33s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 60 | 1.94s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 59 | 1.53s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 58 | 2.45s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 57 | 20.89s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 56 | 18.32s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 54 | 0.84s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 52 | 1.46s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 51 | 1.62s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 51 | 0.68s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 51 | 0.67s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 51 | 0.74s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 51 | 0.76s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 50 | 0.28s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 49 | 0.2s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 47 | 34.62s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 44 | 26.87s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 44 | 10.61s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 43 | 2.09s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 42 | 46.88s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 42 | 25.39s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 41 | 90.05s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 40 | 3.05s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 39 | 11.55s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 39 | 39.29s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 39 | 39.5s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 38 | 1.93s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 37 | 3.68s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 36 | 9.81s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 35 | 3.37s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 33 | 0.61s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 32 | 0.71s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 31 | 0.71s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 30 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 29 | 1.38s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 27 | 0.64s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 25 | 3.49s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 24 | 6.32s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 23 | 10.73s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 22 | 11.38s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 21 | 29.19s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 20 | 0.64s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 18 | 0.82s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 17 | 0.84s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 16 | 0.89s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 15 | 1.2s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 14 | 0.54s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 13 | 0.45s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 11 | 0.34s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 10 | 0.48s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 9 | 0.62s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 7 | 0.83s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 6 | 5.57s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 5 | 4.37s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 4 | 16.52s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 3 | 6.25s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 2 | 17.0s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 1 | 34.53s |

## Archive sweep

Executed at least once: **511/511** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 484, timeout 3.
This run: 302 executed (missing_file 18, pass 284).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

