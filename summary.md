# Cathedral orchestrator — ✅ PASS

2026-11-14T05:32:28Z · [run 43560494834](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43560494834) · `ed78714` · push on `newtons-cathedral` · checkpoint #110

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 110 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 110 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 110 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 110 | 16.37s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 110 | 7.11s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 110 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 110 | 5.15s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 110 | 5.16s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 110 | 0.49s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 110 | 0.37s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 107 | 12.64s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 110 | 0.73s |
| native | `native.wilson_source` | native | ✅ pass | 110 | 1.38s |
| native | `native.output_gate` | native | ✅ pass | 110 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 110 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 110 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 110 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 110 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 104 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 83 | 0.18s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 83 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 103 | 0.67s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 102 | 30.84s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 101 | 3.42s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 99 | 4.95s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 97 | 10.28s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 96 | 1.19s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 96 | 3.12s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 92 | 21.42s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 92 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 92 | 0.44s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 92 | 0.42s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 92 | 0.36s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 92 | 1.9s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 91 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 90 | 21.4s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 89 | 2.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 88 | 0.5s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 87 | 1.02s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 87 | 1.09s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 87 | 3.22s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 87 | 13.09s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 86 | 0.45s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 86 | 39.29s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 86 | 1.61s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 85 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 85 | 0.35s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 84 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 82 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 81 | 49.6s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 80 | 1.12s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 79 | 1.22s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 78 | 2.47s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 76 | 55.38s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 75 | 119.26s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 74 | 22.31s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 73 | 4.72s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 69 | 72.65s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 72 | 10.0s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 70 | 30.98s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 68 | 0.22s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 67 | 2.13s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 66 | 3.14s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 65 | 0.94s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 64 | 1.91s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 63 | 1.29s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 62 | 1.39s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 61 | 1.25s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 59 | 4.88s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 57 | 1.84s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 48 | 0.37s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 47 | 0.42s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 47 | 0.47s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 46 | 0.39s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 46 | 0.4s |
| research | `research.q59_time_generator` | native | ✅ pass | 44 | 0.5s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 42 | 10.31s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 41 | 37.0s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 39 | 11.01s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 38 | 13.98s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 33 | 18.26s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 27 | 11.54s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 21 | 38.68s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 17 | 18.32s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 15 | 18.62s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 45 | 0.45s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 44 | 0.72s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 54 | 4.79s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 53 | 1.55s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 52 | 0.64s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 51 | 1.76s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 50 | 0.54s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 49 | 4.05s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 48 | 0.44s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 36 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 35 | 0.35s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 34 | 0.27s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 34 | 0.22s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 34 | 0.23s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 33 | 1.2s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 32 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 32 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 32 | 15.23s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 32 | 0.22s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 32 | 0.27s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 30 | 0.58s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 29 | 0.45s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 28 | 0.76s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 26 | 1.98s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 24 | 0.56s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 22 | 2.41s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 20 | 7.28s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 18 | 0.63s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 14 | 9.95s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 13 | 17.09s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 12 | 5.27s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 12 | 3.54s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 7 | 36.26s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 2 | 21.93s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 12 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 12 | 123.73s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 10 | 0.25s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 8 | 0.32s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 6 | 0.89s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 5 | 0.29s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 4 | 0.81s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 3 | 0.32s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 1 | 0.54s |

## Archive sweep

Executed at least once: **374/374** research scripts. Latest status: missing_file 23, pass 350, timeout 1.
This run: 97 executed (missing_file 1, pass 95, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

