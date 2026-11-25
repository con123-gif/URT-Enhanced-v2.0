import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChCore
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

-- Prepared, not yet elaborated. No Main import. Original declarations retained.
-- Pin 40e56bab026552e089d7afcfeff08d2defb9c005; source ChCore.lean blob 878f5077bc382426c7da988e5a375b85deeaa7de.
open Finset
noncomputable section
namespace Deduction
open Deduction.CH Formalism Formalism.D5 Formalism.RankGapBounds.WeightedMeanData Formalism.LFunctionChainParameters.WeightedSlopeBounds Formalism.LFunctionChainParameters.characterSumData Formalism.LFunctionChainParameters.ThickSetMeanBounds Formalism.LFunctionChainParameters.LErr Formalism.LFunctionChainParameters.LChain
namespace CharacterBalanceMoves
variable {H : Type} [AddCommGroup H] [Fintype H] [DecidableEq H]

/-- Finite mean witness. No positivity assumption on f. -/
lemma selected_mean_exists {ι : Type*} [Fintype ι] [Nonempty ι] (f : ι → ℝ) :
    ∃ i, (∑ j, f j) ≤ (Fintype.card ι : ℝ) * f i := by
  classical
  let S : ℝ := ∑ j, f j
  have hc : (0 : ℝ) < Fintype.card ι := by exact_mod_cast Fintype.card_pos
  by_contra! hn
  have hh : ∀ i : ι, f i < S / (Fintype.card ι : ℝ) := by
    intro i
    apply (lt_div_iff₀ hc).2
    simpa [S, mul_comm] using hn i
  have hlt : (∑ i : ι, f i) < ∑ _i : ι, S / (Fintype.card ι : ℝ) := by
    apply Finset.sum_lt_sum
    · exact fun i _ => (hh i).le
    · obtain ⟨i⟩ := ‹Nonempty ι›
      exact ⟨i, Finset.mem_univ i, hh i⟩
  simp only [Finset.sum_const, nsmul_eq_mul, Finset.card_univ] at hlt
  have he : (Fintype.card ι : ℝ) * (S / (Fintype.card ι : ℝ)) = S := by
    field_simp
  rw [he] at hlt
  exact (lt_irrefl S) hlt

