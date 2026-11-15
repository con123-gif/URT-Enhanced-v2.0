# Cathedral orchestrator — ✅ PASS

2026-11-15T00:43:24Z · [run 43657516633](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43657516633) · `26c6c56` · push on `newtons-cathedral` · checkpoint #142

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 142 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 142 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 142 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 142 | 16.47s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 142 | 5.49s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 142 | 0.22s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 142 | 4.91s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 142 | 4.61s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 142 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 142 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 139 | 11.43s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 142 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 142 | 1.4s |
| native | `native.output_gate` | native | ✅ pass | 142 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 142 | 0.48s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 142 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 142 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 142 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 136 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 115 | 0.24s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 115 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 135 | 0.99s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 134 | 46.57s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 133 | 5.03s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 131 | 7.44s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 129 | 15.15s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 128 | 1.76s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 128 | 4.87s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 124 | 31.68s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 124 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 124 | 0.65s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 124 | 0.59s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 124 | 0.48s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 124 | 2.92s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 123 | 0.19s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 122 | 31.63s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 121 | 3.57s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 120 | 0.6s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 119 | 1.44s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 119 | 1.54s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 119 | 5.25s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 119 | 20.03s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 118 | 0.6s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 118 | 55.06s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 118 | 2.51s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 117 | 0.18s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 117 | 0.59s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 116 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 114 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 113 | 75.39s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 112 | 1.64s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 111 | 1.76s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 110 | 3.45s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 108 | 70.3s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 107 | 180.98s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 106 | 34.8s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 105 | 6.26s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 101 | 98.99s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 104 | 12.38s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 102 | 40.61s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 100 | 0.3s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 99 | 2.93s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 98 | 4.46s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 97 | 1.38s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 96 | 2.72s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 95 | 1.79s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 94 | 1.93s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 93 | 1.79s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 91 | 7.26s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 89 | 2.66s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 80 | 0.5s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 79 | 0.58s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 79 | 0.58s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 78 | 0.51s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 78 | 0.52s |
| research | `research.q59_time_generator` | native | ✅ pass | 76 | 0.7s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 74 | 15.33s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 73 | 56.64s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 71 | 16.72s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 70 | 21.08s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 65 | 27.42s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 59 | 17.58s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 53 | 58.8s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 49 | 25.79s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 47 | 26.61s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 77 | 0.74s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 76 | 1.13s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 86 | 7.54s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 85 | 2.52s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 84 | 1.05s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 83 | 2.63s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 82 | 0.85s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 81 | 6.03s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 80 | 0.71s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 68 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 67 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 66 | 0.41s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 66 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 66 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 65 | 1.77s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 64 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 64 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 64 | 24.44s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 64 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 64 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 62 | 0.88s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 61 | 0.69s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 60 | 1.18s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 58 | 3.07s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 56 | 0.91s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 54 | 3.68s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 52 | 11.8s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 50 | 0.98s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 46 | 16.26s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 45 | 27.69s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 44 | 4.5s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 44 | 3.0s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 39 | 29.61s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 34 | 31.95s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 23 | 27.75s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 44 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 44 | 105.85s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 42 | 0.4s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 40 | 0.52s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 38 | 1.47s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 37 | 0.49s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 36 | 1.35s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 35 | 0.52s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 33 | 0.87s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 31 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 31 | 2.41s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 31 | 9.97s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 31 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 30 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 30 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 29 | 0.98s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 29 | 0.28s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 28 | 8.57s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 27 | 2.04s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 24 | 32.77s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 24 | 33.19s |
| research | `research.q102_born_current` | conditional | ✅ pass | 24 | 32.78s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 24 | 33.1s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 22 | 44.26s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 21 | 3.92s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 21 | 36.7s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 20 | 37.0s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 19 | 37.3s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 16 | 38.9s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 16 | 43.94s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 17 | 40.49s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 16 | 59.15s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 16 | 58.88s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 15 | 0.47s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 12 | 59.08s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 13 | 2.47s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 11 | 1.17s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 5 | 61.37s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 8 | 0.8s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 7 | 0.91s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 7 | 32.55s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 6 | 0.6s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 5 | 0.6s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 5 | 0.38s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 3 | 59.73s |
| research | `research.q104_clock_transport` | native | ✅ pass | 1 | 42.44s |

## Archive sweep

Executed at least once: **414/414** research scripts. Latest status: missing_file 23, pass 390, timeout 1.
This run: 163 executed (missing_file 5, pass 158).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

