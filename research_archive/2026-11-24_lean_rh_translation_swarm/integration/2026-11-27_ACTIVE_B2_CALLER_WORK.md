# Active B2 caller verification

27 November 2026. **Seven declarations and four exact caller replacements have passed.**
The separate repaired counting patch has also PASSED on the shared host; the recursive graph needs a collector compatibility repair. RH is OPEN. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Shared run [46006832164](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/46006832164),
job `rh-compact-b2-full-chain-graph-20261127`, source commit
e9d6043bfdfbcddfe6a32b64539900d0f6d5bf40, has completed. Its native source
build exited 0 in 1384.02 s; all seven declarations passed in 55.32 s,
and the repaired skew/count module passed separately in 60.18 s, all with
standard axioms. [Exact shared receipts](2026-11-27_b2_shared_receipt/README.md).
The graph rejected the old collector assumption about projection carriers.
The strict Lean-4.35-compatible collector is prepared; use the already checked
local module and cache for the retry. Do not launch another cold B2 build.

## Exact scope

The prepared chain replaces the complete original statements:

| Original caller | Replacement |
|---|---|
| Filling.sum_pairWeight_le | Filling.b2_active_sum_pairWeight_le |
| Filling.energy_le_of_level_pairs | Filling.b2_active_energy_le_of_level_pairs |
| Filling.energy_le_of_level_lt | Filling.b2_active_energy_le_of_level_lt |
| Filling.energy_le_of_linkEnergy_le | Filling.b2_active_energy_le_of_linkEnergy_le |

The pair bound uses named outer and inner divisors, with the original
support overcount, class coordinates, codimension, discriminant and scale
hypotheses. The inner congruence uses the inner term's right class in BOTH
chart witnesses, independently of the outer labelled term's own class.
The original weighted-count theorem remains a supplier of this chain.
The repaired skew/count patch has PASSED in a separate shared Lean process; it
has not been fused with this named pair/energy assembly.

`B2_ACTIVE_FULL_ENERGY_INPUT.json` authenticates three fragments and seven
declarations. Current blobs: pair fragment
3ac61ea5bcd38a9d003cf125689bf2b4a58b9c9a, level-energy fragment
e8ef74cafecd49e361b7b147c3970953e30a7f6d, remaining-energy fragment
50b71ffbea844b75e27c35a96ec4c6504b2b13f8. The assembled input is
7cb3b1813ef5a1c5024e4a79d6ffc2eb4488308f.

## Verification evidence

| Attempt | Observed result | Scope |
|---|---|---|
| 45986308748 | PASS; 8 helpers and 6 separate original probes | No caller substitution |
| 45994173721 | ERROR; source build passed, inner divisor standard axioms; outer lambda-layout error | Complete pair file rejected |
| 45998845682 | ERROR; CrudeEnergy built, pair and level-energy bodies accepted; proof-inspection API and axiom-printing checks failed | No completed caller receipt |
| Current cached local run | Seven declarations PASS; redundant local count timeout 1800.14 s (same source passed on shared host) | Four exact original-statement callers |
| Shared 46006832164 | Seven declarations and separate skew/count PASS; graph ERROR | Collector projection-carrier mismatch; aggregate ERROR |

The exact failed logs are retained on `cathedral-research-state`:

- First caller log: compute/rh-compact-b2-callers-replay-20261127/outputs/active_b2_callers.log,
  blob acf075f047d1b374d2ef5379d39b7742470b15a4.
- Second caller log: compute/rh-compact-b2-energy-repair-20261127/outputs/active_b2_energy.log,
  blob bbfb981a34c342107737e35786b6287556132142; result blob
  6684b794bbed520fa4b813ddbb556d1e91a07b24.
- Separate skew log: same repair folder, outputs/skew_caller.log,
  blob 887fc42b6cf57ba369bccb92ce71fa5c84e13bae.

The current repairs use `value? (allowOpaque := true)` to inspect actual
theorem bodies, `pp.fullNames=true` for the strict three-axiom allowlist,
and `Matrix.neg_mul` for the rectangular caller adapter. See
[the API audit](2026-11-27_LEAN_435_PROOF_INSPECTION.md). The original peer
skew patch is authenticated unchanged; its one-line adapter is recorded
in the input manifest. No extra axiom or weakened acceptance rule is used.

## Checks required before acceptance

1. **PASSED:** whole-file exit 0 for all seven declarations, exact standard
   axiom reports, complete original-type comparisons and actual direct
   dependency guards. [Receipt and exact input](2026-11-27_b2_caller_receipt/README.md).
2. **PASSED on shared host:** separate repaired skew/count compilation and standard-axiom reports. Exact input blob 4e6a203623ef642945e05e16aa9b188d1fc6028d, matching the local generated input.
3. Constructor-inclusive comparison of original/replacement pair, level
   energy and full energy roots: complete graph, independent verifier,
   both bridges reachable, old target calls absent recursively. The first attempt failed the collector cross-check; [diagnosis and exact repair](2026-11-27_B2_GRAPH_PROJECTION_COMPATIBILITY.md). This is still pending.

The shared driver retains the exact checked object and runs the graph
BEFORE its temporary native workspace is removed. The six local roots
are not the whole RH frontier or a completion denominator. The original
endgame source is unchanged; no global dependency is retired.

## Environment and retained artifacts

Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0 eb6cafb7290e8bd5f2937522d8d804f58f02bafc;
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
The isolated local source checkout is clean. The shared checkout's unrelated
TwistForRows edit was preserved. Protected source and workflows are unchanged.

The native artifact 15198517963 was verified and restored: 660 files,
338757850 bytes; ZIP digest
f1345ef3dc47bbf93e58c4b6a946596b62e94d7f287ff5f04086c5f8502a2ecc;
inner digest 35db72daacbbb00449c12be74f0c79a324128baf72a429cff841d11d0207b57e.
The previous local import cache is retained for rollback.
[Restore receipt](2026-11-27_restored_b2_cache/cache_restore_results.json).
Restoration is not proof execution. Both local cold attempts timed out at
LocalHomUnit (900 s), including the corrected lakefile-option attempt;
the shared source compiled that module in 12 s. Avoid another local cold build.

The exporter/verifier compatibility check actually passed on Lean 4.35.0
for Nat.le_refl only: 11 nodes, 29 edges, zero missing, no axioms.
[Exact test](2026-11-27_graph_core_compatibility/compatibility_results.json).
This is not a B2 graph result. C2 RUN78 and RUN79 are authenticated; the prepared workspace runner now supports the four Carrier consumers using a retained checked C2 module. No C2 execution or parallel C2 build is claimed. See [C2 continuation](2026-11-27_C2_CALLER_WORK.md).

Earlier step-by-step checkpoints remain in the Git history at
[e9d6043](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/e9d6043bfdfbcddfe6a32b64539900d0f6d5bf40/research_archive/2026-11-24_lean_rh_translation_swarm/integration/2026-11-27_ACTIVE_B2_CALLER_WORK.md).

RESUME HERE: verify the repaired six-root graph now running locally from the existing checked module. The fused count-to-energy candidate is prepared separately in [its work plan](2026-11-27_FUSED_B2_PLAN.md). Preserve all errors and conditional inputs.
Do not infer full B2, the complete human assembly or RH from these local checks.
