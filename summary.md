# Cathedral orchestrator — ✅ PASS

2026-11-15T04:35:38Z · [run 43676011597](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43676011597) · `aac1bbc` · push on `newtons-cathedral` · checkpoint #145

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 145 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 145 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 145 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 145 | 16.48s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 145 | 9.12s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 145 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 145 | 5.16s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 145 | 4.62s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 145 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 145 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 142 | 11.42s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 145 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 145 | 0.95s |
| native | `native.output_gate` | native | ✅ pass | 145 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 145 | 0.54s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 145 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 145 | 0.94s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 145 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 139 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 118 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 118 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 138 | 0.96s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 137 | 35.3s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 136 | 3.78s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 134 | 5.59s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 132 | 11.4s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 131 | 1.48s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 131 | 4.08s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 127 | 24.03s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 127 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 127 | 0.48s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 127 | 0.44s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 127 | 0.37s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 127 | 2.23s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 126 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 125 | 23.96s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 124 | 2.64s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 123 | 0.45s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 122 | 1.08s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 122 | 1.49s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 122 | 4.13s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 122 | 14.78s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 121 | 0.45s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 121 | 43.34s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 121 | 1.87s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 120 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 120 | 0.47s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 119 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 117 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 116 | 66.58s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 115 | 1.29s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 114 | 1.41s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 113 | 2.77s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 111 | 86.91s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 110 | 153.48s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 109 | 25.95s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 108 | 5.46s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 104 | 90.77s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 107 | 11.4s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 105 | 35.7s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 103 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 102 | 2.34s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 101 | 3.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 100 | 1.07s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 99 | 2.15s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 98 | 1.43s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 97 | 1.54s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 96 | 1.42s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 94 | 5.52s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 92 | 2.09s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 83 | 0.38s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 82 | 0.43s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 82 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 81 | 0.38s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 81 | 0.39s |
| research | `research.q59_time_generator` | native | ✅ pass | 79 | 0.54s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 77 | 11.54s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 76 | 42.94s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 74 | 12.53s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 73 | 15.96s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 68 | 20.74s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 62 | 13.19s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 56 | 43.46s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 52 | 20.38s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 50 | 21.0s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 80 | 0.56s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 79 | 0.86s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 89 | 5.62s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 88 | 1.87s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 87 | 0.78s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 86 | 1.97s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 85 | 0.64s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 84 | 4.47s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 83 | 0.55s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 71 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 70 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 69 | 0.31s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 69 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 69 | 0.24s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 68 | 1.33s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 67 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 67 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 67 | 18.1s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 67 | 0.26s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 67 | 0.33s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 65 | 0.68s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 64 | 0.53s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 63 | 0.9s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 61 | 2.31s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 59 | 0.66s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 57 | 2.79s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 55 | 8.82s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 53 | 0.74s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 49 | 11.85s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 48 | 20.3s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 47 | 4.21s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 47 | 2.71s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 42 | 30.07s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 37 | 24.87s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 26 | 21.72s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 47 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 47 | 103.11s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 45 | 0.29s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 43 | 0.38s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 41 | 1.05s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 40 | 0.35s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 39 | 0.99s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 38 | 0.39s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 36 | 0.64s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 34 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 34 | 1.78s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 34 | 7.39s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 34 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 33 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 33 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 32 | 0.71s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 32 | 0.2s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 31 | 6.24s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 30 | 1.51s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 27 | 24.27s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 27 | 24.76s |
| research | `research.q102_born_current` | conditional | ✅ pass | 27 | 24.52s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 27 | 24.86s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 25 | 32.65s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 24 | 2.91s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 24 | 27.46s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 23 | 27.69s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 22 | 27.31s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 19 | 29.01s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 19 | 34.42s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 20 | 30.05s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 19 | 53.21s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 19 | 43.61s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 18 | 0.34s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 15 | 44.0s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 16 | 1.83s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 14 | 0.88s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 8 | 54.99s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 11 | 0.59s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 10 | 0.67s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 10 | 23.53s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 9 | 0.45s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 8 | 0.45s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 8 | 0.29s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 6 | 44.26s |
| research | `research.q104_clock_transport` | native | ✅ pass | 4 | 33.88s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 1 | 2.32s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 3 | 24.36s |

## Archive sweep

Executed at least once: **416/416** research scripts. Latest status: missing_file 23, pass 392, timeout 1.
This run: 175 executed (missing_file 10, pass 164, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

