import Lean
import Lean.LibrarySuggestions.Basic
import Lean.Elab.Command

/-! Verbatim copies (pin 40e56bab): BuildAid/D1.lean:4; HeckeNonvanishing/Imports.lean:3-8;
    NumberFieldFamilies/OwnStruct.lean:3-66; HermitianCurvatureProofs/CutCptCopy.lean:12-91 (its line-1..10 imports replaced by core Lean). -/

run_cmd Lean.modifyEnv fun env => Lean.LibrarySuggestions.nameDenyListExt.addEntry env "CompanionTheory"

open Lean Elab Tactic Meta

elab "kexactB " e:term : tactic => withMainContext do
  let g ← getMainGoal
  let v ← Term.elabTermAndSynthesize e none
  g.assign (← instantiateMVars v)

namespace Formalism.L2.Fam.KCopy

open Lean Meta Elab Tactic Term

def kdefeq (a b : Expr) : MetaM Bool := do
  let a ← instantiateMVars a
  let b ← instantiateMVars b
  if a.hasMVar || b.hasMVar then return false
  match Kernel.isDefEq (← getEnv) (← getLCtx) a b with
  | .ok r => return r
  | .error _ => return false

def ownStruct (env : Environment) (S : Name) : Bool :=
  isStructure env S && (S.getRoot == `Formalism || [``And, ``Prod, ``PProd, ``Sigma, ``PSigma, ``Subtype, ``Iff].contains S)

partial def copyAt (probe : Bool) (e tgt : Expr) (path : String) (fuel : Nat) : StateT (Array String) MetaM Expr := do
  let tgt ← instantiateMVars tgt
  let srcTy ← instantiateMVars (← inferType e)
  if srcTy == tgt then return e
  if fuel = 0 then
    modify (·.push path); return e
  let env ← getEnv

  if let .forallE n d b bi := tgt then
    return ← withLocalDecl n bi d fun x => do
      let body ← copyAt probe (mkApp e x) (b.instantiate1 x) (path ++ ".(" ++ toString n ++ ")") (fuel - 1)
      mkLambdaFVars #[x] body

  if let .const S us := tgt.getAppFn then
    if ownStruct env S then
      let ctor := getStructureCtor env S
      let fields := getStructureFields env S
      let mut acc := mkAppN (mkConst ctor.name us) (tgt.getAppArgs.extract 0 ctor.numParams)
      for i in [:fields.size] do
        let accTy ← whnf (← inferType acc)
        let .forallE _ fty _ bi := accTy | throwError "kcopy: constructor type of {S} is not a ∀"
        let p := Expr.proj S i e
        let v ← if bi.isInstImplicit then pure p else copyAt probe p fty (path ++ "." ++ toString fields[i]!) (fuel - 1)
        acc := mkApp acc v
      return acc

  if !probe then return e
  if ← kdefeq srcTy tgt then return e
  let tgtW ← whnf tgt
  let isOwn := match tgtW.getAppFn with | .const S _ => ownStruct env S | _ => false
  if tgtW.isForall || isOwn then
    return ← copyAt probe e tgtW path (fuel - 1)
  let ty := toString (← ppExpr tgt)
  modify (·.push (path ++ " : " ++ (if ty.length > 400 then (String.mk (ty.toList.take 400)) ++ "…" else ty))); return e

elab "kcopy " t:term : tactic => withMainContext do
  let g ← getMainGoal
  let tgt ← instantiateMVars (← g.getType)
  let e ← instantiateMVars (← Term.elabTermAndSynthesize t none)
  let (v, _) ← (copyAt false e tgt "" 64).run #[]
  g.assign (← instantiateMVars v)

elab "#kcopy_probe " t:term " : " ty:term : command => Command.runTermElabM fun _ => do
  let tgt ← instantiateMVars (← Term.elabType ty)
  let e ← instantiateMVars (← Term.elabTermAndSynthesize t none)
  let (_, bad) ← (copyAt true e tgt "" 64).run #[]
  logInfo m!"kcopy_probe: {bad.size} refused: {bad.toList}"

end Formalism.L2.Fam.KCopy

open Lean Meta Elab Command

namespace Formalism.FourierDecayAlt.P.CptCopy

def special : List (Name × Name) :=
  [(`Formalism.FourierDecayAlt.P.pb_formPos, `Formalism.FourierDecayAlt.P.module_form_pos_compact_support),
   (`Formalism.FourierDecayAlt.P.list_duality_level_group, `Formalism.FourierDecayAlt.P.size_standard_compact),
   (`Formalism.FourierDecayAlt.P.vector_isomorphism_levels, `Formalism.FourierDecayAlt.P.vector_isomorphism_compact_support)]

def manual : List Name :=
  [`Formalism.FourierDecayAlt.P5.ThmPActual, `Formalism.FourierDecayAlt.KB.SizeStd, `Formalism.FourierDecayAlt.KB.VIso, `Formalism.FourierDecayAlt.P.PBL.FormPos,
   `Formalism.FourierDecayAlt.P.standard_pairing_of_heads,
   `Formalism.FourierDecayAlt.P.TBBx5.FormNonneg, `Formalism.FourierDecayAlt.P.TBBx5.form_re_nonneg, `Formalism.FourierDecayAlt.P.TBBx5.form_cs,
   `Formalism.FourierDecayAlt.P.TBBx5.formNonneg_of, `Formalism.FourierDecayAlt.P.CutBP.posAt_of_cpt, `Formalism.FourierDecayAlt.P.TBBx5.integral_three_at_place_of_parts,
   `Formalism.FourierDecayAlt.P.TBBx5.integral_four_at_place_of_parts, `Formalism.FourierDecayAlt.P.CutBP.truncated_limit_positivity_holds, `Formalism.FourierDecayAlt.P.CutBP.glGram]

def roots : List Name :=
  [`Formalism.FourierDecayAlt.P.CutBP.thmBpAt_main4, `Formalism.FourierDecayAlt.P.CutBP.germ_truncation_positive, `Formalism.FourierDecayAlt.P.CutBP.block_growth_bound_of_compact_coef,
   `Formalism.FourierDecayAlt.P.CutBP.nFTopFormAll_of_ptw, `Formalism.FourierDecayAlt.P.CutBP.top_identity_of_domination_limits, `Formalism.FourierDecayAlt.P.CutBP.nfPolFormAll_of_top]

def terminal (n : Name) : Bool := manual.contains n || (special.lookup n).isSome

def suffixed : Name → Name
  | .str p s => .str p (s ++ "Cpt")
  | n => .str n "Cpt"

def proposals (ci : ConstantInfo) : Array Name :=
  ci.type.getUsedConstants ++ ((ci.value? (allowOpaque := true)).map (·.getUsedConstants) |>.getD #[])

partial def go (env : Environment) (n : Name) (st : NameSet × NameSet × Array Name) : NameSet × NameSet × Array Name :=
  let (seen, tainted, order) := st
  if seen.contains n || terminal n then st else
  let seen := seen.insert n
  match env.find? n with
  | none => (seen, tainted, order)
  | some ci =>
    let us := proposals ci
    let (seen, tainted, order) :=
      us.foldl (fun s c => if (`Formalism).isPrefixOf c then go env c s else s) (seen, tainted, order)
    if us.any (fun c => terminal c || tainted.contains c) then (seen, tainted.insert n, order.push n)
    else (seen, tainted, order)

