# Cathedral orchestrator — ✅ PASS

2026-11-11T15:38:17Z · [run 43046774186](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43046774186) · `343e98f` · push on `newtons-cathedral` · checkpoint #45

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 45 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 45 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 45 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 45 | 7.55s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 45 | 11.04s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 45 | 0.4s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 45 | 6.09s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 45 | 6.0s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 45 | 0.56s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 45 | 0.42s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 42 | 15.01s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 45 | 0.75s |
| native | `native.wilson_source` | native | ✅ pass | 45 | 1.94s |
| native | `native.output_gate` | native | ✅ pass | 45 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 45 | 0.34s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 45 | 0.23s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 45 | 0.52s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 45 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 39 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 18 | 0.27s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 18 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 38 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 37 | 54.3s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 36 | 5.78s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 34 | 8.31s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 32 | 17.71s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 31 | 1.87s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 31 | 5.21s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 27 | 36.61s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 27 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 27 | 0.74s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 27 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 27 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 27 | 3.91s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 26 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 25 | 38.93s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 24 | 4.54s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 23 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 22 | 1.66s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 22 | 329.26s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 22 | 5.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 22 | 23.17s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 21 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 21 | 62.42s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 21 | 2.93s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 20 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 20 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 19 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 17 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 16 | 87.81s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 15 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 14 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 13 | 4.01s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 11 | 96.26s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 10 | 193.3s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 9 | 38.05s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 8 | 8.07s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 4 | 115.09s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 7 | 16.48s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 5 | 53.73s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 3 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 2 | 3.41s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 1 | 4.94s |

## Archive sweep

Executed at least once: **309/309** research scripts. Latest status: missing_file 22, pass 286, timeout 1.
This run: 282 executed (missing_file 22, pass 260).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

