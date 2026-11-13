# Cathedral orchestrator — ✅ PASS

2026-11-13T23:29:49Z · [run 43525112312](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43525112312) · `5c1add4` · push on `newtons-cathedral` · checkpoint #100

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 100 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 100 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 100 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 100 | 13.95s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 100 | 7.19s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 100 | 0.32s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 100 | 4.72s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 100 | 4.59s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 100 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 100 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 97 | 11.48s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 100 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 100 | 1.56s |
| native | `native.output_gate` | native | ✅ pass | 100 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 100 | 0.53s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 100 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 100 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 100 | 0.14s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 94 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 73 | 0.29s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 73 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 93 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 92 | 53.91s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 91 | 5.75s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 89 | 8.3s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 87 | 17.4s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 86 | 1.92s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 86 | 5.33s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 82 | 36.34s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 82 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 82 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 82 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 82 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 82 | 3.88s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 81 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 80 | 36.2s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 79 | 4.44s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 78 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 77 | 1.64s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 77 | 1.58s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 77 | 5.88s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 77 | 23.14s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 76 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 76 | 61.2s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 76 | 2.87s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 75 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 75 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 74 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 72 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 71 | 56.44s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 70 | 1.78s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 69 | 1.99s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 68 | 3.95s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 66 | 64.78s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 65 | 138.04s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 64 | 37.91s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 63 | 8.16s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 59 | 79.67s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 62 | 16.54s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 60 | 53.58s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 58 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 57 | 3.34s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 56 | 4.91s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 55 | 1.49s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 54 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 53 | 2.05s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 52 | 2.25s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 51 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 49 | 8.82s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 47 | 3.12s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 38 | 0.58s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 37 | 0.66s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 37 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 36 | 0.59s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 36 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 34 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 32 | 17.64s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 31 | 66.41s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 29 | 18.99s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 28 | 23.92s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 23 | 31.22s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 17 | 19.96s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 11 | 68.87s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 7 | 31.18s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 5 | 32.06s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 35 | 0.99s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 34 | 1.41s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 44 | 8.46s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 43 | 2.77s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 42 | 1.12s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 41 | 3.06s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 40 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 39 | 6.91s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 38 | 0.94s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 26 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 25 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 24 | 0.49s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 24 | 0.34s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 24 | 0.33s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 23 | 2.01s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 22 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 22 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 22 | 26.88s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 22 | 0.35s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 22 | 0.46s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 20 | 1.03s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 19 | 0.79s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 18 | 1.34s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 16 | 3.49s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 14 | 0.96s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 12 | 4.27s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 10 | 13.18s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 8 | 1.1s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 4 | 18.14s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 3 | 30.48s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 2 | 3.59s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 2 | 2.36s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 2 | 0.04s |
| engine | `engine.benchmark` | regression | ✅ pass | 2 | 85.63s |

## Archive sweep

Executed at least once: **365/365** research scripts. Latest status: missing_file 23, pass 341, timeout 1.
This run: 341 executed (missing_file 23, pass 317, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

