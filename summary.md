# Cathedral orchestrator — ✅ PASS

2026-11-15T15:47:28Z · [run 43729356706](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43729356706) · `bf97a4f` · push on `newtons-cathedral` · checkpoint #157

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 157 | 0.03s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 157 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 157 | 0.15s |
| tests | `tests.suite` | regression | ✅ pass | 157 | 16.44s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 157 | 7.06s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 157 | 0.34s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 157 | 6.1s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 157 | 6.01s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 157 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 157 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 154 | 14.83s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 157 | 0.76s |
| native | `native.wilson_source` | native | ✅ pass | 157 | 1.33s |
| native | `native.output_gate` | native | ✅ pass | 157 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 157 | 0.5s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 157 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 157 | 0.81s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 157 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 151 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 130 | 0.25s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 130 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 150 | 1.01s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 149 | 50.31s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 148 | 5.33s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 146 | 7.82s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 144 | 16.46s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 143 | 1.94s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 143 | 5.27s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 139 | 33.56s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 139 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 139 | 0.67s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 139 | 0.6s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 139 | 0.47s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 139 | 3.4s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 138 | 0.2s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 137 | 33.51s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 136 | 4.44s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 135 | 0.59s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 134 | 1.55s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 134 | 1.49s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 134 | 5.6s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 134 | 21.37s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 133 | 0.59s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 133 | 56.32s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 133 | 2.72s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 132 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 132 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 131 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 129 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 128 | 68.06s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 127 | 1.64s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 126 | 1.89s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 125 | 3.78s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 123 | 86.66s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 122 | 153.93s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 121 | 38.36s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 120 | 7.25s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 116 | 92.18s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 119 | 14.82s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 117 | 48.39s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 115 | 0.3s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 114 | 3.19s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 113 | 4.74s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 112 | 1.43s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 111 | 2.93s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 110 | 2.0s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 109 | 2.14s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 108 | 1.93s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 106 | 8.12s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 104 | 2.93s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 95 | 0.5s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 94 | 0.59s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 94 | 0.6s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 93 | 0.51s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 93 | 0.53s |
| research | `research.q59_time_generator` | native | ✅ pass | 91 | 0.73s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 89 | 16.51s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 88 | 61.67s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 86 | 18.05s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 85 | 23.02s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 80 | 30.19s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 74 | 18.94s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 68 | 65.24s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 64 | 29.0s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 62 | 29.99s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 92 | 0.81s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 91 | 1.23s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 101 | 7.61s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 100 | 2.48s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 99 | 1.01s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 98 | 2.84s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 97 | 0.83s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 96 | 6.5s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 95 | 0.8s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 83 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 82 | 0.6s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 81 | 0.46s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 81 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 81 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 80 | 1.85s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 79 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 79 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 79 | 24.04s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 79 | 0.32s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 79 | 0.42s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 77 | 0.88s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 76 | 0.68s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 75 | 1.22s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 73 | 3.2s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 71 | 0.88s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 69 | 3.88s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 67 | 11.91s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 65 | 1.02s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 61 | 15.98s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 60 | 27.77s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 59 | 4.16s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 59 | 2.73s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 54 | 29.56s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 49 | 35.35s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 38 | 31.54s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 59 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 59 | 95.44s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 57 | 0.37s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 55 | 0.49s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 53 | 1.39s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 52 | 0.44s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 51 | 1.3s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 50 | 0.48s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 48 | 0.84s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 46 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 46 | 2.47s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 46 | 10.27s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 46 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 45 | 0.08s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 45 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 44 | 0.93s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 44 | 0.25s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 43 | 8.54s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 42 | 2.2s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 39 | 33.72s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 39 | 33.81s |
| research | `research.q102_born_current` | conditional | ✅ pass | 39 | 33.93s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 39 | 33.74s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 37 | 45.09s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 36 | 4.08s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 36 | 37.42s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 35 | 37.7s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 34 | 38.11s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 31 | 40.87s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 31 | 34.72s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 32 | 41.96s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 31 | 52.92s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 31 | 65.7s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 30 | 0.44s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 27 | 65.34s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 28 | 2.49s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 26 | 1.2s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 20 | 54.82s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 23 | 0.76s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 22 | 0.88s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 22 | 23.74s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 21 | 0.6s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 20 | 0.63s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 20 | 0.36s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 18 | 66.1s |
| research | `research.q104_clock_transport` | native | ✅ pass | 16 | 49.47s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 13 | 3.17s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 15 | 24.53s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 12 | 0.06s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 11 | 0.34s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 9 | 0.31s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 8 | 0.25s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 1 | 0.02s |

## Archive sweep

Executed at least once: **432/432** research scripts. Latest status: missing_file 23, pass 407, timeout 2.
This run: 59 executed (pass 58, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-15_q153_full_physical_stability/Q153_FULL_NATIVE_TRANSVERSE_HESSIAN.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

