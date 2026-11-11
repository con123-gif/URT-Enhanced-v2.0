# Cathedral orchestrator — ✅ PASS

2026-11-11T14:34:56Z · [run 43036466335](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43036466335) · `0a9ed3d` · push on `newtons-cathedral` · checkpoint #44

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 44 | 0.06s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 44 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 44 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 44 | 7.79s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 44 | 6.72s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 44 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 44 | 3.58s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 44 | 3.39s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 44 | 0.33s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 44 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 41 | 8.38s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 44 | 0.45s |
| native | `native.wilson_source` | native | ✅ pass | 44 | 1.44s |
| native | `native.output_gate` | native | ✅ pass | 44 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 44 | 0.55s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 44 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 44 | 0.88s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 44 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 38 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 17 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 17 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 37 | 1.11s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 36 | 53.37s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 35 | 5.67s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 33 | 8.2s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 31 | 17.13s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 30 | 1.85s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 30 | 5.23s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 26 | 35.94s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 26 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 26 | 0.7s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 26 | 0.65s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 26 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 26 | 3.9s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 25 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 24 | 35.77s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 23 | 4.45s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 22 | 0.7s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 21 | 1.68s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 21 | 326.02s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 21 | 5.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 21 | 22.82s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 20 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 20 | 60.89s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 20 | 2.85s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 19 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 19 | 0.62s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 18 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 16 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 15 | 85.45s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 14 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 13 | 1.98s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 12 | 3.98s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 10 | 95.49s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 9 | 192.55s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 8 | 38.06s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 7 | 8.12s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 3 | 114.02s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 6 | 16.46s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 4 | 54.07s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 2 | 0.36s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 1 | 3.39s |

## Archive sweep

Executed at least once: **308/308** research scripts. Latest status: missing_file 22, pass 285, timeout 1.
This run: 214 executed (missing_file 18, pass 195, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

