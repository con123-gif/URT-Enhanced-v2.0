# Cathedral orchestrator — ✅ PASS

2026-11-11T11:56:12Z · [run 43010975460](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43010975460) · `f43e566` · push on `newtons-cathedral` · checkpoint #40

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 40 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 40 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 40 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 40 | 5.64s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 40 | 7.34s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 40 | 0.32s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 40 | 3.68s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 40 | 3.45s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 40 | 0.34s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 40 | 0.27s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 37 | 8.57s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 40 | 0.47s |
| native | `native.wilson_source` | native | ✅ pass | 40 | 1.73s |
| native | `native.output_gate` | native | ✅ pass | 40 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 40 | 0.42s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 40 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 40 | 0.66s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 40 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 34 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 13 | 0.2s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 13 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 33 | 0.9s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 32 | 41.87s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 31 | 4.42s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 29 | 6.48s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 27 | 13.52s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 26 | 1.62s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 26 | 4.33s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 22 | 28.28s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 22 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 22 | 0.53s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 22 | 0.49s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 22 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 22 | 2.58s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 21 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 20 | 28.68s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 19 | 3.32s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 18 | 0.53s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 17 | 1.37s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 17 | 240.26s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 17 | 4.73s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 17 | 17.83s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 16 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 16 | 59.44s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 16 | 2.22s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 15 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 15 | 0.5s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 14 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 12 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 11 | 66.88s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 10 | 1.63s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 9 | 1.84s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 8 | 3.64s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 6 | 87.53s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 5 | 154.36s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 4 | 31.14s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 3 | 7.05s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 2 | 14.6s |

## Archive sweep

Executed at least once: **304/304** research scripts. Latest status: missing_file 23, pass 280, timeout 1.
This run: 208 executed (missing_file 23, pass 184, timeout 1).
Regressions (passed before, failing now, same source): `research_archive/2026-10-17_original_oct08_source/continued_physics_work/photon/free_fock_photon.py`.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

