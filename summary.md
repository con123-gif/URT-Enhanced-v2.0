# Cathedral orchestrator — ✅ PASS

2026-11-14T11:44:47Z · [run 43589565720](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43589565720) · `62e1873` · push on `newtons-cathedral` · checkpoint #128

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 128 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 128 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 128 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 128 | 21.46s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 128 | 6.64s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 128 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 128 | 3.3s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 128 | 3.2s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 128 | 0.3s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 128 | 0.23s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 125 | 7.89s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 128 | 0.42s |
| native | `native.wilson_source` | native | ✅ pass | 128 | 1.82s |
| native | `native.output_gate` | native | ✅ pass | 128 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 128 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 128 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 128 | 0.61s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 128 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 122 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 101 | 0.3s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 101 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 121 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 120 | 55.04s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 119 | 5.7s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 117 | 8.28s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 115 | 17.32s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 114 | 1.93s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 114 | 5.42s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 110 | 36.01s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 110 | 0.23s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 110 | 0.68s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 110 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 110 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 110 | 3.36s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 109 | 0.21s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 108 | 36.29s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 107 | 4.28s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 106 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 105 | 1.74s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 105 | 1.63s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 105 | 5.95s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 105 | 22.54s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 104 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 104 | 64.5s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 104 | 2.92s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 103 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 103 | 0.67s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 102 | 0.11s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 100 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 99 | 67.57s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 98 | 1.98s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 97 | 2.17s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 96 | 4.21s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 94 | 87.18s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 93 | 152.96s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 92 | 40.51s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 91 | 8.84s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 87 | 89.52s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 90 | 18.92s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 88 | 58.64s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 86 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 85 | 3.57s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 84 | 5.11s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 83 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 82 | 3.19s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 81 | 2.11s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 80 | 2.33s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 79 | 2.11s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 77 | 8.46s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 75 | 3.07s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 66 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 65 | 0.64s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 65 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 64 | 0.57s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 64 | 0.59s |
| research | `research.q59_time_generator` | native | ✅ pass | 62 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 60 | 17.62s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 59 | 65.41s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 57 | 18.99s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 56 | 23.93s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 51 | 31.11s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 45 | 19.97s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 39 | 67.6s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 35 | 32.06s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 33 | 33.13s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 63 | 0.82s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 62 | 1.29s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 72 | 6.96s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 71 | 2.48s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 70 | 1.07s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 69 | 3.07s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 68 | 0.89s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 67 | 6.93s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 66 | 0.81s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 54 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 53 | 0.66s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 52 | 0.51s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 52 | 0.35s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 52 | 0.36s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 51 | 2.05s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 50 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 50 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 50 | 24.12s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 50 | 0.37s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 50 | 0.47s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 48 | 1.06s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 47 | 0.81s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 46 | 1.35s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 44 | 3.49s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 42 | 0.9s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 40 | 4.18s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 38 | 11.03s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 36 | 1.1s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 32 | 14.95s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 31 | 25.09s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 30 | 4.19s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 30 | 2.74s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 25 | 29.24s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 20 | 39.04s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 9 | 34.33s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 30 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 30 | 99.19s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 28 | 0.41s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 26 | 0.53s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 24 | 1.45s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 23 | 0.5s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 22 | 1.42s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 21 | 0.52s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 19 | 0.91s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 17 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 17 | 2.66s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 17 | 9.31s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 17 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 16 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 16 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 15 | 1.01s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 15 | 0.3s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 14 | 8.23s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 13 | 2.39s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 10 | 30.55s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 10 | 30.87s |
| research | `research.q102_born_current` | conditional | ✅ pass | 10 | 30.58s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 10 | 30.68s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 8 | 41.75s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 7 | 4.38s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 7 | 34.82s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 6 | 34.7s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 5 | 34.86s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 2 | 38.28s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 2 | 34.45s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 3 | 38.67s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 2 | 52.74s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 2 | 67.89s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 1 | 0.48s |

## Archive sweep

Executed at least once: **401/401** research scripts. Latest status: missing_file 23, pass 377, timeout 1.
This run: 49 executed (pass 48, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