lemma core_selected (A0 : AddSubgroup H) (D : ArithData H) (S : Finset ℕ) (hD : HostFactsS D S) (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) {m : ℕ}
    (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ) {x b b' η X' θ Err Y : ℝ}
    (hx : 3 ≤ x) (hb : 0 < b) (hS : SizesA A0 TT T2 a w N x b b' η X' θ) (hThin : ThinScales D ell X' θ)
    (hC : CostWindows x (fPl H) b η θ) (hT2 : ∀ s ∈ T2, s ∈ A0)
    (hTop : ∃ u0 ∈ A0, gapA D N ell TT a w u0 ≤ Err ∧
    (∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re) ≤
      (Fintype.card A0 : ℝ) * (∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u0 t).re))
    (hY : (TT.card : ℝ) * Y ≤ ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) :
    (TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x := by
  classical
  obtain ⟨hη, hX', hb', hbX, hθ, ha, hwpos, hwthick, hwthin, hN⟩ := hS
  have hapos : ∀ t ∈ TT, 0 < a t := fun t ht => by
    have h1 : x - 1 ≤ a t / b := by linarith [(abs_le.1 (ha t ht)).1]
    rw [le_div_iff₀ hb] at h1
    nlinarith
  have hK : 2 * fPl H * (3 * (x + 1) * (η + 1) + (x + 1) * b * θ) ≤ 2 * b / x := by
    have h1 := mul_le_mul_of_nonneg_left hC.1 hb.le
    have h2 := hC.2
    have e : 2 * b / x = b * (1 / x) + b / x := by ring
    rw [e]
    nlinarith
  have hu : ∀ u0 ∈ A0, gapA D N ell TT a w u0 ≤ Err → ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u0 t).re ≤ Err + 2 * (TT.card : ℝ) * m * b / x := by
    intro u0 hu0 hGap
    have h1 : ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u0 t).re
        ≤ ∑ t ∈ TT, ∑ j : Fin m, (ASK D N (a t) t (w u0 j) - (MAIN ell (a t) (w u0 j)).re + 2 * b / x) := by
      refine Finset.sum_le_sum fun t ht => Finset.sum_le_sum fun j _ => ?_
      have k1 := th_le D ell T2 x b b' η X' θ (a t) u0 t (w u0 j) hx hb hη hX' hb' hbX hθ (ha t ht) (hwpos u0 hu0 j)
        (hwthick u0 hu0 j) (hwthin u0 hu0 j) hThin (lipschitz_weight_all H D ell)
      have k2 := congrArg Complex.re (ch_balance D S hD ell (a t) t (w u0 j) (hapos t ht) (hwpos u0 hu0 j) N
        (fun ρ hρ => hN u0 hu0 j t ρ ht hρ))
      rw [Complex.sub_re, Complex.ofReal_re] at k2
      linarith
    simp only [Finset.sum_add_distrib] at h1
    have e : ∑ _t ∈ TT, ∑ _j : Fin m, 2 * b / x = 2 * (TT.card : ℝ) * m * b / x := by
      simp only [Finset.sum_const, nsmul_eq_mul, Finset.card_univ, Fintype.card_fin]
      ring
    rw [e] at h1
    have := hGap
    unfold gapA at this
    linarith
  have hA : (0 : ℝ) < Fintype.card A0 := by exact_mod_cast Fintype.card_pos
  obtain ⟨u0, hu0, hGap, hMean⟩ := hTop
  have h1 : ∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re
      ≤ (Fintype.card A0 : ℝ) * (Err + 2 * (TT.card : ℝ) * m * b / x) := by
    exact hMean.trans (mul_le_mul_of_nonneg_left (hu u0 hu0 hGap) hA.le)
  have h2 : ∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re
      = (Fintype.card A0 : ℝ) * ((m * b * (delta2 T2 / 2)) *
        ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) := by
    rw [Finset.sum_comm, Finset.mul_sum, Finset.mul_sum]
    refine Finset.sum_congr rfl fun t _ => ?_
    simp only [Finset.sum_const, nsmul_eq_mul, Finset.card_univ, Fintype.card_fin]
    rw [← Finset.mul_sum, ← Complex.re_sum, sum_Th A0 D ell T2 hT2, Complex.re_ofReal_mul]
    ring
  rw [h2] at h1
  have h3 := le_of_mul_le_mul_left h1 hA
  have h4 : 0 ≤ (m : ℝ) * b * (delta2 T2 / 2) := by unfold delta2; positivity
  have h5 := mul_le_mul_of_nonneg_left hY h4
  nlinarith

lemma core_selected_original (A0 : AddSubgroup H) (D : ArithData H) (S : Finset ℕ) (hD : HostFactsS D S) (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) {m : ℕ}
    (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ) {x b b' η X' θ Err Y : ℝ}
    (hx : 3 ≤ x) (hb : 0 < b) (hS : SizesA A0 TT T2 a w N x b b' η X' θ) (hThin : ThinScales D ell X' θ)
    (hC : CostWindows x (fPl H) b η θ) (hT2 : ∀ s ∈ T2, s ∈ A0)
    (hTop : ∀ u0 ∈ A0, gapA D N ell TT a w u0 ≤ Err)
    (hY : (TT.card : ℝ) * Y ≤ ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (e1 t) * GPsi D ell ψ (a t / b)).re) :
    (TT.card : ℝ) * m * b * (delta2 T2 / 2) * Y ≤ Err + 2 * (TT.card : ℝ) * m * b / x := by
  classical
  let f : A0 → ℝ := fun u => ∑ t ∈ TT, ∑ _j : Fin m, (Th D ell T2 b (a t / b) u t).re
  obtain ⟨u, hu⟩ := selected_mean_exists f
  exact core_selected A0 D S hD ell N TT T2 a w hx hb hS hThin hC hT2
    ⟨u, u.property, hTop u u.property, hu⟩ hY

