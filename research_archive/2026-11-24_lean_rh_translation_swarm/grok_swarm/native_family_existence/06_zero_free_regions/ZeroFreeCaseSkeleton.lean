/-
  ZeroFreeCaseSkeleton.lean  (core Lean 4 only; no Mathlib; no upstream imports)
  Case structure of three upstream arguments at pin 40e56ba (abstract Props only; NOT proofs):
  * GlobalTheory.ZeroFreeComplex.inv_le_log / zero_free_region (LFunctionConjEqZero.lean:173, :290)  T-1c
  * GlobalTheory.ZeroFreePrincipal.zero_free (ZeroFreePrincipal.lean:281)                           T-1b
  * GlobalTheory.Lin.zeros_eq_zeros_primitiveCharacter (DirichletLZerosEqPrimitiveCharacterZeros.lean) T-1e
-/
namespace NFE6

/-- T-1c `inv_le_log`: the bound 1/δ ≤ K L in three branches. -/
theorem inv_le_log_shape (sq1 small bound : Prop)
    (h_nonreal : ¬ sq1 → bound)            -- χ² ≠ 1 : 3-4-1, χ² nonprincipal, S = ∅
    (h_small   : sq1 → small → bound)      -- χ² = 1, 2γ² ≤ 81δ² : ρ and conj ρ, 2-term positivity
    (h_large   : sq1 → ¬ small → bound)    -- χ² = 1, 2γ² > 81δ² : 3-4-1, χ² = principal pole term
    : bound := by
  by_cases h : sq1
  · by_cases hs : small
    · exact h_small h hs
    · exact h_large h hs
  · exact h_nonreal h

/-- T-1c `zero_free_region`: near (δ ≤ 1/21, use inv_le_log) or far (δ > 1/21 ≥ c/L). -/
theorem zero_free_region_shape (near goal : Prop)
    (h_near : near → goal) (h_far : ¬ near → goal) : goal := by
  by_cases h : near
  · exact h_near h
  · exact h_far h

/-- T-1b `zero_free`: Euler factor zero (Re s = 0) / ζ zero with |γ| ≥ 1 / ζ zero with |γ| < 1. -/
theorem principal_shape (euler zeta tall goal : Prop)
    (h_split : euler ∨ zeta)                 -- L(1_q,s) = ∏(1 - p^{-s}) ζ(s), s ≠ 1
    (h_euler : euler → goal)                 -- |p^{-s}| = 1 ⇒ Re s = 0 < 1 - c/L
    (h_tall  : zeta → tall → goal)           -- de la Vallée-Poussin region for ζ
    (h_short : zeta → ¬ tall → goal)         -- compactness: ζ ≠ 0 near the segment 1 + i[-1,1]
    : goal := by
  cases h_split with
  | inl he => exact h_euler he
  | inr hz =>
    by_cases ht : tall
    · exact h_tall hz ht
    · exact h_short hz ht

/-- T-1e: a local factorisation with a nonvanishing analytic factor transfers zeros and orders.
    Modelled on ℕ-valued orders: ord(f·E) = ord f + ord E and ord E = 0. -/
theorem order_transfer (ordL ordP ordE : Nat) (hmul : ordL = ordP + ordE) (hE : ordE = 0) :
    ordL = ordP ∧ (ordL = 0 ↔ ordP = 0) := by
  subst hE; simp at hmul; subst hmul; exact ⟨rfl, Iff.rfl⟩

#print axioms inv_le_log_shape
#print axioms zero_free_region_shape
#print axioms principal_shape
#print axioms order_transfer
end NFE6
