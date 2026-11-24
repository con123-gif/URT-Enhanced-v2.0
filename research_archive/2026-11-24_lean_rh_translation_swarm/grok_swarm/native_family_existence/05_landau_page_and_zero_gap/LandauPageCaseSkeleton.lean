/-
  LandauPageCaseSkeleton.lean  (core Lean 4 only; no Mathlib; no upstream imports)
  Propositional / arithmetic skeleton of two upstream arguments at pin 40e56ba:
  * GlobalTheory.RealZeroNearOne.main   (OrderNeTop.lean:89)      -- T-1a
  * GlobalTheory.ZeroGapNearOne.exists_gap (ExistsDirichletLFunctionZeroGapNearOne.lean:69) -- T-1d
  Abstract Props only; this does NOT prove either theorem.
-/
namespace NFE5

/-- T-1a case structure: if the conclusion fails, every branch yields the inequality hX
    (1/(σ-β) + 1/(σ-β') ≤ L/ε + K L); hX contradicts the window estimate. -/
theorem landau_page_shape (same eqβ derivNe hX : Prop)
    (h_diff  : ¬ same → hX)                         -- χ ≠ ψ : χψ ≠ 1, four-term positivity
    (h_pair  : same → ¬ eqβ → hX)                   -- χ = ψ, β ≠ β' : T = {β, β'}
    (h_double: same → eqβ → ¬ derivNe → hX)         -- χ = ψ, β = β', L'(β) = 0 : ord ≥ 2
    (h_contra: ¬ hX)                                -- 16/9 ≤ 1 + Kε ≤ 5/4 is false
    : same ∧ eqβ ∧ derivNe := by
  apply Classical.byContradiction
  intro hne
  apply h_contra
  by_cases hs : same
  · by_cases he : eqβ
    · exact h_double hs he (fun hd => hne ⟨hs, he, hd⟩)
    · exact h_pair hs he
  · exact h_diff hs

/-- The numerical contradiction 16/9 > 5/4, cleared of denominators. -/
theorem sixteen_ninths_gt_five_quarters : 9 * 5 < 4 * 16 := by decide

/-- T-1d case structure: principal / complex-or-nonquadratic / real quadratic (near or far). -/
theorem zero_gap_shape (one sq1 im0 far gap : Prop)
    (h_P    : one → gap)                      -- principal: zero-free region (c ≤ e)
    (h_Z    : ¬ one → (¬ sq1 ∨ ¬ im0) → gap)  -- zero-free region (c ≤ d)
    (h_far  : ¬ one → sq1 → im0 → far → gap)  -- 1/log 3q ≤ 1-β : weaken (c ≤ 1)
    (h_near : ¬ one → sq1 → im0 → ¬ far → gap) -- mean value + L(1) lower bound (c ≤ a/4C)
    : gap := by
  by_cases ho : one
  · exact h_P ho
  · by_cases h2 : ¬ sq1 ∨ ¬ im0
    · exact h_Z ho h2
    · have hs : sq1 := Classical.byContradiction fun h => h2 (Or.inl h)
      have hi : im0 := Classical.byContradiction fun h => h2 (Or.inr h)
      by_cases hf : far
      · exact h_far ho hs hi hf
      · exact h_near ho hs hi hf

#print axioms landau_page_shape
#print axioms sixteen_ninths_gt_five_quarters
#print axioms zero_gap_shape
end NFE5
