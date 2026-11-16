# Cathedral orchestrator — ✅ PASS

2026-11-16T11:43:44Z · [run 43856980492](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43856980492) · `bf9f617` · push on `newtons-cathedral` · checkpoint #172

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 172 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 172 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 172 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 172 | 19.92s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 172 | 7.18s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 172 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 172 | 4.71s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 172 | 4.64s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 172 | 0.44s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 172 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 169 | 11.41s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 172 | 0.62s |
| native | `native.wilson_source` | native | ✅ pass | 172 | 1.77s |
| native | `native.output_gate` | native | ✅ pass | 172 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 172 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 172 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 172 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 172 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 166 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 145 | 0.25s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 145 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 165 | 0.92s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 164 | 41.66s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 163 | 4.43s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 161 | 6.58s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 159 | 13.64s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 158 | 1.66s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 158 | 4.52s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 154 | 28.47s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 154 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 154 | 0.58s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 154 | 0.53s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 154 | 0.45s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 154 | 2.63s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 153 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 152 | 28.1s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 151 | 3.34s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 150 | 0.57s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 149 | 1.52s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 149 | 1.97s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 149 | 4.8s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 149 | 17.7s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 148 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 148 | 51.83s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 148 | 2.26s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 147 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 147 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 146 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 144 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 143 | 87.27s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 142 | 1.5s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 141 | 1.66s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 140 | 3.4s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 138 | 95.35s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 137 | 192.3s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 136 | 31.43s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 135 | 6.87s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 131 | 110.7s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 134 | 14.39s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 132 | 45.92s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 130 | 0.28s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 129 | 2.87s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 128 | 4.12s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 127 | 1.24s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 126 | 2.65s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 125 | 1.74s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 124 | 1.92s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 123 | 1.72s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 121 | 6.7s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 119 | 2.44s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 110 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 109 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 109 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 108 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 108 | 0.46s |
| research | `research.q59_time_generator` | native | ✅ pass | 106 | 0.66s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 104 | 13.92s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 103 | 51.19s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 101 | 14.67s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 100 | 18.63s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 95 | 24.21s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 89 | 15.57s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 83 | 52.88s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 79 | 25.04s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 77 | 25.64s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 107 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 106 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 116 | 5.5s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 115 | 1.95s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 114 | 0.88s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 113 | 2.39s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 112 | 0.7s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 111 | 5.55s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 110 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 98 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 97 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 96 | 0.38s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 96 | 0.29s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 96 | 0.28s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 95 | 1.59s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 94 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 94 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 94 | 19.27s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 94 | 0.31s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 94 | 0.38s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 92 | 0.82s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 91 | 0.64s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 90 | 1.09s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 88 | 2.77s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 86 | 0.76s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 84 | 3.31s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 82 | 9.07s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 80 | 0.88s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 76 | 11.9s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 75 | 20.11s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 74 | 5.33s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 74 | 3.6s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 69 | 36.45s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 64 | 30.63s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 53 | 26.96s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 74 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 74 | 125.34s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 72 | 0.35s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 70 | 0.43s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 68 | 1.15s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 67 | 0.41s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 66 | 1.12s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 65 | 0.42s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 63 | 0.73s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 61 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 61 | 2.08s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 61 | 7.37s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 61 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 60 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 60 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 59 | 0.81s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 59 | 0.24s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 58 | 6.63s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 57 | 1.83s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 54 | 24.53s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 54 | 24.94s |
| research | `research.q102_born_current` | conditional | ✅ pass | 54 | 24.85s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 54 | 24.75s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 52 | 33.61s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 51 | 3.46s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 51 | 28.17s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 50 | 27.98s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 49 | 28.31s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 46 | 30.97s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 46 | 47.29s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 47 | 31.2s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 46 | 69.72s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 46 | 53.95s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 45 | 0.42s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 42 | 53.35s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 43 | 2.09s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 41 | 1.06s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 35 | 72.76s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 38 | 0.67s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 37 | 0.75s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 37 | 37.72s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 36 | 0.54s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 35 | 0.52s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 35 | 0.34s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 33 | 54.14s |
| research | `research.q104_clock_transport` | native | ✅ pass | 31 | 44.63s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 28 | 2.65s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 30 | 38.63s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 27 | 0.06s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 26 | 0.32s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 24 | 0.29s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 23 | 0.24s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 16 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 15 | 1.83s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 13 | 0.64s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 12 | 0.69s |
| research | `research.q161h_hidden_shift` | native | ✅ pass | 9 | 0.71s |
| research | `research.q161i_hidden_second_order` | native | ✅ pass | 8 | 0.79s |
| research | `research.q161j_two_vertex_hidden` | native | ✅ pass | 7 | 2.33s |
| research | `research.q161k_native_stacked_sources` | native | ✅ pass | 6 | 1.47s |
| research | `research.q161l_axis_orbit` | conditional | ✅ pass | 4 | 19.92s |
| research | `research.q161n_parity_source` | conditional | ✅ pass | 3 | 0.18s |
| research | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 2 | 0.94s |
| research | `research.q161r_parity_source_selection` | native | ✅ pass | 1 | 0.23s |

## Archive sweep

Executed at least once: **443/443** research scripts. Latest status: missing_file 23, pass 417, timeout 3.
This run: 146 executed (missing_file 4, pass 142).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

