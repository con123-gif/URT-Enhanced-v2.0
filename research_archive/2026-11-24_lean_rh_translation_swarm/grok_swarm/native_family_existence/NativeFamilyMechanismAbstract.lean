/-
  Native family existence — ABSTRACT mechanism companion (Grok, 2026-11-24).

  This file is SELF-CONTAINED core Lean 4 (no Mathlib, no upstream imports).
  It formalises only the *logical skeleton* of two upstream mechanisms at
  leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005:

   (S) selection: `GlobalTheory.Fc.{QOf, cls, pick, pick_isSel, IsSel, Row, Row.elim}`
       (ValidForConstructedPointClassesEventuallyWorking.lean, blob 6f511130...)
       and the shape of `UpperTheory.Top.classSel` (ClassSel.lean, blob bb17cd65...);
   (G) gluing: `GlobalTheory.EX.{cutScale, famOfKits, exists_famP_of_kits}`
       (ExistsFamPOfKits.lean, blob b5246ad2...).

  Typechecking this file is NOT evidence that the upstream theorems hold or that
  this abstraction is equivalent to them: the upstream objects (FamP, D7, Obj,
  Ctx, BPt, Par, ParEv/EvP ...) are replaced by opaque parameters, and the
  eventual-in-parameters quantifier layer (ParEv/EvP) is deliberately dropped.
  It checks only that the stated combinatorial/choice argument is sound.
-/

namespace NFE

/-! ## (S) Selection: the family class is *defined* from a selected object property -/
section Selection

variable {Fam : Type} {Ix : Fam → Type} {Obj : Type} (obj : (Fm : Fam) → Ix Fm → Obj)
variable {Par : Type} (Link : Par → Fam → Prop)
variable {Bd : Obj → Type} (Built : Par → (o : Obj) → Bd o → Prop)

/-- abstract `QOf`: some built datum over `o` satisfies `E κ`. -/
def QOf (E : Par → (o : Obj) → Bd o → Prop) (κ : Par) (o : Obj) : Prop :=
  ∃ b : Bd o, Built κ o b ∧ E κ o b

/-- abstract `cls` (= `clsP (QOf ..)`): families linked to some κ all of whose points satisfy `QOf E κ`. -/
def cls (E : Par → (o : Obj) → Bd o → Prop) (Fm : Fam) : Prop :=
  ∃ κ : Par, Link κ Fm ∧ ∀ i : Ix Fm, QOf Built E κ (obj Fm i)

/-- abstract `RawSel`. -/
def RawSel (A : Fam → Prop) : Type :=
  (Fm : Fam) → A Fm → (i : Ix Fm) → Bd (obj Fm i)

/-- abstract `IsSel`. -/
def IsSel (E : Par → (o : Obj) → Bd o → Prop) (A : Fam → Prop) (σ : RawSel obj (Bd := Bd) A) : Prop :=
  ∀ (Fm : Fam) (h : A Fm), ∃ κ : Par, Link κ Fm ∧
    ∀ i : Ix Fm, Built κ (obj Fm i) (σ Fm h i) ∧ E κ (obj Fm i) (σ Fm h i)

/-- abstract `pick`: choose the witnessing datum at every point (uses choice, as upstream). -/
noncomputable def pick (E : Par → (o : Obj) → Bd o → Prop) :
    RawSel obj (Bd := Bd) (cls obj Link Built E) :=
  fun _Fm h i => Classical.choose ((Classical.choose_spec h).2 i)

/-- abstract `pick_isSel`. -/
theorem pick_isSel (E : Par → (o : Obj) → Bd o → Prop) :
    IsSel obj Link Built E (cls obj Link Built E) (pick obj Link Built E) := by
  intro Fm h
  refine ⟨Classical.choose h, (Classical.choose_spec h).1, fun i => ?_⟩
  exact Classical.choose_spec ((Classical.choose_spec h).2 i)

/-- abstract `Row` (the `RowE` side condition is kept as an opaque predicate `RowE`). -/
def Row (RowE : (Par → (o : Obj) → Bd o → Prop) → Prop)
    (H : (A : Fam → Prop) → RawSel obj (Bd := Bd) A → Prop) : Prop :=
  ∃ E, RowE E ∧ ∀ (A : Fam → Prop) (σ : RawSel obj (Bd := Bd) A), IsSel obj Link Built E A σ → H A σ

/-- abstract `Row.elim`: a row property holds for the canonical class/selection. -/
theorem Row.elim (RowE : (Par → (o : Obj) → Bd o → Prop) → Prop)
    {H : (A : Fam → Prop) → RawSel obj (Bd := Bd) A → Prop}
    (h : Row obj Link Built RowE H) :
    ∃ E, RowE E ∧ H (cls obj Link Built E) (pick obj Link Built E) := by
  obtain ⟨E, e, hH⟩ := h
  exact ⟨E, e, hH _ _ (pick_isSel obj Link Built E)⟩

