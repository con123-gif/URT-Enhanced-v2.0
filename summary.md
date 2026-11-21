# Cathedral orchestrator — ✅ PASS

2026-11-21T03:38:58Z · [run 44860495526](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44860495526) · `9a58d36` · push on `newtons-cathedral` · checkpoint #277

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 277 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 277 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 277 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 277 | 12.61s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 277 | 6.91s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 277 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 277 | 4.39s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 277 | 3.88s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 277 | 0.37s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 277 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 274 | 9.49s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 277 | 0.55s |
| native | `native.wilson_source` | native | ✅ pass | 277 | 1.25s |
| native | `native.output_gate` | native | ✅ pass | 277 | 0.07s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 277 | 0.4s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 277 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 277 | 0.67s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 277 | 0.09s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 100 | 0.09s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 100 | 0.35s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 100 | 0.02s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 100 | 0.85s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 100 | 31.83s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 100 | 5.79s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 100 | 5.88s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 100 | 11.36s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 100 | 1.15s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 100 | 5.19s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 100 | 25.08s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 100 | 0.16s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 100 | 0.73s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 100 | 0.66s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 100 | 0.85s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 100 | 2.49s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 100 | 0.13s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 100 | 35.83s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 100 | 2.64s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 100 | 0.45s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 100 | 0.99s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 254 | 1.54s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 100 | 5.58s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 100 | 15.42s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 100 | 0.45s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 100 | 40.86s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 100 | 2.9s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 100 | 0.14s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 100 | 0.46s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 100 | 0.07s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 100 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 248 | 57.11s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 100 | 1.29s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 100 | 1.42s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 100 | 2.54s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 243 | 64.88s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 242 | 137.95s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 100 | 39.26s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 100 | 5.45s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 236 | 77.62s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 100 | 11.3s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 100 | 32.05s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 100 | 0.32s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 100 | 2.37s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 100 | 3.48s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 100 | 0.97s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 100 | 3.03s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 100 | 1.44s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 100 | 1.54s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 100 | 1.32s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 100 | 8.83s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 100 | 2.1s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 100 | 0.38s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 100 | 0.45s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 100 | 0.65s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 100 | 0.39s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 100 | 0.4s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 100 | 0.53s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 100 | 17.42s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 100 | 43.88s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 100 | 12.45s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 100 | 14.56s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 100 | 30.72s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 100 | 13.33s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 100 | 43.59s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 100 | 18.37s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 100 | 31.67s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 100 | 0.56s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 100 | 0.86s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 100 | 4.72s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 100 | 2.75s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 100 | 0.79s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 100 | 2.0s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 100 | 0.53s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 100 | 6.89s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 100 | 0.55s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 100 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 100 | 0.37s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 100 | 0.49s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 100 | 0.25s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 100 | 0.25s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 100 | 1.13s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 100 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 100 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 100 | 18.08s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 100 | 0.21s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 100 | 0.45s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 100 | 0.67s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 100 | 0.53s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 100 | 0.76s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 100 | 3.44s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 100 | 0.67s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 100 | 2.81s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 100 | 7.39s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 100 | 1.07s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 100 | 12.17s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 100 | 20.39s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 179 | 4.12s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 179 | 2.71s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 174 | 29.48s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 100 | 22.09s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 100 | 33.82s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 179 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 179 | 99.9s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 100 | 0.3s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 100 | 0.39s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 100 | 0.88s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 100 | 0.49s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 100 | 1.01s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 100 | 0.39s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 100 | 0.53s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 100 | 0.04s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 100 | 1.8s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 100 | 7.34s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 100 | 0.06s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 100 | 0.09s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 100 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 100 | 0.72s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 100 | 0.18s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 100 | 9.39s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 100 | 1.5s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 100 | 24.35s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 100 | 20.82s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 100 | 37.62s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 100 | 24.47s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 100 | 32.36s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 100 | 2.51s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 100 | 41.76s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 100 | 27.26s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 100 | 27.4s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 100 | 24.66s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 151 | 32.8s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 100 | 45.85s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 151 | 44.34s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 100 | 43.55s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 100 | 0.35s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 100 | 39.65s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 100 | 2.68s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 100 | 0.88s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 140 | 45.93s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 100 | 0.59s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 100 | 0.61s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 142 | 24.3s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 100 | 0.65s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 100 | 0.46s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 100 | 0.28s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 100 | 40.09s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 100 | 52.84s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 100 | 3.04s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 135 | 24.97s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 100 | 0.05s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 100 | 0.23s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 100 | 0.33s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 100 | 0.19s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 100 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 100 | 1.29s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 100 | 0.71s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 100 | 0.54s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 100 | 0.56s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 100 | 0.55s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 100 | 2.75s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 100 | 1.19s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 100 | 16.47s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 100 | 0.12s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 100 | 1.17s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 100 | 0.19s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 100 | 1.71s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 100 | 1.36s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 100 | 8.14s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 100 | 15.43s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 99 | 7.6s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 98 | 0.87s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 96 | 1.3s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 95 | 2.24s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 94 | 1.59s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 93 | 14.18s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 92 | 12.39s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 90 | 1.21s |
| research_c | `research.q161am_joint_face_edge` | conditional | ✅ pass | 88 | 0.93s |
| research_a | `research.urt_fibonacci_closure_recovered` | independent | ✅ pass | 87 | 1.11s |
| research_b | `research.frustration_capacity_recovered` | conditional | ✅ pass | 87 | 0.87s |
| research_c | `research.frustration_baryon_ward_recovered` | conditional | ✅ pass | 87 | 0.45s |
| research_d | `research.urt_parity_history_recovered` | conditional | ✅ pass | 87 | 0.47s |
| research_a | `research.frustration_collective_ness_recovered` | conditional | ✅ pass | 87 | 0.53s |
| research_a | `research.q161_part21_native_grading_audit` | independent | ✅ pass | 86 | 0.2s |
| research_a | `research.q161_step23_completion_audit` | independent | ✅ pass | 85 | 0.14s |
| research_a | `research.q161_native_graded48` | native | ✅ pass | 83 | 23.09s |
| research_b | `research.q161_graded_nonzero_flux_native` | native | ✅ pass | 80 | 42.33s |
| research_a | `research.q161_flux_exact_stationarity` | independent | ✅ pass | 80 | 7.51s |
| research_a | `research.q161as_native_edge_energy` | independent | ✅ pass | 79 | 1.41s |
| research_b | `research.q161_ns4_curved_native` | native | ✅ pass | 78 | 67.24s |
| research_b | `research.q161_graded_four_one_form_photon` | native | ✅ pass | 78 | 39.76s |
| research_a | `research.q161_thermodynamic_photon_native` | native | ✅ pass | 77 | 54.28s |
| research_c | `research.q161_source_selected_generation` | independent | ✅ pass | 76 | 2.02s |
| research_c | `research.q161_direct_face_vertex_generation` | conditional | ✅ pass | 75 | 7.6s |
| research_c | `research.q161_q96_hopf_three_generation_vertex` | native | ✅ pass | 75 | 24.97s |
| research_c | `research.q161_full_ew_hopf_yukawa_covariance` | native | ✅ pass | 75 | 25.04s |
| research_b | `research.q161_exact_hidden4_yukawa_isometry` | independent | ✅ pass | 74 | 2.74s |
| research_a | `research.q161ax_face_orbit_covariance` | independent | ✅ pass | 73 | 2.42s |
| research_a | `research.q161ay_native_face_covariance` | independent | ✅ pass | 72 | 6.28s |
| research_a | `research.q161az_dual_face_covariance` | independent | ✅ pass | 71 | 2.14s |
| research_a | `research.q161ba_dual_face_spectral_weights` | independent | ✅ pass | 69 | 0.39s |
| research_a | `research.q161bb_native_covariance_purity` | independent | ✅ pass | 68 | 0.47s |
| research_a | `research.q161bc_native_clock_covariance` | independent | ✅ pass | 67 | 0.47s |
| research_a | `research.q161be_q96_clock_charge` | conditional | ✅ pass | 66 | 0.02s |
| research_a | `research.q161bf_q96_twisted_clock` | conditional | ✅ pass | 65 | 0.85s |
| research_a | `research.q161bh_q96_seam_nonselection` | conditional | ✅ pass | 63 | 0.4s |
| research_a | `research.q161bi_native_face_flux_seam` | independent | ✅ pass | 61 | 2.24s |
| research_a | `research.q161bj_native_face_intensity_mean` | independent | ✅ pass | 60 | 4.02s |
| research_a | `research.q161bl_native_dual_face_distance` | independent | ✅ pass | 59 | 6.97s |
| research_a | `research.q161bm_native_edge_covariance` | independent | ✅ pass | 58 | 7.31s |
| research_a | `research.q161bn_native_edge_kernel` | independent | ✅ pass | 57 | 18.68s |
| research_a | `research.q161bo_native_dual_integral_hodge` | independent | ✅ pass | 56 | 0.44s |
| research_a | `research.q161bp_native_antipodal_hodge` | independent | ✅ pass | 54 | 0.54s |
| research_a | `research.q161bq_native_edge_parity` | independent | ✅ pass | 53 | 0.55s |
| research | `research.q161br_native_edge_clock_reversal` | independent | ✅ pass | 52 | 0.79s |
| research | `research.q161bs_native_clock_holonomy` | independent | ✅ pass | 51 | 1.0s |
| research | `research.q161bu_native_charge_clock_separation` | conditional | ✅ pass | 50 | 0.45s |
| research | `research.q161bv_native_history_clock_charge` | conditional | ✅ pass | 49 | 0.37s |
| research | `research.q161bw_native_sigma_spectrum` | independent | ✅ pass | 47 | 0.28s |
| research | `research.q161bx_native_charged_intertwiner` | independent | ✅ pass | 46 | 0.39s |
| research | `research.q161by_native_190_clock_determinant` | independent | ✅ pass | 45 | 0.5s |
| research | `research.q161bz_native_190_kernel` | independent | ✅ pass | 43 | 0.69s |
| research | `research.q161ca_native_harmonic_source_kernel` | native | ✅ pass | 42 | 4.47s |
| research | `research.q161cb_native_source_gram` | native | ✅ pass | 41 | 3.54s |
| research | `research.q161cc_native_source_schur` | native | ✅ pass | 40 | 12.95s |
| research | `research.q161cd_native_five_solid_leverage` | native | ✅ pass | 39 | 5.08s |
| research | `research.q161ce_native_source_deletion` | native | ✅ pass | 38 | 13.51s |
| research | `research.q161cf_native_source_subset_ranks` | native | ✅ pass | 37 | 26.91s |
| research | `research.q161ci_native_cube_octa_dual` | native | ✅ pass | 35 | 0.29s |
| research | `research.q161cj_native_source_charge_commutant` | native | ✅ pass | 34 | 6.52s |
| research | `research.q161ck_native_antipodal_defect` | native | ✅ pass | 33 | 6.46s |
| research | `research.q161cm_native_q96_chiral_ward` | native | ✅ pass | 32 | 0.02s |
| research | `research.q161cn_native_q96_majorana` | native | ✅ pass | 31 | 0.02s |
| research | `research.q161co_native_q96_symmetric` | native | ✅ pass | 29 | 0.03s |
| research | `research.q161cp_q96_hypercharge_anomaly` | native | ✅ pass | 28 | 0.02s |
| research | `research.q161cq_native_vertex_leverage_classes` | native | ✅ pass | 27 | 2.3s |
| research | `research.q161cr_q125_symbolic_charge` | native | ✅ pass | 25 | 0.29s |
| research | `research.q161cs_q125_q96_hopf_curvature` | native | ✅ pass | 24 | 0.72s |
| research | `research.q161ct_native_five_solid_cubic` | native | ✅ pass | 22 | 0.56s |
| research | `research.q161cu_five_platonic_hopf_fluid` | native | ✅ pass | 21 | 1.09s |
| research | `research.q161cv_source_axis_urt_flow` | native | ✅ pass | 21 | 0.42s |
| research | `research.q161cx_native_ground_frame` | native | ✅ pass | 19 | 0.66s |
| research | `research.q161cw_five_solid_kinetic_exact` | native | ✅ pass | 19 | 0.5s |
| research | `research.q161cy_native_five_solid_response` | native | ✅ pass | 18 | 0.63s |
| research | `research.q162a_original_chaos_to_five` | native | ✅ pass | 16 | 2.72s |
| research | `research.q162b_native_platonic_golden_sphere` | native | ✅ pass | 16 | 0.33s |
| research | `research.q162c_native_golden_quantum_transfer` | native | ✅ pass | 16 | 0.29s |
| research | `research.q162d_native_h64_charge_four` | native | ✅ pass | 14 | 2.12s |
| research | `research.q162e_five_solid_dynamic_three_classes` | native | ✅ pass | 12 | 2.33s |
| research | `research.q162f_hidden_cubic_120_identity` | native | ✅ pass | 14 | 2.27s |
| research | `research.q162g_original_ground_state_h64_density` | native | ✅ pass | 14 | 2.1s |
| research | `research.q162h_native_frustration_entropy_selection` | native | ✅ pass | 12 | 2.37s |
| research | `research.q162i_native_tetra_cubic_inversion` | native | ✅ pass | 12 | 2.4s |
| research | `research.q161db_native_face_jacobian` | native | ✅ pass | 11 | 5.75s |
| research | `research.q162j_established_physics_baseline` | native | ✅ pass | 9 | 0.69s |
| research | `research.q161dc_q96_clock_spectrum` | native | ✅ pass | 9 | 0.42s |
| research | `research.q161dd_q96_clock_green_trace` | native | ✅ pass | 8 | 0.38s |
| research | `research.q161de_q96_antipodal_green` | native | ✅ pass | 7 | 0.02s |
| research | `research.q161df_q96_clock_kirchhoff` | conditional | ✅ pass | 6 | 0.02s |
| research | `research.q161dg_q96_clock_pseudodeterminant` | conditional | ✅ pass | 5 | 0.02s |
| research | `research.q161dj_q96_clock_fourth_moment` | conditional | ✅ pass | 3 | 0.02s |
| research | `research.q161do_native_face_jacobian_norm` | native | ✅ pass | 1 | 8.57s |

## Archive sweep

Executed at least once: **546/546** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 519, timeout 3.
This run: 277 executed (missing_file 18, pass 258, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-10-17_original_oct08_source/joint_vacuum_work/species/verify_full64_deformations.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

