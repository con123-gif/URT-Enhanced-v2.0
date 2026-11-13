# Cathedral orchestrator — ✅ PASS

2026-11-13T02:21:09Z · [run 43348571401](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43348571401) · `0dd2ee0` · schedule on `newtons-cathedral` · checkpoint #74

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 74 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 74 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 74 | 0.38s |
| tests | `tests.suite` | regression | ✅ pass | 74 | 9.31s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 74 | 10.62s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 74 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 74 | 5.1s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 74 | 4.87s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 74 | 0.45s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 74 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 71 | 11.88s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 74 | 0.62s |
| native | `native.wilson_source` | native | ✅ pass | 74 | 1.61s |
| native | `native.output_gate` | native | ✅ pass | 74 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 74 | 0.49s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 74 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 74 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 74 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 68 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 47 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 47 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 67 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 66 | 54.17s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 65 | 5.8s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 63 | 8.35s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 61 | 17.44s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 60 | 1.86s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 60 | 5.16s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 56 | 36.33s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 56 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 56 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 56 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 56 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 56 | 3.92s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 55 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 54 | 36.5s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 53 | 4.51s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 52 | 0.71s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 51 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 51 | 331.05s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 51 | 5.65s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 51 | 22.93s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 50 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 50 | 61.25s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 50 | 3.01s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 49 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 49 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 48 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 46 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 45 | 86.86s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 44 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 43 | 2.01s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 42 | 3.98s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 40 | 95.78s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 39 | 192.62s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 38 | 37.98s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 37 | 8.05s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 33 | 112.97s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 36 | 16.45s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 34 | 53.67s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 32 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 31 | 3.39s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 30 | 4.97s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 29 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 28 | 3.1s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 27 | 2.05s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 26 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 25 | 2.06s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 23 | 8.95s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 21 | 3.1s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 12 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 11 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 11 | 0.67s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 10 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 10 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 8 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 6 | 17.91s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 5 | 69.69s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 3 | 18.94s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 2 | 24.0s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 9 | 0.97s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 8 | 1.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 18 | 8.58s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 17 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 16 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 15 | 3.08s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 14 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 13 | 7.0s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 12 | 0.95s |

## Archive sweep

Executed at least once: **337/337** research scripts. Latest status: missing_file 23, pass 313, timeout 1.
This run: 114 executed (missing_file 7, pass 106, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

