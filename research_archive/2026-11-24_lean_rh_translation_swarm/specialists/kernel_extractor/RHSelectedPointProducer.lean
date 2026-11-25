import Mathlib
import Development.AutomorphicArithmetic.CharacterBoxes.Supply
import Development.AbelianVarietyTheory.Definitions.GlobalTwisting.ValidForConstructedPointClassesEventuallyWorking
import Formalism.SharpRestriction.GlobalSchurBounds.ThickPlacesCorollaryOfAnyTranslate
import Development.AbelianVarietyTheory.Definitions.GlobalTwisting.LogCondLeThree
import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.HasWithDutyWallAndChoices

open Formalism.BasicNotions Formalism.MainNotions Formalism.MainNotions.Inhab Formalism.L2.Host GlobalTheory.EX GlobalTheory.EX.OB GlobalTheory.Mem GlobalTheory.Mem.Top GlobalTheory.Fc NumberField IsDedekindDomain

namespace UpperTheory.Top

open GlobalTheory.Fc

/-! Prepared source transformation of pinned KitS.lean 0c36d8f9f09fc160cb21149253a5bb53f0553c14.
No native compilation yet. Does not assert existence of RH or eliminate ObjCP.
The next bridge must derive the actual quantitative gap bound pointwise rather
than reintroduce FamCore.coverS or Kit coverage. -/

/-- The selected start is a function of the shared arithmetic data only.
This is a pointwise producer, not a Kit or FamP (which require full coverage). -/
abbrev StartSelector := (s : Scale) → (R : Ranks) → Host R →
  (R.A → ℤ) → (R.A → ℤ) → Fin R.n

def SelectedPointCPW (la : ℝ) (Q : Par → PtProp) (G : FReq)
    (select : StartSelector) : Prop :=
  ∃ ε0 : ℝ, 0 < ε0 ∧ ∀ eps : ℝ, 0 < eps → eps ≤ ε0 → eps < 1 / 52 →
    ∃ (CT2 C8 C5 c6 Cb : ℝ) (K0 : TransportedAlt),
    1 ≤ C8 ∧ 0 < C5 ∧ 0 < c6 ∧ 0 < Cb ∧
    ∀ C : FC, Std C → C.CT2 = CT2 → C.P.Cpde = C8 → C.Large K0 C.P.CF →
      ∃ c1 : ℝ, ∀ cD ≥ c1, ∃ c2 : ℝ, ∀ ch ≥ c2,
      ∃ x0 : ℝ, ∃ S : Scales la, ∀ s : Scale, s.eps = eps → x0 ≤ s.x → S.Mem s →
        ∃ (R : Ranks) (H : Host R) (q0 : ℕ) (a b : R.A → ℤ)
          (M : ℕ) (c : Fin M → Fin (R.k - 2) → Bool) (p : Pt C),
          RankVal s R ∧ H.CT2 = CT2 ∧ HostGood s C8 C5 c6 Cb H q0 ∧
          q0 = DC.q0H H ∧
          (∀ t, t ∉ H.TT → a t = 0 ∧ b t = 0) ∧
          WinOK s C.GK H a b ∧ WOK s cD ch C.GK H a b ∧ G.req C5 s R H q0 ∧
          M = ⌈3 * Real.exp (C.CGam * (R.m : ℝ) ^ 5 * R.f * s.L) ^ 2 * s.x ^ C.P.CF⌉₊ ∧
          Function.Injective c ∧
          p.L.sc = s ∧ Val C cD ch p.L ∧ HostArith p.D.host ∧
          p.From H a b c (select s R H a b).1 ∧ CanonInst p.ta.Gx ∧
          p.Has (((withDuty (Q ⟨eps, C, cD, ch, C5, c6, Cb⟩)).and DC.WallPt).and G.pt) ∧
          ThickSetLowerBound p.L ∧ ChBad_at p.ta.Gx Cb ∧
          ChQD_at p.D p.L.sc.x p.L.sc.eps C5

