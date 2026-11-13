# Cathedral orchestrator — ✅ PASS

2026-11-13T02:45:41Z · [run 43351340793](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43351340793) · `efcb7f3` · push on `newtons-cathedral` · checkpoint #75

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 75 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 75 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 75 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 75 | 7.27s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 75 | 10.95s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 75 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 75 | 3.98s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 75 | 3.37s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 75 | 0.38s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 75 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 72 | 8.42s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 75 | 0.48s |
| native | `native.wilson_source` | native | ✅ pass | 75 | 1.59s |
| native | `native.output_gate` | native | ✅ pass | 75 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 75 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 75 | 0.29s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 75 | 0.6s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 75 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 69 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 48 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 48 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 68 | 1.09s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 67 | 55.42s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 66 | 5.97s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 64 | 8.42s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 62 | 17.9s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 61 | 1.83s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 61 | 5.14s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 57 | 36.63s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 57 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 57 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 57 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 57 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 57 | 3.89s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 56 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 55 | 36.77s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 54 | 4.51s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 53 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 52 | 1.62s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 52 | 330.06s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 52 | 5.57s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 52 | 23.35s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 51 | 0.65s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 51 | 62.55s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 51 | 2.97s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 50 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 50 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 49 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 47 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 46 | 89.03s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 45 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 44 | 1.98s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 43 | 3.99s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 41 | 95.64s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 40 | 191.96s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 39 | 38.1s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 38 | 8.02s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 34 | 111.57s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 37 | 16.37s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 35 | 53.79s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 33 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 32 | 3.38s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 31 | 4.93s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 30 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 29 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 28 | 2.02s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 27 | 2.24s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 26 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 24 | 8.94s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 22 | 3.1s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 13 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 12 | 0.64s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 12 | 0.63s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 11 | 0.57s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 11 | 0.59s |
| research | `research.q59_time_generator` | native | ✅ pass | 9 | 0.83s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 7 | 17.97s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 6 | 67.66s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 4 | 19.44s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 3 | 24.27s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 10 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 9 | 1.42s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 19 | 8.52s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 18 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 17 | 1.12s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 16 | 3.15s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 15 | 0.9s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 14 | 7.14s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 13 | 0.95s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 1 | 0.01s |

## Archive sweep

Executed at least once: **338/338** research scripts. Latest status: missing_file 23, pass 314, timeout 1.
This run: 314 executed (missing_file 23, pass 290, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

