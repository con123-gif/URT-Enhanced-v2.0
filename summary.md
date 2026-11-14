# Cathedral orchestrator — ✅ PASS

2026-11-14T07:37:44Z · [run 43570513889](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43570513889) · `2bcc184` · push on `newtons-cathedral` · checkpoint #116

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 116 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 116 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 116 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 116 | 20.31s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 116 | 10.87s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 116 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 116 | 5.3s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 116 | 4.69s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 116 | 0.43s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 116 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 113 | 11.61s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 116 | 0.65s |
| native | `native.wilson_source` | native | ✅ pass | 116 | 1.89s |
| native | `native.output_gate` | native | ✅ pass | 116 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 116 | 0.49s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 116 | 0.32s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 116 | 0.72s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 116 | 0.28s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 110 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 89 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 89 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 109 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 108 | 53.94s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 107 | 5.8s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 105 | 8.28s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 103 | 17.55s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 102 | 1.84s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 102 | 5.1s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 98 | 36.29s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 98 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 98 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 98 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 98 | 0.53s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 98 | 3.98s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 97 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 96 | 37.09s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 95 | 4.57s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 94 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 93 | 1.65s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 93 | 1.52s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 93 | 5.65s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 93 | 22.79s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 92 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 92 | 62.86s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 92 | 2.94s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 91 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 91 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 90 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 88 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 87 | 66.54s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 86 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 85 | 2.02s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 84 | 4.0s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 82 | 87.3s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 81 | 154.64s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 80 | 38.08s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 79 | 8.05s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 75 | 91.54s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 78 | 16.43s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 76 | 53.84s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 74 | 0.35s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 73 | 3.43s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 72 | 5.1s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 71 | 1.53s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 70 | 3.14s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 69 | 2.09s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 68 | 2.32s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 67 | 2.08s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 65 | 8.92s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 63 | 3.18s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 54 | 0.6s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 53 | 0.69s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 53 | 0.68s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 52 | 0.61s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 52 | 0.62s |
| research | `research.q59_time_generator` | native | ✅ pass | 50 | 0.85s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 48 | 17.85s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 47 | 66.28s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 45 | 18.94s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 44 | 23.61s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 39 | 31.09s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 33 | 20.23s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 27 | 69.32s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 23 | 30.94s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 21 | 32.02s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 51 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 50 | 1.46s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 60 | 8.75s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 59 | 2.86s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 58 | 1.25s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 57 | 3.15s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 56 | 0.99s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 55 | 7.04s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 54 | 0.95s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 42 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 41 | 0.65s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 40 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 40 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 40 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 39 | 2.0s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 38 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 38 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 38 | 26.85s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 38 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 38 | 0.45s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 36 | 0.98s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 35 | 0.76s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 34 | 1.31s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 32 | 3.48s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 30 | 0.96s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 28 | 4.17s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 26 | 13.24s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 24 | 1.11s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 20 | 18.39s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 19 | 31.11s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 18 | 5.27s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 18 | 3.58s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 13 | 36.3s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 8 | 37.61s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 18 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 18 | 124.18s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 16 | 0.39s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 14 | 0.52s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 12 | 1.53s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 11 | 0.47s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 10 | 1.45s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 9 | 0.52s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 7 | 0.91s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 5 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 5 | 2.68s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 5 | 11.45s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 5 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 4 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 4 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 3 | 1.07s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 3 | 0.29s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 2 | 9.7s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 1 | 2.37s |

## Archive sweep

Executed at least once: **384/384** research scripts. Latest status: missing_file 23, pass 360, timeout 1.
This run: 279 executed (missing_file 21, pass 258).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