/-- Shape of `classSel`: the SAME class/selection carries the row conclusion `H`, the weak
selection property, and — only through a separately supplied producer `recS` turning the
row-evaluation input into existence for `cls` — the existence statement `Ex`.
Nothing here proves that `cls` is nonempty; that is exactly the content of `Ex`. -/
theorem classSel_shape (RowE : (Par → (o : Obj) → Bd o → Prop) → Prop)
    (Ex : (Fam → Prop) → Prop) (Hyp : Prop)
    (recS : ∀ E, RowE E → Hyp → Ex (cls obj Link Built E))
    {H : (A : Fam → Prop) → RawSel obj (Bd := Bd) A → Prop}
    (h : Row obj Link Built RowE H) :
    ∃ (A : Fam → Prop) (σ : RawSel obj (Bd := Bd) A),
      (Hyp → Ex A) ∧ IsSel obj Link Built (fun _ _ _ => True) A σ ∧ H A σ := by
  obtain ⟨E, e, hH⟩ := Row.elim obj Link Built RowE h
  refine ⟨cls obj Link Built E, pick obj Link Built E, recS E e, ?_, hH⟩
  intro Fm hc
  obtain ⟨κ, hl, ht⟩ := pick_isSel obj Link Built E Fm hc
  exact ⟨κ, hl, fun i => ⟨(ht i).1, trivial⟩⟩

end Selection

/-! ## (G) Gluing per-scale kits into one windowed family -/
section Gluing

variable {α : Type} [LT α] [LE α]
variable (Win : α → Prop) (x1 y : α)
variable (KIx : α → Type) (Pt : α → Type) (pt : (s : α) → KIx s → Pt s)

open Classical in
/-- abstract `cutScale`: the real window point itself above `x1`, else the fixed fallback `y`. -/
noncomputable def cut (x : α) : α := if x1 < x ∧ Win x then x else y

theorem cut_ge (le_of_lt' : ∀ a b : α, a < b → a ≤ b) (hy : x1 ≤ y) (x : α) : x1 ≤ cut Win x1 y x := by
  unfold cut; split
  · next h => exact le_of_lt' _ _ h.1
  · exact hy

omit [LE α] in
theorem cut_win (hw : Win y) (x : α) : Win (cut Win x1 y x) := by
  unfold cut; split
  · next h => exact h.2
  · exact hw

omit [LE α] in
theorem cut_eq (x : α) (h1 : x1 < x) (h2 : Win x) : cut Win x1 y x = x := by
  unfold cut; simp [h1, h2]

/-- abstract `famOfKits` index type: kit points at the cut scale, but only when
`x ≤ x1` or `x` is a window point.  Off-window points above `x1` get NO indices. -/
def FIx (x : α) : Type := { _i : KIx (cut Win x1 y x) // x ≤ x1 ∨ Win x }

/-- Exceptional case preserved: above `x1` and off the window set the family is empty,
so every `∀ i : Fm.Ix x, …` statement is vacuous there. -/
theorem FIx_empty (lt_irr : ∀ a b : α, a < b → ¬ b ≤ a) (x : α) (h1 : x1 < x) (h2 : ¬ Win x) :
    FIx Win x1 y KIx x → False := by
  intro ⟨_, h⟩
  cases h with
  | inl h => exact lt_irr _ _ h1 h
  | inr h => exact h2 h

/-- Nonempty on windows above `x1` (abstract `Ix_win`), given every kit is nonempty. -/
theorem FIx_nonempty (ne : ∀ s, Nonempty (KIx s)) (x : α) (h2 : Win x) :
    Nonempty (FIx Win x1 y KIx x) :=
  let ⟨i⟩ := ne (cut Win x1 y x); ⟨⟨i, Or.inr h2⟩⟩

/-- Pointwise transfer (abstract fields `classOf` / `Rr` of `exists_famP_of_kits`): any property
holding at every point of every admissible kit holds at every point of the glued family. -/
theorem glue_transfer (le_of_lt' : ∀ a b : α, a < b → a ≤ b) (hy : x1 ≤ y) (hw : Win y)
    (P : (s : α) → Pt s → Prop)
    (hP : ∀ s, x1 ≤ s → Win s → ∀ i : KIx s, P s (pt s i)) (x : α) (i : FIx Win x1 y KIx x) :
    P (cut Win x1 y x) (pt (cut Win x1 y x) i.1) :=
  hP _ (cut_ge Win x1 y le_of_lt' hy x) (cut_win Win x1 y hw x) i.1

end Gluing

end NFE

#print axioms NFE.pick_isSel
#print axioms NFE.classSel_shape
#print axioms NFE.FIx_empty
#print axioms NFE.glue_transfer
