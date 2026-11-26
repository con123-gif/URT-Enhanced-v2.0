import Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.IntegralStructures.GaloisRepresentationsOfThetaLift
import Development.AutomorphicArithmetic.Foundations.GaloisRepresentations.ThetaParseval.ThetaKernels.TLiftK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 12 RUN49, 26 November 2026. HUMAN SOURCE-MATCHED / PREPARED, NOT COMPILED. RH OPEN.
Mission blob fb152e2897b4c1c320c43b9f42ae0ec088a7da45 including sprint and mandatory engine, AGENTS, SWARM, HANDOFF and continuity/state/log/protocol openings read. Peer integration 526075bef08de8ff11d87c4e027efeaa5f7c7e4b, acceleration cc4a51a290338c4aca19422e9887a1f1a30d9975, prime supplier 394fdbf60c9d340486f5e57ad4c5e20a7ac7bf6f read; do not duplicate their replay. Prior dependency RUN48 7d1fc0e18b1833fb1e46c4bc6267465ed531ceb8 preserved.
Source 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Pinned sources:
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean a57bfc2948bb91412fa00ee7e5c81a96ab4f5619
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyOfUnlinkedUnramifiedSupport.lean 0919be0cbdca37b90ee1cd6bc083ed2ab01bca14
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/GaloisCompatUnlinkedSupportOfSpherical.lean 63df8ebae0b20371ab4450898f1c8d1dfbd3a789
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean 4d4d9506494734f28fce7d39bac1a50650ecf148
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean f769999ac5e49241993e5efbf81e4d2cded18acd
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GaloisRepresentationsOfThetaLift.lean 869a5e68fcff90c1ee29a6dae75594ed8a59ada9
src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/R2g.lean bead0ea008e28652db66a8c6388279194c435c17

RESULT: native Row0b supplier uses rest, where R1 is passed twice with identical CoreAll h, directly and into R2. Inside R1, de Rham descent uses one spherical lift at g=frob h; consumes neither fixed-g conclusion nor matching characteristic polynomial. Actual producer hasSat_charPol_above first constructs hsat, then proves polynomial using localArtinExists_holds M, satWD_charPol_chars, localArtin_normU and norm/twist identity. Extract unchanged prefix as hasSat_only49 without a,ha; preserve hsup/hun/hunr, E/M/w/u, same lift and valuation and all normalization needed for hsat. Then exists_sph_lift_only49 uses same actual weaklyAttached_toral_of_cm_lift and norm-killing proof but needs only IsLift and HasSat; deRham_of_plainTor49 uses exactly that witness. No claim that g or base Artin map can be dropped from lift construction. Full Frobenius matching remains required in toralGal_of_holds and toralAbove_of_holds: both use same exact alias of exists_sph_lift_of_toral, not two independent suppliers. Their proof contexts differ and cannot be merged as instantiated applications. R1 consumes only four flags from CoreAll (unr,dR,crys,phi); rest_shared49 reuses one hR1 and still supplies original CoreAll to Row assembly.

