# Cathedral orchestrator — ✅ PASS

2026-11-11T12:43:01Z · [run 43019957498](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43019957498) · `22009d2` · push on `newtons-cathedral` · checkpoint #41

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 41 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 41 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 41 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 41 | 8.49s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 41 | 10.99s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 41 | 0.4s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 41 | 5.19s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 41 | 5.12s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 41 | 0.48s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 41 | 0.35s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 38 | 12.59s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 41 | 0.7s |
| native | `native.wilson_source` | native | ✅ pass | 41 | 1.41s |
| native | `native.output_gate` | native | ✅ pass | 41 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 41 | 0.34s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 41 | 0.21s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 41 | 0.5s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 41 | 0.07s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 35 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 14 | 0.2s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 14 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 34 | 0.91s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 33 | 41.88s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 32 | 4.49s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 30 | 6.54s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 28 | 13.58s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 27 | 1.65s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 27 | 4.48s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 23 | 28.13s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 23 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 23 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 23 | 0.54s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 23 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 23 | 2.65s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 22 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 21 | 28.06s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 20 | 3.32s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 19 | 0.54s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 18 | 1.44s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 18 | 241.35s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 18 | 4.78s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 18 | 17.68s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 17 | 0.54s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 17 | 60.08s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 17 | 2.23s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 16 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 16 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 15 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 13 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 12 | 67.89s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 11 | 1.64s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 10 | 1.83s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 9 | 3.71s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 7 | 86.94s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 6 | 154.11s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 5 | 32.23s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 4 | 7.07s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 3 | 14.77s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 1 | 47.32s |

## Archive sweep

Executed at least once: **305/305** research scripts. Latest status: missing_file 22, pass 282, timeout 1.
This run: 225 executed (missing_file 18, pass 206, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

