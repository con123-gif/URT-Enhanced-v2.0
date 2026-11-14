# Cathedral orchestrator — ✅ PASS

2026-11-14T04:35:33Z · [run 43555792256](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43555792256) · `ad1e156` · push on `newtons-cathedral` · checkpoint #108

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 108 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 108 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 108 | 0.34s |
| tests | `tests.suite` | regression | ✅ pass | 108 | 17.21s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 108 | 7.81s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 108 | 0.34s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 108 | 5.37s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 108 | 5.05s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 108 | 0.49s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 108 | 0.36s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 105 | 12.45s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 108 | 0.71s |
| native | `native.wilson_source` | native | ✅ pass | 108 | 1.94s |
| native | `native.output_gate` | native | ✅ pass | 108 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 108 | 0.38s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 108 | 0.24s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 108 | 0.56s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 108 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 102 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 81 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 81 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 101 | 0.83s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 100 | 41.97s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 99 | 4.42s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 97 | 6.43s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 95 | 13.6s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 94 | 1.58s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 94 | 4.32s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 90 | 28.01s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 90 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 90 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 90 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 90 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 90 | 2.63s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 89 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 88 | 27.98s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 87 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 86 | 0.56s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 85 | 1.4s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 85 | 1.5s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 85 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 85 | 17.54s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 84 | 0.53s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 84 | 57.1s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 84 | 2.21s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 83 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 83 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 82 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 80 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 79 | 67.31s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 78 | 1.61s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 77 | 1.82s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 76 | 3.57s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 74 | 86.93s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 73 | 152.48s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 72 | 31.46s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 71 | 7.0s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 67 | 89.08s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 70 | 14.53s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 68 | 46.47s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 66 | 0.27s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 65 | 3.09s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 64 | 4.59s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 63 | 1.35s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 62 | 2.76s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 61 | 1.81s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 60 | 1.96s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 59 | 1.82s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 57 | 6.77s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 55 | 2.56s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 46 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 45 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 45 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 44 | 0.46s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 44 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 42 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 40 | 13.66s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 39 | 50.53s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 37 | 14.72s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 36 | 18.71s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 31 | 24.04s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 25 | 15.5s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 19 | 52.88s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 15 | 24.95s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 13 | 25.8s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 43 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 42 | 0.98s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 52 | 5.42s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 51 | 1.95s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 50 | 0.84s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 49 | 2.37s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 48 | 0.67s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 47 | 5.52s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 46 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 34 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 33 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 32 | 0.38s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 32 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 32 | 0.27s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 31 | 1.55s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 30 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 30 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 30 | 18.59s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 30 | 0.28s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 30 | 0.35s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 28 | 0.79s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 27 | 0.59s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 26 | 1.07s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 24 | 2.66s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 22 | 0.71s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 20 | 3.27s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 18 | 8.9s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 16 | 0.85s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 12 | 11.69s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 11 | 19.73s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 10 | 4.24s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 10 | 2.7s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 5 | 29.51s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 10 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 10 | 106.91s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 8 | 0.32s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 6 | 0.41s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 4 | 1.12s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 3 | 0.38s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 2 | 1.09s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 1 | 0.41s |

## Archive sweep

Executed at least once: **372/372** research scripts. Latest status: missing_file 23, pass 348, timeout 1.
This run: 219 executed (missing_file 18, pass 200, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

