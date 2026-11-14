# Cathedral orchestrator — ✅ PASS

2026-11-14T12:43:46Z · [run 43594263806](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43594263806) · `358e153` · push on `newtons-cathedral` · checkpoint #131

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 131 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 131 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 131 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 131 | 12.01s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 131 | 6.98s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 131 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 131 | 5.93s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 131 | 5.65s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 131 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 131 | 0.38s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 128 | 13.87s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 131 | 0.72s |
| native | `native.wilson_source` | native | ✅ pass | 131 | 1.44s |
| native | `native.output_gate` | native | ✅ pass | 131 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 131 | 0.52s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 131 | 0.3s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 131 | 0.67s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 131 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 125 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 104 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 104 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 124 | 0.65s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 123 | 28.84s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 122 | 3.12s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 120 | 4.53s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 118 | 9.57s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 117 | 1.02s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 117 | 2.86s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 113 | 20.24s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 113 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 113 | 0.41s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 113 | 0.39s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 113 | 0.33s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 113 | 1.75s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 112 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 111 | 20.09s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 110 | 2.23s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 109 | 0.4s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 108 | 0.88s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 108 | 1.91s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 108 | 3.02s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 108 | 12.43s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 107 | 0.42s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 107 | 36.89s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 107 | 1.57s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 106 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 106 | 0.34s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 105 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 103 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 102 | 76.88s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 101 | 1.08s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 100 | 1.19s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 99 | 2.36s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 97 | 103.04s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 96 | 185.31s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 95 | 20.58s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 94 | 4.57s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 90 | 112.18s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 93 | 9.26s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 91 | 29.48s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 89 | 0.2s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 88 | 1.99s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 87 | 2.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 86 | 0.9s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 85 | 1.82s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 84 | 1.2s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 83 | 1.31s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 82 | 1.2s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 80 | 4.76s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 78 | 1.71s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 69 | 0.33s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 68 | 0.37s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 68 | 0.37s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 67 | 0.33s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 67 | 0.34s |
| research | `research.q59_time_generator` | native | ✅ pass | 65 | 0.44s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 63 | 9.61s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 62 | 35.19s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 60 | 10.34s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 59 | 13.2s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 54 | 17.16s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 48 | 11.08s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 42 | 36.84s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 38 | 17.71s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 36 | 18.83s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 66 | 0.47s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 65 | 0.78s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 75 | 4.89s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 74 | 1.68s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 73 | 0.72s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 72 | 1.81s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 71 | 0.6s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 70 | 4.1s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 69 | 0.46s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 57 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 56 | 0.37s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 55 | 0.28s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 55 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 55 | 0.25s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 54 | 1.28s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 53 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 53 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 53 | 16.34s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 53 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 53 | 0.35s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 51 | 0.74s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 50 | 0.59s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 49 | 0.9s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 47 | 2.21s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 45 | 0.64s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 43 | 2.72s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 41 | 8.06s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 39 | 0.71s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 35 | 10.61s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 34 | 17.72s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 33 | 3.33s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 33 | 2.17s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 28 | 22.84s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 23 | 22.62s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 12 | 19.39s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 33 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 33 | 80.97s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 31 | 0.3s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 29 | 0.37s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 27 | 1.03s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 26 | 0.36s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 25 | 0.91s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 24 | 0.35s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 22 | 0.56s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 20 | 0.02s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 20 | 1.62s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 20 | 6.16s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 20 | 0.06s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 19 | 0.05s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 19 | 0.03s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 18 | 0.64s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 18 | 0.19s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 17 | 5.22s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 16 | 1.25s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 13 | 19.22s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 13 | 19.67s |
| research | `research.q102_born_current` | conditional | ✅ pass | 13 | 19.18s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 13 | 19.49s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 11 | 27.08s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 10 | 2.7s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 10 | 23.9s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 9 | 22.82s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 8 | 22.87s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 5 | 24.47s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 5 | 41.61s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 6 | 24.85s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 5 | 63.06s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 5 | 39.1s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 4 | 0.3s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 1 | 38.85s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 2 | 1.58s |

**Changed since last run:** `research.q115_native_a5_four_pole_source` assertion_failed → pass

## Archive sweep

Executed at least once: **404/404** research scripts. Latest status: missing_file 23, pass 380, timeout 1.
This run: 148 executed (missing_file 5, pass 143).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

