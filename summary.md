# Cathedral orchestrator — ✅ PASS

2026-11-11T13:02:36Z · [run 43021167225](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43021167225) · `8af6e07` · push on `newtons-cathedral` · checkpoint #42

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 42 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 42 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 42 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 42 | 8.18s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 42 | 6.84s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 42 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 42 | 5.0s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 42 | 4.66s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 42 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 42 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 39 | 11.52s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 42 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 42 | 1.5s |
| native | `native.output_gate` | native | ✅ pass | 42 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 42 | 0.57s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 42 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 42 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 42 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 36 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 15 | 0.21s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 15 | 0.05s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 35 | 0.87s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 34 | 41.57s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 33 | 4.46s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 31 | 6.74s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 29 | 13.48s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 28 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 28 | 4.31s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 24 | 28.02s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 24 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 24 | 0.54s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 24 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 24 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 24 | 2.63s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 23 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 22 | 28.49s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 21 | 3.37s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 20 | 0.53s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 19 | 1.37s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 19 | 240.71s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 19 | 4.69s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 19 | 17.68s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 18 | 0.52s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 18 | 53.14s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 18 | 2.26s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 17 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 17 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 16 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 14 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 13 | 67.37s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 12 | 1.49s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 11 | 1.7s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 10 | 3.44s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 8 | 86.07s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 7 | 154.16s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 6 | 31.04s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 5 | 6.82s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 1 | 92.31s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 4 | 14.36s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 2 | 45.24s |

## Archive sweep

Executed at least once: **306/306** research scripts. Latest status: missing_file 22, pass 283, timeout 1.
This run: 297 executed (missing_file 22, pass 275).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

