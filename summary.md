# Cathedral orchestrator — ❌ FAIL

2026-11-13T11:42:48Z · [run 43415745966](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43415745966) · `d07e4a4` · push on `newtons-cathedral` · checkpoint #88

**Gating failures:** `research.q80_native_hidden_source_selection`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 88 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 88 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 88 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 88 | 10.29s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 88 | 5.64s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 88 | 0.23s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 88 | 4.46s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 88 | 3.9s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 88 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 88 | 0.28s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 85 | 9.66s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 88 | 0.55s |
| native | `native.wilson_source` | native | ✅ pass | 88 | 1.78s |
| native | `native.output_gate` | native | ✅ pass | 88 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 88 | 0.61s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 88 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 88 | 0.86s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 88 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 82 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 61 | 0.28s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 61 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 81 | 1.49s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 80 | 55.8s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 79 | 5.98s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 77 | 8.49s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 75 | 17.98s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 74 | 1.9s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 74 | 5.65s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 70 | 36.83s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 70 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 70 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 70 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 70 | 0.53s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 70 | 3.99s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 69 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 68 | 36.61s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 67 | 4.51s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 66 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 65 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 65 | 326.68s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 65 | 5.69s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 65 | 23.67s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 64 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 64 | 61.71s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 64 | 2.99s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 63 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 63 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 62 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 60 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 59 | 89.26s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 58 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 57 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 56 | 3.98s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 54 | 95.81s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 53 | 193.28s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 52 | 38.09s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 51 | 8.09s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 47 | 115.62s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 50 | 16.4s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 48 | 53.74s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 46 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 45 | 3.39s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 44 | 5.1s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 43 | 1.51s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 42 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 41 | 2.06s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 40 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 39 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 37 | 9.01s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 35 | 3.14s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 26 | 0.6s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 25 | 0.67s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 25 | 0.65s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 24 | 0.6s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 24 | 0.62s |
| research | `research.q59_time_generator` | native | ✅ pass | 22 | 0.82s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 20 | 18.17s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 19 | 67.69s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 17 | 19.7s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 16 | 24.14s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 11 | 31.72s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 5 | 20.49s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 23 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 22 | 1.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 32 | 8.54s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 31 | 2.81s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 30 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 29 | 3.19s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 28 | 0.93s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 27 | 7.19s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 26 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 14 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 13 | 0.67s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 12 | 0.52s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 12 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 12 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 11 | 2.02s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 10 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 10 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 10 | 27.36s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 10 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 10 | 0.45s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 8 | 1.01s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 7 | 0.77s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 6 | 1.31s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 4 | 3.49s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 2 | 0.99s |
| research | `research.q80_native_hidden_source_selection` | native | ❌ error — NameError: name 'P3' is not defined. Did you mean: 'P'? | 0 | 1.07s |

## Archive sweep

Executed at least once: **356/356** research scripts. Latest status: error 1, missing_file 23, pass 331, timeout 1.
This run: 159 executed (error 1, missing_file 4, pass 153, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