Original selected graph: Main -> rhOfAll -> allChi -> everyCharacter -> galoisLocalGlobalStrong_recParameter -> galoisRepresentations_of_thetaLift -> galoisLocalGlobalStrong_of_geometry_lift -> galoisLocalGlobal_of_geometry_lift -> rest -> galoisLocalGlobal_of_localGlobalCompatibility -> R1 + R2(R1) -> deRham_of_plainTor -> exists_sph_lift_of_toral -> weaklyAttached_toral_of_cm_lift + frobenius_charpoly_eq_satake_of_place_above -> hasSat_charPol_above -> hsat + Artin/charpoly suffix.
Candidate graph: rowParameter49 -> row49 -> rest_shared49 -> same Row assembly + r1_shared49 and R2(r1_shared49). r1_shared49 -> four spherical flags + deRham_of_plainTor49 -> exists_sph_lift_only49 -> same toral lift + hasSat_only49 -> exact hsat prefix. R1 away and above retain complete Frobenius matching (native alias); P.above nice and away tor retain original full guards and transports. R2 separate hR1 contexts for base and extension and all A' remain. Do not retire comparison supplier globally or conflate native root row with same-interface rank3 compat candidate without actual caller evidence.
Cache source/toolchain, declaration, type/value/constructor role, E,M,Ω,l,ι,n,π,χ,r,w,u,A,h,h',σ,ξ,hξ,a,ha,g,P,B and place class; no memoization solely by suffix. Actual uniform CountP/Selmer, joint geometric budget and canonical G remain unresolved. No URT or numerical regression for exact source slicing.
Negative control: HasSat alone does not suffice for away/above characteristic equality; Satake multiset without matching comparison law does not determine given Galois representation. R2 cannot reuse R1 at E as proof of R1 at X.K without quantified supplier.
Static checks executed in V8: 64 fail-on-error checks: pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyOfUnlinkedUnramifiedSupport.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/GaloisCompatUnlinkedSupportOfSpherical.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/Development.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/GaloisRepresentationsOfThetaLift.lean; pin src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/R2g.lean; extract theorem hasSat_charPol_above; sat rename unique; sat rename position reversible; remove Artin binders unique; remove Artin binders position reversible; remove charpol output unique; remove charpol output position reversible; remove Artin intro unique; remove Artin intro position reversible; sat proof split; removed exact comparison suffix; comparison suppliers absent; extract theorem exists_sph_lift_of_toral; lift rename unique; lift rename position reversible; remove fixed g output unique; remove fixed g output position reversible; remove comparison output unique; remove comparison output position reversible; sat witness unique; sat witness position reversible; actual sat caller unique; actual sat caller position reversible; weaker output assembly unique; weaker output assembly position reversible; extract theorem deRham_of_plainTor; dr rename unique; dr rename position reversible; native unused outputs unique; native unused outputs position reversible; actual dr caller unique; actual dr caller position reversible; extract theorem galoisCompat_unlinkedSupport_of_spherical; r1 rename unique; r1 rename position reversible; four flags unique; four flags position reversible; r1 intro unique; r1 intro position reversible; unr unique; unr position reversible; dr unique; dr position reversible; crys unique; crys position reversible; phi unique; phi position reversible; r1 consumer unique; r1 consumer position reversible; core package absent; extract theorem exists_sph_lift_of_toral; extract theorem GlobalTheory.T.frobenius_charpoly_of_unlinked_unramified_support; full lift alias exact signature; native alias proof; native repeated R1; R2 context calls retained; actual row chain. Local command -v lean/lake/elan no paths. Existing status blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717 actual status pass/returncode 0, baseline only. No new native tests or axiom evidence, no runtime improvement measured. No registry job registered here because kernel lane owns shared native replay. No original files changed; prior graphs/axiom evidence preserved. Unconditional essential root leaves closed: 0. Native caller substitutions checked: 0. One new candidate route; full essential frontier count not authenticated.
RESUME HERE: kernel lane stage this file alongside existing RH engines and replay hasSat_only49, exists_sph_lift_only49, deRham_of_plainTor49, r1_shared49 then row49; capture exact scan/prune results and axioms. Compare old/new reverse reachable roles, preserve full matching supplier via away/above. Repair namespace/type elaboration failures before integration. Next dependency step: inspect shared weaklyAttached_toral_of_cm_lift and unlinked norm/window supplier for actual essential proof, not repeat local charpoly pruning.
HANDOFF TO: kernel, integration, Galois, audit; one shared replay only.
-/

set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

open GlobalTheory.RoadU

namespace GalTw
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.LocGL GlobalTheory.GalOfCusp GlobalTheory.GLq
open GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.GalCut GlobalTheory.RoadU GlobalTheory.AboveL
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField

noncomputable section

namespace GlobalTheory.RoadU.TorLift

