/-
RUN86 — close the identified definition boundary, PREPARED, not native replayed.
27 Nov 2026; credit Alpöge, Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src/New/Filling/FillingData.lean
blob 0ef8b0dfe13173b16bd0a8820a4924f10124e278; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.

RUN85 identified Data.filling as a remaining definition dependency. At the
actual source, Filling.mk receives D.classAut_columnLevel_eq_bot as a proof
argument. Replace ONLY this theorem constant in the elaborated definition
value. The new proof has the same proposition and universe arguments. By
proof irrelevance the constructor expression (including dependent later
fields) is definitionally equal, not merely isomorphic. All Bessel systems,
level data, choice terms, other proofs and the SAME D remain unchanged.
Require kernel acceptance, exact definition type, explicit definitional
equality of the definitions, exact changed value edges and axiom guards.
The immediate consumer Data.columnLevel_zero_eq_comap mentions Data.filling
in BOTH its statement and proof. Replacing only its proof would leave the
old definition in the type. Retarget both type and value, preserve exact
universe parameters and require definitional equality of full statements.
The source also shows SeesawTheorem uses columnLevel_zero_eq_comap and
filling_fits; FillingTheorem.ramifiedColumns_fill_rows uses filling_fits.
No claim of old-leaf absence there: filling_fits, Bessel, projectedPoincare,
B1–B4, enough_forms and all other unresolved A/B/C/D/E/V obligations retained.

Source preflight executed against actual connector response: authenticated
FillingData blob; constructor proof edge, retained Bessel supplier, comap
statement and two consumer proof anchors checked; five independently
damaged source controls rejected (5/5). Original source direct graph:
Data.filling -> Data.classAut_columnLevel_eq_bot; Data.columnLevel_zero_eq_comap
-> Data.filling (type and value; textual anchors, not full kernel graph).
Proposed graph swaps those edges to _run84 and _run86 respectively.
Native Lean NOT run. No rh_scan/prune/reduce/auto/frontier or URT result;
all axiom/graph checks below are executable pending tests, not receipts.

Actual shared CI 46023465491 failed; inspect status.json and outputs on
cathedral-research-state. A1 errors IsOpen.matrix and CommRing Nat, and A2
separate jet overlay unsolved real area cancellation. Peer repairs already
prepared by kernel RUN59 c4faecaf359388ce92f6bd30fc6422880c778 and acceleration
RUN83 f8ecd08a72ca81df42fd133e1c0c200864dc2aa2; do not duplicate or claim PASS.
This file is a tail, not standalone. Append to exact generated RUN85 module
with cat RUN86_A2_FILLING_DEFINITION_TAIL.lean >> ThetaTransportRun86.lean
(after copying RUN85 to a new file). No Main import. Run in reused ORIGINAL
LongForms workspace. Preserve prior receipts and all original source.

RESUME HERE: after the RUN84/85 leaf and transports compile, append this
tail, run lake env lean --tstack=400000 ThetaTransportRun86.lean, require
exit 0 and both THETA86_CHECKED markers; then export the strict graph for
the old/new definition and consumer. Do not launch a duplicate cold build.
HANDOFF TO kernel, acceleration, integration, audit. RH/star OPEN.
-/

private def theta86Subst (e : Lean.Expr) (old fresh : Lean.Name) : Lean.Expr :=
  e.replace fun x => match x with
    | .const n us => if n == old then some (.const fresh us) else none
    | _ => none

private def theta86Edges (before after : Lean.Expr) (old fresh : Lean.Name)
    : Lean.Elab.Command.CommandElabM Unit := do
  let a := before.getUsedConstants
  let b := after.getUsedConstants
  unless a.contains old && !a.contains fresh do
    Lean.throwError "THETA86 missing original edge or already replaced"
  let expected := (a.filter (fun n => n != old)) ++ #[fresh]
  unless expected.all (fun n => b.contains n) && b.all (fun n => expected.contains n) do
    Lean.throwError "THETA86 changed unexpected edge"
  unless !b.contains old && b.contains fresh do
    Lean.throwError "THETA86 old edge remains"

