# Cathedral orchestrator — ❌ FAIL

2026-11-17T09:39:32Z · [run 44054713228](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/44054713228) · `979dfe1` · push on `newtons-cathedral` · checkpoint #189

**Gating failures:** `research.q161am_joint_face_edge`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 189 | 0.03s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 189 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 189 | 0.16s |
| tests | `tests.suite` | regression | ✅ pass | 189 | 16.91s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 189 | 5.25s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 189 | 0.22s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 189 | 4.38s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 189 | 3.94s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 189 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 189 | 0.28s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 186 | 9.85s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 189 | 0.55s |
| native | `native.wilson_source` | native | ✅ pass | 189 | 0.91s |
| native | `native.output_gate` | native | ✅ pass | 189 | 0.07s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 189 | 0.38s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 189 | 0.23s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 189 | 0.55s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 189 | 0.07s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 12 | 0.12s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 12 | 0.32s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 12 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 12 | 0.85s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 12 | 50.46s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 12 | 6.04s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 12 | 7.36s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 12 | 13.57s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 12 | 1.94s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 12 | 5.31s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 12 | 31.14s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 12 | 0.18s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 12 | 0.81s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 12 | 0.69s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 12 | 0.59s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 12 | 2.61s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 12 | 0.2s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 12 | 36.8s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 12 | 3.53s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 12 | 0.53s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 12 | 1.52s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 166 | 1.28s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 12 | 5.68s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 12 | 19.47s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 12 | 0.52s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 12 | 56.48s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 12 | 2.95s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 12 | 0.18s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 12 | 0.5s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 12 | 0.09s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 12 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 160 | 50.81s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 12 | 1.59s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 12 | 1.82s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 12 | 3.77s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 155 | 57.31s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 154 | 123.66s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 12 | 38.09s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 12 | 6.12s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 148 | 79.68s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 12 | 14.61s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 12 | 48.41s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 12 | 0.34s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 12 | 2.88s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 12 | 4.71s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 12 | 1.45s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 12 | 3.1s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 12 | 1.75s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 12 | 1.93s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 12 | 1.95s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 12 | 8.87s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 12 | 2.6s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 12 | 0.45s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 12 | 0.61s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 12 | 0.65s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 12 | 0.51s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 12 | 0.46s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 12 | 0.75s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 12 | 17.97s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 12 | 56.07s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 12 | 14.94s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 12 | 23.18s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 12 | 31.66s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 12 | 17.25s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 12 | 52.86s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 12 | 29.02s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 12 | 32.47s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 12 | 0.73s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 12 | 0.99s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 12 | 7.68s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 12 | 2.83s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 12 | 1.03s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 12 | 2.41s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 12 | 0.83s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 12 | 7.06s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 12 | 0.7s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 12 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 12 | 0.6s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 12 | 0.5s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 12 | 0.31s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 12 | 0.26s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 12 | 1.88s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 12 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 12 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 12 | 18.63s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 12 | 0.33s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 12 | 0.46s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 12 | 0.86s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 12 | 0.63s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 12 | 1.22s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 12 | 3.53s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 12 | 0.86s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 12 | 3.25s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 12 | 12.02s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 12 | 1.1s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 12 | 15.93s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 12 | 19.82s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 91 | 2.96s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 91 | 1.92s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 86 | 20.85s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 12 | 35.79s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 12 | 34.59s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 91 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 91 | 72.05s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 12 | 0.38s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 12 | 0.41s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 12 | 1.43s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 12 | 0.49s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 12 | 1.31s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 12 | 0.41s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 12 | 0.86s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 12 | 0.04s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 12 | 2.34s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 12 | 7.19s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 12 | 0.09s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 12 | 0.09s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 12 | 0.05s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 12 | 0.76s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 12 | 0.27s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 12 | 9.68s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 12 | 1.98s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 12 | 23.86s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 12 | 34.45s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 12 | 38.43s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 12 | 32.71s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 12 | 32.37s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 12 | 4.06s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 12 | 42.63s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 12 | 36.27s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 12 | 27.62s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 12 | 41.38s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 63 | 28.63s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 12 | 47.25s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 63 | 39.18s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 12 | 58.02s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 12 | 0.4s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 12 | 65.45s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 12 | 2.81s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 12 | 1.13s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 52 | 40.77s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 12 | 0.66s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 12 | 0.89s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 54 | 20.53s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 12 | 0.68s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 12 | 0.58s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 12 | 0.33s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 12 | 65.9s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 12 | 53.04s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 12 | 3.97s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 47 | 21.29s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 12 | 0.05s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 12 | 0.35s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 12 | 0.35s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 12 | 0.25s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 12 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 12 | 2.17s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 12 | 0.76s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 12 | 0.67s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 12 | 0.63s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 12 | 0.85s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 12 | 2.88s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 12 | 1.51s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 12 | 20.98s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 12 | 0.2s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 12 | 1.22s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 12 | 0.25s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 12 | 1.82s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 12 | 2.21s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 12 | 8.48s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 12 | 20.14s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 11 | 8.67s |
| research_a | `research.q161y_axis_orbit` | native | ✅ pass | 10 | 1.37s |
| research_a | `research.q161z_uniform_face_source` | conditional | ✅ pass | 8 | 2.01s |
| research_b | `research.q161aa_face_readout_gram` | conditional | ✅ pass | 7 | 2.26s |
| research_c | `research.q161ac_face_source_channel` | conditional | ✅ pass | 6 | 2.11s |
| research_d | `research.q161ae_face_dual_spectrum` | conditional | ✅ pass | 5 | 14.47s |
| research_a | `research.q161af_native_face_projector` | conditional | ✅ pass | 4 | 19.08s |
| research_b | `research.q161al_edge_hidden_hodge` | native | ✅ pass | 2 | 1.19s |
| research_c | `research.q161am_joint_face_edge` | conditional | ❌ assertion_failed | 0 | 1.19s |

## Archive sweep

Executed at least once: **457/457** research scripts. Latest status: assertion_failed 2, missing_file 23, pass 429, timeout 3.
This run: 145 executed (assertion_failed 2, missing_file 4, pass 138, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-11-15_q153_full_physical_stability/Q153_FULL_NATIVE_TRANSVERSE_HESSIAN.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

