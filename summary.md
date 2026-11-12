# Cathedral orchestrator — ✅ PASS

2026-11-12T04:35:54Z · [run 43153702709](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43153702709) · `3d55315` · push on `newtons-cathedral` · checkpoint #54

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 54 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 54 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 54 | 0.17s |
| tests | `tests.suite` | regression | ✅ pass | 54 | 9.88s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 54 | 10.73s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 54 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 54 | 6.15s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 54 | 5.99s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 54 | 0.56s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 54 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 51 | 14.78s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 54 | 0.82s |
| native | `native.wilson_source` | native | ✅ pass | 54 | 1.71s |
| native | `native.output_gate` | native | ✅ pass | 54 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 54 | 0.51s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 54 | 0.31s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 54 | 0.76s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 54 | 0.09s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 48 | 0.09s |
| research | `research.missing_intermediates` | independent | ✅ pass | 27 | 0.21s |
| research | `research.q6_repair_structural_regression` | regression | ✅ pass | 27 | 0.03s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 47 | 0.88s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 46 | 41.23s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 45 | 4.49s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 43 | 6.4s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 41 | 13.53s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 40 | 1.6s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 40 | 4.37s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 36 | 28.27s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 36 | 0.18s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 36 | 0.52s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 36 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 36 | 0.41s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 36 | 2.55s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 35 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 34 | 28.11s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 33 | 3.3s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 32 | 0.52s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 31 | 1.36s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 31 | 238.11s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 31 | 4.68s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 31 | 17.48s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 30 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 30 | 58.28s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 30 | 2.26s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 29 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 29 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 28 | 0.08s |
| research | `research.q22_tetrahedron_exact_kernel` | native | ✅ pass | 26 | 0.02s |
| research | `research.q24_history_symmetries` | native | ✅ pass | 25 | 67.15s |
| research | `research.q27_twirled_orientation` | native | ✅ pass | 24 | 1.58s |
| research | `research.q28_twirled_third_trace` | native | ✅ pass | 23 | 1.82s |
| research | `research.q29_twirled_fourth_trace` | native | ✅ pass | 22 | 3.37s |
| research | `research.q30_twirled_all_order_spectrum` | native | ✅ pass | 20 | 86.91s |
| research | `research.q31_rational_similarity` | native | ✅ pass | 19 | 153.56s |
| research | `research.q33_singular_spectrum` | native | ✅ pass | 18 | 31.1s |
| research | `research.q34_seventh_mixed_words` | native | ✅ pass | 17 | 6.99s |
| research | `research.q36_rational_star_intertwiners` | native | ✅ pass | 13 | 88.72s |
| research | `research.q35_eighth_mixed_words` | native | ✅ pass | 16 | 14.43s |
| research | `research.q32_mixed_trace_meaning` | native | ✅ pass | 14 | 46.83s |
| research | `research.q37_primitive_q2_trace` | native | ✅ pass | 12 | 0.26s |
| research | `research.q38_primitive_q2_allpairs` | native | ✅ pass | 11 | 3.08s |
| research | `research.q39_eight_image_q2` | native | ✅ pass | 10 | 4.66s |
| research | `research.q40_cross_orbit_q2` | independent | ✅ pass | 9 | 1.36s |
| research | `research.q40_review_operator_equality` | independent | ✅ pass | 8 | 2.78s |
| research | `research.q42_middle_flip_orbitals` | native | ✅ pass | 7 | 1.82s |
| research | `research.q43_native_character_criterion` | native | ✅ pass | 6 | 1.93s |
| research | `research.q44_middle_flip_symmetry` | native | ✅ pass | 5 | 1.74s |
| research | `research.q45_zero_coset_orders` | native | ✅ pass | 3 | 6.73s |
| research | `research.q46_rotation_mechanism` | native | ✅ pass | 1 | 2.57s |

## Archive sweep

Executed at least once: **316/316** research scripts. Latest status: missing_file 22, pass 293, timeout 1.
This run: 293 executed (missing_file 22, pass 270, timeout 1).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

