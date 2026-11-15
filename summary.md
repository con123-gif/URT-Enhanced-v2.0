# Cathedral orchestrator — ✅ PASS

2026-11-15T02:52:44Z · [run 43668153262](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43668153262) · `715f2de` · push on `newtons-cathedral` · checkpoint #143

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 143 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 143 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 143 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 143 | 21.15s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 143 | 6.95s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 143 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 143 | 4.71s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 143 | 4.57s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 143 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 143 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 140 | 11.34s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 143 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 143 | 1.8s |
| native | `native.output_gate` | native | ✅ pass | 143 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 143 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 143 | 0.3s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 143 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 143 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 137 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 116 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 116 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 136 | 0.85s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 135 | 42.0s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 134 | 4.45s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 132 | 6.45s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 130 | 13.41s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 129 | 1.58s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 129 | 4.41s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 125 | 28.13s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 125 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 125 | 0.56s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 125 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 125 | 0.43s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 125 | 2.62s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 124 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 123 | 27.98s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 122 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 121 | 0.55s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 120 | 1.39s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 120 | 1.73s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 120 | 4.77s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 120 | 18.32s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 119 | 0.55s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 119 | 49.55s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 119 | 2.27s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 118 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 118 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 117 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 115 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 114 | 70.12s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 113 | 1.61s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 112 | 1.71s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 111 | 3.32s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 109 | 91.17s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 108 | 158.01s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 107 | 31.29s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 106 | 6.86s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 102 | 96.25s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 105 | 14.5s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 103 | 46.62s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 101 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 100 | 2.94s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 99 | 4.39s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 98 | 1.22s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 97 | 2.73s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 96 | 1.82s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 95 | 1.93s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 94 | 1.84s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 92 | 6.72s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 90 | 2.54s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 81 | 0.46s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 80 | 0.53s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 80 | 0.52s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 79 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 79 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 77 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 75 | 14.13s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 74 | 51.11s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 72 | 15.3s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 71 | 18.88s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 66 | 24.33s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 60 | 15.75s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 54 | 52.29s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 50 | 25.32s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 48 | 25.83s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 78 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 77 | 1.03s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 87 | 5.64s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 86 | 2.12s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 85 | 1.0s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 84 | 2.44s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 83 | 0.77s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 82 | 5.44s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 81 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 69 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 68 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 67 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 67 | 0.3s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 67 | 0.3s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 66 | 1.62s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 65 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 65 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 65 | 19.73s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 65 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 65 | 0.42s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 63 | 0.86s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 62 | 0.7s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 61 | 1.13s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 59 | 2.86s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 57 | 0.76s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 55 | 3.41s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 53 | 8.89s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 51 | 0.93s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 47 | 12.34s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 46 | 19.73s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 45 | 2.89s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 45 | 1.89s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 40 | 20.1s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 35 | 30.78s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 24 | 26.88s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 45 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 45 | 70.91s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 43 | 0.34s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 41 | 0.42s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 39 | 1.16s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 38 | 0.41s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 37 | 1.13s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 36 | 0.4s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 34 | 0.73s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 32 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 32 | 2.08s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 32 | 7.23s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 32 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 31 | 0.08s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 31 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 30 | 0.8s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 30 | 0.25s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 29 | 6.57s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 28 | 1.87s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 25 | 24.05s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 25 | 24.25s |
| research | `research.q102_born_current` | conditional | ✅ pass | 25 | 24.02s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 25 | 24.0s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 23 | 32.96s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 22 | 3.39s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 22 | 27.05s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 21 | 27.45s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 20 | 27.28s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 17 | 29.74s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 17 | 35.81s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 18 | 30.55s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 17 | 55.09s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 17 | 52.82s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 16 | 0.39s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 13 | 52.7s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 14 | 2.07s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 12 | 1.04s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 6 | 56.54s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 9 | 0.63s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 8 | 0.71s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 8 | 24.06s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 7 | 0.51s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 6 | 0.51s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 6 | 0.33s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 4 | 53.6s |
| research | `research.q104_clock_transport` | native | ✅ pass | 2 | 44.18s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 1 | 25.65s |

## Archive sweep

Executed at least once: **415/415** research scripts. Latest status: missing_file 23, pass 391, timeout 1.
This run: 245 executed (missing_file 18, pass 226, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

