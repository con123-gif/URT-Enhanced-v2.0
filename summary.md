# Cathedral orchestrator — ✅ PASS

2026-11-13T00:36:47Z · [run 43335842260](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43335842260) · `0dd2ee0` · push on `newtons-cathedral` · checkpoint #73

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 73 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 73 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 73 | 0.19s |
| tests | `tests.suite` | regression | ✅ pass | 73 | 7.24s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 73 | 6.69s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 73 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 73 | 3.82s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 73 | 3.52s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 73 | 0.34s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 73 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 70 | 8.7s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 73 | 0.47s |
| native | `native.wilson_source` | native | ✅ pass | 73 | 1.8s |
| native | `native.output_gate` | native | ✅ pass | 73 | 0.16s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 73 | 0.3s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 73 | 0.2s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 73 | 0.47s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 73 | 0.06s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 67 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 46 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 46 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 66 | 0.9s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 65 | 41.88s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 64 | 4.53s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 62 | 6.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 60 | 13.65s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 59 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 59 | 4.34s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 55 | 28.47s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 55 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 55 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 55 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 55 | 0.43s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 55 | 2.61s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 54 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 53 | 28.35s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 52 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 51 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 50 | 1.4s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 50 | 247.99s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 50 | 4.8s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 50 | 17.9s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 49 | 0.52s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 49 | 53.24s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 49 | 2.42s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 48 | 0.17s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 48 | 0.51s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 47 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 45 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 44 | 67.7s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 43 | 1.58s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 42 | 1.85s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 41 | 3.52s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 39 | 86.8s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 38 | 154.46s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 37 | 31.18s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 36 | 6.99s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 32 | 95.3s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 35 | 14.53s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 33 | 46.44s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 31 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 30 | 2.98s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 29 | 4.5s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 28 | 1.3s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 27 | 2.71s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 26 | 1.76s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 25 | 1.91s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 24 | 1.82s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 22 | 6.68s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 20 | 2.53s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 11 | 0.46s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 10 | 0.53s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 10 | 0.55s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 9 | 0.48s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 9 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 7 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 5 | 13.94s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 4 | 51.42s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 2 | 15.15s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 1 | 18.75s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 8 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 7 | 0.98s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 17 | 5.46s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 16 | 1.93s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 15 | 0.82s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 14 | 2.42s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 13 | 0.69s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 12 | 5.48s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 11 | 0.62s |

## Archive sweep

Executed at least once: **337/337** research scripts. Latest status: missing_file 23, pass 313, timeout 1.
This run: 249 executed (missing_file 16, pass 233).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

