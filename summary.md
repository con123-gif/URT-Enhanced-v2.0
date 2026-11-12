# Cathedral orchestrator — ✅ PASS

2026-11-12T04:14:15Z · [run 43151330223](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43151330223) · `f639c68` · schedule on `newtons-cathedral` · checkpoint #53

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 53 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 53 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 53 | 0.25s |
| tests | `tests.suite` | regression | ✅ pass | 53 | 8.27s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 53 | 10.79s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 53 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 53 | 6.16s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 53 | 5.97s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 53 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 53 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 50 | 14.71s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 53 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 53 | 1.65s |
| native | `native.output_gate` | native | ✅ pass | 53 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 53 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 53 | 0.32s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 53 | 0.8s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 53 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 47 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 26 | 0.17s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 26 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 46 | 0.68s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 45 | 31.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 44 | 3.45s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 42 | 5.1s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 40 | 10.51s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 39 | 1.08s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 39 | 3.03s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 35 | 21.95s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 35 | 0.14s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 35 | 0.43s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 35 | 0.4s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 35 | 0.33s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 35 | 1.92s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 34 | 0.13s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 33 | 21.51s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 32 | 2.43s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 31 | 0.46s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 30 | 0.98s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 30 | 169.02s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 30 | 3.27s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 30 | 13.65s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 29 | 0.48s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 29 | 40.15s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 29 | 1.74s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 28 | 0.13s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 28 | 0.37s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 27 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 25 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 24 | 51.51s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 23 | 1.17s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 22 | 1.29s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 21 | 2.57s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 19 | 56.77s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 18 | 118.46s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 17 | 22.33s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 16 | 4.86s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 12 | 67.16s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 15 | 9.91s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 13 | 31.73s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 11 | 0.2s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 10 | 2.12s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 9 | 3.24s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 8 | 0.96s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 7 | 1.95s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 6 | 1.29s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 5 | 1.38s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 4 | 1.28s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 2 | 4.96s |

## Archive sweep

Executed at least once: **315/315** research scripts. Latest status: missing_file 22, pass 292, timeout 1.
This run: 244 executed (missing_file 18, pass 225, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