theorem hasSat_only49 : UpperTheory.Gal.ToralGalois.Inq → ∀ (Ω : Type) [Field Ω] (E : Type) [Field E] [NumberField E] [IsCMField E] [Algebra E Ω] [IsAlgClosure E Ω] (M : Type) [Field M] [NumberField M] [IsCMField M] [Algebra M Ω] [IsAlgClosure M Ω] [Algebra E M] [IsScalarTower E M Ω] (l : ℕ) [Fact l.Prime] (n : ℕ), 1 ≤ n → ∀ (π : CuspSub E n) (χ : HChar (maximalRealSubfield E)), InScope .all l π χ → ∀ (A : ValuationSubring Ω) (w : HeightOneSpectrum (𝓞 E)) (u : HeightOneSpectrum (𝓞 M)) (h : IsPlaceOver A w) (h' : IsPlaceOver A u) [u.asIdeal.LiesOver w.asIdeal], ∀ σ : SmIrr (GL (Fin n) (w.adicCompletion E)), π.IsLocComp w σ → ∀ (ξ : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ)) (hξ : ∀ j, IsSmoothChar (ξ j)), HasSupport (algNorm σ).rep (chars ξ hξ) → Unlinked (chars ξ hξ) → ∀ P : CuspSub M n, CharLift π P → (∀ j (x : (u.adicCompletion M)ˣ), Valued.v (x : u.adicCompletion M) = 1 → (ξ j * absPow (w.adicCompletion E) (-((((1 : ℝ) - n) / 2 : ℝ) : ℂ))) (GlobalTheory.BCChar.normU w u x) = 1) → ∃ B : Multiset ℂˣ, (CG.mk P).HasSat u B := by
  intro hI Ω _ E _ _ _ _ _ M _ _ _ _ _ _ _ l _ n hn π χ hsc A w u h h' _ σ hσ ξ hξ hsup hun P hcl hunr
  classical
  haveI : CharZero (w.adicCompletion E) := charZero_of_injective_algebraMap (algebraMap E _).injective
  set s₀ : ℂ := ((((1 : ℝ) - n) / 2 : ℝ) : ℂ) with hs₀
  let ξ0 : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ) := fun j => ξ j * absPow (w.adicCompletion E) (-s₀)
  have hξ0 : ∀ j, IsSmoothChar (ξ0 j) := fun j => (hξ j).mul (isSmoothChar_absPow _)
  have hback : ∀ j, ξ j = ξ0 j * absPow (w.adicCompletion E) s₀ := fun j => by
    simp only [ξ0, mul_assoc, ← absPow_add, neg_add_cancel, absPow_zero, mul_one]

  have hN : ∀ t : ℂ, (absPow (w.adicCompletion E) t).comp (GlobalTheory.BCChar.normU w u) = absPow (u.adicCompletion M) t := by
    letI : Algebra (w.adicCompletion E) (u.adicCompletion M) := (GroundTheory.Global.adicCompletionMap w u).toAlgebra
    have hf := GroundTheory.Global.continuous_adicCompletionMap w u
    haveI : ContinuousSMul (w.adicCompletion E) (u.adicCompletion M) := continuousSMul_of_algebraMap _ _ hf
    haveI : IsScalarTower E (w.adicCompletion E) (u.adicCompletion M) :=
      .of_algebraMap_eq fun x => by
        show _ = GroundTheory.Global.adicCompletionMap w u _
        rw [GroundTheory.Global.adicCompletionMap_algebraMap, IsScalarTower.algebraMap_apply E M (u.adicCompletion M)]
    haveI : FiniteDimensional (w.adicCompletion E) (u.adicCompletion M) := GroundTheory.Global.finite_adicCompletion w u
    haveI : IsModuleTopology (w.adicCompletion E) (u.adicCompletion M) := by
      letI : NontriviallyNormedField (w.adicCompletion E) := Valued.toNontriviallyNormedField _ _
      exact isModuleTopologyOfFiniteDimensional
    exact fun t => GlobalTheory.LBCNu.absPow_comp_norm t

  have hx := (GlobalTheory.RoadU.TwistSupp.supp_nu_chars (w.adicCompletion E) (IrrGL.of σ.ρ σ.smooth σ.irred) n ξ0 ξ hξ0 hξ s₀
    hback).1
  have hsupσ : HasSupport σ.ρ (chars ξ0 hξ0) :=
    (hx.2 hsup).of_equiv (IrrGL.equivOf σ.ρ σ.smooth σ.irred).symm

  obtain ⟨T, hT, -⟩ := LocEx.exists_isLocComp GlobalTheory.automorphicFormsFiniteGL M n P u
  have hsupT := hcl.2 w u σ T hσ hT ξ0 hξ0 hsupσ

  obtain ⟨wt, hwt⟩ := GlobalTheory.PolarizedWeight.exists_isWeight E l n hn π χ hsc
  have hwin := GlobalTheory.RoadU.window hI E l n hn π χ hsc wt hwt w σ hσ ξ hξ hsup hun
  have hunlN := GlobalTheory.RoadU.unlinked_chars_comp_normU E M w u n ((wt : ℝ) / 2) ξ hξ hwin
  have hunl0 : Unlinked (chars (fun j => (ξ0 j).comp (GlobalTheory.BCChar.normU w u))
      fun j => GlobalTheory.BCChar.isSmoothChar_comp_normU w u (hξ0 j)) := by
    rw [GlobalTheory.RoadU.TwistSupp.chars_eq_map_nu (fun j => (ξ j).comp (GlobalTheory.BCChar.normU w u))
      (fun j => (ξ0 j).comp (GlobalTheory.BCChar.normU w u)) (fun j => GlobalTheory.BCChar.isSmoothChar_comp_normU w u (hξ j))
      (fun j => GlobalTheory.BCChar.isSmoothChar_comp_normU w u (hξ0 j)) (-s₀) (fun j => by
        rw [← hN (-s₀)]
        ext x
        rfl), GlobalTheory.RoadU.TwistSupp.unlinked_map_nu]
    exact hunlN

  obtain ⟨ϖ0, hϖ0⟩ := u.valuation_exists_uniformizer M
  have hv : Valued.v ((ϖ0 : M) : u.adicCompletion M) = WithZero.exp (-1 : ℤ) := by
    rw [HeightOneSpectrum.valuedAdicCompletion_eq_valuation', hϖ0]
  have hne : ((ϖ0 : M) : u.adicCompletion M) ≠ 0 := (Valuation.ne_zero_iff _).1 (by rw [hv]; exact WithZero.exp_ne_zero)
  let ϖ' : (u.adicCompletion M)ˣ := Units.mk0 _ hne
  have hϖ' : Valued.v (ϖ' : u.adicCompletion M) = WithZero.exp (-1 : ℤ) := hv
  have hunrN : ∀ j (x : (u.adicCompletion M)ˣ), Valued.v (x : u.adicCompletion M) = 1 →
      (ξ0 j).comp (GlobalTheory.BCChar.normU w u) x = 1 := hunr
  have hsat := GlobalTheory.SphUnr.hasSat_of_unlinked_unr hI M n hn P u T hT (fun j => (ξ0 j).comp (GlobalTheory.BCChar.normU w u))
    (fun j => GlobalTheory.BCChar.isSmoothChar_comp_normU w u (hξ0 j)) hsupT hunl0 hunrN ϖ' hϖ'
  exact ⟨_, hsat⟩

