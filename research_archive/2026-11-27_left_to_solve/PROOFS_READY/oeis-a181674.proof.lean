import OMAStatements.S_oeis_a181674

/-!
Complete disproof of OEIS A181674's conjectured Theta(log log n) average order.
The exact sorted-pair source count has a summatory upper bound O(N).
All Chebyshev estimates and Abel summation used here are classical results.
No PNT, Landau or Mertens estimate is assumed as an unproved hypothesis.

Research credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed). Supporting prime-reciprocal and
semiprime modules were developed with the collaborating runtime agent.
No historical priority or new analytic method is claimed.
-/

open scoped BigOperators
open OMA.S_oeis_a181674

namespace A181674Certificate

noncomputable def primorialValues (N : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (N + 1)).filter IsPrimorial

noncomputable def semiprimeValues (N : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (N + 1)).filter IsSemiprime

noncomputable def primorialCount (N : ℕ) : ℕ := (primorialValues N).card
noncomputable def semiprimeCount (N : ℕ) : ℕ := (semiprimeValues N).card

theorem summatory_le_product (N : ℕ) :
    summatory N ≤ 2 * primorialCount N * semiprimeCount N := by
  classical
  have hs : (((Finset.range (N + 1)).product (Finset.range (N + 1))).filter
      fun z => z.1 ≤ z.2 ∧ z.1 + z.2 ≤ N ∧
        ((IsPrimorial z.1 ∧ IsSemiprime z.2) ∨
          (IsSemiprime z.1 ∧ IsPrimorial z.2))) ⊆
      (primorialValues N).product (semiprimeValues N) ∪
        (semiprimeValues N).product (primorialValues N) := by
    intro z hz
    obtain ⟨hzrange, _, _, hrole⟩ := Finset.mem_filter.mp hz
    obtain ⟨ha, hb⟩ := Finset.mem_product.mp hzrange
    rcases hrole with h | h
    · exact Finset.mem_union_left _ (Finset.mem_product.mpr
        ⟨Finset.mem_filter.mpr ⟨ha, h.1⟩, Finset.mem_filter.mpr ⟨hb, h.2⟩⟩)
    · exact Finset.mem_union_right _ (Finset.mem_product.mpr
        ⟨Finset.mem_filter.mpr ⟨ha, h.1⟩, Finset.mem_filter.mpr ⟨hb, h.2⟩⟩)
  calc
    summatory N ≤ ((primorialValues N).product (semiprimeValues N) ∪
        (semiprimeValues N).product (primorialValues N)).card :=
      Finset.card_le_card hs
    _ ≤ ((primorialValues N).product (semiprimeValues N)).card +
        ((semiprimeValues N).product (primorialValues N)).card := Finset.card_union_le _ _
    _ = 2 * primorialCount N * semiprimeCount N := by
      change (primorialValues N ×ˢ semiprimeValues N).card +
        (semiprimeValues N ×ˢ primorialValues N).card =
          2 * primorialCount N * semiprimeCount N
      have h₁ := Finset.card_product (primorialValues N) (semiprimeValues N)
      have h₂ := Finset.card_product (semiprimeValues N) (primorialValues N)
      rw [h₁, h₂]
      dsimp [primorialCount, semiprimeCount]
      ring

