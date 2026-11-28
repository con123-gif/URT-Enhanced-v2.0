import Mathlib

/-!
# Scalar certificate for the weighted dyadic count equation

28 November 2026. PREPARED, not compiled. This certifies the factor-two
transport in equation (3) of the accompanying math note. The actual
`CountEscape`/prime-finset bridge remains pending on the repaired compact
RUN82/RUN98 stack. It does not prove the weighted arithmetic premise or RH.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Filter

namespace RHMathDyadicWeightedCount

/-- A sequence is unbounded arbitrarily far out. -/
def Escapes (u : ℕ → ℝ) : Prop :=
  ∀ C : ℝ, ∀ K : ℕ, ∃ k : ℕ, K ≤ k ∧ C < u k

/-- Multiplication by pointwise constants between `1/2` and `2` does not
change escape. This is the exact scalar content after cancelling
`k * log 2` in the dyadic prime-weight sandwich. -/
theorem escapes_iff_of_factor_two {u v : ℕ → ℝ}
    (hlo : ∀ k, u k / 2 ≤ v k)
    (hhi : ∀ k, v k ≤ 2 * u k) :
    Escapes u ↔ Escapes v := by
  constructor
  · intro hu C K
    obtain ⟨k, hk, hlarge⟩ := hu (2 * C) K
    refine ⟨k, hk, ?_⟩
    have h := hlo k
    linarith
  · intro hv C K
    obtain ⟨k, hk, hlarge⟩ := hv (2 * C) K
    refine ⟨k, hk, ?_⟩
    have h := hhi k
    linarith

/-- A fixed positive lower bound arbitrarily far out implies escape from
every exponentially decaying target `A * k * q^k`, provided `0<q<1`.
The analytic fact `k*q^k -> 0` is supplied explicitly as a premise so this
certificate does not hide a limit theorem. -/
theorem escapes_of_positive_subsequence
    {w : ℕ → ℝ} {c q : ℝ}
    (hc : 0 < c)
    (hq : 0 < q)
    (hdecay : Tendsto (fun k : ℕ => (k : ℝ) * q ^ k) atTop (nhds 0))
    (hpos : ∀ K : ℕ, ∃ k : ℕ, K ≤ k ∧ c ≤ w k) :
    Escapes (fun k => w k / ((k : ℝ) * q ^ k)) := by
  intro C K
  by_cases hC : C ≤ 0
  · obtain ⟨k, hk, hw⟩ := hpos (max K 1)
    refine ⟨k, le_trans (le_max_left _ _) hk, ?_⟩
    have hk1 : 1 ≤ k := le_trans (le_max_right _ _) hk
    have hden : 0 < (k : ℝ) * q ^ k :=
      mul_pos (Nat.cast_pos.mpr (by omega)) (pow_pos hq _)
    have hdiv : 0 < w k / ((k : ℝ) * q ^ k) :=
      div_pos (hc.trans_le hw) hden
    exact lt_of_le_of_lt hC hdiv
  · have hCpos : 0 < C := lt_of_not_ge hC
    have hev : ∀ᶠ k in atTop, (k : ℝ) * q ^ k < c / C :=
      (tendsto_order.1 hdecay).2 _ (div_pos hc hCpos)
    obtain ⟨K0, hK0⟩ := (eventually_atTop.1 hev)
    obtain ⟨k, hk, hw⟩ := hpos (max K (max K0 1))
    refine ⟨k, le_trans (le_max_left _ _) hk, ?_⟩
    have hk0 : K0 ≤ k := le_trans (le_max_left _ _) (le_trans (le_max_right _ _) hk)
    have hk1 : 1 ≤ k := le_trans (le_max_right _ _) (le_trans (le_max_right _ _) hk)
    have hden : 0 < (k : ℝ) * q ^ k :=
      mul_pos (Nat.cast_pos.mpr (by omega)) (pow_pos hq _)
    apply (lt_div_iff₀ hden).2
    calc
      C * ((k : ℝ) * q ^ k) < c := by
        simpa [mul_comm] using (lt_div_iff₀ hCpos).mp (hK0 k hk0)
      _ ≤ w k := hw

end RHMathDyadicWeightedCount

#print axioms RHMathDyadicWeightedCount.escapes_iff_of_factor_two
#print axioms RHMathDyadicWeightedCount.escapes_of_positive_subsequence
