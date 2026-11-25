import Formalism.LocalToGlobal.SiegelLatticeTheory.CokernelGLCounts.RankPointCounts.FiberCountTh
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN35 — direct mass matching at actual fibre count, 25 Nov 2026.
SOURCE-MATCHED conditional human reduction; PREPARED, NOT compiled. RH OPEN.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Read latest mission (including mandatory engine and critical frontier), SWARM,
HANDOFF, EXPANSION, AGENTS, research/continuity excerpts, living proof and
latest peer results fedd3a7e, f5cc7b7b, 04a29a86, 620547cb, dc06e2cf,
027167d4. No duplication of signature/cohomology/Landau work.
Pinned source directory src/Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/
FiberCount.lean 5e5e6bec11ec25a23869cbf90e2a303ebfb6d7cd (fiberCount_of)
FiberCountTh.lean (fiberCount_of_rest actual caller)
LsDatumBCut.lean (FiberCount and CutAt definitions)
LsDatumBPf.lean 6f752fd3b9670a2b1630679401aec7b03b22b76b
RowsInputPOfTermsFiniteSig.lean c01da1ef958071738274486ac807f2ed21c85ce5
DataCut.lean ba94a5f0910644b63687222a7a3a3affcff8fe82 (dom_points)
All original artifacts and role graphs retained. This is source-visible
consumer chain, not a newly authenticated elaborated root path.

Human derivation for the living proof:
Fix actual same D, delta, M, L, u,u', F0, rows, nc, uniformizer, w,w0,
eligible gamma0 and rational matrix Z. A fiber with incompatible local
class or missing rational matrix has zero mass by the retained zero/
empty cases. In the compatible case the native local indicators eL are
all 1, so their product is 1. The exact complex HasSum over eligible
terms in the fiber is the REAL row mass nu(Z), embedded in C, by FibSum
and the native subtype bijection. Thus the only missing nonzero-fiber
identity is
    nu(Z) = n0(nc,w) * dnT(gamma0).
This direct mass matching, not pointwise equality of every local density,
suffices. It is required only for actual compatible Z, same kind and
eligible representative. No phase/partner identity or multiplicity is
discarded. The original proof supplies mass matching by TotPos from
EligPos and kind, Formula, GOfMat and the product of DensTh equalities;
the bridge below reconstructs that exact argument without invoking
fiberCount_of. The reduced consumer absorbs ThSome, DensTh, GOfMat,
EligPos into one scalar premise. Other consumers retain those facts.

Run32 raw mass shows what is needed to prove this new premise directly:
if Z integral and the row mass A>0, require
 cMass*q(Z)^(k-1)*product_p(alpha_p(k-1)/alpha_p(k-1-j_p(Z)))
       = A*n0(nc,w)*dnT(gamma0).
For nonintegral Z retain zero and prove RHS zero if that case is
compatible. Do not divide by A without positivity. A bare upper bound
on nu cannot replace an exact fiber identity; the later PSD majorant
uses the exact HasSum. No direct raw-mass equality across all compatible
matrices has been proved, and native Formula remains an input (including
its finite-count projection). No new bound on supDens or RH scale.
Original graph fiberCount_of_rest -> fiberCount_of -> ThSome,DensTh,
GOfMat,EligPos,FibSum,other exact local/zero cases.
Reduced rh35_fiberCount_of_mass -> direct mass premise,FibSum,other
exact local/zero cases; original bridge restores all original edges.
Cache key includes pin/toolchain and all instantiated data above, not
declaration alone. Original fallback retained; no global deletion.
Executed source checks: unique exact replacements and byte-for-byte
reverse reconstruction of original theorem, retained exact original
caller and CutAt anchor; no runtime/URT performance claim. Earlier
CI run 45577239749 and 45576756833 status pass returncode 0 retrieved
this run; they did not compile this certificate. New axiom evidence
pending; no root obligation retired. Native commands below are prepared
for exact pinned built imports, not executed here.

RESUME HERE: replay this and RUN32/RUN33 in existing pinned batch; verify
actual caller/axiom evidence. Prove the displayed raw-mass identity by
matching the local Jordan rank corrections for compatible Z, or retain
the original DensTh proof (do not confuse count bound with equality).
Retain actual same-host VWinAt rank/count, entropy, local-gain and
cohomology suppliers. HANDOFF TO kernel, geometry, integration, audit.
-/
noncomputable section

