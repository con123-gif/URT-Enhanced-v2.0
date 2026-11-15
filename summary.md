# Cathedral orchestrator — ✅ PASS

2026-11-15T08:48:56Z · [run 43693975624](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43693975624) · `3358a6d` · push on `newtons-cathedral` · checkpoint #146

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 146 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 146 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 146 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 146 | 22.44s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 146 | 5.6s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 146 | 0.23s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 146 | 4.53s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 146 | 3.93s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 146 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 146 | 0.28s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 143 | 9.81s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 146 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 146 | 1.12s |
| native | `native.output_gate` | native | ✅ pass | 146 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 146 | 0.6s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 146 | 0.36s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 146 | 0.92s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 146 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 140 | 0.14s |
| research | `research.missing_intermediates` | independent | ✅ pass | 119 | 0.3s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 119 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 139 | 1.29s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 138 | 54.54s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 137 | 5.87s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 135 | 8.37s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 133 | 17.75s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 132 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 132 | 5.29s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 128 | 36.41s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 128 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 128 | 0.73s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 128 | 0.7s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 128 | 0.55s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 128 | 3.96s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 127 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 126 | 36.34s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 125 | 4.57s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 124 | 0.72s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 123 | 1.75s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 123 | 1.75s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 123 | 5.76s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 123 | 23.07s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 122 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 122 | 61.6s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 122 | 2.9s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 121 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 121 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 120 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 118 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 117 | 67.3s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 116 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 115 | 1.98s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 114 | 3.98s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 112 | 87.26s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 111 | 155.03s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 110 | 38.14s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 109 | 8.07s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 105 | 95.78s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 108 | 16.35s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 106 | 53.72s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 104 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 103 | 3.36s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 102 | 5.0s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 101 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 100 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 99 | 2.02s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 98 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 97 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 95 | 8.97s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 93 | 3.1s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 84 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 83 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 83 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 82 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 82 | 0.59s |
| research | `research.q59_time_generator` | native | ✅ pass | 80 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 78 | 18.02s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 77 | 66.65s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 75 | 19.12s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 74 | 23.81s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 69 | 31.29s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 63 | 20.32s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 57 | 69.84s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 53 | 31.19s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 51 | 32.16s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 81 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 80 | 1.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 90 | 8.68s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 89 | 2.8s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 88 | 1.17s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 87 | 3.12s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 86 | 0.94s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 85 | 7.08s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 84 | 0.97s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 72 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 71 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 70 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 70 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 70 | 0.34s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 69 | 2.04s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 68 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 68 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 68 | 27.56s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 68 | 0.35s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 68 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 66 | 1.02s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 65 | 0.78s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 64 | 1.33s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 62 | 3.56s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 60 | 0.99s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 58 | 4.25s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 56 | 13.6s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 54 | 1.11s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 50 | 18.44s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 49 | 31.18s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 48 | 3.52s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 48 | 2.34s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 43 | 24.32s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 38 | 37.92s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 27 | 33.31s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 48 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 48 | 84.77s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 46 | 0.42s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 44 | 0.55s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 42 | 1.6s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 41 | 0.51s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 40 | 1.55s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 39 | 0.58s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 37 | 0.98s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 35 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 35 | 2.74s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 35 | 11.47s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 35 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 34 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 34 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 33 | 1.07s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 33 | 0.3s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 32 | 9.79s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 31 | 2.37s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 28 | 38.31s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 28 | 38.32s |
| research | `research.q102_born_current` | conditional | ✅ pass | 28 | 38.19s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 28 | 38.27s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 26 | 51.22s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 25 | 4.45s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 25 | 42.89s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 24 | 43.6s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 23 | 42.89s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 20 | 45.75s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 20 | 35.26s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 21 | 48.1s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 20 | 53.3s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 20 | 70.06s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 19 | 0.51s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 16 | 70.17s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 17 | 2.78s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 15 | 1.31s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 9 | 55.0s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 12 | 0.87s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 11 | 0.99s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 11 | 24.14s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 10 | 0.69s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 9 | 0.7s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 9 | 0.42s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 7 | 71.57s |
| research | `research.q104_clock_transport` | native | ✅ pass | 5 | 52.64s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 2 | 3.4s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 4 | 24.85s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 1 | 0.07s |

## Archive sweep

Executed at least once: **417/417** research scripts. Latest status: missing_file 23, pass 393, timeout 1.
This run: 305 executed (missing_file 18, pass 287).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

