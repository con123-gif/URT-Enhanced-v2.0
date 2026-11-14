# Cathedral orchestrator — ✅ PASS

2026-11-14T09:14:27Z · [run 43577228971](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43577228971) · `8d6dee6` · push on `newtons-cathedral` · checkpoint #121

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 121 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 121 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 121 | 0.28s |
| tests | `tests.suite` | regression | ✅ pass | 121 | 21.59s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 121 | 10.8s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 121 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 121 | 5.79s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 121 | 5.59s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 121 | 0.47s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 121 | 0.37s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 118 | 13.86s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 121 | 0.71s |
| native | `native.wilson_source` | native | ✅ pass | 121 | 1.44s |
| native | `native.output_gate` | native | ✅ pass | 121 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 121 | 0.47s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 121 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 121 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 121 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 115 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 94 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 94 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 114 | 1.16s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 113 | 53.97s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 112 | 5.83s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 110 | 8.35s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 108 | 17.61s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 107 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 107 | 5.44s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 103 | 36.51s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 103 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 103 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 103 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 103 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 103 | 3.86s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 102 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 101 | 36.49s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 100 | 4.45s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 99 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 98 | 1.63s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 98 | 1.88s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 98 | 5.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 98 | 22.92s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 97 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 97 | 61.02s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 97 | 2.91s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 96 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 96 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 95 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 93 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 92 | 89.2s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 91 | 1.83s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 90 | 1.99s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 89 | 3.99s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 87 | 95.96s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 86 | 193.99s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 85 | 37.94s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 84 | 8.06s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 80 | 115.16s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 83 | 16.41s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 81 | 53.55s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 79 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 78 | 3.37s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 77 | 5.01s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 76 | 1.52s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 75 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 74 | 2.09s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 73 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 72 | 2.07s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 70 | 8.88s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 68 | 3.12s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 59 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 58 | 0.67s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 58 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 57 | 0.6s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 57 | 0.62s |
| research | `research.q59_time_generator` | native | ✅ pass | 55 | 0.83s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 53 | 17.69s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 52 | 67.03s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 50 | 19.05s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 49 | 23.58s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 44 | 31.03s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 38 | 20.13s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 32 | 68.55s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 28 | 30.93s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 26 | 32.96s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 56 | 0.97s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 55 | 1.43s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 65 | 8.53s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 64 | 2.82s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 63 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 62 | 3.12s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 61 | 0.93s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 60 | 6.99s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 59 | 0.94s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 47 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 46 | 0.65s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 45 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 45 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 45 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 44 | 2.05s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 43 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 43 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 43 | 27.23s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 43 | 0.35s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 43 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 41 | 1.0s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 40 | 0.77s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 39 | 1.33s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 37 | 3.56s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 35 | 0.97s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 33 | 4.29s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 31 | 13.29s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 29 | 1.1s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 25 | 18.21s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 24 | 30.64s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 23 | 5.24s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 23 | 3.51s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 18 | 36.04s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 13 | 37.99s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 2 | 33.34s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 23 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 23 | 123.9s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 21 | 0.41s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 19 | 0.53s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 17 | 1.55s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 16 | 0.49s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 15 | 1.48s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 14 | 0.55s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 12 | 0.93s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 10 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 10 | 2.74s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 10 | 11.48s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 10 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 9 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 9 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 8 | 1.04s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 8 | 0.29s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 7 | 9.76s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 6 | 2.41s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 3 | 37.83s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 3 | 38.47s |
| research | `research.q102_born_current` | conditional | ✅ pass | 3 | 38.16s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 3 | 38.45s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 1 | 50.96s |

## Archive sweep

Executed at least once: **390/390** research scripts. Latest status: missing_file 23, pass 366, timeout 1.
This run: 352 executed (missing_file 23, pass 328, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

