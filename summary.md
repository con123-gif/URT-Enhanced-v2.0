# Cathedral orchestrator — ✅ PASS

2026-11-13T10:09:28Z · [run 43403685589](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43403685589) · `293fa46` · schedule on `newtons-cathedral` · checkpoint #86

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 86 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 86 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 86 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 86 | 6.31s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 86 | 7.11s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 86 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 86 | 5.15s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 86 | 5.13s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 86 | 0.51s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 86 | 0.37s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 83 | 12.57s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 86 | 0.73s |
| native | `native.wilson_source` | native | ✅ pass | 86 | 1.64s |
| native | `native.output_gate` | native | ✅ pass | 86 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 86 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 86 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 86 | 0.93s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 86 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 80 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 59 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 59 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 79 | 1.18s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 78 | 56.37s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 77 | 6.05s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 75 | 8.49s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 73 | 18.0s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 72 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 72 | 5.36s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 68 | 36.98s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 68 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 68 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 68 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 68 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 68 | 4.01s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 67 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 66 | 36.87s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 65 | 4.53s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 64 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 63 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 63 | 326.09s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 63 | 5.63s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 63 | 23.66s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 62 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 62 | 62.24s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 62 | 3.01s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 61 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 61 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 60 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 58 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 57 | 89.56s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 56 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 55 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 54 | 3.98s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 52 | 96.01s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 51 | 193.53s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 50 | 38.08s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 49 | 8.13s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 45 | 117.43s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 48 | 16.47s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 46 | 53.81s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 44 | 0.35s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 43 | 3.41s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 42 | 5.01s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 41 | 1.53s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 40 | 3.12s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 39 | 2.07s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 38 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 37 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 35 | 8.88s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 33 | 3.1s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 24 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 23 | 0.68s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 23 | 0.66s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 22 | 0.61s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 22 | 0.63s |
| research | `research.q59_time_generator` | native | ✅ pass | 20 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 18 | 18.29s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 17 | 67.97s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 15 | 19.63s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 14 | 24.29s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 9 | 31.98s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 3 | 20.67s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 21 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 20 | 1.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 30 | 8.58s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 29 | 2.82s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 28 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 27 | 3.2s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 26 | 0.93s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 25 | 7.28s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 24 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 12 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 11 | 0.67s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 10 | 0.52s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 10 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 10 | 0.34s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 9 | 2.03s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 8 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 8 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 8 | 27.53s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 8 | 0.36s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 8 | 0.47s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 6 | 1.02s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 5 | 0.77s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 4 | 1.32s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 2 | 3.49s |

## Archive sweep

Executed at least once: **354/354** research scripts. Latest status: missing_file 23, pass 330, timeout 1.
This run: 243 executed (missing_file 18, pass 224, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

