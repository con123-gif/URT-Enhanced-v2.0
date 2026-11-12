# Cathedral orchestrator — ✅ PASS

2026-11-12T08:32:07Z · [run 43181166770](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43181166770) · `b5aed7e` · push on `newtons-cathedral` · checkpoint #59

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 59 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 59 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 59 | 0.3s |
| tests | `tests.suite` | regression | ✅ pass | 59 | 6.04s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 59 | 6.94s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 59 | 0.31s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 59 | 4.73s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 59 | 4.66s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 59 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 59 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 56 | 11.57s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 59 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 59 | 1.46s |
| native | `native.output_gate` | native | ✅ pass | 59 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 59 | 0.69s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 59 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 59 | 0.91s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 59 | 0.18s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 53 | 0.06s |
| research | `research.missing_intermediates` | independent | ✅ pass | 32 | 0.15s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 32 | 0.02s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 52 | 0.78s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 51 | 33.22s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 50 | 3.59s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 48 | 5.38s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 46 | 10.87s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 45 | 1.52s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 45 | 3.93s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 41 | 23.01s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 41 | 0.15s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 41 | 0.47s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 41 | 0.43s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 41 | 0.35s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 41 | 2.11s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 40 | 0.13s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 39 | 22.54s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 38 | 2.59s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 37 | 0.44s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 36 | 1.06s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 36 | 196.85s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 36 | 4.27s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 36 | 14.36s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 35 | 0.44s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 35 | 42.13s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 35 | 1.8s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 34 | 0.14s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 34 | 0.48s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 33 | 0.07s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 31 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 30 | 53.53s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 29 | 1.18s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 28 | 1.39s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 27 | 2.67s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 25 | 62.28s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 24 | 133.84s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 23 | 25.0s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 22 | 5.41s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 18 | 78.79s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 21 | 10.85s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 19 | 33.82s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 17 | 0.22s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 16 | 2.21s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 15 | 3.25s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 14 | 1.02s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 13 | 2.06s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 12 | 1.34s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 11 | 1.44s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 10 | 1.33s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 8 | 5.14s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 6 | 1.95s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 3 | 5.48s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 2 | 1.87s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 1 | 0.74s |

## Archive sweep

Executed at least once: **320/320** research scripts. Latest status: missing_file 22, pass 297, timeout 1.
This run: 294 executed (missing_file 22, pass 272).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

