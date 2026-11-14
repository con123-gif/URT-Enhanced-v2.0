# Cathedral orchestrator — ✅ PASS

2026-11-14T09:33:51Z · [run 43579258220](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43579258220) · `ed794e2` · push on `newtons-cathedral` · checkpoint #122

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 122 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 122 | 0.01s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 122 | 0.28s |
| tests | `tests.suite` | regression | ✅ pass | 122 | 15.1s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 122 | 5.72s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 122 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 122 | 3.67s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 122 | 3.37s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 122 | 0.3s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 122 | 0.24s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 119 | 8.03s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 122 | 0.41s |
| native | `native.wilson_source` | native | ✅ pass | 122 | 1.5s |
| native | `native.output_gate` | native | ✅ pass | 122 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 122 | 0.74s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 122 | 0.4s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 122 | 1.0s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 122 | 0.14s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 116 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 95 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 95 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 115 | 0.82s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 114 | 34.88s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 113 | 3.72s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 111 | 5.59s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 109 | 11.4s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 108 | 1.42s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 108 | 3.85s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 104 | 24.15s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 104 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 104 | 0.48s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 104 | 0.44s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 104 | 0.36s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 104 | 2.2s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 103 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 102 | 23.88s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 101 | 2.61s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 100 | 0.45s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 99 | 1.1s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 99 | 1.64s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 99 | 4.1s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 99 | 14.83s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 98 | 0.45s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 98 | 43.16s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 98 | 1.89s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 97 | 0.13s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 97 | 0.46s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 96 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 94 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 93 | 66.31s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 92 | 1.27s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 91 | 1.4s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 90 | 2.75s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 88 | 87.54s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 87 | 153.75s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 86 | 25.9s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 85 | 5.42s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 81 | 89.99s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 84 | 11.24s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 82 | 35.34s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 80 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 79 | 2.33s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 78 | 3.48s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 77 | 1.06s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 76 | 2.15s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 75 | 1.42s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 74 | 1.52s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 73 | 1.42s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 71 | 5.5s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 69 | 2.06s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 60 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 59 | 0.42s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 59 | 0.41s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 58 | 0.37s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 58 | 0.38s |
| research | `research.q59_time_generator` | native | ✅ pass | 56 | 0.53s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 54 | 11.55s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 53 | 42.92s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 51 | 12.45s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 50 | 15.89s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 45 | 20.39s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 39 | 13.08s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 33 | 43.25s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 29 | 20.26s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 27 | 20.94s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 57 | 0.56s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 56 | 0.85s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 66 | 5.57s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 65 | 1.88s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 64 | 0.79s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 63 | 1.98s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 62 | 0.63s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 61 | 4.46s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 60 | 0.54s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 48 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 47 | 0.4s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 46 | 0.31s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 46 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 46 | 0.24s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 45 | 1.35s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 44 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 44 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 44 | 17.65s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 44 | 0.26s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 44 | 0.33s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 42 | 0.68s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 41 | 0.53s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 40 | 0.89s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 38 | 2.3s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 36 | 0.67s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 34 | 2.77s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 32 | 8.78s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 30 | 0.74s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 26 | 11.76s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 25 | 20.21s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 24 | 3.02s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 24 | 1.98s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 19 | 21.01s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 14 | 24.76s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 3 | 21.68s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 24 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 24 | 71.67s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 22 | 0.28s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 20 | 0.37s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 18 | 1.04s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 17 | 0.34s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 16 | 0.99s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 15 | 0.38s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 13 | 0.64s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 11 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 11 | 1.78s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 11 | 7.38s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 11 | 0.07s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 10 | 0.06s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 10 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 9 | 0.7s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 9 | 0.2s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 8 | 6.23s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 7 | 1.48s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 4 | 23.99s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 4 | 24.51s |
| research | `research.q102_born_current` | conditional | ✅ pass | 4 | 24.24s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 4 | 24.39s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 2 | 32.32s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 1 | 2.89s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 1 | 26.93s |

## Archive sweep

Executed at least once: **392/392** research scripts. Latest status: missing_file 23, pass 368, timeout 1.
This run: 173 executed (missing_file 5, pass 168).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

