# Cathedral orchestrator — ✅ PASS

2026-11-15T23:26:55Z · [run 43772186463](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43772186463) · `f8a5755` · schedule on `newtons-cathedral` · checkpoint #163

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 163 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 163 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 163 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 163 | 16.76s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 163 | 6.76s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 163 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 163 | 6.49s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 163 | 6.21s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 163 | 0.55s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 163 | 0.42s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 160 | 15.36s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 163 | 0.83s |
| native | `native.wilson_source` | native | ✅ pass | 163 | 1.36s |
| native | `native.output_gate` | native | ✅ pass | 163 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 163 | 0.43s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 163 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 163 | 0.67s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 163 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 157 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 136 | 0.3s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 136 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 156 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 155 | 53.42s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 154 | 5.67s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 152 | 8.32s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 150 | 17.21s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 149 | 1.83s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 149 | 5.17s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 145 | 36.13s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 145 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 145 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 145 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 145 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 145 | 3.87s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 144 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 143 | 36.21s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 142 | 4.47s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 141 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 140 | 1.59s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 140 | 1.47s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 140 | 5.6s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 140 | 23.04s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 139 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 139 | 61.74s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 139 | 2.89s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 138 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 138 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 137 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 135 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 134 | 57.34s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 133 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 132 | 2.05s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 131 | 3.97s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 129 | 64.64s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 128 | 138.17s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 127 | 37.9s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 126 | 8.07s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 122 | 79.74s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 125 | 16.46s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 123 | 53.61s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 121 | 0.32s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 120 | 3.35s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 119 | 4.96s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 118 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 117 | 3.08s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 116 | 2.02s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 115 | 2.24s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 114 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 112 | 8.84s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 110 | 3.12s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 101 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 100 | 0.64s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 100 | 0.63s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 99 | 0.57s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 99 | 0.58s |
| research | `research.q59_time_generator` | native | ✅ pass | 97 | 0.8s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 95 | 17.71s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 94 | 66.22s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 92 | 18.88s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 91 | 23.71s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 86 | 31.1s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 80 | 20.07s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 74 | 68.78s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 70 | 30.9s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 68 | 31.87s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 98 | 0.96s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 97 | 1.4s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 107 | 8.38s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 106 | 2.74s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 105 | 1.11s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 104 | 3.07s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 103 | 0.9s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 102 | 6.84s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 101 | 0.93s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 89 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 88 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 87 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 87 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 87 | 0.31s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 86 | 1.98s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 85 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 85 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 85 | 26.54s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 85 | 0.33s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 85 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 83 | 0.95s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 82 | 0.72s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 81 | 1.29s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 79 | 3.44s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 77 | 0.99s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 75 | 4.19s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 73 | 13.07s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 71 | 1.11s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 67 | 18.24s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 66 | 30.57s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 65 | 5.42s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 65 | 3.68s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 60 | 37.32s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 55 | 37.5s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 44 | 33.05s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 65 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 65 | 127.84s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 63 | 0.4s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 61 | 0.53s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 59 | 1.54s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 58 | 0.48s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 57 | 1.46s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 56 | 0.53s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 54 | 0.92s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 52 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 52 | 2.67s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 52 | 11.4s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 52 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 51 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 51 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 50 | 1.03s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 50 | 0.29s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 49 | 9.48s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 48 | 2.29s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 45 | 37.45s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 45 | 37.75s |
| research | `research.q102_born_current` | conditional | ✅ pass | 45 | 37.35s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 45 | 37.85s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 43 | 50.33s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 42 | 4.41s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 42 | 41.62s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 41 | 41.78s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 40 | 41.93s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 37 | 44.78s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 37 | 32.98s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 38 | 45.73s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 37 | 44.13s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 37 | 68.7s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 36 | 0.51s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 33 | 69.26s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 34 | 2.69s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 32 | 1.3s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 26 | 45.4s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 29 | 0.84s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 28 | 0.95s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 28 | 24.36s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 27 | 0.65s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 26 | 0.69s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 26 | 0.4s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 24 | 70.15s |
| research | `research.q104_clock_transport` | native | ✅ pass | 22 | 52.31s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 19 | 3.35s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 21 | 24.86s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 18 | 0.07s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 17 | 0.36s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 15 | 0.33s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 14 | 0.28s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 7 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 6 | 2.34s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 4 | 0.71s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 3 | 0.73s |

## Archive sweep

Executed at least once: **435/435** research scripts. Latest status: missing_file 23, pass 409, timeout 3.
This run: 77 executed (missing_file 1, pass 75, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

