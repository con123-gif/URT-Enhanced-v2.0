# Cathedral orchestrator — ✅ PASS

2026-11-13T23:49:23Z · [run 43525297259](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43525297259) · `2bd917d` · push on `newtons-cathedral` · checkpoint #101

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 101 | 0.03s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 101 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 101 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 101 | 14.52s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 101 | 10.75s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 101 | 0.41s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 101 | 4.1s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 101 | 3.43s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 101 | 0.36s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 101 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 98 | 8.12s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 101 | 0.44s |
| native | `native.wilson_source` | native | ✅ pass | 101 | 1.17s |
| native | `native.output_gate` | native | ✅ pass | 101 | 0.07s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 101 | 0.54s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 101 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 101 | 0.86s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 101 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 95 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 74 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 74 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 94 | 0.88s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 93 | 41.71s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 92 | 4.42s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 90 | 6.41s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 88 | 13.67s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 87 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 87 | 4.31s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 83 | 28.89s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 83 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 83 | 0.56s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 83 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 83 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 83 | 2.58s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 82 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 81 | 27.82s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 80 | 3.32s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 79 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 78 | 1.39s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 78 | 1.84s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 78 | 4.76s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 78 | 17.96s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 77 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 77 | 58.38s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 77 | 2.26s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 76 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 76 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 75 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 73 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 72 | 87.03s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 71 | 1.61s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 70 | 1.86s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 69 | 3.69s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 67 | 96.41s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 66 | 194.01s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 65 | 31.32s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 64 | 7.05s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 60 | 115.89s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 63 | 14.59s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 61 | 47.44s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 59 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 58 | 3.06s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 57 | 4.65s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 56 | 1.3s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 55 | 2.86s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 54 | 1.82s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 53 | 2.03s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 52 | 1.87s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 50 | 6.75s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 48 | 2.6s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 39 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 38 | 0.51s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 38 | 0.51s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 37 | 0.47s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 37 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 35 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 33 | 13.55s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 32 | 50.72s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 30 | 14.72s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 29 | 18.64s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 24 | 24.22s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 18 | 15.72s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 12 | 52.92s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 8 | 24.96s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 6 | 26.05s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 36 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 35 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 45 | 5.48s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 44 | 1.95s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 43 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 42 | 2.39s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 41 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 40 | 5.34s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 39 | 0.62s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 27 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 26 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 25 | 0.4s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 25 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 25 | 0.27s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 24 | 1.55s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 23 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 23 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 23 | 18.64s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 23 | 0.29s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 23 | 0.35s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 21 | 0.8s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 20 | 0.61s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 19 | 1.02s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 17 | 2.67s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 15 | 0.71s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 13 | 3.29s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 11 | 8.45s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 9 | 0.85s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 5 | 11.94s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 4 | 19.84s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 3 | 5.28s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 3 | 3.54s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 3 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 3 | 126.79s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 1 | 0.33s |

## Archive sweep

Executed at least once: **366/366** research scripts. Latest status: missing_file 23, pass 341, timeout 2.
This run: 138 executed (missing_file 5, pass 132, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-11-11_q36_star_intertwiner/q36_exact_star_intertwiners.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

