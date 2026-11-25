import Formalism.SharpRestriction.LevelLetterCocycles.ExportBoundOfAdmissible

/-! Exact pinned source overlay. PREPARED NOT COMPILED. RH OPEN.
Only replaces the final enlargement of a finite support sum to tsum.
Native admission still requires ShaFinOdd D at all primes. -/
noncomputable section
namespace Formalism.MainNotions.TwistedPlaces
open Formalism.BasicNotions Formalism.MainNotions NumberField IsDedekindDomain
variable {D : D7}

open Classical in
def rh_aux_support (L : SizeData₂ D) (C : ℝ) : Prop :=
  ShaFinOdd D → ∀ j ∈ SizeData₂.lifts D,
    etaSum L j ≤ (L.dZ0 j : ℝ) *
      (C * ((D.R.f : ℝ) * D.R.m * L.sc.b * (large₂ L) ^ 2 + (Real.log L.sc.x) ^ 2 * L.Nc) +
        ∑ l ∈ (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image (fun w => D.what₂.places.resChar w), vvTerm D l)

open Classical in
theorem rh_etaSum_le_support (L : SizeData₂ D) (tb : Tab L) (C : ℝ) (P : ParameterChoice' D L) (hA : AdmT L tb C P)
    (_hg2 : ∀ l ∈ gset D, l ≠ 2) {j : ℕ} (hj : j ∈ SizeData₂.lifts D) :
    etaSum L j ≤ (L.dZ0 j : ℝ) * (6 + UpperTheory.KStar.nuBudget D + Real.log (Formalism.MainNotions.N.hE D.host : ℝ) + Real.log (D.what₂.restRowsFiniteGroupCard : ℝ) +
      ∑ l ∈ (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image
        (fun w => D.what₂.places.resChar w), Real.log l * lamG L tb C l) + (L.dZ0 j : ℝ) * (∑ l ∈ (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image (fun w => D.what₂.places.resChar w), vvTerm D l) := by
  classical
  obtain ⟨h1, h2, h3, h4, h5, h6, hRa, hRb, hRc, hRd, hBand, hRe, hExc, hRf, hRg, hRh, hPar⟩ := hA
  have hC : 0 < C := lt_of_lt_of_le P.CLw_pos hPar.1
  set S := (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image
    (fun w => D.what₂.places.resChar w) with hSdef
  have hSp : ∀ l ∈ S, l.Prime := by
    intro l hl
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.1 hl
    exact D.what₂.places.resChar_prime w

  let sig : ℕ → ℝ := fun l => nuL D l + 2 / (l : ℝ) ^ 2
  let VVo : ℕ → ℝ := fun l => VVr D l
  let vG : ℕ → ℝ := fun l => (padicValNat l D.what₂.restRowsFiniteGroupCard : ℝ)
  let U : ℕ → ℝ := fun l => sig l + lamG L tb C l + VVo l + vhE D l + vG l
  have hd0 : (0 : ℝ) ≤ L.dZ0 j := by positivity
  have hper : ∀ l ∈ S, etaAt L j l ≤ Real.log l * ((L.dZ0 j : ℝ) * U l) := by
    intro l hl
    have hp := hSp l hl
    have hsig0 : 0 ≤ sig l := by have := nuL_nonneg D l; simp only [sig]; positivity
    have hVVo0 : 0 ≤ VVo l := VVr_nonneg D l
    have hvG0 : 0 ≤ vG l := by simp only [vG]; positivity
    have hvh := vhE_nonneg D l
    by_cases hlg : l ∈ gset D
    · refine (etaAt_le_g L tb C hRh h6 hj hlg).trans ?_
      apply mul_le_mul_of_nonneg_left _ (Real.log_natCast_nonneg l)
      apply mul_le_mul_of_nonneg_left _ hd0
      simp only [U, sig, VVo, lamG, if_pos hlg]
      have : 0 ≤ nuL D l := nuL_nonneg D l
      linarith
    · have hlam0 : 0 ≤ lamG L tb C l := by
        simp only [lamG, if_neg hlg]; exact lamB_nonneg L tb hC hp.two_le
      have hU0 : 0 ≤ U l := by simp only [U]; linarith
      refine etaAt_le L hj hlg hU0 h1 h2 h3 ?_
      intro i hti hli π hπ
      have hl' : D.nd.l i ∉ gset D := hli ▸ hlg
      have hloc := loc_le_lamB L tb C hC h5 hRa hRb hRc hRd hBand hRe hRf hRg i hti hl'
      have h4' := h4 i hti hl' π hπ
      have h6' := h6.1 i hti π hπ
      rw [hli] at hloc h4' h6'
      simp only [U, sig, VVo, vG, lamG, if_neg hlg]
      linarith

  have hsum : etaSum L j ≤ (L.dZ0 j : ℝ) * ∑ l ∈ S, Real.log l * U l := by
    rw [etaSum_eq_sum, Finset.mul_sum]
    apply Finset.sum_le_sum
    intro l hl
    refine (hper l hl).trans (le_of_eq (by ring))
  refine hsum.trans ?_

  have hsig : ∑ l ∈ S, Real.log l * sig l ≤ 6 + UpperTheory.KStar.nuBudget D := by
    have hA2 : ∑ l ∈ S, Real.log l / (l : ℝ) ^ 2 ≤ 2 := by
      have := Sums.sum_log_div_sq_le S
      have heq : S.filter (fun l : ℕ => 2 ≤ l) = S := Finset.filter_true_of_mem (fun l hl => (hSp l hl).two_le)
      rw [heq] at this
      exact this
    have hν := UpperTheory.KStar.sum_nuL_le D S hSp
    have e : ∑ l ∈ S, Real.log l * sig l = ∑ l ∈ S, nuL D l * Real.log l + 2 * ∑ l ∈ S, Real.log l / (l : ℝ) ^ 2 := by
      rw [Finset.mul_sum, ← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun l _ => by simp only [sig]; ring
    linarith
  have hVV : ∑ l ∈ S, Real.log l * VVo l ≤ ∑ l ∈ S, vvTerm D l := by
    have heq : ∑ l ∈ S, Real.log l * VVo l = ∑ l ∈ S, vvTerm D l := by
      refine Finset.sum_congr rfl (fun l hl => ?_)
      have hp := hSp l hl
      simp only [VVo]
      unfold vvTerm VVr Rows.Data.VV
      rw [if_pos hp]
      ring
    rw [heq]
    exact le_rfl
  have hvh : ∑ l ∈ S, Real.log l * vhE D l ≤ Real.log (Formalism.MainNotions.N.hE D.host : ℝ) := by
    have := Sums.sum_padicVal_log_le S hSp (Formalism.MainNotions.N.hE D.host) (by
      unfold Formalism.MainNotions.N.hE NumberField.classNumber; exact Fintype.card_ne_zero)
    refine le_of_eq_of_le (Finset.sum_congr rfl (fun l _ => ?_)) this
    unfold vhE; ring
  have hvG : ∑ l ∈ S, Real.log l * vG l ≤ Real.log (D.what₂.restRowsFiniteGroupCard : ℝ) := by
    have := Sums.sum_padicVal_log_le S hSp D.what₂.restRowsFiniteGroupCard D.what₂.restRowsFiniteGroupCard_pos.ne'
    refine le_of_eq_of_le (Finset.sum_congr rfl (fun l _ => ?_)) this
    simp only [vG]; ring
  have hsplit : ∑ l ∈ S, Real.log l * U l = ∑ l ∈ S, Real.log l * sig l + ∑ l ∈ S, Real.log l * lamG L tb C l +
      ∑ l ∈ S, Real.log l * VVo l + ∑ l ∈ S, Real.log l * vhE D l + ∑ l ∈ S, Real.log l * vG l := by
    simp only [U, mul_add, Finset.sum_add_distrib]
  rw [hsplit, ← mul_add]
  apply mul_le_mul_of_nonneg_left _ hd0
  linarith

theorem rh_export_bound_of_admissible_support (P : ParameterChoice' D L) {C : ℝ} (hL : Large L.sc.x L.sc.eps C) (hAdm : admitted L P C) :
    rh_aux_support L (2000 * (|C| + 1) ^ 3) := by
  classical
  intro hSha j hj
  obtain ⟨tb, hA⟩ := hAdm hSha
  have hC : 0 < C := lt_of_lt_of_le P.CLw_pos hA.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hPar : ParametersPolynomiallyBounded L C P := hA.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2.2
  have habs : |C| = C := abs_of_pos hC
  change etaSum L j ≤ (L.dZ0 j : ℝ) * (2000 * (|C| + 1) ^ 3 * ((D.R.f : ℝ) * D.R.m * L.sc.b * (large₂ L) ^ 2 + (Real.log L.sc.x) ^ 2 * L.Nc) + (∑ l ∈ (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image (fun w => D.what₂.places.resChar w), vvTerm D l))
  rw [habs]
  have h1 := rh_etaSum_le_support L tb C P hA (gset_ne_two L P) hj
  set S := (L.supp.filter (fun w => D.what₂.muAt w ≠ D.what₂.mu0)).image (fun w => D.what₂.places.resChar w) with hSdef
  have hSp : ∀ l ∈ S, l.Prime := by
    intro l hl
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.1 hl
    exact D.what₂.places.resChar_prime w
  have h2 := point_bound L hC P hPar hL tb hA S hSp
  have hd0 : (0 : ℝ) ≤ L.dZ0 j := by positivity
  have hNc := Nc_nonneg L
  have hlx : 0 ≤ Real.log L.sc.x ^ 2 * L.Nc := by positivity
  have hK0 : 0 ≤ 2000 * (C + 1) ^ 3 := by positivity
  have h3 : 2000 * (C + 1) ^ 3 * (D.R.f * D.R.m * L.sc.b * large₂ L ^ 2) ≤
      2000 * (C + 1) ^ 3 * ((D.R.f : ℝ) * D.R.m * L.sc.b * (large₂ L) ^ 2 + (Real.log L.sc.x) ^ 2 * L.Nc) := by
    apply mul_le_mul_of_nonneg_left _ hK0; linarith
  calc etaSum L j ≤ (L.dZ0 j : ℝ) * (6 + UpperTheory.KStar.nuBudget D + Real.log (Formalism.MainNotions.N.hE D.host : ℝ) + Real.log (D.what₂.restRowsFiniteGroupCard : ℝ) +
        ∑ l ∈ S, Real.log l * lamG L tb C l) + (L.dZ0 j : ℝ) * ∑ l ∈ S, vvTerm D l := h1
    _ ≤ (L.dZ0 j : ℝ) * (2000 * (C + 1) ^ 3 * ((D.R.f : ℝ) * D.R.m * L.sc.b * (large₂ L) ^ 2 +
        (Real.log L.sc.x) ^ 2 * L.Nc)) + (L.dZ0 j : ℝ) * ∑ l ∈ S, vvTerm D l := by
        gcongr
        exact h2.trans h3
    _ = (L.dZ0 j : ℝ) * (2000 * (C + 1) ^ 3 * ((D.R.f : ℝ) * D.R.m * L.sc.b * (large₂ L) ^ 2 +
        (Real.log L.sc.x) ^ 2 * L.Nc) + ∑ l ∈ S, vvTerm D l) := by ring

#print axioms rh_etaSum_le_support
#print axioms rh_export_bound_of_admissible_support

end Formalism.MainNotions.TwistedPlaces
