import Mathlib
import Lean.LibrarySuggestions.Basic

/-! V2: automatic library premise selection plus recursive proof-producing reduction.
    No use of apply? (which can admit partial suggestions).
    Bounded heuristic search, NOT a global mathematical minimizer. -/


namespace RHReductionAuto

open Lean Meta Elab Tactic

private abbrev Step := TSyntax `tactic
private abbrev GoalKey := Expr × Array Expr

private def goalKey : TacticM GoalKey := withMainContext do
  let t ← getMainTarget
  let hs ← getLocalHyps
  let types ← hs.mapM fun h => do instantiateMVars (← inferType h)
  return (t, types)

private partial def exprCost : Expr → Nat
  | .app f a => 1 + exprCost f + exprCost a
  | .lam _ t b _ | .forallE _ t b _ => 1 + exprCost t + exprCost b
  | .letE _ t v b _ => 1 + exprCost t + exprCost v + exprCost b
  | .mdata _ e | .proj _ _ e => 1 + exprCost e
  | _ => 1

private def frontierCost : TacticM Nat := do
  let mut n := 0
  for g in (← getUnsolvedGoals) do
    let t ← g.withContext do instantiateMVars (← g.getType)
    n := n + 1 + exprCost t
  return n

private def closes (s : Step) : TacticM Bool := do
  let before ← Tactic.saveState
  try
    evalTactic s
    if (← getUnsolvedGoals).isEmpty then return true
    before.restore
    return false
  catch _ =>
    before.restore
    return false

private def elementary : TacticM Bool := do
  let steps : Array Step := #[
    ← `(tactic| assumption), ← `(tactic| rfl), ← `(tactic| simp_all),
    ← `(tactic| norm_num), ← `(tactic| ring), ← `(tactic| omega),
    ← `(tactic| linarith), ← `(tactic| nlinarith),
    ← `(tactic| positivity), ← `(tactic| solve_by_elim)]
  for s in steps do
    if ← closes s then return true
  return false

-- Seed project rules by declaration name; select library rules automatically for each goal.
-- Library selection is optional: if no selector is registered, continue.
private def candidates (library : Bool) : TacticM (Array Step) := do
  let mut names : Array Name := #[`RHReductionAuto.rank_upper, `RHReductionAuto.scalar_budget]
  if library then
    let more ← try
      Lean.LibrarySuggestions.select (← getMainGoal)
        { maxSuggestions := 24, caller := some "rh_auto" }
      catch _ => pure #[]
    for s in more do
      unless names.contains s.name do
        names := names.push s.name
  let env ← getEnv
  let mut steps : Array Step := #[]
  for n in names do
    match env.find? n with
    | some (.axiomInfo _) | none => pure ()
    | some _ =>
      let id : TSyntax `term := ⟨mkCIdentFrom (← getRef) n (canonical := true)⟩
      steps := steps.push (← `(tactic| apply $id))
  return steps ++ #[← `(tactic| intro), ← `(tactic| constructor),
    ← `(tactic| simp_all), ← `(tactic| ring_nf at *),
    ← `(tactic| apply_assumption)]

private partial def solveRec (fuel : Nat) (ancestors : List GoalKey) : TacticM Unit := do
  if (← getUnsolvedGoals).isEmpty then return
  if ← elementary then return
  if fuel == 0 then throwError "rh_auto: unresolved leaf"
  let key ← goalKey
  if ancestors.contains key then throwError "rh_auto: repeated goal"
  let steps ← candidates true
  for step in steps do
    let saved ← Tactic.saveState
    try
      evalTactic step
      let children ← getUnsolvedGoals
      for child in children do
        unless (← child.isAssigned) do
          setGoals [child]
          solveRec (fuel - 1) (key :: ancestors)
          unless (← getUnsolvedGoals).isEmpty do
            throwError "rh_auto: incomplete child"
      setGoals []
      return
    catch _ =>
      saved.restore
  throwError "rh_auto: no complete proof found within search bounds"

private partial def frontierRec (fuel : Nat) : TacticM Unit := do
  if (← getUnsolvedGoals).isEmpty then return
  if ← elementary then return
  if fuel == 0 then return
  let oldCost ← frontierCost
  -- Only project rules and elementary tactics in partial mode.
  for step in (← candidates false) do
    let saved ← Tactic.saveState
    try
      evalTactic step
      let cost ← frontierCost
      if cost >= oldCost then throwError "nondecreasing frontier"
      let children ← getUnsolvedGoals
      let mut remaining : List MVarId := []
      for child in children do
        unless (← child.isAssigned) do
          setGoals [child]
          frontierRec (fuel - 1)
          remaining := remaining ++ (← getUnsolvedGoals)
      setGoals remaining
      pruneSolvedGoals
      return
    catch _ =>
      saved.restore

syntax (name := rhAuto) "rh_auto " num : tactic
elab_rules : tactic
  | `(tactic| rh_auto $depth:num) =>
    withoutRecover <| focus <| solveRec depth.getNat []

syntax (name := rhAutoFrontier) "rh_auto_frontier " num : tactic
elab_rules : tactic
  | `(tactic| rh_auto_frontier $depth:num) =>
    withoutRecover <| focus <| frontierRec depth.getNat

-- Explicit source-matched replacement rules, not a proof of RH.
theorem rank_upper {V W : Type*} [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (f : V →ₗ[ℂ] W) (D : ℕ)
    (h : Module.finrank ℂ V ≤ D) :
    Module.finrank ℂ (LinearMap.range f) ≤ D :=
  (LinearMap.finrank_range_le f).trans h

theorem scalar_budget (z D L B : ℝ)
    (hz : 0 ≤ z) (hD : z ≤ D) (hB : 0 ≤ B) (hL : L ≤ B) :
    z*L ≤ D*B :=
  (mul_le_mul_of_nonneg_left hL hz).trans (mul_le_mul_of_nonneg_right hD hB)

theorem auto_rank {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (f : V →ₗ[ℂ] W) (D : ℕ)
    (h : Module.finrank ℂ V ≤ D) :
    Module.finrank ℂ (LinearMap.range f) ≤ D := by
  rh_auto 4

theorem auto_factor (a b : ℝ) : 1+a-b-a*b = (1+a)*(1-b) := by
  rh_auto 2

theorem auto_local_chain (P Q R : Prop) (hp : P) (pq : P → Q) (qr : Q → R) :
    R := by rh_auto 4

-- Frontier mode cannot turn an open proposition into a finished proof.
theorem reject_unproved (_P : Prop) : True := by
  fail_if_success
    have : _P := by rh_auto 0
  trivial

theorem frontier_rank {V W : Type*} [AddCommGroup V]
    [Module ℂ V] [FiniteDimensional ℂ V] [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (f : V →ₗ[ℂ] W) (D : ℕ)
    (h : Module.finrank ℂ V ≤ D) :
    Module.finrank ℂ (LinearMap.range f) ≤ D := by
  rh_auto_frontier 4

-- Negative control: partial reduction must not admit an arbitrary proposition.
theorem frontier_reject (_P : Prop) : True := by
  fail_if_success
    have : _P := by rh_auto_frontier 2
  trivial

#print axioms frontier_reject
#print axioms frontier_rank
#print axioms rank_upper
#print axioms scalar_budget
#print axioms auto_rank
#print axioms auto_factor
#print axioms auto_local_chain
#print axioms reject_unproved

end RHReductionAuto
