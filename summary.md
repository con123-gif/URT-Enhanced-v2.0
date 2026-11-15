# Cathedral orchestrator — ✅ PASS

2026-11-15T14:38:52Z · [run 43723583616](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43723583616) · `2c4f8ad` · push on `newtons-cathedral` · checkpoint #154

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 154 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 154 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 154 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 154 | 12.53s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 154 | 5.42s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 154 | 0.23s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 154 | 6.25s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 154 | 6.07s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 154 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 154 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 151 | 14.89s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 154 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 154 | 0.99s |
| native | `native.output_gate` | native | ✅ pass | 154 | 0.07s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 154 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 154 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 154 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 154 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 148 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 127 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 127 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 147 | 0.89s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 146 | 34.88s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 145 | 3.73s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 143 | 5.55s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 141 | 11.32s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 140 | 1.4s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 140 | 3.79s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 136 | 23.87s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 136 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 136 | 0.47s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 136 | 0.43s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 136 | 0.36s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 136 | 2.2s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 135 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 134 | 23.97s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 133 | 2.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 132 | 0.43s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 131 | 1.07s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 131 | 1.93s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 131 | 4.01s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 131 | 14.74s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 130 | 0.43s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 130 | 43.43s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 130 | 1.88s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 129 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 129 | 0.47s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 128 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 126 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 125 | 87.67s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 124 | 1.29s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 123 | 1.42s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 122 | 2.79s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 120 | 96.32s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 119 | 194.39s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 118 | 25.95s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 117 | 5.38s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 113 | 118.72s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 116 | 11.18s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 114 | 35.36s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 112 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 111 | 2.36s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 110 | 3.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 109 | 1.07s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 108 | 2.15s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 107 | 1.42s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 106 | 1.54s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 105 | 1.43s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 103 | 5.52s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 101 | 2.08s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 92 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 91 | 0.43s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 91 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 90 | 0.39s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 90 | 0.4s |
| research | `research.q59_time_generator` | native | ✅ pass | 88 | 0.54s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 86 | 11.59s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 85 | 43.13s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 83 | 12.55s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 82 | 16.05s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 77 | 20.57s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 71 | 13.29s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 65 | 43.38s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 61 | 20.33s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 59 | 20.94s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 89 | 0.56s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 88 | 0.86s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 98 | 5.64s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 97 | 1.88s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 96 | 0.78s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 95 | 1.98s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 94 | 0.63s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 93 | 4.48s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 92 | 0.55s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 80 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 79 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 78 | 0.31s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 78 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 78 | 0.24s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 77 | 1.34s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 76 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 76 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 76 | 17.81s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 76 | 0.26s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 76 | 0.33s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 74 | 0.69s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 73 | 0.54s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 72 | 0.91s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 70 | 2.33s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 68 | 0.67s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 66 | 2.82s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 64 | 8.82s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 62 | 0.75s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 58 | 11.8s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 57 | 20.27s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 56 | 4.27s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 56 | 2.73s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 51 | 30.34s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 46 | 24.75s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 35 | 21.73s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 56 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 56 | 113.02s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 54 | 0.3s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 52 | 0.39s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 50 | 1.07s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 49 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 48 | 1.01s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 47 | 0.39s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 45 | 0.65s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 43 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 43 | 1.82s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 43 | 7.42s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 43 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 42 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 42 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 41 | 0.72s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 41 | 0.21s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 40 | 6.21s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 39 | 1.5s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 36 | 24.49s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 36 | 25.4s |
| research | `research.q102_born_current` | conditional | ✅ pass | 36 | 24.5s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 36 | 24.82s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 34 | 32.73s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 33 | 2.92s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 33 | 27.09s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 32 | 27.17s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 31 | 27.75s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 28 | 29.52s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 28 | 47.6s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 29 | 30.05s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 28 | 69.41s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 28 | 43.6s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 27 | 0.34s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 24 | 43.83s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 25 | 1.82s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 23 | 0.88s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 17 | 71.7s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 20 | 0.59s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 19 | 0.67s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 19 | 38.13s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 18 | 0.45s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 17 | 0.45s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 17 | 0.28s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 15 | 44.29s |
| research | `research.q104_clock_transport` | native | ✅ pass | 13 | 33.7s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 10 | 2.33s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 12 | 38.93s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 9 | 0.05s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 8 | 0.27s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 6 | 0.25s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 5 | 0.19s |

## Archive sweep

Executed at least once: **429/429** research scripts. Latest status: missing_file 23, pass 403, timeout 3.
This run: 37 executed (pass 35, timeout 2).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

