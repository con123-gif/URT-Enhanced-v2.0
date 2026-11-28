import New.Columns.ChainValuation
import ThetaLeafRun92
import Lean

/-!
RUN102 — actual chosen-level freeness accepted; reuse its compiled object
at all seven existing RUN84 caller transports without retactic elaboration.
28 November 2026. LEAF NATIVE VERIFIED; CALLER TRANSPORT PREPARED ONLY.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207; Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 /
1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484.
Read AGENTS and relevant protocol/handoff/expansion entries. Peer C2 value
family and B3 local graph acceptance retained; neither closes A2.

ACTUAL receipt, run 46125697285, state branch
compute/rh-compact-a2-leaf-repair-20261128/outputs/theta92/:
theta92_result.json blob 492e6c7c2590f849ba59eae6f11517b646d72f44;
union_summary.json c04a9bf47f734d3fb8f0f13d48c4266e6a887625;
root_audits.json c7e6c987416d5b8d1bf9432e0076a79efd98e2da;
scan_prune.log 44114e365371cbc506ba0e0418bfaa0a95434008;
graph.log 7c658c0780d6915b62f86c04cf28bfd883376122.
Leaf compile exit 0 (7.48 s); graph compile exit 0 (72.72 s);
three roots, 123363 union nodes, 3979339 edges, zero missing;
three independent root audits exit 0. Standard axioms only
(propext, Classical.choice, Quot.sound). Old classAut_eq_bot mask 1,
new matrix torsion supplier mask 6; old neatness absent in the TWO
replacement leaf roots, not globally. Actual rh_prune original-statement
adapter 7 -> 6 binders with original bridge checked; original and
already-strengthened declarations have no binder reduction.
Bounded scans visit 2000 each, pending 218/244/241, zero missing in
visited subsets; full graph audit is separate.

Mathematical reduction: same rational point in the finite stabilizer,
congruence at the two distinct chosen residue primes, and injectivity
of the rational point at the same place imply its order is both a
power of one prime and a power of the other, hence one. The old
cardinality hypothesis is unnecessary for this freeness leaf, but
the original-statement adapter retains it; do not drop rank guards
used by the GL-order or numerical rank callers. No changes to D.

Overall run status ERROR (blob d441245589289aa78ea05fa4071abcc33bf1288b):
run97.json 5a7f2fe23e4fdf3dab24c03096c36aacdf281ed5 shows leaf accepted,
short_span exit 124 at 1800 s, EMPTY diagnostic log. This is a timeout,
not a diagnosed theorem error. RUN93 short-only and RUN101 heterogeneous
rank remain independent unverified candidates. No new retactic attempt
or speculative shortness fix in this run.

New actionable step: RUN84's seven existing proof-term transports
previously bundled unaccepted RUN81/82 source. Import the ACTUAL accepted
ThetaLeafRun92 object instead and use precisely the unchanged RUN84
transport tail, extracted from blob f1baabce0ee70e12f7bb859bece258096d4bed4c.
This avoids repeating the accepted leaf or the timed-out RUN93
elaboration. All seven caller statements, universe parameters,
nine source edges and all unmodified proof terms are retained. This is
not the independent short/rank split: the joint rank/short proof still
supplies the span, and the downstream A/B/C obligations remain.

Source preflight this run: pinned ChosenPlaceLevels, ColumnDefs and
ChainValuation blobs d6b4c62956e3ca1259fd69dd8c882a6fe021e7c3 / 104b875374798b99448625fe6ce062ea6bfbfe65 / 19e853dfa8c645bfcdf3b3e21183f9b432620ef7.
Checked nine actual source anchors, nine per-edge removal controls,
seven generated transport invocations. The transport tail is the exact
decoded JS string, not reimplemented. No new Lean execution this run.
Do not conflate the previous native leaf result with this caller file.
No global deletion, A2 closure or full RH proof/replay claimed.

