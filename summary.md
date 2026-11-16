# Cathedral orchestrator — ✅ PASS

2026-11-16T15:45:16Z · [run 43895672708](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43895672708) · `fe0c697` · push on `newtons-cathedral` · checkpoint #174

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 174 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 174 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 174 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 174 | 21.02s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 174 | 8.97s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 174 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 174 | 6.08s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 174 | 5.94s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 174 | 0.54s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 174 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 171 | 14.77s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 174 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 174 | 1.37s |
| native | `native.output_gate` | native | ✅ pass | 174 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 174 | 0.5s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 174 | 0.25s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 174 | 0.61s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 174 | 0.15s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 168 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 147 | 0.3s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 147 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 167 | 0.85s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 166 | 42.59s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 165 | 4.49s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 163 | 6.59s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 161 | 13.81s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 160 | 1.65s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 160 | 4.39s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 156 | 28.27s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 156 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 156 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 156 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 156 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 156 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 155 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 154 | 28.4s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 153 | 3.35s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 152 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 151 | 1.51s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 151 | 1.16s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 151 | 4.8s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 151 | 17.95s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 150 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 150 | 59.75s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 150 | 2.33s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 149 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 149 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 148 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 146 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 145 | 51.37s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 144 | 1.61s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 143 | 1.77s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 142 | 3.78s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 140 | 55.85s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 139 | 121.87s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 138 | 31.54s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 137 | 7.14s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 133 | 80.26s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 136 | 14.65s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 134 | 47.48s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 132 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 131 | 3.1s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 130 | 4.72s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 129 | 1.35s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 128 | 2.73s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 127 | 1.82s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 126 | 1.97s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 125 | 1.89s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 123 | 6.98s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 121 | 2.63s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 112 | 0.45s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 111 | 0.52s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 111 | 0.51s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 110 | 0.45s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 110 | 0.47s |
| research | `research.q59_time_generator` | native | ✅ pass | 108 | 0.64s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 106 | 13.88s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 105 | 51.82s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 103 | 15.12s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 102 | 18.87s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 97 | 24.42s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 91 | 15.9s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 85 | 52.84s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 81 | 25.13s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 79 | 26.1s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 109 | 0.63s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 108 | 0.97s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 118 | 5.43s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 117 | 1.91s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 116 | 0.81s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 115 | 2.44s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 114 | 0.68s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 113 | 5.48s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 112 | 0.61s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 100 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 99 | 0.51s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 98 | 0.41s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 98 | 0.26s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 98 | 0.26s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 97 | 1.57s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 96 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 96 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 96 | 18.43s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 96 | 0.27s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 96 | 0.36s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 94 | 0.77s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 93 | 0.6s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 92 | 1.03s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 90 | 2.66s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 88 | 0.73s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 86 | 3.26s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 84 | 9.01s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 82 | 0.86s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 78 | 11.89s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 77 | 19.48s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 76 | 3.55s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 76 | 2.32s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 71 | 24.65s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 66 | 30.71s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 55 | 27.04s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 76 | 0.05s |
| engine | `engine.benchmark` | regression | ✅ pass | 76 | 85.04s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 74 | 0.31s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 72 | 0.4s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 70 | 1.12s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 69 | 0.37s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 68 | 1.07s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 67 | 0.4s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 65 | 0.69s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 63 | 0.03s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 63 | 2.04s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 63 | 7.17s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 63 | 0.08s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 62 | 0.07s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 62 | 0.04s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 61 | 0.77s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 61 | 0.23s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 60 | 6.48s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 59 | 1.86s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 56 | 23.66s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 56 | 23.95s |
| research | `research.q102_born_current` | conditional | ✅ pass | 56 | 23.6s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 56 | 24.18s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 54 | 32.69s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 53 | 3.41s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 53 | 27.39s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 52 | 27.5s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 51 | 27.5s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 48 | 30.34s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 48 | 28.21s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 49 | 30.48s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 48 | 39.6s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 48 | 52.8s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 47 | 0.39s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 44 | 53.43s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 45 | 2.08s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 43 | 1.03s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 37 | 40.11s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 40 | 0.62s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 39 | 0.71s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 39 | 19.99s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 38 | 0.52s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 37 | 0.51s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 37 | 0.32s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 35 | 53.63s |
| research | `research.q104_clock_transport` | native | ✅ pass | 33 | 44.52s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 30 | 2.67s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 32 | 20.96s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 29 | 0.06s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 28 | 0.3s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 26 | 0.27s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 25 | 0.23s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 18 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 17 | 1.91s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 15 | 0.58s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 14 | 0.59s |
| research | `research.q161h_hidden_shift` | native | ✅ pass | 11 | 0.62s |
| research | `research.q161i_hidden_second_order` | native | ✅ pass | 10 | 0.74s |
| research | `research.q161j_two_vertex_hidden` | native | ✅ pass | 9 | 2.19s |
| research | `research.q161k_native_stacked_sources` | native | ✅ pass | 8 | 1.34s |
| research | `research.q161l_axis_orbit` | conditional | ✅ pass | 6 | 21.21s |
| research | `research.q161n_parity_source` | conditional | ✅ pass | 5 | 0.17s |
| research | `research.q161p_full_kernel_upstream` | conditional | ✅ pass | 4 | 0.94s |
| research | `research.q161r_parity_source_selection` | native | ✅ pass | 3 | 0.23s |
| research | `research.q161t_native_face_source` | conditional | ✅ pass | 1 | 1.8s |

## Archive sweep

Executed at least once: **444/444** research scripts. Latest status: missing_file 23, pass 420, timeout 1.
This run: 79 executed (pass 79).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-15_q152_native_physical_hessian/Q152_PHYSICAL_HESSIAN_AND_NEWTON.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

