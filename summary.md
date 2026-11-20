# Cathedral orchestrator — ✅ PASS

2026-11-20T03:36:45Z · [run 44666656712](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44666656712) · `b5f956c` · push on `newtons-cathedral` · checkpoint #251

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 251 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 251 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 251 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 251 | 20.94s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 251 | 11.06s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 251 | 0.41s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 251 | 4.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 251 | 4.68s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 251 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 251 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 248 | 11.55s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 251 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 251 | 0.89s |
| native | `native.output_gate` | native | ✅ pass | 251 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 251 | 0.59s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 251 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 251 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 251 | 0.1s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 74 | 0.08s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 74 | 0.26s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 74 | 0.02s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 74 | 1.31s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 74 | 35.19s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 74 | 4.59s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 74 | 4.68s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 74 | 16.58s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 74 | 1.44s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 74 | 4.47s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 74 | 20.03s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 74 | 0.25s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 74 | 0.65s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 74 | 0.49s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 74 | 0.41s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 74 | 3.88s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 74 | 0.14s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 74 | 27.94s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 74 | 2.28s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 74 | 0.69s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 74 | 1.08s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 228 | 1.75s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 74 | 4.69s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 74 | 12.67s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 74 | 0.67s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 74 | 42.62s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 74 | 2.28s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 74 | 0.12s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 74 | 0.66s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 74 | 0.07s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 74 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 222 | 67.65s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 74 | 1.1s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 74 | 2.01s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 74 | 2.72s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 217 | 87.24s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 216 | 153.92s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 74 | 31.03s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 74 | 4.51s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 210 | 94.4s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 74 | 15.07s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 74 | 35.21s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 74 | 0.26s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 74 | 2.0s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 74 | 4.94s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 74 | 1.06s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 74 | 2.71s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 74 | 1.21s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 74 | 2.26s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 74 | 1.41s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 74 | 6.76s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 74 | 1.74s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 74 | 0.56s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 74 | 0.43s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 74 | 0.5s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 74 | 0.43s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 74 | 0.6s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 74 | 0.53s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 74 | 13.75s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 74 | 35.38s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 74 | 18.29s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 74 | 15.91s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 74 | 24.05s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 74 | 11.2s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 74 | 65.14s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 74 | 20.23s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 74 | 25.53s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 74 | 0.43s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 74 | 1.28s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 74 | 5.57s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 74 | 1.9s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 74 | 0.63s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 74 | 2.94s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 74 | 0.63s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 74 | 5.36s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 74 | 0.42s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 74 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 74 | 0.4s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 74 | 0.39s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 74 | 0.23s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 74 | 0.36s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 74 | 1.33s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 74 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 74 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 74 | 25.26s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 74 | 0.25s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 74 | 0.34s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 74 | 0.59s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 74 | 0.79s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 74 | 0.88s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 74 | 2.64s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 74 | 0.58s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 74 | 4.06s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 74 | 8.75s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 74 | 0.84s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 74 | 9.83s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 74 | 28.34s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 153 | 4.1s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 153 | 2.66s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 148 | 29.6s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 74 | 24.75s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 74 | 27.53s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 153 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 153 | 96.72s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 74 | 0.23s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 74 | 0.57s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 74 | 1.05s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 74 | 0.37s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 74 | 0.78s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 74 | 0.56s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 74 | 0.64s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 74 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 74 | 1.47s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 74 | 10.46s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 74 | 0.07s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 74 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 74 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 74 | 1.05s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 74 | 0.2s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 74 | 6.36s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 74 | 1.31s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 74 | 34.18s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 74 | 24.59s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 74 | 23.83s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 74 | 19.15s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 74 | 45.99s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 74 | 2.87s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 74 | 27.04s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 74 | 21.65s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 74 | 38.85s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 74 | 29.13s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 125 | 35.06s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 74 | 30.42s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 125 | 52.96s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 74 | 37.36s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 74 | 0.54s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 74 | 43.41s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 74 | 2.0s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 74 | 0.73s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 114 | 55.03s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 74 | 0.86s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 74 | 0.66s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 116 | 23.82s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 74 | 0.51s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 74 | 0.41s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 74 | 0.41s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 74 | 44.13s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 74 | 43.89s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 74 | 2.5s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 109 | 24.18s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 74 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 74 | 0.26s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 74 | 0.26s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 74 | 0.16s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 74 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 74 | 1.44s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 74 | 0.56s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 74 | 0.45s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 74 | 0.84s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 74 | 0.63s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 74 | 2.13s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 74 | 0.97s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 74 | 25.26s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 74 | 0.14s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 74 | 0.91s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 74 | 0.16s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 74 | 2.43s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 74 | 1.63s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 74 | 6.24s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 74 | 12.76s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 73 | 10.72s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 72 | 1.02s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 70 | 1.46s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 69 | 1.55s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 68 | 1.27s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 67 | 19.66s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 66 | 14.07s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 64 | 0.85s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 62 | 0.74s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 61 | 1.23s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 61 | 0.69s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 61 | 0.37s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 61 | 0.73s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 61 | 0.6s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 60 | 0.22s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 59 | 0.15s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 57 | 26.73s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 54 | 26.94s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 54 | 8.16s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 53 | 1.6s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 52 | 46.64s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 52 | 25.79s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 51 | 67.72s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 50 | 1.79s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 49 | 5.94s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 49 | 19.7s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 49 | 19.74s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 48 | 1.93s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 47 | 2.85s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 46 | 7.64s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 45 | 2.57s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 43 | 0.47s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 42 | 0.55s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 41 | 0.56s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 40 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 39 | 1.06s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 37 | 0.5s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 35 | 2.66s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 34 | 4.73s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 33 | 8.26s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 32 | 8.64s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 31 | 22.35s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 30 | 0.49s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 28 | 0.64s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 27 | 0.65s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 26 | 0.69s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 25 | 0.86s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 24 | 0.46s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 23 | 0.38s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 21 | 0.29s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 20 | 0.4s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 19 | 0.49s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 17 | 0.6s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 16 | 4.26s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 15 | 3.37s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 14 | 12.38s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 13 | 4.69s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 12 | 12.71s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 11 | 24.52s |
| research | `research.q161ci_native_cube_octa_dual` | native | ✅ pass | 9 | 0.29s |
| research | `research.q161cj_native_source_charge_commutant` | native | ✅ pass | 8 | 5.98s |
| research | `research.q161ck_native_antipodal_defect` | native | ✅ pass | 7 | 5.97s |
| research | `research.q161cm_native_q96_chiral_ward` | native | ✅ pass | 6 | 0.02s |
| research | `research.q161cn_native_q96_majorana` | native | ✅ pass | 5 | 0.02s |
| research | `research.q161co_native_q96_symmetric` | native | ✅ pass | 3 | 0.02s |
| research | `research.q161cp_q96_hypercharge_anomaly` | native | ✅ pass | 2 | 0.02s |
| research | `research.q161cq_native_vertex_leverage_classes` | native | ✅ pass | 1 | 2.09s |

## Archive sweep

Executed at least once: **519/519** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 495.
This run: 287 executed (missing_file 18, pass 269).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