RESUME HERE: restore the ORIGINAL cache artifact 15236761794 with
RUN97's pinned bootstrap/intake (do not rerun accepted leaf); retrieve
the ACCEPTED artifact 15257040847 from run 46125697285
(public nightly.link path /con123-gif/URT-Enhanced-v2.0/actions/runs/
46125697285/compute-rh-compact-a2-leaf-repair-20261128.zip).
Require ZIP size 23603754 and SHA256
d263dd5577aa905985527528441160c60c40cb0991b41f57abc580ae9b6dba77.
Extract only job/outputs/theta92/ThetaLeafRun92.olean to OUT and verify
SHA256 09cfb2c1db343b5f6d5369927ac018c5745e9141b0e5266ae2144937c7fc15ce.
In authenticated grh-compact workspace, with OUT added to the existing
lake env LEAN_PATH (obtain it via lake env; do not overwrite it), run
lean --tstack=400000 -R OUT -o OUT/ThetaCallerRun102.olean PATH.
Require normal kernel exit 0, THETA84_LEAF_CHECKED and seven distinct
THETA84_CHECKED markers, exact original types and standard axiom sets.
Then use existing strict RUN26_COMPACT_GRAPH exporter on original/new
caller roots, preserve all masks and old-leaf paths, and run bounded
rh_scan/rh_prune there before using RUN85; keep RUN93 timeout evidence.
HANDOFF kernel/integration/audit/acceleration. All root obligations OPEN.
-/


set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0
set_option pp.fullNames true

private def theta84SameType (a b : Lean.ConstantInfo) :
    Lean.Elab.Command.CommandElabM Unit := do
  unless a.levelParams == b.levelParams do
    Lean.throwError "THETA84 universe mismatch"
  let same ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.isDefEq a.type b.type
  unless same do
    Lean.throwError "THETA84 supplier type mismatch"

private def theta84Audit (old fresh : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  theta84SameType (← Lean.getConstInfo old) (← Lean.getConstInfo fresh)
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  unless oa.all (fun x => allowed.contains x) &&
      na.all (fun x => allowed.contains x && oa.contains x) do
    Lean.throwError "THETA84 unexpected/new axiom"
  for n in #[old, fresh] do
    let info ← Lean.getConstInfo n
    let some val := info.value? (allowOpaque := true) |
      Lean.throwError "THETA84 missing proof value"
    Lean.logInfo m!"THETA84_TYPE|{n}|{(Lean.toJson (reprStr info.type)).compress}"
    Lean.logInfo m!"THETA84_LEVEL|{n}|{(Lean.toJson (reprStr info.levelParams)).compress}"
    for dep in info.type.getUsedConstants do
      Lean.logInfo m!"THETA84_EDGE|{n}|type|{dep}"
    for dep in val.getUsedConstants do
      Lean.logInfo m!"THETA84_EDGE|{n}|value|{dep}"
    Lean.logInfo m!"THETA84_AXIOMS|{n}|{← Lean.collectAxioms n}"

private def theta84Transport (old fresh : Lean.Name)
    (subs : Array (Lean.Name × Lean.Name)) :
    Lean.Elab.Command.CommandElabM Unit := do
  let .thmInfo info ← Lean.getConstInfo old |
    Lean.throwError "THETA84 original not a theorem"
  let before := info.value.getUsedConstants
  for (a,b) in subs do
    theta84SameType (← Lean.getConstInfo a) (← Lean.getConstInfo b)
    unless before.contains a && !before.contains b do
      Lean.throwError m!"THETA84 expected edge absent or already changed: {old} {a}"
  let proof := info.value.replace fun e =>
    match e with
    | .const n us =>
      match subs.find? (fun pair => pair.1 == n) with
      | some pair => some (.const pair.2 us)
      | none => none
    | _ => none
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl {
    name := fresh
    levelParams := info.levelParams
    type := info.type
    value := proof
  })
  let .thmInfo checked ← Lean.getConstInfo fresh |
    Lean.throwError "THETA84 checked theorem missing"
  unless checked.type == info.type && checked.levelParams == info.levelParams do
    Lean.throwError "THETA84 changed exact caller type"
  let expected := (before.filter (fun n => !subs.any (fun s => s.1 == n))) ++
    subs.map (·.2)
  let after := checked.value.getUsedConstants
  unless expected.all (fun x => after.contains x) &&
      after.all (fun x => expected.contains x) do
    Lean.throwError "THETA84 changed unexpected value edge"
  unless !after.contains old && subs.all (fun s => !after.contains s.1) do
    Lean.throwError "THETA84 old caller or supplier remains"
  theta84Audit old fresh
  Lean.logInfo m!"THETA84_CHECKED|{fresh}"

