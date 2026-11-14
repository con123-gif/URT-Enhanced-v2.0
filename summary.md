# Cathedral orchestrator — ❌ FAIL

2026-11-14T15:45:53Z · [run 43609032198](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43609032198) · `758948d` · push on `newtons-cathedral` · checkpoint #135

**Gating failures:** `research.q117a_mixed_hidden_current`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 135 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 135 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 135 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 135 | 12.44s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 135 | 8.84s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 135 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 135 | 3.57s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 135 | 3.49s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 135 | 0.34s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 135 | 0.25s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 132 | 8.58s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 135 | 0.48s |
| native | `native.wilson_source` | native | ✅ pass | 135 | 1.7s |
| native | `native.output_gate` | native | ✅ pass | 135 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 135 | 0.6s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 135 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 135 | 0.94s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 135 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 129 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 108 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 108 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 128 | 1.08s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 127 | 56.14s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 126 | 5.87s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 124 | 8.5s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 122 | 17.9s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 121 | 1.81s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 121 | 5.13s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 117 | 36.49s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 117 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 117 | 0.69s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 117 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 117 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 117 | 3.87s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 116 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 115 | 36.53s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 114 | 4.42s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 113 | 0.66s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 112 | 1.63s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 112 | 1.68s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 112 | 5.58s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 112 | 23.71s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 111 | 0.65s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 111 | 61.58s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 111 | 2.95s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 110 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 110 | 0.6s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 109 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 107 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 106 | 67.37s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 105 | 1.78s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 104 | 1.97s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 103 | 3.91s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 101 | 86.86s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 100 | 153.55s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 99 | 37.72s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 98 | 7.98s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 94 | 94.4s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 97 | 16.32s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 95 | 53.4s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 93 | 0.32s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 92 | 3.37s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 91 | 4.98s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 90 | 1.48s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 89 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 88 | 2.02s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 87 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 86 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 84 | 8.77s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 82 | 3.08s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 73 | 0.55s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 72 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 72 | 0.63s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 71 | 0.6s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 71 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 69 | 0.84s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 67 | 18.12s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 66 | 67.61s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 64 | 19.37s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 63 | 24.16s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 58 | 31.73s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 52 | 20.47s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 46 | 69.16s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 42 | 31.25s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 40 | 32.36s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 70 | 0.97s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 69 | 1.4s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 79 | 8.33s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 78 | 2.73s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 77 | 1.1s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 76 | 3.13s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 75 | 0.89s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 74 | 7.05s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 73 | 0.93s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 61 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 60 | 0.67s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 59 | 0.52s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 59 | 0.31s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 59 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 58 | 1.97s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 57 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 57 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 57 | 26.49s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 57 | 0.33s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 57 | 0.43s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 55 | 0.95s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 54 | 0.72s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 53 | 1.26s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 51 | 3.42s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 49 | 0.94s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 47 | 4.14s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 45 | 13.07s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 43 | 1.07s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 39 | 17.69s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 38 | 30.41s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 37 | 4.17s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 37 | 2.7s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 32 | 30.22s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 27 | 38.09s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 16 | 33.69s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 37 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 37 | 99.51s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 35 | 0.39s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 33 | 0.52s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 31 | 1.51s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 30 | 0.47s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 29 | 1.44s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 28 | 0.51s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 26 | 0.92s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 24 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 24 | 2.64s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 24 | 11.21s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 24 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 23 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 23 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 22 | 1.01s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 22 | 0.3s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 21 | 9.48s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 20 | 2.39s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 17 | 37.05s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 17 | 37.93s |
| research | `research.q102_born_current` | conditional | ✅ pass | 17 | 37.09s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 17 | 37.22s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 15 | 50.26s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 14 | 4.5s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 14 | 41.47s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 13 | 41.62s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 12 | 42.12s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 9 | 45.04s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 9 | 34.88s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 10 | 46.66s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 9 | 53.23s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 9 | 69.79s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 8 | 0.47s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 5 | 69.73s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 6 | 2.73s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 4 | 1.27s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ❌ assertion_failed | 0 | 55.06s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 1 | 0.84s |

## Archive sweep

Executed at least once: **407/407** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 383.
This run: 84 executed (missing_file 1, pass 83).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

