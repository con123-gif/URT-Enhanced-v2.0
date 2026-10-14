# Recovered primary sources: 30 Sep / 1 Oct Cathedral archives

**Recovered 2026-10-14 directly from persistent Library into the working container**:

- `Newtons_Cathedral_URT_Full_Project_2026-09-30.zip`: 34,936,171 bytes, SHA-256 `82a2d9a9e206b84e93d1bc38c5504138155b50193e2385d38721d323b23de296`, 441 ZIP entries (441 files).
- `Newtons_Cathedral_URT_Consolidated_2026-10-01.zip`: 35,053,055 bytes, SHA-256 `07ee6c25f45820d00eac9c06309dd79e8cf12c7fec71436b914b7ea81b017953`, 470 ZIP entries, 453 files (17 directories).
- After stripping the consolidated wrapper directory, **439 shared archive member names have byte-for-byte identical SHA-256 content**; two only-in-full names differ because of Unicode filename encoding; 14 only-in-consolidated names include `Cathedral_Global_Closure_Audit_2026-09-28.md`, verification reports, and the five-minute verifier. This proves the consolidated archive retained the 439 directly matched source files, not that every chat was exported.

These archives were previously listed but inaccessible in October 8 recovery; this retrieval succeeded and permits direct inspections.

## Fourteen original no-go scripts and their corresponding machine-readable result certificates

All fourteen `.py` source files and fourteen `_results.json` files have been located in both ZIPs. The repo already has original files for at least the inspected cases; retain them, do not replace them with shortened later paraphrases.

| Original source stem | What the archived result actually limits | Treatment |
|---|---|---|
| `urt_anomaly_inflow_no_go` | Anomaly cancellation does not select the arbitrary orientation/inflow coefficient under its stated gauge assumptions | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_ball_window_homogenization_no_go` | Strict directional diffusion bound for a specific centred-ball window proposal and reversible correction; explicitly conditional | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_clock_orientation_scale_no_go` | The selected contraction fixes a factor per step, not a physical clock duration or future orientation | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_cut_project_window_no_go` | Uniform streaming fails in the specified cut/project window; particular orbit/window repairs remain conditional | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_entropy_dirac_scale_no_go` | Passive entropy spectral-action scale has monotonic orbit in the tested Gibbs/Dirac construction | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_gauge_coupling_scale_no_go` | Normalized relative-information functional does not alone select absolute gauge coupling | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_gravity_normalization_no_go` | Tracefree local tensor algebra does not by itself select conserved Einstein source or vacuum energy | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_history_contraction_no_go` | Maximal contraction within specified scalar selector collapses to the boundary and erases selected structure | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_hodge_gap_volume_scaling_no_go` | Global Hodge gap estimate fails in the specified volume-scaling method; local commutator route remains open | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_joint_action_invariant_no_go` | Two independent lowest-degree invariants leave a continuous orientation coefficient under stated invariances | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_kms_geometry_selection_no_go` | SINGLE irreducible 4 with strictly A5-equivariant involution is trivial; does not apply to the canonical doubled 4_3+4_5 | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_link_reflection_geometry_no_go` | Chosen half-step reflection fails selected A4 spatial stabilizer; interacting overlap reflection positivity not settled | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_master_affine_identifiability_no_go` | At least ten directions remain under the declared isolated kinematic axioms; not a universal theorem on later coupled dynamics | Original source + results in `research_archive/`; scope must be rechecked against later completions |
| `urt_su5_adjoint_breaking_no_go` | Low-degree SU5 adjoint potential leaves vacuum-pattern choice dependent on invariant-sign input | Original source + results in `research_archive/`; scope must be rechecked against later completions |

The 14 certificates are **not 14 independent universal impossibility theorems**. Many explicitly state conditional assumptions and even surviving alternatives. Some predate later corrections that reopen their overbroad interpretation. Most important here: September 4 `urt_kms_geometry_selection_no_go_results.json` proves a Schur-commutant obstruction for ONE irreducible four-dimensional A5 carrier; the canonical doubled `4_3⊕4_5` representation is not covered by that statement.

## Explicit constructive counterexample to an overbroad KMS/Dirac stop

On H=4⊕4 with equivalent A5 representations, define

`D=[[0,I4],[I4,0]], Gamma=[[-I4,0],[0,I4]], a=[[I4,0],[0,0]]`.

Then D is non-scalar and A5-equivariant for diag(R4,R4) (every valid 4D irrep R4). D is self-adjoint, D²=I8, anti-commutes with Gamma, and `[D,a]` has **rank 8**, Frobenius norm `sqrt(8)=2.8284271247461903`. With `rho*=(I4⊕Delta²I4)/(4(1+Delta²))`, trace is 1 and Gamma commutes with rho*. The original single-irrep theorem is still correct; its extension to the doubled representation is refuted. This is an existence witness only, not full KO-6 Standard-Model physical identification.

Independent local script: `/mnt/data/cathedral_recovery/doubled_hidden_dirac_reopen.py`; repository recreation: `research_archive/urt_doubled_hidden_dirac_reopen_2026_10_14.py`.

A second constructive reopening of the overbroad **linear** hidden-coupling stop is already recorded in `docs/RECOVERED_FALSE_NOGOS_AND_NONLINEAR_PORTAL_2026-10-14.md` with a rank-8 quadratic portal and positive two-pole Feshbach residues.

## Seven corrected global-stopping errors already documented 2026-09-28

The recovered original `docs/checkpoints/2026-09-28/Cathedral_Global_Closure_Audit_2026-09-28.md` explicitly lists seven false/overbroad no-gos: order-12 wall, Lorentzian geometry, gauge algebra, v123 endpoint, Majorana scale, eta normalisation, absolute-scale/flavour. Those corrections must take precedence over Sept 4–5 certificates wherever their later proof covers the earlier premises.

## Recovery boundary

These two archives are large finite project snapshots, not an ordered transcript of 100 chats. The original September 28 report and fourteen source certificates have now been inspected rather than merely claimed from memory. Absence of a later mechanism from the bundles is not evidence of its nonexistence in the chat history. Later October corrections take precedence within their proven scope.
