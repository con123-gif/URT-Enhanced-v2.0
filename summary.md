# Cathedral orchestrator — ✅ PASS

2026-11-17T19:29:13Z · [run 44155689580](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44155689580) · `930f608` · push on `newtons-cathedral` · checkpoint #204

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 204 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 204 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 204 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 204 | 21.05s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 204 | 7.07s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 204 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 204 | 6.11s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 204 | 6.06s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 204 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 204 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 201 | 14.86s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 204 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 204 | 1.44s |
| native | `native.output_gate` | native | ✅ pass | 204 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 204 | 0.33s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 204 | 0.22s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 204 | 0.55s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 204 | 0.08s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 27 | 0.14s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 27 | 0.19s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 27 | 0.02s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 27 | 0.64s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 27 | 54.6s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 27 | 3.87s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 27 | 4.94s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 27 | 10.09s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 27 | 1.91s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 27 | 3.92s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 27 | 21.25s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 27 | 0.18s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 27 | 0.82s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 27 | 0.44s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 27 | 0.46s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 27 | 1.88s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 27 | 0.21s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 27 | 24.06s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 27 | 2.39s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 27 | 0.44s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 27 | 1.72s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 181 | 1.11s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 27 | 4.02s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 27 | 13.47s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 27 | 0.42s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 27 | 71.89s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 27 | 1.85s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 27 | 0.12s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 27 | 0.35s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 27 | 0.1s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 27 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 175 | 47.32s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 27 | 1.17s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 27 | 1.27s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 27 | 4.34s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 170 | 53.19s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 169 | 115.83s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 27 | 25.7s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 27 | 4.94s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 163 | 74.52s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 27 | 9.9s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 27 | 59.97s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 27 | 0.23s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 27 | 2.14s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 27 | 3.16s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 27 | 1.58s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 27 | 2.13s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 27 | 1.29s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 27 | 1.36s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 27 | 2.23s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 27 | 5.47s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 27 | 1.86s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 27 | 0.36s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 27 | 0.68s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 27 | 0.43s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 27 | 0.38s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 27 | 0.38s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 27 | 0.83s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 27 | 11.53s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 27 | 37.65s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 27 | 11.14s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 27 | 24.0s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 27 | 20.59s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 27 | 11.87s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 27 | 39.13s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 27 | 32.31s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 27 | 20.8s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 27 | 0.47s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 27 | 0.74s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 27 | 7.04s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 27 | 1.86s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 27 | 0.69s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 27 | 1.82s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 27 | 0.89s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 27 | 4.45s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 27 | 0.45s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 27 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 27 | 0.68s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 27 | 0.3s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 27 | 0.23s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 27 | 0.22s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 27 | 2.07s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 27 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 27 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 27 | 15.64s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 27 | 0.37s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 27 | 0.32s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 27 | 0.64s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 27 | 0.5s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 27 | 1.36s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 27 | 2.29s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 27 | 0.58s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 27 | 2.45s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 27 | 11.53s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 27 | 0.73s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 27 | 10.53s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 27 | 17.21s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 106 | 4.2s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 106 | 2.69s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 101 | 30.41s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 27 | 39.55s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 27 | 22.3s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 106 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 106 | 102.46s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 27 | 0.29s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 27 | 0.34s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 27 | 1.45s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 27 | 0.35s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 27 | 0.88s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 27 | 0.34s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 27 | 0.91s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 27 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 27 | 1.62s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 27 | 6.09s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 27 | 0.1s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 27 | 0.06s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 27 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 27 | 0.62s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 27 | 0.3s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 27 | 6.19s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 27 | 1.41s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 27 | 20.57s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 27 | 31.32s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 27 | 23.94s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 27 | 21.55s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 27 | 27.31s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 27 | 4.42s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 27 | 27.23s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 27 | 23.29s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 27 | 23.63s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 27 | 38.87s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 78 | 26.28s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 27 | 29.78s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 78 | 37.27s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 27 | 39.38s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 27 | 0.38s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 27 | 68.69s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 27 | 1.81s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 27 | 0.77s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 67 | 38.6s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 27 | 0.55s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 27 | 0.94s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 69 | 19.3s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 27 | 0.45s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 27 | 0.4s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 27 | 0.31s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 27 | 69.95s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 27 | 33.76s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 27 | 2.65s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 62 | 19.38s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 27 | 0.04s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 27 | 0.39s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 27 | 0.25s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 27 | 0.17s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 27 | 0.01s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 27 | 2.37s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 27 | 0.51s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 27 | 0.5s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 27 | 0.64s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 27 | 0.95s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 27 | 1.87s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 27 | 1.08s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 27 | 15.39s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 27 | 0.22s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 27 | 0.73s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 27 | 0.17s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 27 | 1.48s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 27 | 2.24s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 27 | 5.55s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 27 | 14.08s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 26 | 6.94s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 25 | 1.44s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 23 | 2.02s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 22 | 1.48s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 21 | 1.38s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 20 | 12.73s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 19 | 18.81s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 17 | 0.8s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 15 | 0.81s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 14 | 1.77s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 14 | 0.63s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 14 | 0.41s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 14 | 0.45s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 14 | 0.87s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 13 | 0.34s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 12 | 0.25s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 10 | 34.53s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 7 | 26.96s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 7 | 12.54s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 6 | 2.24s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 5 | 45.88s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 5 | 25.81s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 4 | 88.67s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 3 | 1.75s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 2 | 6.5s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 2 | 21.13s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 2 | 22.19s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 1 | 1.84s |

## Archive sweep

Executed at least once: **480/480** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 453, timeout 3.
This run: 59 executed (assertion_failed 1, pass 57, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

