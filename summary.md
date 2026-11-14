# Cathedral orchestrator — ✅ PASS

2026-11-14T11:14:29Z · [run 43587473087](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43587473087) · `589621d` · push on `newtons-cathedral` · checkpoint #127

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 127 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 127 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 127 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 127 | 12.62s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 127 | 11.06s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 127 | 0.41s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 127 | 4.46s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 127 | 4.3s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 127 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 127 | 0.3s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 124 | 10.62s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 127 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 127 | 1.01s |
| native | `native.output_gate` | native | ✅ pass | 127 | 0.07s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 127 | 0.53s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 127 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 127 | 0.82s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 127 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 121 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 100 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 100 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 120 | 0.89s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 119 | 42.57s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 118 | 4.54s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 116 | 6.59s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 114 | 13.94s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 113 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 113 | 4.43s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 109 | 28.4s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 109 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 109 | 0.56s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 109 | 0.52s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 109 | 0.43s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 109 | 2.67s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 108 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 107 | 28.24s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 106 | 3.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 105 | 0.57s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 104 | 1.38s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 104 | 1.97s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 104 | 4.73s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 104 | 18.19s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 103 | 0.53s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 103 | 53.06s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 103 | 2.31s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 102 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 102 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 101 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 99 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 98 | 87.64s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 97 | 1.49s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 96 | 1.78s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 95 | 3.4s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 93 | 95.48s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 92 | 192.63s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 91 | 31.28s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 90 | 6.96s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 86 | 114.57s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 89 | 14.44s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 87 | 46.65s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 85 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 84 | 2.89s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 83 | 4.45s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 82 | 1.31s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 81 | 2.7s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 80 | 1.8s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 79 | 1.92s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 78 | 1.79s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 76 | 6.78s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 74 | 2.53s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 65 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 64 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 64 | 0.52s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 63 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 63 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 61 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 59 | 13.98s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 58 | 51.25s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 56 | 15.16s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 55 | 18.94s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 50 | 24.31s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 44 | 15.93s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 38 | 52.97s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 34 | 25.46s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 32 | 26.22s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 62 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 61 | 0.98s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 71 | 5.57s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 70 | 1.98s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 69 | 0.85s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 68 | 2.42s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 67 | 0.69s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 66 | 5.51s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 65 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 53 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 52 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 51 | 0.42s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 51 | 0.28s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 51 | 0.28s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 50 | 1.6s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 49 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 49 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 49 | 18.84s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 49 | 0.29s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 49 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 47 | 0.81s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 46 | 0.63s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 45 | 1.08s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 43 | 2.72s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 41 | 0.73s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 39 | 3.26s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 37 | 8.88s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 35 | 0.86s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 31 | 12.02s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 30 | 19.83s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 29 | 3.04s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 29 | 1.97s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 24 | 20.77s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 19 | 30.96s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 8 | 27.11s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 29 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 29 | 71.83s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 27 | 0.34s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 25 | 0.43s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 23 | 1.13s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 22 | 0.39s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 21 | 1.13s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 20 | 0.42s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 18 | 0.7s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 16 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 16 | 2.06s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 16 | 7.27s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 16 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 15 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 15 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 14 | 0.81s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 14 | 0.24s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 13 | 6.61s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 12 | 1.92s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 9 | 23.79s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 9 | 24.54s |
| research | `research.q102_born_current` | conditional | ✅ pass | 9 | 24.34s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 9 | 24.15s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 7 | 33.93s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 6 | 3.5s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 6 | 27.82s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 5 | 27.88s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 4 | 27.88s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 1 | 30.67s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 1 | 47.99s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 2 | 30.78s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 1 | 69.85s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 1 | 53.76s |

**Changed since last run:** `research.q109_full_joined_gauge` error → pass; `research.q109_2d_descent` error → pass

## Archive sweep

Executed at least once: **400/400** research scripts. Latest status: missing_file 23, pass 376, timeout 1.
This run: 219 executed (missing_file 18, pass 201).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-14_q109_joined_gauge_vacuum/Q109_TWO_DIMENSIONAL_DESCENT.py`, `research_archive/2026-11-14_q110_spatial_vacuum_existence/Q110_FULL_528_EXPLORATORY_DESCENT.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

