# Cathedral orchestrator — ✅ PASS

2026-11-14T02:40:38Z · [run 43545839873](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43545839873) · `20e2cab` · push on `newtons-cathedral` · checkpoint #106

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 106 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 106 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 106 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 106 | 21.07s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 106 | 11.02s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 106 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 106 | 4.78s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 106 | 4.64s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 106 | 0.45s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 106 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 103 | 11.33s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 106 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 106 | 1.55s |
| native | `native.output_gate` | native | ✅ pass | 106 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 106 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 106 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 106 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 106 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 100 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 79 | 0.31s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 79 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 99 | 1.31s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 98 | 42.23s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 97 | 4.79s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 95 | 6.52s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 93 | 13.56s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 92 | 1.58s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 92 | 4.72s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 88 | 28.2s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 88 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 88 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 88 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 88 | 0.4s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 88 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 87 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 86 | 27.93s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 85 | 3.38s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 84 | 0.56s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 83 | 1.43s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 83 | 1.58s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 83 | 4.67s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 83 | 17.9s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 82 | 0.52s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 82 | 58.27s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 82 | 2.22s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 81 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 81 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 80 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 78 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 77 | 67.14s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 76 | 1.56s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 75 | 1.81s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 74 | 3.66s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 72 | 86.72s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 71 | 153.42s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 70 | 31.32s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 69 | 7.01s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 65 | 91.86s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 68 | 14.47s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 66 | 46.48s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 64 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 63 | 3.02s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 62 | 4.69s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 61 | 1.33s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 60 | 2.81s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 59 | 1.77s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 58 | 1.96s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 57 | 1.82s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 55 | 6.75s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 53 | 2.6s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 44 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 43 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 43 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 42 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 42 | 0.48s |
| research | `research.q59_time_generator` | native | ✅ pass | 40 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 38 | 13.74s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 37 | 50.97s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 35 | 14.91s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 34 | 18.81s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 29 | 24.28s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 23 | 15.8s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 17 | 52.91s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 13 | 25.18s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 11 | 26.11s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 41 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 40 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 50 | 5.41s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 49 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 48 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 47 | 2.38s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 46 | 0.66s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 45 | 5.52s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 44 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 32 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 31 | 0.52s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 30 | 0.39s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 30 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 30 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 29 | 1.56s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 28 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 28 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 28 | 18.29s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 28 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 28 | 0.34s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 26 | 0.76s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 25 | 0.57s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 24 | 1.03s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 22 | 2.63s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 20 | 0.7s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 18 | 3.31s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 16 | 8.44s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 14 | 0.84s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 10 | 11.85s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 9 | 19.66s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 8 | 2.86s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 8 | 1.9s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 3 | 20.19s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 8 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 8 | 70.16s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 6 | 0.32s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 4 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 2 | 1.09s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 1 | 0.37s |

## Archive sweep

Executed at least once: **370/370** research scripts. Latest status: missing_file 23, pass 346, timeout 1.
This run: 338 executed (missing_file 23, pass 314, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

