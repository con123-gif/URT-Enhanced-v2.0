# Cathedral orchestrator — ❌ FAIL

2026-11-11T03:13:24Z · [run 42948766799](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42948766799) · `87c158b` · push on `newtons-cathedral` · checkpoint #27

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 27 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 27 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 27 | 0.22s |
| tests | `tests.suite` | regression | ✅ pass | 27 | 8.05s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 27 | 10.73s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 27 | 0.38s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 27 | 5.02s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 27 | 4.56s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 27 | 0.39s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 27 | 0.31s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 24 | 11.36s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 27 | 0.56s |
| native | `native.wilson_source` | native | ✅ pass | 27 | 1.69s |
| native | `native.output_gate` | native | ✅ pass | 27 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 27 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 27 | 0.28s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 27 | 0.62s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 27 | 0.08s |
| research | `research.sandbox_bound_scripts` | independent | ✅ pass | 21 | 0.08s |
| research | `research.missing_intermediates` | independent | ❌ error — _normalization_operators.npz', 'correlated_hat_k5_checks.json', 'grounded_charged_amplitude_operators.npz', 'original_h64_species_link_source.npz', 'outer_history_operators.npz', 'theory_input_v5.md'] | 0 | 0.2s |
| research | `research.independent_native_five_k2` | independent | ✅ pass | 20 | 0.93s |
| research | `research.unsigned_axis_order_k2` | independent | ✅ pass | 19 | 40.92s |
| research | `research.signed_a5_covariance` | independent | ✅ pass | 18 | 4.53s |
| research | `research.signed_dictionary_classes` | native | ✅ pass | 16 | 6.36s |
| research | `research.native_signed_dictionary_k3` | native | ✅ pass | 14 | 13.44s |
| research | `research.induced_photon_logdet_kernel` | native | ✅ pass | 13 | 1.7s |
| research | `research.induced_photon_vacuum_selection` | native | ✅ pass | 13 | 4.5s |
| research | `research.native_signed_dictionary_k23` | native | ✅ pass | 9 | 28.06s |
| research | `research.icosahedral_induced_photon` | independent | ✅ pass | 9 | 0.19s |
| research | `research.hodge_dirac_flux_vacuum` | independent | ✅ pass | 9 | 0.55s |
| research | `research.hodge_dirac_photon_kernel` | independent | ✅ pass | 9 | 0.5s |
| research | `research.hodge_dirac_19_mode_photon` | independent | ✅ pass | 9 | 0.42s |
| research | `research.incidence_photon_a5_sectors` | independent | ✅ pass | 9 | 2.59s |
| research | `research.platonic_hidden_sector_link` | independent | ✅ pass | 8 | 0.16s |
| research | `research.q15_native_namespace_repair` | native | ✅ pass | 7 | 27.88s |
| research | `research.chaos_invariant_refinement_audit` | independent | ✅ pass | 6 | 3.36s |
| research | `research.hidden_parity_delta_selection` | native | ✅ pass | 5 | 0.53s |
| research | `research.q4_native_matter_map` | native | ✅ pass | 4 | 1.38s |
| research | `research.registry_induced_vacuum` | conditional | ✅ pass | 4 | 239.5s |
| research | `research.registry_maxwell_test` | conditional | ✅ pass | 4 | 4.74s |
| research | `research.native_signed_dictionary_k4` | native | ✅ pass | 4 | 17.38s |
| research | `research.q23_photon_gauge_typing` | native | ✅ pass | 3 | 0.51s |
| research | `research.q3_twirled_chronology_classes` | native | ✅ pass | 3 | 49.52s |
| research | `research.q7_review_q6_cumulants` | independent | ✅ pass | 3 | 2.24s |
| research | `research.candidate1_induced_em_icosahedron` | conditional | ✅ pass | 2 | 0.16s |
| research | `research.q25_4d_a5_photon` | native | ✅ pass | 2 | 0.49s |
| research | `research.candidate1_4d_holonomy_instability` | conditional | ✅ pass | 1 | 0.08s |

## Archive sweep

Executed at least once: **292/292** research scripts. Latest status: error 1, missing_file 22, pass 269.
This run: 292 executed (error 1, missing_file 22, pass 269).
Regressions (passed before, failing now, same source): none.
Recovered: none.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

