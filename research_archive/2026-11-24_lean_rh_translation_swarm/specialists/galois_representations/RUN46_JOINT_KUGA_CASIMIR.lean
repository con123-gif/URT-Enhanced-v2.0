import Development.WeilBound.RepresentationTheoryGL.CasimirAlgebra.KugaCoordinates.ClozelCohomological
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46 lane 5 — 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005.
Current upstream de0d3a3f06d2fb093eee6a2a685225895c90c3ac (not migrated).
Recent peer commits examined by message: 846e90ec, f4dbaa92, 92d36547, 1208fb87,
5f0e858f, 5d4f6c50, c46be9ef, 65d0f958, 3bdeddd5. RUN45 remains intact.
Actual native Clozel branch (RUN45 -> CardK/P -> clozelCohC -> clozelCohomological
-> of_three -> of_rest -> kugaGlue_holds -> kugaAbs_holds).
Original supplier requires global pointwise Casimir sign on every x, then uses
separate nonnegativity of the contraction. But the exact kHom identity, before
any norms, gives Re <dω,dω> = (q+1)(Cω - Tω), with Cω and Tω the two real
finite sums in KugaJoint46. Thus the one signed joint inequality Cω <= Tω
on the actual cochain suffices; positivity and spanning imply dω=0. Neither
pointwise sign nor separate nonnegativity is needed at that energy consumer.
Strict weakening of scalar conditions: C=1,T=2 meets joint bound, not C<=0;
C=-2,T=-1 meets joint bound, not T>=0. These examples are scalar negative
controls, not claimed realizable counterexamples to all Kuga premises.
KugaGlue's CxExpand binder is literally ignored in pinned source (intro _).
Candidate glue supplies the joint budget from the original hcasI and
kT_nonneg, preserving the original caller and same cochain, degree and host.
This establishes a proposed replacement interface, not a new independent
proof of the Casimir estimate or of RH. Other exact CxExpand consumers stay.
Original and reduced selected source graphs:
 old: Clozel -> of_rest -> KugaGlue(KugaAbs,Frame,FrameCas,CxExpand,TensForm,Harmonic)
     -> kugaAbs -> kHom,kIp_kD,kT_nonneg,pointwise hcas,span,positivity.
 new: Clozel46 -> kugaGlue46(KugaJoint46,Frame,FrameCas,TensForm,Harmonic)
     -> kugaJoint46 -> kHom,kIp_kD,joint budget,span,positivity.
 Native joint supplier still uses hcasI and kT_nonneg; no global removal of
 those dependencies claimed. Original fallback and all Coef, WhitLie,
 KType, KData, GKData, CharInt, UnitTw and transport branches preserved.
 Context cache key: source pin, toolchain, E,a,π,Ξ,q,ω,frame,twist,B and operators.
 Sources under src/Development/WeilBound/RepresentationTheoryGL/CasimirAlgebra/KugaCoordinates/:
KugaSt.lean 0fe4113f8d45c97e1d457a1731aefe7a655942ac
KugaAbsoluteValues/KugaAbsHolds.lean 11d9b7424eba7cc052b71466d3b7c0041e91e8e9
KugaGluing/KugaGlueHolds.lean 18dd01f68af6fcf92e33e098eac1e3c764677c66
IsStarRep.lean d68dfdbae5c0fe81241ab1b8e3a8e16618dece7e
ClozelCohomologicalOfRest.lean d99709046a6bb8de2c6b746191ad56cdfe75c6da
ClozelCohomologicalOfThree.lean a85fbc108cf255b44476297ba65b8e9c18f9c3ac
ClozelCohomological.lean 081eca8b2cfd6af2227a48c6f6150daadbbea136
Executed V8 18 fail-on-error structural/source checks and 609
exact small integer sign-budget checks (not Lean or evidence about RH).
No local lean/lake/elan. Historical status.json outputs for runs 45577239749
and 45576756833 retrieved and read; baseline success only. No candidate CI
output exists in this run. New kernel closure: 0. Axiom and constructor
ledgers pending; original graph retained.
RESUME HERE: replay this candidate and RUN45 at native caller; compare
kugaGlue46 vs kugaGlue_holds dependencies incl. constructor roles, then seek
direct SAME-cochain joint Casimir/contraction estimate rather than global
pointwise Casimir control; do not claim removal until actual caller checks.
HANDOFF TO kernel, literature, audit, integration. RH OPEN.
-/

