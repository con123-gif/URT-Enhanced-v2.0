# Cathedral orchestrator — ✅ PASS

2026-11-14T03:34:30Z · [run 43550653960](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43550653960) · `7cefe40` · push on `newtons-cathedral` · checkpoint #107

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 107 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 107 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 107 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 107 | 21.07s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 107 | 6.86s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 107 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 107 | 6.78s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 107 | 6.06s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 107 | 0.54s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 107 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 104 | 14.87s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 107 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 107 | 1.64s |
| native | `native.output_gate` | native | ✅ pass | 107 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 107 | 0.52s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 107 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 107 | 0.8s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 107 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 101 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 80 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 80 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 100 | 0.68s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 99 | 29.71s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 98 | 3.23s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 96 | 4.74s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 94 | 10.11s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 93 | 1.11s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 93 | 3.01s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 89 | 20.3s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 89 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 89 | 0.39s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 89 | 0.41s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 89 | 0.31s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 89 | 1.78s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 88 | 0.11s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 87 | 20.24s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 86 | 2.34s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 85 | 0.42s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 84 | 0.95s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 84 | 1.31s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 84 | 3.25s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 84 | 13.08s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 83 | 0.39s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 83 | 37.13s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 83 | 1.55s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 82 | 0.11s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 82 | 0.33s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 81 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 79 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 78 | 47.63s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 77 | 1.11s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 76 | 1.23s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 75 | 2.47s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 73 | 52.45s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 72 | 114.06s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 71 | 21.59s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 70 | 4.56s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 66 | 73.3s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 69 | 9.31s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 67 | 30.28s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 65 | 0.21s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 64 | 2.16s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 63 | 3.15s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 62 | 0.98s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 61 | 1.99s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 60 | 1.3s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 59 | 1.44s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 58 | 1.28s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 56 | 4.74s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 54 | 1.78s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 45 | 0.35s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 44 | 0.43s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 44 | 0.39s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 43 | 0.37s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 43 | 0.37s |
| research | `research.q59_time_generator` | native | ✅ pass | 41 | 0.49s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 39 | 9.83s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 38 | 36.96s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 36 | 11.18s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 35 | 14.06s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 30 | 17.75s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 24 | 12.04s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 18 | 38.78s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 14 | 18.4s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 12 | 18.78s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 42 | 0.46s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 41 | 0.75s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 51 | 4.63s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 50 | 1.6s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 49 | 0.69s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 48 | 1.79s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 47 | 0.56s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 46 | 4.08s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 45 | 0.48s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 33 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 32 | 0.34s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 31 | 0.27s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 31 | 0.24s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 31 | 0.23s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 30 | 1.13s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 29 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 29 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 29 | 15.66s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 29 | 0.28s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 29 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 27 | 0.69s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 26 | 0.55s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 25 | 0.95s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 23 | 2.21s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 21 | 0.6s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 19 | 2.44s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 17 | 7.86s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 15 | 0.67s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 11 | 10.32s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 10 | 16.97s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 9 | 5.32s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 9 | 3.55s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 4 | 36.68s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 9 | 0.06s |
| engine | `engine.benchmark` | regression | ✅ pass | 9 | 128.09s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 7 | 0.26s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 5 | 0.33s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 3 | 0.9s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 2 | 0.3s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 1 | 0.84s |

## Archive sweep

Executed at least once: **371/371** research scripts. Latest status: missing_file 23, pass 347, timeout 1.
This run: 169 executed (missing_file 5, pass 164).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

