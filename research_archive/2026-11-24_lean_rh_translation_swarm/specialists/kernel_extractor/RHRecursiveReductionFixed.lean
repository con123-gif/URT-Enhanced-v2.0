import Mathlib

open Lean Elab Tactic

/-! Proof-producing, bounded recursive reduction. Supply proved reduction lemmas
    in priority order. A branch is accepted only if all its subgoals close.
    This is a tactic, not a proof of RH or a global proof-minimality algorithm. -/
namespace RHReduction

private def closeLeaf : TacticM Unit := do
  evalTactic (← `(tactic| first
    | (assumption; done)
    | (rfl; done)
    | (simp_all; done)
    | (norm_num; done)
    | (ring; done)
    | (omega; done)
    | (linarith; done)
    | (nlinarith; done)
    | (positivity; done)))

private partial def reduceGoal (steps : Array (TSyntax `tactic))
    (fuel : Nat) : TacticM Unit := do
  if (← getUnsolvedGoals).isEmpty then return
  let leafState ← Tactic.saveState
  try
    closeLeaf
    return
  catch _ =>
    leafState.restore
  if fuel == 0 then
    throwError "rh_reduce: remaining obligation at depth limit"
  for step in steps do
    let saved ← Tactic.saveState
    try
      evalTactic step
      let subgoals ← getUnsolvedGoals
      for g in subgoals do
        unless (← g.isAssigned) do
          setGoals [g]
          reduceGoal steps (fuel - 1)
          unless (← getUnsolvedGoals).isEmpty do
            throwError "rh_reduce: unresolved child obligation"
      setGoals []
      return
    catch _ =>
      saved.restore
  throwError "rh_reduce: no supplied reduction closes this goal"

/-- `rh_reduce n using [r₁, ...]` tries elementary closure, then applies each
    proved rule and recursively discharges ALL its premises, to depth n.
    Failed applications restore the full elaboration/tactic state. -/
syntax (name := rhReduce) "rh_reduce " num " using " "[" term,* "]" : tactic

elab_rules : tactic
  | `(tactic| rh_reduce $depth:num using [$rules,*]) => do
    let mut steps : Array (TSyntax `tactic) := #[]
    for rule in rules.getElems do
      steps := steps.push (← `(tactic| apply $rule))
    steps := steps ++ #[← `(tactic| intro), ← `(tactic| constructor),
      ← `(tactic| simp_all), ← `(tactic| ring_nf at *)]
    withoutRecover <| focus <| reduceGoal steps depth.getNat

/-- Greedy bounded frontier reduction. Unlike `rh_reduce`, this keeps open
    obligations visible. It never asserts that they are proved. -/
private partial def reduceFrontier (steps : Array (TSyntax `tactic))
    (fuel : Nat) : TacticM Unit := do
  if (← getUnsolvedGoals).isEmpty then return
  let leafState ← Tactic.saveState
  try
    closeLeaf
    return
  catch _ =>
    leafState.restore
  if fuel == 0 then return
  for step in steps do
    let saved ← Tactic.saveState
    try
      evalTactic step
      let subgoals ← getUnsolvedGoals
      let mut remaining : List MVarId := []
      for g in subgoals do
        unless (← g.isAssigned) do
          setGoals [g]
          reduceFrontier steps (fuel - 1)
          remaining := remaining ++ (← getUnsolvedGoals)
      setGoals remaining
      pruneSolvedGoals
      return
    catch _ =>
      saved.restore

syntax (name := rhFrontier) "rh_frontier " num " using " "[" term,* "]" : tactic

