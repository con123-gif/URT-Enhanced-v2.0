import C2Combined
import New.Rows.Carrier
import Mathlib.Tactic

/-! Standard-pair interface for the actual determinant consumer.
Uses the checked equal-rank reference and checked standard-pair helper.
No arbitrary-partner extension or original exchange theorem is used.
The modulus/finite-datum and fixed-line attachments remain separate.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0.
-/

set_option pp.fullNames true
set_option debug.skipKernelTC false

open RingHom Fintype Modulus IsLinearMap Matrix MeasureTheory

section
variable {E} [Field E] [CMType E] [WeilData E] {n a b}
  [Fintype n] [Fintype a] [Fintype b] {s t t'}
  (W : Space E n s) (V : Space E a t) (V' : Space E b t')

lemma c2_standard_exchange_uniform σ (hs : negCount s = negCount t + negCount t')
    {e} (he : card a = card b + 2 * e) (hn : 2 * negCount s + 2 ≤ card n)
    {μ : _ → ℤ} (hμ : ∀ v, card n ≤ 2 * μ v + 2 * negCount s)
    {v} (hv : IsRapidDatum v) :
    ∃ C x, IsRapidDatum x ∧ ∀ 𝔠 : SplitTameChar E μ,
      let γ := rankTwist 𝔠.ν⁻¹ n
      ∃ c ≠ 0, ‖c‖ ^ 2 = C * lValueProdInt 𝔠 (e : ℤ) ∧
        ∀ z, IsIntMatrix SemilocalField.O z → ∀ g,
          thetaIntegral W V γ 1
            (localDatum W V x (stdRowDatum σ 𝔠.χ z) 𝔠.readsAt) g =
          c * ∫ h, pairTheta V' W γ γ
            (localDatum V' W v (stdColDatum 𝔠.χ z) 𝔠.readsAt) (h, g) ∂V'.quotMeasure := by
  obtain ⟨z, hz, C₀, hC₀, H₀⟩ :=
    run78_equalRankThetaRatio_value W μ (card n / 2 - negCount s) ?_ ?_
  obtain ⟨D, x, hx, H⟩ := RHCharacterBoxes77.exchange_of_standard_pairs
    V' μ (removePlanes _ W) V σ hz hv ?_ ?_
  refine ⟨C₀ / D, x, hx, fun 𝔠 ↦ ?_⟩
  obtain ⟨c, hc, Hc⟩ := H 𝔠
  have hd : card b + card a = card n := by
    simpa only [Fintype.card_sum] using card_congr σ
  have hi : (card a : ℤ) - (card n : ℤ) / 2 = (e : ℤ) := by omega
  rw [hi, H₀] at hc
  have hp := lValueProdInt_pos 𝔠 (e : ℤ)
  have hprod : lValueProdInt 𝔠 (e : ℤ) * C₀ ≠ 0 := mul_ne_zero (ne_of_gt hp) hC₀
  have hD : D ≠ 0 := by
    intro hD
    apply hprod
    simpa [hD] using hc.symm
  have hcn : c ≠ 0 := by
    intro hcn
    apply hprod
    simpa [hcn] using hc.symm
  refine ⟨c, hcn, ?_, Hc⟩
  calc
    ‖c‖ ^ 2 = (lValueProdInt 𝔠 (e : ℤ) * C₀) / D :=
      (eq_div_iff hD).2 (by simpa only [mul_comm] using hc)
    _ = (C₀ / D) * lValueProdInt 𝔠 (e : ℤ) := by ring
  all_goals grind [card_sum, card_congr σ, card_unit]

end

#print axioms c2_standard_exchange_uniform

run_cmd do
  let info ← Lean.getConstInfo ``c2_standard_exchange_uniform
  let some value := info.value? (allowOpaque := true) |
    Lean.throwError "Missing standard exchange proof"
  let deps := value.getUsedConstants
  for name in #[``exchange_of_partners, ``exchange_theorem, ``exists_equalRankThetaRatio_value] do
    if deps.contains name then
      Lean.throwError "Standard interface calls an original general exchange target"
  for name in #[``run78_equalRankThetaRatio_value, ``RHCharacterBoxes77.exchange_of_standard_pairs] do
    unless deps.contains name do
      Lean.throwError "Standard interface misses a checked supplier"
  Lean.logInfo "C2_STANDARD_EXCHANGE: both checked suppliers consumed; original general targets absent directly"
