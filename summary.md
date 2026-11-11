# Cathedral orchestrator — ✅ PASS

2026-11-11T06:27:37Z · [run 42970944422](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42970944422) · `9f7e91b` · push on `newtons-cathedral` · checkpoint #32

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 32 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 32 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 32 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 32 | 5.85s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 32 | 10.95s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 32 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 32 | 3.57s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 32 | 3.42s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 32 | 0.34s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 32 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 29 | 8.63s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 32 | 0.46s |
| native | `native.wilson_source` | native | ✅ pass | 32 | 1.31s |
| native | `native.output_gate` | native | ✅ pass | 32 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 32 | 0.7s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 32 | 0.33s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 32 | 0.87s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 32 | 0.3s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 26 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 5 | 0.2s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 5 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 25 | 0.97s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 24 | 41.9s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 23 | 4.51s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 21 | 6.57s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 19 | 13.68s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 18 | 1.59s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 18 | 4.42s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 14 | 28.29s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 14 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 14 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 14 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 14 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 14 | 2.62s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 13 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 12 | 28.18s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 11 | 3.36s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 10 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 9 | 1.49s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 9 | 240.73s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 9 | 4.67s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 9 | 17.75s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 8 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 8 | 56.04s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 8 | 2.28s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 7 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 7 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 6 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 4 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 3 | 67.23s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 2 | 1.58s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 1 | 1.73s |

## Archive sweep

Executed at least once: **298/298** research scripts. Latest status: missing_file 22, pass 276.
This run: 298 executed (missing_file 22, pass 276).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

