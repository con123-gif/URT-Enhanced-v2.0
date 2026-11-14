# Cathedral orchestrator — ✅ PASS

2026-11-14T15:00:13Z · [run 43604155231](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43604155231) · `4c6dc4f` · schedule on `newtons-cathedral` · checkpoint #133

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 133 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 133 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 133 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 133 | 16.91s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 133 | 10.95s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 133 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 133 | 4.87s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 133 | 4.75s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 133 | 0.45s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 133 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 130 | 11.56s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 133 | 0.6s |
| native | `native.wilson_source` | native | ✅ pass | 133 | 1.69s |
| native | `native.output_gate` | native | ✅ pass | 133 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 133 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 133 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 133 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 133 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 127 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 106 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 106 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 126 | 0.95s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 125 | 45.21s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 124 | 4.84s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 122 | 7.21s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 120 | 14.73s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 119 | 1.63s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 119 | 4.69s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 115 | 30.86s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 115 | 0.2s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 115 | 0.6s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 115 | 0.57s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 115 | 0.47s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 115 | 2.82s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 114 | 0.18s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 113 | 30.75s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 112 | 3.43s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 111 | 0.58s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 110 | 1.36s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 110 | 1.66s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 110 | 4.93s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 110 | 19.29s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 109 | 0.58s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 109 | 53.11s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 109 | 2.44s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 108 | 0.18s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 108 | 0.56s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 107 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 105 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 104 | 80.23s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 103 | 1.57s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 102 | 1.72s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 101 | 3.34s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 99 | 84.91s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 98 | 190.65s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 97 | 33.76s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 96 | 6.06s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 92 | 106.4s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 95 | 12.0s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 93 | 39.35s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 91 | 0.29s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 90 | 2.83s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 89 | 4.32s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 88 | 1.34s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 87 | 2.65s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 86 | 1.74s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 85 | 1.91s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 84 | 1.74s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 82 | 7.08s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 80 | 2.6s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 71 | 0.48s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 70 | 0.55s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 70 | 0.57s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 69 | 0.5s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 69 | 0.51s |
| research | `research.q59_time_generator` | native | ✅ pass | 67 | 0.68s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 65 | 14.85s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 64 | 55.03s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 62 | 15.99s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 61 | 20.41s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 56 | 26.44s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 50 | 16.98s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 44 | 56.54s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 40 | 25.0s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 38 | 25.74s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 68 | 0.72s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 67 | 1.09s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 77 | 7.28s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 76 | 2.45s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 75 | 1.08s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 74 | 2.57s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 73 | 0.82s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 72 | 5.77s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 71 | 0.69s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 59 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 58 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 57 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 57 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 57 | 0.31s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 56 | 1.75s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 55 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 55 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 55 | 23.79s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 55 | 0.33s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 55 | 0.43s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 53 | 0.88s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 52 | 0.7s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 51 | 1.17s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 49 | 2.97s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 47 | 0.87s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 45 | 3.7s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 43 | 11.19s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 41 | 0.95s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 37 | 15.67s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 36 | 26.7s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 35 | 4.19s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 35 | 2.71s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 30 | 29.8s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 25 | 30.94s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 14 | 26.59s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 35 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 35 | 97.0s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 33 | 0.37s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 31 | 0.49s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 29 | 1.39s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 28 | 0.45s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 27 | 1.3s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 26 | 0.5s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 24 | 0.82s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 22 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 22 | 2.31s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 22 | 9.61s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 22 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 21 | 0.08s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 21 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 20 | 0.91s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 20 | 0.26s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 19 | 8.34s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 18 | 1.96s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 15 | 31.9s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 15 | 31.96s |
| research | `research.q102_born_current` | conditional | ✅ pass | 15 | 32.02s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 15 | 32.32s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 13 | 42.68s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 12 | 3.75s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 12 | 35.52s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 11 | 35.57s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 10 | 35.76s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 7 | 38.13s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 7 | 46.06s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 8 | 39.02s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 7 | 65.37s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 7 | 57.29s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 6 | 0.45s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 3 | 57.2s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 4 | 2.36s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 2 | 1.12s |

## Archive sweep

Executed at least once: **405/405** research scripts. Latest status: missing_file 23, pass 381, timeout 1.
This run: 142 executed (missing_file 4, pass 138).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

