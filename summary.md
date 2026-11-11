# Cathedral orchestrator — ✅ PASS

2026-11-11T08:47:43Z · [run 42987376505](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42987376505) · `6f92e55` · push on `newtons-cathedral` · checkpoint #36

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 36 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 36 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 36 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 36 | 9.44s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 36 | 5.57s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 36 | 0.22s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 36 | 6.24s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 36 | 5.95s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 36 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 36 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 33 | 14.79s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 36 | 0.79s |
| native | `native.wilson_source` | native | ✅ pass | 36 | 1.28s |
| native | `native.output_gate` | native | ✅ pass | 36 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 36 | 0.47s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 36 | 0.3s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 36 | 0.7s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 36 | 0.1s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 30 | 0.06s |
| research | `research.missing_intermediates` | independent | ✅ pass | 9 | 0.15s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 9 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 29 | 0.6s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 28 | 29.47s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 27 | 3.12s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 25 | 4.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 23 | 9.44s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 22 | 0.97s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 22 | 2.73s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 18 | 19.81s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 18 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 18 | 0.38s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 18 | 0.36s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 18 | 0.3s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 18 | 1.73s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 17 | 0.11s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 16 | 19.91s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 15 | 2.23s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 14 | 0.4s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 13 | 0.92s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 13 | 153.45s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 13 | 2.93s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 13 | 12.39s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 12 | 0.38s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 12 | 36.92s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 12 | 1.57s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 11 | 0.11s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 11 | 0.33s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 10 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 8 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 7 | 46.93s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 6 | 1.06s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 5 | 1.17s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 4 | 2.31s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 2 | 53.18s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 1 | 114.13s |

## Archive sweep

Executed at least once: **301/301** research scripts. Latest status: missing_file 22, pass 278, timeout 1.
This run: 301 executed (missing_file 22, pass 278, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

