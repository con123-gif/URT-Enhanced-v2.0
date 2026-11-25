/- RUN26: conditional pointwise-to-Landau and RH root bridge.
   Prepared, not compiled. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
   No proof of the arithmetic bound or analytic PoleData supplier here. -/
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.landauWindow
import Formalism.GammaFactorNonvanishing.RhOfRight
open Complex MeasureTheory Set
noncomputable section
namespace ShellRootAudit

theorem window_of_pointwise {g : ℝ → ℝ} {θ δ C : ℝ}
    (hδ : 0 < δ) (hC : 0 ≤ C)
    (hW : ∀ T : ℝ, ∃ U : ℝ, T ≤ U ∧
      ∀ u ∈ Icc U ((1 + δ) * U), g u ≤ C * Real.exp (θ * u)) :
    Deduction.WindowHypU g θ δ := by
  intro η hη U₀
  obtain ⟨U, hU, hw⟩ := hW (max U₀ (max 0 (4 * C * δ / η ^ 2)))
  have hU0 : 0 ≤ U := (le_max_left _ _).trans ((le_max_right _ _).trans hU)
  have hUthreshold : 4 * C * δ / η ^ 2 ≤ U :=
    (le_max_right _ _).trans ((le_max_right _ _).trans hU)
  have hη2 : 0 < η ^ 2 := by positivity
  have hT := (div_le_iff₀ hη2).mp hUthreshold
  have hab : U ≤ (1 + δ) * U := by nlinarith [mul_nonneg hδ.le hU0]
  have hA : C * δ * U ≤ (η * U / 2) ^ 2 := by
    have h := mul_le_mul_of_nonneg_right hT hU0
    nlinarith [h]
  have hB : η * U / 2 ≤ Real.exp (η * U / 2) := by
    linarith [Real.add_one_le_exp (η * U / 2)]
  have hSq := mul_le_mul hB hB (show 0 ≤ η * U / 2 by positivity)
    (Real.exp_pos (η * U / 2)).le
  have hbudget : C * δ * U ≤ Real.exp (η * U) := by
    calc
      C * δ * U ≤ (η * U / 2) ^ 2 := hA
      _ ≤ Real.exp (η * U / 2) * Real.exp (η * U / 2) := by
        simpa only [pow_two] using hSq
      _ = Real.exp (η * U) := by rw [← Real.exp_add]; congr 1 <;> ring
  have hf : (fun u : ℝ => (C * Real.exp (θ * u)) * Real.exp (-θ * u)) =
      (fun _ : ℝ => C) := by
    funext u
    rw [mul_assoc, ← Real.exp_add,
      show θ * u + -θ * u = 0 by ring, Real.exp_zero, mul_one]
  refine ⟨U, (le_max_left _ _).trans hU, fun u => C * Real.exp (θ * u), ?_, ?_, ?_⟩
  · rw [hf]
    exact integrableOn_const (by simp [Real.volume_Icc])
  · intro u hu
    exact ⟨mul_nonneg hC (Real.exp_pos _).le, hw u hu⟩
  · rw [hf, setIntegral_const, Real.volume_real_Icc_of_le hab, smul_eq_mul]
    calc
      ((1 + δ) * U - U) * C = C * δ * U := by ring
      _ ≤ Real.exp (η * U) := hbudget

-- hcover is an explicit obligation: the true transformed pole set must
-- include every off-line zeta zero, not merely a convenient subset.
theorem rh_of_affine_shell {g : ℝ → ℝ} {Φ : ℂ → ℂ} {Z : Set ℂ}
    (p : Deduction.PoleData g Φ Z)
    (hcover : ∀ s : ℂ, 1 / 2 < s.re → s ≠ 1 → riemannZeta s = 0 →
      (2 * s - 1) ∈ Z)
    (hw : ∀ ε : ℝ, 0 < ε → ε < 1 / 2 →
      ∃ C δ : ℝ, 0 ≤ C ∧ 0 < δ ∧
        ∀ T : ℝ, ∃ U : ℝ, T ≤ U ∧
          ∀ u ∈ Icc U ((1 + δ) * U), g u ≤ C * Real.exp ((2 * ε) * u)) :
    RiemannHypothesis := by
  apply Formalism.VW.rh_of_right
  intro s hs hs1 hz
  let ε : ℝ := min ((s.re - 1 / 2) / 2) (1 / 4)
  have he : 0 < ε := by dsimp [ε]; exact lt_min (by linarith) (by norm_num)
  have he1 : ε < 1 / 2 := by
    dsimp [ε]
    exact (min_le_right _ _).trans_lt (by norm_num)
  have he2 : ε ≤ (s.re - 1 / 2) / 2 := by dsimp [ε]; exact min_le_left _ _
  obtain ⟨C, δ, hC, hδ, hW⟩ := hw ε he he1
  have hW' := window_of_pointwise hδ hC hW
  have hle := Deduction.landau_window p (θ := 2 * ε)
    (by linarith) (by linarith) hδ hW' (2 * s - 1) (hcover s hs hs1 hz)
  have hre : (2 * s - 1).re = 2 * s.re - 1 := by simp [Complex.mul_re]
  rw [hre] at hle
  linarith

end ShellRootAudit
#print axioms ShellRootAudit.window_of_pointwise
#print axioms ShellRootAudit.rh_of_affine_shell
#print axioms Deduction.landau_window
#print axioms Formalism.VW.rh_of_right
