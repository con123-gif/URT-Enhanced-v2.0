# Cathedral orchestrator — ✅ PASS

2026-11-20T13:46:36Z · [run 44742579805](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44742579805) · `267378f` · push on `newtons-cathedral` · checkpoint #269

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 269 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 269 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 269 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 269 | 21.07s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 269 | 6.91s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 269 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 269 | 6.4s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 269 | 5.99s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 269 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 269 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 266 | 15.11s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 269 | 0.74s |
| native | `native.wilson_source` | native | ✅ pass | 269 | 1.33s |
| native | `native.output_gate` | native | ✅ pass | 269 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 269 | 0.38s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 269 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 269 | 0.49s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 269 | 0.08s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 92 | 0.14s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 92 | 0.27s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 92 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 92 | 0.68s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 92 | 55.49s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 92 | 4.47s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 92 | 8.32s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 92 | 9.84s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 92 | 1.86s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 92 | 4.35s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 92 | 36.53s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 92 | 0.14s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 92 | 0.75s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 92 | 0.49s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 92 | 0.69s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 92 | 2.0s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 92 | 0.23s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 92 | 27.84s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 92 | 4.29s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 92 | 0.43s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 92 | 1.62s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 246 | 1.52s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 92 | 4.75s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 92 | 22.49s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 92 | 0.39s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 92 | 62.13s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 92 | 2.22s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 92 | 0.2s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 92 | 0.34s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 92 | 0.1s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 92 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 240 | 67.67s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 92 | 2.06s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 92 | 1.26s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 92 | 3.94s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 235 | 87.31s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 234 | 155.3s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 92 | 30.98s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 92 | 9.05s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 228 | 97.22s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 92 | 9.69s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 92 | 53.92s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 92 | 0.26s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 92 | 3.86s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 92 | 3.03s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 92 | 1.5s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 92 | 2.59s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 92 | 2.35s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 92 | 1.34s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 92 | 2.04s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 92 | 6.69s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 92 | 3.27s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 92 | 0.35s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 92 | 0.67s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 92 | 0.5s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 92 | 0.59s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 92 | 0.35s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 92 | 0.82s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 92 | 13.62s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 92 | 65.87s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 92 | 10.57s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 92 | 23.76s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 92 | 23.83s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 92 | 20.06s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 92 | 38.6s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 92 | 31.02s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 92 | 25.52s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 92 | 0.81s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 92 | 0.74s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 92 | 8.49s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 92 | 1.93s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 92 | 1.05s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 92 | 1.8s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 92 | 0.91s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 92 | 5.36s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 92 | 0.8s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 92 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 92 | 0.65s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 92 | 0.39s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 92 | 0.33s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 92 | 0.2s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 92 | 2.02s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 92 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 92 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 92 | 15.36s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 92 | 0.34s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 92 | 0.36s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 92 | 0.97s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 92 | 0.57s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 92 | 1.31s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 92 | 2.63s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 92 | 0.9s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 92 | 2.4s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 92 | 12.9s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 92 | 0.84s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 92 | 15.6s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 92 | 17.46s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 171 | 4.12s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 171 | 2.68s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 166 | 28.93s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 92 | 37.93s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 92 | 27.56s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 171 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 171 | 97.38s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 92 | 0.4s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 92 | 0.32s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 92 | 1.55s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 92 | 0.37s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 92 | 1.38s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 92 | 0.34s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 92 | 0.94s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 92 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 92 | 2.6s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 92 | 6.3s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 92 | 0.09s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 92 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 92 | 0.06s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 92 | 0.61s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 92 | 0.29s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 92 | 6.37s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 92 | 2.34s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 92 | 20.37s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 92 | 38.2s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 92 | 24.12s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 92 | 30.93s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 92 | 27.92s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 92 | 4.52s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 92 | 27.24s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 92 | 34.81s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 92 | 23.6s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 92 | 45.68s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 143 | 35.33s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 92 | 30.41s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 143 | 53.56s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 92 | 68.47s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 92 | 0.34s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 92 | 69.7s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 92 | 2.0s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 92 | 1.27s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 132 | 54.87s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 92 | 0.51s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 92 | 0.98s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 134 | 24.02s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 92 | 0.51s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 92 | 0.66s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 92 | 0.26s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 92 | 71.27s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 92 | 44.0s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 92 | 4.53s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 127 | 24.49s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 92 | 0.04s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 92 | 0.36s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 92 | 0.26s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 92 | 0.3s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 92 | 0.01s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 92 | 2.34s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 92 | 0.57s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 92 | 0.74s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 92 | 0.54s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 92 | 0.93s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 92 | 2.13s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 92 | 1.73s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 92 | 14.99s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 92 | 0.23s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 92 | 0.91s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 92 | 0.3s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 92 | 1.5s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 92 | 2.46s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 92 | 6.18s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 92 | 22.91s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 91 | 6.78s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 90 | 1.51s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 88 | 2.23s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 87 | 1.55s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 86 | 2.17s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 85 | 12.49s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 84 | 20.51s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 82 | 0.86s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 80 | 1.31s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 79 | 1.78s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 79 | 0.69s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 79 | 0.66s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 79 | 0.46s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 79 | 0.86s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 78 | 0.32s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 77 | 0.25s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 75 | 42.22s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 72 | 26.81s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 72 | 12.26s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 71 | 2.45s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 70 | 47.41s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 70 | 25.78s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 69 | 97.09s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 68 | 2.66s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 67 | 9.92s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 67 | 31.82s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 67 | 31.49s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 66 | 2.02s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 65 | 4.35s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 64 | 11.66s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 63 | 3.88s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 61 | 0.66s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 60 | 0.8s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 59 | 0.81s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 58 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 57 | 1.64s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 55 | 0.73s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 53 | 4.06s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 52 | 7.2s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 51 | 12.56s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 50 | 13.16s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 49 | 32.96s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 48 | 0.71s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 46 | 0.92s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 45 | 0.96s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 44 | 0.65s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 43 | 0.85s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 42 | 0.38s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 41 | 0.3s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 39 | 0.24s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 38 | 0.33s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 37 | 0.44s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 35 | 0.56s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 34 | 4.12s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 33 | 3.34s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 32 | 12.47s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 31 | 4.7s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 30 | 12.72s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 29 | 26.35s |
| research | `research.q161ci_native_cube_octa_dual` | native | ✅ pass | 27 | 0.25s |
| research | `research.q161cj_native_source_charge_commutant` | native | ✅ pass | 26 | 6.34s |
| research | `research.q161ck_native_antipodal_defect` | native | ✅ pass | 25 | 6.37s |
| research | `research.q161cm_native_q96_chiral_ward` | native | ✅ pass | 24 | 0.02s |
| research | `research.q161cn_native_q96_majorana` | native | ✅ pass | 23 | 0.02s |
| research | `research.q161co_native_q96_symmetric` | native | ✅ pass | 21 | 0.02s |
| research | `research.q161cp_q96_hypercharge_anomaly` | native | ✅ pass | 20 | 0.01s |
| research | `research.q161cq_native_vertex_leverage_classes` | native | ✅ pass | 19 | 2.16s |
| research | `research.q161cr_q125_symbolic_charge` | native | ✅ pass | 17 | 0.26s |
| research | `research.q161cs_q125_q96_hopf_curvature` | native | ✅ pass | 16 | 0.65s |
| research | `research.q161ct_native_five_solid_cubic` | native | ✅ pass | 14 | 0.51s |
| research | `research.q161cu_five_platonic_hopf_fluid` | native | ✅ pass | 13 | 0.97s |
| research | `research.q161cv_source_axis_urt_flow` | native | ✅ pass | 13 | 0.36s |
| research | `research.q161cx_native_ground_frame` | native | ✅ pass | 11 | 0.62s |
| research | `research.q161cw_five_solid_kinetic_exact` | native | ✅ pass | 11 | 0.44s |
| research | `research.q161cy_native_five_solid_response` | native | ✅ pass | 10 | 0.57s |
| research | `research.q162a_original_chaos_to_five` | native | ✅ pass | 8 | 2.24s |
| research | `research.q162b_native_platonic_golden_sphere` | native | ✅ pass | 8 | 0.28s |
| research | `research.q162c_native_golden_quantum_transfer` | native | ✅ pass | 8 | 0.25s |
| research | `research.q162d_native_h64_charge_four` | native | ✅ pass | 6 | 2.03s |
| research | `research.q162e_five_solid_dynamic_three_classes` | native | ✅ pass | 4 | 2.13s |
| research | `research.q162f_hidden_cubic_120_identity` | native | ✅ pass | 6 | 2.05s |
| research | `research.q162g_original_ground_state_h64_density` | native | ✅ pass | 6 | 1.95s |
| research | `research.q162h_native_frustration_entropy_selection` | native | ✅ pass | 4 | 2.14s |
| research | `research.q162i_native_tetra_cubic_inversion` | native | ✅ pass | 4 | 2.13s |
| research | `research.q161db_native_face_jacobian` | native | ✅ pass | 3 | 5.43s |
| research | `research.q162j_established_physics_baseline` | native | ✅ pass | 1 | 0.59s |
| research | `research.q161dc_q96_clock_spectrum` | native | ✅ pass | 1 | 0.37s |

## Archive sweep

Executed at least once: **540/540** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 514, timeout 2.
This run: 153 executed (assertion_failed 1, missing_file 4, pass 148).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-15_q153_full_physical_stability/Q153_FULL_NATIVE_TRANSVERSE_HESSIAN.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

