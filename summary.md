# Cathedral orchestrator — ✅ PASS

2026-11-18T21:34:20Z · [run 44399288947](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44399288947) · `3fdf51e` · push on `newtons-cathedral` · checkpoint #229

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 229 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 229 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 229 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 229 | 14.46s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 229 | 10.61s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 229 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 229 | 4.56s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 229 | 3.89s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 229 | 0.38s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 229 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 226 | 9.54s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 229 | 0.54s |
| native | `native.wilson_source` | native | ✅ pass | 229 | 1.24s |
| native | `native.output_gate` | native | ✅ pass | 229 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 229 | 0.64s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 229 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 229 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 229 | 0.14s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 52 | 0.14s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 52 | 0.33s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 52 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 52 | 0.74s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 52 | 55.87s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 52 | 5.73s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 52 | 7.36s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 52 | 9.8s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 52 | 1.93s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 52 | 5.32s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 52 | 30.77s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 52 | 0.15s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 52 | 0.9s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 52 | 0.67s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 52 | 0.5s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 52 | 1.89s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 52 | 0.24s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 52 | 36.18s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 52 | 3.42s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 52 | 0.46s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 52 | 1.7s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 206 | 1.89s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 52 | 5.61s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 52 | 19.26s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 52 | 0.47s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 52 | 63.48s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 52 | 2.87s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 52 | 0.18s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 52 | 0.37s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 52 | 0.11s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 52 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 200 | 88.32s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 52 | 1.58s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 52 | 1.25s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 52 | 4.04s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 195 | 96.25s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 194 | 194.55s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 52 | 38.14s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 52 | 6.11s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 188 | 121.34s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 52 | 9.85s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 52 | 54.02s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 52 | 0.33s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 52 | 2.84s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 52 | 3.1s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 52 | 1.57s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 52 | 3.06s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 52 | 1.74s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 52 | 1.38s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 52 | 2.14s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 52 | 8.73s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 52 | 2.6s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 52 | 0.38s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 52 | 0.71s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 52 | 0.65s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 52 | 0.51s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 52 | 0.4s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 52 | 0.85s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 52 | 17.64s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 52 | 54.99s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 52 | 10.92s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 52 | 24.36s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 52 | 30.99s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 52 | 16.87s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 52 | 38.93s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 52 | 31.57s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 52 | 31.98s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 52 | 0.71s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 52 | 0.79s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 52 | 8.81s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 52 | 2.8s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 52 | 1.02s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 52 | 1.81s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 52 | 0.96s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 52 | 7.19s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 52 | 0.69s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 52 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 52 | 0.68s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 52 | 0.49s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 52 | 0.31s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 52 | 0.23s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 52 | 2.09s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 52 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 52 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 52 | 15.63s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 52 | 0.38s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 52 | 0.46s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 52 | 0.86s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 52 | 0.53s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 52 | 1.38s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 52 | 3.48s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 52 | 0.86s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 52 | 2.55s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 52 | 13.24s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 52 | 1.08s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 52 | 15.68s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 52 | 17.5s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 131 | 4.22s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 131 | 2.67s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 126 | 29.76s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 52 | 38.75s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 52 | 34.3s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 131 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 131 | 106.24s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 52 | 0.37s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 52 | 0.37s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 52 | 1.63s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 52 | 0.52s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 52 | 1.29s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 52 | 0.4s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 52 | 0.97s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 52 | 0.04s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 52 | 2.33s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 52 | 6.33s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 52 | 0.1s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 52 | 0.09s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 52 | 0.05s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 52 | 0.63s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 52 | 0.31s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 52 | 9.68s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 52 | 1.94s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 52 | 20.8s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 52 | 39.13s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 52 | 38.32s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 52 | 32.12s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 52 | 28.66s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 52 | 4.56s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 52 | 42.45s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 52 | 35.9s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 52 | 23.51s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 52 | 46.49s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 103 | 48.38s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 52 | 46.1s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 103 | 70.35s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 52 | 57.3s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 52 | 0.32s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 52 | 70.63s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 52 | 2.77s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 52 | 1.16s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 92 | 73.42s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 52 | 0.53s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 52 | 1.01s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 94 | 38.7s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 52 | 0.65s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 52 | 0.58s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 52 | 0.27s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 52 | 71.88s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 52 | 52.29s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 52 | 3.89s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 87 | 39.65s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 52 | 0.04s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 52 | 0.4s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 52 | 0.34s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 52 | 0.25s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 52 | 0.01s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 52 | 2.42s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 52 | 0.76s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 52 | 0.69s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 52 | 0.54s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 52 | 0.98s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 52 | 2.82s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 52 | 1.52s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 52 | 15.0s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 52 | 0.22s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 52 | 1.21s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 52 | 0.24s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 52 | 1.5s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 52 | 2.52s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 52 | 8.38s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 52 | 19.86s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 51 | 6.85s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 50 | 1.55s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 48 | 2.29s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 47 | 2.27s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 46 | 2.13s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 45 | 12.26s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 44 | 20.94s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 42 | 1.2s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 40 | 1.25s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 39 | 1.93s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 39 | 0.91s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 39 | 0.57s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 39 | 0.52s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 39 | 0.89s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 38 | 0.33s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 37 | 0.25s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 35 | 42.59s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 32 | 42.09s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 32 | 12.81s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 31 | 2.46s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 30 | 68.31s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 30 | 39.68s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 29 | 99.79s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 28 | 2.69s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 27 | 9.98s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 27 | 32.42s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 27 | 32.44s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 26 | 2.69s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 25 | 4.47s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 24 | 12.16s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 23 | 4.11s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 21 | 0.71s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 20 | 0.84s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 19 | 0.84s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 18 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 17 | 1.71s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 15 | 0.76s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 13 | 4.21s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 12 | 7.27s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 11 | 12.64s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 10 | 13.72s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 9 | 33.61s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 8 | 0.73s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 6 | 0.95s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 5 | 0.97s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 4 | 0.73s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 3 | 0.87s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 2 | 0.39s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 1 | 0.31s |

## Archive sweep

Executed at least once: **501/501** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 474, timeout 3.
This run: 266 executed (missing_file 18, pass 247, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

