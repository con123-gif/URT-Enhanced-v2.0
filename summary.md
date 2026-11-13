# Cathedral orchestrator — ✅ PASS

2026-11-13T07:35:00Z · [run 43384186150](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43384186150) · `3c70cfa` · push on `newtons-cathedral` · checkpoint #82

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 82 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 82 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 82 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 82 | 9.53s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 82 | 6.8s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 82 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 82 | 6.31s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 82 | 5.87s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 82 | 0.5s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 82 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 79 | 14.57s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 82 | 0.72s |
| native | `native.wilson_source` | native | ✅ pass | 82 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 82 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 82 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 82 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 82 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 82 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 76 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 55 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 55 | 0.05s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 75 | 1.05s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 74 | 48.91s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 73 | 4.97s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 71 | 7.45s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 69 | 15.24s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 68 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 68 | 5.01s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 64 | 31.99s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 64 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 64 | 0.65s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 64 | 0.59s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 64 | 0.49s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 64 | 2.91s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 63 | 0.19s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 62 | 31.35s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 61 | 3.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 60 | 0.6s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 59 | 1.42s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 59 | 249.77s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 59 | 5.22s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 59 | 19.91s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 58 | 0.6s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 58 | 54.47s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 58 | 2.5s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 57 | 0.19s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 57 | 0.59s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 56 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 54 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 53 | 75.45s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 52 | 1.62s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 51 | 1.75s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 50 | 3.43s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 48 | 68.63s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 47 | 180.73s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 46 | 34.6s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 45 | 6.22s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 41 | 101.41s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 44 | 12.31s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 42 | 40.26s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 40 | 0.3s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 39 | 2.91s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 38 | 4.45s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 37 | 1.38s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 36 | 2.71s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 35 | 1.8s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 34 | 1.92s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 33 | 1.78s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 31 | 7.26s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 29 | 2.64s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 20 | 0.5s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 19 | 0.58s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 19 | 0.57s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 18 | 0.5s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 18 | 0.52s |
| research | `research.q59_time_generator` | native | ✅ pass | 16 | 0.7s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 14 | 15.27s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 13 | 56.77s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 11 | 16.63s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 10 | 21.11s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 5 | 27.41s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 17 | 0.73s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 16 | 1.13s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 26 | 7.49s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 25 | 2.51s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 24 | 1.04s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 23 | 2.62s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 22 | 0.85s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 21 | 5.97s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 20 | 0.71s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 8 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 7 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 6 | 0.41s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 6 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 6 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 5 | 1.77s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 4 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 4 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 4 | 24.09s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 4 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 4 | 0.43s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 2 | 0.89s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 1 | 0.69s |

## Archive sweep

Executed at least once: **351/351** research scripts. Latest status: missing_file 23, pass 328.
This run: 264 executed (missing_file 10, pass 254).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