end CharacterBalanceMoves

set_option maxHeartbeats 1600000 in
theorem ch_core_selected (C ε CE Ko c M : ℝ) (hC : 0 ≤ C) (hε : 0 < ε) (hc : |c| ≤ 1) : ∃ x1 : ℝ, ∀ x ≥ x1,
    ∀ (H : Type) [AddCommGroup H] [Fintype H] [DecidableEq H] (m : ℕ) (D : ArithData H) (S : Finset ℕ)
      (ell : AddChar (E0 × H) ℂ → ℂ) (N : ℕ) (TT T2 : Finset H) (a : H → ℝ) (w : H → Fin m → E0 × H → ℝ)
      (b b' k aE η X' θ : ℝ) (A0 : AddSubgroup H) (Kp : Finset (AddChar (E0 × H) ℂ)),
      HostFactsS D S → 0 < b → 0 ≤ aE → 0 < k → (m : ℝ) ≤ x ^ ((1 : ℝ) / 2 + ε / 2) → x * m ≤ k →
      SizesA A0 TT T2 a w N x b b' η X' θ → ThinScales D ell X' θ → CostWindows x (fPl H) b η θ →
      RestSize ε x (Fintype.card H) TT.card T2.card m b k aE → (∀ s ∈ T2, s ∈ A0) → CharsA ell A0 Kp TT c M Ko CE ε x →
      (∃ u0 ∈ A0, gapA D N ell TT a w u0 ≤ x ^ (C * ε) * errorBracketSizeWindows x ε (Fintype.card H) TT.card T2.card m b k aE ∧
      (∑ u : A0, ∑ t ∈ TT, ∑ _j : Fin m, (CharacterBalanceMoves.Th D ell T2 b (a t / b) u t).re) ≤
      (Fintype.card A0 : ℝ) * (∑ t ∈ TT, ∑ _j : Fin m, (CharacterBalanceMoves.Th D ell T2 b (a t / b) u0 t).re)) →
      GmA D ell Kp c x ≤ x ^ ((1 : ℝ) / 2 + (C + 3) * ε) + SigA D ell A0 Kp x := by
  obtain ⟨Cd, hCd, hDer⟩ := derivative_integral_all
  obtain ⟨x₁, hx₁⟩ := Filter.eventually_atTop.1
    ((tendsto_rpow_atTop (show 0 < 3 * ε / 8 by positivity)).eventually_ge_atTop 26)
  set A1 : ℝ := 5 + Cd + |Ko| + |M| * (4 + Cd + |Ko|) + 4 * |CE| with hA1
  have hA10 : 0 ≤ A1 := by positivity
  obtain ⟨x₂, hx₂⟩ := Filter.eventually_atTop.1
    ((tendsto_rpow_atTop (show (0 : ℝ) < 1 / 4 by norm_num)).eventually_ge_atTop (|M| * A1))
  refine ⟨max 3 (max x₁ x₂), fun x hx => ?_⟩
  intro H _ _ _ m D S ell N TT T2 a w b b' k aE η X' θ A0 Kp hHost hb ha hk hm hxm hS hThin hCost hSize hT2 hCh hTop
  obtain ⟨h0K, hKp, hM, hE2, hKo, hE3⟩ := hCh
  have hx3 : 3 ≤ x := le_of_max_le_left hx
  have h26 := hx₁ x (le_of_max_le_left (le_of_max_le_right hx))
  have hbig := hx₂ x (le_of_max_le_right (le_of_max_le_right hx))
  have hx0 : 0 < x := by linarith
  have w1 : 1 ≤ x := by linarith
  have hW : SizeWindows C ε x (Fintype.card H) TT.card T2.card m b k aE
      (x ^ (C * ε) * errorBracketSizeWindows x ε (Fintype.card H) TT.card T2.card m b k aE) :=
    (size_windows_split _ _ _ _ _ _ _ _ _ _ _).2 ⟨hSize, le_refl _, ⟨hx3, h26⟩, hε, hC,
      Fintype.card_pos, hb, ha, Finset.card_le_univ T2, hm, hxm⟩
  set s : ℝ := x ^ ((1 : ℝ) / 4) with hs
  set e : ℝ := x ^ ε with he
  have hs1 : 1 ≤ s := Real.one_le_rpow w1 (by norm_num)
  have he1 : 1 ≤ e := Real.one_le_rpow w1 hε.le
  have hX : x ^ ((1 : ℝ) / 2 + ε) = s * (s * e) := by
    rw [hs, he, ← Real.rpow_add hx0, ← Real.rpow_add hx0]
    congr 1
    ring
  have hρ : x ^ (-1 + ε) * x = e := by
    rw [Real.rpow_add hx0, Real.rpow_neg_one]
    field_simp
    rfl
  have hl0 : 0 ≤ Real.log x := Real.log_nonneg w1
  have hl : Real.log x ≤ 4 * s := by
    have := Real.log_le_rpow_div hx0.le (by norm_num : (0 : ℝ) < 1 / 4)
    linarith
  have hl1 : Real.log (x + 1) ≤ 5 * s := by
    have h1 : Real.log (x + 1) ≤ Real.log (2 * x) := Real.log_le_log (by linarith) (by linarith)
    rw [Real.log_mul (by norm_num) hx0.ne'] at h1
    have h2 : Real.log 2 ≤ 2 - 1 := Real.log_le_sub_one_of_pos (by norm_num)
    linarith
  have hse : s ≤ s * e := le_mul_of_one_le_right (by linarith) he1
  have hse1 : 1 ≤ s * e := by linarith
  have up : ∀ z : ℝ, 0 ≤ z → z ≤ z * (s * e) := fun z hz => le_mul_of_one_le_right hz hse1
  have hMe : 0 ≤ |M| * (4 + Cd + |Ko|) * (s * e) := by positivity
  have hCe : 0 ≤ |CE| * (s * e) := by positivity
  have hKe : 0 ≤ |Ko| * (s * e) := by positivity
  have hCde : 0 ≤ Cd * (s * e) := by positivity
  have hR : A1 * (s * e) = 5 * (s * e) + Cd * (s * e) + |Ko| * (s * e) + |M| * (4 + Cd + |Ko|) * (s * e)
      + 4 * (|CE| * (s * e)) := by
    rw [hA1]; ring
  have hρ0 : 0 ≤ x ^ (-1 + ε) := Real.rpow_nonneg hx0.le _
  have r1 : Cd ≤ A1 * (s * e) := by linarith [up Cd hCd]
  have r2 : Real.log (x + 1) + Cd + |Ko| + |M| * x ^ (-1 + ε) * (x * (Real.log x + Cd + |Ko|)) ≤ A1 * (s * e) := by
    have e1 : |M| * x ^ (-1 + ε) * (x * (Real.log x + Cd + |Ko|)) = |M| * ((Real.log x + Cd + |Ko|) * e) := by
      rw [← hρ]; ring
    have e2 : Real.log x + Cd + |Ko| ≤ (4 + Cd + |Ko|) * s := by
      have := le_mul_of_one_le_right hCd hs1
      have := le_mul_of_one_le_right (abs_nonneg Ko) hs1
      linarith
    have e3 : |M| * ((Real.log x + Cd + |Ko|) * e) ≤ |M| * ((4 + Cd + |Ko|) * s * e) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right e2 (by linarith)) (abs_nonneg M)
    have e4 : |M| * ((4 + Cd + |Ko|) * s * e) = |M| * (4 + Cd + |Ko|) * (s * e) := by ring
    rw [e1]
    linarith [up Cd hCd, up _ (abs_nonneg Ko)]
  have r3 : Real.log (x + 1) + Cd + |CE| * Real.log x ≤ A1 * (s * e) := by
    have e1 : |CE| * Real.log x ≤ |CE| * (4 * (s * e)) := mul_le_mul_of_nonneg_left (by linarith) (abs_nonneg CE)
    linarith [up Cd hCd]
  have hone := CharacterBalanceMoves.one_char A0 Kp D ell TT (fun t => a t / b) (c := c) (ρ := |M| * x ^ (-1 + ε)) (Ko := |Ko|)
    (L := |CE| * Real.log x) hx3 hCd hS.2.2.2.2.2.1 (hDer H D ell) (by positivity) (abs_nonneg _) h0K
    (fun ψ h => (hKp ψ h).2)
    (fun ψ h h' => (hE2 ψ h h').trans (by gcongr; exact le_abs_self M))
    (fun ψ h h' => (hKo ψ h h').trans (le_abs_self Ko))
    (fun ψ h h1 => (hE3 ψ h h1).trans (mul_le_mul_of_nonneg_right (le_abs_self CE) hl0))
    r1 r2 r3
  set G : ℝ := GmA D ell Kp c x - SigA D ell A0 Kp x with hG
  have hY : (TT.card : ℝ) * (G - 4 * x ^ ((1 : ℝ) / 2 + ε)) ≤
      ∑ t ∈ TT, (∑ ψ ∈ PsiA A0, ψ (CharacterBalanceMoves.e1 t) * GPsi D ell ψ (a t / b)).re := by
    simp_rw [Complex.re_sum]
    rw [Finset.sum_comm]
    refine le_trans ?_ (Finset.sum_le_sum hone)
    rw [← Finset.mul_sum, Finset.sum_sub_distrib, CharacterBalanceMoves.sum_vv A0 Kp (fun ψ h => (hKp ψ h).1), Finset.sum_const,
      nsmul_eq_mul, hX]
    refine mul_le_mul_of_nonneg_left ?_ (Nat.cast_nonneg _)
    have k1 := mul_le_mul_of_nonneg_right (hM.trans (le_abs_self M)) (show 0 ≤ A1 * (s * e) by positivity)
    have k2 := mul_le_mul_of_nonneg_right hbig (show 0 ≤ s * e by positivity)
    have k3 : 0 ≤ s * (s * e) := by positivity
    have k4 : |M| * (A1 * (s * e)) = |M| * A1 * (s * e) := by ring
    linarith
  have hc' := CharacterBalanceMoves.core_selected A0 D S hHost ell N TT T2 a w hx3 hb hS hThin hCost hT2 hTop hY
  have hz := proposition_size_bound _ _ _ _ _ _ _ _ _ _ _ G hW hc'
  linarith

