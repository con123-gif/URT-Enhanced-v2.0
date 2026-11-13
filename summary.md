# Cathedral orchestrator — ✅ PASS

2026-11-13T04:39:11Z · [run 43361957868](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43361957868) · `70c81f9` · push on `newtons-cathedral` · checkpoint #77

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 77 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 77 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 77 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 77 | 9.77s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 77 | 7.09s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 77 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 77 | 6.66s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 77 | 6.01s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 77 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 77 | 0.42s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 74 | 14.89s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 77 | 0.74s |
| native | `native.wilson_source` | native | ✅ pass | 77 | 1.64s |
| native | `native.output_gate` | native | ✅ pass | 77 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 77 | 0.63s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 77 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 77 | 0.92s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 77 | 0.15s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 71 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 50 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 50 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 70 | 1.2s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 69 | 55.62s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 68 | 5.95s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 66 | 8.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 64 | 18.12s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 63 | 1.94s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 63 | 5.3s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 59 | 36.87s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 59 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 59 | 0.74s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 59 | 0.69s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 59 | 0.56s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 59 | 3.97s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 58 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 57 | 36.94s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 56 | 4.56s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 55 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 54 | 1.66s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 54 | 328.38s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 54 | 5.61s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 54 | 23.83s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 53 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 53 | 61.97s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 53 | 3.04s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 52 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 52 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 51 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 49 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 48 | 89.45s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 47 | 1.83s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 46 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 45 | 3.99s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 43 | 95.34s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 42 | 192.94s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 41 | 38.33s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 40 | 8.06s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 36 | 116.32s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 39 | 16.39s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 37 | 53.8s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 35 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 34 | 3.4s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 33 | 4.99s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 32 | 1.52s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 31 | 3.12s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 30 | 2.09s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 29 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 28 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 26 | 8.88s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 24 | 3.11s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 15 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 14 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 14 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 13 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 13 | 0.59s |
| research | `research.q59_time_generator` | native | ✅ pass | 11 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 9 | 18.13s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 8 | 67.71s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 6 | 19.51s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 5 | 24.32s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 12 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 11 | 1.43s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 21 | 8.53s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 20 | 2.79s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 19 | 1.16s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 18 | 3.19s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 17 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 16 | 7.21s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 15 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 3 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 2 | 0.67s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 1 | 0.52s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 1 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 1 | 0.32s |

## Archive sweep

Executed at least once: **342/342** research scripts. Latest status: missing_file 23, pass 317, timeout 2.
This run: 231 executed (missing_file 18, pass 212, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q36_star_intertwiner/q36_exact_star_intertwiners.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

