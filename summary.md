# Cathedral orchestrator — ✅ PASS

2026-11-13T12:57:13Z · [run 43424552399](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43424552399) · `bbec627` · push on `newtons-cathedral` · checkpoint #90

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 90 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 90 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 90 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 90 | 9.9s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 90 | 5.93s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 90 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 90 | 4.99s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 90 | 4.65s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 90 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 90 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 87 | 11.39s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 90 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 90 | 1.74s |
| native | `native.output_gate` | native | ✅ pass | 90 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 90 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 90 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 90 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 90 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 84 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 63 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 63 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 83 | 0.84s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 82 | 31.38s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 81 | 3.56s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 79 | 5.18s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 77 | 10.71s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 76 | 1.13s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 76 | 3.39s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 72 | 22.15s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 72 | 0.15s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 72 | 0.52s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 72 | 0.48s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 72 | 0.4s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 72 | 2.0s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 71 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 70 | 22.32s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 69 | 2.47s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 68 | 0.51s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 67 | 1.06s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 67 | 170.66s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 67 | 3.4s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 67 | 13.86s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 66 | 0.49s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 66 | 40.21s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 66 | 1.73s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 65 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 65 | 0.36s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 64 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 62 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 61 | 52.38s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 60 | 1.2s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 59 | 1.33s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 58 | 2.62s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 56 | 56.64s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 55 | 124.21s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 54 | 22.49s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 53 | 4.97s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 49 | 82.32s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 52 | 10.29s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 50 | 32.51s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 48 | 0.23s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 47 | 2.22s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 46 | 3.3s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 45 | 0.99s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 44 | 2.04s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 43 | 1.37s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 42 | 1.46s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 41 | 1.33s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 39 | 5.22s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 37 | 1.96s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 28 | 0.4s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 27 | 0.45s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 27 | 0.48s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 26 | 0.43s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 26 | 0.45s |
| research | `research.q59_time_generator` | native | ✅ pass | 24 | 0.56s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 22 | 10.7s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 21 | 38.91s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 19 | 11.86s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 18 | 14.75s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 13 | 19.11s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 7 | 12.06s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 1 | 40.01s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 25 | 0.48s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 24 | 0.73s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 34 | 4.83s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 33 | 1.57s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 32 | 0.65s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 31 | 1.76s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 30 | 0.54s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 29 | 4.03s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 28 | 0.44s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 16 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 15 | 0.37s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 14 | 0.28s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 14 | 0.22s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 14 | 0.21s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 13 | 1.19s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 12 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 12 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 12 | 15.64s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 12 | 0.22s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 12 | 0.29s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 10 | 0.62s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 9 | 0.51s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 8 | 0.81s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 6 | 2.05s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 4 | 0.57s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 2 | 2.44s |

## Archive sweep

Executed at least once: **357/357** research scripts. Latest status: missing_file 23, pass 333, timeout 1.
This run: 154 executed (missing_file 5, pass 149).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