end GlobalTheory.RoadU.TorLift
end GalTw

open GlobalTheory.RoadU

namespace GalTw
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.LocGL GlobalTheory.GalOfCusp GlobalTheory.GLq
open GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.GalCut GlobalTheory.RoadU GlobalTheory.AboveL
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField

noncomputable section

namespace GlobalTheory.RoadU

theorem exists_sph_lift_only49 : UpperTheory.Gal.ToralGalois.Inq → ∀ (Ω : Type) [Field Ω] (E : Type) [Field E] [NumberField E] [IsCMField E] [Algebra E Ω] [IsAlgClosure E Ω] (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (n : ℕ), 1 ≤ n → ∀ (π : CuspSub E n) (χ : HChar (maximalRealSubfield E)), InScope .all l π χ → ∀ r : G E Ω →* GL (Fin n) (Qbar l), Weak π ι r → ∀ (w : HeightOneSpectrum (𝓞 E)) (A : ValuationSubring Ω) (h : IsPlaceOver A w), ∀ σ : SmIrr (GL (Fin n) (w.adicCompletion E)), π.IsLocComp w σ → ∀ (ξ : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ)) (hξ : ∀ j, IsSmoothChar (ξ j)), HasSupport (algNorm σ).rep (chars ξ hξ) → Unlinked (chars ξ hξ) → ∀ a : Weil h →* (w.adicCompletion E)ˣ, IsLocalArtin h a → ∀ g : Weil h, deg g ≠ 0 → ∃ (M : Type) (_ : Field M) (_ : NumberField M) (_ : IsCMField M) (_ : Algebra M Ω) (_ : IsAlgClosure M Ω) (_ : Algebra E M) (_ : IsScalarTower E M Ω) (u : HeightOneSpectrum (𝓞 M)) (h' : IsPlaceOver A u) (P : CuspSub M n) (χ' : HChar (maximalRealSubfield M)), InScope .all l P χ' ∧ IsLift π P ∧ ∃ B : Multiset ℂˣ, (CG.mk P).HasSat u B := by
  intro hI Ω _ E _ _ _ _ _ l _ ι n hn π χ hπ r hr w A h σ hσ ξ hξ hsupp hunl a ha g hg
  let ξ₀ : Fin n → ((w.adicCompletion E)ˣ →* ℂˣ) := fun j =>
    ξ j * absPow (w.adicCompletion E) (-((((1 : ℝ) - n) / 2 : ℝ) : ℂ))
  have hξ₀ : ∀ j, IsSmoothChar (ξ₀ j) := fun j => (hξ j).mul (isSmoothChar_absPow _)
  obtain ⟨M, _, _, _, _, _, _, _, P, χ', hP, hcl, hfix, hkill⟩ :=
    GlobalTheory.T.weaklyAttached_toral_of_cm_lift hI Ω E l ι n hn π χ hπ r hr w A h ξ₀ hξ₀ a ha g hg
  obtain ⟨u, h', -⟩ := GlobalTheory.T.exists_isPlaceOver_finiteExtension_of_isPlaceOver E M Ω A w h
  haveI := liesOver_of_isPlaceOver (M := M) h h'
  have hunr := GlobalTheory.T.unramified_comp_norm_of_killed_inertia_fixing Ω E M A w u h h' n ξ₀ a ha hkill
  obtain ⟨B, hB⟩ :=
    GlobalTheory.RoadU.TorLift.hasSat_only49 hI Ω E M l n hn π χ hπ A w u h h' σ hσ ξ hξ hsupp hunl P hcl hunr
  exact ⟨M, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance, inferInstance,
    u, h', P, χ', hP, hcl.1, B, hB⟩