run_cmd do
  let old := ``Data.classAut_eq_bot_of_le_chosenLevel
  let fresh := ``ThetaRun82.chosenLevel_free_original
  theta84Audit old fresh
  let some v := (← Lean.getConstInfo fresh).value? (allowOpaque := true) |
    Lean.throwError "THETA84 leaf missing"
  unless v.getUsedConstants.contains ``ThetaRun82.chosenLevel_free &&
      !v.getUsedConstants.contains old do
    Lean.throwError "THETA84 leaf bridge mismatch"
  Lean.logInfo "THETA84_LEAF_CHECKED"

run_cmd do
  theta84Transport ``Data.card_classAut_dvd_chosenGroupOrder ``Data.card_classAut_dvd_chosenGroupOrder_run84
    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]
  theta84Transport ``Data.classAut_columnLevel_eq_bot ``Data.classAut_columnLevel_eq_bot_run84
    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]
  theta84Transport ``Data.finrank_ker_one_sub_centralGen_le ``Data.finrank_ker_one_sub_centralGen_le_run84
    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original), (``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)]
  theta84Transport ``Data.exists_chain_eq_sum ``Data.exists_chain_eq_sum_run84
    #[(``Data.classAut_eq_bot_of_le_chosenLevel, ``ThetaRun82.chosenLevel_free_original)]
  theta84Transport ``Data.ramifyingOp_finrank_comap_and_short ``Data.ramifyingOp_finrank_comap_and_short_run84
    #[(``Data.finrank_ker_one_sub_centralGen_le, ``Data.finrank_ker_one_sub_centralGen_le_run84)]
  theta84Transport ``Data.span_short_ramifiedColumns ``Data.span_short_ramifiedColumns_run84
    #[(``Data.ramifyingOp_finrank_comap_and_short, ``Data.ramifyingOp_finrank_comap_and_short_run84), (``Data.classAut_columnLevel_eq_bot, ``Data.classAut_columnLevel_eq_bot_run84)]
  theta84Transport ``Data.IsGoodDatum.gaugeLe_chain ``Data.IsGoodDatum.gaugeLe_chain_run84
    #[(``Data.exists_chain_eq_sum, ``Data.exists_chain_eq_sum_run84)]

#print axioms Data.classAut_eq_bot_of_le_chosenLevel
#print axioms ThetaRun82.chosenLevel_free_original
#print axioms Data.card_classAut_dvd_chosenGroupOrder
#print axioms Data.card_classAut_dvd_chosenGroupOrder_run84
#print axioms Data.classAut_columnLevel_eq_bot
#print axioms Data.classAut_columnLevel_eq_bot_run84
#print axioms Data.finrank_ker_one_sub_centralGen_le
#print axioms Data.finrank_ker_one_sub_centralGen_le_run84
#print axioms Data.exists_chain_eq_sum
#print axioms Data.exists_chain_eq_sum_run84
#print axioms Data.ramifyingOp_finrank_comap_and_short
#print axioms Data.ramifyingOp_finrank_comap_and_short_run84
#print axioms Data.span_short_ramifiedColumns
#print axioms Data.span_short_ramifiedColumns_run84
#print axioms Data.IsGoodDatum.gaugeLe_chain
#print axioms Data.IsGoodDatum.gaugeLe_chain_run84
