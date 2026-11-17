# Cathedral orchestrator — ✅ PASS

2026-11-17T01:36:26Z · [run 43994461863](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43994461863) · `a09f396` · push on `newtons-cathedral` · checkpoint #183

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 183 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 183 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 183 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 183 | 19.4s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 183 | 14.11s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 183 | 0.46s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 183 | 3.73s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 183 | 3.33s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 183 | 0.35s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 183 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 180 | 8.61s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 183 | 0.52s |
| native | `native.wilson_source` | native | ✅ pass | 183 | 1.3s |
| native | `native.output_gate` | native | ✅ pass | 183 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 183 | 0.49s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 183 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 183 | 0.61s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 183 | 0.14s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 6 | 0.08s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 6 | 0.25s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 6 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 6 | 0.72s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 6 | 30.87s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 6 | 4.53s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 6 | 6.47s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 6 | 9.69s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 6 | 1.15s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 6 | 4.28s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 6 | 28.24s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 6 | 0.13s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 6 | 0.56s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 6 | 0.5s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 6 | 0.51s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 6 | 1.85s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 6 | 0.12s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 6 | 28.37s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 6 | 3.32s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 6 | 0.41s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 6 | 1.05s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 160 | 1.47s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 6 | 4.76s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 6 | 17.95s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 6 | 0.4s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 6 | 39.6s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 6 | 2.3s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 6 | 0.16s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 6 | 0.34s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 6 | 0.07s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 6 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 154 | 57.13s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 6 | 1.55s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 6 | 1.17s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 6 | 2.52s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 149 | 64.45s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 148 | 136.95s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 6 | 31.36s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 6 | 6.94s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 142 | 75.05s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 6 | 9.45s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 6 | 31.45s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 6 | 0.27s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 6 | 2.84s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 6 | 3.06s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 6 | 0.98s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 6 | 2.8s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 6 | 1.71s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 6 | 1.32s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 6 | 1.32s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 6 | 6.81s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 6 | 2.59s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 6 | 0.35s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 6 | 0.44s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 6 | 0.51s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 6 | 0.47s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 6 | 0.37s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 6 | 0.51s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 6 | 14.25s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 6 | 51.55s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 6 | 10.41s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 6 | 14.14s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 6 | 24.48s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 6 | 15.82s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 6 | 37.32s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 6 | 18.54s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 6 | 26.03s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 6 | 0.64s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 6 | 0.73s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 6 | 5.01s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 6 | 1.91s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 6 | 0.82s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 6 | 1.66s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 6 | 0.64s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 6 | 5.38s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 6 | 0.61s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 6 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 6 | 0.36s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 6 | 0.4s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 6 | 0.25s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 6 | 0.21s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 6 | 1.3s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 6 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 6 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 6 | 15.21s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 6 | 0.27s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 6 | 0.34s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 6 | 0.79s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 6 | 0.48s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 6 | 0.96s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 6 | 2.75s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 6 | 0.72s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 6 | 2.38s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 6 | 7.98s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 6 | 0.86s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 6 | 11.91s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 6 | 16.72s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 85 | 5.28s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 85 | 3.55s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 80 | 36.25s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 6 | 22.9s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 6 | 28.16s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 85 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 85 | 123.61s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 6 | 0.32s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 6 | 0.32s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 6 | 0.95s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 6 | 0.38s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 6 | 1.1s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 6 | 0.33s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 6 | 0.57s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 6 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 6 | 2.04s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 6 | 5.87s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 6 | 0.06s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 6 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 6 | 0.04s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 6 | 0.62s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 6 | 0.2s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 6 | 6.31s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 6 | 1.9s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 6 | 19.77s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 6 | 21.43s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 6 | 23.92s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 6 | 24.2s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 6 | 26.68s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 6 | 2.72s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 6 | 27.21s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 6 | 27.26s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 6 | 22.71s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 6 | 25.99s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 57 | 32.8s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 6 | 30.52s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 57 | 44.08s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 6 | 53.24s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 6 | 0.39s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 6 | 40.42s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 6 | 2.03s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 6 | 1.03s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 46 | 45.43s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 6 | 0.57s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 6 | 0.68s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 48 | 24.34s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 6 | 0.52s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 6 | 0.52s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 6 | 0.28s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 6 | 40.67s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 6 | 44.33s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 6 | 3.49s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 41 | 24.7s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 6 | 0.09s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 6 | 0.3s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 6 | 0.28s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 6 | 0.23s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 6 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 6 | 1.37s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 6 | 0.6s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 6 | 0.59s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 6 | 0.61s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 6 | 0.75s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 6 | 2.2s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 6 | 1.35s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 6 | 14.29s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 6 | 0.13s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 6 | 0.92s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 6 | 0.25s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 6 | 1.54s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 6 | 1.57s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 6 | 6.23s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 6 | 17.8s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 5 | 6.94s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 4 | 1.15s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 2 | 1.37s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 1 | 1.56s |

## Archive sweep

Executed at least once: **452/452** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 426, timeout 2.
This run: 117 executed (assertion_failed 1, missing_file 1, pass 115).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-15_q153_full_physical_stability/Q153_FULL_NATIVE_TRANSVERSE_HESSIAN.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

