# Cathedral orchestrator — ✅ PASS

2026-11-14T06:35:58Z · [run 43565548795](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43565548795) · `8882d95` · push on `newtons-cathedral` · checkpoint #113

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 113 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 113 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 113 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 113 | 14.4s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 113 | 7.19s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 113 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 113 | 3.82s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 113 | 3.63s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 113 | 0.37s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 113 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 110 | 8.75s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 113 | 0.49s |
| native | `native.wilson_source` | native | ✅ pass | 113 | 1.65s |
| native | `native.output_gate` | native | ✅ pass | 113 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 113 | 0.53s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 113 | 0.32s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 113 | 0.76s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 113 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 107 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 86 | 0.3s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 86 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 106 | 1.18s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 105 | 55.12s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 104 | 5.87s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 102 | 8.48s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 100 | 18.16s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 99 | 1.87s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 99 | 5.33s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 95 | 36.66s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 95 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 95 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 95 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 95 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 95 | 3.97s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 94 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 93 | 36.52s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 92 | 4.53s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 91 | 0.71s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 90 | 1.65s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 90 | 1.84s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 90 | 5.71s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 90 | 23.09s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 89 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 89 | 61.98s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 89 | 2.93s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 88 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 88 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 87 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 85 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 84 | 88.57s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 83 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 82 | 1.99s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 81 | 3.95s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 79 | 96.16s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 78 | 191.47s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 77 | 38.02s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 76 | 8.12s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 72 | 112.96s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 75 | 16.53s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 73 | 54.01s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 71 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 70 | 3.4s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 69 | 4.99s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 68 | 1.57s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 67 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 66 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 65 | 2.27s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 64 | 2.07s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 62 | 8.96s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 60 | 3.13s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 51 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 50 | 0.67s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 50 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 49 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 49 | 0.61s |
| research | `research.q59_time_generator` | native | ✅ pass | 47 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 45 | 17.81s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 44 | 67.19s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 42 | 19.14s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 41 | 24.15s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 36 | 31.38s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 30 | 20.32s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 24 | 69.97s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 20 | 31.37s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 18 | 32.32s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 48 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 47 | 1.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 57 | 8.67s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 56 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 55 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 54 | 3.15s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 53 | 0.92s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 52 | 7.03s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 51 | 0.97s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 39 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 38 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 37 | 0.51s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 37 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 37 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 36 | 2.04s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 35 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 35 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 35 | 27.29s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 35 | 0.38s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 35 | 0.49s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 33 | 1.06s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 32 | 0.8s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 31 | 1.37s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 29 | 3.6s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 27 | 1.02s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 25 | 4.28s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 23 | 13.4s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 21 | 1.12s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 17 | 17.9s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 16 | 31.3s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 15 | 5.4s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 15 | 3.68s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 10 | 39.42s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 5 | 38.54s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 15 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 15 | 126.36s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 13 | 0.4s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 11 | 0.54s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 9 | 1.55s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 8 | 0.5s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 7 | 1.5s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 6 | 0.53s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 4 | 0.94s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 2 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 2 | 2.75s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 2 | 11.48s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 2 | 0.1s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 1 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 1 | 0.06s |

## Archive sweep

Executed at least once: **380/380** research scripts. Latest status: missing_file 23, pass 356, timeout 1.
This run: 335 executed (missing_file 23, pass 311, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

