# Cathedral orchestrator — ✅ PASS

2026-11-15T18:09:57Z · [run 43743396731](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43743396731) · `328f46c` · schedule on `newtons-cathedral` · checkpoint #159

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 159 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 159 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 159 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 159 | 16.81s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 159 | 5.81s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 159 | 0.24s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 159 | 3.97s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 159 | 3.54s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 159 | 0.36s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 159 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 156 | 8.72s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 159 | 0.5s |
| native | `native.wilson_source` | native | ✅ pass | 159 | 1.6s |
| native | `native.output_gate` | native | ✅ pass | 159 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 159 | 0.6s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 159 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 159 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 159 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 153 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 132 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 132 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 152 | 0.61s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 151 | 29.37s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 150 | 3.17s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 148 | 4.67s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 146 | 9.71s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 145 | 1.02s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 145 | 2.9s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 141 | 20.25s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 141 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 141 | 0.4s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 141 | 0.38s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 141 | 0.33s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 141 | 1.78s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 140 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 139 | 20.32s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 138 | 2.25s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 137 | 0.39s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 136 | 0.89s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 136 | 1.62s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 136 | 3.0s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 136 | 12.48s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 135 | 0.4s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 135 | 38.98s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 135 | 1.68s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 134 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 134 | 0.36s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 133 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 131 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 130 | 67.08s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 129 | 1.14s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 128 | 1.26s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 127 | 2.47s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 125 | 86.82s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 124 | 153.18s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 123 | 22.03s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 122 | 4.91s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 118 | 91.85s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 121 | 9.87s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 119 | 31.35s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 117 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 116 | 2.11s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 115 | 3.16s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 114 | 0.96s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 113 | 1.94s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 112 | 1.3s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 111 | 1.42s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 110 | 1.29s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 108 | 4.96s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 106 | 1.83s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 97 | 0.36s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 96 | 0.43s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 96 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 95 | 0.39s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 95 | 0.38s |
| research | `research.q59_time_generator` | native | ✅ pass | 93 | 0.5s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 91 | 10.49s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 90 | 37.67s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 88 | 11.37s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 87 | 13.9s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 82 | 18.27s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 76 | 11.76s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 70 | 39.12s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 66 | 18.15s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 64 | 19.04s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 94 | 0.46s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 93 | 0.75s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 103 | 4.89s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 102 | 1.7s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 101 | 0.75s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 100 | 1.77s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 99 | 0.53s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 98 | 3.87s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 97 | 0.42s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 85 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 84 | 0.35s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 83 | 0.27s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 83 | 0.2s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 83 | 0.2s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 82 | 1.15s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 81 | 0.01s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 81 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 81 | 14.95s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 81 | 0.2s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 81 | 0.26s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 79 | 0.61s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 78 | 0.43s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 77 | 0.78s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 75 | 1.99s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 73 | 0.61s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 71 | 2.57s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 69 | 8.23s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 67 | 0.79s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 63 | 10.92s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 62 | 16.95s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 61 | 4.17s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 61 | 2.73s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 56 | 29.5s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 51 | 22.08s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 40 | 19.23s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 61 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 61 | 97.44s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 59 | 0.25s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 57 | 0.32s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 55 | 0.85s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 54 | 0.33s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 53 | 0.82s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 52 | 0.31s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 50 | 0.58s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 48 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 48 | 1.61s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 48 | 6.1s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 48 | 0.06s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 47 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 47 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 46 | 0.7s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 46 | 0.2s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 45 | 5.73s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 44 | 1.45s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 41 | 21.52s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 41 | 21.64s |
| research | `research.q102_born_current` | conditional | ✅ pass | 41 | 21.02s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 41 | 21.2s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 39 | 29.08s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 38 | 2.71s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 38 | 24.3s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 37 | 23.38s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 36 | 24.35s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 33 | 25.81s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 33 | 34.66s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 34 | 25.67s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 33 | 52.89s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 33 | 38.31s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 32 | 0.32s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 29 | 38.16s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 30 | 1.54s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 28 | 0.74s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 22 | 54.54s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 25 | 0.47s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 24 | 0.56s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 24 | 23.79s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 23 | 0.38s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 22 | 0.36s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 22 | 0.24s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 20 | 38.59s |
| research | `research.q104_clock_transport` | native | ✅ pass | 18 | 28.64s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 15 | 1.86s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 17 | 24.58s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 14 | 0.04s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 13 | 0.21s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 11 | 0.19s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 10 | 0.16s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 3 | 0.01s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 2 | 1.24s |

## Archive sweep

Executed at least once: **433/433** research scripts. Latest status: missing_file 23, pass 408, timeout 2.
This run: 199 executed (missing_file 18, pass 180, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

