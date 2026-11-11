# Cathedral orchestrator — ❌ FAIL

2026-11-11T03:02:16Z · [run 42948236951](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42948236951) · `a7c830d` · push on `newtons-cathedral` · checkpoint #26

**Gating failures:** `research.missing_intermediates`

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 26 | 0.05s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 26 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 26 | 0.29s |
| tests | `tests.suite` | regression | ✅ pass | 26 | 8.17s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 26 | 10.93s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 26 | 0.39s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 26 | 6.5s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 26 | 5.93s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 26 | 0.52s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 26 | 0.41s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 23 | 14.71s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 26 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 26 | 1.43s |
| native | `native.output_gate` | native | ✅ pass | 26 | 0.1s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 26 | 0.4s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 26 | 0.26s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 26 | 0.59s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 26 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 20 | 0.1s |
| research | `research.missing_intermediates` | independent | ❌ error — _normalization_operators.npz', 'correlated_hat_k5_checks.json', 'grounded_charged_amplitude_operators.npz', 'original_h64_species_link_source.npz', 'outer_history_operators.npz', 'theory_input_v5.md'] | 0 | 0.25s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 19 | 1.16s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 18 | 56.07s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 17 | 5.93s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 15 | 8.53s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 13 | 18.08s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 12 | 1.88s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 12 | 5.3s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 8 | 37.0s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 8 | 0.24s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 8 | 0.69s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 8 | 0.68s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 8 | 0.54s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 8 | 3.94s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 7 | 0.24s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 6 | 36.53s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 5 | 4.52s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 4 | 0.67s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 3 | 1.63s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 3 | 327.36s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 3 | 5.67s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 3 | 23.74s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 2 | 0.66s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 2 | 61.04s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 2 | 3.05s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 1 | 0.21s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 1 | 0.61s |

**Changed since last run:** `research.missing_intermediates` pass → error

## Archive sweep

Executed at least once: **291/291** research scripts. Latest status: error 1, missing_file 22, pass 268.
This run: 291 executed (error 1, missing_file 22, pass 268).
Regressions (passed before, failing now, same source): `research_archive/2026-11-10_missing_intermediates/find_missing_intermediate_producers.py`.
Recovered: `research_archive/2026-10-17_h64_quadratic_koide_phase/urt_h64_quadratic_phase_derivation.py`, `research_archive/2026-10-17_source_h64_joint_flux/joint_urt_h64_joint_holonomy_and_mass.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

