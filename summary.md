# Cathedral orchestrator — ✅ PASS

2026-11-14T00:08:15Z · [run 43528980405](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43528980405) · `2bd917d` · schedule on `newtons-cathedral` · checkpoint #102

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 102 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 102 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 102 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 102 | 13.97s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 102 | 6.93s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 102 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 102 | 4.82s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 102 | 4.52s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 102 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 102 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 99 | 11.25s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 102 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 102 | 1.44s |
| native | `native.output_gate` | native | ✅ pass | 102 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 102 | 0.45s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 102 | 0.25s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 102 | 0.6s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 102 | 0.15s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 96 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 75 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 75 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 95 | 0.91s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 94 | 42.02s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 93 | 4.45s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 91 | 6.42s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 89 | 13.49s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 88 | 1.62s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 88 | 4.32s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 84 | 28.24s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 84 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 84 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 84 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 84 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 84 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 83 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 82 | 27.81s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 81 | 3.31s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 80 | 0.53s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 79 | 1.36s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 79 | 1.64s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 79 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 79 | 17.58s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 78 | 0.5s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 78 | 56.84s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 78 | 2.27s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 77 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 77 | 0.48s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 76 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 74 | 0.02s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 73 | 67.53s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 72 | 1.56s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 71 | 1.82s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 70 | 3.63s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 68 | 86.81s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 67 | 154.54s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 66 | 31.28s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 65 | 6.91s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 61 | 93.47s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 64 | 14.48s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 62 | 46.87s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 60 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 59 | 3.1s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 58 | 4.51s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 57 | 1.28s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 56 | 2.76s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 55 | 1.77s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 54 | 1.89s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 53 | 1.77s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 51 | 6.83s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 49 | 2.51s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 40 | 0.44s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 39 | 0.5s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 39 | 0.5s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 38 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 38 | 0.45s |
| research | `research.q59_time_generator` | native | ✅ pass | 36 | 0.62s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 34 | 13.67s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 33 | 50.79s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 31 | 14.93s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 30 | 18.65s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 25 | 24.26s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 19 | 15.66s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 13 | 52.75s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 9 | 25.35s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 7 | 25.96s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 37 | 0.64s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 36 | 0.99s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 46 | 5.47s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 45 | 2.0s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 44 | 0.84s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 43 | 2.46s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 42 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 41 | 5.4s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 40 | 0.64s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 28 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 27 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 26 | 0.39s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 26 | 0.27s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 26 | 0.27s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 25 | 1.58s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 24 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 24 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 24 | 18.86s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 24 | 0.28s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 24 | 0.37s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 22 | 0.78s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 21 | 0.6s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 20 | 1.02s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 18 | 2.67s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 16 | 0.72s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 14 | 3.23s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 12 | 8.89s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 10 | 0.84s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 6 | 12.13s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 5 | 19.45s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 4 | 4.12s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 4 | 2.76s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 4 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 4 | 98.31s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 2 | 0.34s |

## Archive sweep

Executed at least once: **366/366** research scripts. Latest status: missing_file 23, pass 342, timeout 1.
This run: 238 executed (missing_file 18, pass 219, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-11_q36_star_intertwiner/q36_exact_star_intertwiners.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

