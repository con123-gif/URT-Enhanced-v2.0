# Cathedral orchestrator — ✅ PASS

2026-11-21T06:45:48Z · [run 44874205289](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44874205289) · `4476561` · push on `newtons-cathedral` · checkpoint #280

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 280 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 280 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 280 | 0.28s |
| tests | `tests.suite` | regression | ✅ pass | 280 | 14.64s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 280 | 7.01s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 280 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 280 | 6.8s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 280 | 6.24s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 280 | 0.55s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 280 | 0.42s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 277 | 15.25s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 280 | 0.81s |
| native | `native.wilson_source` | native | ✅ pass | 280 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 280 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 280 | 0.58s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 280 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 280 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 280 | 0.11s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 103 | 0.12s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 103 | 0.26s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 103 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 103 | 1.1s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 103 | 41.73s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 103 | 4.96s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 103 | 6.58s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 103 | 17.56s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 103 | 1.62s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 103 | 4.65s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 103 | 27.9s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 103 | 0.24s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 103 | 0.91s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 103 | 0.56s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 103 | 0.82s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 103 | 4.04s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 103 | 0.16s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 103 | 30.98s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 103 | 3.4s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 103 | 0.71s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 103 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 257 | 1.74s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 103 | 4.92s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 103 | 17.41s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 103 | 0.65s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 103 | 54.16s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 103 | 2.43s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 103 | 0.16s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 103 | 0.61s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 103 | 0.08s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 103 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 251 | 67.05s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 103 | 1.58s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 103 | 2.01s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 103 | 3.36s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 246 | 87.64s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 245 | 154.21s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 103 | 33.81s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 103 | 6.98s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 239 | 100.01s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 103 | 16.34s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 103 | 46.05s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 103 | 0.29s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 103 | 3.01s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 103 | 4.95s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 103 | 1.3s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 103 | 2.64s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 103 | 1.75s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 103 | 2.26s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 103 | 1.79s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 103 | 7.08s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 103 | 2.57s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 103 | 0.55s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 103 | 0.52s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 103 | 0.56s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 103 | 0.47s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 103 | 0.6s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 103 | 0.68s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 103 | 14.79s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 103 | 50.44s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 103 | 18.99s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 103 | 18.63s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 103 | 26.5s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 103 | 16.23s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 103 | 69.5s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 103 | 24.93s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 103 | 25.81s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 103 | 0.63s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 103 | 1.43s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 103 | 5.45s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 103 | 2.52s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 103 | 0.83s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 103 | 3.11s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 103 | 0.7s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 103 | 5.81s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 103 | 0.63s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 103 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 103 | 0.5s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 103 | 0.4s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 103 | 0.26s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 103 | 0.31s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 103 | 1.56s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 103 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 103 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 103 | 26.8s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 103 | 0.27s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 103 | 0.45s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 103 | 0.77s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 103 | 0.72s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 103 | 1.01s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 103 | 2.97s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 103 | 0.7s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 103 | 4.1s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 103 | 8.71s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 103 | 0.96s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 103 | 12.02s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 103 | 31.13s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 182 | 5.37s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 182 | 3.62s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 177 | 36.84s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 103 | 30.55s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 103 | 27.76s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 182 | 0.08s |
| engine | `engine.benchmark` | regression | ✅ pass | 182 | 125.19s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 103 | 0.32s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 103 | 0.52s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 103 | 1.12s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 103 | 0.46s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 103 | 1.07s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 103 | 0.51s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 103 | 0.7s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 103 | 0.04s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 103 | 2.0s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 103 | 11.42s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 103 | 0.08s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 103 | 0.09s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 103 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 103 | 1.01s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 103 | 0.23s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 103 | 8.24s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 103 | 1.83s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 103 | 38.46s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 103 | 24.28s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 103 | 32.13s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 103 | 23.75s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 103 | 50.64s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 103 | 3.4s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 103 | 35.65s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 103 | 27.12s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 103 | 42.41s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 103 | 30.23s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 154 | 35.29s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 103 | 39.02s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 154 | 53.19s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 103 | 53.35s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 103 | 0.47s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 103 | 52.66s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 103 | 2.38s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 103 | 0.98s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 143 | 55.59s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 103 | 0.83s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 103 | 0.71s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 145 | 23.65s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 103 | 0.58s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 103 | 0.5s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 103 | 0.41s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 103 | 54.31s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 103 | 40.54s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 103 | 3.57s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 138 | 24.52s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 103 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 103 | 0.3s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 103 | 0.32s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 103 | 0.23s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 103 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 103 | 1.88s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 103 | 0.66s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 103 | 0.59s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 103 | 0.74s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 103 | 0.76s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 103 | 2.42s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 103 | 1.33s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 103 | 27.02s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 103 | 0.17s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 103 | 0.94s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 103 | 0.23s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 103 | 2.55s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 103 | 1.71s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 103 | 7.03s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 103 | 17.72s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 102 | 11.4s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 101 | 1.09s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 99 | 1.54s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 98 | 1.98s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 97 | 1.66s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 96 | 20.21s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 95 | 14.31s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 93 | 1.05s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 91 | 0.99s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 90 | 1.3s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 90 | 0.82s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 90 | 0.51s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 90 | 0.68s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 90 | 0.68s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 89 | 0.26s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 88 | 0.19s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 86 | 27.44s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 83 | 35.23s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 83 | 9.65s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 82 | 1.7s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 81 | 60.52s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 81 | 33.96s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 80 | 70.53s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 79 | 2.08s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 78 | 7.77s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 78 | 24.62s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 78 | 24.43s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 77 | 2.4s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 76 | 2.95s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 75 | 7.85s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 74 | 2.72s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 72 | 0.5s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 71 | 0.6s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 70 | 0.6s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 69 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 68 | 1.13s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 66 | 0.55s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 64 | 2.82s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 63 | 4.94s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 62 | 8.45s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 61 | 8.99s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 60 | 22.49s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 59 | 0.54s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 57 | 0.67s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 56 | 0.71s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 55 | 0.98s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 54 | 1.29s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 53 | 0.56s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 52 | 0.45s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 50 | 0.33s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 49 | 0.47s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 48 | 0.65s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 46 | 0.75s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 45 | 6.39s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 44 | 5.08s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 43 | 19.17s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 42 | 7.29s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 41 | 19.79s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 40 | 41.46s |
| research | `research.q161ci_native_cube_octa_dual` | native | ✅ pass | 38 | 0.37s |
| research | `research.q161cj_native_source_charge_commutant` | native | ✅ pass | 37 | 9.92s |
| research | `research.q161ck_native_antipodal_defect` | native | ✅ pass | 36 | 9.74s |
| research | `research.q161cm_native_q96_chiral_ward` | native | ✅ pass | 35 | 0.02s |
| research | `research.q161cn_native_q96_majorana` | native | ✅ pass | 34 | 0.02s |
| research | `research.q161co_native_q96_symmetric` | native | ✅ pass | 32 | 0.03s |
| research | `research.q161cp_q96_hypercharge_anomaly` | native | ✅ pass | 31 | 0.02s |
| research | `research.q161cq_native_vertex_leverage_classes` | native | ✅ pass | 30 | 3.26s |
| research | `research.q161cr_q125_symbolic_charge` | native | ✅ pass | 28 | 0.37s |
| research | `research.q161cs_q125_q96_hopf_curvature` | native | ✅ pass | 27 | 0.98s |
| research | `research.q161ct_native_five_solid_cubic` | native | ✅ pass | 25 | 0.78s |
| research | `research.q161cu_five_platonic_hopf_fluid` | native | ✅ pass | 24 | 1.47s |
| research | `research.q161cv_source_axis_urt_flow` | native | ✅ pass | 24 | 0.56s |
| research | `research.q161cx_native_ground_frame` | native | ✅ pass | 22 | 0.91s |
| research | `research.q161cw_five_solid_kinetic_exact` | native | ✅ pass | 22 | 0.66s |
| research | `research.q161cy_native_five_solid_response` | native | ✅ pass | 21 | 0.85s |
| research | `research.q162a_original_chaos_to_five` | native | ✅ pass | 19 | 4.58s |
| research | `research.q162b_native_platonic_golden_sphere` | native | ✅ pass | 19 | 0.42s |
| research | `research.q162c_native_golden_quantum_transfer` | native | ✅ pass | 19 | 0.38s |
| research | `research.q162d_native_h64_charge_four` | native | ✅ pass | 17 | 3.0s |
| research | `research.q162e_five_solid_dynamic_three_classes` | native | ✅ pass | 15 | 3.25s |
| research | `research.q162f_hidden_cubic_120_identity` | native | ✅ pass | 17 | 3.14s |
| research | `research.q162g_original_ground_state_h64_density` | native | ✅ pass | 17 | 3.0s |
| research | `research.q162h_native_frustration_entropy_selection` | native | ✅ pass | 15 | 3.23s |
| research | `research.q162i_native_tetra_cubic_inversion` | native | ✅ pass | 15 | 3.27s |
| research | `research.q161db_native_face_jacobian` | native | ✅ pass | 14 | 8.61s |
| research | `research.q162j_established_physics_baseline` | native | ✅ pass | 12 | 0.89s |
| research | `research.q161dc_q96_clock_spectrum` | native | ✅ pass | 12 | 0.57s |
| research | `research.q161dd_q96_clock_green_trace` | native | ✅ pass | 11 | 0.49s |
| research | `research.q161de_q96_antipodal_green` | native | ✅ pass | 10 | 0.02s |
| research | `research.q161df_q96_clock_kirchhoff` | conditional | ✅ pass | 9 | 0.02s |
| research | `research.q161dg_q96_clock_pseudodeterminant` | conditional | ✅ pass | 8 | 0.02s |
| research | `research.q161dj_q96_clock_fourth_moment` | conditional | ✅ pass | 6 | 0.02s |
| research | `research.q161do_native_face_jacobian_norm` | native | ✅ pass | 4 | 12.85s |
| research | `research.prime_urt_magnetic_gap` | conditional | ✅ pass | 2 | 1.58s |
| research | `research.prime_urt_vacuum_bridge` | conditional | ✅ pass | 2 | 0.82s |
| research | `research.prime_urt_group_completion` | conditional | ✅ pass | 1 | 0.04s |

## Archive sweep

Executed at least once: **550/550** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 524, timeout 2.
This run: 283 executed (missing_file 18, pass 265).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

