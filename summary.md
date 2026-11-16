# Cathedral orchestrator — ✅ PASS

2026-11-16T19:38:58Z · [run 43938229674](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43938229674) · `64c50a0` · push on `newtons-cathedral` · checkpoint #178

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 178 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 178 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 178 | 0.28s |
| tests | `tests.suite` | regression | ✅ pass | 178 | 21.52s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 178 | 5.61s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 178 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 178 | 4.86s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 178 | 4.63s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 178 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 178 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 175 | 11.46s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 178 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 178 | 1.03s |
| native | `native.output_gate` | native | ✅ pass | 178 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 178 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 178 | 0.25s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 178 | 0.55s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 178 | 0.08s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 1 | 0.13s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 1 | 0.25s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 1 | 0.04s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 1 | 1.15s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 1 | 54.81s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 1 | 5.37s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 1 | 6.47s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 1 | 17.37s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 1 | 1.87s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 1 | 5.19s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 1 | 28.38s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 1 | 0.24s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 1 | 0.77s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 1 | 0.6s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 1 | 0.48s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 1 | 4.14s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 1 | 0.24s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 1 | 34.1s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 1 | 3.36s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 1 | 0.71s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 1 | 1.67s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 155 | 1.39s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 1 | 5.55s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 1 | 17.65s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 1 | 0.67s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 1 | 61.95s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 1 | 2.7s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 1 | 0.16s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 1 | 0.63s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 1 | 0.1s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 1 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 149 | 56.65s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 1 | 1.46s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 1 | 2.0s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 1 | 3.99s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 144 | 64.71s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 143 | 137.73s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 1 | 38.4s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 1 | 6.84s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 137 | 78.98s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 1 | 16.49s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 1 | 53.69s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 1 | 0.3s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 1 | 2.73s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 1 | 4.96s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 1 | 1.5s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 1 | 2.93s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 1 | 1.67s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 1 | 2.25s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 1 | 2.07s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 1 | 8.14s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 1 | 2.42s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 1 | 0.57s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 1 | 0.66s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 1 | 0.59s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 1 | 0.5s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 1 | 0.59s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 1 | 0.82s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 1 | 16.68s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 1 | 50.83s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 1 | 18.98s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 1 | 23.72s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 1 | 30.19s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 1 | 15.54s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 1 | 68.5s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 1 | 31.15s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 1 | 30.08s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 1 | 0.64s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 1 | 1.45s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 1 | 8.49s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 1 | 2.53s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 1 | 0.85s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 1 | 3.11s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 1 | 0.92s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 1 | 6.48s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 1 | 0.62s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 1 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 1 | 0.65s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 1 | 0.46s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 1 | 0.27s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 1 | 0.31s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 1 | 2.03s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 1 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 1 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 1 | 27.19s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 1 | 0.34s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 1 | 0.42s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 1 | 0.83s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 1 | 0.77s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 1 | 1.32s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 1 | 3.23s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 1 | 0.72s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 1 | 4.17s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 1 | 13.56s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 1 | 1.01s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 1 | 11.92s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 1 | 30.4s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 80 | 4.23s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 80 | 2.71s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 75 | 29.87s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 1 | 38.12s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 1 | 32.07s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 80 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 80 | 99.66s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 1 | 0.33s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 1 | 0.54s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 1 | 1.63s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 1 | 0.51s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 1 | 1.08s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 1 | 0.54s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 1 | 0.96s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 1 | 0.04s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 1 | 2.05s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 1 | 11.29s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 1 | 0.1s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 1 | 0.08s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 1 | 0.05s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 1 | 1.07s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 1 | 0.3s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 1 | 8.6s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 1 | 1.81s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 1 | 37.5s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 1 | 38.52s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 1 | 33.75s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 1 | 24.05s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 1 | 50.81s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 1 | 4.47s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 1 | 37.84s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 1 | 27.13s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 1 | 42.17s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 1 | 45.83s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 52 | 33.19s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 1 | 41.54s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 52 | 44.14s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 1 | 53.5s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 1 | 0.51s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 1 | 69.99s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 1 | 2.53s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 1 | 1.04s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 41 | 45.63s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 1 | 0.85s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 1 | 1.02s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 43 | 24.28s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 1 | 0.62s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 1 | 0.53s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 1 | 0.42s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 1 | 71.59s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 1 | 49.19s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 1 | 3.45s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 36 | 25.18s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 1 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 1 | 0.4s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 1 | 0.32s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 1 | 0.23s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 1 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 1 | 2.37s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 1 | 0.68s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 1 | 0.6s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 1 | 0.81s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 1 | 0.98s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 1 | 2.56s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 1 | 1.36s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 1 | 26.23s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 1 | 0.22s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 1 | 1.14s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 1 | 0.23s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 1 | 2.57s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 1 | 2.51s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 1 | 7.49s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 1 | 18.23s |