elab_rules : tactic
  | `(tactic| rh_frontier $depth:num using [$rules,*]) => do
    let mut steps : Array (TSyntax `tactic) := #[]
    for rule in rules.getElems do
      steps := steps.push (← `(tactic| apply $rule))
    withoutRecover <| focus <| reduceFrontier steps depth.getNat

noncomputable section

-- Source-matched local replacement lemmas; no RH hypothesis is asserted here.
theorem signed_factor (a b : ℝ) :
    1 + a - b - a*b = (1+a)*(1-b) := by ring

theorem level_rank_upper {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (f : V →ₗ[ℂ] W) (D : ℕ)
    (h : Module.finrank ℂ V ≤ D) :
    Module.finrank ℂ (LinearMap.range f) ≤ D :=
  (LinearMap.finrank_range_le f).trans h

-- Count only the total and the two bad populations. a and b are distortion factors.
theorem three_count_transfer (n m d a b w₀ w₁ c₀ c₁ : ℝ)
    (hn : 0 < n) (ha : 0 < a) (hb : 0 ≤ b)
    (hw : 0 ≤ w₀ + w₁) (ht : a*d ≤ n) (hc : n-m ≤ c₀+c₁)
    (h₀ : c₀ ≤ b*d*w₀) (h₁ : c₁ ≤ b*d*w₁) :
    (n-m)/n ≤ (b/a)*(w₀+w₁) := by
  have hsum : n-m ≤ b*d*(w₀+w₁) := by
    linarith [mul_add (b*d) w₀ w₁]
  have hda : d ≤ n/a := (le_div_iff₀ ha).2 (by linarith [mul_comm d a])
  have hbd : b*d ≤ (b/a)*n := by
    calc
      b*d ≤ b*(n/a) := mul_le_mul_of_nonneg_left hda hb
      _ = (b/a)*n := by ring
  apply (div_le_iff₀ hn).2
  calc
    n-m ≤ b*d*(w₀+w₁) := hsum
    _ ≤ ((b/a)*n)*(w₀+w₁) := mul_le_mul_of_nonneg_right hbd hw
    _ = (b/a*(w₀+w₁))*n := by ring

-- Rank inequality and relaxed cohomological budget, without exact rank equality.
theorem budget_transfer (eta z D C A Q y B Nc l : ℝ)
    (hz : 0 ≤ z) (hD : z ≤ D) (hy : 0 ≤ y)
    (hB : 0 ≤ B) (hNc : 0 ≤ Nc) (hl : 0 ≤ l)
    (hly : l ≤ y) (hA : 0 ≤ A)
    (hQ : Q ≤ A*y*(B+Nc))
    (h : eta ≤ z*(C*(y*B+l*Nc)+Q)) :
    eta ≤ D*(((|C|)+A)*y*(B+Nc)) := by
  have hbase : 0 ≤ y*B+l*Nc := by positivity
  have hbase' : y*B+l*Nc ≤ y*(B+Nc) := by
    linarith [mul_le_mul_of_nonneg_right hly hNc, mul_add y B Nc]
  have hC : C*(y*B+l*Nc) ≤ (|C|)*(y*(B+Nc)) :=
    (mul_le_mul_of_nonneg_right (le_abs_self C) hbase).trans
      (mul_le_mul_of_nonneg_left hbase' (abs_nonneg C))
  have hbr : C*(y*B+l*Nc)+Q ≤ ((|C|)+A)*y*(B+Nc) := by
    linarith [add_mul (|C|) A y, add_mul ((|C|)*y) (A*y) (B+Nc)]
  have hpos : 0 ≤ ((|C|)+A)*y*(B+Nc) := by positivity
  exact h.trans ((mul_le_mul_of_nonneg_left hbr hz).trans
    (mul_le_mul_of_nonneg_right hD hpos))

-- User rules really are recursively composed; no unproved intermediate is admitted.
theorem recursive_chain (P Q R S : Prop) (hp : P)
    (pq : P → Q) (qr : Q → R) (rs : R → S) : S := by
  rh_reduce 6 using [rs, qr, pq]

-- An unrelated alternative must be rolled back rather than assumed.
theorem backtrack_test (P Q R : Prop) (hp : P)
    (_bad : Q → R) (good : P → R) : R := by
  rh_reduce 3 using [_bad, good]

theorem rank_test {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] [AddCommGroup W] [Module ℂ W]
    [FiniteDimensional ℂ W] (f : V →ₗ[ℂ] W) (D : ℕ)
    (h : Module.finrank ℂ V ≤ D) :
    Module.finrank ℂ (LinearMap.range f) ≤ D := by
  rh_reduce 4 using [level_rank_upper]

-- A false/unavailable proposition must fail; keep the surrounding theorem true.
example (_P : Prop) : True := by
  fail_if_success
    have : _P := by rh_reduce 1 using []
  trivial

#print axioms signed_factor
#print axioms level_rank_upper
#print axioms three_count_transfer
#print axioms budget_transfer
#print axioms recursive_chain
#print axioms backtrack_test
#print axioms rank_test

end
end RHReduction
