# Cathedral orchestrator — ✅ PASS

2026-11-16T01:43:50Z · [run 43785086038](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43785086038) · `e54a661` · push on `newtons-cathedral` · checkpoint #166

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 166 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 166 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 166 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 166 | 16.72s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 166 | 5.47s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 166 | 0.23s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 166 | 4.7s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 166 | 4.6s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 166 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 166 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 163 | 11.37s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 166 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 166 | 1.25s |
| native | `native.output_gate` | native | ✅ pass | 166 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 166 | 0.55s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 166 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 166 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 166 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 160 | 0.14s |
| research | `research.missing_intermediates` | independent | ✅ pass | 139 | 0.31s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 139 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 159 | 1.14s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 158 | 53.82s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 157 | 5.75s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 155 | 8.39s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 153 | 17.73s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 152 | 1.84s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 152 | 5.25s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 148 | 36.41s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 148 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 148 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 148 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 148 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 148 | 3.96s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 147 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 146 | 36.32s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 145 | 4.52s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 144 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 143 | 1.63s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 143 | 1.59s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 143 | 5.67s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 143 | 22.88s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 142 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 142 | 62.18s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 142 | 2.88s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 141 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 141 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 140 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 138 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 137 | 75.08s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 136 | 1.82s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 135 | 2.03s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 134 | 3.98s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 132 | 67.93s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 131 | 177.45s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 130 | 38.34s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 129 | 8.05s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 125 | 98.27s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 128 | 16.48s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 126 | 53.53s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 124 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 123 | 3.37s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 122 | 4.97s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 121 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 120 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 119 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 118 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 117 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 115 | 8.9s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 113 | 3.11s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 104 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 103 | 0.67s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 103 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 102 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 102 | 0.62s |
| research | `research.q59_time_generator` | native | ✅ pass | 100 | 0.83s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 98 | 18.2s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 97 | 66.69s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 95 | 18.94s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 94 | 23.79s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 89 | 31.29s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 83 | 20.1s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 77 | 69.22s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 73 | 31.16s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 71 | 31.98s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 101 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 100 | 1.42s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 110 | 8.49s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 109 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 108 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 107 | 3.1s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 106 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 105 | 6.99s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 104 | 0.99s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 92 | 0.02s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 91 | 0.67s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 90 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 90 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 90 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 89 | 2.05s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 88 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 88 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 88 | 27.03s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 88 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 88 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 86 | 0.99s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 85 | 0.75s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 84 | 1.34s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 82 | 3.58s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 80 | 0.99s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 78 | 4.33s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 76 | 12.94s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 74 | 1.15s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 70 | 18.41s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 69 | 30.62s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 68 | 3.57s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 68 | 2.31s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 63 | 24.18s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 58 | 40.88s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 47 | 33.41s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 68 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 68 | 84.83s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 66 | 0.42s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 64 | 0.54s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 62 | 1.58s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 61 | 0.5s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 60 | 1.52s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 59 | 0.55s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 57 | 0.94s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 55 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 55 | 2.7s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 55 | 11.63s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 55 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 54 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 54 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 53 | 1.06s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 53 | 0.29s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 52 | 9.6s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 51 | 2.39s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 48 | 38.28s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 48 | 38.5s |
| research | `research.q102_born_current` | conditional | ✅ pass | 48 | 38.14s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 48 | 38.37s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 46 | 50.77s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 45 | 4.93s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 45 | 42.12s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 44 | 42.71s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 43 | 43.27s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 40 | 45.5s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 40 | 43.05s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 41 | 46.92s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 40 | 57.49s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 40 | 69.87s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 39 | 0.48s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 36 | 70.27s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 37 | 2.8s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 35 | 1.34s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 29 | 59.4s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 32 | 0.84s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 31 | 0.97s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 31 | 31.89s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 30 | 0.66s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 29 | 0.69s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 29 | 0.41s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 27 | 71.39s |
| research | `research.q104_clock_transport` | native | ✅ pass | 25 | 52.64s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 22 | 3.42s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 24 | 32.77s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 21 | 0.07s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 20 | 0.37s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 18 | 0.34s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 17 | 0.28s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 10 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 9 | 2.33s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 7 | 0.75s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 6 | 0.75s |
| research | `research.q161h_hidden_shift` | native | ✅ pass | 3 | 0.79s |
| research | `research.q161i_hidden_second_order` | native | ✅ pass | 2 | 0.95s |
| research | `research.q161j_two_vertex_hidden` | native | ✅ pass | 1 | 2.87s |

## Archive sweep

Executed at least once: **438/438** research scripts. Latest status: missing_file 23, pass 412, timeout 3.
This run: 98 executed (missing_file 1, pass 96, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

