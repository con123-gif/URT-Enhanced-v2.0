# Cathedral orchestrator — ✅ PASS

2026-11-16T21:34:39Z · [run 43958264229](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43958264229) · `116fe63` · push on `newtons-cathedral` · checkpoint #179

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 179 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 179 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 179 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 179 | 16.53s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 179 | 10.74s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 179 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 179 | 5.21s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 179 | 4.65s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 179 | 0.43s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 179 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 176 | 11.62s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 179 | 0.61s |
| native | `native.wilson_source` | native | ✅ pass | 179 | 1.63s |
| native | `native.output_gate` | native | ✅ pass | 179 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 179 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 179 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 179 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 179 | 0.25s |
| research_a | `research.sandbox_bound_scripts` | independent | ✅ pass | 2 | 0.08s |
| research_b | `research.missing_intermediates` | independent | ✅ pass | 2 | 0.25s |
| research_c | `research.q6_repair_structural_regression` | regression | ✅ pass | 2 | 0.03s |
| research_d | `research.independent_native_five_k2` | independent | ✅ pass | 2 | 1.13s |
| research_a | `research.unsigned_axis_order_k2` | independent | ✅ pass | 2 | 29.47s |
| research_b | `research.signed_a5_covariance` | independent | ✅ pass | 2 | 4.54s |
| research_c | `research.signed_dictionary_classes` | native | ✅ pass | 2 | 8.55s |
| research_d | `research.native_signed_dictionary_k3` | native | ✅ pass | 2 | 13.85s |
| research_a | `research.induced_photon_logdet_kernel` | native | ✅ pass | 2 | 1.03s |
| research_b | `research.induced_photon_vacuum_selection` | native | ✅ pass | 2 | 4.4s |
| research_c | `research.native_signed_dictionary_k23` | native | ✅ pass | 2 | 36.73s |
| research_d | `research.icosahedral_induced_photon` | independent | ✅ pass | 2 | 0.19s |
| research_a | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 2 | 0.51s |
| research_b | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 2 | 0.52s |
| research_c | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 2 | 0.59s |
| research_d | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 2 | 2.68s |
| research_a | `research.platonic_hidden_sector_link` | independent | ✅ pass | 2 | 0.14s |
| research_b | `research.q15_native_namespace_repair` | native | ✅ pass | 2 | 28.02s |
| research_c | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 2 | 4.59s |
| research_d | `research.hidden_parity_delta_selection` | native | ✅ pass | 2 | 0.57s |
| research_a | `research.q4_native_matter_map` | native | ✅ pass | 2 | 0.92s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 156 | 1.44s |
| research_b | `research.registry_maxwell_test` | conditional | ✅ pass | 2 | 4.81s |
| research_c | `research.native_signed_dictionary_k4` | native | ✅ pass | 2 | 23.5s |
| research_d | `research.q23_photon_gauge_typing` | native | ✅ pass | 2 | 0.58s |
| research_a | `research.q3_twirled_chronology_classes` | native | ✅ pass | 2 | 37.56s |
| research_b | `research.q7_review_q6_cumulants` | independent | ✅ pass | 2 | 2.27s |
| research_c | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 2 | 0.21s |
| research_d | `research.q25_4d_a5_photon` | native | ✅ pass | 2 | 0.53s |
| research_a | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 2 | 0.06s |
| research_b | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 2 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 150 | 56.72s |
| research_c | `research.q27_twirled_orientation` | native | ✅ pass | 2 | 1.82s |
| research_d | `research.q28_twirled_third_trace` | native | ✅ pass | 2 | 1.86s |
| research_a | `research.q29_twirled_fourth_trace` | native | ✅ pass | 2 | 2.45s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 145 | 64.42s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 144 | 137.63s |
| research_b | `research.q33_singular_spectrum` | native | ✅ pass | 2 | 31.36s |
| research_c | `research.q34_seventh_mixed_words` | native | ✅ pass | 2 | 8.12s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 138 | 76.58s |
| research_d | `research.q35_eighth_mixed_words` | native | ✅ pass | 2 | 14.72s |
| research_a | `research.q32_mixed_trace_meaning` | native | ✅ pass | 2 | 30.07s |
| research_b | `research.q37_primitive_q2_trace` | native | ✅ pass | 2 | 0.27s |
| research_c | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 2 | 3.39s |
| research_d | `research.q39_eight_image_q2` | native | ✅ pass | 2 | 4.94s |
| research_a | `research.q40_cross_orbit_q2` | independent | ✅ pass | 2 | 0.9s |
| research_b | `research.q40_review_operator_equality` | independent | ✅ pass | 2 | 2.75s |
| research_c | `research.q42_middle_flip_orbitals` | native | ✅ pass | 2 | 2.07s |
| research_d | `research.q43_native_character_criterion` | native | ✅ pass | 2 | 2.02s |
| research_a | `research.q44_middle_flip_symmetry` | native | ✅ pass | 2 | 1.23s |
| research_b | `research.q45_zero_coset_orders` | native | ✅ pass | 2 | 6.83s |
| research_c | `research.q46_rotation_mechanism` | native | ✅ pass | 2 | 3.13s |
| research_d | `research.q52_native_source_unitary` | native | ✅ pass | 2 | 0.46s |
| research_a | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 2 | 0.39s |
| research_b | `research.q56_full_stationary_current` | native | ✅ pass | 2 | 0.52s |
| research_c | `research.q58_native_coupling_curvature` | native | ✅ pass | 2 | 0.61s |
| research_d | `research.q57_native_clock_geometry` | native | ✅ pass | 2 | 0.48s |
| research_a | `research.q59_time_generator` | native | ✅ pass | 2 | 0.46s |
| research_b | `research.q61_inverse_limit_lifts` | native | ✅ pass | 2 | 14.22s |
| research_c | `research.q62_lift_carrier` | native | ✅ pass | 2 | 67.02s |
| research_d | `research.q64_conditioned_selection` | conditional | ✅ pass | 2 | 15.1s |
| research_a | `research.q65_horizon_selection` | conditional | ✅ pass | 2 | 13.18s |
| research_b | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 2 | 24.1s |
| research_c | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 2 | 20.52s |
| research_d | `research.q77_exact_clock_split` | conditional | ✅ pass | 2 | 53.23s |
| research_a | `research.q82_oriented_source_weights` | conditional | ✅ pass | 2 | 17.06s |
| research_b | `research.q85_chronology_coefficient` | conditional | ✅ pass | 2 | 25.99s |
| research_c | `research.q55_hopf_wilson_ward` | native | ✅ pass | 2 | 0.98s |
| research_d | `research.q60_hopf_h64_frame` | native | ✅ pass | 2 | 0.99s |
| research_a | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 2 | 4.49s |
| research_b | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 2 | 2.07s |
| research_c | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 2 | 1.15s |
| research_d | `research.q49_native_ward_history_map` | native | ✅ pass | 2 | 2.41s |
| research_a | `research.q50_uniform_history_gauge` | native | ✅ pass | 2 | 0.52s |
| research_b | `research.q53_v61_internal_symmetry` | native | ✅ pass | 2 | 5.44s |
| research_c | `research.hopf_charged_carrier` | conditional | ✅ pass | 2 | 0.97s |
| research_d | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 2 | 0.01s |
| research_a | `research.q70_native_clock_fixed_space` | native | ✅ pass | 2 | 0.35s |
| research_b | `research.q68_native_bridge_polytope` | native | ✅ pass | 2 | 0.38s |
| research_c | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 2 | 0.34s |
| research_d | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 2 | 0.27s |
| research_a | `research.q71_q2_clock_mixing` | native | ✅ pass | 2 | 1.1s |
| research_b | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 2 | 0.02s |
| research_c | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 2 | 0.02s |
| research_d | `research.q60_native_coordinate_selection` | native | ✅ pass | 2 | 18.85s |
| research_a | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 2 | 0.2s |
| research_b | `research.cross_archive_photon_join` | conditional | ✅ pass | 2 | 0.38s |
| research_c | `research.q71_native_q3_clock` | native | ✅ pass | 2 | 1.0s |
| research_d | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 2 | 0.62s |
| research_a | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 2 | 0.75s |
| research_b | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 2 | 2.78s |
| research_c | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 2 | 0.97s |
| research_d | `research.q80_native_hidden_source_selection` | native | ✅ pass | 2 | 3.38s |
| research_a | `research.q81_native_all_five_source_radical` | native | ✅ pass | 2 | 6.98s |
| research_b | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 2 | 0.89s |
| research_c | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 2 | 18.06s |
| research_d | `research.q90_exact_native_fourier` | native | ✅ pass | 2 | 19.44s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 81 | 5.42s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 81 | 3.64s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 76 | 37.16s |
| research_a | `research.q91_bridge_loss_sequence` | native | ✅ pass | 2 | 20.81s |
| research_b | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 2 | 27.89s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 81 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 81 | 126.22s |
| research_c | `research.q87_coefficient_elimination` | conditional | ✅ pass | 2 | 0.41s |
| research_d | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 2 | 0.42s |
| research_a | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 2 | 0.83s |
| research_b | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 2 | 0.39s |
| research_c | `research.q87e_native_parity_energy` | conditional | ✅ pass | 2 | 1.49s |
| research_d | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 2 | 0.42s |
| research_a | `research.q87g_native_second_moment` | conditional | ✅ pass | 2 | 0.54s |
| research_b | `research.q93_primitive_clock_trace` | native | ✅ pass | 2 | 0.03s |
| research_c | `research.q94_native_hidden_clock` | native | ✅ pass | 2 | 2.74s |
| research_d | `research.q95_source_carrier_exact` | native | ✅ pass | 2 | 7.21s |
| research_a | `research.q95_full_five_numeric` | native | ✅ pass | 2 | 0.06s |
| research_b | `research.q96_original_action_mismatch` | native | ✅ pass | 2 | 0.07s |
| research_c | `research.q96_original_source_chebyshev` | independent | ✅ pass | 2 | 0.06s |
| research_d | `research.q97_face_locality_exact` | native | ✅ pass | 2 | 0.79s |
| research_a | `research.q97_five_solid_locality` | native | ✅ pass | 2 | 0.21s |
| research_b | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 2 | 6.49s |
| research_c | `research.q99_native_parity_rigidity` | native | ✅ pass | 2 | 2.47s |
| research_d | `research.q101_moving_arf` | conditional | ✅ pass | 2 | 23.92s |
| research_a | `research.q101_magnetic_factor` | conditional | ✅ pass | 2 | 19.69s |
| research_b | `research.q102_born_current` | conditional | ✅ pass | 2 | 24.3s |
| research_c | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 2 | 38.97s |
| research_d | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 2 | 32.64s |
| research_a | `research.q106_exact_charged_berry` | native | ✅ pass | 2 | 2.53s |
| research_b | `research.q106_joined_native_wilson` | conditional | ✅ pass | 2 | 27.48s |
| research_c | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 2 | 42.4s |
| research_d | `research.q108_native_born_fisher` | conditional | ✅ pass | 2 | 27.9s |
| research_a | `research.q109_full_joined_gauge` | conditional | ✅ pass | 2 | 23.75s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 53 | 33.01s |
| research_b | `research.q111_charge_bundle_period` | conditional | ✅ pass | 2 | 31.17s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 53 | 44.08s |
| research_c | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 2 | 71.03s |
| research_d | `research.q114_hidden_distance` | native | ✅ pass | 2 | 0.39s |
| research_a | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 2 | 38.12s |
| research_b | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 2 | 2.05s |
| research_c | `research.q118_native_complement_spectrum` | native | ✅ pass | 2 | 1.33s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 42 | 45.56s |
| research_d | `research.q119_native_contact_scale` | native | ✅ pass | 2 | 0.61s |
| research_a | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 2 | 0.53s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 44 | 24.35s |
| research_b | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 2 | 0.52s |
| research_c | `research.q124_native_charged_barrier` | conditional | ✅ pass | 2 | 0.7s |
| research_d | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 2 | 0.32s |
| research_a | `research.q118b_quartet_multiplicity` | native | ✅ pass | 2 | 38.67s |
| research_b | `research.q104_clock_transport` | native | ✅ pass | 2 | 44.51s |
| research_c | `research.q127_unitary_connection` | native | ✅ pass | 2 | 4.52s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 37 | 25.01s |
| research_d | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 2 | 0.05s |
| research_a | `research.q139_q146_context_recovery` | independent | ✅ pass | 2 | 0.21s |
| research_b | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 2 | 0.28s |
| research_c | `research.q149_original_528_flux` | native | ✅ pass | 2 | 0.29s |
| research_d | `research.q160_native_gap_robustness` | conditional | ✅ pass | 2 | 0.02s |
| research_a | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 2 | 1.22s |
| research_b | `research.q161e_native_hidden_rank` | native | ✅ pass | 2 | 0.61s |
| research_c | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 2 | 0.78s |
| research_d | `research.q161h_hidden_shift` | native | ✅ pass | 2 | 0.61s |
| research_a | `research.q161i_hidden_second_order` | native | ✅ pass | 2 | 0.53s |
| research_b | `research.q161j_two_vertex_hidden` | native | ✅ pass | 2 | 2.26s |
| research_c | `research.q161k_native_stacked_sources` | native | ✅ pass | 2 | 1.79s |
| research_d | `research.q161l_axis_orbit` | conditional | ✅ pass | 2 | 21.26s |
| research_a | `research.q161n_parity_source` | conditional | ✅ pass | 2 | 0.12s |
| research_b | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 2 | 0.91s |
| research_c | `research.q161r_parity_source_selection` | native | ✅ pass | 2 | 0.3s |
| research_d | `research.q161t_native_face_source` | conditional | ✅ pass | 2 | 1.81s |
| research_a | `research.q161u_native_face_gram` | conditional | ✅ pass | 2 | 1.32s |
| research_b | `research.q161v_six_axis_face` | conditional | ✅ pass | 2 | 6.23s |
| research_c | `research.q161w_axis_subsets` | conditional | ✅ pass | 2 | 23.6s |
| research_d | `research.q161x_axis_geometry` | conditional | ✅ pass | 1 | 8.82s |

## Archive sweep

Executed at least once: **449/449** research scripts. Latest status: missing_file 23, pass 423, timeout 3.
This run: 195 executed (missing_file 18, pass 175, timeout 2).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

