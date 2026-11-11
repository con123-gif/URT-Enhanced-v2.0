# Cathedral orchestrator — ✅ PASS

2026-11-11T01:29:41Z · [run 42937375597](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42937375597) · `c64bb75` · push on `newtons-cathedral` · checkpoint #20

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 20 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 20 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 20 | 0.36s |
| tests | `tests.suite` | regression | ✅ pass | 20 | 7.29s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 20 | 9.08s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 20 | 0.4s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 20 | 5.69s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 20 | 5.66s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 20 | 0.49s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 20 | 0.36s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 17 | 13.83s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 20 | 0.73s |
| native | `native.wilson_source` | native | ✅ pass | 20 | 1.79s |
| native | `native.output_gate` | native | ✅ pass | 20 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 20 | 0.32s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 20 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 20 | 0.49s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 20 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 14 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 10 | 0.21s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 13 | 0.96s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 12 | 42.04s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 11 | 4.61s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 9 | 6.63s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 7 | 14.19s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 6 | 1.64s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 6 | 4.5s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 2 | 28.68s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 2 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 2 | 0.58s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 2 | 0.55s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 2 | 0.45s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 2 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 1 | 0.17s |

## Archive sweep

Executed at least once: **281/281** research scripts. Latest status: missing_file 24, pass 257.
This run: 281 executed (missing_file 24, pass 257).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

