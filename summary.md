# Cathedral orchestrator — ✅ PASS

2026-11-13T06:40:11Z · [run 43377968012](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43377968012) · `dddb4f1` · push on `newtons-cathedral` · checkpoint #81

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 81 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 81 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 81 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 81 | 6.61s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 81 | 7.24s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 81 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 81 | 4.85s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 81 | 4.72s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 81 | 0.47s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 81 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 78 | 11.43s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 81 | 0.61s |
| native | `native.wilson_source` | native | ✅ pass | 81 | 1.62s |
| native | `native.output_gate` | native | ✅ pass | 81 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 81 | 0.39s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 81 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 81 | 0.63s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 81 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 75 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 54 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 54 | 0.15s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 74 | 1.01s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 73 | 41.68s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 72 | 4.58s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 70 | 6.51s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 68 | 13.83s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 67 | 1.68s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 67 | 4.5s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 63 | 29.17s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 63 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 63 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 63 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 63 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 63 | 2.56s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 62 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 61 | 28.25s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 60 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 59 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 58 | 1.4s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 58 | 238.95s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 58 | 4.72s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 58 | 17.8s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 57 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 57 | 54.31s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 57 | 2.27s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 56 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 56 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 55 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 53 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 52 | 66.94s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 51 | 1.54s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 50 | 1.69s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 49 | 3.38s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 47 | 86.58s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 46 | 154.4s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 45 | 31.31s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 44 | 6.91s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 40 | 92.54s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 43 | 14.46s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 41 | 45.68s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 39 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 38 | 2.86s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 37 | 4.24s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 36 | 1.25s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 35 | 2.63s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 34 | 1.72s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 33 | 1.85s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 32 | 1.69s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 30 | 6.64s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 28 | 2.49s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 19 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 18 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 18 | 0.51s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 17 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 17 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 15 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 13 | 13.81s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 12 | 51.05s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 10 | 15.01s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 9 | 18.79s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 4 | 24.1s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 16 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 15 | 0.98s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 25 | 5.42s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 24 | 1.95s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 23 | 0.82s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 22 | 2.41s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 21 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 20 | 5.43s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 19 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 7 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 6 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 5 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 5 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 5 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 4 | 1.58s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 3 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 3 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 3 | 18.45s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 3 | 0.28s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 3 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 1 | 0.78s |

**Changed since last run:** `research.q71_native_q3_clock` error → pass

## Archive sweep

Executed at least once: **350/350** research scripts. Latest status: missing_file 23, pass 326, timeout 1.
This run: 272 executed (missing_file 18, pass 254).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

