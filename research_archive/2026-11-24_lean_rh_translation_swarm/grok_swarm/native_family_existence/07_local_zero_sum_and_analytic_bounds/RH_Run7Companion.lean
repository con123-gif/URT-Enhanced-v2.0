/-
  RH_Run7Companion.lean — NOT EXECUTED. Status: NOT EXECUTED (no Mathlib build available in this run).
  Intended to be compiled inside the pinned project
  leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005.
  It only restates (via `#check`) the declarations reconstructed in
  CHAPTER_LOCAL_ZERO_SUM_AND_ANALYTIC_BOUNDS.md and re-derives the weakening in §D.
  No PASS is claimed for this file.
-/
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.NormOneSubConjMul
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.NegReLogDerivPrincipalLFunctionLe
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsNormDerivLFunctionLe
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ExistsLeNormLFunctionOne
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.ZeroFreePrincipal

#check @GlobalTheory.LogDerivZeros.main
#check @GlobalTheory.LLocal.logDeriv_LFunction_local
#check @GlobalTheory.ZetaLocal.logDeriv_riemannZeta_local
#check @GlobalTheory.PrincipalLogDeriv.neg_re_logDeriv_le
#check @GlobalTheory.DirichletDeriv.norm_LFunction_le
#check @GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le
#check @GlobalTheory.LOneLower.inv_le_norm_LFunction_one
#check @GlobalTheory.ZeroFreePrincipal.zero_free

/-- §D weakening, restated: 1/(36q) ≥ (1/36)/q^(3/2) for q ≥ 1. -/
example (q : ℝ) (hq : 1 ≤ q) : (1 / 36) / q ^ ((3 : ℝ) / 2) ≤ 1 / (36 * q) := by
  have h0 : 0 < q := by linarith
  have h : q ≤ q ^ ((3 : ℝ) / 2) := by
    simpa using Real.rpow_le_rpow_of_exponent_le hq (by norm_num : (1 : ℝ) ≤ 3 / 2)
  rw [div_div]
  exact one_div_le_one_div_of_le (by positivity) (by nlinarith)

#print axioms GlobalTheory.LOneLower.inv_le_norm_LFunction_one
#print axioms GlobalTheory.DirichletDeriv.exists_norm_deriv_LFunction_le
