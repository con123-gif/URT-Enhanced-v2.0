# Cathedral orchestrator — ✅ PASS

2026-11-15T13:29:48Z · [run 43717521538](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43717521538) · `851366d` · push on `newtons-cathedral` · checkpoint #151

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 151 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 151 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 151 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 151 | 16.69s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 151 | 7.02s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 151 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 151 | 4.78s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 151 | 4.57s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 151 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 151 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 148 | 11.52s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 151 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 151 | 1.61s |
| native | `native.output_gate` | native | ✅ pass | 151 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 151 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 151 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 151 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 151 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 145 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 124 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 124 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 144 | 0.89s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 143 | 35.99s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 142 | 3.72s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 140 | 5.56s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 138 | 11.27s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 137 | 1.29s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 137 | 3.65s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 133 | 23.95s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 133 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 133 | 0.46s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 133 | 0.42s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 133 | 0.34s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 133 | 2.18s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 132 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 131 | 23.85s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 130 | 2.62s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 129 | 0.43s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 128 | 1.08s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 128 | 1.87s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 128 | 3.91s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 128 | 14.8s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 127 | 0.43s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 127 | 43.18s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 127 | 1.86s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 126 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 126 | 0.46s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 125 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 123 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 122 | 88.5s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 121 | 1.26s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 120 | 1.39s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 119 | 2.75s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 117 | 95.59s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 116 | 194.75s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 115 | 25.74s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 114 | 5.33s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 110 | 115.48s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 113 | 11.11s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 111 | 35.49s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 109 | 0.22s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 108 | 2.35s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 107 | 3.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 106 | 1.07s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 105 | 2.16s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 104 | 1.43s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 103 | 1.54s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 102 | 1.42s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 100 | 5.56s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 98 | 2.07s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 89 | 0.36s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 88 | 0.41s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 88 | 0.41s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 87 | 0.36s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 87 | 0.38s |
| research | `research.q59_time_generator` | native | ✅ pass | 85 | 0.52s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 83 | 11.59s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 82 | 43.57s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 80 | 12.47s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 79 | 15.88s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 74 | 20.61s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 68 | 13.13s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 62 | 43.3s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 58 | 20.34s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 56 | 20.9s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 86 | 0.56s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 85 | 0.85s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 95 | 5.59s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 94 | 1.87s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 93 | 0.78s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 92 | 1.96s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 91 | 0.63s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 90 | 4.48s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 89 | 0.54s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 77 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 76 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 75 | 0.31s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 75 | 0.24s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 75 | 0.24s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 74 | 1.32s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 73 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 73 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 73 | 17.88s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 73 | 0.25s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 73 | 0.32s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 71 | 0.66s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 70 | 0.52s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 69 | 0.89s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 67 | 2.29s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 65 | 0.65s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 63 | 2.8s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 61 | 8.8s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 59 | 0.73s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 55 | 12.06s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 54 | 20.35s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 53 | 3.92s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 53 | 2.62s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 48 | 25.94s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 43 | 24.9s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 32 | 21.64s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 53 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 53 | 91.51s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 51 | 0.29s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 49 | 0.38s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 47 | 1.05s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 46 | 0.35s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 45 | 1.0s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 44 | 0.38s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 42 | 0.64s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 40 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 40 | 1.79s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 40 | 7.43s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 40 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 39 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 39 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 38 | 0.71s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 38 | 0.2s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 37 | 6.28s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 36 | 1.5s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 33 | 24.26s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 33 | 24.74s |
| research | `research.q102_born_current` | conditional | ✅ pass | 33 | 24.32s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 33 | 24.63s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 31 | 33.13s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 30 | 2.89s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 30 | 27.0s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 29 | 27.16s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 28 | 27.54s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 25 | 29.06s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 25 | 47.77s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 26 | 29.97s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 25 | 70.45s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 25 | 43.59s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 24 | 0.33s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 21 | 43.62s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 22 | 1.82s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 20 | 0.87s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 14 | 73.06s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 17 | 0.58s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 16 | 0.67s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 16 | 38.15s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 15 | 0.45s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 14 | 0.45s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 14 | 0.28s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 12 | 44.25s |
| research | `research.q104_clock_transport` | native | ✅ pass | 10 | 33.9s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 7 | 2.32s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 9 | 38.98s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 6 | 0.05s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 5 | 0.27s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 3 | 0.25s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 2 | 0.19s |

## Archive sweep

Executed at least once: **424/424** research scripts. Latest status: missing_file 23, pass 399, timeout 2.
This run: 35 executed (pass 34, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

