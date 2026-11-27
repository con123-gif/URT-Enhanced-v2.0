# RUN88 — separate the two chart roles at the actual B3 shell callers
27 November 2026. SOURCE-MATCHED HUMAN AUDIT; native replay pending; RH OPEN.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read live ONE_EQUATION_MISSION, LIVE_PROOF_SPINE, LIVE_OBLIGATIONS, AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES. Latest peer commit
9e12d55e (A/B/C star junction) and 5873eda0 (prime remainder endpoint)
are distinct from this B3 audit. No change to any schedule, workflow,
queue entry or original/reduced graph.

## Native queue evidence
RUN87 commit feba40b3133af2d4ef84d9cfe9d01509756a7e77 registers
rh-compact-b3-direct-chart-replay-20261127. On this run the state-branch
status.json, outputs/run87_shared_receipt.json and
outputs/b3/run86_receipt.json at that job path each returned HTTP 404.
Actual compute workflow run 46075703055 (created 22:17:17 UTC) selected
rh-compact-a1-repair-graph-20261127, not B3; its run job was in progress.
No B3 compiler or graph result is available from those checks. Do not
resubmit or interrupt A1; no new helper proof while RUN85/86 is awaiting replay.

## Exact remaining chart roles — not a new shell derivation
Source blobs from the compact pin:
- New/RealPlace/WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd:
  floorMassLe_floorWeight_div (35–45), lintegral_mul_invWeight_le (98–135).
- New/RealPlace/LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6:
  pivotModulus_sq_le_of_capped (101–115), lintegral_positions_le (326–343),
  sq_lintegral_le_selfNormProduct (349–363), formMajorant_sq_le (368–380),
  formModulus_sq_le_of_char (389–416), formModulus_sq_le_of_heads (421–458).
- New/RealPlace/LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e:
  Gauge.com (296–301).
- New/RealPlace/ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53:
  formConst_mul_lintegral_le (56–101).
- New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111:
  lintegral_shells_le (275–333).

Let W_v be the native set of w satisfying v*w=0 and the same close-pair
condition, L_u(w)=star(u) dot w. The original com supplies one measurable
majorant phi for BOTH inverse volume vol(L_u(W_v))^(-1) and the direct
volume of the admissible c-set, with the same power-integral bound.
RUN82's DirectFloorChart is only the second component for v=0 at positions
of size 1. It is sufficient for the direct floor recurrence, not the
first component and not general v.

There are TWO distinct inverse consumers:
1. floorMassLe_floorWeight_div: v=0, x in F.positions (not necessarily
   positionsOfSize); takes (k u).1. Its output is the capped pivot bound.
2. lintegral_mul_invWeight_le: v=(nu.1.1 * F.orthonormalPart).toRows_1,
   x in F.positions, nu in the lower unipotent a.e. support, takes
   (h u).1. Its output supplies the two inverse-weight factors.
   The second chart is NOT generally the first with v=0.

The exact order obstruction is W_v subset W_0, so
  vol(L_u(W_v)) <= vol(L_u(W_0)),
  vol(L_u(W_v))^(-1) >= vol(L_u(W_0))^(-1).
This is the wrong direction to transfer an upper bound for the inverse
majorant from v=0. Even when the first volume at v=0 is positive, a
linear restriction may collapse its image. For example in R^2 with
W_0=[-1,1]^2, v=(1,0), L_u(w)=w_1, the image is [-1,1] for W_0 and
{0} for W_v. In one-dimensional Lebesgue measure the inverse volumes
are 1/2 and infinity. This is a general set/linear-map negative control,
not an instance of all native gauge hypotheses. A full native inverse
majorant needs its actual quantitative supplier, not monotonicity or
a reuse of the direct chart.

## Source-visible caller paths and gauge identity
positions_le calls the shell gauge Gamma' selfNorm twice, and the head
gauge Gamma supplies md_le. For the finite shell Gamma' is chosen from
star(c)c for the content generator c; Gamma is the original depth gauge.
Gamma and Gamma' are not interchangeable. The real shell likewise uses
a gauge for the dyadic shell and the original head gauge.
The following paths are source-visible (not elaborated graph evidence):
real/finite shell -> formMajorant_sq_le -> pivotModulus_sq_le_of_capped
 -> floorMassLe_floorWeight_div -> com inverse at zero matrix;
real/finite shell -> formMajorant_sq_le -> sq_lintegral_le_selfNormProduct
 -> lintegral_mul_invWeight_le -> com inverse at restricted matrix;
character Fourier -> sq_lintegral_le_selfNormProduct -> inverse weight;
unequal-head Fourier -> inverse weight (two occurrences), and Parseval.
Consequently a successful RUN85 replay is NOT permission to delete
either inverse supplier or replace the entire gauge by DirectFloorChart.
No new proof of these suppliers is asserted. This isolates exact remaining
premises and avoids a false generalization before transport to shell callers.

## Actual verification this run
Fetched all four caller source files directly at the compact commit and
executed exact source occurrence counts in JavaScript over each named
lemma body. Counts (expected=observed):
- zero matrix com call and first projection: 1,1;
- restricted matrix com call and first projection: 1,1;
- positions shell-gauge selfNorm and original gauge md: 2,1;
- capped pivot inverse-floor call: 1;
- majorant capped pivot and selfNormProduct supplier: 1,1;
- selfNormProduct inverse weight: 2;
- character selfNormProduct: 1;
- unequal heads inverse weight: 2;
- real positions and majorant: 1,1;
- finite positions with two gauges and majorant: 1,1.
16/16 source occurrence guards matched. No native Lean execution,
rh_scan/prune/reduce/auto/frontier, axiom or recursive graph PASS this
run. The previous B2/C2 receipts are not B3 evidence. No URT improvement
claimed.

RESUME HERE: read the registered B3 job's actual run86_receipt.json and
compiler/graph logs; repair only a failing stage or, after complete
acceptance, transport positions_via_directChart to the two exact shell
callers while retaining both inverse-chart paths above. B3 and star open.
HANDOFF TO: B3 / integration / audit.
