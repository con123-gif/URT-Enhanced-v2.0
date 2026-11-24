/-
  RH_Run8Companion.lean: run-8 targets of the native_family_existence lane.
  Compiled in run 8 against the pinned upstream source modules (built from
  leanprover-community/riemann-hypothesis@40e56ba src/ with Mathlib 0df444a); see lake_lean_run.log.
-/
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsFactorOrder
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DifferentiableAtFractInt
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.LogDerivRiemannZetaLocalZeroSum
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.NormSubOneMulRiemannZetaLe
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.TsumOneDivRpowLe
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.DifferentiableAtMellinSummatory
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.LFunctionEqTsumOfOneLt

open Complex DirichletCharacter

-- Statements restated as in CHAPTER_ANALYTIC_BASE.md and closed by the upstream terms.
example {U : Set ℂ} {g : ℂ → ℂ} (hg : AnalyticOnNhd ℂ g U) {w : ℂ} (hw : w ∈ U)
    (hord : analyticOrderAt g w ≠ ⊤) :
    ∃ h : ℂ → ℂ, AnalyticOnNhd ℂ h U ∧
      (∀ z : ℂ, g z = (z - w) ^ analyticOrderNatAt g w * h z) ∧ h w ≠ (0 : ℂ) :=
  GlobalTheory.FactorOrderExistence.exists_factor_order hg hw hord

example : ∀ s : ℂ, 0 < s.re → s ≠ 1 → ‖riemannZeta s - s / (s - 1)‖ ≤ ‖s‖ / s.re :=
  GlobalTheory.ZetaHalfPlane.norm_zeta_sub_le

example (t : ℝ) {z : ℂ} (hz : ‖z‖ ≤ 1) : ‖riemannZeta₁ (3/2 + t * I + z)‖ ≤ 5 * (|t| + 2) ^ 2 :=
  GlobalTheory.ZetaLocal.norm_zeta₁_le t hz

example (t : ℝ) : 1 / 6 ≤ ‖riemannZeta₁ (3/2 + t * I)‖ := GlobalTheory.ZetaLocal.le_norm_zeta₁ t

example : ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ, -(7/4 : ℝ) ≤ s.re → s ≠ 1 →
    ‖(s - 1) * riemannZeta s‖ ≤ C * (‖s‖ + 2) ^ 5 :=
  GlobalTheory.ZetaLeft.norm_sub_one_mul_riemannZeta_le

example (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ) (hs : 1 < s.re) :
    (s.re - 1) / s.re ≤ ‖LFunction χ s‖ := GlobalTheory.LLower.norm_LFunction_ge q χ s hs

example : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 →
    ∀ s : ℂ, 0 < s.re → ‖LFunction χ s‖ ≤ q * ‖s‖ / s.re :=
  GlobalTheory.LGrowth.norm_LFunction_le

example : ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ ≠ 1 → ∀ s : ℂ, 0 < s.re →
    ∀ N : ℕ, 1 ≤ N → ‖LFunction χ s - ∑ n ∈ Finset.Icc 1 N, χ (n : ZMod q) * (n : ℂ) ^ (-s)‖
      ≤ 2 * q * (1 + ‖s‖ / s.re) * (N : ℝ) ^ (-s.re) :=
  GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le

#print axioms GlobalTheory.FactorOrderExistence.exists_factor_order
#print axioms GlobalTheory.ZetaHalfPlane.norm_zeta_sub_le
#print axioms GlobalTheory.ZetaLocal.norm_zeta₁_le
#print axioms GlobalTheory.ZetaLocal.logDeriv_riemannZeta_local
#print axioms GlobalTheory.ZetaLeft.norm_sub_one_mul_riemannZeta_le
#print axioms GlobalTheory.LLower.norm_LFunction_ge
#print axioms GlobalTheory.LGrowth.norm_LFunction_le
#print axioms GlobalTheory.DirichletTail.norm_LFunction_sub_sum_le
