# Cathedral orchestrator — ❌ FAIL

2026-11-14T07:56:26Z · [run 43570785986](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43570785986) · `e4348d7` · push on `newtons-cathedral` · checkpoint #117

**Gating failures:** `research.q101_moving_arf`, `research.q101_magnetic_factor`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 117 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 117 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 117 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 117 | 20.92s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 117 | 7.0s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 117 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 117 | 6.17s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 117 | 6.07s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 117 | 0.54s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 117 | 0.44s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 114 | 15.17s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 117 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 117 | 1.57s |
| native | `native.output_gate` | native | ✅ pass | 117 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 117 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 117 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 117 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 117 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 111 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 90 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 90 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 110 | 0.88s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 109 | 42.27s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 108 | 4.46s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 106 | 6.42s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 104 | 13.62s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 103 | 1.65s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 103 | 4.35s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 99 | 27.92s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 99 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 99 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 99 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 99 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 99 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 98 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 97 | 28.0s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 96 | 3.33s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 95 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 94 | 1.36s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 94 | 1.8s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 94 | 4.7s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 94 | 17.79s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 93 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 93 | 58.02s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 93 | 2.29s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 92 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 92 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 91 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 89 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 88 | 89.38s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 87 | 1.58s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 86 | 1.79s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 85 | 3.49s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 83 | 95.65s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 82 | 193.54s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 81 | 31.04s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 80 | 6.93s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 76 | 116.11s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 79 | 14.46s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 77 | 46.2s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 75 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 74 | 3.04s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 73 | 4.57s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 72 | 1.33s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 71 | 2.7s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 70 | 1.77s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 69 | 1.9s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 68 | 1.78s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 66 | 6.6s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 64 | 2.51s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 55 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 54 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 54 | 0.51s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 53 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 53 | 0.46s |
| research | `research.q59_time_generator` | native | ✅ pass | 51 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 49 | 13.91s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 48 | 51.17s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 46 | 14.92s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 45 | 18.72s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 40 | 24.16s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 34 | 15.67s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 28 | 52.91s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 24 | 25.06s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 22 | 25.75s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 52 | 0.62s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 51 | 0.97s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 61 | 5.36s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 60 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 59 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 58 | 2.42s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 57 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 56 | 5.41s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 55 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 43 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 42 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 41 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 41 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 41 | 0.25s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 40 | 1.54s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 39 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 39 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 39 | 18.31s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 39 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 39 | 0.34s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 37 | 0.75s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 36 | 0.58s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 35 | 1.03s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 33 | 2.66s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 31 | 0.7s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 29 | 3.21s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 27 | 8.83s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 25 | 0.84s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 21 | 11.64s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 20 | 19.64s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 19 | 4.23s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 19 | 2.69s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 14 | 29.85s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 9 | 30.54s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 19 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 19 | 105.43s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 17 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 15 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 13 | 1.09s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 12 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 11 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 10 | 0.39s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 8 | 0.69s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 6 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 6 | 2.03s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 6 | 7.11s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 6 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 5 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 5 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 4 | 0.76s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 4 | 0.22s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 3 | 6.32s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 2 | 1.86s |
| research | `research.q101_moving_arf` | conditional | ❌ error — FileNotFoundError(2, 'No such file or directory') | 0 | 0.0s |
| research | `research.q101_magnetic_factor` | conditional | ❌ error — FileNotFoundError(2, 'No such file or directory') | 0 | 0.0s |

## Archive sweep

Executed at least once: **386/386** research scripts. Latest status: missing_file 23, pass 362, timeout 1.
This run: 164 executed (missing_file 4, pass 159, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

