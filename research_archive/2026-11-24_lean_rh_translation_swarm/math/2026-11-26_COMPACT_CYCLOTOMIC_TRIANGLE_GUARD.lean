import New.Selmer.DenominatorBound
import New.Selmer.FitTwistsExist

/-!
Interface certificate for `2026-11-26_COMPACT_CYCLOTOMIC_TRIANGLE_GUARD.md`.
Compact source pin: 72fead102f663d5c7a407964a13dc0cf9d977207.
No `Main` or RH theorem is imported.
-/

namespace CompactCyclotomicTriangleAudit

/-- The scalar substitution made after `h ≤ v_ell(M_K)`. -/
theorem triangle_cost_mono (y h H : ℕ) (hh : h ≤ H) :
    y * h ≤ y * H ∧ y ^ 22 * h ≤ y ^ 22 * H := by
  exact ⟨Nat.mul_le_mul_left y hh, Nat.mul_le_mul_left (y ^ 22) hh⟩

/-- Exact geometric factor behind every `g^a-1` divisibility occurrence. -/
theorem pow_sub_one_dvd_pow_mul_sub_one (g a k : ℕ) :
    g ^ a - 1 ∣ g ^ (a * k) - 1 := by
  simpa [pow_mul] using sub_dvd_pow_sub_pow (g ^ a) 1 k

#check Data.chosenGroupOrder
#check g_pow_sub_one_dvd_chosenGroupOrder
#check exists_cycChar_pow_sub_one_dvd
#check exists_isPrimeTriangle
#check ribet_columns
#check BaseLevel.exists_diagOp_mem_ellIntegralForms
#check norm_gram_det_le_of_operators
#check denominatorLe_rowBudget
#check exists_isFitFamily

#print axioms triangle_cost_mono
#print axioms pow_sub_one_dvd_pow_mul_sub_one
#print axioms exists_cycChar_pow_sub_one_dvd
#print axioms denominatorLe_rowBudget

end CompactCyclotomicTriangleAudit