end GlobalTheory.RoadU
end GalTw

open GlobalTheory.RoadU

namespace GalTw
open NumberField IsDedekindDomain Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N Polynomial
open GlobalTheory.CuspRep GlobalTheory.WeilDeligne GlobalTheory.Pst GlobalTheory.LocLanglands GlobalTheory.HeckeGal GlobalTheory.LocGL GlobalTheory.GalOfCusp GlobalTheory.GLq
open GlobalTheory.PRep GlobalTheory.SmGL GlobalTheory.SplitWeil GlobalTheory.GalCut GlobalTheory.RoadU GlobalTheory.AboveL
attribute [local instance] GlobalTheory.LocalData.complRel GlobalTheory.LocalData.isLocalField

noncomputable section

namespace GlobalTheory.DeRhamOfPlainTorus

theorem deRham_of_plainTor49 (hI : UpperTheory.Gal.ToralGalois.Inq) (hS : SphericalLevelCondition .all .dR) (E Ω : Type) [Field E] [NumberField E] [IsCMField E] [Field Ω]
    [Algebra E Ω] [IsAlgClosure E Ω] (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (n : ℕ) (hn : 1 ≤ n) (π : CuspSub E n)
    (χ : HChar (maximalRealSubfield E)) (hsc : InScope .all l π χ) (r : G E Ω →* GL (Fin n) (Qbar l)) (hw : Weak π ι r)
    (w : HeightOneSpectrum (𝓞 E)) (σ : SmIrr (GL (Fin n) (w.adicCompletion E))) (hσ : π.IsLocComp w σ)
    (hp : PlainTor (algNorm σ)) : ClauseAt .dR π ι r w := by
  intro P AI hT A hA O _ _ _ Bw hj
  have : CharZero (w.adicCompletion E) := charZero_of_injective_algebraMap (algebraMap E _).injective
  obtain ⟨ξ, hξ, hs, hu⟩ := GlobalTheory.RoadU.plainTor_exists_chars (w.adicCompletion E) (algNorm σ) hp
  obtain ⟨a, ha⟩ := GlobalTheory.localArtinExists_holds E Ω A w hA
  obtain ⟨M, _, _, _, _, _, _, _, u, h', PM, χ', hsc', hlift, B, hB⟩ :=
    GlobalTheory.RoadU.exists_sph_lift_only49 hI Ω E l ι n hn π χ hsc r hw w A hA σ hσ ξ hξ hs hu a ha (frob hA)
      (by rw [deg_frob]; exact one_ne_zero)
  have hwM : Weak PM ι (resTo M r) := GlobalTheory.GalCut.weak_comp_res E M Ω l ι n π PM hlift r hw
  have hcl : ClauseAt .dR PM ι (resTo M r) u := hS M Ω l ι n hn PM χ' hsc' (resTo M r) hwM u trivial B hB
  obtain ⟨O', _, _, _, Bw', hj', hjj, hdesc⟩ :=
    GlobalTheory.DRDescent.deRham_descends E M Ω A w u hA h' l P AI hT n r hw.1 O Bw hj
  obtain ⟨hdR, hjump⟩ := hcl P AI hT A h' O' Bw' hj'
  refine ⟨hdesc hdR, ?_⟩
  intro τ LL' τ' hind J hJ
  obtain ⟨φ, hφ⟩ := IntermediateField.exists_algHom_of_splits
    (fun s : Om l => ⟨Algebra.IsIntegral.isIntegral s, IsAlgClosed.splits _⟩)
    ((IntermediateField.val LL'.1).comp τ')
  have hφx : ∀ x : E, φ (Bw.j (algebraMap E Ω x)) = τ x := by
    intro x
    have := congrArg (fun f => f ⟨Bw.j (algebraMap E Ω x), Bw.j_E x⟩) hφ
    simp only [AlgHom.comp_apply, IntermediateField.val_mk] at this
    rw [this, hind x]
    rfl
  let LL'' : FinExt l := ⟨Bw'.Kw.1.map φ, inferInstance⟩
  let τ'' : ↥Bw'.Kw.1 →ₐ[ℚ_[l]] ↥LL''.1 := (IntermediateField.equivMap Bw'.Kw.1 φ).toAlgHom
  let τL : M →+* Om l := φ.toRingHom.comp (Bw'.j.comp (algebraMap M Ω))
  have hτL : τL.comp (algebraMap E M) = τ := by
    ext x
    show φ (Bw'.j (algebraMap M Ω (algebraMap E M x))) = τ x
    rw [← IsScalarTower.algebraMap_apply E M Ω, hjj, hφx]
  have hind' : IsInduced Bw' τL τ'' := fun x => rfl
  have hJ' : J.map (fun n : ℤ => (n : ℂ)) =
      ((CG.mk PM).infChar (ι.toRingHom.comp τL)).map (fun z => ((n : ℂ) - 1) / 2 - z) := by
    rw [hlift.inf, RingHom.comp_assoc, hτL, hJ]
  exact GlobalTheory.JumpsDescend.jumps_descend E M Ω A w u hA h' l P AI hT n r hw.1 O Bw O' Bw' hj hj' hjj τ τL hτL J
    (hjump τL LL'' τ'' hind' J hJ')

theorem r1_shared49 : UpperTheory.Gal.ToralGalois.Inq → SphericalLevelCondition .all .unr → SphericalLevelCondition .all .dR → SphericalLevelCondition .all .crys → SphericalLevelCondition .all .phi → GlobalTheory.DeRhamOfPlainTorus.R1 := by
  intro hI hUnr hDR hCrys hPhi E Ω _ _ _ _ _ _ l _ ι n hn π χ hπ r hr w σ hσ hp
  refine ⟨fun hl A h => GlobalTheory.RoadU.away_eq_of_plainTor hI (GlobalTheory.RoadU.toralGal_of_holds hI hUnr)
    E Ω l ι n hn π χ hπ r hr w hl A h σ hσ hp,
    fun hl => ⟨deRham_of_plainTor49 hI hDR E Ω l ι n hn π χ hπ r hr w σ hσ hp, fun P AI hT A h O _ _ _ Bw hj => ?_⟩⟩
  have : CharZero (w.adicCompletion E) := charZero_of_injective_algebraMap (algebraMap E _).injective
  obtain ⟨ξ, hξ, hs, hu⟩ := GlobalTheory.RoadU.plainTor_exists_chars (w.adicCompletion E) (algNorm σ) hp
  have key := fun a ha => GlobalTheory.RoadU.toralAbove_of_holds hI hCrys hPhi E Ω l ι n hn π χ hπ r hr w hl A h σ hσ
    ξ hξ hs hu a ha P AI hT O Bw hj
  obtain ⟨a0, ha0⟩ := GlobalTheory.localArtinExists_holds E Ω A w h
  refine ⟨(key a0 ha0).1, (key a0 ha0).2.1, ?_⟩
  rintro rc ⟨a, ha, H⟩ g
  exact ((key a ha).2.2 g).trans
    ((GlobalTheory.RoadU.UnlinkedChars.rc_unlinked_chars hI Ω E w A h a ha rc H (algNorm σ) n ξ hξ hs hu).2 g).symm

end GlobalTheory.DeRhamOfPlainTorus
end GalTw

namespace UpperTheory.Gal.Int
theorem rest_shared49 (h : GlobalTheory.RoadU.CoreAll) : UpperTheory.GalStar.Row0 recT := by
  have hR1 := GalTw.GlobalTheory.DeRhamOfPlainTorus.r1_shared49 UpperTheory.Gal.ToralGalois.inq_holds (h.2 .unr) (h.2 .dR) (h.2 .crys) (h.2 .phi)
  exact UpperTheory.Gal.Int.Row.galoisLocalGlobal_of_localGlobalCompatibility h hR1
    (UpperTheory.Gal.ToralGalois.R2.localGlobalCompatAtIwahoriFixed_of_unlinked hR1)

theorem row49 (geo : UpperTheory.Gal.Int.Geo.GeoOne) (up : UpperTheory.TP.TLiftK) : UpperTheory.GalStar.Row0b recT :=
  UpperTheory.GalStar.Row0.row0b recT (rest_shared49 (coreAll_of
      (UpperTheory.Gal.Int.Div.seedFinOdd_of_geoOne geo)
      (UpperTheory.Gal.Int.Cong.congFinOdd_of_ex UpperTheory.Gal.Wt.wtLacEx_holds) up))

theorem rowParameter49 : UpperTheory.GalStar.Row0b recT :=
  row49 UpperTheory.Gal.Int.Geo.geoOne_holds UpperTheory.TP.K.tLiftK
end UpperTheory.Gal.Int

rh_scan GalTw.GlobalTheory.RoadU.TorLift.hasSat_charPol_above limit 2000
rh_scan GalTw.GlobalTheory.RoadU.TorLift.hasSat_only49 limit 2000
rh_scan GalTw.GlobalTheory.RoadU.exists_sph_lift_only49 limit 2000
rh_scan GalTw.GlobalTheory.DeRhamOfPlainTorus.deRham_of_plainTor49 limit 2000
rh_scan UpperTheory.Gal.Int.rest limit 2000
rh_scan UpperTheory.Gal.Int.rest_shared49 limit 2000
rh_scan UpperTheory.Gal.Int.rowParameter49 limit 2000
rh_prune GalTw.GlobalTheory.RoadU.TorLift.hasSat_only49 as RHLane12HasSatPruned49
#print axioms GalTw.GlobalTheory.RoadU.TorLift.hasSat_only49
#print axioms GalTw.GlobalTheory.RoadU.exists_sph_lift_only49
#print axioms GalTw.GlobalTheory.DeRhamOfPlainTorus.r1_shared49
#print axioms UpperTheory.Gal.Int.rowParameter49