**Changed since last run:** `research.sandbox_bound_scripts` no_result → pass; `research.missing_intermediates` no_result → pass; `research.q6_repair_structural_regression` no_result → pass; `research.independent_native_five_k2` no_result → pass; `research.unsigned_axis_order_k2` no_result → pass; `research.signed_a5_covariance` no_result → pass; `research.signed_dictionary_classes` no_result → pass; `research.native_signed_dictionary_k3` no_result → pass; `research.induced_photon_logdet_kernel` no_result → pass; `research.induced_photon_vacuum_selection` no_result → pass; `research.native_signed_dictionary_k23` no_result → pass; `research.icosahedral_induced_photon` no_result → pass; `research.hodge_dirac_flux_vacuum` no_result → pass; `research.hodge_dirac_photon_kernel` no_result → pass; `research.hodge_dirac_19_mode_photon` no_result → pass; `research.incidence_photon_a5_sectors` no_result → pass; `research.platonic_hidden_sector_link` no_result → pass; `research.q15_native_namespace_repair` no_result → pass; `research.chaos_invariant_refinement_audit` no_result → pass; `research.hidden_parity_delta_selection` no_result → pass; `research.q4_native_matter_map` no_result → pass; `research.registry_maxwell_test` no_result → pass; `research.native_signed_dictionary_k4` no_result → pass; `research.q23_photon_gauge_typing` no_result → pass; `research.q3_twirled_chronology_classes` no_result → pass; `research.q7_review_q6_cumulants` no_result → pass; `research.candidate1_induced_em_icosahedron` no_result → pass; `research.q25_4d_a5_photon` no_result → pass; `research.candidate1_4d_holonomy_instability` no_result → pass; `research.q22_tetrahedron_exact_kernel` no_result → pass; `research.q27_twirled_orientation` no_result → pass; `research.q28_twirled_third_trace` no_result → pass; `research.q29_twirled_fourth_trace` no_result → pass; `research.q33_singular_spectrum` no_result → pass; `research.q34_seventh_mixed_words` no_result → pass; `research.q35_eighth_mixed_words` no_result → pass; `research.q32_mixed_trace_meaning` no_result → pass; `research.q37_primitive_q2_trace` no_result → pass; `research.q38_primitive_q2_allpairs` no_result → pass; `research.q39_eight_image_q2` no_result → pass; `research.q40_cross_orbit_q2` no_result → pass; `research.q40_review_operator_equality` no_result → pass; `research.q42_middle_flip_orbitals` no_result → pass; `research.q43_native_character_criterion` no_result → pass; `research.q44_middle_flip_symmetry` no_result → pass; `research.q45_zero_coset_orders` no_result → pass; `research.q46_rotation_mechanism` no_result → pass; `research.q52_native_source_unitary` no_result → pass; `research.q53_native_onshell_ward_clock` no_result → pass; `research.q56_full_stationary_current` no_result → pass; `research.q58_native_coupling_curvature` no_result → pass; `research.q57_native_clock_geometry` no_result → pass; `research.q59_time_generator` no_result → pass; `research.q61_inverse_limit_lifts` no_result → pass; `research.q62_lift_carrier` no_result → pass; `research.q64_conditioned_selection` no_result → pass; `research.q65_horizon_selection` no_result → pass; `research.q72_time_reversal_bridge` no_result → pass; `research.q73_joint_clock_bridge` no_result → pass; `research.q77_exact_clock_split` no_result → pass; `research.q82_oriented_source_weights` no_result → pass; `research.q85_chronology_coefficient` no_result → pass; `research.q55_hopf_wilson_ward` no_result → pass; `research.q60_hopf_h64_frame` no_result → pass; `research.native_clock_rate_flux_quadrature` no_result → pass; `research.q49_fixed_source_gauge_obstruction` no_result → pass; `research.q49_haar_diagonal_transport` no_result → pass; `research.q49_native_ward_history_map` no_result → pass; `research.q50_uniform_history_gauge` no_result → pass; `research.q53_v61_internal_symmetry` no_result → pass; `research.hopf_charged_carrier` no_result → pass; `research.q69_native_lift_clock_spectrum` no_result → pass; `research.q70_native_clock_fixed_space` no_result → pass; `research.q68_native_bridge_polytope` no_result → pass; `research.q64_a2d_reversible_normalizer` no_result → pass; `research.q64_a2c_native_lift_partition` no_result → pass; `research.q71_q2_clock_mixing` no_result → pass; `research.q64_a2b_native_path_likelihood` no_result → pass; `research.q64_a2_native_conditioning` no_result → pass; `research.q60_native_coordinate_selection` no_result → pass; `research.q60_charge_tensor_ward` no_result → pass; `research.cross_archive_photon_join` no_result → pass; `research.q71_native_q3_clock` no_result → pass; `research.q75_native_q3_sigma_commutator` no_result → pass; `research.q76_native_hidden_commutator_overlap` no_result → pass; `research.q78_eight_dictionary_hidden` no_result → pass; `research.q79_native_nonlinear_pair_source` no_result → pass; `research.q80_native_hidden_source_selection` no_result → pass; `research.q81_native_all_five_source_radical` no_result → pass; `research.q83_native_hidden_clock_quotient` no_result → pass; `research.q89_exact_source_all_dictionaries` no_result → pass; `research.q90_exact_native_fourier` no_result → pass; `research.q91_bridge_loss_sequence` no_result → pass; `research.q92_clock_overlap_reading` no_result → pass; `research.q87_coefficient_elimination` no_result → pass; `research.q87b_native_bridge_parity_rayleigh` no_result → pass; `research.q87c_native_bridge_singular_spectrum` no_result → pass; `research.q87d_native_parity_commutator` no_result → pass; `research.q87e_native_parity_energy` no_result → pass; `research.q87f_native_bridge_trace` no_result → pass; `research.q87g_native_second_moment` no_result → pass; `research.q93_primitive_clock_trace` no_result → pass; `research.q94_native_hidden_clock` no_result → pass; `research.q95_source_carrier_exact` no_result → pass; `research.q95_full_five_numeric` no_result → pass; `research.q96_original_action_mismatch` no_result → pass; `research.q96_original_source_chebyshev` no_result → pass; `research.q97_face_locality_exact` no_result → pass; `research.q97_five_solid_locality` no_result → pass; `research.q98_recovered_asymmetry` no_result → pass; `research.q99_native_parity_rigidity` no_result → pass; `research.q101_moving_arf` no_result → pass; `research.q101_magnetic_factor` no_result → pass; `research.q102_born_current` no_result → pass; `research.q103_alltime_spectral_counting` no_result → pass; `research.q105_broken_charged_wilson` no_result → pass; `research.q106_exact_charged_berry` no_result → pass; `research.q106_joined_native_wilson` no_result → pass; `research.q107_chern_berry_wilson` no_result → pass; `research.q108_native_born_fisher` no_result → pass; `research.q109_full_joined_gauge` no_result → pass; `research.q111_charge_bundle_period` no_result → pass; `research.q113_native_mixed_spectral_variance` no_result → pass; `research.q114_hidden_distance` no_result → pass; `research.q115_native_a5_four_pole_source` no_result → pass; `research.q116_local_wedge_golden_bridge` no_result → pass; `research.q118_native_complement_spectrum` no_result → pass; `research.q119_native_contact_scale` no_result → pass; `research.q120_moving_reversal_barrier` no_result → pass; `research.q123_golden_saddle_capacity` no_result → pass; `research.q124_native_charged_barrier` no_result → pass; `research.q126_kinetic_clock_no_go` no_result → pass; `research.q118b_quartet_multiplicity` no_result → pass; `research.q104_clock_transport` no_result → pass; `research.q127_unitary_connection` no_result → pass; `research.q144_shell_equitable_recovery` no_result → pass; `research.q139_q146_context_recovery` no_result → pass; `research.q147_weighted_link_recovery` no_result → pass; `research.q149_original_528_flux` no_result → pass; `research.q160_native_gap_robustness` no_result → pass; `research.q161_native_gram_spectrum` no_result → pass; `research.q161e_native_hidden_rank` no_result → pass; `research.q161f_clock_hidden_rank` no_result → pass; `research.q161h_hidden_shift` no_result → pass; `research.q161i_hidden_second_order` no_result → pass; `research.q161j_two_vertex_hidden` no_result → pass; `research.q161k_native_stacked_sources` no_result → pass; `research.q161l_axis_orbit` no_result → pass; `research.q161n_parity_source` no_result → pass; `research.q161p_full_kernel_upstream` no_result → pass; `research.q161r_parity_source_selection` no_result → pass; `research.q161t_native_face_source` no_result → pass; `research.q161u_native_face_gram` no_result → pass; `research.q161v_six_axis_face` no_result → pass; `research.q161w_axis_subsets` no_result → pass

## Archive sweep

Executed at least once: **448/448** research scripts. Latest status: missing_file 24, pass 421, timeout 3.
This run: 221 executed (missing_file 5, pass 216).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

