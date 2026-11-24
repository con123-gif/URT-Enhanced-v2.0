/-
  LayOfCoreMechanismAbstract.lean  (core Lean 4 only; no Mathlib; no upstream imports)

  Abstract arithmetic core of `GlobalTheory.EX.DC.TameGen.tameDistinct_gen`
  (upstream pin 40e56ba, PowEqOfPartEq.lean:84), which is the only non-bookkeeping
  mathematical input of `GlobalTheory.Mem.Top.LayOfCore.lay_of_core` (via TamePow.tame_of_pow).
  Checks only the integer/divisibility skeleton, not the upstream statement.
-/
namespace NFE3

/-- Distinctness: exponents 2e, 2e' with |e|,|e'| ≤ m, e ≠ e', cannot agree modulo n when 4m < n.
    Upstream: `dvd_of_pow_eq` + first clause of `tameDistinct_gen` (with n = g - 1 = orderOf w). -/
theorem exps_distinct (m n : Nat) (e e' : Int)
    (he : -(m:Int) ≤ e ∧ e ≤ m) (he' : -(m:Int) ≤ e' ∧ e' ≤ m) (hne : e ≠ e')
    (hn : 4 * m < n) : ¬ ((n:Int) ∣ (2*e' - 2*e)) := by
  intro ⟨k, hk⟩
  have hd : (2*e' - 2*e) ≠ 0 := by omega
  have hk0 : k ≠ 0 := by intro h; subst h; simp at hk; omega
  rcases Int.lt_or_gt_of_ne hk0 with h | h
  · have : (n:Int) * k ≤ -(n:Int) := by
      have : k ≤ -1 := by omega
      have := Int.mul_le_mul_of_nonneg_left this (Int.natCast_nonneg n)
      simpa using this
    omega
  · have : (n:Int) ≤ (n:Int) * k := by
      have : 1 ≤ k := by omega
      have := Int.mul_le_mul_of_nonneg_left this (Int.natCast_nonneg n)
      simpa using this
    omega

/-- Prime-to-ℓ step: if (g-1) = ℓ^v * M with M coprime to ℓ, and M ∣ D * ℓ^a,
    then M ∣ D; hence g - 1 ≤ D * ℓ^v. Upstream: second clause of `tameDistinct_gen`. -/
theorem prime_to_part_bound (ℓ v M D a : Nat) (hcop : Nat.Coprime M (ℓ ^ a))
    (hdvd : M ∣ D * ℓ ^ a) (hD : 0 < D) : ℓ ^ v * M ≤ ℓ ^ v * D := by
  have h1 : M ∣ D := Nat.Coprime.dvd_of_dvd_mul_right hcop hdvd
  exact Nat.mul_le_mul_left _ (Nat.le_of_dvd hD h1)

#print axioms exps_distinct
#print axioms prime_to_part_bound

end NFE3
