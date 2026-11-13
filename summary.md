# Cathedral orchestrator — ✅ PASS

2026-11-13T23:06:37Z · [run 43519849068](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43519849068) · `b728041` · push on `newtons-cathedral` · checkpoint #99

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 99 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 99 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 99 | 0.26s |
| tests | `tests.suite` | regression | ✅ pass | 99 | 16.31s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 99 | 10.95s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 99 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 99 | 6.34s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 99 | 5.95s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 99 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 99 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 96 | 15.18s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 99 | 0.74s |
| native | `native.wilson_source` | native | ✅ pass | 99 | 1.6s |
| native | `native.output_gate` | native | ✅ pass | 99 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 99 | 0.53s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 99 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 99 | 1.0s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 99 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 93 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 72 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 72 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 92 | 0.76s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 91 | 30.66s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 90 | 3.32s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 88 | 4.88s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 86 | 10.05s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 85 | 1.08s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 85 | 3.04s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 81 | 21.22s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 81 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 81 | 0.44s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 81 | 0.42s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 81 | 0.36s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 81 | 1.86s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 80 | 0.13s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 79 | 20.9s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 78 | 2.34s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 77 | 0.45s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 76 | 0.98s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 76 | 1.85s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 76 | 3.21s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 76 | 13.27s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 75 | 0.45s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 75 | 38.67s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 75 | 1.62s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 74 | 0.11s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 74 | 0.35s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 73 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 71 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 70 | 89.42s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 69 | 1.12s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 68 | 1.22s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 67 | 2.44s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 65 | 95.4s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 64 | 193.15s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 63 | 21.56s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 62 | 4.84s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 58 | 117.71s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 61 | 9.7s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 59 | 30.84s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 57 | 0.21s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 56 | 2.08s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 55 | 3.1s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 54 | 0.93s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 53 | 1.89s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 52 | 1.26s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 51 | 1.37s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 50 | 1.25s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 48 | 4.89s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 46 | 1.79s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 37 | 0.35s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 36 | 0.4s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 36 | 0.39s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 35 | 0.35s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 35 | 0.35s |
| research | `research.q59_time_generator` | native | ✅ pass | 33 | 0.46s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 31 | 10.06s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 30 | 37.23s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 28 | 10.92s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 27 | 13.85s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 22 | 17.77s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 16 | 11.52s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 10 | 38.81s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 6 | 17.79s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 4 | 18.39s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 34 | 0.46s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 33 | 0.73s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 43 | 4.67s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 42 | 1.55s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 41 | 0.65s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 40 | 1.78s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 39 | 0.53s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 38 | 3.99s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 37 | 0.44s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 25 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 24 | 0.35s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 23 | 0.27s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 23 | 0.2s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 23 | 0.2s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 22 | 1.11s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 21 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 21 | 0.01s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 21 | 15.02s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 21 | 0.21s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 21 | 0.27s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 19 | 0.58s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 18 | 0.44s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 17 | 0.76s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 15 | 2.0s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 13 | 0.56s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 11 | 2.43s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 9 | 7.32s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 7 | 0.62s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 3 | 10.02s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 2 | 16.86s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 1 | 4.25s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 1 | 2.71s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 1 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 1 | 97.14s |

## Archive sweep

Executed at least once: **365/365** research scripts. Latest status: missing_file 23, pass 341, timeout 1.
This run: 104 executed (missing_file 5, pass 98, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

