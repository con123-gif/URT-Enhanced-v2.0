# Cathedral orchestrator — ✅ PASS

2026-11-11T10:34:43Z · [run 43002158646](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43002158646) · `1988002` · push on `newtons-cathedral` · checkpoint #38

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 38 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 38 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 38 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 38 | 7.25s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 38 | 11.01s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 38 | 0.4s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 38 | 4.63s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 38 | 4.58s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 38 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 38 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 35 | 11.31s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 38 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 38 | 1.89s |
| native | `native.output_gate` | native | ✅ pass | 38 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 38 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 38 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 38 | 0.83s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 38 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 32 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 11 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 11 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 31 | 1.15s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 30 | 56.19s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 29 | 6.02s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 27 | 8.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 25 | 18.27s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 24 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 24 | 5.26s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 20 | 37.29s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 20 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 20 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 20 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 20 | 0.53s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 20 | 3.92s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 19 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 18 | 36.97s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 17 | 4.51s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 16 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 15 | 1.62s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 15 | 327.95s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 15 | 5.61s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 15 | 23.72s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 14 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 14 | 61.87s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 14 | 3.09s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 13 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 13 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 12 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 10 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 9 | 93.22s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 8 | 1.81s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 7 | 2.01s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 6 | 4.01s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 4 | 95.76s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 3 | 192.66s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 2 | 38.03s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 1 | 8.06s |

## Archive sweep

Executed at least once: **303/303** research scripts. Latest status: missing_file 22, pass 280, timeout 1.
This run: 290 executed (missing_file 20, pass 269, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

