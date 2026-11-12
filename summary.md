# Cathedral orchestrator — ✅ PASS

2026-11-12T05:04:20Z · [run 43156573869](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43156573869) · `009fb6d` · push on `newtons-cathedral` · checkpoint #55

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 55 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 55 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 55 | 0.31s |
| tests | `tests.suite` | regression | ✅ pass | 55 | 5.98s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 55 | 6.69s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 55 | 0.29s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 55 | 6.32s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 55 | 6.12s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 55 | 0.53s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 55 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 52 | 15.33s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 55 | 0.78s |
| native | `native.wilson_source` | native | ✅ pass | 55 | 0.97s |
| native | `native.output_gate` | native | ✅ pass | 55 | 0.08s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 55 | 0.54s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 55 | 0.35s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 55 | 0.9s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 55 | 0.11s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 49 | 0.11s |
| research | `research.missing_intermediates` | independent | ✅ pass | 28 | 0.26s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 28 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 48 | 1.06s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 47 | 56.13s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 46 | 5.95s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 44 | 8.43s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 42 | 18.1s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 41 | 1.81s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 41 | 5.12s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 37 | 37.0s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 37 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 37 | 0.69s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 37 | 0.64s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 37 | 0.51s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 37 | 3.91s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 36 | 0.23s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 35 | 36.6s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 34 | 4.52s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 33 | 0.68s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 32 | 1.61s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 32 | 325.5s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 32 | 5.59s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 32 | 23.49s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 31 | 0.65s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 31 | 61.78s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 31 | 2.99s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 30 | 0.2s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 30 | 0.6s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 29 | 0.09s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 27 | 0.03s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 26 | 89.03s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 25 | 1.8s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 24 | 1.99s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 23 | 3.96s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 21 | 95.42s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 20 | 191.58s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 19 | 37.75s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 18 | 8.0s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 14 | 110.65s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 17 | 16.4s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 15 | 53.76s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 13 | 0.33s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 12 | 3.38s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 11 | 4.95s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 10 | 1.48s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 9 | 3.09s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 8 | 2.04s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 7 | 2.25s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 6 | 2.03s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 4 | 8.81s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 2 | 3.1s |

## Archive sweep

Executed at least once: **316/316** research scripts. Latest status: missing_file 22, pass 293, timeout 1.
This run: 307 executed (missing_file 22, pass 285).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