/-- Source-matched specialization of kitS. The universal ObjCP supplier is
retained; its application is made at just one preselected start. -/
theorem selectedPointS : ∀ (Q : Par → PtProp) (la : ℝ) (G : FReq)
    (select : StartSelector), DC.HostWW la G.req → ObjCP Q →
    SelectedPointCPW la Q G select := by
  intro Q la G select hHost hObj
  unfold SelectedPointCPW
  obtain ⟨εH, hεH, hHost⟩ := hHost
  obtain ⟨εO, hεO, hObj⟩ := hObj
  refine ⟨min εH εO, lt_min hεH hεO, fun eps he he0 he1 => ?_⟩
  obtain ⟨CT2, C8, C5, c6, Cb, KW, h8, h5, h6, hb, hHost⟩ := hHost eps he (he0.trans (min_le_left _ _)) he1
  obtain ⟨KO, hObj⟩ := hObj eps C8 C5 c6 Cb he (he0.trans (min_le_right _ _)) he1 h8
  refine ⟨CT2, C8, C5, c6, Cb, KW.sup KO, h8, h5, h6, hb, fun C hC hT hP hL => ?_⟩
  obtain ⟨hLW, hLO⟩ := fc_large_of_sup hL
  obtain ⟨c1, hObj⟩ := hObj C hC hP hLO
  obtain ⟨c1', hHost⟩ := hHost C hC hT hP hLW
  refine ⟨max c1 c1', fun cD hcD => ?_⟩
  obtain ⟨c2, hObj⟩ := hObj cD ((le_max_left _ _).trans hcD)
  obtain ⟨c2', hHost⟩ := hHost cD ((le_max_right _ _).trans hcD)
  refine ⟨max c2 c2', fun ch hch => ?_⟩
  obtain ⟨xO, hObj⟩ := hObj ch ((le_max_left _ _).trans hch)
  obtain ⟨xH, S, hHost⟩ := hHost ch ((le_max_right _ _).trans hch)
  have hmid := hC.2.2.2.2.2.2.2.2.2.2.2.2.2.2.1
  have hG : 0 ≤ C.CGam := zero_le_one.trans (hmid _ (by simp [FC.cMid]))
  have hF : 0 ≤ C.P.CF := zero_le_one.trans (hmid _ (by simp [FC.cMid]))
  obtain ⟨xC, hCode⟩ := exists_injective_words eps C.CGam C.P.CF he he1 hG hF
  obtain ⟨xq, hq⟩ := small_prime_lt eps C8 he h8
  refine ⟨max (max xH xO) (max xC xq), S, fun s hs hx hmem => ?_⟩
  simp only [max_le_iff] at hx
  obtain ⟨⟨hxH, hxO⟩, hxC, hxq⟩ := hx
  obtain ⟨R, H, q0, a, b, hRV, hHT, hH, hqH, h0, hWin, hW, hGq⟩ := hHost s hs hxH hmem
  obtain ⟨c, hc, -⟩ := hCode s R hs hxC hRV
  have hHT' : H.CT2 = C.CT2 := hHT.trans hT.symm
  have hq0 : (q0 : ℝ) < s.X' := by
    have hqp : (0 : ℝ) < H.q := by exact_mod_cast H.hyp.1.pos
    have hdp : (0 : ℝ) < H.d := by exact_mod_cast H.hyp.2.1.pos
    have hn' : (0 : ℝ) < H.QS := by exact_mod_cast H.QS_pos
    exact hq s _ q0 hs hxq (by positivity) hH.1.log_cond_le hH.2.2.2.2.2.2.2.2.2.2.2.2.1.2.2.1
  let i := select s R H a b
  obtain ⟨p, hsc, hval, har, hfrom, hcan, hhas⟩ :=
    hObj s R H q0 a b _ c i.1 hs hxO hRV hHT'
      (by show HostGood s C.P.Cpde C5 c6 Cb H q0; rw [hP]; exact hH)
      hqH hWin rfl hc i.2
  have hd := DC.has_withDuty_wall_and_choices (C8 := C8) (c6 := c6)
    (q0 := q0) p hC hHT' (by rw [hsc]; exact hH)
    (by rw [hsc]; exact hq0) h0 (by rw [hsc]; exact hW) hval hfrom hcan hhas
  exact ⟨R, H, q0, a, b, _, c, p, hRV, hHT, hH, hqH, h0, hWin, hW, hGq,
    rfl, hc, hsc, hval, har, hfrom, hcan,
    ⟨hd.1, G.at_of_from hfrom (by rw [hsc]; exact hGq)⟩, hd.2⟩

#print axioms selectedPointS

end UpperTheory.Top
