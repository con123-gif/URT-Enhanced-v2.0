# Cathedral orchestrator — ✅ PASS

2026-11-12T08:54:06Z · [run 43182119237](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43182119237) · `72e8f56` · push on `newtons-cathedral` · checkpoint #60

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 60 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 60 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 60 | 0.32s |
| tests | `tests.suite` | regression | ✅ pass | 60 | 7.63s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 60 | 6.36s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 60 | 0.25s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 60 | 5.65s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 60 | 5.55s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 60 | 0.47s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 60 | 0.35s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 57 | 13.73s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 60 | 0.69s |
| native | `native.wilson_source` | native | ✅ pass | 60 | 0.96s |
| native | `native.output_gate` | native | ✅ pass | 60 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 60 | 0.58s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 60 | 0.4s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 60 | 0.98s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 60 | 0.12s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 54 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 33 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 33 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 53 | 1.14s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 52 | 54.34s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 51 | 5.81s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 49 | 8.4s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 47 | 17.51s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 46 | 1.86s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 46 | 5.23s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 42 | 36.45s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 42 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 42 | 0.71s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 42 | 0.66s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 42 | 0.53s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 42 | 3.98s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 41 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 40 | 36.35s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 39 | 4.55s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 38 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 37 | 1.64s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 37 | 327.41s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 37 | 5.62s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 37 | 23.04s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 36 | 0.68s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 36 | 61.25s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 36 | 2.95s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 35 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 35 | 0.61s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 34 | 0.1s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 32 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 31 | 87.56s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 30 | 1.79s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 29 | 2.01s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 28 | 3.99s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 26 | 96.08s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 25 | 193.76s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 24 | 38.4s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 23 | 8.08s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 19 | 115.93s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 22 | 16.43s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 20 | 53.56s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 18 | 0.34s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 17 | 3.35s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 16 | 4.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 15 | 1.5s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 14 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 13 | 2.05s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 12 | 2.26s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 11 | 2.04s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 9 | 8.93s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 7 | 3.13s |
| research | `research.native_clock_rate_flux_quadrature` | conditional | ✅ pass | 4 | 8.63s |
| research | `research.q49_fixed_source_gauge_obstruction` | conditional | ✅ pass | 3 | 2.79s |
| research | `research.q49_haar_diagonal_transport` | conditional | ✅ pass | 2 | 1.14s |
| research | `research.q49_native_ward_history_map` | native | ✅ pass | 1 | 3.15s |

## Archive sweep

Executed at least once: **321/321** research scripts. Latest status: missing_file 22, pass 298, timeout 1.
This run: 208 executed (missing_file 14, pass 193, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

