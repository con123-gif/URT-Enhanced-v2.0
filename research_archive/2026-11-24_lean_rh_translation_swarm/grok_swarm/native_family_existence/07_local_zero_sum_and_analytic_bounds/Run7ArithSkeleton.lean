/-! Core-Lean (no Mathlib) skeleton of the integer arithmetic used in run 7.
    Checks only Nat/Int arithmetic; analytic content is NOT represented here. -/
-- LOneLower.inv_le_norm_LFunction_one with M = 6q: M/3 - q = q, M^2 = 36 q^2
theorem lone_M (q : Nat) : 6 * q / 3 - q = q := by omega
theorem lone_M2 (q : Nat) : (6 * q) * (6 * q) = 36 * (q * q) := by
  simp only [Nat.mul_assoc, Nat.mul_left_comm q 6 q]
  rw [← Nat.mul_assoc]
-- final step: (M/3 - q) * 36 q^2-normalisation  =>  q / (36 q^2) = 1/(36 q) (cross-multiplied)
theorem lone_final (q : Nat) : q * (36 * q) = 1 * (36 * (q * q)) := by
  rw [Nat.one_mul, Nat.mul_left_comm]
-- DirichletDeriv: 84 * 4 = 336; tail 2*(1+40) = 82; 83 + L ≤ 84 L for L ≥ 1 (integers)
theorem db_consts : 84 * 4 = 336 ∧ 2 * (1 + 40) = 82 := by decide
theorem db_absorb (L : Nat) (h : 1 ≤ L) : 83 + L ≤ 84 * L := by omega
-- Cauchy radius on 100ths: 1 - 5/(4L) ≥ 1/20 at L = 1.38  <=>  20*(4*138 - 500) ≥ 4*138
theorem db_re : 20 * (4 * 138 - 5 * 100) ≥ 4 * 138 := by decide
-- LogDerivZeros: 1 + L + N c2 ≤ (1 + c2/c1)(1 + L) given N c1 ≤ L (scaled by c1 > 0, all Nat)
theorem ldz_K (c1 c2 L N : Nat) (h : N * c1 ≤ L) :
    c1 * (1 + L) + N * c1 * c2 ≤ (c1 + c2) * (1 + L) := by
  have : N * c1 * c2 ≤ L * c2 := Nat.mul_le_mul_right c2 h
  have e : (c1 + c2) * (1 + L) = c1 * (1 + L) + c2 + L * c2 := by
    rw [Nat.add_mul, Nat.mul_add c2, Nat.mul_one, Nat.mul_comm c2 L]; omega
  omega
