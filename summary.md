# Cathedral orchestrator — ✅ PASS

2026-11-13T05:24:13Z · [run 43368642230](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43368642230) · `af5063c` · push on `newtons-cathedral` · checkpoint #79

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 79 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 79 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 79 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 79 | 6.89s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 79 | 10.66s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 79 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 79 | 6.52s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 79 | 5.64s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 79 | 0.51s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 79 | 0.38s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 76 | 13.99s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 79 | 0.75s |
| native | `native.wilson_source` | native | ✅ pass | 79 | 1.42s |
| native | `native.output_gate` | native | ✅ pass | 79 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 79 | 0.54s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 79 | 0.32s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 79 | 0.8s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 79 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 73 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 52 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 52 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 72 | 1.09s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 71 | 54.78s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 70 | 5.82s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 68 | 8.41s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 66 | 17.75s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 65 | 1.87s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 65 | 5.35s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 61 | 36.71s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 61 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 61 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 61 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 61 | 0.56s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 61 | 3.98s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 60 | 0.25s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 59 | 36.61s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 58 | 4.54s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 57 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 56 | 1.65s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 56 | 331.54s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 56 | 5.79s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 56 | 23.25s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 55 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 55 | 62.46s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 55 | 2.96s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 54 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 54 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 53 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 51 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 50 | 88.66s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 49 | 1.85s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 48 | 2.02s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 47 | 3.99s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 45 | 96.02s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 44 | 193.53s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 43 | 37.93s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 42 | 8.08s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 38 | 116.2s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 41 | 16.47s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 39 | 53.72s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 37 | 0.37s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 36 | 3.44s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 35 | 4.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 34 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 33 | 3.1s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 32 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 31 | 2.25s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 30 | 2.06s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 28 | 8.92s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 26 | 3.11s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 17 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 16 | 0.67s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 16 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 15 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 15 | 0.61s |
| research | `research.q59_time_generator` | native | ✅ pass | 13 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 11 | 17.78s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 10 | 67.99s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 8 | 19.11s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 7 | 23.92s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 2 | 31.39s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 14 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 13 | 1.43s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 23 | 8.61s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 22 | 2.81s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 21 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 20 | 3.17s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 19 | 0.93s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 18 | 7.08s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 17 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 5 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 4 | 0.66s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 3 | 0.51s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 3 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 3 | 0.32s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 2 | 2.02s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 1 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 1 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 1 | 27.52s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 1 | 0.35s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 1 | 0.46s |

## Archive sweep

Executed at least once: **349/349** research scripts. Latest status: missing_file 23, pass 325, timeout 1.
This run: 150 executed (missing_file 5, pass 144, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

