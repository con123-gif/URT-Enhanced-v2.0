# Cathedral orchestrator — ✅ PASS

2026-11-11T04:28:40Z · [run 42957870949](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42957870949) · `b44b393` · push on `newtons-cathedral` · checkpoint #29

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 29 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 29 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 29 | 0.16s |
| tests | `tests.suite` | regression | ✅ pass | 29 | 6.03s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 29 | 10.74s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 29 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 29 | 6.67s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 29 | 6.05s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 29 | 0.54s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 29 | 0.42s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 26 | 15.19s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 29 | 0.82s |
| native | `native.wilson_source` | native | ✅ pass | 29 | 1.74s |
| native | `native.output_gate` | native | ✅ pass | 29 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 29 | 0.54s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 29 | 0.34s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 29 | 0.93s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 29 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 23 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 2 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 2 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 22 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 21 | 53.19s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 20 | 5.73s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 18 | 8.3s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 16 | 17.43s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 15 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 15 | 5.31s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 11 | 36.56s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 11 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 11 | 0.73s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 11 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 11 | 0.55s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 11 | 3.88s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 10 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 9 | 36.52s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 8 | 4.48s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 7 | 0.76s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 6 | 1.69s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 6 | 329.98s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 6 | 5.7s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 6 | 22.67s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 5 | 0.69s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 5 | 61.21s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 5 | 2.88s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 4 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 4 | 0.65s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 3 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 1 | 0.03s |

## Archive sweep

Executed at least once: **294/294** research scripts. Latest status: missing_file 22, pass 272.
This run: 294 executed (missing_file 22, pass 272).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

