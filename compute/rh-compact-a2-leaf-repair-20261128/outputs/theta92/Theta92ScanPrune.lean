import Lean
import ThetaLeafRun92

open Lean Meta Elab Command

/-!
Grok handoff follow-up. Native proof-term premise pruning, not merely whnf.
Exact API anchors: Lean v4.33.1 Declaration.lean (value? defaults to
allowOpaque=false), Meta/Basic.lean (lambdaTelescope, mkLambdaFVars,
mkForallFVars), AddDecl.lean (addDecl), Elab/Command.lean (liftCoreM).
Status: prepared source; native verification required.

Commands accept fully qualified declaration names, not namespace prefixes.
No replacement of existing declarations, no sorry/admit, no claim of
global proof minimality or a proof of RH.
-/
namespace RHProofPrune

structure Candidate where
  reduced : Declaration
  bridge : Declaration
  oldBinders : Nat
  newBinders : Nat

/-- Only theorems with visible values are candidates. Preserve the original
conclusion and every dependency of retained binder types, not just variables
mentioned in the proof body. -/
def makeCandidate (src dst : Name) : MetaM (Option Candidate) := do
  let env := (← getEnv).setExporting false
  if env.contains dst || env.contains (Name.str dst "original") then
    throwError "destination already exists"
  let some (.thmInfo info) := env.find? src | throwError "not a visible theorem"
  let us := info.levelParams.map Level.param
  lambdaTelescope info.value fun xs body => do
    let expected ← inferType (mkAppN (mkConst src us) xs)
    let actual ← inferType body
    unless ← isDefEq actual expected do
      throwError "source proof and residual theorem type do not agree"
    let expected ← instantiateMVars expected
    let body ← instantiateMVars body
    let mut kept : Array Expr := #[]
    -- A reverse pass is sufficient because a telescope binder type can
    -- depend only on earlier binders. Keep dependency closure.
    for x in xs.reverse do
      let id := x.fvarId!
      let mut needed := body.containsFVar id || expected.containsFVar id
      for y in kept do
        let ty ← instantiateMVars (← inferType y)
        if ty.containsFVar id then needed := true
      if needed then kept := #[x] ++ kept
    if kept.size == xs.size then return none
    let ty ← mkForallFVars kept expected
    let val ← mkLambdaFVars kept body
    let ty ← instantiateMVars ty
    let val ← instantiateMVars val
    if ty.hasFVar || val.hasFVar || ty.hasMVar || val.hasMVar ||
        ty.hasLooseBVars || val.hasLooseBVars then
      throwError "pruned declaration is not closed"
    -- The kernel, not inferType alone, must check this declaration.
    let reduced : Declaration := .thmDecl {
      name := dst
      levelParams := info.levelParams
      type := ty
      value := val }
    -- Construct a separate bridge proving the ORIGINAL statement from
    -- the pruned theorem. Kernel-check this too, after adding reduced.
    let bridgeVal ← mkLambdaFVars xs (mkAppN (mkConst dst us) kept)
    let bridge : Declaration := .thmDecl {
      name := Name.str dst "original"
      levelParams := info.levelParams
      type := info.type
      value := bridgeVal }
    return some { reduced, bridge, oldBinders := xs.size, newBinders := kept.size }

/-- Generate fresh checked declarations, not a counter of normalisations. -/
elab "rh_prune " src:ident " as " dst:ident : command => do
  let candidate ← liftTermElabM do
    makeCandidate src.getId dst.getId
  match candidate with
  | none => logInfo m!"NO_BINDER_REDUCTION {src.getId}"
  | some c =>
    liftCoreM <| Lean.addDecl c.reduced
    liftCoreM <| Lean.addDecl c.bridge
    logInfo m!"PRUNED {src.getId}: {c.oldBinders} -> {c.newBinders} binders; original bridge checked"

/-- Bounded root traversal. Follows type, value and structural package
edges; absence of a value is not evidence that there are no dependencies.
Retains an explicit count of missing and not-yet-visited nodes. -/
def scanRoot (root : Name) (limit : Nat) : CoreM Unit := do
  let env := (← getEnv).setExporting false
  let mut seen : NameSet := {}
  let mut todo : Array Name := #[root]
  let mut visited := 0
  let mut missing := 0
  let mut axiomCount := 0
  let mut values := 0
  let mut noValue := 0
  while !todo.isEmpty && visited < limit do
    let n := todo.back!
    todo := todo.pop
    if seen.contains n then continue
    seen := seen.insert n
    visited := visited + 1
    match env.find? n with
    | none =>
      missing := missing + 1
      IO.println s!"MISSING {n}"
    | some ci =>
      for d in ci.type.getUsedConstants do
        todo := todo.push d
      match ci.value? (allowOpaque := true) with
      | some v =>
        values := values + 1
        for d in v.getUsedConstants do
          todo := todo.push d
      | none =>
        noValue := noValue + 1
      for d in ci.all do
        todo := todo.push d
      match ci with
      | .axiomInfo _ =>
        axiomCount := axiomCount + 1
        IO.println s!"AXIOM {n}"
      | .inductInfo i =>
        for d in i.ctors do
          todo := todo.push d
      | .ctorInfo c =>
        todo := todo.push c.induct
      | .recInfo r =>
        for d in r.all do
          todo := todo.push d
        for rule in r.rules do
          todo := todo.push rule.ctor
          for d in rule.rhs.getUsedConstants do
            todo := todo.push d
      | _ => pure ()
  -- Pending stack may include duplicates; count distinct unvisited names.
  let mut pending : NameSet := {}
  let mut pendingCount := 0
  for n in todo do
    unless seen.contains n || pending.contains n do
      pending := pending.insert n
      pendingCount := pendingCount + 1
  IO.println s!"ROOT_SCAN root={root} visited={visited} values={values} noValue={noValue} axioms={axiomCount} missing={missing} pending={pendingCount}"

elab "rh_scan " src:ident " limit " n:num : command => do
  liftCoreM <| scanRoot src.getId n.getNat

end RHProofPrune

-- Exact regression controls; these are not RH proof data.
theorem RHPruneUnused (P Q : Prop) (hp : P) (_hq : Q) : P := hp
rh_prune RHPruneUnused as RHPruneUnusedReduced
example (P : Prop) (hp : P) : P := RHPruneUnusedReduced P hp

theorem RHPruneDependent (α : Type) (x : α) (_n : Nat) : x = x := rfl
rh_prune RHPruneDependent as RHPruneDependentReduced
example (α : Type) (x : α) : x = x := RHPruneDependentReduced α x

theorem RHPruneNoDrop (P : Prop) (hp : P) : P := hp
rh_prune RHPruneNoDrop as RHPruneNoDropReduced
run_cmd do
  if (← getEnv).contains `RHPruneNoDropReduced then
    throwError "negative control: no redundant binder should exist"

rh_scan RHPruneUnusedReduced limit 100
#print axioms RHPruneUnusedReduced
#print axioms RHPruneUnusedReduced.original
#print axioms RHPruneDependentReduced
#print axioms RHPruneDependentReduced.original
rh_scan Data.classAut_eq_bot_of_le_chosenLevel limit 2000
rh_prune Data.classAut_eq_bot_of_le_chosenLevel as Theta92Pruned0
rh_scan ThetaRun82.chosenLevel_free_original limit 2000
rh_prune ThetaRun82.chosenLevel_free_original as Theta92Pruned1
rh_scan ThetaRun82.chosenLevel_free limit 2000
rh_prune ThetaRun82.chosenLevel_free as Theta92Pruned2
