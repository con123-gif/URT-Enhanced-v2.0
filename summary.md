# Cathedral orchestrator — ✅ PASS

2026-11-14T09:54:06Z · [run 43580341183](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43580341183) · `ea690e7` · push on `newtons-cathedral` · checkpoint #123

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 123 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 123 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 123 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 123 | 17.0s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 123 | 6.7s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 123 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 123 | 4.11s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 123 | 3.92s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 123 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 123 | 0.28s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 120 | 9.59s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 123 | 0.55s |
| native | `native.wilson_source` | native | ✅ pass | 123 | 1.63s |
| native | `native.output_gate` | native | ✅ pass | 123 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 123 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 123 | 0.36s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 123 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 123 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 117 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 96 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 96 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 116 | 0.91s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 115 | 34.62s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 114 | 3.7s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 112 | 5.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 110 | 11.38s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 109 | 1.43s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 109 | 3.88s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 105 | 23.89s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 105 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 105 | 0.47s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 105 | 0.42s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 105 | 0.35s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 105 | 2.17s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 104 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 103 | 24.12s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 102 | 2.64s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 101 | 0.44s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 100 | 1.07s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 100 | 1.3s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 100 | 3.93s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 100 | 14.83s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 99 | 0.43s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 99 | 42.98s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 99 | 1.86s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 98 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 98 | 0.46s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 97 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 95 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 94 | 57.39s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 93 | 1.25s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 92 | 1.39s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 91 | 2.75s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 89 | 64.63s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 88 | 137.12s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 87 | 25.67s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 86 | 5.33s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 82 | 75.09s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 85 | 11.08s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 83 | 35.26s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 81 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 80 | 2.33s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 79 | 3.47s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 78 | 1.06s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 77 | 2.14s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 76 | 1.42s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 75 | 1.53s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 74 | 1.42s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 72 | 5.52s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 70 | 2.08s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 61 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 60 | 0.42s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 60 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 59 | 0.38s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 59 | 0.39s |
| research | `research.q59_time_generator` | native | ✅ pass | 57 | 0.53s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 55 | 11.45s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 54 | 43.28s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 52 | 12.46s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 51 | 15.82s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 46 | 20.57s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 40 | 13.08s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 34 | 43.11s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 30 | 20.23s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 28 | 20.83s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 58 | 0.55s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 57 | 0.84s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 67 | 5.57s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 66 | 1.84s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 65 | 0.77s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 64 | 1.98s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 63 | 0.62s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 62 | 4.43s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 61 | 0.55s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 49 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 48 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 47 | 0.3s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 47 | 0.24s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 47 | 0.23s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 46 | 1.31s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 45 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 45 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 45 | 17.62s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 45 | 0.25s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 45 | 0.32s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 43 | 0.66s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 42 | 0.51s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 41 | 0.88s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 39 | 2.3s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 37 | 0.65s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 35 | 2.76s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 33 | 8.74s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 31 | 0.73s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 27 | 11.81s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 26 | 20.16s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 25 | 3.39s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 25 | 2.23s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 20 | 24.04s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 15 | 24.75s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 4 | 21.6s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 25 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 25 | 82.45s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 23 | 0.29s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 21 | 0.38s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 19 | 1.04s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 18 | 0.35s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 17 | 0.99s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 16 | 0.38s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 14 | 0.64s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 12 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 12 | 1.79s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 12 | 7.41s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 12 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 11 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 11 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 10 | 0.7s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 10 | 0.2s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 9 | 6.19s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 8 | 1.49s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 5 | 23.98s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 5 | 24.21s |
| research | `research.q102_born_current` | conditional | ✅ pass | 5 | 23.99s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 5 | 24.34s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 3 | 32.07s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 2 | 2.88s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 2 | 27.1s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 1 | 27.01s |

## Archive sweep

Executed at least once: **393/393** research scripts. Latest status: missing_file 23, pass 369, timeout 1.
This run: 232 executed (missing_file 18, pass 213, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

