# Cathedral orchestrator — ✅ PASS

2026-11-11T11:36:36Z · [run 43010731250](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43010731250) · `9d2014c` · push on `newtons-cathedral` · checkpoint #39

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 39 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 39 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 39 | 0.24s |
| tests | `tests.suite` | regression | ✅ pass | 39 | 8.49s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 39 | 6.86s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 39 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 39 | 5.01s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 39 | 4.71s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 39 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 39 | 0.33s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 36 | 11.62s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 39 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 39 | 1.67s |
| native | `native.output_gate` | native | ✅ pass | 39 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 39 | 0.58s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 39 | 0.36s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 39 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 39 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 33 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 12 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 12 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 32 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 31 | 55.59s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 30 | 5.89s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 28 | 8.54s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 26 | 18.11s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 25 | 1.89s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 25 | 5.36s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 21 | 36.83s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 21 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 21 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 21 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 21 | 0.53s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 21 | 3.96s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 20 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 19 | 36.87s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 18 | 4.52s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 17 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 16 | 1.63s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 16 | 332.76s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 16 | 5.7s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 16 | 23.64s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 15 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 15 | 62.27s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 15 | 2.98s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 14 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 14 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 13 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 11 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 10 | 89.48s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 9 | 1.82s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 8 | 2.02s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 7 | 3.97s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 5 | 96.26s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 4 | 193.61s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 3 | 38.19s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 2 | 8.09s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 1 | 16.51s |

## Archive sweep

Executed at least once: **304/304** research scripts. Latest status: missing_file 22, pass 281, timeout 1.
This run: 249 executed (missing_file 11, pass 237, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

