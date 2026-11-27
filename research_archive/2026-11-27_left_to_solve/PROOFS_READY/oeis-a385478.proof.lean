import OMAStatements.S_oeis_a385478

/-!
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
Model: GPT-6 (exact serving variant not exposed by this runtime).
Disproof of Felix Huber's A385478 conjecture at n = 1787.
All finite arithmetic is checked by the Lean kernel, without native_decide.
-/

namespace A385478Certificate

open OMA.S_oeis_a385478

/-- The usual prime-factor product formula speeds up exact kernel evaluation. -/
def sigmaFast (n : ℕ) : ℕ :=
  ∏ p ∈ n.primeFactors,
    ∑ i ∈ Finset.range (n.primeFactorsList.count p + 1), p ^ i

theorem sigmaFast_eq {n : ℕ} (hn : n ≠ 0) : sigmaFast n = sigma n := by
  simpa only [sigmaFast, Nat.primeFactorsList_count_eq, Nat.mul_one,
    ArithmeticFunction.sigma_one_apply, sigma] using
    (ArithmeticFunction.sigma_eq_prod_primeFactors_sum_range_factorization_pow_mul
      (k := 1) hn).symm

set_option maxRecDepth 1000000 in
set_option maxHeartbeats 0 in
theorem prior_149_fast :
    ∀ k ∈ Finset.Ico 1 1787, 149 ∣ sigmaFast k → k = 1489 := by
  decide +kernel

theorem prior_149 :
    ∀ k ∈ Finset.Ico 1 1787, 149 ∣ sigma k → k = 1489 := by
  intro k hk hd
  apply prior_149_fast k hk
  rw [sigmaFast_eq (by have := (Finset.mem_Ico.mp hk).1; omega)]
  exact hd

theorem sigma_1787 : sigma 1787 = 1788 := by
  rw [← sigmaFast_eq (by decide : 1787 ≠ 0)]
  decide +kernel

theorem sigma_1489 : sigma 1489 = 1490 := by
  rw [← sigmaFast_eq (by decide : 1489 ≠ 0)]
  decide +kernel

theorem mem_freshDivisors {n d : ℕ} :
    d ∈ freshDivisors n ↔ d ∈ (sigma n).divisors ∧
      ∀ k ∈ Finset.Ico 1 n, ¬ d ∣ sigma k := by
  classical
  simp only [freshDivisors, Finset.mem_filter]

theorem fresh_of_149 {d : ℕ} (hd : d ∣ 1788) (hp : 149 ∣ d)
    (hold : ¬ d ∣ 1490) : d ∈ freshDivisors 1787 := by
  classical
  apply mem_freshDivisors.mpr
  constructor
  · rw [sigma_1787, Nat.mem_divisors]
    exact ⟨hd, by decide⟩
  · intro k hk hkdiv
    have hkeq : k = 1489 := prior_149 k hk (dvd_trans hp hkdiv)
    subst k
    rw [sigma_1489] at hkdiv
    exact hold hkdiv

theorem term_mem {n : ℕ} (hne : (freshDivisors n).Nonempty) :
    term n ∈ freshDivisors n := by
  classical
  simpa only [term, dif_pos hne] using (freshDivisors n).min'_mem hne

end A385478Certificate

open OMA.S_oeis_a385478 A385478Certificate in
theorem OMA.disproof : ¬ (type_of% @OMA.S_oeis_a385478.main) := by
  classical
  intro h
  have h447 : 447 ∈ freshDivisors 1787 :=
    fresh_of_149 (by norm_num) (by norm_num) (by norm_num)
  have h596 : 596 ∈ freshDivisors 1787 :=
    fresh_of_149 (by norm_num) (by norm_num) (by norm_num)
  have ht : term 1787 ∈ freshDivisors 1787 := term_mem ⟨447, h447⟩
  have hcommon : term 1787 ∣ Nat.gcd 447 596 :=
    Nat.dvd_gcd (h 1787 (by norm_num) 447 h447) (h 1787 (by norm_num) 596 h596)
  have h149 : term 1787 ∣ 149 := by norm_num at hcommon; exact hcommon
  have hearlier : term 1787 ∣ sigma 1489 := by
    rw [sigma_1489]
    exact dvd_trans h149 (by norm_num)
  exact (mem_freshDivisors.mp ht).2 1489 (by norm_num) hearlier
