# Cathedral orchestrator — ✅ PASS

2026-11-12T21:15:27Z · [run 43305227424](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43305227424) · `906bae5` · schedule on `newtons-cathedral` · checkpoint #71

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 71 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 71 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 71 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 71 | 10.48s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 71 | 5.48s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 71 | 0.24s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 71 | 5.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 71 | 5.69s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 71 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 71 | 0.39s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 68 | 13.91s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 71 | 0.75s |
| native | `native.wilson_source` | native | ✅ pass | 71 | 1.04s |
| native | `native.output_gate` | native | ✅ pass | 71 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 71 | 0.58s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 71 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 71 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 71 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 65 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 44 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 44 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 64 | 0.84s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 63 | 41.73s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 62 | 4.4s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 60 | 6.47s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 58 | 14.14s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 57 | 1.57s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 57 | 4.25s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 53 | 28.17s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 53 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 53 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 53 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 53 | 0.4s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 53 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 52 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 51 | 28.39s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 50 | 3.37s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 49 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 48 | 1.35s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 48 | 239.62s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 48 | 4.65s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 48 | 17.78s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 47 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 47 | 57.33s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 47 | 2.27s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 46 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 46 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 45 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 43 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 42 | 68.29s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 41 | 1.57s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 40 | 1.81s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 39 | 3.61s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 37 | 87.08s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 36 | 153.32s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 35 | 30.92s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 34 | 7.02s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 30 | 89.39s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 33 | 14.5s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 31 | 46.58s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 29 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 28 | 2.98s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 27 | 4.44s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 26 | 1.33s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 25 | 2.75s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 24 | 1.84s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 23 | 1.98s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 22 | 1.77s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 20 | 6.75s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 18 | 2.51s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 9 | 0.43s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 8 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 8 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 7 | 0.44s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 7 | 0.45s |
| research | `research.q59_time_generator` | native | ✅ pass | 5 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 3 | 13.79s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 2 | 50.88s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 6 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 5 | 0.96s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 15 | 5.4s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 14 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 13 | 0.8s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 12 | 2.39s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 11 | 0.66s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 10 | 5.47s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 9 | 0.62s |

## Archive sweep

Executed at least once: **335/335** research scripts. Latest status: missing_file 23, pass 311, timeout 1.
This run: 121 executed (missing_file 4, pass 116, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

