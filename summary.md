# Cathedral orchestrator — ✅ PASS

2026-11-13T13:44:18Z · [run 43433060578](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43433060578) · `e7f9a09` · push on `newtons-cathedral` · checkpoint #91

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 91 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 91 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 91 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 91 | 6.54s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 91 | 5.62s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 91 | 0.24s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 91 | 7.14s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 91 | 6.1s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 91 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 91 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 88 | 15.06s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 91 | 0.8s |
| native | `native.wilson_source` | native | ✅ pass | 91 | 1.64s |
| native | `native.output_gate` | native | ✅ pass | 91 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 91 | 0.48s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 91 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 91 | 0.6s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 91 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 85 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 64 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 64 | 0.05s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 84 | 0.94s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 83 | 41.82s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 82 | 4.47s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 80 | 6.5s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 78 | 13.86s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 77 | 1.62s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 77 | 4.43s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 73 | 28.14s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 73 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 73 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 73 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 73 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 73 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 72 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 71 | 28.11s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 70 | 3.34s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 69 | 0.55s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 68 | 1.45s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 68 | 244.64s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 68 | 4.79s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 68 | 17.96s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 67 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 67 | 57.55s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 67 | 2.3s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 66 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 66 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 65 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 63 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 62 | 67.84s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 61 | 1.64s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 60 | 1.8s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 59 | 3.62s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 57 | 87.72s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 56 | 153.78s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 55 | 31.45s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 54 | 7.11s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 50 | 101.19s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 53 | 14.76s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 51 | 47.21s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 49 | 0.29s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 48 | 3.19s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 47 | 4.79s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 46 | 1.26s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 45 | 2.82s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 44 | 1.8s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 43 | 2.05s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 42 | 1.84s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 40 | 6.83s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 38 | 2.62s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 29 | 0.48s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 28 | 0.55s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 28 | 0.54s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 27 | 0.48s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 27 | 0.49s |
| research | `research.q59_time_generator` | native | ✅ pass | 25 | 0.65s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 23 | 13.87s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 22 | 51.93s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 20 | 15.05s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 19 | 19.04s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 14 | 24.81s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 8 | 15.85s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 2 | 53.19s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 26 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 25 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 35 | 5.37s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 34 | 1.92s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 33 | 0.84s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 32 | 2.42s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 31 | 0.69s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 30 | 5.5s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 29 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 17 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 16 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 15 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 15 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 15 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 14 | 1.54s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 13 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 13 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 13 | 18.29s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 13 | 0.29s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 13 | 0.37s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 11 | 0.79s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 10 | 0.62s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 9 | 1.02s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 7 | 2.67s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 5 | 0.7s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 3 | 3.21s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 1 | 8.77s |

## Archive sweep

Executed at least once: **358/358** research scripts. Latest status: missing_file 23, pass 334, timeout 1.
This run: 209 executed (missing_file 18, pass 190, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