noncomputable section
open Fin Function
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh GlobalTheory.WigAlg Formalism.REAL
open scoped TensorProduct
namespace PositivityTheory.Rg.Cz
open J

def KugaJoint46 : Prop :=
  ∀ (P : Type) [AddCommGroup P] [Module ℝ P] (M : Type) [AddCommGroup M] [Module ℂ M] [Module ℝ M] [IsScalarTower ℝ ℂ M]
    (β γ : Type) [Fintype β] [Fintype γ] (b : β → P) (B : M →ₗ[ℂ] M →ₗ⋆[ℂ] ℂ)
    (a r : P →ₗ[ℝ] Module.End ℂ M) (a' r' : γ → Module.End ℂ M) (D : γ → P →ₗ[ℝ] P) (c : β → β → γ → ℝ),
    Submodule.span ℝ (Set.range b) = ⊤ → (∀ x y, B y x = starRingEnd ℂ (B x y)) → (∀ x, x ≠ 0 → 0 < (B x x).re) →
    (∀ X x y, B (a X x) y = -B x (a X y)) → (∀ X x y, B (r X x) y = B x (r X y)) →
    (∀ X Y, Commute (a X) (r Y)) → (∀ k, Commute (a' k) (r' k)) →
    (∀ i j, a (b i) * a (b j) - a (b j) * a (b i) = ∑ k, (c i j k : ℂ) • a' k) →
    (∀ i j, r (b i) * r (b j) - r (b j) * r (b i) = ∑ k, (c i j k : ℂ) • r' k) →
    (∀ i j k, c j i k = -c i j k) → (∀ k j, D k (b j) = ∑ i, c i j k • b i) →
    ∀ (q : ℕ) (ω : P [⋀^Fin q]→ₗ[ℝ] M),
      (∀ k (Y : Fin q → P), (a' k + r' k) (ω Y) = ∑ s, ω (Function.update Y s (D k (Y s)))) →
      (∑ J : Fin q → β, (B (ω (b ∘ J))
        (((∑ i, r (b i) * r (b i) - ∑ k, r' k * r' k) - (∑ i, a (b i) * a (b i) - ∑ k, a' k * a' k) :
          Module.End ℂ M) (ω (b ∘ J)))).re) ≤
      (∑ J : Fin q → β, (B (ω (b ∘ J))
        (∑ s, ∑ i, (a + r) (b (J s)) ((r - a) (b i) (ω (Function.update (b ∘ J) s (b i)))))).re) →
      ∀ X : Fin (q + 1) → P, ∑ i : Fin (q + 1), (-1 : ℤ) ^ (i : ℕ) • (a (X i) + r (X i)) (ω (i.removeNth X)) = 0


theorem kugaJoint46_holds : KugaJoint46 := by
  intro P _ _ M _ _ _ _ β γ _ _ b B a r a' r' D c hb hB hpos ha hr har ha'r' hca hcr hc hD q ω hω hcas X
  have hadj : ∀ X x y, B ((a + r) X x) y = B x ((r - a) X y) := by
    intro X x y
    simp only [LinearMap.add_apply, LinearMap.sub_apply, map_add, map_sub, ha, hr]
    ring
  have hzero : kD (a + r) ω = 0 := by
    apply kAlt_eq_zero b hb
    have hK : ∀ J : Fin q → β, kDel (r - a) b (kD (a + r) ω) (b ∘ J) =
        ((∑ i, r (b i) * r (b i) - ∑ k, r' k * r' k) - (∑ i, a (b i) * a (b i) - ∑ k, a' k * a' k) :
          Module.End ℂ M) (ω (b ∘ J)) -
        ∑ s, ∑ i, (a + r) (b (J s)) ((r - a) (b i) (ω (Function.update (b ∘ J) s (b i)))) :=
      fun J => eq_sub_of_add_eq (kHom b a r a' r' D c har ha'r' hca hcr hc hD ω hω J)
    have hA := kIp_kD B b (a + r) (r - a) hadj ω (kD (a + r) ω)
    have h1 : (kIp B b ω (kDel (r - a) b (kD (a + r) ω))).re ≤ 0 := by
      unfold kIp
      simp only [hK, map_sub, Finset.sum_sub_distrib, Complex.sub_re]
      rw [Complex.re_sum, Complex.re_sum]
      linarith [hcas]
    have h4 : (kIp B b (kD (a + r) ω) (kD (a + r) ω)).re ≤ 0 := by
      rw [hA, Complex.mul_re]
      have : (((q : ℂ) + 1)).im = 0 := by simp
      rw [this, zero_mul, sub_zero]
      have : (((q : ℂ) + 1)).re = (q : ℝ) + 1 := by simp
      rw [this]
      exact mul_nonpos_of_nonneg_of_nonpos (by positivity) h1
    unfold kIp at h4
    rw [Complex.re_sum] at h4
    have h5 := (Finset.sum_eq_zero_iff_of_nonneg (fun I (_ : I ∈ Finset.univ) =>
      kB_re_nonneg B hpos (kD (a + r) ω (b ∘ I)))).1
      (le_antisymm h4 (Finset.sum_nonneg (fun I _ => kB_re_nonneg B hpos _)))
    intro I
    by_contra hI
    exact (hpos _ hI).ne' (h5 I (Finset.mem_univ _))
  have := congrArg (fun f => f X) hzero
  simpa [kD_apply] using this


set_option maxHeartbeats 800000 in
theorem kugaGlue46 (hK : KugaJoint46) (hF : Frame) (hC : FrameCas)
    (hT : TensForm) (hH : Harmonic) : Kuga := by
  intro E _ _ _ a π Ξ hU hS q₀ ω₀ hω₀ h0
  refine hH E a _ (tensorK π Ξ) (tensorLie π Ξ) (fun q ω hω => ?_) q₀ ω₀ hω₀ h0
  obtain ⟨Hf, σ, hHs, hHp, hHl⟩ := hU
  obtain ⟨B, hB1, hB2, hB3, hB4⟩ := hT π.V Ξ.d Hf hHs hHp
  obtain ⟨hspan, c, hc, hbr, hbr2⟩ := hF E a
  choose cc tt hcas htr htrX hle using hS.2
  have hZ : ∀ k, star (iM (fr (E := E) (a := a) k).1) = -iM (fr k).1 := fun k => kg_star_iM (fr k).2
  have hreal : ∀ X : Lie E a, starRingEnd ℂ (kgT X) = kgT X := fun X => kgT_star X

  have hskew : ∀ (X : Herm E a) (x y : π.V ⊗[ℂ] (Fin Ξ.d → ℂ)),
      B ((kgA π Ξ σ).comp kgH X x) y = -B x ((kgA π Ξ σ).comp kgH X y) := by
    intro X x y
    have h1 := kg_form_rTensor Hf B hB3 (lieOp π (toL X.1)) (σ * kgT (toL X.1)) (fun φ ψ => hHl _ φ ψ) x y
    have hs := hreal (toL X.1)
    rw [LinearMap.comp_apply, show kgH X = toL X.1 from rfl, kgA_apply]
    simp only [LinearMap.add_apply, LinearMap.smul_apply, Module.End.one_apply, map_add, map_smul,
      LinearMap.map_smulₛₗ, smul_eq_mul, map_mul, map_neg, Complex.conj_ofReal, map_div₀, map_ofNat, hs]
    linear_combination h1
  have hherm : ∀ (X : Herm E a) (x y : π.V ⊗[ℂ] (Fin Ξ.d → ℂ)),
      B ((kgR π Ξ σ).comp kgH X x) y = B x ((kgR π Ξ σ).comp kgH X y) := by
    intro X x y
    have hD : (Ξ.dmat (toL X.1))ᴴ = Ξ.dmat (toL X.1) := by
      rw [← hS.1, show star X.1 = X.1 from X.2]
    have h2 := kg_form_lTensor Hf B hB3 _ hD x y
    have hs := hreal (toL X.1)
    rw [LinearMap.comp_apply, show kgH X = toL X.1 from rfl, kgR_apply]
    simp only [LinearMap.add_apply, LinearMap.smul_apply, Module.End.one_apply, map_add, map_smul,
      LinearMap.map_smulₛₗ, smul_eq_mul, map_mul, map_neg, Complex.conj_ofReal, map_div₀, map_ofNat, hs]
    linear_combination h2

  have hbrA : ∀ i j, (kgA π Ξ σ).comp kgH (fr i) * (kgA π Ξ σ).comp kgH (fr j) -
      (kgA π Ξ σ).comp kgH (fr j) * (kgA π Ξ σ).comp kgH (fr i) =
      ∑ k, (c i j k : ℂ) • kgA π Ξ σ (toL (iM (fr k).1)) := by
    intro i j
    show kgA π Ξ σ (toL (fr i).1) * kgA π Ξ σ (toL (fr j).1) - kgA π Ξ σ (toL (fr j).1) * kgA π Ξ σ (toL (fr i).1) = _
    rw [kgA_comm, hbr i j, show toL (∑ k, c i j k • iM (fr k).1) = kgL (∑ k, c i j k • iM (fr k).1) from rfl,
      map_sum, map_sum]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [map_smul, map_smul, ← algebraMap_smul ℂ (c i j k)]
    rfl
  have hbrR : ∀ i j, (kgR π Ξ σ).comp kgH (fr i) * (kgR π Ξ σ).comp kgH (fr j) -
      (kgR π Ξ σ).comp kgH (fr j) * (kgR π Ξ σ).comp kgH (fr i) =
      ∑ k, (c i j k : ℂ) • kgR π Ξ σ (toL (iM (fr k).1)) := by
    intro i j
    show kgR π Ξ σ (toL (fr i).1) * kgR π Ξ σ (toL (fr j).1) - kgR π Ξ σ (toL (fr j).1) * kgR π Ξ σ (toL (fr i).1) = _
    rw [kgR_comm, hbr i j, show toL (∑ k, c i j k • iM (fr k).1) = kgL (∑ k, c i j k • iM (fr k).1) from rfl,
      map_sum, map_sum]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [map_smul, map_smul, ← algebraMap_smul ℂ (c i j k)]
    rfl
  have hDk : ∀ k j, kgD _ (hZ k) (fr j) = ∑ i, c i j k • fr i := fun k j => Subtype.ext (by
    rw [kgD_val, Submodule.coe_sum]
    simp only [Submodule.coe_smul]
    exact hbr2 k j)

  have hinv : ∀ k (Y : Fin q → Herm E a), (kgA π Ξ σ (toL (iM (fr k).1)) + kgR π Ξ σ (toL (iM (fr k).1))) (ω Y) =
      ∑ s, ω (Function.update Y s (kgD _ (hZ k) (Y s))) := by
    intro k Y
    obtain ⟨S, hS1, hS2⟩ := GlobalTheory.WigSep.exists_separating_functionals E a π Ξ
    obtain ⟨cv, hc0, hcd⟩ := GlobalTheory.WigCurve.exists_kinf_curve_tangent E a _ (hZ k)
    rw [kgA_add_kgR]
    exact GlobalTheory.CochainInv.lie_apply_eq_sum E a _ (tensorK π Ξ) (tensorLie π Ξ) S cv _ (hZ k) hc0 hcd hS1
      (hS2 cv _ hc0 hcd) q ω hω Y _ (fun s => rfl)

  have hcasI : ∀ x : π.V ⊗[ℂ] (Fin Ξ.d → ℂ),
      (B (((∑ i, (kgR π Ξ σ).comp kgH (fr i) * (kgR π Ξ σ).comp kgH (fr i) -
        ∑ k, kgR π Ξ σ (toL (iM (fr k).1)) * kgR π Ξ σ (toL (iM (fr k).1))) -
        (∑ i, (kgA π Ξ σ).comp kgH (fr i) * (kgA π Ξ σ).comp kgH (fr i) -
        ∑ k, kgA π Ξ σ (toL (iM (fr k).1)) * kgA π Ξ σ (toL (iM (fr k).1))) :
          Module.End ℂ (π.V ⊗[ℂ] (Fin Ξ.d → ℂ))) x) x).re ≤ 0 := by
    intro x
    have e := kg_casDiff π Ξ σ hC cc tt hcas htr htrX
    have h := kg_re_le B _ cc (fun τ y => hB4 _ (cc τ) (kg_cas_herm Ξ hS.1 τ) (hle τ) y) x
    rw [← e] at h
    exact h

  have key := hK (Herm E a) (π.V ⊗[ℂ] (Fin Ξ.d → ℂ)) _ _ fr B ((kgA π Ξ σ).comp kgH) ((kgR π Ξ σ).comp kgH)
    (fun k => kgA π Ξ σ (toL (iM (fr k).1))) (fun k => kgR π Ξ σ (toL (iM (fr k).1))) (fun k => kgD _ (hZ k)) c
    hspan hB1 hB2 hskew hherm (fun X Y => kgA_kgR_comm π Ξ σ _ _) (fun k => kgA_kgR_comm π Ξ σ _ _) hbrA hbrR hc hDk
    q ω hinv (by
      have hT' := kT_nonneg B fr ((kgA π Ξ σ).comp kgH + (kgR π Ξ σ).comp kgH)
        ((kgR π Ξ σ).comp kgH - (kgA π Ξ σ).comp kgH) hB1 hB2
        (by
          intro X x y
          simp only [LinearMap.add_apply, LinearMap.sub_apply, map_add, map_sub, hskew, hherm]
          ring) ω
      rw [Complex.re_sum] at hT'
      exact (Finset.sum_nonpos (fun J _ => by
        rw [hB1]
        simpa using hcasI (ω (fr ∘ J)))).trans hT')
  refine AlternatingMap.ext fun X => ?_
  rw [dCo_apply, AlternatingMap.zero_apply, ← key X]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [LinearMap.comp_apply, LinearMap.comp_apply, kgA_add_kgR]
  rfl


theorem clozelCohomological46 : GlobalTheory.Published.ClozelCohomological :=
  clozelCohomological_of kType_holds J.kData_holds GK.gkData_holds whitLie_holds
    GlobalTheory.CompanionTheory.RgCz.charInt J.unitTw_holds
    (coefGlue_holds casBound_holds J.bigRep_holds J.bigCx_holds J.summand_holds Coch.cochain_holds J.casVal_holds)
    (kugaGlue46 kugaJoint46_holds J.frame_holds GlobalTheory.CompanionTheory.FrameCasimir.frameCas
      J.tensForm_holds GlobalTheory.CompanionTheory.GKHarmonic.harmonic)

example : GlobalTheory.Published.ClozelCohomological := by
  first | (rh_reduce 2 using [clozelCohomological46]; done)
        | (rh_auto 2; done)
        | (rh_auto_frontier 2; done)
        | exact clozelCohomological46

end PositivityTheory.Rg.Cz

rh_prune PositivityTheory.Rg.Cz.kugaGlue_holds as RH46KugaGluePruned
rh_scan PositivityTheory.Rg.Cz.kugaGlue_holds limit 2000
rh_scan PositivityTheory.Rg.Cz.kugaGlue46 limit 2000
rh_scan PositivityTheory.Rg.Cz.kugaJoint46_holds limit 2000
rh_scan PositivityTheory.Rg.Cz.clozelCohomological limit 2000
rh_scan PositivityTheory.Rg.Cz.clozelCohomological46 limit 2000
#print axioms PositivityTheory.Rg.Cz.kugaJoint46_holds
#print axioms PositivityTheory.Rg.Cz.kugaGlue46
#print axioms PositivityTheory.Rg.Cz.clozelCohomological46
