# Cathedral orchestrator — ✅ PASS

2026-11-14T16:48:23Z · [run 43615495351](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43615495351) · `c8bcf3b` · push on `newtons-cathedral` · checkpoint #138

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 138 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 138 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 138 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 138 | 21.32s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 138 | 11.07s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 138 | 0.4s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 138 | 4.85s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 138 | 4.69s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 138 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 138 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 135 | 11.48s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 138 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 138 | 1.35s |
| native | `native.output_gate` | native | ✅ pass | 138 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 138 | 0.55s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 138 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 138 | 0.9s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 138 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 132 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 111 | 0.24s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 111 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 131 | 0.96s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 130 | 41.63s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 129 | 4.44s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 127 | 6.48s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 125 | 13.58s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 124 | 1.62s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 124 | 4.77s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 120 | 28.13s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 120 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 120 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 120 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 120 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 120 | 2.61s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 119 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 118 | 28.16s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 117 | 3.33s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 116 | 0.56s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 115 | 1.42s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 115 | 1.6s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 115 | 4.79s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 115 | 17.61s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 114 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 114 | 49.76s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 114 | 2.25s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 113 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 113 | 0.51s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 112 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 110 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 109 | 76.12s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 108 | 1.44s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 107 | 1.65s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 106 | 3.22s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 104 | 68.86s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 103 | 180.99s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 102 | 31.26s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 101 | 6.88s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 97 | 100.81s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 100 | 14.48s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 98 | 45.27s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 96 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 95 | 2.72s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 94 | 4.03s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 93 | 1.2s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 92 | 2.48s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 91 | 1.68s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 90 | 1.82s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 89 | 1.68s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 87 | 6.6s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 85 | 2.42s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 76 | 0.46s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 75 | 0.53s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 75 | 0.52s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 74 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 74 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 72 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 70 | 13.71s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 69 | 51.01s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 67 | 14.85s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 66 | 18.76s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 61 | 23.96s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 55 | 15.75s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 49 | 52.77s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 45 | 25.08s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 43 | 25.87s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 73 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 72 | 1.02s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 82 | 5.48s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 81 | 1.99s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 80 | 0.85s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 79 | 2.42s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 78 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 77 | 5.78s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 76 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 64 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 63 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 62 | 0.38s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 62 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 62 | 0.27s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 61 | 1.59s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 60 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 60 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 60 | 18.72s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 60 | 0.29s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 60 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 58 | 0.78s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 57 | 0.64s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 56 | 1.04s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 54 | 2.75s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 52 | 0.72s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 50 | 3.32s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 48 | 8.51s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 46 | 0.85s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 42 | 11.92s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 41 | 19.63s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 40 | 4.68s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 40 | 3.1s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 35 | 30.58s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 30 | 30.22s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 19 | 26.63s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 40 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 40 | 109.45s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 38 | 0.32s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 36 | 0.41s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 34 | 1.12s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 33 | 0.38s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 32 | 1.13s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 31 | 0.4s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 29 | 0.7s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 27 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 27 | 2.07s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 27 | 7.16s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 27 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 26 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 26 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 25 | 0.79s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 25 | 0.24s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 24 | 6.48s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 23 | 1.9s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 20 | 23.9s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 20 | 24.31s |
| research | `research.q102_born_current` | conditional | ✅ pass | 20 | 24.11s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 20 | 24.39s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 18 | 33.63s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 17 | 3.46s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 17 | 27.63s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 16 | 27.67s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 15 | 28.16s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 12 | 30.85s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 12 | 44.24s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 13 | 31.12s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 12 | 59.4s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 12 | 54.08s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 11 | 0.43s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 8 | 53.13s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 9 | 2.11s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 7 | 1.09s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 1 | 61.15s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 4 | 0.66s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 3 | 0.76s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 3 | 32.63s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 2 | 0.54s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 1 | 0.53s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 1 | 0.33s |

**Changed since last run:** `research.q117a_mixed_hidden_current` assertion_failed → pass

## Archive sweep

Executed at least once: **412/412** research scripts. Latest status: missing_file 23, pass 388, timeout 1.
This run: 222 executed (missing_file 5, pass 217).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

