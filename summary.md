# Cathedral orchestrator — ✅ PASS

2026-11-12T07:44:15Z · [run 43175047597](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43175047597) · `1a8b3c0` · push on `newtons-cathedral` · checkpoint #58

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 58 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 58 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 58 | 0.21s |
| tests | `tests.suite` | regression | ✅ pass | 58 | 7.81s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 58 | 10.98s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 58 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 58 | 3.61s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 58 | 3.31s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 58 | 0.35s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 58 | 0.26s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 55 | 8.17s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 58 | 0.47s |
| native | `native.wilson_source` | native | ✅ pass | 58 | 1.55s |
| native | `native.output_gate` | native | ✅ pass | 58 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 58 | 0.5s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 58 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 58 | 0.64s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 58 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 52 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 31 | 0.21s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 31 | 0.04s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 51 | 2.34s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 50 | 42.16s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 49 | 4.49s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 47 | 6.47s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 45 | 13.67s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 44 | 1.67s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 44 | 4.59s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 40 | 28.29s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 40 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 40 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 40 | 0.51s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 40 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 40 | 2.6s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 39 | 0.17s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 38 | 28.05s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 37 | 3.36s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 36 | 0.55s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 35 | 1.39s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 35 | 241.1s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 35 | 4.72s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 35 | 17.99s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 34 | 0.55s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 34 | 52.28s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 34 | 2.31s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 33 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 33 | 0.51s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 32 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 30 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 29 | 67.53s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 28 | 1.44s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 27 | 1.68s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 26 | 3.27s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 24 | 86.92s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 23 | 153.74s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 22 | 31.08s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 21 | 6.88s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 17 | 96.85s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 20 | 14.37s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 18 | 45.85s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 16 | 0.28s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 15 | 2.84s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 14 | 4.3s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 13 | 1.22s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 12 | 2.61s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 11 | 1.75s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 10 | 1.85s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 9 | 1.72s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 7 | 6.64s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 5 | 2.45s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 2 | 5.57s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 1 | 1.98s |

## Archive sweep

Executed at least once: **319/319** research scripts. Latest status: missing_file 22, pass 296, timeout 1.
This run: 209 executed (missing_file 18, pass 190, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

