# Cathedral orchestrator — ✅ PASS

2026-11-14T00:37:03Z · [run 43533270207](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43533270207) · `e7626a5` · push on `newtons-cathedral` · checkpoint #103

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 103 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 103 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 103 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 103 | 18.04s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 103 | 5.27s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 103 | 0.22s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 103 | 4.77s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 103 | 4.73s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 103 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 103 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 100 | 11.59s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 103 | 0.6s |
| native | `native.wilson_source` | native | ✅ pass | 103 | 1.9s |
| native | `native.output_gate` | native | ✅ pass | 103 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 103 | 0.32s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 103 | 0.2s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 103 | 0.49s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 103 | 0.06s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 97 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 76 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 76 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 96 | 0.72s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 95 | 31.97s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 94 | 3.45s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 92 | 5.03s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 90 | 10.32s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 89 | 1.08s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 89 | 3.0s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 85 | 21.9s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 85 | 0.15s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 85 | 0.47s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 85 | 0.46s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 85 | 0.38s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 85 | 1.93s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 84 | 0.13s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 83 | 21.86s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 82 | 2.5s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 81 | 0.5s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 80 | 1.06s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 80 | 1.22s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 80 | 3.5s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 80 | 13.85s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 79 | 0.49s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 79 | 39.97s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 79 | 1.67s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 78 | 0.13s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 78 | 0.42s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 77 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 75 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 74 | 50.96s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 73 | 1.22s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 72 | 1.33s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 71 | 2.59s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 69 | 56.75s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 68 | 123.82s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 67 | 22.83s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 66 | 5.15s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 62 | 82.83s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 65 | 10.41s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 63 | 32.35s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 61 | 0.22s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 60 | 2.21s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 59 | 3.24s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 58 | 1.02s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 57 | 2.02s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 56 | 1.31s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 55 | 1.41s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 54 | 1.28s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 52 | 5.14s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 50 | 1.91s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 41 | 0.38s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 40 | 0.42s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 40 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 39 | 0.4s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 39 | 0.39s |
| research | `research.q59_time_generator` | native | ✅ pass | 37 | 0.5s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 35 | 10.43s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 34 | 37.41s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 32 | 11.32s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 31 | 14.26s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 26 | 18.61s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 20 | 12.31s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 14 | 40.15s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 10 | 18.48s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 8 | 18.78s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 38 | 0.47s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 37 | 0.79s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 47 | 5.02s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 46 | 1.58s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 45 | 0.68s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 44 | 1.79s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 43 | 0.55s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 42 | 4.15s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 41 | 0.47s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 29 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 28 | 0.37s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 27 | 0.29s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 27 | 0.23s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 27 | 0.22s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 26 | 1.24s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 25 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 25 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 25 | 16.0s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 25 | 0.22s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 25 | 0.28s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 23 | 0.62s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 22 | 0.5s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 21 | 0.85s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 19 | 2.06s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 17 | 0.57s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 15 | 2.49s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 13 | 7.58s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 11 | 0.66s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 7 | 10.57s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 6 | 17.59s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 5 | 3.24s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 5 | 2.13s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 5 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 5 | 78.81s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 3 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 1 | 0.33s |

## Archive sweep

Executed at least once: **367/367** research scripts. Latest status: missing_file 23, pass 343, timeout 1.
This run: 277 executed (missing_file 18, pass 259).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

