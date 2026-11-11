# Cathedral orchestrator — ✅ PASS

2026-11-11T13:39:50Z · [run 43027965104](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43027965104) · `080a4c4` · push on `newtons-cathedral` · checkpoint #43

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 43 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 43 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 43 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 43 | 8.98s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 43 | 6.58s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 43 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 43 | 4.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 43 | 4.73s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 43 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 43 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 40 | 11.52s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 43 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 43 | 0.99s |
| native | `native.output_gate` | native | ✅ pass | 43 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 43 | 0.59s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 43 | 0.36s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 43 | 0.93s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 43 | 0.13s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 37 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 16 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 16 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 36 | 1.13s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 35 | 53.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 34 | 5.86s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 32 | 8.51s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 30 | 17.62s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 29 | 1.89s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 29 | 5.19s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 25 | 36.51s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 25 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 25 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 25 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 25 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 25 | 3.98s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 24 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 23 | 36.39s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 22 | 4.55s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 21 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 20 | 1.66s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 20 | 330.97s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 20 | 5.73s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 20 | 22.94s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 19 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 19 | 61.87s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 19 | 2.92s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 18 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 18 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 17 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 15 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 14 | 86.7s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 13 | 1.82s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 12 | 2.04s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 11 | 3.96s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 9 | 95.61s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 8 | 193.69s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 7 | 38.13s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 6 | 8.11s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 2 | 115.72s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 5 | 16.5s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 3 | 53.85s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 1 | 0.34s |

## Archive sweep

Executed at least once: **307/307** research scripts. Latest status: missing_file 22, pass 284, timeout 1.
This run: 121 executed (missing_file 4, pass 116, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

