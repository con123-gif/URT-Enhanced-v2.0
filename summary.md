# Cathedral orchestrator — ✅ PASS

2026-11-12T12:32:41Z · [run 43215542851](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43215542851) · `d00d20e` · push on `newtons-cathedral` · checkpoint #66

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 66 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 66 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 66 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 66 | 9.09s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 66 | 10.9s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 66 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 66 | 5.13s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 66 | 4.56s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 66 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 66 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 63 | 11.48s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 66 | 0.58s |
| native | `native.wilson_source` | native | ✅ pass | 66 | 0.93s |
| native | `native.output_gate` | native | ✅ pass | 66 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 66 | 0.72s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 66 | 0.4s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 66 | 0.89s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 66 | 0.31s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 60 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 39 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 39 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 59 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 58 | 53.14s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 57 | 5.67s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 55 | 8.17s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 53 | 17.07s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 52 | 1.87s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 52 | 5.27s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 48 | 35.9s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 48 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 48 | 0.69s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 48 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 48 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 48 | 3.86s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 47 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 46 | 36.1s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 45 | 4.45s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 44 | 0.66s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 43 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 43 | 325.96s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 43 | 5.61s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 43 | 22.52s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 42 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 42 | 60.91s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 42 | 2.84s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 41 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 41 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 40 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 38 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 37 | 85.26s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 36 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 35 | 1.97s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 34 | 3.94s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 32 | 95.37s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 31 | 191.29s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 30 | 37.77s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 29 | 8.01s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 25 | 109.05s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 28 | 16.37s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 26 | 53.39s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 24 | 0.32s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 23 | 3.34s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 22 | 4.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 21 | 1.49s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 20 | 3.06s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 19 | 2.03s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 18 | 2.27s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 17 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 15 | 8.8s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 13 | 3.08s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 4 | 0.57s |
| research | `research.q53_native_onshell_ward_clock` | native | ✅ pass | 3 | 0.64s |
| research | `research.q56_full_stationary_current` | native | ✅ pass | 3 | 0.64s |
| research | `research.q58_native_coupling_curvature` | native | ✅ pass | 2 | 0.58s |
| research | `research.q57_native_clock_geometry` | native | ✅ pass | 2 | 0.6s |
| research | `research.q55_hopf_wilson_ward` | native | ✅ pass | 1 | 0.96s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 10 | 8.44s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 9 | 2.76s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 8 | 1.12s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 7 | 3.03s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 6 | 0.9s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 5 | 6.86s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 4 | 0.93s |

## Archive sweep

Executed at least once: **331/331** research scripts. Latest status: missing_file 23, pass 307, timeout 1.
This run: 283 executed (missing_file 23, pass 260).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

