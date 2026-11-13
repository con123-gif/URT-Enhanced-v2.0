# Cathedral orchestrator — ✅ PASS

2026-11-13T09:37:44Z · [run 43400282370](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43400282370) · `293fa46` · push on `newtons-cathedral` · checkpoint #85

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 85 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 85 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 85 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 85 | 9.73s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 85 | 10.93s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 85 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 85 | 5.54s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 85 | 5.12s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 85 | 0.49s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 85 | 0.36s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 82 | 12.44s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 85 | 0.71s |
| native | `native.wilson_source` | native | ✅ pass | 85 | 1.07s |
| native | `native.output_gate` | native | ✅ pass | 85 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 85 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 85 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 85 | 0.65s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 85 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 79 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 58 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 58 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 78 | 0.65s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 77 | 31.68s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 76 | 3.35s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 74 | 4.86s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 72 | 10.24s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 71 | 1.05s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 71 | 2.84s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 67 | 21.31s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 67 | 0.15s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 67 | 0.43s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 67 | 0.4s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 67 | 0.32s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 67 | 1.88s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 66 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 65 | 20.98s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 64 | 2.4s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 63 | 0.41s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 62 | 0.94s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 62 | 164.5s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 62 | 3.05s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 62 | 12.8s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 61 | 0.39s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 61 | 36.62s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 61 | 1.57s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 60 | 0.11s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 60 | 0.32s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 59 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 57 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 56 | 48.09s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 55 | 1.06s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 54 | 1.16s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 53 | 2.33s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 51 | 52.81s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 50 | 115.21s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 49 | 20.31s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 48 | 4.65s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 44 | 59.96s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 47 | 9.19s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 45 | 29.56s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 43 | 0.19s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 42 | 2.07s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 41 | 2.96s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 40 | 0.87s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 39 | 1.81s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 38 | 1.19s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 37 | 1.28s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 36 | 1.29s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 34 | 4.7s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 32 | 1.71s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 23 | 0.33s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 22 | 0.37s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 22 | 0.37s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 21 | 0.33s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 21 | 0.34s |
| research | `research.q59_time_generator` | native | ✅ pass | 19 | 0.43s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 17 | 9.73s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 16 | 35.8s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 14 | 10.45s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 13 | 13.41s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 8 | 17.62s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 2 | 11.91s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 20 | 0.47s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 19 | 0.73s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 29 | 4.7s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 28 | 1.57s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 27 | 0.65s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 26 | 1.78s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 25 | 0.59s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 24 | 4.09s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 23 | 0.45s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 11 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 10 | 0.38s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 9 | 0.29s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 9 | 0.2s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 9 | 0.2s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 8 | 1.12s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 7 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 7 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 7 | 15.32s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 7 | 0.21s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 7 | 0.27s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 5 | 0.58s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 4 | 0.45s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 3 | 0.77s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 1 | 1.97s |

## Archive sweep

Executed at least once: **354/354** research scripts. Latest status: missing_file 23, pass 330, timeout 1.
This run: 137 executed (missing_file 5, pass 132).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

