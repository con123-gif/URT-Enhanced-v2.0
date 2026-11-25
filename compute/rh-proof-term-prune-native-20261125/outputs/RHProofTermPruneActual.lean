import Mathlib

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


open Complex

theorem Formalism.VW.rh_of_right (hz : ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s ≠ 0) : RiemannHypothesis := by
  unfold RiemannHypothesis
  intro s hs htriv hs1
  rcases lt_trichotomy s.re (1 / 2) with hlt | heq | hgt
  · exfalso
    have hpi : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
    have hs0 : s ≠ 0 := by
      rintro rfl
      rw [riemannZeta_zero] at hs
      norm_num at hs
    have ht : 1 / 2 < (1 - s).re := by
      rw [Complex.sub_re, Complex.one_re]
      linarith
    have h1 : (1 - s) ≠ 1 := by
      intro h
      apply hs0
      linear_combination -h
    have hnat : ∀ n : ℕ, (1 - s) ≠ -(n : ℂ) := by
      intro n h
      have hr := congrArg Complex.re h
      rw [Complex.sub_re, Complex.one_re, Complex.neg_re, Complex.natCast_re] at hr
      have : (0 : ℝ) ≤ n := n.cast_nonneg
      linarith
    have key := riemannZeta_one_sub hnat h1
    rw [sub_sub_cancel, hs] at key
    have hz' := hz (1 - s) ht h1
    have h2pi : (2 : ℂ) * (2 * (Real.pi : ℂ)) ^ (-(1 - s)) ≠ 0 :=
      mul_ne_zero two_ne_zero (Complex.cpow_ne_zero_iff.2 (Or.inl (mul_ne_zero two_ne_zero hpi)))
    have hG : Complex.Gamma (1 - s) ≠ 0 := Complex.Gamma_ne_zero_of_re_pos (by linarith)
    have hcos : Complex.cos ((Real.pi : ℂ) * (1 - s) / 2) ≠ 0 := by
      rw [Ne, Complex.cos_eq_zero_iff]
      rintro ⟨k, hk⟩
      have h3 : ((1 - s) - (2 * (k : ℂ) + 1)) * (Real.pi : ℂ) = 0 := by
        linear_combination 2 * hk
      rcases mul_eq_zero.1 h3 with h | h
      · have hsk : s = -2 * (k : ℂ) := by linear_combination -h
        have hre : s.re = -2 * (k : ℝ) := by
          rw [hsk, Complex.mul_re]
          simp
        rcases lt_trichotomy k 0 with hk0 | hk0 | hk0
        · have : (k : ℝ) ≤ -1 := by exact_mod_cast (show k ≤ -1 by omega)
          linarith
        · apply hs0
          rw [hsk, hk0]
          simp
        · apply htriv
          refine ⟨(k - 1).toNat, ?_⟩
          have hnk : ((k - 1).toNat : ℤ) = k - 1 := Int.toNat_of_nonneg (by omega)
          have h' : (((k - 1).toNat : ℕ) : ℂ) = (k : ℂ) - 1 := by
            have := congrArg (fun m : ℤ => (m : ℂ)) hnk
            push_cast at this
            exact this
          rw [hsk, h']
          ring
      · exact hpi h
    exact (mul_ne_zero (mul_ne_zero (mul_ne_zero h2pi hG) hcos) hz') key.symm
  · exact heq
  · exact absurd hs (hz s hgt hs1)

rh_prune Formalism.VW.rh_of_right as RHPrunedActualRoot
rh_scan Formalism.VW.rh_of_right limit 2000
