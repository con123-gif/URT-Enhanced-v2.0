# Cathedral orchestrator — ✅ PASS

2026-11-15T15:19:40Z · [run 43726064369](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43726064369) · `8cfd547` · push on `newtons-cathedral` · checkpoint #156

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 156 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 156 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 156 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 156 | 12.66s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 156 | 6.09s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 156 | 0.28s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 156 | 4.8s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 156 | 4.67s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 156 | 0.45s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 156 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 153 | 11.52s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 156 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 156 | 1.45s |
| native | `native.output_gate` | native | ✅ pass | 156 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 156 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 156 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 156 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 156 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 150 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 129 | 0.25s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 129 | 0.05s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 149 | 0.94s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 148 | 41.91s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 147 | 4.52s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 145 | 6.78s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 143 | 13.67s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 142 | 1.63s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 142 | 4.48s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 138 | 28.73s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 138 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 138 | 0.59s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 138 | 0.55s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 138 | 0.46s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 138 | 2.64s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 137 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 136 | 27.99s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 135 | 3.36s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 134 | 0.61s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 133 | 1.46s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 133 | 1.57s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 133 | 4.9s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 133 | 17.88s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 132 | 0.59s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 132 | 49.03s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 132 | 2.27s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 131 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 131 | 0.52s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 130 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 128 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 127 | 66.11s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 126 | 1.47s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 125 | 1.72s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 124 | 3.32s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 122 | 87.04s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 121 | 153.32s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 120 | 31.28s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 119 | 6.9s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 115 | 92.64s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 118 | 14.42s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 116 | 45.3s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 114 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 113 | 2.77s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 112 | 3.98s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 111 | 1.22s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 110 | 2.52s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 109 | 1.71s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 108 | 1.82s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 107 | 1.66s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 105 | 6.59s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 103 | 2.41s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 94 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 93 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 93 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 92 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 92 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 90 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 88 | 13.83s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 87 | 53.75s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 85 | 14.59s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 84 | 18.58s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 79 | 23.98s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 73 | 15.72s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 67 | 52.55s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 63 | 24.64s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 61 | 25.48s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 91 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 90 | 0.96s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 100 | 5.52s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 99 | 1.9s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 98 | 0.83s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 97 | 2.41s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 96 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 95 | 5.45s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 94 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 82 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 81 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 80 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 80 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 80 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 79 | 1.56s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 78 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 78 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 78 | 18.18s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 78 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 78 | 0.34s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 76 | 0.76s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 75 | 0.58s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 74 | 1.01s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 72 | 2.69s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 70 | 0.7s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 68 | 3.29s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 66 | 8.79s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 64 | 0.85s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 60 | 11.87s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 59 | 19.59s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 58 | 2.85s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 58 | 1.86s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 53 | 20.07s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 48 | 30.31s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 37 | 27.26s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 58 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 58 | 70.54s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 56 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 54 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 52 | 1.11s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 51 | 0.38s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 50 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 49 | 0.4s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 47 | 0.7s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 45 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 45 | 2.04s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 45 | 7.1s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 45 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 44 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 44 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 43 | 0.75s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 43 | 0.23s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 42 | 6.35s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 41 | 1.85s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 38 | 23.63s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 38 | 24.02s |
| research | `research.q102_born_current` | conditional | ✅ pass | 38 | 23.72s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 38 | 23.6s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 36 | 32.37s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 35 | 3.41s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 35 | 27.08s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 34 | 27.1s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 33 | 27.36s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 30 | 30.84s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 30 | 34.79s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 31 | 30.55s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 30 | 53.3s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 30 | 53.12s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 29 | 0.39s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 26 | 52.93s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 27 | 2.04s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 25 | 1.02s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 19 | 55.52s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 22 | 0.62s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 21 | 0.71s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 21 | 23.74s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 20 | 0.52s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 19 | 0.51s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 19 | 0.32s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 17 | 54.17s |
| research | `research.q104_clock_transport` | native | ✅ pass | 15 | 43.94s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 12 | 2.69s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 14 | 25.1s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 11 | 0.06s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 10 | 0.3s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 8 | 0.27s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 7 | 0.23s |

## Archive sweep

Executed at least once: **431/431** research scripts. Latest status: missing_file 23, pass 405, timeout 3.
This run: 280 executed (missing_file 19, pass 260, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

