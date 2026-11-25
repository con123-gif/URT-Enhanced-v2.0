import Formalism.LocalToGlobal.SiegelLatticeTheory.CokernelGLCounts.RankPointCounts.RowsInputPOfTermsFiniteSig
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-! RUN33: direct upper budget at actual spectral consumer. PREPARED, not compiled. -/
noncomputable section
namespace Formalism.L2.SG.DataCut
open NumberField Formalism.MainNotions.S Formalism.MainNotions.S.LocalSplitGroups Formalism.FourierDecayAlt Formalism.L2.SG.DataInst
open Classical ValuativeRel
open scoped ComplexOrder

def RH33RowsDatumBudgetP (D : Formalism.BasicNotions.D7) : Prop :=
  (VS D).SigOK →
  ∀ (δ : ∀ p : PlF D, (D.s.atP p).Fp) (M : ∀ p : PlF D, Loc.Model (D.s.atP p).Fp (D.s.atP p).Ep),
    (∀ p, Agree δ M p) → ∀ (L : CntLocal.LocSp D M) (u u' : D.what₂.Word),
    (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Formalism.MainNotions.S.Lat.gS D) ^ 2] → Formalism.MainNotions.S.Lat.PrimeHyp D u (Formalism.MainNotions.S.Lat.Tu D u') →
    ∀ (F0 : FlagG (VS D) D.R.rS (CntLocal.Tn u)) (what₂ : Finset (Submodule (𝓞 D.host.E) (VS D).V)),
      IsRowReps D F0 what₂ →
    ∀ ϖ : ∀ p : PlF D, 𝒪[(D.s.atP p).Fp], (∀ p, Irreducible (ϖ p)) →
    ∀ nc : ℝ, CntLocal.Formula δ L u u' F0 what₂ nc →
      BddAbove (densSet L δ ϖ u u' F0 what₂) →
      (0 ≤ supDens L δ ϖ u u' F0 what₂) ∧
      ∃ (th : TermDef.Term D u u' F0 what₂ → ∀ p, Option ((M p).Cls D.R.rS)) (dn : TermDef.Term D u u' F0 what₂ → ℝ),
        (∀ θ0 : ∀ p, Option ((M p).Cls D.R.rS),
          (∀ w, ∃ S : Finset (PlF D), Formalism.L2.SG.Pf.UnramOff M δ (D.mem u).A.T (D.mem u').A.T θ0 S w) →
          ∀ γ w, EligAt γ w → Formalism.L2.SG.Pf.Restricted θ0 (th γ)) ∧
        (∀ γ w, EligAt γ w → dn γ ≤ supDens L δ ϖ u u' F0 what₂) ∧
        PartnerSumC δ M (PairVal.vRdef D u u' F0 what₂ δ M) th ∧
        FiberCntC δ M (PairVal.vRdef D u u' F0 what₂ δ M) nc th dn

theorem rh33_budget_of_datum {D : Formalism.BasicNotions.D7} (h : RowsDatumP D) : RH33RowsDatumBudgetP D := by
  intro hsig δ M hA L u u' hT hPH F0 what₂ hrows ϖ hϖ nc hnc hbdd
  obtain ⟨hd0, th, dn, hres, hdn, hPS, hFC⟩ := h hsig δ M hA L u u' hT hPH F0 what₂ hrows ϖ hϖ nc hnc
  exact ⟨Real.sSup_nonneg (fun d hd => hd0 d hd), th, dn, hres,
    fun γ w hγ => le_csSup hbdd (hdn γ w hγ), hPS, hFC⟩

section P
variable {D : Formalism.BasicNotions.D7}

theorem rh33_rowsDomAtP_of_budget (hN : SupportG.NormProd D) (hTU : TopUnram D) (hRD : RH33RowsDatumBudgetP D)
    (hTF : ∀ u u' : D.what₂.Word, TermDef.TermsAtFinite D u u') (hsig : (VS D).SigOK) : RowsDomAtP D := by
  classical
  intro Wp Wq _ _ _ _ S δ M hA L u u' hT hPH hC F0 what₂ hrows ϖ hϖ nc hnc α hα hbdd κ hκ Y hY
  obtain ⟨hsd0', th, dn, hres, hdnS, hPS, hFC⟩ := hRD hsig δ M hA L u u' hT hPH F0 what₂ hrows ϖ hϖ nc hnc hbdd
  obtain ⟨θ0, hU⟩ := hTU δ M hA (D.mem u).A.T (D.mem u').A.T
  set sd := supDens L δ ϖ u u' F0 what₂ with hsdd
  have hsd0 : 0 ≤ sd := hsd0'
  have hdn : ∀ γ w, EligAt γ w → dn γ ≤ sd := hdnS
  have hFC' : FiberCntC δ M (PairVal.vRdef D u u' F0 what₂ δ M) (nc * α) th (fun γ => dn γ / α) := by
    intro w hG γ₀ w₀ h0
    have e : (n0 (nc * α) (D.mem u).A.T (D.mem u').A.T w : ℂ) * ((dn γ₀ / α : ℝ) : ℂ) =
        (n0 nc (D.mem u).A.T (D.mem u').A.T w : ℂ) * (dn γ₀ : ℂ) := by
      unfold n0
      push_cast
      field_simp
      try ring
    rw [e]
    exact hFC w hG γ₀ w₀ h0
  have hnc' : 0 < nc * α := mul_pos hnc.1 hα

  let pt0 : Point D.host.E (D.R.rS + 1) := ⟨[(1, D.R.rS + 1)], by simp, by simp⟩
  let wOf : Y → Point D.host.E (D.R.rS + 1) := fun x => (ptOfList (D.R.rS + 1) x.1).getD pt0
  have hP := dom_points hN hA hrows hnc' (PairVal.vRdef D u u' F0 what₂ δ M) hκ (hTF u u') hsig hU (hres θ0 (fun w => (hU w).1))
    (sd / α) (div_nonneg hsd0 hα.le) (fun γ w h => div_le_div_of_nonneg_right (hdn γ w h) hα.le) hPS hFC' wOf
  let φi : Y → ℂ := fun x => if (ptOfList (D.R.rS + 1) x.1).isSome then ((phi (D.R.rS + 1) x.1 : ℝ) : ℂ)⁻¹ else 0
  have hr : (dOf S δ M u u').r = D.R.rS := hC.1
  unfold TB.PSDOn
  rw [hr]
  have key : (Matrix.of fun x y : Y => ((sd / α : ℝ) : ℂ) * (dOf S δ M u u').Kr (D.R.rS + 1) x.1 y.1 -
      rowKer (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) x.1 y.1) =
      (Matrix.diagonal φi).conjTranspose * (Matrix.of fun x y : Y => ((sd / α : ℝ) : ℂ) *
        KtopG M δ (D.mem u).A.T (D.mem u').A.T (wOf x) (wOf y) -
        ∑' ρ, chat (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) ρ (wOf x) *
          star (chat (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) ρ (wOf y))) * Matrix.diagonal φi := by
    ext x y
    rw [Matrix.diagonal_conjTranspose, Matrix.mul_diagonal, Matrix.diagonal_mul, Matrix.of_apply, Matrix.of_apply]
    show _ = star (φi x) * _ * φi y
    rcases hx : ptOfList (D.R.rS + 1) x.1 with _ | wx
    · have h0 : φi x = 0 := by simp [φi, hx]
      rw [h0, star_zero, zero_mul, zero_mul]
      have hK : (dOf S δ M u u').Kr (D.R.rS + 1) x.1 y.1 = 0 := by
        show KrOf δ M (D.mem u).A.T (D.mem u').A.T (D.R.rS + 1) x.1 y.1 = 0
        unfold KrOf
        rw [if_neg (Nat.succ_ne_zero _), if_neg (lt_irrefl _), hx]
      have hR : rowKer (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) x.1 y.1 = 0 := by
        unfold rowKer
        simp [rowVec, hx]
      rw [hK, hR]
      simp
    rcases hy : ptOfList (D.R.rS + 1) y.1 with _ | wy
    · have h0 : φi y = 0 := by simp [φi, hy]
      rw [h0, mul_zero]
      have hK : (dOf S δ M u u').Kr (D.R.rS + 1) x.1 y.1 = 0 := by
        show KrOf δ M (D.mem u).A.T (D.mem u').A.T (D.R.rS + 1) x.1 y.1 = 0
        unfold KrOf
        rw [if_neg (Nat.succ_ne_zero _), if_neg (lt_irrefl _), hx, hy]
      have hR : rowKer (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) x.1 y.1 = 0 := by
        unfold rowKer
        simp [rowVec, hy]
      rw [hK, hR]
      simp
    have hwx : wOf x = wx := by simp [wOf, hx]
    have hwy : wOf y = wy := by simp [wOf, hy]
    have hφx : φi x = ((phi (D.R.rS + 1) x.1 : ℝ) : ℂ)⁻¹ := by simp [φi, hx]
    have hφy : φi y = ((phi (D.R.rS + 1) y.1 : ℝ) : ℂ)⁻¹ := by simp [φi, hy]
    have hx' : Formalism.L2.S.IsPtL x.1 (D.R.rS + 1) := by
      by_contra hn
      simp [ptOfList, isPtL_signPt, hn] at hx
    have hy' : Formalism.L2.S.IsPtL y.1 (D.R.rS + 1) := by
      by_contra hn
      simp [ptOfList, isPtL_signPt, hn] at hy
    have hpx : ((phi (D.R.rS + 1) x.1 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (phi_pos hx').ne'
    have hpy : ((phi (D.R.rS + 1) y.1 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (phi_pos hy').ne'
    have hK : (dOf S δ M u u').Kr (D.R.rS + 1) x.1 y.1 = KtopG M δ (D.mem u).A.T (D.mem u').A.T wx wy /
        (((phi (D.R.rS + 1) x.1 : ℝ) : ℂ) * ((phi (D.R.rS + 1) y.1 : ℝ) : ℂ)) := by
      show KrOf δ M (D.mem u).A.T (D.mem u').A.T (D.R.rS + 1) x.1 y.1 = _
      unfold KrOf
      rw [if_neg (Nat.succ_ne_zero _), if_neg (lt_irrefl _), hx, hy]
      simp only
      rw [Kglob, dif_pos rfl]
    have hR : rowKer (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) x.1 y.1 =
        (∑' ρ, chat (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) ρ wx *
          star (chat (PairVal.vRdef D u u' F0 what₂ δ M) κ (nc * α) ρ wy)) /
        (((phi (D.R.rS + 1) x.1 : ℝ) : ℂ) * ((phi (D.R.rS + 1) y.1 : ℝ) : ℂ)) := by
      unfold rowKer
      rw [← tsum_div_const]
      refine tsum_congr fun ρ => ?_
      rw [rowVec_eq_chat _ _ _ ρ x.1 wx hx, rowVec_eq_chat _ _ _ ρ y.1 wy hy]
      simp only [Complex.star_def, map_div₀, Complex.conj_ofReal]
      field_simp
    rw [hK, hR, hwx, hwy, hφx, hφy]
    simp only [star_inv₀, Complex.star_def, Complex.conj_ofReal]
    field_simp
  rw [key]
  exact hP.conjTranspose_mul_mul_same _

theorem rh33_rowsInputP_of_budget (hN : SupportG.NormProd D) (hTU : TopUnram D) (hRD : RH33RowsDatumBudgetP D)
    (hTF : ∀ u u' : D.what₂.Word, TermDef.TermsAtFinite D u u') (hsig : (VS D).SigOK) : RowsInputP D :=
  rowsInputP_of Formalism.L2.SG.Closed.ScalarEquivG_holds
    (fun u u' => Formalism.L2.SG.Closed.ScalarRepFree_holds (D := D) (u := u'))
    (rowsFinAt_of hTF hsig) (rh33_rowsDomAtP_of_budget hN hTU hRD hTF hsig)

theorem rh33_original_bridge (hN : SupportG.NormProd D) (hTU : TopUnram D) (hRD : RowsDatumP D)
    (hTF : ∀ u u' : D.what₂.Word, TermDef.TermsAtFinite D u u') (hsig : (VS D).SigOK) : RowsInputP D := by
  first
  | (rh_reduce 2 using [rh33_rowsInputP_of_budget, rh33_budget_of_datum]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh33_rowsInputP_of_budget hN hTU (rh33_budget_of_datum hRD) hTF hsig

end P

rh_scan rowsDomAtP_of limit 2000
rh_scan rh33_rowsDomAtP_of_budget limit 2000
rh_scan rh33_rowsInputP_of_budget limit 2000
rh_prune rh33_budget_of_datum as RH33BudgetPruned
#print axioms rowsDomAtP_of
#print axioms rh33_budget_of_datum
#print axioms rh33_rowsDomAtP_of_budget
#print axioms rh33_rowsInputP_of_budget
#print axioms rh33_original_bridge

end Formalism.L2.SG.DataCut
