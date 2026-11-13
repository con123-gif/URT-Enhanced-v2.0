# Cathedral orchestrator — ✅ PASS

2026-11-13T20:38:23Z · [run 43500419492](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43500419492) · `83baa0d` · push on `newtons-cathedral` · checkpoint #96

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 96 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 96 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 96 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 96 | 6.2s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 96 | 6.92s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 96 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 96 | 4.41s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 96 | 3.94s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 96 | 0.38s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 96 | 0.28s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 93 | 9.87s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 96 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 96 | 1.63s |
| native | `native.output_gate` | native | ✅ pass | 96 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 96 | 0.53s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 96 | 0.22s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 96 | 0.54s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 96 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 90 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 69 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 69 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 89 | 0.79s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 88 | 30.41s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 87 | 3.36s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 85 | 4.83s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 83 | 10.06s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 82 | 1.05s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 82 | 2.99s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 78 | 20.66s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 78 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 78 | 0.43s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 78 | 0.39s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 78 | 0.33s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 78 | 1.81s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 77 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 76 | 20.64s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 75 | 2.28s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 74 | 0.45s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 73 | 0.97s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 73 | 163.78s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 73 | 3.12s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 73 | 13.01s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 72 | 0.4s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 72 | 38.07s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 72 | 1.6s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 71 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 71 | 0.35s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 70 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 68 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 67 | 48.93s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 66 | 1.17s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 65 | 1.22s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 64 | 2.43s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 62 | 55.37s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 61 | 119.28s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 60 | 21.09s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 59 | 4.66s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 55 | 63.57s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 58 | 9.61s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 56 | 30.26s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 54 | 0.2s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 53 | 2.01s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 52 | 2.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 51 | 0.89s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 50 | 1.84s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 49 | 1.2s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 48 | 1.3s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 47 | 1.2s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 45 | 4.81s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 43 | 1.77s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 34 | 0.35s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 33 | 0.41s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 33 | 0.42s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 32 | 0.35s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 32 | 0.36s |
| research | `research.q59_time_generator` | native | ✅ pass | 30 | 0.46s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 28 | 10.02s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 27 | 36.53s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 25 | 10.8s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 24 | 14.03s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 19 | 18.17s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 13 | 11.55s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 7 | 38.42s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 3 | 17.77s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 1 | 18.25s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 31 | 0.44s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 30 | 0.7s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 40 | 4.62s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 39 | 1.56s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 38 | 0.65s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 37 | 1.76s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 36 | 0.54s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 35 | 4.02s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 34 | 0.44s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 22 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 21 | 0.35s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 20 | 0.27s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 20 | 0.21s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 20 | 0.2s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 19 | 1.14s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 18 | 0.01s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 18 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 18 | 15.09s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 18 | 0.24s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 18 | 0.28s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 16 | 0.63s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 15 | 0.46s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 14 | 0.78s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 12 | 2.05s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 10 | 0.56s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 8 | 2.38s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 6 | 7.39s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 4 | 0.63s |

## Archive sweep

Executed at least once: **361/361** research scripts. Latest status: missing_file 23, pass 337, timeout 1.
This run: 136 executed (missing_file 5, pass 131).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

