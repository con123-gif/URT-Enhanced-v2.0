# Cathedral orchestrator — ❌ FAIL

2026-11-13T05:44:14Z · [run 43371071858](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43371071858) · `b26be54` · push on `newtons-cathedral` · checkpoint #80

**Gating failures:** `research.q71_native_q3_clock`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 80 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 80 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 80 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 80 | 5.4s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 80 | 10.66s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 80 | 0.36s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 80 | 6.31s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 80 | 5.97s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 80 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 80 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 77 | 14.68s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 80 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 80 | 0.98s |
| native | `native.output_gate` | native | ✅ pass | 80 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 80 | 0.37s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 80 | 0.24s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 80 | 0.55s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 80 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 74 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 53 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 53 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 73 | 0.94s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 72 | 41.45s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 71 | 4.48s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 69 | 6.46s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 67 | 13.79s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 66 | 1.61s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 66 | 4.77s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 62 | 28.09s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 62 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 62 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 62 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 62 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 62 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 61 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 60 | 28.1s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 59 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 58 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 57 | 1.37s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 57 | 239.71s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 57 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 57 | 17.7s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 56 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 56 | 49.54s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 56 | 2.22s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 55 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 55 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 54 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 52 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 51 | 67.14s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 50 | 1.43s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 49 | 1.62s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 48 | 3.19s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 46 | 85.04s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 45 | 153.47s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 44 | 30.92s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 43 | 6.78s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 39 | 90.31s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 42 | 14.32s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 40 | 45.29s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 38 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 37 | 2.7s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 36 | 3.89s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 35 | 1.17s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 34 | 2.47s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 33 | 1.63s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 32 | 1.79s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 31 | 1.66s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 29 | 6.54s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 27 | 2.41s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 18 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 17 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 17 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 16 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 16 | 0.46s |
| research | `research.q59_time_generator` | native | ✅ pass | 14 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 12 | 13.78s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 11 | 51.76s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 9 | 14.74s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 8 | 18.61s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 3 | 24.01s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 15 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 14 | 0.97s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 24 | 5.4s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 23 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 22 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 21 | 2.4s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 20 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 19 | 5.47s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 18 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 6 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 5 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 4 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 4 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 4 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 3 | 1.59s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 2 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 2 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 2 | 18.32s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 2 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 2 | 0.35s |
| research | `research.q71_native_q3_clock` | native | ❌ error — SyntaxError: invalid syntax | 0 | 0.01s |

## Archive sweep

Executed at least once: **350/350** research scripts. Latest status: error 1, missing_file 23, pass 325, timeout 1.
This run: 224 executed (error 1, missing_file 18, pass 204, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

