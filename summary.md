# Cathedral orchestrator — ✅ PASS

2026-11-11T21:33:43Z · [run 43094485541](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43094485541) · `a0d95f3` · push on `newtons-cathedral` · checkpoint #50

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 50 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 50 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 50 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 50 | 9.23s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 50 | 9.27s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 50 | 0.34s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 50 | 4.84s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 50 | 4.64s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 50 | 0.42s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 50 | 0.34s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 47 | 11.44s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 50 | 0.59s |
| native | `native.wilson_source` | native | ✅ pass | 50 | 1.31s |
| native | `native.output_gate` | native | ✅ pass | 50 | 0.09s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 50 | 0.56s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 50 | 0.37s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 50 | 0.9s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 50 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 44 | 0.06s |
| research | `research.missing_intermediates` | independent | ✅ pass | 23 | 0.15s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 23 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 43 | 0.62s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 42 | 29.54s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 41 | 3.21s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 39 | 4.58s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 37 | 9.68s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 36 | 1.0s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 36 | 2.73s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 32 | 20.28s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 32 | 0.13s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 32 | 0.41s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 32 | 0.36s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 32 | 0.3s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 32 | 1.74s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 31 | 0.12s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 30 | 20.07s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 29 | 2.25s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 28 | 0.4s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 27 | 0.92s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 27 | 155.28s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 27 | 2.97s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 27 | 12.5s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 26 | 0.39s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 26 | 37.01s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 26 | 1.59s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 25 | 0.12s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 25 | 0.34s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 24 | 0.06s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 22 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 21 | 47.82s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 20 | 1.1s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 19 | 1.17s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 18 | 2.32s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 16 | 53.14s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 15 | 114.0s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 14 | 21.68s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 13 | 4.73s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 9 | 64.71s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 12 | 9.33s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 10 | 29.99s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 8 | 0.2s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 7 | 2.0s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 6 | 2.99s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 5 | 0.89s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 4 | 1.83s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 3 | 1.42s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 2 | 1.39s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 1 | 1.26s |

## Archive sweep

Executed at least once: **314/314** research scripts. Latest status: missing_file 22, pass 291, timeout 1.
This run: 288 executed (missing_file 22, pass 265, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

