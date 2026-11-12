# Cathedral orchestrator — ✅ PASS

2026-11-12T12:51:53Z · [run 43217184568](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43217184568) · `daf7afe` · push on `newtons-cathedral` · checkpoint #67

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 67 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 67 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 67 | 0.52s |
| tests | `tests.suite` | regression | ✅ pass | 67 | 7.1s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 67 | 11.15s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 67 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 67 | 5.42s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 67 | 4.69s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 67 | 0.45s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 67 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 64 | 11.67s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 67 | 0.64s |
| native | `native.wilson_source` | native | ✅ pass | 67 | 1.53s |
| native | `native.output_gate` | native | ✅ pass | 67 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 67 | 0.55s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 67 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 67 | 0.82s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 67 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 61 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 40 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 40 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 60 | 0.87s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 59 | 41.48s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 58 | 4.4s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 56 | 6.43s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 54 | 13.4s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 53 | 1.59s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 53 | 4.33s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 49 | 28.19s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 49 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 49 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 49 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 49 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 49 | 2.63s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 48 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 47 | 27.9s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 46 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 45 | 0.53s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 44 | 1.37s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 44 | 240.81s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 44 | 4.7s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 44 | 17.65s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 43 | 0.52s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 43 | 56.3s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 43 | 2.23s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 42 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 42 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 41 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 39 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 38 | 66.41s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 37 | 1.63s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 36 | 1.79s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 35 | 3.67s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 33 | 87.33s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 32 | 153.92s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 31 | 31.5s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 30 | 7.05s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 26 | 96.68s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 29 | 14.52s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 27 | 46.74s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 25 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 24 | 3.05s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 23 | 4.4s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 22 | 1.31s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 21 | 2.72s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 20 | 1.83s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 19 | 1.94s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 18 | 1.83s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 16 | 6.77s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 14 | 2.56s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 5 | 0.46s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 4 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 4 | 0.52s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 3 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 3 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 1 | 0.64s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 2 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 1 | 0.98s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 11 | 5.49s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 10 | 1.93s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 9 | 0.83s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 8 | 2.41s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 7 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 6 | 5.39s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 5 | 0.62s |

## Archive sweep

Executed at least once: **333/333** research scripts. Latest status: missing_file 23, pass 309, timeout 1.
This run: 140 executed (missing_file 4, pass 135, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

