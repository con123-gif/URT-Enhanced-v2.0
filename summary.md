# Cathedral orchestrator — ✅ PASS

2026-11-17T04:35:46Z · [run 44016080593](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44016080593) · `81679ce` · push on `newtons-cathedral` · checkpoint #186

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 186 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 186 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 186 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 186 | 20.58s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 186 | 5.65s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 186 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 186 | 3.79s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 186 | 3.65s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 186 | 0.38s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 186 | 0.29s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 183 | 8.63s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 186 | 0.51s |
| native | `native.wilson_source` | native | ✅ pass | 186 | 1.05s |
| native | `native.output_gate` | native | ✅ pass | 186 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 186 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 186 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 186 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 186 | 0.1s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 9 | 0.1s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 9 | 0.24s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 9 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 9 | 1.08s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 9 | 41.97s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 9 | 4.4s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 9 | 7.47s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 9 | 17.68s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 9 | 1.65s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 9 | 4.35s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 9 | 31.85s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 9 | 0.24s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 9 | 0.56s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 9 | 0.5s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 9 | 0.6s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 9 | 3.98s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 9 | 0.16s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 9 | 28.19s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 9 | 3.58s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 9 | 0.68s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 9 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 163 | 1.66s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 9 | 4.72s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 9 | 19.85s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 9 | 0.66s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 9 | 50.33s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 9 | 2.23s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 9 | 0.19s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 9 | 0.61s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 9 | 0.08s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 9 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 157 | 81.08s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 9 | 1.63s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 9 | 1.97s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 9 | 3.36s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 152 | 84.68s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 151 | 191.18s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 9 | 31.07s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 9 | 6.3s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 145 | 107.18s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 9 | 16.4s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 9 | 45.62s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 9 | 0.26s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 9 | 2.94s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 9 | 4.99s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 9 | 1.21s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 9 | 2.5s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 9 | 1.79s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 9 | 2.25s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 9 | 1.68s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 9 | 6.61s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 9 | 2.65s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 9 | 0.57s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 9 | 0.51s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 9 | 0.5s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 9 | 0.54s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 9 | 0.59s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 9 | 0.63s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 9 | 13.57s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 9 | 56.75s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 9 | 18.87s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 9 | 18.57s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 9 | 23.74s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 9 | 17.48s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 9 | 69.52s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 9 | 25.03s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 9 | 25.38s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 9 | 0.74s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 9 | 1.44s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 9 | 5.44s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 9 | 1.96s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 9 | 1.05s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 9 | 3.12s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 9 | 0.68s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 9 | 5.31s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 9 | 0.72s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 9 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 9 | 0.5s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 9 | 0.38s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 9 | 0.32s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 9 | 0.32s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 9 | 1.57s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 9 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 9 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 9 | 27.02s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 9 | 0.28s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 9 | 0.37s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 9 | 0.88s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 9 | 0.74s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 9 | 1.02s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 9 | 2.7s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 9 | 0.89s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 9 | 4.26s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 9 | 8.5s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 9 | 0.87s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 9 | 16.06s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 9 | 30.68s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 88 | 3.04s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 88 | 1.92s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 83 | 20.91s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 9 | 30.36s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 9 | 27.27s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 88 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 88 | 72.74s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 9 | 0.38s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 9 | 0.54s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 9 | 1.12s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 9 | 0.38s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 9 | 1.33s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 9 | 0.53s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 9 | 0.72s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 9 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 9 | 2.38s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 9 | 11.44s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 9 | 0.08s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 9 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 9 | 0.05s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 9 | 1.02s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 9 | 0.23s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 9 | 6.34s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 9 | 2.02s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 9 | 37.87s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 9 | 24.36s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 9 | 23.87s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 9 | 32.57s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 9 | 51.04s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 9 | 3.45s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 9 | 27.18s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 9 | 36.86s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 9 | 42.77s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 9 | 30.47s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 60 | 46.3s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 9 | 30.57s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 60 | 65.03s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 9 | 59.1s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 9 | 0.47s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 9 | 52.92s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 9 | 2.03s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 9 | 1.15s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 49 | 67.67s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 9 | 0.84s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 9 | 0.71s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 51 | 33.91s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 9 | 0.53s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 9 | 0.6s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 9 | 0.41s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 9 | 53.37s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 9 | 43.7s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 9 | 4.04s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 44 | 34.45s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 9 | 0.07s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 9 | 0.29s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 9 | 0.27s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 9 | 0.25s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 9 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 9 | 1.86s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 9 | 0.59s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 9 | 0.68s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 9 | 0.76s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 9 | 0.71s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 9 | 2.19s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 9 | 1.55s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 9 | 26.61s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 9 | 0.18s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 9 | 0.9s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 9 | 0.25s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 9 | 2.56s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 9 | 1.72s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 9 | 6.3s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 9 | 20.39s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 8 | 11.49s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 7 | 1.09s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 5 | 1.53s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 4 | 1.58s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 3 | 2.17s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 2 | 20.35s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 1 | 14.4s |

## Archive sweep

Executed at least once: **455/455** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 429, timeout 2.
This run: 175 executed (assertion_failed 1, missing_file 5, pass 169).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