def toCopy (env : Environment) : NameSet × Array Name :=
  let (_, tainted, order) := roots.foldl (fun s r => go env r s) ({}, {}, #[])
  (tainted, order)

def mapName (tainted : NameSet) (n : Name) : Name :=
  match special.lookup n with
  | some m => m
  | none => if manual.contains n || tainted.contains n then suffixed n else n

def subst (tainted : NameSet) (e : Expr) : Expr :=
  e.replace fun
    | .const n ls => some (.const (mapName tainted n) ls)
    | _ => none

def copyAll (defsOnly : Bool) : CoreM Nat := do
  let (tainted, order) := toCopy (← getEnv)
  let mut k := 0
  for n in order do
    let env ← getEnv
    let n' := mapName tainted n
    if env.contains n' then continue
    let some ci := env.find? n | throwError "missing {n}"
    match ci with
    | .defnInfo d =>
      addDecl (.defnDecl { d with name := n', type := subst tainted d.type, value := subst tainted d.value })
      k := k + 1
    | .thmInfo t =>
      if defsOnly then continue
      addDecl (.thmDecl { t with name := n', type := subst tainted t.type, value := subst tainted t.value })
      k := k + 1
    | _ => throwError "cannot copy {n}"
  return k

elab "cpt_copy_thms" : command => do
  let k ← liftCoreM (copyAll false)
  logInfo m!"copied {k} declarations"

end Formalism.FourierDecayAlt.P.CptCopy

/-! ### RUN8 toy environment (added; NOT upstream). Names chosen to hit CutCptCopy's hard-coded lists. -/
open Lean
-- NEGATIVE: the substitution makes the copied statement False but keeps the proof of True.
def Formalism.FourierDecayAlt.KB.SizeStd : Prop := True
def Formalism.FourierDecayAlt.KB.SizeStdCpt : Prop := False
theorem Formalism.FourierDecayAlt.P.CutBP.thmBpAt_main4 : Formalism.FourierDecayAlt.KB.SizeStd := trivial

cpt_copy_thms   -- expected: kernel rejects thmBpAt_main4Cpt : SizeStdCpt := trivial

#check @Formalism.FourierDecayAlt.P.CutBP.thmBpAt_main4Cpt   -- expected: unknown constant

-- NEGATIVE: kexactB assigns an ill-typed term without an elaboration-time check
theorem Formalism.Toy.bad : (1 : Nat) = 2 := by kexactB (rfl : (1 : Nat) = 1)
#print axioms Formalism.Toy.bad
