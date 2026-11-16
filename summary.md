# Cathedral orchestrator — ✅ PASS

2026-11-16T00:38:44Z · [run 43779678654](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43779678654) · `3ac87bc` · push on `newtons-cathedral` · checkpoint #165

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 165 | 0.03s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 165 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 165 | 0.15s |
| tests | `tests.suite` | regression | ✅ pass | 165 | 16.41s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 165 | 10.9s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 165 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 165 | 3.71s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 165 | 3.67s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 165 | 0.37s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 165 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 162 | 9.37s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 165 | 0.54s |
| native | `native.wilson_source` | native | ✅ pass | 165 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 165 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 165 | 0.5s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 165 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 165 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 165 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 159 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 138 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 138 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 158 | 0.91s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 157 | 34.77s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 156 | 3.72s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 154 | 5.55s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 152 | 11.35s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 151 | 1.42s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 151 | 3.93s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 147 | 23.84s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 147 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 147 | 0.48s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 147 | 0.44s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 147 | 0.36s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 147 | 2.18s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 146 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 145 | 23.78s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 144 | 2.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 143 | 0.45s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 142 | 1.08s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 142 | 1.22s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 142 | 4.07s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 142 | 14.79s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 141 | 0.45s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 141 | 42.96s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 141 | 1.86s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 140 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 140 | 0.47s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 139 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 137 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 136 | 55.85s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 135 | 1.27s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 134 | 1.4s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 133 | 2.75s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 131 | 64.37s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 130 | 136.91s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 129 | 25.74s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 128 | 5.34s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 124 | 73.08s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 127 | 11.22s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 125 | 35.24s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 123 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 122 | 2.34s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 121 | 3.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 120 | 1.07s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 119 | 2.15s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 118 | 1.42s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 117 | 1.54s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 116 | 1.42s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 114 | 5.5s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 112 | 2.07s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 103 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 102 | 0.43s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 102 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 101 | 0.39s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 101 | 0.39s |
| research | `research.q59_time_generator` | native | ✅ pass | 99 | 0.53s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 97 | 11.55s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 96 | 42.69s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 94 | 12.39s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 93 | 15.85s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 88 | 20.66s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 82 | 13.14s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 76 | 43.23s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 72 | 20.26s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 70 | 20.82s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 100 | 0.56s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 99 | 0.85s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 109 | 5.54s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 108 | 1.87s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 107 | 0.78s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 106 | 1.98s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 105 | 0.63s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 104 | 4.46s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 103 | 0.54s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 91 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 90 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 89 | 0.3s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 89 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 89 | 0.24s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 88 | 1.32s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 87 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 87 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 87 | 17.72s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 87 | 0.25s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 87 | 0.32s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 85 | 0.68s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 84 | 0.53s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 83 | 0.89s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 81 | 2.31s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 79 | 0.66s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 77 | 2.78s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 75 | 8.52s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 73 | 0.74s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 69 | 12.04s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 68 | 20.12s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 67 | 3.16s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 67 | 2.0s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 62 | 21.55s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 57 | 24.83s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 46 | 21.58s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 67 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 67 | 75.74s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 65 | 0.29s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 63 | 0.39s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 61 | 1.05s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 60 | 0.36s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 59 | 1.0s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 58 | 0.38s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 56 | 0.64s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 54 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 54 | 1.78s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 54 | 7.4s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 54 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 53 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 53 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 52 | 0.71s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 52 | 0.21s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 51 | 6.24s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 50 | 1.51s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 47 | 24.22s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 47 | 24.45s |
| research | `research.q102_born_current` | conditional | ✅ pass | 47 | 24.09s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 47 | 24.41s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 45 | 32.43s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 44 | 2.99s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 44 | 27.13s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 43 | 27.03s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 42 | 27.45s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 39 | 29.21s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 39 | 32.61s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 40 | 29.9s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 39 | 43.76s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 39 | 43.64s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 38 | 0.35s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 35 | 43.63s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 36 | 1.83s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 34 | 0.88s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 28 | 45.08s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 31 | 0.59s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 30 | 0.67s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 30 | 23.83s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 29 | 0.45s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 28 | 0.45s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 28 | 0.29s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 26 | 44.04s |
| research | `research.q104_clock_transport` | native | ✅ pass | 24 | 33.52s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 21 | 2.31s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 23 | 24.58s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 20 | 0.05s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 19 | 0.27s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 17 | 0.25s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 16 | 0.19s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 9 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 8 | 1.47s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 6 | 0.52s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 5 | 0.52s |
| research | `research.q161h_hidden_shift` | native | ✅ pass | 2 | 0.55s |
| research | `research.q161i_hidden_second_order` | native | ✅ pass | 1 | 0.64s |

## Archive sweep

Executed at least once: **437/437** research scripts. Latest status: missing_file 23, pass 411, timeout 3.
This run: 73 executed (pass 71, timeout 2).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

