# Cathedral orchestrator — ❌ FAIL

2026-11-14T15:19:11Z · [run 43607631243](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43607631243) · `e07060e` · push on `newtons-cathedral` · checkpoint #134

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 134 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 134 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 134 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 134 | 20.54s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 134 | 5.3s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 134 | 0.22s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 134 | 6.13s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 134 | 6.05s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 134 | 0.51s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 134 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 131 | 15.02s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 134 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 134 | 1.26s |
| native | `native.output_gate` | native | ✅ pass | 134 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 134 | 0.62s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 134 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 134 | 0.9s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 134 | 0.16s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 128 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 107 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 107 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 127 | 0.64s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 126 | 29.65s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 125 | 3.31s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 123 | 4.7s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 121 | 9.96s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 120 | 1.02s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 120 | 2.87s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 116 | 20.31s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 116 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 116 | 0.42s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 116 | 0.38s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 116 | 0.33s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 116 | 1.81s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 115 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 114 | 20.77s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 113 | 2.29s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 112 | 0.43s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 111 | 0.94s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 111 | 1.15s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 111 | 3.09s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 111 | 12.71s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 110 | 0.4s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 110 | 38.59s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 110 | 1.68s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 109 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 109 | 0.35s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 108 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 106 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 105 | 47.47s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 104 | 1.14s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 103 | 1.25s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 102 | 2.49s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 100 | 52.84s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 99 | 114.87s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 98 | 21.6s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 97 | 4.74s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 93 | 65.39s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 96 | 9.87s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 94 | 30.94s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 92 | 0.21s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 91 | 2.11s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 90 | 3.15s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 89 | 0.96s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 88 | 1.88s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 87 | 1.24s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 86 | 1.35s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 85 | 1.25s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 83 | 4.8s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 81 | 1.72s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 72 | 0.33s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 71 | 0.38s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 71 | 0.38s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 70 | 0.35s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 70 | 0.36s |
| research | `research.q59_time_generator` | native | ✅ pass | 68 | 0.46s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 66 | 9.95s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 65 | 36.6s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 63 | 10.9s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 62 | 13.65s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 57 | 17.82s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 51 | 11.67s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 45 | 38.53s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 41 | 17.37s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 39 | 18.49s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 69 | 0.46s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 68 | 0.77s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 78 | 4.79s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 77 | 1.66s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 76 | 0.68s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 75 | 1.77s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 74 | 0.56s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 73 | 3.99s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 72 | 0.46s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 60 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 59 | 0.35s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 58 | 0.29s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 58 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 58 | 0.23s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 57 | 1.16s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 56 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 56 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 56 | 15.67s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 56 | 0.25s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 56 | 0.32s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 54 | 0.64s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 53 | 0.53s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 52 | 0.85s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 50 | 2.05s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 48 | 0.59s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 46 | 2.5s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 44 | 7.8s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 42 | 0.69s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 38 | 10.34s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 37 | 17.18s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 36 | 3.07s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 36 | 1.96s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 31 | 21.23s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 26 | 22.2s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 15 | 19.17s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 36 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 36 | 76.2s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 34 | 0.26s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 32 | 0.33s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 30 | 0.92s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 29 | 0.33s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 28 | 0.85s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 27 | 0.33s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 25 | 0.53s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 23 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 23 | 1.6s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 23 | 6.17s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 23 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 22 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 22 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 21 | 0.63s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 21 | 0.19s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 20 | 5.35s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 19 | 1.37s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 16 | 20.37s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 16 | 20.42s |
| research | `research.q102_born_current` | conditional | ✅ pass | 16 | 20.85s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 16 | 21.1s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 14 | 27.25s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 13 | 2.62s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 13 | 22.73s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 12 | 22.59s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 11 | 23.1s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 8 | 24.38s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 8 | 26.63s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 9 | 24.89s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 8 | 37.96s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 8 | 37.72s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 7 | 0.31s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 4 | 37.88s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 5 | 1.6s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 3 | 0.73s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ❌ assertion_failed | 0 | 40.22s |

## Archive sweep

Executed at least once: **406/406** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 382.
This run: 274 executed (assertion_failed 1, missing_file 19, pass 254).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

