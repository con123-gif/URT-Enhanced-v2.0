# Cathedral orchestrator — ✅ PASS

2026-11-12T21:34:55Z · [run 43307649508](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43307649508) · `bfb7d11` · push on `newtons-cathedral` · checkpoint #72

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 72 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 72 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 72 | 0.2s |
| tests | `tests.suite` | regression | ✅ pass | 72 | 9.35s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 72 | 6.72s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 72 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 72 | 6.14s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 72 | 6.07s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 72 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 72 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 69 | 15.1s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 72 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 72 | 1.02s |
| native | `native.output_gate` | native | ✅ pass | 72 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 72 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 72 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 72 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 72 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 66 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 45 | 0.21s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 45 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 65 | 1.17s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 64 | 42.3s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 63 | 4.55s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 61 | 6.49s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 59 | 13.61s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 58 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 58 | 4.89s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 54 | 28.29s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 54 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 54 | 0.56s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 54 | 0.52s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 54 | 0.44s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 54 | 2.61s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 53 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 52 | 27.96s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 51 | 3.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 50 | 0.56s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 49 | 1.41s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 49 | 244.96s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 49 | 4.77s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 49 | 18.01s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 48 | 0.52s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 48 | 55.84s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 48 | 2.29s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 47 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 47 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 46 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 44 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 43 | 68.89s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 42 | 1.63s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 41 | 1.8s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 40 | 3.72s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 38 | 86.26s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 37 | 153.61s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 36 | 31.88s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 35 | 7.05s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 31 | 97.29s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 34 | 14.58s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 32 | 47.66s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 30 | 0.28s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 29 | 3.15s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 28 | 4.6s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 27 | 1.38s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 26 | 2.78s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 25 | 1.87s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 24 | 2.07s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 23 | 1.86s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 21 | 6.82s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 19 | 2.64s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 10 | 0.46s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 9 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 9 | 0.53s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 8 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 8 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 6 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 4 | 14.03s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 3 | 50.57s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 1 | 15.27s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 7 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 6 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 16 | 5.56s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 15 | 1.97s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 14 | 0.87s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 13 | 2.43s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 12 | 0.69s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 11 | 5.55s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 10 | 0.63s |

## Archive sweep

Executed at least once: **336/336** research scripts. Latest status: missing_file 23, pass 312, timeout 1.
This run: 243 executed (missing_file 19, pass 223, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

