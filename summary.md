# Cathedral orchestrator — ✅ PASS

2026-11-15T10:57:20Z · [run 43704225218](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43704225218) · `a5ddb1f` · push on `newtons-cathedral` · checkpoint #147

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 147 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 147 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 147 | 0.16s |
| tests | `tests.suite` | regression | ✅ pass | 147 | 14.47s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 147 | 6.73s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 147 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 147 | 4.65s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 147 | 4.69s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 147 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 147 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 144 | 11.33s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 147 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 147 | 1.57s |
| native | `native.output_gate` | native | ✅ pass | 147 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 147 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 147 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 147 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 147 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 141 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 120 | 0.31s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 120 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 140 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 139 | 53.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 138 | 5.74s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 136 | 8.33s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 134 | 17.46s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 133 | 1.84s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 133 | 5.27s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 129 | 36.7s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 129 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 129 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 129 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 129 | 0.56s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 129 | 3.87s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 128 | 0.25s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 127 | 36.3s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 126 | 4.42s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 125 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 124 | 1.64s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 124 | 1.53s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 124 | 5.72s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 124 | 23.04s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 123 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 123 | 62.03s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 123 | 2.94s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 122 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 122 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 121 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 119 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 118 | 67.42s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 117 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 116 | 2.04s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 115 | 4.0s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 113 | 86.11s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 112 | 153.39s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 111 | 38.1s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 110 | 8.07s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 106 | 89.59s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 109 | 16.45s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 107 | 53.73s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 105 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 104 | 3.4s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 103 | 4.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 102 | 1.52s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 101 | 3.11s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 100 | 2.05s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 99 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 98 | 2.06s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 96 | 8.84s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 94 | 3.12s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 85 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 84 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 84 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 83 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 83 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 81 | 0.83s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 79 | 17.71s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 78 | 66.26s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 76 | 18.97s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 75 | 23.85s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 70 | 31.1s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 64 | 20.24s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 58 | 69.76s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 54 | 31.28s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 52 | 32.16s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 82 | 0.97s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 81 | 1.43s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 91 | 8.61s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 90 | 2.83s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 89 | 1.17s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 88 | 3.11s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 87 | 0.94s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 86 | 6.98s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 85 | 0.94s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 73 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 72 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 71 | 0.49s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 71 | 0.35s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 71 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 70 | 2.02s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 69 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 69 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 69 | 27.2s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 69 | 0.36s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 69 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 67 | 1.0s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 66 | 0.78s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 65 | 1.35s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 63 | 3.5s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 61 | 0.96s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 59 | 4.23s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 57 | 13.45s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 55 | 1.13s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 51 | 18.61s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 50 | 30.73s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 49 | 4.28s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 49 | 2.72s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 44 | 30.02s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 39 | 38.17s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 28 | 33.38s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 49 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 49 | 101.48s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 47 | 0.41s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 45 | 0.56s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 43 | 1.61s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 42 | 0.52s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 41 | 1.51s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 40 | 0.57s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 38 | 0.97s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 36 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 36 | 2.8s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 36 | 11.42s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 36 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 35 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 35 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 34 | 1.09s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 34 | 0.31s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 33 | 9.88s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 32 | 2.36s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 29 | 37.76s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 29 | 38.5s |
| research | `research.q102_born_current` | conditional | ✅ pass | 29 | 38.1s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 29 | 37.82s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 27 | 51.27s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 26 | 4.42s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 26 | 42.24s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 25 | 42.36s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 24 | 42.9s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 21 | 45.88s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 21 | 34.71s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 22 | 46.8s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 21 | 53.01s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 21 | 69.88s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 20 | 0.49s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 17 | 69.61s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 18 | 2.82s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 16 | 1.33s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 10 | 55.65s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 13 | 0.86s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 12 | 0.99s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 12 | 23.66s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 11 | 0.7s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 10 | 0.7s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 10 | 0.42s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 8 | 70.98s |
| research | `research.q104_clock_transport` | native | ✅ pass | 6 | 52.75s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 3 | 3.39s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 5 | 24.31s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 2 | 0.07s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 1 | 0.39s |

## Archive sweep

Executed at least once: **418/418** research scripts. Latest status: missing_file 23, pass 395.
This run: 139 executed (missing_file 5, pass 134).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

