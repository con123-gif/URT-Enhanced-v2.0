# Cathedral orchestrator — ❌ FAIL

2026-11-14T16:28:11Z · [run 43612896540](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43612896540) · `58bb29f` · push on `newtons-cathedral` · checkpoint #137

**Gating failures:** `research.q117a_mixed_hidden_current`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 137 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 137 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 137 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 137 | 21.24s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 137 | 10.7s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 137 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 137 | 3.35s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 137 | 3.25s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 137 | 0.32s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 137 | 0.25s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 134 | 7.97s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 137 | 0.45s |
| native | `native.wilson_source` | native | ✅ pass | 137 | 1.77s |
| native | `native.output_gate` | native | ✅ pass | 137 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 137 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 137 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 137 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 137 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 131 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 110 | 0.24s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 110 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 130 | 1.02s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 129 | 46.64s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 128 | 4.98s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 126 | 7.39s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 124 | 15.09s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 123 | 1.77s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 123 | 4.79s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 119 | 31.83s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 119 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 119 | 0.64s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 119 | 0.59s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 119 | 0.49s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 119 | 2.91s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 118 | 0.19s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 117 | 31.64s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 116 | 3.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 115 | 0.61s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 114 | 1.42s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 114 | 2.04s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 114 | 5.21s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 114 | 19.93s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 113 | 0.6s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 113 | 54.68s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 113 | 2.5s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 112 | 0.19s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 112 | 0.6s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 111 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 109 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 108 | 87.96s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 107 | 1.65s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 106 | 1.84s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 105 | 3.47s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 103 | 96.1s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 102 | 193.3s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 101 | 35.14s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 100 | 6.3s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 96 | 112.68s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 99 | 12.47s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 97 | 40.59s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 95 | 0.3s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 94 | 2.93s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 93 | 4.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 92 | 1.39s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 91 | 2.72s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 90 | 1.8s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 89 | 1.94s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 88 | 1.8s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 86 | 7.39s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 84 | 2.68s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 75 | 0.52s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 74 | 0.6s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 74 | 0.59s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 73 | 0.54s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 73 | 0.55s |
| research | `research.q59_time_generator` | native | ✅ pass | 71 | 0.73s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 69 | 15.29s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 68 | 56.81s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 66 | 16.65s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 65 | 21.2s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 60 | 27.68s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 54 | 17.71s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 48 | 58.5s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 44 | 26.06s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 42 | 26.58s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 72 | 0.75s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 71 | 1.13s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 81 | 7.59s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 80 | 2.55s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 79 | 1.07s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 78 | 2.67s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 77 | 0.86s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 76 | 6.1s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 75 | 0.72s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 63 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 62 | 0.54s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 61 | 0.41s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 61 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 61 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 60 | 1.78s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 59 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 59 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 59 | 24.74s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 59 | 0.35s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 59 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 57 | 0.92s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 56 | 0.72s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 55 | 1.22s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 53 | 3.09s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 51 | 0.9s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 49 | 3.72s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 47 | 11.92s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 45 | 0.99s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 41 | 15.98s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 40 | 27.55s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 39 | 4.67s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 39 | 3.1s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 34 | 30.6s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 29 | 31.75s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 18 | 27.57s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 39 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 39 | 111.18s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 37 | 0.38s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 35 | 0.51s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 33 | 1.41s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 32 | 0.47s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 31 | 1.34s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 30 | 0.51s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 28 | 0.85s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 26 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 26 | 2.38s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 26 | 9.96s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 26 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 25 | 0.08s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 25 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 24 | 0.95s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 24 | 0.27s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 23 | 8.51s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 22 | 2.01s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 19 | 32.74s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 19 | 33.14s |
| research | `research.q102_born_current` | conditional | ✅ pass | 19 | 33.08s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 19 | 33.23s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 17 | 44.43s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 16 | 3.91s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 16 | 36.71s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 15 | 37.29s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 14 | 37.28s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 11 | 39.96s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 11 | 46.48s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 12 | 41.06s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 11 | 70.62s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 11 | 59.13s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 10 | 0.5s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 7 | 58.95s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 8 | 2.45s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 6 | 1.16s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ❌ assertion_failed | 0 | 72.66s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 3 | 0.8s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 2 | 0.91s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 2 | 37.58s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 1 | 0.61s |

## Archive sweep

Executed at least once: **410/410** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 385, timeout 1.
This run: 144 executed (missing_file 8, pass 135, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

