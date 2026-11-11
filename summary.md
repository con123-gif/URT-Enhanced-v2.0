# Cathedral orchestrator — ✅ PASS

2026-11-11T02:47:47Z · [run 42946094242](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42946094242) · `d845f87` · push on `newtons-cathedral` · checkpoint #25

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 25 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 25 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 25 | 0.26s |
| tests | `tests.suite` | regression | ✅ pass | 25 | 7.34s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 25 | 6.67s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 25 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 25 | 5.99s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 25 | 5.96s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 25 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 25 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 22 | 14.76s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 25 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 25 | 1.6s |
| native | `native.output_gate` | native | ✅ pass | 25 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 25 | 0.44s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 25 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 25 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 25 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 19 | 0.06s |
| research | `research.missing_intermediates` | independent | ✅ pass | 15 | 0.14s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 18 | 0.64s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 17 | 29.54s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 16 | 3.11s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 14 | 4.53s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 12 | 9.53s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 11 | 0.99s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 11 | 2.8s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 7 | 19.89s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 7 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 7 | 0.41s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 7 | 0.37s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 7 | 0.3s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 7 | 1.73s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 6 | 0.11s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 5 | 19.97s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 4 | 2.24s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 3 | 0.4s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 2 | 0.9s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 2 | 155.95s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 2 | 2.96s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 2 | 12.41s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 1 | 0.39s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 1 | 36.79s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 1 | 1.56s |

## Archive sweep

Executed at least once: **290/290** research scripts. Latest status: missing_file 24, pass 265, timeout 1.
This run: 232 executed (missing_file 20, pass 211, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

