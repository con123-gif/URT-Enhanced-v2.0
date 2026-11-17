# Cathedral orchestrator — ✅ PASS

2026-11-17T17:27:22Z · [run 44133392571](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44133392571) · `d60f414` · push on `newtons-cathedral` · checkpoint #201

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 201 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 201 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 201 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 201 | 21.49s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 201 | 6.91s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 201 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 201 | 4.74s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 201 | 4.64s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 201 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 201 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 198 | 11.59s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 201 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 201 | 1.03s |
| native | `native.output_gate` | native | ✅ pass | 201 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 201 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 201 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 201 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 201 | 0.08s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 24 | 0.14s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 24 | 0.25s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 24 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 24 | 1.18s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 24 | 53.74s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 24 | 5.02s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 24 | 8.46s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 24 | 17.34s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 24 | 1.87s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 24 | 4.78s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 24 | 37.33s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 24 | 0.23s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 24 | 0.77s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 24 | 0.59s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 24 | 0.7s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 24 | 3.5s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 24 | 0.24s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 24 | 30.88s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 24 | 4.48s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 24 | 0.68s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 24 | 1.71s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 178 | 1.64s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 24 | 5.02s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 24 | 23.06s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 24 | 0.65s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 24 | 61.54s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 24 | 2.5s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 24 | 0.2s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 24 | 0.63s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 24 | 0.1s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 24 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 172 | 68.21s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 24 | 1.83s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 24 | 2.26s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 24 | 4.03s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 167 | 87.25s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 166 | 154.43s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 24 | 33.87s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 24 | 8.13s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 160 | 103.31s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 24 | 18.68s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 24 | 53.87s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 24 | 0.29s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 24 | 3.4s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 24 | 5.79s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 24 | 1.53s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 24 | 2.63s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 24 | 2.07s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 24 | 2.57s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 24 | 2.06s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 24 | 7.11s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 24 | 3.1s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 24 | 0.56s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 24 | 0.69s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 24 | 0.55s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 24 | 0.6s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 24 | 0.59s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 24 | 0.84s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 24 | 14.84s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 24 | 66.68s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 24 | 19.33s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 24 | 23.92s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 24 | 26.71s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 24 | 20.26s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 24 | 70.18s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 24 | 31.3s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 24 | 25.83s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 24 | 0.98s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 24 | 1.27s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 24 | 8.5s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 24 | 2.46s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 24 | 1.22s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 24 | 3.06s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 24 | 0.93s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 24 | 5.88s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 24 | 0.96s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 24 | 0.02s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 24 | 0.64s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 24 | 0.4s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 24 | 0.39s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 24 | 0.33s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 24 | 2.02s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 24 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 24 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 24 | 23.52s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 24 | 0.35s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 24 | 0.42s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 24 | 1.08s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 24 | 0.76s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 24 | 1.34s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 24 | 2.97s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 24 | 1.03s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 24 | 4.13s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 24 | 13.46s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 24 | 0.95s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 24 | 18.41s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 24 | 25.31s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 103 | 5.18s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 103 | 3.49s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 98 | 35.18s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 24 | 38.85s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 24 | 28.0s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 103 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 103 | 120.1s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 24 | 0.44s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 24 | 0.52s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 24 | 1.62s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 24 | 0.46s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 24 | 1.56s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 24 | 0.51s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 24 | 0.97s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 24 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 24 | 2.77s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 24 | 9.61s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 24 | 0.1s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 24 | 0.08s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 24 | 0.06s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 24 | 0.99s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 24 | 0.31s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 24 | 8.24s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 24 | 2.34s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 24 | 30.36s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 24 | 38.88s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 24 | 32.22s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 24 | 38.77s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 24 | 41.9s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 24 | 4.49s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 24 | 35.78s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 24 | 42.14s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 24 | 35.34s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 24 | 46.29s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 75 | 35.25s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 24 | 39.51s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 75 | 53.38s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 24 | 69.64s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 24 | 0.5s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 24 | 69.15s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 24 | 2.36s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 24 | 1.31s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 64 | 55.1s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 24 | 0.8s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 24 | 1.0s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 66 | 24.01s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 24 | 0.58s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 24 | 0.72s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 24 | 0.41s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 24 | 69.78s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 24 | 41.08s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 24 | 4.5s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 59 | 24.67s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 24 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 24 | 0.39s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 24 | 0.32s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 24 | 0.28s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 24 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 24 | 2.36s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 24 | 0.67s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 24 | 0.76s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 24 | 0.8s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 24 | 0.98s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 24 | 2.48s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 24 | 1.75s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 24 | 26.61s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 24 | 0.21s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 24 | 0.95s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 24 | 0.29s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 24 | 2.29s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 24 | 2.59s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 24 | 7.04s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 24 | 23.32s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 23 | 11.17s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 22 | 1.58s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 20 | 2.32s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 19 | 1.98s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 18 | 2.43s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 17 | 18.58s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 16 | 20.84s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 14 | 1.06s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 12 | 1.41s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 11 | 1.91s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 11 | 0.81s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 11 | 0.68s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 11 | 0.68s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 11 | 0.9s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 10 | 0.33s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 9 | 0.25s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 7 | 42.4s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 4 | 35.22s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 4 | 12.32s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 3 | 2.47s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 2 | 60.82s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 2 | 34.33s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 1 | 98.7s |

## Archive sweep

Executed at least once: **475/475** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 448, timeout 3.
This run: 165 executed (missing_file 5, pass 160).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