private def theta86DefEq (a b : Lean.Expr) : Lean.Elab.Command.CommandElabM Unit := do
  let ok ← Lean.Elab.Command.liftTermElabM do
    Lean.Meta.withTransparency .all <| Lean.Meta.isDefEq a b
  unless ok do
    Lean.throwError "THETA86 not definitionally equal"

private def theta86Axioms (old fresh : Lean.Name) :
    Lean.Elab.Command.CommandElabM Unit := do
  let oa ← Lean.collectAxioms old
  let na ← Lean.collectAxioms fresh
  let allowed : Array Lean.Name := #[``propext, ``Classical.choice, ``Quot.sound]
  unless oa.all (fun n => allowed.contains n) &&
    na.all (fun n => allowed.contains n && oa.contains n) do
    Lean.throwError "THETA86 unexpected/new axiom"
  for n in #[old, fresh] do
    let i ← Lean.getConstInfo n
    let some v := i.value? (allowOpaque := true) |
      Lean.throwError "THETA86 no value"
    for dep in i.type.getUsedConstants do
      Lean.logInfo m!"THETA86_EDGE|{n}|type|{dep}"
    for dep in v.getUsedConstants do
      Lean.logInfo m!"THETA86_EDGE|{n}|value|{dep}"
    Lean.logInfo m!"THETA86_AXIOMS|{n}|{← Lean.collectAxioms n}"

run_cmd do
  let old := ``Data.filling
  let fresh := `Data.filling_run86
  let a := ``Data.classAut_columnLevel_eq_bot
  let b := ``Data.classAut_columnLevel_eq_bot_run84
  theta84SameType (← Lean.getConstInfo a) (← Lean.getConstInfo b)
  let .defnInfo info ← Lean.getConstInfo old |
    Lean.throwError "THETA86 expected definition"
  let val := theta86Subst info.value a b
  theta86Edges info.value val a b
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.defnDecl
    { info with name := fresh, value := val })
  let .defnInfo checked ← Lean.getConstInfo fresh |
    Lean.throwError "THETA86 checked definition missing"
  unless checked.type == info.type && checked.levelParams == info.levelParams do
    Lean.throwError "THETA86 changed definition type"
  theta86Edges info.value checked.value a b
  let us := info.levelParams.map Lean.Level.param
  theta86DefEq (.const old us) (.const fresh us)
  theta86Axioms old fresh
  Lean.logInfo m!"THETA86_CHECKED|{fresh}"

run_cmd do
  let old := ``Data.columnLevel_zero_eq_comap
  let fresh := `Data.columnLevel_zero_eq_comap_run86
  let a := ``Data.filling
  let b := ``Data.filling_run86
  let .thmInfo info ← Lean.getConstInfo old |
    Lean.throwError "THETA86 expected theorem"
  let ty := theta86Subst info.type a b
  let val := theta86Subst info.value a b
  theta86Edges info.type ty a b
  theta86Edges info.value val a b
  theta86DefEq info.type ty
  Lean.Elab.Command.liftCoreM <| Lean.addDecl (.thmDecl
    { name := fresh, levelParams := info.levelParams, type := ty, value := val })
  let .thmInfo checked ← Lean.getConstInfo fresh |
    Lean.throwError "THETA86 checked consumer missing"
  unless checked.type == ty && checked.levelParams == info.levelParams do
    Lean.throwError "THETA86 changed intended consumer type"
  theta86Edges info.type checked.type a b
  theta86Edges info.value checked.value a b
  theta86Axioms old fresh
  Lean.logInfo m!"THETA86_CHECKED|{fresh}"

#print axioms Data.filling
#print axioms Data.filling_run86
#print axioms Data.columnLevel_zero_eq_comap
#print axioms Data.columnLevel_zero_eq_comap_run86
