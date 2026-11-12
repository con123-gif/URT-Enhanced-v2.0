# Cathedral orchestrator — ✅ PASS

2026-11-12T07:11:51Z · [run 43170852674](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43170852674) · `dacb5c0` · push on `newtons-cathedral` · checkpoint #57

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 57 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 57 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 57 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 57 | 7.07s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 57 | 11.03s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 57 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 57 | 3.75s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 57 | 3.33s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 57 | 0.32s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 57 | 0.24s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 54 | 8.26s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 57 | 0.48s |
| native | `native.wilson_source` | native | ✅ pass | 57 | 1.27s |
| native | `native.output_gate` | native | ✅ pass | 57 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 57 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 57 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 57 | 0.91s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 57 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 51 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 30 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 30 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 50 | 1.16s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 49 | 53.26s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 48 | 5.73s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 46 | 8.32s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 44 | 17.44s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 43 | 1.93s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 43 | 5.29s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 39 | 36.26s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 39 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 39 | 0.67s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 39 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 39 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 39 | 3.37s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 38 | 0.21s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 37 | 36.31s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 36 | 4.32s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 35 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 34 | 1.71s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 34 | 321.92s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 34 | 5.88s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 34 | 23.42s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 33 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 33 | 64.38s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 33 | 2.93s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 32 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 32 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 31 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 29 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 28 | 87.15s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 27 | 1.85s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 26 | 2.18s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 25 | 4.23s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 23 | 111.3s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 22 | 197.57s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 21 | 39.67s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 20 | 8.85s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 16 | 116.79s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 19 | 18.47s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 17 | 58.56s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 15 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 14 | 3.54s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 13 | 5.24s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 12 | 1.58s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 11 | 3.27s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 10 | 2.22s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 9 | 2.34s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 8 | 2.15s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 6 | 8.41s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 4 | 3.11s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 1 | 7.04s |

## Archive sweep

Executed at least once: **318/318** research scripts. Latest status: missing_file 22, pass 295, timeout 1.
This run: 318 executed (missing_file 22, pass 295, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