theorem semiprimeCount_le_prime_sum (N : ℕ) :
    semiprimeCount N ≤
      ∑ p ∈ Nat.primesLE (Nat.sqrt N), Nat.primeCounting (N / p) := by
  classical
  let U := (Nat.primesLE (Nat.sqrt N)).biUnion fun p =>
    (Nat.primesLE (N / p)).image fun q => p * q
  have hcover : ∀ p q : ℕ, p.Prime → q.Prime → p ≤ q → p * q ≤ N → p * q ∈ U := by
    intro p q hp hq hpq hpqN
    have hpsq : p * p ≤ N := (Nat.mul_le_mul_left p hpq).trans hpqN
    have hpS : p ∈ Nat.primesLE (Nat.sqrt N) :=
      Nat.mem_primesLE.mpr ⟨Nat.le_sqrt.mpr hpsq, hp⟩
    have hqle : q ≤ N / p := (Nat.le_div_iff_mul_le hp.pos).mpr
      (by simpa only [mul_comm] using hpqN)
    have hqS : q ∈ Nat.primesLE (N / p) := Nat.mem_primesLE.mpr ⟨hqle, hq⟩
    exact Finset.mem_biUnion.mpr ⟨p, hpS, Finset.mem_image.mpr ⟨q, hqS, rfl⟩⟩
  have hs : semiprimeValues N ⊆ U := by
    intro n hn
    obtain ⟨hnN, p, q, hp, hq, heq⟩ := Finset.mem_filter.mp hn
    have hnle : n ≤ N := Nat.le_of_lt_succ (Finset.mem_range.mp hnN)
    rcases le_total p q with hpq | hqp
    · rw [heq]
      exact hcover p q hp hq hpq (heq ▸ hnle)
    · have heq' : n = q * p := heq.trans (mul_comm _ _)
      rw [heq']
      exact hcover q p hq hp hqp (heq' ▸ hnle)
  calc
    semiprimeCount N ≤ U.card := Finset.card_le_card hs
    _ ≤ ∑ p ∈ Nat.primesLE (Nat.sqrt N),
        ((Nat.primesLE (N / p)).image fun q => p * q).card := Finset.card_biUnion_le
    _ ≤ ∑ p ∈ Nat.primesLE (Nat.sqrt N), (Nat.primesLE (N / p)).card :=
      Finset.sum_le_sum fun _ _ => Finset.card_image_le
    _ = ∑ p ∈ Nat.primesLE (Nat.sqrt N), Nat.primeCounting (N / p) := by simp

theorem exists_theta_linear_lower :
    ∃ B : ℝ, 0 ≤ B ∧ ∀ n : ℕ, (n : ℝ) / 4 ≤ Chebyshev.theta n + B := by
  obtain ⟨C, hC⟩ := Chebyshev.psi_sub_theta_le_mul_sqrt
  let D : ℝ := C + 2
  let B : ℝ := D ^ 2 + 2
  refine ⟨B, by dsimp [B]; positivity, ?_⟩
  intro n
  have hn0 : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hsqrt : Real.sqrt ((n : ℝ) + 1) ≤ Real.sqrt n + 1 := by
    refine Real.sqrt_le_iff.mpr ⟨by positivity, ?_⟩
    nlinarith [Real.sq_sqrt hn0, Real.sqrt_nonneg (n : ℝ)]
  have hlog0 := Real.log_le_rpow_div
    (show (0 : ℝ) ≤ (n : ℝ) + 1 by positivity) (show (0 : ℝ) < 1 / 2 by norm_num)
  have hlog : Real.log ((n : ℝ) + 1) ≤ 2 * Real.sqrt n + 2 := by
    rw [← Real.sqrt_eq_rpow] at hlog0
    nlinarith
  have hpsi := Chebyshev.psi_ge n
  have htheta := hC (n : ℝ)
  have hsq := sq_nonneg (Real.sqrt (n : ℝ) / 2 - D)
  have hsqrt_sq := Real.sq_sqrt hn0
  have hlog2 : (1 : ℝ) / 2 ≤ Real.log 2 := by
    linarith [Real.log_two_gt_d9]
  have hlog2mul := mul_le_mul_of_nonneg_left hlog2 hn0
  dsimp [B, D] at *
  push_cast at hpsi
  nlinarith

theorem primorial_prime_endpoint {m : ℕ} (hm : IsPrimorial m) :
    m = 1 ∨ ∃ p : ℕ, p.Prime ∧ m = primorial p := by
  classical
  obtain ⟨t, rfl⟩ := hm
  by_cases ht : t < 2
  · left
    interval_cases t <;> norm_num
  · have ht2 : 2 ≤ t := by omega
    have hne : (Nat.primesLE t).Nonempty :=
      ⟨2, Nat.mem_primesLE.mpr ⟨ht2, Nat.prime_two⟩⟩
    let p : ℕ := (Nat.primesLE t).max' hne
    have hpS : p ∈ Nat.primesLE t := Finset.max'_mem _ _
    have hp : p.Prime := (Nat.mem_primesLE.mp hpS).2
    have hpt : p ≤ t := (Nat.mem_primesLE.mp hpS).1
    have hsets : Nat.primesLE p = Nat.primesLE t := by
      ext q
      constructor
      · intro hq
        obtain ⟨hqp, hqpr⟩ := Nat.mem_primesLE.mp hq
        exact Nat.mem_primesLE.mpr ⟨hqp.trans hpt, hqpr⟩
      · intro hq
        exact Nat.mem_primesLE.mpr
          ⟨Finset.le_max' _ _ hq, (Nat.mem_primesLE.mp hq).2⟩
    right
    refine ⟨p, hp, ?_⟩
    simp only [primorial_eq_prod_primesLE, hsets]

theorem primorialCount_le_pi {B : ℝ} (hB : 0 ≤ B)
    (htheta : ∀ n : ℕ, (n : ℝ) / 4 ≤ Chebyshev.theta n + B)
    {N : ℕ} (hN : 1 ≤ N) :
    primorialCount N ≤ Nat.primeCounting ⌊4 * Real.log N + 4 * B⌋₊ + 1 := by
  classical
  let M : ℝ := 4 * Real.log N + 4 * B
  have hs : primorialValues N ⊆
      (Nat.primesLE ⌊M⌋₊).image primorial ∪ {1} := by
    intro m hm
    obtain ⟨hmN, hmp⟩ := Finset.mem_filter.mp hm
    have hmle : m ≤ N := Nat.le_of_lt_succ (Finset.mem_range.mp hmN)
    rcases primorial_prime_endpoint hmp with hm1 | ⟨p, hp, hmeq⟩
    · exact Finset.mem_union_right _ (by simpa only [Finset.mem_singleton] using hm1)
    · have hpn : primorial p ≤ N := hmeq ▸ hmle
      have hlog : Real.log (primorial p) ≤ Real.log N :=
        Real.log_le_log (by exact_mod_cast primorial_pos p) (by exact_mod_cast hpn)
      have ht := htheta p
      have hthetaeq : Chebyshev.theta (p : ℝ) = Real.log (primorial p) := by
        simpa using Chebyshev.theta_eq_log_primorial (p : ℝ)
      rw [hthetaeq] at ht
      have hpM : (p : ℝ) ≤ M := by dsimp [M]; linarith
      have hpFloor : p ≤ ⌊M⌋₊ := Nat.le_floor hpM
      exact Finset.mem_union_left _ (Finset.mem_image.mpr
        ⟨p, Nat.mem_primesLE.mpr ⟨hpFloor, hp⟩, hmeq.symm⟩)
  calc
    primorialCount N ≤ ((Nat.primesLE ⌊M⌋₊).image primorial ∪ {1}).card :=
      Finset.card_le_card hs
    _ ≤ ((Nat.primesLE ⌊M⌋₊).image primorial).card + ({1} : Finset ℕ).card :=
      Finset.card_union_le _ _
    _ ≤ (Nat.primesLE ⌊M⌋₊).card + 1 := by
      simpa using Nat.add_le_add_right
        (Finset.card_image_le (s := Nat.primesLE ⌊M⌋₊) (f := primorial)) 1
    _ = Nat.primeCounting ⌊M⌋₊ + 1 := by simp

theorem exists_primorialCount_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ N : ℕ in Filter.atTop,
      (primorialCount N : ℝ) ≤ C * Real.log N / Real.log (Real.log N) := by
  obtain ⟨B, hB, htheta⟩ := exists_theta_linear_lower
  let b : ℝ := Real.log 4 + 1
  have hb : 0 < b := by
    dsimp [b]
    positivity
  obtain ⟨M, hM⟩ := Filter.eventually_atTop.mp
    (Chebyshev.eventually_primeCounting_le (show (0 : ℝ) < 1 by norm_num))
  have hlogtop : Filter.Tendsto (fun N : ℕ => Real.log N)
      Filter.atTop Filter.atTop :=
    Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  refine ⟨8 * b + 1, by positivity, ?_⟩
  filter_upwards [hlogtop.eventually (Filter.eventually_ge_atTop (max (max B M) 2)),
    Filter.eventually_ge_atTop 1] with N hlog hN
  have hLB : B ≤ Real.log N := le_trans (le_max_left B M) ((le_max_left (max B M) 2).trans hlog)
  have hLM : M ≤ Real.log N := le_trans (le_max_right B M) ((le_max_left (max B M) 2).trans hlog)
  have hL2 : (2 : ℝ) ≤ Real.log N := (le_max_right (max B M) 2).trans hlog
  have hL : 0 < Real.log N := by linarith
  have hLL : 0 < Real.log (Real.log N) := Real.log_pos (by linarith)
  let x : ℝ := 4 * Real.log N + 4 * B
  have hxM : M ≤ x := by dsimp [x]; linarith
  have hxL : Real.log N ≤ x := by dsimp [x]; linarith
  have hx8 : x ≤ 8 * Real.log N := by dsimp [x]; linarith
  have hxpos : 0 < x := hL.trans_le hxL
  have hlogx : Real.log (Real.log N) ≤ Real.log x :=
    Real.log_le_log hL hxL
  have hlogxpos : 0 < Real.log x := hLL.trans_le hlogx
  have hpi : (Nat.primeCounting ⌊x⌋₊ : ℝ) ≤ b * x / Real.log x := by
    simpa only [b] using hM x hxM
  have hK : (primorialCount N : ℝ) ≤ (Nat.primeCounting ⌊x⌋₊ : ℝ) + 1 := by
    exact_mod_cast primorialCount_le_pi hB htheta hN
  have hmain : (primorialCount N : ℝ) ≤ 8 * b * Real.log N / Real.log (Real.log N) + 1 := by
    have hdiv₁ : b * x / Real.log x ≤ b * x / Real.log (Real.log N) :=
      div_le_div_of_nonneg_left (mul_nonneg hb.le hxpos.le) hLL hlogx
    have hnum : b * x ≤ 8 * b * Real.log N := by
      nlinarith [mul_le_mul_of_nonneg_left hx8 hb.le]
    have hdiv₂ : b * x / Real.log (Real.log N) ≤
        8 * b * Real.log N / Real.log (Real.log N) :=
      div_le_div_of_nonneg_right hnum hLL.le
    linarith
  have hLLL : Real.log (Real.log N) ≤ Real.log N := by
    linarith [Real.log_le_sub_one_of_pos hL]
  have hone : (1 : ℝ) ≤ Real.log N / Real.log (Real.log N) :=
    (le_div_iff₀ hLL).mpr (by simpa using hLLL)
  calc
    (primorialCount N : ℝ) ≤ 8 * b * Real.log N / Real.log (Real.log N) + 1 := hmain
    _ ≤ 8 * b * Real.log N / Real.log (Real.log N) +
        Real.log N / Real.log (Real.log N) := by linarith
    _ = (8 * b + 1) * Real.log N / Real.log (Real.log N) := by ring

end A181674Certificate


/-
Classical prime-harmonic upper bound from Chebyshev and Abel summation.
This is supporting analysis for A181674, not a solution of that problem.
Mathlib supplies the named classical results; no Mertens estimate is assumed.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
Complete helper candidate, awaiting pinned kernel verification.
-/

open Filter Topology MeasureTheory Finset
open scoped BigOperators

namespace A181674Certificate

noncomputable def primeCoeff (n : ℕ) : ℝ := if n.Prime then 1 else 0

noncomputable def primeRecip (n : ℕ) : ℝ := ∑ p ∈ n.primesLE, (p : ℝ)⁻¹

noncomputable def primeCount (x : ℝ) : ℝ := Nat.primeCounting ⌊x⌋₊

theorem sum_primeCoeff (x : ℝ) :
    ∑ k ∈ Icc 0 ⌊x⌋₊, primeCoeff k = primeCount x := by
  unfold primeCount
  rw [← Nat.primesLE_card_eq_primeCounting, card_eq_sum_ones]
  push_cast
  rw [Nat.primesLE_eq_filter_Icc_zero, sum_filter]
  rfl

theorem sum_inv_primeCoeff (n : ℕ) :
    ∑ k ∈ Icc 0 n, (k : ℝ)⁻¹ * primeCoeff k = primeRecip n := by
  rw [primeRecip, Nat.primesLE_eq_filter_Icc_zero, sum_filter]
  apply sum_congr rfl
  intro k hk
  by_cases hp : k.Prime <;> simp [primeCoeff, hp]

theorem primeCount_div_sq_intervalIntegrable (a b : ℝ) (ha : 0 < a) (hab : a ≤ b) :
    IntervalIntegrable (fun t ↦ primeCount t / t ^ 2) volume a b := by
  have hi : IntegrableOn (fun t : ℝ ↦ (t ^ 2)⁻¹) (Set.Icc a b) := by
    apply ContinuousOn.integrableOn_Icc
    intro t ht
    have ht0 : t ≠ 0 := by linarith [ht.1]
    have htsq : t ^ 2 ≠ 0 := pow_ne_zero 2 ht0
    exact ContinuousAt.continuousWithinAt (by fun_prop (disch := assumption))
  have his := integrableOn_mul_sum_Icc (c := primeCoeff) (m := 0) ha.le hi
  rw [intervalIntegrable_iff_integrableOn_Icc_of_le hab]
  simpa only [sum_primeCoeff, div_eq_mul_inv, mul_comm] using his

theorem primeRecip_abel {x : ℝ} (hx : 2 ≤ x) :
    primeRecip ⌊x⌋₊ = primeCount x / x + ∫ t in 2..x, primeCount t / t ^ 2 := by
  have hd : ∀ t ∈ Set.Icc (2 : ℝ) x,
      DifferentiableAt ℝ (fun u : ℝ ↦ u⁻¹) t := by
    intro t ht
    exact (hasDerivAt_inv (by linarith [ht.1] : t ≠ 0)).differentiableAt
  have hi : IntegrableOn (deriv (fun u : ℝ ↦ u⁻¹)) (Set.Icc (2 : ℝ) x) := by
    apply ContinuousOn.integrableOn_Icc
    intro t ht
    have ht0 : t ≠ 0 := by linarith [ht.1]
    have htsq : t ^ 2 ≠ 0 := pow_ne_zero 2 ht0
    simp only [deriv_inv']
    exact ContinuousAt.continuousWithinAt (by fun_prop (disch := assumption))
  have h := sum_mul_eq_sub_integral_mul₁ primeCoeff
    (f := fun u : ℝ ↦ u⁻¹) (by norm_num [primeCoeff]) (by norm_num [primeCoeff]) x hd hi
  simp_rw [sum_primeCoeff] at h
  rw [sum_inv_primeCoeff] at h
  rw [← intervalIntegral.integral_of_le hx] at h
  have hg : (fun t : ℝ ↦ deriv (fun u : ℝ ↦ u⁻¹) t * primeCount t) =
      (fun t ↦ -(primeCount t / t ^ 2)) := by
    funext t
    rw [deriv_inv]
    ring
  rw [hg, intervalIntegral.integral_neg] at h
  simpa only [sub_neg_eq_add, div_eq_mul_inv, mul_comm] using h

theorem exists_primeRecip_bound_real :
    ∃ C : ℝ, 0 < C ∧
      ∀ᶠ x : ℝ in atTop, primeRecip ⌊x⌋₊ ≤ C * Real.log (Real.log x) := by
  let B : ℝ := Real.log 4 + 1
  have hB : 0 < B := by
    have hl : 0 < Real.log (4 : ℝ) := Real.log_pos (by norm_num)
    dsimp [B]
    linarith
  obtain ⟨a, ha⟩ := (eventually_atTop.mp
    (Chebyshev.eventually_primeCounting_le (by norm_num : (0 : ℝ) < 1)))
  let A : ℝ := max a 3
  have hA3 : (3 : ℝ) ≤ A := le_max_right _ _
  have hA1 : 1 < A := by linarith
  have hA0 : 0 < A := by linarith
  have hA : ∀ t : ℝ, A ≤ t → primeCount t ≤ B * t / Real.log t := by
    intro t ht
    exact ha t ((le_max_left a 3).trans ht)
  let K : ℝ := ∫ t in 2..A, primeCount t / t ^ 2
  let D : ℝ := B + |K| + B * |Real.log (Real.log A)|
  have hD : 0 ≤ D := by
    dsimp [D]
    positivity
  refine ⟨B + D + 1, by positivity, ?_⟩
  have hlog : ∀ᶠ x : ℝ in atTop, 1 ≤ Real.log x :=
    Real.tendsto_log_atTop.eventually (eventually_ge_atTop 1)
  have hloglog : ∀ᶠ x : ℝ in atTop, 1 ≤ Real.log (Real.log x) :=
    (Real.tendsto_log_atTop.comp Real.tendsto_log_atTop).eventually
      (eventually_ge_atTop 1)
  filter_upwards [eventually_ge_atTop A, hlog, hloglog] with x hx hxlog hxloglog
  have hx2 : 2 ≤ x := by linarith
  have hx1 : 1 < x := by linarith
  have hx0 : 0 < x := by linarith
  have hxlog0 : 0 < Real.log x := by linarith
  have hb : primeCount x / x ≤ B := by
    calc
      primeCount x / x ≤ (B * x / Real.log x) / x :=
        div_le_div_of_nonneg_right (hA x hx) hx0.le
      _ = B / Real.log x := by
        field_simp [ne_of_gt hx0, ne_of_gt hxlog0] <;> ring
      _ ≤ B := (div_le_iff₀ hxlog0).mpr (by
        simpa only [mul_one] using mul_le_mul_of_nonneg_left hxlog hB.le)
  have hiK : IntervalIntegrable (fun t ↦ primeCount t / t ^ 2) volume 2 A :=
    primeCount_div_sq_intervalIntegrable 2 A (by norm_num) (by linarith)
  have hig : IntervalIntegrable (fun t ↦ primeCount t / t ^ 2) volume A x :=
    primeCount_div_sq_intervalIntegrable A x hA0 hx
  have hif : IntervalIntegrable (fun t ↦ B * (t⁻¹ / Real.log t)) volume A x := by
    rw [intervalIntegrable_iff_integrableOn_Icc_of_le hx]
    apply ContinuousOn.integrableOn_Icc
    intro t ht
    have ht1 : 1 < t := hA1.trans_le ht.1
    have ht0 : t ≠ 0 := by linarith
    have htl : Real.log t ≠ 0 := ne_of_gt (Real.log_pos ht1)
    exact ContinuousAt.continuousWithinAt (by fun_prop)
  have hint : (∫ t in A..x, primeCount t / t ^ 2) ≤
      B * (Real.log (Real.log x) - Real.log (Real.log A)) := by
    calc
      (∫ t in A..x, primeCount t / t ^ 2) ≤ ∫ t in A..x, B * (t⁻¹ / Real.log t) := by
        apply intervalIntegral.integral_mono_on hx hig hif
        intro t ht
        have ht1 : 1 < t := hA1.trans_le ht.1
        have ht0 : 0 < t := by linarith
        have htl : 0 < Real.log t := Real.log_pos ht1
        calc
          primeCount t / t ^ 2 ≤ (B * t / Real.log t) / t ^ 2 :=
            div_le_div_of_nonneg_right (hA t ht.1) (sq_nonneg t)
          _ = B * (t⁻¹ / Real.log t) := by
            field_simp [ne_of_gt ht0, ne_of_gt htl] <;> ring
      _ = B * (Real.log (Real.log x) - Real.log (Real.log A)) := by
        rw [intervalIntegral.integral_const_mul, integral_inv_div_log hA1 hx1]
  have heq : primeRecip ⌊x⌋₊ = primeCount x / x + K + ∫ t in A..x, primeCount t / t ^ 2 := by
    rw [primeRecip_abel hx2,
      ← intervalIntegral.integral_add_adjacent_intervals hiK hig]
    dsimp [K]
    ring
  have hconst : B + K - B * Real.log (Real.log A) ≤ D := by
    have hK := le_abs_self K
    have hL := mul_le_mul_of_nonneg_left
      (neg_le_abs (Real.log (Real.log A))) hB.le
    dsimp [D]
    nlinarith
  have hDL : D ≤ D * Real.log (Real.log x) := by
    simpa only [mul_one] using mul_le_mul_of_nonneg_left hxloglog hD
  calc
    primeRecip ⌊x⌋₊ ≤ B * Real.log (Real.log x) + D := by
      rw [heq]
      nlinarith
    _ ≤ (B + D + 1) * Real.log (Real.log x) := by nlinarith

theorem exists_primeRecip_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ N : ℕ in atTop,
      primeRecip N ≤ C * Real.log (Real.log N) := by
  obtain ⟨C, hC, h⟩ := exists_primeRecip_bound_real
  refine ⟨C, hC, ?_⟩
  have h' := tendsto_natCast_atTop_atTop.eventually h
  filter_upwards [h'] with N hN
  simpa only [Nat.floor_natCast] using hN

end A181674Certificate


/-
Classical semiprime counting upper bound for the A181674 disproof.
Assemble after A181674Counts.lean and the kernel-verified
A181674PrimeHarmonic.lean; this file supplies no new source assumptions.
Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed).
Complete supporting candidate, awaiting pinned verification.
-/

open Filter Topology Finset
open scoped BigOperators

namespace A181674Certificate

theorem primeRecip_mono : Monotone primeRecip := by
  intro m n hmn
  unfold primeRecip
  apply sum_le_sum_of_subset_of_nonneg (Nat.primesLE_mono hmn)
  intro p hp hpn
  exact inv_nonneg.mpr (Nat.cast_nonneg p)

theorem exists_semiprimeCount_bound :
    ∃ D : ℝ, 0 < D ∧ ∀ᶠ N : ℕ in atTop,
      (semiprimeCount N : ℝ) ≤
        D * (N : ℝ) * Real.log (Real.log N) / Real.log N := by
  classical
  obtain ⟨C, hC, hH⟩ := exists_primeRecip_bound
  let B : ℝ := Real.log 4 + 1
  have hB : 0 < B := by
    have hl : 0 < Real.log (4 : ℝ) := Real.log_pos (by norm_num)
    dsimp [B]
    linarith
  obtain ⟨a, ha⟩ := (eventually_atTop.mp
    (Chebyshev.eventually_primeCounting_le (by norm_num : (0 : ℝ) < 1)))
  obtain ⟨T, hT⟩ := exists_nat_ge (max a 2)
  have hTa : a ≤ (T : ℝ) := (le_max_left a 2).trans hT
  have hT2 : (2 : ℝ) ≤ T := (le_max_right a 2).trans hT
  refine ⟨2 * B * C, by positivity, ?_⟩
  filter_upwards [eventually_ge_atTop (T ^ 2), eventually_ge_atTop 2, hH]
    with N hNT hN2 hHN
  have hN0 : (0 : ℝ) < N := by exact_mod_cast (show 0 < N by omega)
  have hN1 : (1 : ℝ) < N := by exact_mod_cast (show 1 < N by omega)
  have hlogN : 0 < Real.log N := Real.log_pos hN1
  have hTsqrt : T ≤ Nat.sqrt N := Nat.le_sqrt'.mpr hNT
  have hterm : ∀ p ∈ Nat.primesLE (Nat.sqrt N),
      (Nat.primeCounting (N / p) : ℝ) ≤
        (2 * B * (N : ℝ) / Real.log N) * (p : ℝ)⁻¹ := by
    intro p hpS
    obtain ⟨hpsqrt, hp⟩ := Nat.mem_primesLE.mp hpS
    have hp0 : (0 : ℝ) < p := by exact_mod_cast hp.pos
    let q : ℝ := (N : ℝ) / p
    have hsprod : Nat.sqrt N * p ≤ N :=
      (Nat.mul_le_mul_left (Nat.sqrt N) hpsqrt).trans (Nat.sqrt_le N)
    have hsprodR : (Nat.sqrt N : ℝ) * (p : ℝ) ≤ N := by exact_mod_cast hsprod
    have hqsqrt : (Nat.sqrt N : ℝ) ≤ q :=
      (le_div_iff₀ hp0).mpr hsprodR
    have hqT : (T : ℝ) ≤ q :=
      (show (T : ℝ) ≤ Nat.sqrt N by exact_mod_cast hTsqrt).trans hqsqrt
    have hqa : a ≤ q := hTa.trans hqT
    have hq2 : (2 : ℝ) ≤ q := hT2.trans hqT
    have hq0 : 0 < q := by linarith
    have hlogq : 0 < Real.log q := Real.log_pos (by linarith)
    have hfloor : ⌊q⌋₊ = N / p := by
      dsimp [q]
      rw [Nat.floor_div_natCast, Nat.floor_natCast]
    have hpi : (Nat.primeCounting (N / p) : ℝ) ≤ B * q / Real.log q := by
      simpa only [hfloor] using ha q hqa
    have hpsq : (p : ℝ) ^ 2 ≤ (N : ℝ) := by
      exact_mod_cast (Nat.le_sqrt'.mp hpsqrt)
    have hlogp : 2 * Real.log (p : ℝ) ≤ Real.log (N : ℝ) := by
      have hh := Real.log_le_log (sq_pos_of_pos hp0) hpsq
      simpa only [Real.log_pow, Nat.cast_ofNat] using hh
    have hlogqeq : Real.log q = Real.log (N : ℝ) - Real.log (p : ℝ) :=
      Real.log_div (ne_of_gt hN0) (ne_of_gt hp0)
    have hden : Real.log (N : ℝ) ≤ 2 * Real.log q := by
      rw [hlogqeq]
      linarith
    calc
      (Nat.primeCounting (N / p) : ℝ) ≤ B * q / Real.log q := hpi
      _ ≤ (2 * B * q) / Real.log N := by
        apply (div_le_div_iff₀ hlogq hlogN).mpr
        have hh := mul_le_mul_of_nonneg_left hden (mul_nonneg hB.le hq0.le)
        nlinarith
      _ = (2 * B * (N : ℝ) / Real.log N) * (p : ℝ)⁻¹ := by
        dsimp [q]
        field_simp [ne_of_gt hp0, ne_of_gt hlogN] <;> ring
  have hfac : 0 ≤ 2 * B * (N : ℝ) / Real.log N := by positivity
  have hcount : (semiprimeCount N : ℝ) ≤
      ∑ p ∈ Nat.primesLE (Nat.sqrt N), (Nat.primeCounting (N / p) : ℝ) := by
    exact_mod_cast semiprimeCount_le_prime_sum N
  calc
    (semiprimeCount N : ℝ) ≤
        ∑ p ∈ Nat.primesLE (Nat.sqrt N), (Nat.primeCounting (N / p) : ℝ) := hcount
    _ ≤ ∑ p ∈ Nat.primesLE (Nat.sqrt N),
        (2 * B * (N : ℝ) / Real.log N) * (p : ℝ)⁻¹ := sum_le_sum hterm
    _ = (2 * B * (N : ℝ) / Real.log N) * primeRecip (Nat.sqrt N) := by
      rw [← mul_sum]
      rfl
    _ ≤ (2 * B * (N : ℝ) / Real.log N) * primeRecip N :=
      mul_le_mul_of_nonneg_left (primeRecip_mono (Nat.sqrt_le_self N)) hfac
    _ ≤ (2 * B * (N : ℝ) / Real.log N) * (C * Real.log (Real.log N)) :=
      mul_le_mul_of_nonneg_left hHN hfac
    _ = (2 * B * C) * (N : ℝ) * Real.log (Real.log N) / Real.log N := by
      ring

end A181674Certificate


/- Assemble after the exact A181674 statement and the verified supporting
count, prime-reciprocal, and semiprime upper-bound modules. -/

open Filter
open OMA.S_oeis_a181674

namespace A181674Certificate

theorem exists_summatory_linear_bound :
    ∃ M : ℝ, 0 < M ∧ ∀ᶠ N : ℕ in atTop,
      (summatory N : ℝ) ≤ M * (N : ℝ) := by
  obtain ⟨C, hC, hK⟩ := exists_primorialCount_bound
  obtain ⟨D, hD, hQ⟩ := exists_semiprimeCount_bound
  have hlogtop : Tendsto (fun N : ℕ => Real.log N) atTop atTop :=
    Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  refine ⟨2 * C * D, by positivity, ?_⟩
  filter_upwards [hK, hQ, hlogtop.eventually (eventually_ge_atTop 2)]
    with N hKN hQN hN
  have hL : 0 < Real.log N := by linarith
  have hLL : 0 < Real.log (Real.log N) := Real.log_pos (by linarith)
  have hs : (summatory N : ℝ) ≤
      2 * (primorialCount N : ℝ) * (semiprimeCount N : ℝ) := by
    exact_mod_cast summatory_le_product N
  calc
    (summatory N : ℝ) ≤
        2 * (primorialCount N : ℝ) * (semiprimeCount N : ℝ) := hs
    _ ≤ 2 * (C * Real.log N / Real.log (Real.log N)) *
        (D * (N : ℝ) * Real.log (Real.log N) / Real.log N) := by
      apply mul_le_mul
        (mul_le_mul_of_nonneg_left hKN (by norm_num : (0 : ℝ) ≤ 2)) hQN
        (Nat.cast_nonneg _) (by positivity)
    _ = (2 * C * D) * (N : ℝ) := by
      field_simp [ne_of_gt hL, ne_of_gt hLL] <;> ring

theorem not_conjecture : ¬ conjecture := by
  intro htheta
  obtain ⟨M, hM, hlinear⟩ := exists_summatory_linear_bound
  obtain ⟨C, hC, hupper⟩ := Asymptotics.isBigO_iff'.mp htheta.isBigO_symm
  have hlogtop : Tendsto (fun N : ℕ => Real.log N) atTop atTop :=
    Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop
  have hloglogtop : Tendsto (fun N : ℕ => Real.log (Real.log N)) atTop atTop :=
    Real.tendsto_log_atTop.comp hlogtop
  have hfalse : ∀ᶠ N : ℕ in atTop, False := by
    filter_upwards [hlinear, hupper,
      hloglogtop.eventually (eventually_gt_atTop (C * M)),
      eventually_ge_atTop 1] with N hlinN hupN hlarge hN
    have hNpos : (0 : ℝ) < N := by exact_mod_cast (show 0 < N by omega)
    have hLLpos : 0 < Real.log (Real.log N) := (by positivity : 0 < C * M).trans hlarge
    have hup : (N : ℝ) * Real.log (Real.log N) ≤ C * (summatory N : ℝ) := by
      simpa only [Real.norm_eq_abs,
        abs_of_nonneg (mul_nonneg hNpos.le hLLpos.le),
        abs_of_nonneg (show (0 : ℝ) ≤ (summatory N : ℝ) from Nat.cast_nonneg _)] using hupN
    have hbound : (N : ℝ) * Real.log (Real.log N) ≤ (N : ℝ) * (C * M) := by
      calc
        (N : ℝ) * Real.log (Real.log N) ≤ C * (summatory N : ℝ) := hup
        _ ≤ C * (M * (N : ℝ)) := mul_le_mul_of_nonneg_left hlinN hC.le
        _ = (N : ℝ) * (C * M) := by ring
    have hsmall : Real.log (Real.log N) ≤ C * M :=
      le_of_mul_le_mul_left hbound hNpos
    exact (not_le_of_gt hlarge) hsmall
  rcases hfalse.exists with ⟨N, hN⟩
  exact hN

end A181674Certificate

theorem OMA.disproof : ¬ (type_of% @OMA.S_oeis_a181674.main) :=
  A181674Certificate.not_conjecture
