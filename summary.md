# Cathedral orchestrator — ❌ FAIL

2026-11-14T12:24:46Z · [run 43591695561](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43591695561) · `f75d726` · push on `newtons-cathedral` · checkpoint #130

**Gating failures:** `research.q115_native_a5_four_pole_source`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 130 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 130 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 130 | 0.16s |
| tests | `tests.suite` | regression | ✅ pass | 130 | 20.74s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 130 | 7.07s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 130 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 130 | 6.3s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 130 | 5.98s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 130 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 130 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 127 | 14.8s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 130 | 0.79s |
| native | `native.wilson_source` | native | ✅ pass | 130 | 1.55s |
| native | `native.output_gate` | native | ✅ pass | 130 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 130 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 130 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 130 | 0.83s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 130 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 124 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 103 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 103 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 123 | 0.96s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 122 | 41.03s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 121 | 4.39s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 119 | 6.41s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 117 | 13.32s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 116 | 1.58s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 116 | 4.32s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 112 | 28.0s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 112 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 112 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 112 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 112 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 112 | 2.64s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 111 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 110 | 27.73s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 109 | 3.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 108 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 107 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 107 | 1.25s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 107 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 107 | 21.64s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 106 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 106 | 50.96s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 106 | 2.25s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 105 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 105 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 104 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 102 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 101 | 49.34s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 100 | 1.47s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 99 | 1.64s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 98 | 3.3s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 96 | 54.96s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 95 | 118.36s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 94 | 31.31s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 93 | 6.86s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 89 | 66.33s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 92 | 14.41s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 90 | 45.4s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 88 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 87 | 2.76s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 86 | 3.98s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 85 | 1.23s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 84 | 2.52s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 83 | 1.66s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 82 | 1.82s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 81 | 1.66s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 79 | 6.66s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 77 | 2.41s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 68 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 67 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 67 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 66 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 66 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 64 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 62 | 13.62s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 61 | 51.01s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 59 | 14.67s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 58 | 18.42s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 53 | 23.81s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 47 | 15.46s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 41 | 52.23s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 37 | 24.72s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 35 | 25.47s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 65 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 64 | 0.97s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 74 | 5.44s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 73 | 1.93s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 72 | 0.82s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 71 | 2.38s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 70 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 69 | 5.37s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 68 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 56 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 55 | 0.5s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 54 | 0.38s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 54 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 54 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 53 | 1.56s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 52 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 52 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 52 | 18.34s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 52 | 0.3s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 52 | 0.37s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 50 | 0.81s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 49 | 0.62s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 48 | 1.04s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 46 | 2.7s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 44 | 0.73s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 42 | 3.25s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 40 | 8.52s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 38 | 0.87s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 34 | 12.07s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 33 | 19.77s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 32 | 5.44s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 32 | 3.62s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 27 | 36.79s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 22 | 30.23s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 11 | 26.63s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 32 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 32 | 126.02s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 30 | 0.32s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 28 | 0.42s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 26 | 1.11s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 25 | 0.38s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 24 | 1.09s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 23 | 0.41s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 21 | 0.7s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 19 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 19 | 2.03s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 19 | 7.38s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 19 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 18 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 18 | 0.05s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 17 | 0.78s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 17 | 0.24s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 16 | 6.64s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 15 | 1.8s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 12 | 24.13s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 12 | 24.17s |
| research | `research.q102_born_current` | conditional | ✅ pass | 12 | 23.85s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 12 | 23.92s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 10 | 32.47s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 9 | 3.37s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 9 | 26.85s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 8 | 27.44s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 7 | 27.52s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 4 | 30.09s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 4 | 27.35s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 5 | 30.78s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 4 | 38.85s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 4 | 53.13s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 3 | 0.4s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ❌ assertion_failed — Counter({(5, 4): 24, (3, 4): 20, (2, 0): 15, (1, 64): 1}) | 0 | 52.94s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 1 | 2.12s |

## Archive sweep

Executed at least once: **403/403** research scripts. Latest status: assertion_failed 1, missing_file 23, pass 378, timeout 1.
This run: 256 executed (missing_file 18, pass 237, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

