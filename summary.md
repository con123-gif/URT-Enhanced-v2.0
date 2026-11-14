# Cathedral orchestrator — ❌ FAIL

2026-11-14T12:04:53Z · [run 43590931659](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43590931659) · `c1612ab` · push on `newtons-cathedral` · checkpoint #129

**Gating failures:** `research.q115_native_a5_four_pole_source`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 129 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 129 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 129 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 129 | 17.19s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 129 | 6.83s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 129 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 129 | 6.47s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 129 | 6.04s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 129 | 0.58s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 129 | 0.43s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 126 | 14.86s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 129 | 0.81s |
| native | `native.wilson_source` | native | ✅ pass | 129 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 129 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 129 | 0.58s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 129 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 129 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 129 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 123 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 102 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 102 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 122 | 0.85s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 121 | 41.38s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 120 | 4.41s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 118 | 6.46s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 116 | 13.47s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 115 | 1.69s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 115 | 4.35s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 111 | 28.05s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 111 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 111 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 111 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 111 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 111 | 2.61s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 110 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 109 | 27.68s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 108 | 3.33s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 107 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 106 | 1.45s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 106 | 1.76s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 106 | 4.78s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 106 | 17.62s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 105 | 0.53s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 105 | 57.52s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 105 | 2.19s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 104 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 104 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 103 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 101 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 100 | 87.67s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 99 | 1.6s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 98 | 1.72s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 97 | 3.58s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 95 | 95.45s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 94 | 191.77s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 93 | 31.16s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 92 | 7.04s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 88 | 108.44s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 91 | 14.54s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 89 | 46.69s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 87 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 86 | 3.06s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 85 | 4.57s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 84 | 1.3s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 83 | 2.81s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 82 | 1.8s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 81 | 1.87s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 80 | 1.83s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 78 | 6.8s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 76 | 2.57s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 67 | 0.43s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 66 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 66 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 65 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 65 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 63 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 61 | 13.81s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 60 | 50.79s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 58 | 14.78s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 57 | 18.52s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 52 | 24.17s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 46 | 15.58s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 40 | 52.64s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 36 | 25.19s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 34 | 25.62s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 64 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 63 | 0.97s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 73 | 5.39s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 72 | 1.89s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 71 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 70 | 2.34s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 69 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 68 | 5.31s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 67 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 55 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 54 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 53 | 0.39s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 53 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 53 | 0.25s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 52 | 1.53s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 51 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 51 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 51 | 18.22s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 51 | 0.26s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 51 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 49 | 0.74s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 48 | 0.57s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 47 | 1.0s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 45 | 2.61s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 43 | 0.69s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 41 | 3.18s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 39 | 8.76s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 37 | 0.86s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 33 | 11.92s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 32 | 19.6s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 31 | 5.01s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 31 | 3.27s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 26 | 34.6s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 21 | 30.19s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 10 | 26.66s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 31 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 31 | 113.88s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 29 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 27 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 25 | 1.09s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 24 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 23 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 22 | 0.38s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 20 | 0.69s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 18 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 18 | 2.0s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 18 | 7.19s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 18 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 17 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 17 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 16 | 0.77s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 16 | 0.23s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 15 | 6.39s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 14 | 1.79s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 11 | 23.79s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 11 | 24.3s |
| research | `research.q102_born_current` | conditional | ✅ pass | 11 | 24.06s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 11 | 24.07s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 9 | 33.12s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 8 | 3.38s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 8 | 27.42s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 7 | 27.47s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 6 | 27.57s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 3 | 30.54s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 3 | 46.54s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 4 | 30.78s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 3 | 70.25s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 3 | 53.04s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 2 | 0.41s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ❌ assertion_failed — Counter({(5, 4): 24, (3, 4): 20, (2, 0): 15, (1, 64): 1}) | 0 | 53.13s |

## Archive sweep

Executed at least once: **402/402** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 377, timeout 1.
This run: 141 executed (assertion_failed 1, missing_file 5, pass 135).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

