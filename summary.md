# Cathedral orchestrator — ✅ PASS

2026-11-13T04:14:31Z · [run 43361564949](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43361564949) · `9c2af5a` · push on `newtons-cathedral` · checkpoint #76

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 76 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 76 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 76 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 76 | 6.2s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 76 | 10.69s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 76 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 76 | 3.5s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 76 | 3.36s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 76 | 0.33s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 76 | 0.25s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 73 | 8.32s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 76 | 0.49s |
| native | `native.wilson_source` | native | ✅ pass | 76 | 1.32s |
| native | `native.output_gate` | native | ✅ pass | 76 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 76 | 0.46s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 76 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 76 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 76 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 70 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 49 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 49 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 69 | 1.16s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 68 | 54.39s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 67 | 5.8s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 65 | 8.37s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 63 | 17.62s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 62 | 1.89s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 62 | 5.28s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 58 | 36.32s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 58 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 58 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 58 | 0.68s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 58 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 58 | 3.89s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 57 | 0.25s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 56 | 36.47s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 55 | 4.45s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 54 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 53 | 1.66s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 53 | 325.6s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 53 | 5.61s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 53 | 22.9s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 52 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 52 | 62.45s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 52 | 2.89s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 51 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 51 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 50 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 48 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 47 | 87.22s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 46 | 1.78s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 45 | 1.99s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 44 | 3.94s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 42 | 95.2s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 41 | 192.84s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 40 | 38.78s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 39 | 8.01s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 35 | 109.66s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 38 | 16.38s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 36 | 53.72s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 34 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 33 | 3.35s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 32 | 4.96s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 31 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 30 | 3.05s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 29 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 28 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 27 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 25 | 8.77s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 23 | 3.08s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 14 | 0.56s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 13 | 0.65s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 13 | 0.63s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 12 | 0.57s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 12 | 0.58s |
| research | `research.q59_time_generator` | native | ✅ pass | 10 | 0.79s |
| research | `research.q61_inverse_limit_lifts` | native | ✅ pass | 8 | 17.88s |
| research | `research.q62_lift_carrier` | native | ✅ pass | 7 | 67.62s |
| research | `research.q64_conditioned_selection` | conditional | ✅ pass | 5 | 19.13s |
| research | `research.q65_horizon_selection` | conditional | ✅ pass | 4 | 23.69s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 11 | 0.96s |
| research | `research.q60_hopf_h64_frame` | native | ✅ pass | 10 | 1.42s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 20 | 8.38s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 19 | 2.76s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 18 | 1.11s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 17 | 3.11s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 16 | 0.88s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 15 | 6.95s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 14 | 0.93s |
| research | `research.q69_native_lift_clock_spectrum` | native | ✅ pass | 2 | 0.01s |
| research | `research.q70_native_clock_fixed_space` | native | ✅ pass | 1 | 0.66s |

## Archive sweep

Executed at least once: **339/339** research scripts. Latest status: missing_file 23, pass 313, timeout 3.
This run: 136 executed (missing_file 5, pass 129, timeout 2).
Regressions (passed before, failing now, same source): `research_archive/2026-11-11_q36_star_intertwiner/q36_exact_star_intertwiners.py`, `research_archive/2026-11-10_induced_photon/INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