namespace Formalism.L2.SG.Pf.FCount

open NumberField Formalism.BasicNotions Formalism.MainNotions.S Formalism.MainNotions.S.Lat Formalism.MainNotions.S.LocalSplitGroups Formalism.L2.SG.TermDef Formalism.L2.SG.DataCut
  Formalism.L2.SG.LsDatumB Formalism.L2.SG.Pf.PCount
open Classical ValuativeRel
open Formalism.L2.SG.Pf.AtPt Formalism.L2.SG.TermLoc

attribute [local instance] Formalism.BasicNotions.Host.cmStar

section Assembly

variable {D : Formalism.BasicNotions.D7} {M : ∀ p : PlF D, Loc.Model (D.s.atP p).Fp (D.s.atP p).Ep}
  {δ : ∀ p : PlF D, (D.s.atP p).Fp} {L : CntLocal.LocSp D M} {u u' : D.what₂.Word}
  {F0 : FlagG (VS D) D.R.rS (CntLocal.Tn u)} {what₂ : Finset (Submodule (𝓞 D.host.E) (VS D).V)}

theorem rh35_fiberCount_of_mass {θ0 : ∀ p, Option ((M p).Cls D.R.rS)}
    (hA : ∀ p, Agree δ M p) (hT : (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Lat.gS D) ^ 2])
    (hPH : PrimeHyp D u (Tu D u'))
    (hU : LocUnram M δ u u' θ0) (hR : ThRestricted M δ u u' F0 what₂ θ0)
    (hrows : IsRowReps D F0 what₂) (hN : PairVal.NormRepExists D u u' F0 what₂) (hRel : EligRel u u' F0 what₂)
    (hRs : Restr M δ u u' F0 what₂) (hE : Exist M δ u u')
    (hTT : ThOfTup M δ u u' F0 what₂) (hTC : ThOfCls M δ u u') (hFS : FibSum M δ u u' F0 what₂)
    (hNN : NuNotCls M δ u u' F0 what₂)
    (hMass : ∀ (nc : ℝ), CntLocal.Formula δ L u u' F0 what₂ nc →
      ∀ (ϖ : ∀ p : PlF D, 𝒪[(D.s.atP p).Fp]), (∀ p, Irreducible (ϖ p)) →
      ∀ (w w₀ : Point D.host.E (D.R.rS + 1)) (Z : PairVal.MatR D)
        (γ₀ : TermDef.Term D u u' F0 what₂), AtMat w Z → EligAt γ₀ w₀ → kind w = kind w₀ →
        (∀ p, thZ M δ u u' w Z p = thT M δ γ₀ p) →
        (∀ p, IsLCls M δ (D.mem u).A.T (D.mem u').A.T p w (tupZ M δ u u' Z p)) →
        (n0 nc (D.mem u).A.T (D.mem u').A.T w : ℂ) * (dnT M δ L ϖ γ₀ : ℂ) =
          (CntLocal.nu (CntLocal.Tn u') F0 what₂ Z : ℂ)) : FiberCount M δ L u u' F0 what₂ := by
  intro nc hForm ϖ hϖ w hG γ₀ w₀ hγ₀ hk
  refine ⟨fun γ hγ => hRs γ w hγ, fun x => ?_⟩

  obtain ⟨S, hS0⟩ := hU w hG
  have hRf := hR γ₀ w₀ hγ₀
  have hone : ∀ p ∉ S ∪ hRf.toFinset ∪ x.2.toFinset,
      eL M δ (D.mem u).A.T (D.mem u').A.T p w (thT M δ γ₀ p) (x.1 p) = 1 := by
    intro p hp
    have hpS : p ∉ S := fun h => hp (Finset.mem_union_left _ (Finset.mem_union_left _ h))
    have hth : thT M δ γ₀ p = θ0 p := by
      by_contra h
      exact hp (Finset.mem_union_left _ (Finset.mem_union_right _ (hRf.mem_toFinset.2 h)))
    have hxp : x.1 p = x0L M δ (D.mem u).A.T (D.mem u').A.T p w := by
      by_contra h
      exact hp (Finset.mem_union_right _ (x.2.mem_toFinset.2 h))
    rw [hxp, hth]
    exact (base_factors (fun τ O => ((hS0 p hpS).2 τ O).1) (fun τ O => ((hS0 p hpS).2 τ O).2)).2.2
  have hfin : (Function.mulSupport fun p =>
      eL M δ (D.mem u).A.T (D.mem u').A.T p w (thT M δ γ₀ p) (x.1 p)).Finite := by
    refine (S ∪ hRf.toFinset ∪ x.2.toFinset).finite_toSet.subset fun p hp => ?_
    by_contra h
    exact (Function.mem_mulSupport.1 hp) (hone p h)
  have hzero : ∀ p₀, eL M δ (D.mem u).A.T (D.mem u').A.T p₀ w (thT M δ γ₀ p₀) (x.1 p₀) = 0 →
      (∏ᶠ p, eL M δ (D.mem u).A.T (D.mem u').A.T p w (thT M δ γ₀ p) (x.1 p)) = 0 := by
    intro p₀ hp₀
    rw [finprod_eq_prod _ hfin]
    refine Finset.prod_eq_zero (i := p₀) ?_ hp₀
    rw [Set.Finite.mem_toFinset, Function.mem_mulSupport, hp₀]
    exact zero_ne_one
  by_cases hZ : ∃ Z : PairVal.MatR D, AtMat w Z ∧ tupZ M δ u u' Z = x.1
  · obtain ⟨Z, hZ, hZx⟩ := hZ
    by_cases hth : ∀ p, thZ M δ u u' w Z p = thT M δ γ₀ p
    ·
      have hiff : ∀ γ : TermDef.Term D u u' F0 what₂,
          ((EligAt γ w ∧ kind w = kind w₀ ∧ thT M δ γ = thT M δ γ₀) ∧ locT M δ γ = x.1) ↔
            (EligAt γ w ∧ locT M δ γ = tupZ M δ u u' Z) := by
        intro γ
        constructor
        · rintro ⟨⟨h1, -, -⟩, h2⟩
          exact ⟨h1, h2.trans hZx.symm⟩
        · rintro ⟨h1, h2⟩
          refine ⟨⟨h1, hk, ?_⟩, h2.trans hZx⟩
          rw [hTT hN hrows hRel γ w h1 Z hZ h2]
          exact funext hth
      have hfinE := (hForm.2 ϖ hϖ Z).1
      have hsum := hFS hA hT hPH hN hrows hRel w hG Z hZ hfinE
      have hsum' : HasSum (fun γ : {γ : TermDef.Term D u u' F0 what₂ //
          (EligAt γ w ∧ kind w = kind w₀ ∧ thT M δ γ = thT M δ γ₀) ∧ locT M δ γ = x.1} =>
            (PairVal.massTerm γ.1 : ℂ) * ((PairVal.orbT D u u' F0 what₂ γ.1 (zT γ.1)).ncard : ℂ))
          (CntLocal.nu (CntLocal.Tn u') F0 what₂ Z : ℂ) :=
        (Equiv.hasSum_iff (Equiv.subtypeEquivRight hiff)
          (f := fun γ : {γ : TermDef.Term D u u' F0 what₂ // EligAt γ w ∧ locT M δ γ = tupZ M δ u u' Z} =>
            (PairVal.massTerm γ.1 : ℂ) * ((PairVal.orbT D u u' F0 what₂ γ.1 (zT γ.1)).ncard : ℂ))).2 hsum
      by_cases hcls : ∀ p, IsLCls M δ (D.mem u).A.T (D.mem u').A.T p w (tupZ M δ u u' Z p)
      · have hprod : (∏ᶠ p, eL M δ (D.mem u).A.T (D.mem u').A.T p w (thT M δ γ₀ p) (x.1 p)) = 1 := by
          refine finprod_eq_one_of_forall_eq_one fun p => ?_
          rw [← hZx]
          simp only [eL]
          rw [if_pos ⟨hcls p, (hTC w Z hZ p (hcls p)).trans (hth p)⟩]
        have hv : (n0 nc (D.mem u).A.T (D.mem u').A.T w : ℂ) * (dnT M δ L ϖ γ₀ : ℂ) * 1 =
            (CntLocal.nu (CntLocal.Tn u') F0 what₂ Z : ℂ) := by
          rw [mul_one]
          exact hMass nc hForm ϖ hϖ w w₀ Z γ₀ hZ hγ₀ hk hth hcls
        rw [hprod, hv]
        exact hsum'
      · push Not at hcls
        obtain ⟨p₀, hp₀⟩ := hcls
        have hnu0 := hNN hA hT hPH hrows w Z hZ ⟨p₀, hp₀⟩
        have hprod := hzero p₀ (by rw [← hZx]; exact eL_of_not_cls hp₀)
        have hv : (n0 nc (D.mem u).A.T (D.mem u').A.T w : ℂ) * (dnT M δ L ϖ γ₀ : ℂ) * 0 =
            (CntLocal.nu (CntLocal.Tn u') F0 what₂ Z : ℂ) := by
          rw [hnu0]
          simp
        rw [hprod, hv]
        exact hsum'
    ·
      push Not at hth
      obtain ⟨p₀, hp₀⟩ := hth
      have hempty : IsEmpty {γ : TermDef.Term D u u' F0 what₂ //
          (EligAt γ w ∧ kind w = kind w₀ ∧ thT M δ γ = thT M δ γ₀) ∧ locT M δ γ = x.1} := by
        refine ⟨fun γ => hp₀ ?_⟩
        have h := hTT hN hrows hRel γ.1 w γ.2.1.1 Z hZ (γ.2.2.trans hZx.symm)
        rw [← γ.2.1.2.2, h]
      have hf0 : eL M δ (D.mem u).A.T (D.mem u').A.T p₀ w (thT M δ γ₀ p₀) (x.1 p₀) = 0 := by
        rw [← hZx]
        by_cases hc : IsLCls M δ (D.mem u).A.T (D.mem u').A.T p₀ w (tupZ M δ u u' Z p₀)
        · simp only [eL]
          rw [if_neg]
          rintro ⟨-, h⟩
          exact hp₀ ((hTC w Z hZ p₀ hc).symm.trans h)
        · exact eL_of_not_cls hc
      rw [hzero p₀ hf0, mul_zero]
      exact hasSum_empty
  ·
    have hempty : IsEmpty {γ : TermDef.Term D u u' F0 what₂ //
        (EligAt γ w ∧ kind w = kind w₀ ∧ thT M δ γ = thT M δ γ₀) ∧ locT M δ γ = x.1} :=
      ⟨fun γ => hZ ⟨zT γ.1, atMat_zT hN hrows γ.2.1.1 (hRel γ.1 w γ.2.1.1), γ.2.2⟩⟩
    have hx : ∃ p₀, ¬ IsLCls M δ (D.mem u).A.T (D.mem u').A.T p₀ w (x.1 p₀) := by
      by_contra h
      simp only [not_exists, not_not] at h
      exact hZ (hE w hG x h)
    obtain ⟨p₀, hp₀⟩ := hx
    rw [hzero p₀ (eL_of_not_cls hp₀), mul_zero]
    exact hasSum_empty


theorem rh35_original_bridge {θ0 : ∀ p, Option ((M p).Cls D.R.rS)}
    (hA : ∀ p, Agree δ M p) (hT : (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Lat.gS D) ^ 2])
    (hPH : PrimeHyp D u (Tu D u'))
    (hU : LocUnram M δ u u' θ0) (hR : ThRestricted M δ u u' F0 what₂ θ0)
    (hrows : IsRowReps D F0 what₂) (hN : PairVal.NormRepExists D u u' F0 what₂) (hRel : EligRel u u' F0 what₂)
    (hRs : Restr M δ u u' F0 what₂) (hE : Exist M δ u u')
    (hTS : ThSome M δ u u' F0 what₂)
    (hTT : ThOfTup M δ u u' F0 what₂) (hTC : ThOfCls M δ u u') (hFS : FibSum M δ u u' F0 what₂)
    (hNN : NuNotCls M δ u u' F0 what₂) (hDT : DensTh M δ L u u') (hGM : GOfMat u u')
    (hEP : EligPos u u' F0 what₂) : FiberCount M δ L u u' F0 what₂ := by
  refine rh35_fiberCount_of_mass hA hT hPH hU hR hrows hN hRel hRs hE hTT hTC hFS hNN ?_
  intro nc hForm ϖ hϖ w w₀ Z γ₀ hZ hγ₀ hk hth hcls
  have hrel₀ := hRel γ₀ w₀ hγ₀
  have hpt₀ : ptT γ₀ = w₀ := ptT_eq hN hrows hγ₀ hrel₀
  have hZ₀ : AtMat w₀ (zT γ₀) := atMat_zT hN hrows hγ₀ hrel₀
  have hth₀ : ∀ p, thT M δ γ₀ p = thZ M δ u u' w₀ (zT γ₀) p := fun p => by
    show thL M δ (D.mem u).A.T (D.mem u').A.T p (ptT γ₀) _ = _
    rw [hpt₀]
    rfl
  have hpos : TotPos (CntLocal.GZ (CntLocal.Tn u) (CntLocal.Tn u') Z) := by
    rw [hGM w Z hZ]
    exact totPos_of_kind hk (hEP γ₀ w₀ hγ₀)
  have hnu := ((hForm.2 ϖ hϖ Z).2 hpos).2
  have hdn : (∏' p, CntLocal.densP L δ ϖ (CntLocal.Tn u) (CntLocal.Tn u') Z p) = dnT M δ L ϖ γ₀ := by
    unfold dnT
    congr 1
    funext p
    exact hDT hA hT hPH ϖ hϖ w w₀ Z (zT γ₀) hk hZ hZ₀ p (by rw [hth p]; exact hTS γ₀ w₀ hγ₀ p)
      ((hth p).trans (hth₀ p))
  have hng : CntLocal.sqrtAbsNormOfScaledGram (CntLocal.Tn u) (CntLocal.Tn u') Z ^ (D.R.k - 1) * nc =
      n0 nc (D.mem u).A.T (D.mem u').A.T w := by
    unfold CntLocal.sqrtAbsNormOfScaledGram n0
    rw [hGM w Z hZ]
    ring
  have hv : (n0 nc (D.mem u).A.T (D.mem u').A.T w : ℂ) * (dnT M δ L ϖ γ₀ : ℂ) * 1 =
      (CntLocal.nu (CntLocal.Tn u') F0 what₂ Z : ℂ) := by
    rw [hnu, ← hdn, ← hng]
    push_cast
    ring
  simpa only [mul_one] using hv

theorem rh35_rest_bridge {θ0 : ∀ p, Option ((M p).Cls D.R.rS)}
    (hA : ∀ p, Agree δ M p) (hT : (D.mem u).A.T ≡ (D.mem u').A.T [MOD (Lat.gS D) ^ 2])
    (hPH : PrimeHyp D u (Tu D u')) (hU : LocUnram M δ u u' θ0) (hR : ThRestricted M δ u u' F0 what₂ θ0)
    (hrows : IsRowReps D F0 what₂) (hN : PairVal.NormRepExists D u u' F0 what₂) (hRel : EligRel u u' F0 what₂)
    (hE : Exist M δ u u') (hTS : ThSome M δ u u' F0 what₂) (hFS : FibSum M δ u u' F0 what₂)
    (hNN : NuNotCls M δ u u' F0 what₂) (hDT : DensTh M δ L u u') (hEP : EligPos u u' F0 what₂) :
    FiberCount M δ L u u' F0 what₂ := by
  first
  | (rh_reduce 2 using [rh35_original_bridge]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh35_original_bridge hA hT hPH hU hR hrows hN hRel (Formalism.L2.SG.Pf.pcount_restr hA hrows hN) hE hTS
      (theta_of_tuple M δ u u' F0 what₂) (theta_of_class M δ u u') hFS hNN hDT (leadingMinors_of_matrix u u') hEP

rh_scan fiberCount_of limit 2000
rh_scan rh35_fiberCount_of_mass limit 2000
rh_scan rh35_rest_bridge limit 2000
rh_prune rh35_fiberCount_of_mass as RH35FiberMassPruned
#print axioms fiberCount_of
#print axioms rh35_fiberCount_of_mass
#print axioms rh35_original_bridge
#print axioms rh35_rest_bridge
end Assembly
end Formalism.L2.SG.Pf.FCount
