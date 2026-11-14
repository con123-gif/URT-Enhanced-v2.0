# Cathedral orchestrator — ✅ PASS

2026-11-14T06:10:45Z · [run 43563539537](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43563539537) · `af29564` · push on `newtons-cathedral` · checkpoint #112

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 112 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 112 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 112 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 112 | 16.69s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 112 | 6.21s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 112 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 112 | 3.37s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 112 | 3.23s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 112 | 0.3s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 112 | 0.24s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 109 | 8.13s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 112 | 0.44s |
| native | `native.wilson_source` | native | ✅ pass | 112 | 1.54s |
| native | `native.output_gate` | native | ✅ pass | 112 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 112 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 112 | 0.25s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 112 | 0.61s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 112 | 0.16s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 106 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 85 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 85 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 105 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 104 | 52.74s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 103 | 5.66s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 101 | 8.28s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 99 | 17.24s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 98 | 1.95s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 98 | 5.37s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 94 | 36.37s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 94 | 0.23s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 94 | 0.69s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 94 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 94 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 94 | 3.37s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 93 | 0.21s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 92 | 36.24s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 91 | 4.26s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 90 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 89 | 1.72s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 89 | 1.85s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 89 | 5.86s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 89 | 22.57s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 88 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 88 | 70.15s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 88 | 2.88s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 87 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 87 | 0.64s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 86 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 84 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 83 | 88.88s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 82 | 1.93s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 81 | 2.26s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 80 | 4.53s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 78 | 95.39s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 77 | 192.13s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 76 | 40.07s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 75 | 8.98s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 71 | 115.37s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 74 | 18.71s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 72 | 59.8s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 70 | 0.35s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 69 | 3.87s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 68 | 5.86s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 67 | 1.71s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 66 | 3.45s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 65 | 2.27s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 64 | 2.47s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 63 | 2.35s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 61 | 8.57s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 59 | 3.22s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 50 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 49 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 49 | 0.66s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 48 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 48 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 46 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 44 | 17.45s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 43 | 65.45s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 41 | 18.82s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 40 | 23.85s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 35 | 30.89s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 29 | 20.19s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 23 | 67.67s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 19 | 32.14s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 17 | 33.21s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 47 | 0.83s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 46 | 1.31s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 56 | 7.21s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 55 | 2.64s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 54 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 53 | 3.09s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 52 | 0.9s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 51 | 6.91s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 50 | 0.82s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 38 | 0.02s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 37 | 0.65s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 36 | 0.48s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 36 | 0.36s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 36 | 0.35s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 35 | 2.05s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 34 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 34 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 34 | 24.07s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 34 | 0.37s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 34 | 0.47s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 32 | 1.05s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 31 | 0.8s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 30 | 1.36s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 28 | 3.47s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 26 | 0.92s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 24 | 4.24s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 22 | 11.52s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 20 | 1.11s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 16 | 15.52s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 15 | 25.48s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 14 | 3.42s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 14 | 2.26s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 9 | 23.55s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 4 | 39.5s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 14 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 14 | 81.79s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 12 | 0.47s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 10 | 0.57s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 8 | 1.49s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 7 | 0.53s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 6 | 1.43s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 5 | 0.54s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 3 | 0.91s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 1 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 1 | 2.66s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 1 | 9.34s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 1 | 0.1s |

## Archive sweep

Executed at least once: **378/378** research scripts. Latest status: missing_file 23, pass 354, timeout 1.
This run: 64 executed (pass 63, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

