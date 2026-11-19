# Cathedral orchestrator — ✅ PASS

2026-11-19T00:34:25Z · [run 44427521577](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44427521577) · `e43de1f` · push on `newtons-cathedral` · checkpoint #232

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 232 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 232 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 232 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 232 | 20.8s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 232 | 6.99s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 232 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 232 | 4.77s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 232 | 4.82s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 232 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 232 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 229 | 11.71s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 232 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 232 | 1.41s |
| native | `native.output_gate` | native | ✅ pass | 232 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 232 | 0.55s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 232 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 232 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 232 | 0.11s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 55 | 0.11s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 55 | 0.2s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 55 | 0.02s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 55 | 0.74s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 55 | 49.41s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 55 | 3.23s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 55 | 4.92s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 55 | 10.46s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 55 | 1.72s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 55 | 2.83s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 55 | 21.62s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 55 | 0.15s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 55 | 0.97s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 55 | 0.4s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 55 | 0.44s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 55 | 1.97s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 55 | 0.19s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 55 | 19.99s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 55 | 2.34s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 55 | 0.55s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 55 | 1.4s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 209 | 1.79s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 55 | 3.02s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 55 | 13.19s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 55 | 0.49s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 55 | 54.55s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 55 | 1.55s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 55 | 0.17s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 55 | 0.38s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 55 | 0.09s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 55 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 203 | 89.38s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 55 | 1.15s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 55 | 1.33s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 55 | 3.44s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 198 | 95.54s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 197 | 193.76s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 55 | 20.96s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 55 | 5.07s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 191 | 116.94s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 55 | 10.15s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 55 | 40.46s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 55 | 0.2s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 55 | 2.22s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 55 | 3.2s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 55 | 1.37s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 55 | 1.84s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 55 | 1.33s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 55 | 1.43s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 55 | 1.78s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 55 | 4.75s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 55 | 1.86s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 55 | 0.4s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 55 | 0.57s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 55 | 0.39s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 55 | 0.38s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 55 | 0.42s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 55 | 0.7s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 55 | 9.64s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 55 | 37.57s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 55 | 11.33s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 55 | 20.97s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 55 | 17.28s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 55 | 11.94s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 55 | 40.32s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 55 | 25.67s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 55 | 17.48s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 55 | 0.47s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 55 | 0.79s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 55 | 7.46s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 55 | 1.47s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 55 | 0.74s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 55 | 1.88s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 55 | 0.82s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 55 | 3.76s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 55 | 0.44s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 55 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 55 | 0.53s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 55 | 0.26s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 55 | 0.2s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 55 | 0.25s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 55 | 1.73s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 55 | 0.01s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 55 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 55 | 16.14s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 55 | 0.32s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 55 | 0.27s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 55 | 0.62s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 55 | 0.55s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 55 | 1.15s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 55 | 1.89s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 55 | 0.58s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 55 | 2.63s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 55 | 11.71s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 55 | 0.62s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 55 | 10.44s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 55 | 17.9s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 134 | 5.33s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 134 | 3.47s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 129 | 37.53s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 55 | 31.49s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 55 | 19.31s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 134 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 134 | 120.65s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 55 | 0.26s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 55 | 0.36s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 55 | 1.39s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 55 | 0.32s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 55 | 0.84s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 55 | 0.37s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 55 | 0.83s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 55 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 55 | 1.6s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 55 | 6.44s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 55 | 0.09s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 55 | 0.06s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 55 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 55 | 0.69s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 55 | 0.26s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 55 | 5.17s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 55 | 1.38s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 55 | 21.13s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 55 | 32.72s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 55 | 19.96s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 55 | 21.62s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 55 | 28.81s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 55 | 3.83s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 55 | 21.94s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 55 | 23.65s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 55 | 24.37s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 55 | 38.85s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 106 | 47.95s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 55 | 24.84s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 106 | 70.55s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 55 | 39.97s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 55 | 0.4s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 55 | 58.64s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 55 | 1.64s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 55 | 0.74s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 95 | 73.37s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 55 | 0.57s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 55 | 0.87s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 97 | 38.23s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 55 | 0.44s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 55 | 0.44s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 55 | 0.29s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 55 | 59.22s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 55 | 29.55s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 55 | 2.71s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 90 | 39.13s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 55 | 0.04s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 55 | 0.34s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 55 | 0.26s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 55 | 0.2s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 55 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 55 | 1.97s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 55 | 0.56s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 55 | 0.5s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 55 | 0.62s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 55 | 0.82s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 55 | 1.8s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 55 | 1.17s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 55 | 15.5s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 55 | 0.18s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 55 | 0.65s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 55 | 0.17s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 55 | 1.59s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 55 | 2.19s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 55 | 5.01s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 55 | 15.04s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 54 | 7.15s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 53 | 1.36s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 51 | 1.98s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 50 | 1.36s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 49 | 1.5s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 48 | 12.69s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 47 | 18.63s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 45 | 0.78s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 43 | 0.91s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 42 | 1.64s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 42 | 0.59s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 42 | 0.44s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 42 | 0.46s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 42 | 0.78s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 41 | 0.28s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 40 | 0.2s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 38 | 35.29s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 35 | 22.14s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 35 | 10.8s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 34 | 2.14s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 33 | 35.97s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 33 | 20.73s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 32 | 90.97s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 31 | 1.95s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 30 | 7.38s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 30 | 21.86s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 30 | 21.22s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 29 | 1.59s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 28 | 3.82s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 27 | 10.19s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 26 | 3.47s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 24 | 0.6s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 23 | 0.71s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 22 | 0.72s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 21 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 20 | 1.42s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 18 | 0.65s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 16 | 3.59s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 15 | 6.43s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 14 | 11.08s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 13 | 11.72s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 12 | 29.62s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 11 | 0.65s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 9 | 0.84s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 8 | 0.87s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 7 | 0.94s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 6 | 1.28s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 5 | 0.55s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 4 | 0.44s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 2 | 0.33s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 1 | 0.48s |

## Archive sweep

Executed at least once: **503/503** research scripts. Latest status: assertion_failed 1, missing_file 24, pass 477, timeout 1.
This run: 185 executed (missing_file 19, pass 165, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

