# Cathedral orchestrator — ✅ PASS

2026-11-14T04:54:17Z · [run 43556032333](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43556032333) · `c10a539` · push on `newtons-cathedral` · checkpoint #109

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 109 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 109 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 109 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 109 | 16.49s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 109 | 11.0s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 109 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 109 | 3.45s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 109 | 3.23s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 109 | 0.32s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 109 | 0.25s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 106 | 7.92s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 109 | 0.42s |
| native | `native.wilson_source` | native | ✅ pass | 109 | 1.69s |
| native | `native.output_gate` | native | ✅ pass | 109 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 109 | 0.49s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 109 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 109 | 0.67s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 109 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 103 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 82 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 82 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 102 | 0.87s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 101 | 41.37s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 100 | 4.37s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 98 | 6.44s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 96 | 13.45s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 95 | 1.64s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 95 | 4.52s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 91 | 28.16s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 91 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 91 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 91 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 91 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 91 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 90 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 89 | 28.41s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 88 | 3.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 87 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 86 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 86 | 1.16s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 86 | 4.74s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 86 | 17.4s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 85 | 0.57s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 85 | 54.66s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 85 | 2.26s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 84 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 84 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 83 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 81 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 80 | 50.01s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 79 | 1.56s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 78 | 1.74s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 77 | 3.48s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 75 | 55.71s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 74 | 120.64s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 73 | 31.86s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 72 | 7.01s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 68 | 74.37s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 71 | 14.53s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 69 | 46.17s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 67 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 66 | 2.9s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 65 | 4.44s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 64 | 1.32s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 63 | 2.7s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 62 | 1.75s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 61 | 1.89s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 60 | 1.76s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 58 | 6.73s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 56 | 2.55s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 47 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 46 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 46 | 0.53s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 45 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 45 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 43 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 41 | 13.79s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 40 | 50.99s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 38 | 14.87s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 37 | 18.58s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 32 | 24.21s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 26 | 15.59s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 20 | 52.76s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 16 | 25.12s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 14 | 25.85s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 44 | 0.65s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 43 | 1.0s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 53 | 5.53s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 52 | 1.99s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 51 | 0.85s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 50 | 2.39s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 49 | 0.72s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 48 | 5.42s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 47 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 35 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 34 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 33 | 0.39s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 33 | 0.29s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 33 | 0.29s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 32 | 1.61s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 31 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 31 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 31 | 19.02s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 31 | 0.29s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 31 | 0.38s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 29 | 0.82s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 28 | 0.63s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 27 | 1.06s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 25 | 2.69s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 23 | 0.71s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 21 | 3.24s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 19 | 8.61s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 17 | 0.87s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 13 | 11.8s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 12 | 19.58s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 11 | 5.34s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 11 | 3.57s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 6 | 36.66s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 1 | 30.48s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 11 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 11 | 125.31s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 9 | 0.32s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 7 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 5 | 1.1s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 4 | 0.38s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 3 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 2 | 0.4s |

## Archive sweep

Executed at least once: **373/373** research scripts. Latest status: missing_file 23, pass 349, timeout 1.
This run: 334 executed (missing_file 23, pass 311).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

