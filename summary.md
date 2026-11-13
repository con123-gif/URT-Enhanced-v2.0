# Cathedral orchestrator — ✅ PASS

2026-11-13T18:20:36Z · [run 43477073372](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43477073372) · `9f09cce` · schedule on `newtons-cathedral` · checkpoint #95

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 95 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 95 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 95 | 0.16s |
| tests | `tests.suite` | regression | ✅ pass | 95 | 10.12s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 95 | 7.72s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 95 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 95 | 6.15s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 95 | 5.8s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 95 | 0.51s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 95 | 0.39s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 92 | 14.67s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 95 | 0.76s |
| native | `native.wilson_source` | native | ✅ pass | 95 | 1.39s |
| native | `native.output_gate` | native | ✅ pass | 95 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 95 | 0.64s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 95 | 0.39s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 95 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 95 | 0.13s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 89 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 68 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 68 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 88 | 1.37s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 87 | 55.94s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 86 | 5.95s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 84 | 8.55s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 82 | 18.08s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 81 | 1.92s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 81 | 5.22s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 77 | 37.16s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 77 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 77 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 77 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 77 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 77 | 3.95s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 76 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 75 | 36.59s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 74 | 4.56s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 73 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 72 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 72 | 325.83s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 72 | 5.75s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 72 | 23.45s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 71 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 71 | 61.41s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 71 | 3.02s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 70 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 70 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 69 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 67 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 66 | 89.41s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 65 | 1.82s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 64 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 63 | 4.0s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 61 | 95.17s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 60 | 193.02s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 59 | 37.92s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 58 | 8.05s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 54 | 125.44s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 57 | 16.42s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 55 | 53.85s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 53 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 52 | 3.42s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 51 | 4.93s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 50 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 49 | 3.08s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 48 | 2.03s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 47 | 2.25s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 46 | 2.03s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 44 | 8.94s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 42 | 3.13s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 33 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 32 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 32 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 31 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 31 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 29 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 27 | 18.03s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 26 | 67.58s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 24 | 19.44s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 23 | 24.18s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 18 | 31.89s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 12 | 20.45s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 6 | 70.92s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 2 | 31.68s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 30 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 29 | 1.44s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 39 | 8.52s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 38 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 37 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 36 | 3.23s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 35 | 0.92s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 34 | 7.15s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 33 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 21 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 20 | 0.69s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 19 | 0.51s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 19 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 19 | 0.31s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 18 | 2.0s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 17 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 17 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 17 | 27.03s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 17 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 17 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 15 | 0.96s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 14 | 0.73s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 13 | 1.29s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 11 | 3.42s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 9 | 0.97s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 7 | 4.15s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 5 | 13.36s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 3 | 1.09s |

## Archive sweep

Executed at least once: **360/360** research scripts. Latest status: missing_file 23, pass 336, timeout 1.
This run: 355 executed (missing_file 23, pass 331, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

