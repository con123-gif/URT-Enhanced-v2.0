# Cathedral orchestrator — ✅ PASS

2026-11-12T10:47:39Z · [run 43200275671](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43200275671) · `998758b` · push on `newtons-cathedral` · checkpoint #62

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 62 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 62 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 62 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 62 | 10.62s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 62 | 5.91s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 62 | 0.26s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 62 | 6.42s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 62 | 6.17s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 62 | 0.57s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 62 | 0.43s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 59 | 15.1s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 62 | 0.85s |
| native | `native.wilson_source` | native | ✅ pass | 62 | 1.68s |
| native | `native.output_gate` | native | ✅ pass | 62 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 62 | 0.64s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 62 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 62 | 0.83s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 62 | 0.16s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 56 | 0.13s |
| research | `research.missing_intermediates` | independent | ✅ pass | 35 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 35 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 55 | 1.21s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 54 | 53.1s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 53 | 5.76s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 51 | 8.29s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 49 | 17.2s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 48 | 1.89s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 48 | 5.24s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 44 | 36.25s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 44 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 44 | 0.75s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 44 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 44 | 0.52s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 44 | 3.95s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 43 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 42 | 36.2s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 41 | 4.45s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 40 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 39 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 39 | 326.49s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 39 | 5.62s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 39 | 22.64s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 38 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 38 | 61.95s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 38 | 2.89s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 37 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 37 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 36 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 34 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 33 | 85.73s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 32 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 31 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 30 | 3.96s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 28 | 95.19s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 27 | 192.44s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 26 | 38.08s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 25 | 8.05s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 21 | 114.63s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 24 | 16.42s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 22 | 53.39s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 20 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 19 | 3.36s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 18 | 4.94s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 17 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 16 | 3.07s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 15 | 2.03s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 14 | 2.23s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 13 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 11 | 8.74s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 9 | 3.09s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 6 | 8.45s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 5 | 2.77s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 4 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 3 | 3.06s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 2 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 1 | 6.86s |

## Archive sweep

Executed at least once: **323/323** research scripts. Latest status: missing_file 23, pass 299, timeout 1.
This run: 323 executed (missing_file 23, pass 299, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

