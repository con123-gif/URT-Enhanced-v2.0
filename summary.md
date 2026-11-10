# Cathedral orchestrator — ✅ PASS

2026-11-10T20:34:26Z · [run 42894969958](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/42894969958) · `c462563` · push on `newtons-cathedral` · checkpoint #5

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
| integrity | `integrity.h64_snapshot_sha256` | regression | ✅ pass | 5 | 0.04s |
| integrity | `integrity.arf_forward_manifest` | regression | ✅ pass | 5 | 0.0s |
| integrity | `integrity.handover_claims` | independent | ✅ pass | 5 | 0.18s |
| tests | `tests.suite` | regression | ✅ pass | 5 | 9.21s |
| geometry | `geometry.all_platonic_hidden_algebra` | regression | ✅ pass | 5 | 11.94s |
| geometry | `geometry.hidden_isometry_24clock_Q6` | regression | ✅ pass | 5 | 0.37s |
| history | `history.a4_third_cumulant_rate` | regression | ✅ pass | 5 | 6.0s |
| history | `history.a5_symmetric_cubic_source` | regression | ✅ pass | 5 | 6.37s |
| history | `history.a5_chronology_dirichlet_gap` | conditional | ✅ pass | 5 | 0.51s |
| history | `history.source_schur_ward_contacts` | regression | ✅ pass | 5 | 0.4s |
| history | `history.native_q6_fourth_cumulants` | native | ✅ pass | 2 | 14.9s |
| history | `history.native_24clock_fourier` | conditional | ✅ pass | 5 | 0.77s |
| native | `native.wilson_source` | native | ✅ pass | 5 | 1.67s |
| native | `native.output_gate` | native | ✅ pass | 5 | 0.12s |
| conditional | `conditional.source_moment_recurrence` | conditional | ✅ pass | 5 | 0.41s |
| conditional | `conditional.observable_nonuniqueness` | conditional | ✅ pass | 5 | 0.27s |
| conditional | `conditional.charged_ward_2x2` | synthetic | ✅ pass | 5 | 0.67s |
| conditional | `conditional.ward_13_51_random_blocks` | synthetic | ✅ pass | 5 | 0.09s |

## Archive sweep

Executed at least once: **259/259** research scripts. Latest status: missing_file 24, pass 235.
This run: 259 executed (missing_file 24, pass 235).
Regressions (passed before, failing now, same source): none.
Recovered: `research_archive/2026-11-08_native_h64_diffusion/cathedral_4d_wick_stability_counterterm_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_a5_two_covariance_rg_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_full50_complex_wick_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_4d_subtracted_response_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_wick_exact_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_native_190_24clock_wick_covariance_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_perturbation_stable_nonlocal_wick_2026_11_08.py`, `research_archive/2026-11-08_native_h64_diffusion/cathedral_source_semigroup_and_4d_gaussian_2026_11_08.py`, `research_archive/2026-11-10_urt_arf_forward/aux_tests/CATHEDRAL_ARF_FOUR_CHANNELS_RECONCILIATION_2026-11-09.py`, `research_archive/2026-11-10_urt_arf_forward/aux_tests/CATHEDRAL_ARF_FULL_K64_SPECTRAL_PROOF_2026-11-09.py`.

Full per-script table: `sweep.md` on this branch.

Environment: python 3.11.18, numpy 2.4.6, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0, networkx 3.6.1, pytest 9.2.0

