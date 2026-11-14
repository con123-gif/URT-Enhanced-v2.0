# Cathedral orchestrator — ❌ FAIL

2026-11-14T10:36:04Z · [run 43584011831](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43584011831) · `1bd0d3b` · push on `newtons-cathedral` · checkpoint #125

**Gating failures:** `research.q109_full_joined_gauge`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 125 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 125 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 125 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 125 | 19.14s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 125 | 10.66s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 125 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 125 | 3.42s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 125 | 3.18s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 125 | 0.29s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 125 | 0.24s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 122 | 7.86s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 125 | 0.43s |
| native | `native.wilson_source` | native | ✅ pass | 125 | 1.57s |
| native | `native.output_gate` | native | ✅ pass | 125 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 125 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 125 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 125 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 125 | 0.15s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 119 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 98 | 0.23s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 98 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 118 | 0.85s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 117 | 42.0s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 116 | 4.47s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 114 | 6.48s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 112 | 13.77s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 111 | 1.57s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 111 | 4.32s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 107 | 28.73s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 107 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 107 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 107 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 107 | 0.4s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 107 | 2.57s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 106 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 105 | 28.24s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 104 | 3.32s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 103 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 102 | 1.37s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 102 | 1.89s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 102 | 4.67s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 102 | 18.05s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 101 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 101 | 53.51s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 101 | 2.22s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 100 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 100 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 99 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 97 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 96 | 88.31s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 95 | 1.48s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 94 | 1.69s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 93 | 3.43s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 91 | 95.97s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 90 | 191.66s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 89 | 30.92s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 88 | 6.92s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 84 | 114.31s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 87 | 14.38s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 85 | 46.19s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 83 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 82 | 2.85s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 81 | 4.37s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 80 | 1.28s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 79 | 2.64s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 78 | 1.65s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 77 | 1.84s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 76 | 1.75s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 74 | 6.55s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 72 | 2.48s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 63 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 62 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 62 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 61 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 61 | 0.46s |
| research | `research.q59_time_generator` | native | ✅ pass | 59 | 0.63s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 57 | 13.76s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 56 | 50.96s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 54 | 14.75s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 53 | 18.67s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 48 | 24.25s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 42 | 15.69s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 36 | 52.82s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 32 | 24.99s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 30 | 25.78s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 60 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 59 | 0.96s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 69 | 5.36s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 68 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 67 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 66 | 2.38s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 65 | 0.66s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 64 | 5.4s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 63 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 51 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 50 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 49 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 49 | 0.25s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 49 | 0.25s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 48 | 1.54s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 47 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 47 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 47 | 18.06s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 47 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 47 | 0.34s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 45 | 0.75s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 44 | 0.57s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 43 | 0.99s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 41 | 2.64s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 39 | 0.69s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 37 | 3.19s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 35 | 8.8s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 33 | 0.85s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 29 | 11.46s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 28 | 19.58s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 27 | 3.0s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 27 | 1.9s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 22 | 20.75s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 17 | 30.54s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 6 | 26.73s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 27 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 27 | 72.98s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 25 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 23 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 21 | 1.09s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 20 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 19 | 1.08s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 18 | 0.39s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 16 | 0.68s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 14 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 14 | 2.0s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 14 | 7.16s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 14 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 13 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 13 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 12 | 0.76s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 12 | 0.23s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 11 | 6.32s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 10 | 1.86s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 7 | 23.92s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 7 | 23.93s |
| research | `research.q102_born_current` | conditional | ✅ pass | 7 | 23.71s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 7 | 23.66s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 5 | 32.48s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 4 | 3.51s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 4 | 27.14s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 3 | 27.09s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 2 | 27.56s |
| research | `research.q109_full_joined_gauge` | conditional | ❌ error — ValueError: Bracketing values (xa, xb, xc) do not fulfill this requirement: (f(xb) < f(xa)) and (f(xb) < f(xc)) | 0 | 29.22s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 1 | 46.37s |

## Archive sweep

Executed at least once: **397/397** research scripts. Latest status: error 3, missing_file 23, pass 370, timeout 1.
This run: 104 executed (error 3, missing_file 5, pass 95, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

