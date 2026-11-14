# Cathedral orchestrator — ✅ PASS

2026-11-14T10:17:13Z · [run 43581210219](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43581210219) · `389b86f` · push on `newtons-cathedral` · checkpoint #124

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 124 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 124 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 124 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 124 | 21.2s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 124 | 10.92s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 124 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 124 | 5.16s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 124 | 4.72s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 124 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 124 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 121 | 11.64s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 124 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 124 | 1.77s |
| native | `native.output_gate` | native | ✅ pass | 124 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 124 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 124 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 124 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 124 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 118 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 97 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 97 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 117 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 116 | 53.97s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 115 | 5.77s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 113 | 8.26s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 111 | 17.56s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 110 | 1.84s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 110 | 5.17s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 106 | 36.73s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 106 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 106 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 106 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 106 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 106 | 3.94s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 105 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 104 | 36.58s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 103 | 4.53s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 102 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 101 | 1.62s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 101 | 1.6s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 101 | 5.61s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 101 | 23.07s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 100 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 100 | 62.04s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 100 | 2.89s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 99 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 99 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 98 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 96 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 95 | 67.24s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 94 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 93 | 2.03s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 92 | 3.97s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 90 | 86.84s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 89 | 153.77s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 88 | 38.01s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 87 | 8.05s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 83 | 92.14s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 86 | 16.43s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 84 | 53.6s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 82 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 81 | 3.38s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 80 | 4.96s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 79 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 78 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 77 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 76 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 75 | 2.06s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 73 | 9.08s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 71 | 3.11s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 62 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 61 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 61 | 0.67s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 60 | 0.62s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 60 | 0.61s |
| research | `research.q59_time_generator` | native | ✅ pass | 58 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 56 | 18.6s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 55 | 66.86s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 53 | 19.18s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 52 | 24.08s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 47 | 31.56s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 41 | 20.27s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 35 | 69.37s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 31 | 31.16s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 29 | 32.1s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 59 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 58 | 1.46s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 68 | 8.66s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 67 | 2.85s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 66 | 1.18s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 65 | 3.15s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 64 | 0.95s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 63 | 7.0s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 62 | 0.95s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 50 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 49 | 0.65s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 48 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 48 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 48 | 0.34s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 47 | 2.03s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 46 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 46 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 46 | 27.58s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 46 | 0.36s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 46 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 44 | 1.01s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 43 | 0.77s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 42 | 1.32s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 40 | 3.53s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 38 | 0.98s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 36 | 4.26s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 34 | 13.46s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 32 | 1.11s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 28 | 18.56s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 27 | 31.71s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 26 | 5.27s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 26 | 3.53s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 21 | 36.66s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 16 | 38.01s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 5 | 33.23s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 26 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 26 | 126.87s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 24 | 0.4s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 22 | 0.55s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 20 | 1.55s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 19 | 0.48s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 18 | 1.52s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 17 | 0.55s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 15 | 0.96s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 13 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 13 | 2.75s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 13 | 11.63s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 13 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 12 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 12 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 11 | 1.05s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 11 | 0.3s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 10 | 9.78s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 9 | 2.39s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 6 | 37.95s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 6 | 38.44s |
| research | `research.q102_born_current` | conditional | ✅ pass | 6 | 38.35s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 6 | 38.19s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 4 | 51.77s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 3 | 4.47s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 3 | 42.52s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 2 | 42.87s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 1 | 42.98s |

## Archive sweep

Executed at least once: **394/394** research scripts. Latest status: missing_file 23, pass 370, timeout 1.
This run: 290 executed (missing_file 18, pass 272).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

