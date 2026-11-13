# Cathedral orchestrator — ✅ PASS

2026-11-13T17:08:07Z · [run 43465125597](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43465125597) · `9f09cce` · push on `newtons-cathedral` · checkpoint #94

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 94 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 94 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 94 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 94 | 8.98s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 94 | 6.99s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 94 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 94 | 6.29s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 94 | 6.11s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 94 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 94 | 0.39s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 91 | 15.03s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 94 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 94 | 1.45s |
| native | `native.output_gate` | native | ✅ pass | 94 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 94 | 0.33s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 94 | 0.22s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 94 | 0.51s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 94 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 88 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 67 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 67 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 87 | 1.19s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 86 | 52.98s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 85 | 5.64s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 83 | 8.22s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 81 | 17.18s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 80 | 1.91s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 80 | 5.41s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 76 | 36.23s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 76 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 76 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 76 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 76 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 76 | 3.82s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 75 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 74 | 36.28s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 73 | 4.43s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 72 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 71 | 1.61s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 71 | 323.36s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 71 | 5.55s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 71 | 22.88s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 70 | 0.65s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 70 | 61.27s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 70 | 2.85s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 69 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 69 | 0.6s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 68 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 66 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 65 | 86.36s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 64 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 63 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 62 | 3.92s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 60 | 95.34s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 59 | 191.97s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 58 | 37.63s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 57 | 7.99s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 53 | 106.75s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 56 | 16.33s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 54 | 53.44s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 52 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 51 | 3.34s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 50 | 4.94s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 49 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 48 | 3.04s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 47 | 2.01s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 46 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 45 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 43 | 8.85s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 41 | 3.07s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 32 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 31 | 0.64s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 31 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 30 | 0.57s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 30 | 0.59s |
| research | `research.q59_time_generator` | native | ✅ pass | 28 | 0.8s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 26 | 17.51s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 25 | 66.25s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 23 | 18.7s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 22 | 23.25s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 17 | 30.57s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 11 | 19.75s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 5 | 68.46s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 1 | 30.65s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 29 | 0.97s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 28 | 1.43s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 38 | 8.49s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 37 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 36 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 35 | 3.09s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 34 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 33 | 6.89s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 32 | 0.94s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 20 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 19 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 18 | 0.52s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 18 | 0.33s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 18 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 17 | 2.0s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 16 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 16 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 16 | 26.27s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 16 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 16 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 14 | 0.97s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 13 | 0.72s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 12 | 1.32s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 10 | 3.45s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 8 | 0.95s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 6 | 4.13s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 4 | 13.23s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 2 | 1.08s |

## Archive sweep

Executed at least once: **360/360** research scripts. Latest status: missing_file 23, pass 336, timeout 1.
This run: 210 executed (missing_file 18, pass 191, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

