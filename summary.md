# Cathedral orchestrator — ✅ PASS

2026-11-11T05:34:34Z · [run 42964506968](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42964506968) · `4f80141` · push on `newtons-cathedral` · checkpoint #31

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 31 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 31 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 31 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 31 | 9.56s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 31 | 9.56s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 31 | 0.36s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 31 | 6.27s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 31 | 6.03s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 31 | 0.54s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 31 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 28 | 14.89s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 31 | 0.82s |
| native | `native.wilson_source` | native | ✅ pass | 31 | 1.63s |
| native | `native.output_gate` | native | ✅ pass | 31 | 0.13s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 31 | 0.61s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 31 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 31 | 0.68s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 31 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 25 | 0.08s |
| research | `research.missing_intermediates` | independent | ✅ pass | 4 | 0.2s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 4 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 24 | 0.89s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 23 | 41.83s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 22 | 4.38s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 20 | 6.38s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 18 | 13.55s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 17 | 1.61s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 17 | 4.43s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 13 | 28.21s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 13 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 13 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 13 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 13 | 0.4s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 13 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 12 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 11 | 28.07s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 10 | 3.38s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 9 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 8 | 1.37s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 8 | 238.3s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 8 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 8 | 17.82s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 7 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 7 | 50.69s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 7 | 2.21s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 6 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 6 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 5 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 3 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 2 | 68.32s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 1 | 1.44s |

## Archive sweep

Executed at least once: **297/297** research scripts. Latest status: missing_file 22, pass 275.
This run: 297 executed (missing_file 22, pass 275).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

