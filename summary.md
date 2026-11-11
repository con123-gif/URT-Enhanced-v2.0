# Cathedral orchestrator — ✅ PASS

2026-11-11T02:28:48Z · [run 42944659803](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42944659803) · `7c5a4de` · push on `newtons-cathedral` · checkpoint #24

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 24 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 24 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 24 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 24 | 7.32s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 24 | 10.63s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 24 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 24 | 3.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 24 | 3.81s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 24 | 0.5s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 24 | 0.38s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 21 | 9.01s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 24 | 0.6s |
| native | `native.wilson_source` | native | ✅ pass | 24 | 2.42s |
| native | `native.output_gate` | native | ✅ pass | 24 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 24 | 0.62s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 24 | 0.39s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 24 | 0.98s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 24 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 18 | 0.1s |
| research | `research.missing_intermediates` | independent | ✅ pass | 14 | 0.24s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 17 | 1.08s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 16 | 55.36s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 15 | 5.89s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 13 | 8.42s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 11 | 17.93s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 10 | 1.82s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 10 | 5.15s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 6 | 36.8s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 6 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 6 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 6 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 6 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 6 | 3.9s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 5 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 4 | 36.74s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 3 | 4.53s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 2 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 1 | 1.62s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 1 | 327.64s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 1 | 5.6s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 1 | 23.26s |

## Archive sweep

Executed at least once: **287/287** research scripts. Latest status: missing_file 24, pass 262, timeout 1.
This run: 287 executed (missing_file 24, pass 262, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

