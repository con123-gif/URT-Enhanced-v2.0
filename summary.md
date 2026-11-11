# Cathedral orchestrator — ✅ PASS

2026-11-11T03:30:58Z · [run 42951640371](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42951640371) · `1136279` · push on `newtons-cathedral` · checkpoint #28

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 28 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 28 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 28 | 0.26s |
| tests | `tests.suite` | regression | ✅ pass | 28 | 7.07s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 28 | 6.72s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 28 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 28 | 5.11s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 28 | 4.72s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 28 | 0.41s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 28 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 25 | 11.62s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 28 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 28 | 1.45s |
| native | `native.output_gate` | native | ✅ pass | 28 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 28 | 0.37s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 28 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 28 | 0.49s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 28 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 22 | 0.07s |
| research | `research.missing_intermediates` | independent | ✅ pass | 1 | 0.16s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 1 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 21 | 0.88s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 20 | 33.43s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 19 | 3.63s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 17 | 5.38s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 15 | 10.98s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 14 | 1.52s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 14 | 4.07s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 10 | 23.09s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 10 | 0.16s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 10 | 0.48s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 10 | 0.44s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 10 | 0.37s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 10 | 2.17s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 9 | 0.14s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 8 | 23.11s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 7 | 2.57s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 6 | 0.47s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 5 | 1.14s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 5 | 200.21s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 5 | 4.25s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 5 | 14.87s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 4 | 0.48s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 4 | 40.99s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 4 | 1.79s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 3 | 0.13s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 3 | 0.46s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 2 | 0.07s |

**Changed since last run:** `research.missing_intermediates` error → pass

## Archive sweep

Executed at least once: **293/293** research scripts. Latest status: missing_file 22, pass 271.
This run: 293 executed (missing_file 22, pass 271).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

