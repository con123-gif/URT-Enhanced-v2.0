# Cathedral orchestrator — ❌ FAIL

2026-11-13T14:42:19Z · [run 43441567145](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43441567145) · `1d71e5d` · push on `newtons-cathedral` · checkpoint #92

**Gating failures:** `research.q83_native_hidden_clock_quotient`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 92 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 92 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 92 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 92 | 7.01s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 92 | 9.09s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 92 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 92 | 4.69s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 92 | 4.71s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 92 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 92 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 89 | 11.51s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 92 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 92 | 1.78s |
| native | `native.output_gate` | native | ✅ pass | 92 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 92 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 92 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 92 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 92 | 0.14s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 86 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 65 | 0.22s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 65 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 85 | 1.06s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 84 | 46.51s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 83 | 4.99s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 81 | 7.41s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 79 | 15.14s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 78 | 1.76s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 78 | 4.92s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 74 | 31.66s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 74 | 0.21s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 74 | 0.64s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 74 | 0.59s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 74 | 0.48s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 74 | 2.95s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 73 | 0.19s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 72 | 31.75s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 71 | 3.58s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 70 | 0.59s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 69 | 1.41s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 69 | 250.51s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 69 | 5.16s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 69 | 19.91s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 68 | 0.59s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 68 | 54.44s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 68 | 2.51s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 67 | 0.19s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 67 | 0.59s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 66 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 64 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 63 | 76.45s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 62 | 1.62s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 61 | 1.76s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 60 | 3.45s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 58 | 68.8s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 57 | 180.59s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 56 | 34.88s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 55 | 6.25s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 51 | 101.46s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 54 | 12.4s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 52 | 40.59s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 50 | 0.3s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 49 | 2.93s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 48 | 4.45s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 47 | 1.38s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 46 | 2.74s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 45 | 1.79s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 44 | 1.93s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 43 | 1.79s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 41 | 7.28s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 39 | 2.66s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 30 | 0.51s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 29 | 0.57s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 29 | 0.59s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 28 | 0.51s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 28 | 0.52s |
| research | `research.q59_time_generator` | native | ✅ pass | 26 | 0.7s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 24 | 15.34s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 23 | 56.54s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 21 | 16.53s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 20 | 21.13s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 15 | 27.45s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 9 | 17.45s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 3 | 58.32s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 27 | 0.73s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 26 | 1.13s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 36 | 7.51s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 35 | 2.53s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 34 | 1.04s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 33 | 2.62s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 32 | 0.84s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 31 | 5.97s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 30 | 0.71s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 18 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 17 | 0.53s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 16 | 0.41s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 16 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 16 | 0.31s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 15 | 1.75s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 14 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 14 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 14 | 24.45s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 14 | 0.34s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 14 | 0.43s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 12 | 0.89s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 11 | 0.7s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 10 | 1.17s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 8 | 3.08s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 6 | 0.89s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 4 | 3.66s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 2 | 11.89s |
| research | `research.q83_native_hidden_clock_quotient` | native | ❌ error — NameError: name 'j' is not defined | 0 | 0.28s |

## Archive sweep

Executed at least once: **359/359** research scripts. Latest status: error 1, missing_file 23, pass 334, timeout 1.
This run: 349 executed (error 1, missing_file 23, pass 324, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

