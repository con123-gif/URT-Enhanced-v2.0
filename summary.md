# Cathedral orchestrator — ✅ PASS

2026-11-16T04:47:13Z · [run 43803210665](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43803210665) · `c102e7a` · push on `newtons-cathedral` · checkpoint #169

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 169 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 169 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 169 | 0.34s |
| tests | `tests.suite` | regression | ✅ pass | 169 | 12.87s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 169 | 9.58s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 169 | 0.33s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 169 | 4.93s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 169 | 4.77s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 169 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 169 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 166 | 11.46s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 169 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 169 | 1.14s |
| native | `native.output_gate` | native | ✅ pass | 169 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 169 | 0.49s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 169 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 169 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 169 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 163 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 142 | 0.31s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 142 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 162 | 1.13s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 161 | 54.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 160 | 5.74s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 158 | 8.3s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 156 | 17.42s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 155 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 155 | 5.24s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 151 | 36.4s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 151 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 151 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 151 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 151 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 151 | 3.94s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 150 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 149 | 36.52s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 148 | 4.54s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 147 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 146 | 1.61s |
| research_heavy | `research.registry_induced_vacuum` | conditional | ✅ pass | 146 | 1.57s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 146 | 5.62s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 146 | 23.23s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 145 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 145 | 61.72s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 145 | 2.93s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 144 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 144 | 0.6s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 143 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 141 | 0.03s |
| research_heavy | `research.q24_history_symmetries` | native | ✅ pass | 140 | 67.72s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 139 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 138 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 137 | 3.93s |
| research_heavy | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 135 | 85.23s |
| research_heavy | `research.q31_rational_similarity` | native | ✅ pass | 134 | 152.68s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 133 | 38.54s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 132 | 8.02s |
| research_heavy | `research.q36_rational_star_intertwiners` | native | ✅ pass | 128 | 89.56s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 131 | 16.39s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 129 | 53.75s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 127 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 126 | 3.36s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 125 | 4.92s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 124 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 123 | 3.08s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 122 | 2.03s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 121 | 2.25s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 120 | 2.02s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 118 | 8.91s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 116 | 3.11s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 107 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 106 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 106 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 105 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 105 | 0.6s |
| research | `research.q59_time_generator` | native | ✅ pass | 103 | 0.81s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 101 | 17.67s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 100 | 65.92s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 98 | 19.07s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 97 | 23.61s |
| research | `research.q72_time_reversal_bridge` | conditional | ✅ pass | 92 | 31.23s |
| research | `research.q73_joint_clock_bridge` | conditional | ✅ pass | 86 | 20.15s |
| research | `research.q77_exact_clock_split` | conditional | ✅ pass | 80 | 70.19s |
| research | `research.q82_oriented_source_weights` | conditional | ✅ pass | 76 | 31.04s |
| research | `research.q85_chronology_coefficient` | conditional | ✅ pass | 74 | 31.95s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 104 | 0.98s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 103 | 1.42s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 113 | 8.55s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 112 | 2.74s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 111 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 110 | 3.11s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 109 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 108 | 6.98s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 107 | 0.96s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 95 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 94 | 0.64s |
| research | `research.q68_native_bridge_polytope` | native | ✅ pass | 93 | 0.5s |
| research | `research.q64_a2d_reversible_normalizer` | conditional | ✅ pass | 93 | 0.32s |
| research | `research.q64_a2c_native_lift_partition` | conditional | ✅ pass | 93 | 0.31s |
| research | `research.q71_q2_clock_mixing` | native | ✅ pass | 92 | 2.02s |
| research | `research.q64_a2b_native_path_likelihood` | native | ✅ pass | 91 | 0.02s |
| research | `research.q64_a2_native_conditioning` | conditional | ✅ pass | 91 | 0.02s |
| research | `research.q60_native_coordinate_selection` | native | ✅ pass | 91 | 26.81s |
| research | `research.q60_charge_tensor_ward` | conditional | ✅ pass | 91 | 0.33s |
| research | `research.cross_archive_photon_join` | conditional | ✅ pass | 91 | 0.44s |
| research | `research.q71_native_q3_clock` | native | ✅ pass | 89 | 0.96s |
| research | `research.q75_native_q3_sigma_commutator` | native | ✅ pass | 88 | 0.73s |
| research | `research.q76_native_hidden_commutator_overlap` | native | ✅ pass | 87 | 1.29s |
| research | `research.q78_eight_dictionary_hidden` | native | ✅ pass | 85 | 3.45s |
| research | `research.q79_native_nonlinear_pair_source` | native | ✅ pass | 83 | 0.95s |
| research | `research.q80_native_hidden_source_selection` | native | ✅ pass | 81 | 4.38s |
| research | `research.q81_native_all_five_source_radical` | native | ✅ pass | 79 | 13.15s |
| research | `research.q83_native_hidden_clock_quotient` | native | ✅ pass | 77 | 1.1s |
| research | `research.q89_exact_source_all_dictionaries` | native | ✅ pass | 73 | 18.24s |
| research | `research.q90_exact_native_fourier` | native | ✅ pass | 72 | 31.28s |
| engine | `research.q88_q89_engine_recovery` | independent | ✅ pass | 71 | 5.32s |
| engine | `research.q90_source_clock_energies` | independent | ✅ pass | 71 | 3.62s |
| engine | `research.q86_parity_history_energy` | native | ✅ pass | 66 | 36.5s |
| research | `research.q91_bridge_loss_sequence` | native | ✅ pass | 61 | 37.98s |
| research | `research.q92_clock_overlap_reading` | conditional | ✅ pass | 50 | 33.54s |
| engine | `engine.evidence_ledger` | regression | ✅ pass | 71 | 0.07s |
| engine | `engine.benchmark` | regression | ✅ pass | 71 | 125.16s |
| research | `research.q87_coefficient_elimination` | conditional | ✅ pass | 69 | 0.39s |
| research | `research.q87b_native_bridge_parity_rayleigh` | conditional | ✅ pass | 67 | 0.53s |
| research | `research.q87c_native_bridge_singular_spectrum` | conditional | ✅ pass | 65 | 1.53s |
| research | `research.q87d_native_parity_commutator` | conditional | ✅ pass | 64 | 0.48s |
| research | `research.q87e_native_parity_energy` | conditional | ✅ pass | 63 | 1.46s |
| research | `research.q87f_native_bridge_trace` | conditional | ✅ pass | 62 | 0.53s |
| research | `research.q87g_native_second_moment` | conditional | ✅ pass | 60 | 0.94s |
| research | `research.q93_primitive_clock_trace` | native | ✅ pass | 58 | 0.04s |
| research | `research.q94_native_hidden_clock` | native | ✅ pass | 58 | 2.72s |
| research | `research.q95_source_carrier_exact` | native | ✅ pass | 58 | 11.35s |
| research | `research.q95_full_five_numeric` | native | ✅ pass | 58 | 0.09s |
| research | `research.q96_original_action_mismatch` | native | ✅ pass | 57 | 0.09s |
| research | `research.q96_original_source_chebyshev` | independent | ✅ pass | 57 | 0.06s |
| research | `research.q97_face_locality_exact` | native | ✅ pass | 56 | 1.03s |
| research | `research.q97_five_solid_locality` | native | ✅ pass | 56 | 0.28s |
| research | `research.q98_recovered_asymmetry` | conditional | ✅ pass | 55 | 9.69s |
| research | `research.q99_native_parity_rigidity` | native | ✅ pass | 54 | 2.34s |
| research | `research.q101_moving_arf` | conditional | ✅ pass | 51 | 37.65s |
| research | `research.q101_magnetic_factor` | conditional | ✅ pass | 51 | 38.08s |
| research | `research.q102_born_current` | conditional | ✅ pass | 51 | 37.77s |
| research | `research.q103_alltime_spectral_counting` | conditional | ✅ pass | 51 | 37.74s |
| research | `research.q105_broken_charged_wilson` | conditional | ✅ pass | 49 | 51.27s |
| research | `research.q106_exact_charged_berry` | native | ✅ pass | 48 | 4.39s |
| research | `research.q106_joined_native_wilson` | conditional | ✅ pass | 48 | 41.97s |
| research | `research.q107_chern_berry_wilson` | conditional | ✅ pass | 47 | 42.01s |
| research | `research.q108_native_born_fisher` | conditional | ✅ pass | 46 | 42.38s |
| research | `research.q109_full_joined_gauge` | conditional | ✅ pass | 43 | 45.29s |
| research_heavy | `research.q109_2d_descent` | conditional | ✅ pass | 43 | 34.61s |
| research | `research.q111_charge_bundle_period` | conditional | ✅ pass | 44 | 46.19s |
| research_heavy | `research.q112_clock_g5_leak` | conditional | ✅ pass | 43 | 53.3s |
| research | `research.q113_native_mixed_spectral_variance` | conditional | ✅ pass | 43 | 70.3s |
| research | `research.q114_hidden_distance` | native | ✅ pass | 42 | 0.47s |
| research | `research.q115_native_a5_four_pole_source` | conditional | ✅ pass | 39 | 70.33s |
| research | `research.q116_local_wedge_golden_bridge` | independent | ✅ pass | 40 | 2.72s |
| research | `research.q118_native_complement_spectrum` | native | ✅ pass | 38 | 1.34s |
| research_heavy | `research.q117a_mixed_hidden_current` | conditional | ✅ pass | 32 | 55.55s |
| research | `research.q119_native_contact_scale` | native | ✅ pass | 35 | 0.84s |
| research | `research.q120_moving_reversal_barrier` | independent | ✅ pass | 34 | 0.96s |
| research_heavy | `research.q122_moving_charged_branch_current` | conditional | ✅ pass | 34 | 23.67s |
| research | `research.q123_golden_saddle_capacity` | conditional | ✅ pass | 33 | 0.65s |
| research | `research.q124_native_charged_barrier` | conditional | ✅ pass | 32 | 0.69s |
| research | `research.q126_kinetic_clock_no_go` | independent | ✅ pass | 32 | 0.41s |
| research | `research.q118b_quartet_multiplicity` | native | ✅ pass | 30 | 71.27s |
| research | `research.q104_clock_transport` | native | ✅ pass | 28 | 52.4s |
| research | `research.q127_unitary_connection` | native | ✅ pass | 25 | 3.42s |
| research_heavy | `research.q125_native_hidden_charged` | conditional | ✅ pass | 27 | 24.34s |
| research | `research.q144_shell_equitable_recovery` | independent | ✅ pass | 24 | 0.07s |
| research | `research.q139_q146_context_recovery` | independent | ✅ pass | 23 | 0.36s |
| research | `research.q147_weighted_link_recovery` | conditional | ✅ pass | 21 | 0.33s |
| research | `research.q149_original_528_flux` | native | ✅ pass | 20 | 0.28s |
| research | `research.q160_native_gap_robustness` | conditional | ✅ pass | 13 | 0.02s |
| research | `research.q161_native_gram_spectrum` | conditional | ✅ pass | 12 | 2.43s |
| research | `research.q161e_native_hidden_rank` | native | ✅ pass | 10 | 0.72s |
| research | `research.q161f_clock_hidden_rank` | conditional | ✅ pass | 9 | 0.73s |
| research | `research.q161h_hidden_shift` | native | ✅ pass | 6 | 0.77s |
| research | `research.q161i_hidden_second_order` | native | ✅ pass | 5 | 0.92s |
| research | `research.q161j_two_vertex_hidden` | native | ✅ pass | 4 | 2.78s |
| research | `research.q161k_native_stacked_sources` | native | ✅ pass | 3 | 1.74s |
| research | `research.q161l_axis_orbit` | conditional | ✅ pass | 1 | 26.71s |

## Archive sweep

Executed at least once: **440/440** research scripts. Latest status: missing_file 23, pass 415, timeout 2.
This run: 143 executed (missing_file 4, pass 139).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-15_q153_full_physical_stability/Q153_FULL_NATIVE_TRANSVERSE_HESSIAN.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