end Deduction

rh_scan Deduction.CharacterBalanceMoves.th_le limit 2000
rh_scan Deduction.CharacterBalanceMoves.core limit 2000
rh_scan Deduction.CharacterBalanceMoves.core_selected limit 2000
rh_scan Deduction.ch_core_selected limit 2000
rh_prune Deduction.CharacterBalanceMoves.th_le as RHSelectedThLePruned
rh_prune Deduction.CharacterBalanceMoves.core_selected as RHSelectedCorePruned
#print axioms Deduction.CharacterBalanceMoves.core
#print axioms Deduction.CharacterBalanceMoves.selected_mean_exists
#print axioms Deduction.CharacterBalanceMoves.core_selected
#print axioms Deduction.CharacterBalanceMoves.core_selected_original
#print axioms Deduction.ch_core_selected
-- A concrete invocation of the shared search on the same mean transfer.
theorem RHSelectedMeanTransfer (a b c : ℝ) (ha : a ≤ b) (hb : b ≤ c) : a ≤ c := by
  rh_reduce 3 using [le_trans]
theorem RHSelectedMeanTransferAuto (a b c : ℝ) (ha : a ≤ b) (hb : b ≤ c) : a ≤ c := by
  rh_auto 3
theorem RHSelectedMeanTransferFrontier (a b c : ℝ) (ha : a ≤ b) (hb : b ≤ c) : a ≤ c := by
  rh_auto_frontier 3
  all_goals first | assumption | exact ha.trans hb
#print axioms RHSelectedMeanTransfer
#print axioms RHSelectedMeanTransferAuto
#print axioms RHSelectedMeanTransferFrontier
end
