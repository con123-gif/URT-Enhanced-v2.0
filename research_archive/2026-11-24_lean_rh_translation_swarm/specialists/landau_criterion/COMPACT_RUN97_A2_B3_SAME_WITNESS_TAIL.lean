/-
RUN97 — join the real B3 Bessel producer to the SAME A2 filling and map.
28 November 2026. SOURCE-MATCHED / PREPARED, NOT native verified.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission/spine/ledger read: 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF and EXPANSION read. Prior RUN96 0265d2460acb7b5d3586f49034f217531164c7a1.
RUN95 status.json, outputs/run93_caller_receipt.json and outputs/run94/run94_receipt.json
on cathedral-research-state under compute/rh-compact-b3-caller-layout-repair-20261128
each returned 404. Actual jobs for run 46114460776 completed for A1 cached
single pass, NOT our B3. Do not infer B3 native status or duplicate queue.

Pinned source under grh-compact/src:
New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278:
 Data.filling contains D.classAut_columnLevel_eq_bot AND
 (D.exists_besselSystem · |>.choose). Data.columnLevel_zero_eq_comap
 references filling in its type and body.
New/Seesaw/BesselGeneric.lean a7c7ef1df4208394af100088f6e142c6acbceac8:
 Data.filling_fits has type D.filling.Fits ... and its first proof field is
 (D.exists_besselSystem · |>.choose_spec). It independently consumes the old
 theorem, even if we replace its filling type. Data.columnCoords consumes
 filling_fits.columnCoords.
New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76:
 Data.poincare = D.filling_fits.poincareMap.1 ∘ₗ D.columnCoords.

Do not fork the A2 construction: reuse theta RUN86
(aaa0e1ff9464d80ab0d4397367279cdd12922843) and RUN87
(ba1101caf13444d28a19de3682c83e1c38a92255), including existing helpers
theta87Transport, theta86DefEq, theta86Axioms. RUN94 Bessel theorem source
36a24847dffcbd3fc5bec568582342171efb2e5e and RUN96
acfcc5706081c0f598b55fb9e7cfaae90fd8e2c8.

Exact reduction: for each fixed D,v let p and p' prove the identical
existential proposition ∃ B : BesselSystem _ D.b D.f,
IsBessel B (D.paramW v) (D.κ v). Lean proof irrelevance gives p ≡ p'.
Thus Classical.choose p ≡ Classical.choose p', and the choose_spec
proofs inhabit definitionally identical predicates. With the already
transported A2 proof unchanged, the filling record, fit, coordinates and
Poincare map can all be definitionally equal to their RUN86/87 versions.
This is not the assertion that arbitrary witnesses of an existential
are equal: the SAME choice function is applied to proof-irrelevant
arguments. Both the choose and choose_spec edges must be replaced.
Use the native defeq and exact type/value edge guards; if any fail, reject
rather than inserting a fresh witness or disabling checks.

This is a tail to append to the exact accepted ThetaTransportRun87 source,
with import RHRun94System added at the TOP before all commands. Reuses
existing theta helpers, not another proof search engine. New definitions
and dependent theorem statements both retarget the relevant constants.
Preserve original statement definitional equality and equality of the
data-bearing definitions; no new axioms. The comap branch is retained
for A2, not just the B3 rank branch. The generated filling.eq_1,
FillingAdmissible, seesaw, petersson, all projected maps and any
indirect references to old definitions remain explicit audit frontier.
Do not assert global elimination of either old supplier.

Actual JS preflight: 15/15 pinned source/peer anchor checks (three exact
upstream blobs; same choose, choose_spec, comap, coordinates and Poincare;
A2 candidate and comap; existing defeq helper; B3 producer and prior
boundary). Six explicit source-subgraph checks passed: original Poincare
reaches old Bessel; joint subgraph reaches new Bessel and retains A2;
each omission of either producer substitution restores the old path.
These are source-level routing tests, NOT a kernel graph. Local command
-v lean/lake returned no executable. No native rh_scan/prune/reduce/auto/
frontier run this session. No new quantitative bound, RH proof, or native
PASS. Existing B2/B3, A2, quantitative premises and original graphs stay.

RESUME HERE: after actual accepted RUN94 Bessel and theta RUN86/87 receipts,
append this tail as instructed, compile once in their common authenticated
workspace; require five new theta87Transport markers, exact defeq and
edge guards and ten-root constructor-inclusive original/joint graph for
the five declarations. The direct Bessel supplier and A2 proof both must
survive as new edges; record all indirect old paths. If first native
guard fails, inspect its actual expression and auxiliaries before edits.
Hand the joined Poincare/fit/comap to integration for same-map propagation
with RUN96 Fits; do not duplicate the existing common-star transport.
HANDOFF TO theta / integration / kernel / audit. RH and B3 remain OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

run_cmd do
  let e := (``Data.exists_besselSystem, ``Data.exists_besselSystem_via_directChart)
  let f := (``Data.filling_run86, `Data.filling_a2_b3_joined)
  let h := (``Data.filling_fits_run87, `Data.filling_fits_a2_b3_joined)
  let c := (``Data.columnCoords_run87, `Data.columnCoords_a2_b3_joined)
  let p := (``Data.poincare_run87, `Data.poincare_a2_b3_joined)
  theta87Transport f.1 f.2 #[e] #[e.1]
  theta87Transport ``Data.columnLevel_zero_eq_comap_run86
    `Data.columnLevel_zero_eq_comap_a2_b3_joined #[f] #[f.1]
  theta87Transport h.1 h.2 #[f,e] #[f.1,e.1]
  theta87Transport c.1 c.2 #[f,h] #[h.1]
  theta87Transport p.1 p.2 #[f,h,c] #[h.1,c.1]
  let .defnInfo fi ← Lean.getConstInfo f.2 |
    Lean.throwError "RUN97 joined filling is not a definition"
  let fv := fi.value.getUsedConstants
  unless fv.contains ``Data.classAut_columnLevel_eq_bot_run84 &&
      fv.contains e.2 && !fv.contains e.1 &&
      !fv.contains ``Data.classAut_columnLevel_eq_bot do
    Lean.throwError "RUN97 A2/B3 simultaneous direct supplier guard failed"
  let .thmInfo hi ← Lean.getConstInfo h.2 |
    Lean.throwError "RUN97 joined fit missing"
  unless hi.type.getUsedConstants.contains f.2 &&
      hi.value.getUsedConstants.contains e.2 &&
      !hi.value.getUsedConstants.contains e.1 do
    Lean.throwError "RUN97 choose_spec or dependent fit type not retargeted"
  Lean.logInfo "RUN97_SAME_WITNESS_GUARDS"

#print axioms Data.filling_run86
#print axioms Data.filling_a2_b3_joined
#print axioms Data.columnLevel_zero_eq_comap_run86
#print axioms Data.columnLevel_zero_eq_comap_a2_b3_joined
#print axioms Data.filling_fits_run87
#print axioms Data.filling_fits_a2_b3_joined
#print axioms Data.columnCoords_run87
#print axioms Data.columnCoords_a2_b3_joined
#print axioms Data.poincare_run87
#print axioms Data.poincare_a2_b3_joined
