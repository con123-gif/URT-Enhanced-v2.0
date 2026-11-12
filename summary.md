# Cathedral orchestrator — ✅ PASS

2026-11-12T11:09:46Z · [run 43203085264](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43203085264) · `651b838` · push on `newtons-cathedral` · checkpoint #63

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 63 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 63 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 63 | 0.23s |
| tests | `tests.suite` | regression | ✅ pass | 63 | 6.52s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 63 | 6.88s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 63 | 0.3s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 63 | 3.51s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 63 | 3.32s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 63 | 0.31s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 63 | 0.24s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 60 | 8.35s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 63 | 0.43s |
| native | `native.wilson_source` | native | ✅ pass | 63 | 1.66s |
| native | `native.output_gate` | native | ✅ pass | 63 | 0.11s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 63 | 0.52s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 63 | 0.24s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 63 | 0.56s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 63 | 0.18s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 57 | 0.12s |
| research | `research.missing_intermediates` | independent | ✅ pass | 36 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 36 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 56 | 1.12s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 55 | 54.03s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 54 | 5.7s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 52 | 8.26s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 50 | 17.17s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 49 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 49 | 5.29s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 45 | 36.27s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 45 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 45 | 0.72s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 45 | 0.67s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 45 | 0.55s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 45 | 3.94s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 44 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 43 | 36.2s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 42 | 4.47s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 41 | 0.69s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 40 | 1.65s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 40 | 325.9s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 40 | 5.69s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 40 | 22.92s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 39 | 0.7s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 39 | 61.95s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 39 | 2.86s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 38 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 38 | 0.63s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 37 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 35 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 34 | 86.36s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 33 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 32 | 2.03s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 31 | 4.02s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 29 | 95.49s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 28 | 193.3s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 27 | 38.05s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 26 | 8.08s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 22 | 116.46s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 25 | 16.59s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 23 | 54.01s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 21 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 20 | 3.41s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 19 | 4.93s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 18 | 1.54s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 17 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 16 | 2.08s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 15 | 2.3s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 14 | 2.05s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 12 | 8.93s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 10 | 3.12s |
| research | `research.q52_native_source_unitary` | native | ✅ pass | 1 | 0.58s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 7 | 8.63s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 6 | 2.76s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 5 | 1.12s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 4 | 3.08s |
| research | `research.q50_uniform_history_gauge` | native | ✅ pass | 3 | 0.91s |
| research | `research.q53_v61_internal_symmetry` | native | ✅ pass | 2 | 6.91s |
| research | `research.hopf_charged_carrier` | conditional | ✅ pass | 1 | 0.94s |

## Archive sweep

Executed at least once: **325/325** research scripts. Latest status: missing_file 23, pass 301, timeout 1.
This run: 237 executed (missing_file 13, pass 223, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

