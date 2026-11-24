/-
  ExceptionalPairCaseSkeleton.lean  (core Lean 4 only; no Mathlib; no upstream imports)
  Propositional skeleton of the third clause of `GlobalTheory.ExceptionalPair.main`
  (pin 40e56ba, ExceptionalDirichletZeroUniqueZeroFreeRegion.lean:47): the case analysis
  real-quadratic-and-real-zero / principal / other, and how the three zero-free inputs cover it.
  Abstract Props stand for: sq1 = (χ^2 = 1), im0 = (ρ.im = 0), one = (χ = 1),
  big = (1 - c₁/log M < ρ.re), exc = IsExc c₁ χ ρ.re, bound = (ρ.re ≤ 1 - c/log(M(|ρ.im|+2))).
-/
namespace NFE4

theorem third_clause (sq1 im0 one big exc bound : Prop)
    (h_one_sq : one → sq1)                       -- 1^2 = 1
    (h_exc   : sq1 → im0 → big → exc)            -- branch 1a (via primitive-zero transfer)
    (h_small : sq1 → im0 → ¬ big → bound)        -- branch 1b (c ≤ c₁, log M ≤ log 2M)
    (h_P     : one → ¬ im0 → bound)              -- principal zero-free region (c ≤ cp)
    (h_Z     : ¬ one → (¬ sq1 ∨ ¬ im0) → bound)  -- non-principal zero-free region (c ≤ cz)
    : (im0 ∧ exc) ∨ bound := by
  by_cases hr : sq1 ∧ im0
  · by_cases hb : big
    · exact Or.inl ⟨hr.2, h_exc hr.1 hr.2 hb⟩
    · exact Or.inr (h_small hr.1 hr.2 hb)
  · apply Or.inr
    have hne : sq1 → ¬ im0 := fun h h' => hr ⟨h, h'⟩
    by_cases ho : one
    · exact h_P ho (hne (h_one_sq ho))
    · by_cases hs : sq1
      · exact h_Z ho (Or.inr (hne hs))
      · exact h_Z ho (Or.inl hs)

/-- First clause shape: exceptional zeros are unique because each lies in the Landau–Page window
    (input U) once the constant is shrunk (c₁ ≤ cu/2). -/
theorem first_clause {Ch : Type} (Exc Win : Ch → Prop) (eq : Ch → Ch → Prop)
    (h_win : ∀ x, Exc x → Win x) (hU : ∀ x y, Win x → Win y → eq x y) :
    ∀ x y, Exc x → Exc y → eq x y :=
  fun x y hx hy => hU x y (h_win x hx) (h_win y hy)

#print axioms third_clause
#print axioms first_clause
end NFE4
