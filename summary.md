# Cathedral orchestrator — ❌ FAIL

2026-11-20T11:01:22Z · [run 44721398183](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44721398183) · `5731164` · push on `newtons-cathedral` · checkpoint #265

**Gating failures:** `research.q162e_five_solid_dynamic_three_classes`, `research.q162h_native_frustration_entropy_selection`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 265 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 265 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 265 | 0.28s |
| tests | `tests.suite` | regression | ✅ pass | 265 | 16.18s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 265 | 6.81s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 265 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 265 | 5.26s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 265 | 5.24s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 265 | 0.49s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 265 | 0.37s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 262 | 12.9s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 265 | 0.73s |
| native | `native.wilson_source` | native | ✅ pass | 265 | 1.72s |
| native | `native.output_gate` | native | ✅ pass | 265 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 265 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 265 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 265 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 265 | 0.1s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 88 | 0.08s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 88 | 0.27s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 88 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 88 | 0.88s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 88 | 34.92s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 88 | 4.59s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 88 | 6.53s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 88 | 13.49s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 88 | 1.42s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 88 | 4.23s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 88 | 28.34s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 88 | 0.18s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 88 | 0.62s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 88 | 0.51s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 88 | 0.67s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 88 | 2.69s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 88 | 0.14s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 88 | 28.11s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 88 | 3.32s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 88 | 0.65s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 88 | 1.08s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 242 | 1.72s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 88 | 4.8s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 88 | 17.71s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 88 | 0.54s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 88 | 42.99s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 88 | 2.31s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 88 | 0.16s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 88 | 0.51s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 88 | 0.07s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 88 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 236 | 57.72s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 88 | 1.52s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 88 | 1.89s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 88 | 2.75s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 231 | 64.32s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 230 | 137.57s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 88 | 31.05s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 88 | 6.98s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 224 | 76.75s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 88 | 14.69s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 88 | 35.22s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 88 | 0.27s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 88 | 2.96s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 88 | 4.65s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 88 | 1.06s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 88 | 2.77s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 88 | 1.77s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 88 | 1.98s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 88 | 1.41s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 88 | 6.81s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 88 | 2.5s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 88 | 0.47s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 88 | 0.42s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 88 | 0.51s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 88 | 0.48s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 88 | 0.47s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 88 | 0.53s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 88 | 13.86s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 88 | 50.14s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 88 | 15.02s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 88 | 15.79s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 88 | 24.58s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 88 | 15.41s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 88 | 52.82s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 88 | 20.23s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 88 | 26.43s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 88 | 0.63s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 88 | 0.99s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 88 | 5.56s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 88 | 1.96s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 88 | 0.8s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 88 | 2.41s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 88 | 0.63s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 88 | 5.52s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 88 | 0.62s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 88 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 88 | 0.4s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 88 | 0.4s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 88 | 0.26s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 88 | 0.3s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 88 | 1.32s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 88 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 88 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 88 | 18.7s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 88 | 0.25s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 88 | 0.36s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 88 | 0.77s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 88 | 0.6s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 88 | 0.88s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 88 | 2.73s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 88 | 0.7s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 88 | 3.22s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 88 | 8.74s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 88 | 0.88s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 88 | 11.79s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 88 | 19.77s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 167 | 4.19s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 167 | 2.7s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 162 | 30.11s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 88 | 24.7s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 88 | 28.26s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 167 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 167 | 95.45s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 88 | 0.31s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 88 | 0.41s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 88 | 1.05s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 88 | 0.39s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 88 | 1.07s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 88 | 0.41s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 88 | 0.63s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 88 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 88 | 2.02s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 88 | 7.13s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 88 | 0.07s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 88 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 88 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 88 | 0.77s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 88 | 0.2s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 88 | 6.44s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 88 | 2.0s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 88 | 23.72s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 88 | 24.51s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 88 | 23.85s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 88 | 23.81s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 88 | 32.5s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 88 | 2.88s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 88 | 27.08s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 88 | 27.18s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 88 | 27.18s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 88 | 28.88s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 139 | 33.12s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 88 | 30.48s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 139 | 43.85s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 88 | 53.6s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 88 | 0.38s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 88 | 43.85s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 88 | 2.03s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 88 | 0.98s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 128 | 45.36s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 88 | 0.62s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 88 | 0.66s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 130 | 24.51s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 88 | 0.52s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 88 | 0.52s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 88 | 0.32s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 88 | 43.93s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 88 | 44.29s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 88 | 3.45s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 123 | 24.85s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 88 | 0.05s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 88 | 0.26s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 88 | 0.27s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 88 | 0.23s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 88 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 88 | 1.44s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 88 | 0.58s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 88 | 0.6s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 88 | 0.6s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 88 | 0.63s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 88 | 2.16s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 88 | 1.42s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 88 | 20.72s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 88 | 0.13s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 88 | 0.93s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 88 | 0.23s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 88 | 1.81s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 88 | 1.62s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 88 | 6.27s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 88 | 17.91s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 87 | 8.89s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 86 | 1.01s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 84 | 1.47s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 83 | 1.57s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 82 | 1.71s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 81 | 14.78s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 80 | 14.05s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 78 | 0.87s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 76 | 1.01s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 75 | 1.22s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 75 | 0.71s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 75 | 0.52s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 75 | 0.56s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 75 | 0.6s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 74 | 0.22s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 73 | 0.15s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 71 | 26.29s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 68 | 26.99s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 68 | 8.1s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 67 | 1.61s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 66 | 46.97s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 66 | 25.88s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 65 | 66.82s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 64 | 2.12s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 63 | 7.84s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 63 | 24.75s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 63 | 24.6s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 62 | 1.93s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 61 | 2.83s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 60 | 7.58s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 59 | 2.56s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 57 | 0.46s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 56 | 0.56s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 55 | 0.55s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 54 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 53 | 1.05s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 51 | 0.49s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 49 | 2.66s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 48 | 4.7s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 47 | 8.21s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 46 | 8.64s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 45 | 21.98s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 44 | 0.48s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 42 | 0.62s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 41 | 0.63s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 40 | 0.71s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 39 | 0.93s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 38 | 0.44s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 37 | 0.35s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 35 | 0.27s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 34 | 0.38s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 33 | 0.48s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 31 | 0.67s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 30 | 4.39s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 29 | 3.53s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 28 | 12.74s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 27 | 4.86s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 26 | 13.28s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 25 | 26.9s |
| research | `research.q161ci_native_cube_octa_dual` | native | ✅ pass | 23 | 0.3s |
| research | `research.q161cj_native_source_charge_commutant` | native | ✅ pass | 22 | 6.61s |
| research | `research.q161ck_native_antipodal_defect` | native | ✅ pass | 21 | 6.59s |
| research | `research.q161cm_native_q96_chiral_ward` | native | ✅ pass | 20 | 0.02s |
| research | `research.q161cn_native_q96_majorana` | native | ✅ pass | 19 | 0.02s |
| research | `research.q161co_native_q96_symmetric` | native | ✅ pass | 17 | 0.03s |
| research | `research.q161cp_q96_hypercharge_anomaly` | native | ✅ pass | 16 | 0.02s |
| research | `research.q161cq_native_vertex_leverage_classes` | native | ✅ pass | 15 | 2.33s |
| research | `research.q161cr_q125_symbolic_charge` | native | ✅ pass | 13 | 0.3s |
| research | `research.q161cs_q125_q96_hopf_curvature` | native | ✅ pass | 12 | 0.74s |
| research | `research.q161ct_native_five_solid_cubic` | native | ✅ pass | 10 | 0.57s |
| research | `research.q161cu_five_platonic_hopf_fluid` | native | ✅ pass | 9 | 1.08s |
| research | `research.q161cv_source_axis_urt_flow` | native | ✅ pass | 9 | 0.42s |
| research | `research.q161cx_native_ground_frame` | native | ✅ pass | 7 | 0.67s |
| research | `research.q161cw_five_solid_kinetic_exact` | native | ✅ pass | 7 | 0.52s |
| research | `research.q161cy_native_five_solid_response` | native | ✅ pass | 6 | 0.64s |
| research | `research.q162a_original_chaos_to_five` | native | ✅ pass | 4 | 2.71s |
| research | `research.q162b_native_platonic_golden_sphere` | native | ✅ pass | 4 | 0.33s |
| research | `research.q162c_native_golden_quantum_transfer` | native | ✅ pass | 4 | 0.3s |
| research | `research.q162d_native_h64_charge_four` | native | ✅ pass | 2 | 2.2s |
| research | `research.q162e_five_solid_dynamic_three_classes` | native | ❌ error — ValueError: not enough values to unpack (expected 3, got 2) | 0 | 2.35s |
| research | `research.q162f_hidden_cubic_120_identity` | native | ✅ pass | 2 | 2.22s |
| research | `research.q162g_original_ground_state_h64_density` | native | ✅ pass | 2 | 2.09s |
| research | `research.q162h_native_frustration_entropy_selection` | native | ❌ error — ValueError: not enough values to unpack (expected 3, got 2) | 0 | 2.33s |

## Archive sweep

Executed at least once: **537/537** research scripts. Latest status: assertion_failed 1, error 3, missing_file 24, pass 506, timeout 3.
This run: 72 executed (error 2, pass 69, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

