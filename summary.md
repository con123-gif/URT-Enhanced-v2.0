# Cathedral orchestrator — ✅ PASS

2026-11-12T09:38:23Z · [run 43189994558](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43189994558) · `80c32bc` · push on `newtons-cathedral` · checkpoint #61

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 61 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 61 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 61 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 61 | 7.06s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 61 | 10.59s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 61 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 61 | 4.69s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 61 | 4.62s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 61 | 0.4s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 61 | 0.32s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 58 | 11.52s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 61 | 0.57s |
| native | `native.wilson_source` | native | ✅ pass | 61 | 1.31s |
| native | `native.output_gate` | native | ✅ pass | 61 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 61 | 0.35s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 61 | 0.22s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 61 | 0.54s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 61 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 55 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 34 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 34 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 54 | 1.15s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 53 | 55.54s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 52 | 5.92s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 50 | 8.52s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 48 | 18.15s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 47 | 1.86s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 47 | 5.22s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 43 | 37.1s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 43 | 0.25s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 43 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 43 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 43 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 43 | 3.95s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 42 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 41 | 36.93s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 40 | 4.51s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 39 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 38 | 1.62s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 38 | 326.39s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 38 | 5.6s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 38 | 23.89s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 37 | 0.67s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 37 | 61.94s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 37 | 3.0s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 36 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 36 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 35 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 33 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 32 | 88.71s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 31 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 30 | 2.0s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 29 | 3.97s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 27 | 96.0s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 26 | 192.8s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 25 | 38.23s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 24 | 8.02s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 20 | 112.76s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 23 | 16.4s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 21 | 53.72s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 19 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 18 | 3.38s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 17 | 4.98s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 16 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 15 | 3.11s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 14 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 13 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 12 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 10 | 9.04s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 8 | 3.08s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 5 | 8.5s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 4 | 2.78s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 3 | 1.13s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 2 | 3.17s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 1 | 0.9s |

## Archive sweep

Executed at least once: **322/322** research scripts. Latest status: missing_file 23, pass 299.
This run: 322 executed (missing_file 23, pass 299).
Regressions (passed before, failing now, same source): `research_archive/2026-10-17_original_oct08_source/joint_vacuum_work/species/verify_full64_deformations.py`.
Recovered: `research_archive/2026-11-11_q31_rational_similarity/q31_rational_similarity.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

