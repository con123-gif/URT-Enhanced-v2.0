# Cathedral orchestrator — ✅ PASS

2026-11-13T04:58:38Z · [run 43364625150](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43364625150) · `31e8eae` · push on `newtons-cathedral` · checkpoint #78

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 78 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 78 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 78 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 78 | 9.55s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 78 | 5.45s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 78 | 0.27s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 78 | 4.15s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 78 | 3.91s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 78 | 0.36s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 78 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 75 | 9.55s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 78 | 0.53s |
| native | `native.wilson_source` | native | ✅ pass | 78 | 1.19s |
| native | `native.output_gate` | native | ✅ pass | 78 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 78 | 0.33s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 78 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 78 | 0.48s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 78 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 72 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 51 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 51 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 71 | 0.68s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 70 | 29.33s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 69 | 3.14s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 67 | 4.61s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 65 | 9.65s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 64 | 1.01s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 64 | 2.81s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 60 | 20.25s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 60 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 60 | 0.42s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 60 | 0.39s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 60 | 0.34s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 60 | 1.79s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 59 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 58 | 20.03s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 57 | 2.25s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 56 | 0.42s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 55 | 0.91s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 55 | 155.92s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 55 | 3.08s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 55 | 12.59s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 54 | 0.46s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 54 | 38.23s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 54 | 1.66s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 53 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 53 | 0.35s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 52 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 50 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 49 | 49.25s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 48 | 1.14s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 47 | 1.25s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 46 | 2.45s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 44 | 54.56s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 43 | 119.41s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 42 | 21.92s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 41 | 4.92s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 37 | 77.63s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 40 | 9.93s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 38 | 31.12s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 36 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 35 | 2.14s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 34 | 3.13s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 33 | 0.96s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 32 | 1.97s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 31 | 1.3s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 30 | 1.42s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 29 | 1.3s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 27 | 5.02s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 25 | 1.86s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 16 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 15 | 0.44s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 15 | 0.43s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 14 | 0.39s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 14 | 0.4s |
| research | `research.q59_time_generator` | native | ✅ pass | 12 | 0.5s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 10 | 10.42s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 9 | 36.62s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 7 | 11.05s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 6 | 13.74s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 1 | 17.45s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 13 | 0.44s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 12 | 0.71s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 22 | 4.43s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 21 | 1.45s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 20 | 0.63s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 19 | 1.67s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 18 | 0.53s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 17 | 3.86s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 16 | 0.46s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 4 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 3 | 0.34s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 2 | 0.28s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 2 | 0.2s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 2 | 0.19s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 1 | 1.07s |

## Archive sweep

Executed at least once: **344/344** research scripts. Latest status: missing_file 23, pass 320, timeout 1.
This run: 307 executed (missing_file 23, pass 284).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-10_induced_photon/INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

