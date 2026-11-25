import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

/-!
Lane 12, 25 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION / PREPARED LEAN, NOT COMPILED.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine), original e0dc8f7f, SWARM, HANDOFF, AGENTS, continuity, log/protocol openings and CI summary read. Latest 35 peer commit titles surveyed, detailed peers 4ff04116, de1f67ea, f26f77b4, f2bb1e4b, c2aa33f2, 8aed7b77 consulted. Prior lane 2235982d retained. Branch observed 4ff041161bcceabea15ef4a6a0851ad2e338dbb0.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: the same native ramification argument occurs verbatim in all three actual CountI suppliers rigIUE_alt, rigII_a_alt and admissible_typeI_even_level_alt. Their shared local mathematical input is strictly more general:
  I_B not contained in ker eta = Gal(Omega/K) implies v_B(|disc K|)<1.
Proof: if v_B(disc K) is not <1, every inertia element agrees with the identity on integral elements of K and hence on K by native UnramDiscr.embedding_eq; contradiction. Valuation of minus one is one, so use |disc K|. For any natural m, v_B(m)<=1, so v_B(m|disc K|)<=v_B(|disc K|)<1. No l, N, e, modularity, CM or quadratic assumption used for this shared local implication; the kernel identity and original field/algebra hypotheses remain. Original LinkHyp still uses m=lN and retains nonzero, divisibility, positive weight, and same B/cc. No claim that this alone constructs LinkHyp or a uniform CountI bound.
Second exact sharing: both Type I suppliers independently reconstruct Psi(cc)=(-1)^e*(-1)^e=1. Already supplied by dat_facts D third conjunct, definitionally same Psi. Reuse it at both real consumers; no new parity assumption. Their four private coefficient helper proofs are byte-identical in the two original modules; reference one native implementation via open private rather than copy. No claim of global kernel node savings.
Original selected source graph (not full elaborated graph):
  vwin_of_hypotheses_H_E_alt -> count_i_of_printed_bound_k_kato_automorphy
  -> corGK -> propGK_of_numberU3U_of_oneCharU -> oneCharU_of_katoTwoW_rig_admI_automorphy;
  CountI caller -> rigIUE_alt, rigII_a_alt, admissible_typeI_even_level_alt;
  rigIUE_alt -> admissible_typeI_even_level_alt;
  all three -> identical UnramDiscr.embedding_eq proof, all three retain LinkHyp, frame, point and automorphy inputs.
Candidate overlay: rhDep38_count_i... -> the three rhDep38 suppliers; each -> RHDep38.ramified_multiple_replay -> ramified_multiple -> ramified_disc -> UnramDiscr.embedding_eq. Both Type I -> dat_facts D and shared native factor/loc_of_int. RR retains its separate exists_fac/loc_of_int from IntIffNorm. All other siblings remain, including hK,hKa,h3,hE, hC, adjoint lifting, and all original type/constructor/axiom edges. No witness sharing across different D/B/points; cache key includes source/toolchain, eta, K/Omega, B and exact kernel proof, and actual m for the lifted bound. Backtrack to original supplier bodies if replay fails. The original source graph and previous axiom evidence are not modified.
Source ledger prefix src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/:
ERigIU.lean 3bf84a4b49313e9e642ee40ea4405b3a71fde67f
RRRigII.lean 897ad2baaef35775880be7b6d2fea54b350f4f87
AdmissibleTypeIEvenLevel.lean ee5d31ade7ce651ca5fe5b7b3fe617d80c2e09c5
LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
FPtHypU.lean 691a4043b5e6b8345da617fa616e4f46c7da07f8
FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
TypeIIOfBlochKatoLocalPoint.lean b2105afc37cb331560ac74eed77d5a612eca99f0
RigEnd3.lean c1ab51f291a0349ebb726632f4bd90c99fc50380
src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/DatFacts.lean f04c55abe16956e3d4458c410131568df631149f
Executed 57 fail-on-error JS checks before write: 9 pinned hashes, exact block sharing, actual callers, unique substitutions and reverse restoration, unchanged siblings. No artificial tests. Native Lean/lake absent locally; git DNS failure. Re-read existing baseline CI status for runs 45577239749 and 45576756833 (both published pass); NOT evidence for this file. Native replay/axiom and constructor-inclusive checks for new overlay remain pending; no new CI run claimed.
RESUME HERE: replay this file and previous actual Kato overlay using the existing pinned runner, inspect scan/prune and axioms. Then reduce the shared frame and adjoint lifting supplier at the actual RigI/RigII consumers (not an alternate theorem). If native private open fails, copy the exact shared helper definitions once with fresh names and retry. Keep original unresolved frontiers. RH OPEN.
HANDOFF TO integration, kernel extractor, Galois and audit.
-/

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J

namespace RHDep38

theorem ramified_disc {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    (η : G ℚ Ω →* ℤˣ) (hη : η.ker = galOf ℚ K Ω)
    (B' : ValuationSubring Ω) (h : ¬ Ine (F := ℚ) B' ≤ η.ker) :
    B'.valuation (((discr K).natAbs : ℕ) : Ω) < 1 := by
  haveI : IsAlgClosed Ω := IsAlgClosure.isAlgClosed ℚ
  have hd : B'.valuation ((discr K : ℤ) : Ω) < 1 := by
    by_contra h4
    refine h fun s hs => ?_
    rw [hη]
    have key := GlobalTheory.UnramDiscr.embedding_eq B' h4 ((s : Ω →+* Ω).comp (algebraMap K Ω)) (algebraMap K Ω) (fun x => by
      refine hs.2 _ ((B'.valuation_le_one_iff _).mpr (GlobalTheory.UnramDiscr.mem_of_isIntegral B' ?_))
      exact (RingOfIntegers.isIntegral_coe x).map (algebraMap K Ω).toIntAlgHom)
    exact fun x => DFunLike.congr_fun key x
  have hd' : B'.valuation (((discr K).natAbs : ℕ) : Ω) < 1 := by
    rcases Int.natAbs_eq (discr K) with h1 | h1
    · rw [h1, Int.cast_natCast] at hd; exact hd
    · rw [h1, Int.cast_neg, Int.cast_natCast, Valuation.map_neg] at hd; exact hd
  exact hd'

theorem ramified_multiple {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    (η : G ℚ Ω →* ℤˣ) (hη : η.ker = galOf ℚ K Ω) (m : ℕ)
    (B' : ValuationSubring Ω) (h : ¬ Ine (F := ℚ) B' ≤ η.ker) :
    B'.valuation ((m * (discr K).natAbs : ℕ) : Ω) < 1 := by
  have hd' := ramified_disc η hη B' h
  rw [Nat.cast_mul, map_mul]
  exact lt_of_le_of_lt (mul_le_of_le_one_left' ((B'.valuation_le_one_iff _).2 (natCast_mem B' _))) hd'

theorem ramified_multiple_replay {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω]
    {K : Type} [Field K] [NumberField K] [Algebra K Ω]
    (η : G ℚ Ω →* ℤˣ) (hη : η.ker = galOf ℚ K Ω) (m : ℕ)
    (B' : ValuationSubring Ω) (h : ¬ Ine (F := ℚ) B' ≤ η.ker) :
    B'.valuation ((m * (discr K).natAbs : ℕ) : Ω) < 1 := by
  first
  | (rh_reduce 3 using [ramified_multiple η hη m B' h]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact ramified_multiple η hη m B' h

end RHDep38
end

section
open private factor loc_of_int from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.ERigIU
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J UpperTheory.V.Th
open Formalism.GaloisCohomology in
theorem UpperTheory.V.Z.J.rhDep38_admissible_typeI_even_level_alt :
    U3.CohInp → _root_.UpperTheory.V.Af.HypothesesH' → UnlEndLogNorm → _root_.UpperTheory.V.Z.J.AdmI_s := by
  intro hI hH hE Ω _ _ _ K _ _ _ _ _ l hl c N _ e ψ D U g₁ hM S f hf hr ι hT hA
  have hN := hH.litN
  have hσ : Sd.IsCC D.cc := D.conj
  haveI : IsLocalHom (algebraMap ℤ_[l] c.O) := (dvrFacts l c.O).2.2.1
  haveI : CharP (ResidueField c.O) l := by
    rw [CharP.charP_iff_prime_eq_zero hl.out, ← map_natCast (residue c.O), residue_eq_zero_iff,
      mem_maximalIdeal, mem_nonunits_iff, ← map_natCast (algebraMap ℤ_[l] c.O)]
    intro hu
    exact PadicInt.prime_p.not_unit (isUnit_of_map_unit _ _ hu)
  obtain ⟨B, hB, -, -, -, hB', -⟩ := U3.dat_loc D
  have hF := Fr.gd_ex ⟨⟨hN.coh.lf, hN.coh.lt, hN.coh.le, hN.coh.gf, hN.coh.ge, hN.coh.pt⟩, hN.coh.uo, hN.coh.gw⟩
    Ω K l c N e ψ D B hB
  have hΨ : Chr.Psi l e (Chr.dirG ℚ Ω ψ) D.cc = 1 := by
    show D.Ψ D.cc = 1
    exact (U3.dat_facts D).2.2.1
  have hram := fun B' h => RHDep38.ramified_multiple_replay D.η D.η_ker (l * N) B' h
  have hk : Pr.LinkHyp c N e D.η D.cc B (l * N * (discr K).natAbs) :=
    ⟨D.gd.e_pos, dvd_mul_right _ _,
      mul_ne_zero (mul_ne_zero hl.out.ne_zero (NeZero.ne N)) (Int.natAbs_ne_zero.2 (discr_ne_zero K)), hram, hB, hσ⟩
  obtain ⟨A, hA1, hA2, f', hA3, hf'⟩ := factor f hf
  haveI : IsLocalRing A := hA1.toIsLocalRing
  have ho := Pr.ordPt_of_gd hI.loc D g₁ hM U S B hB' A f' (loc_of_int f')
  have e1 : UnitaryThreeInertia.push A.val (U3.push f' S.r.hom) = U3.push f S.r.hom :=
    MonoidHom.ext fun g => SemidirectProduct.ext (Units.ext (Matrix.ext fun a b => hf' _)) rfl
  have had := _root_.UpperTheory.V.U3.admissible_rank_three_of_type_one_of_automorphic_point hI D hM (U3.isPt_push D hM S f hf) ι hT hA
  have he := D.gd.e_pos
  have key := hE Ω l c N e ψ D.η D.cc g₁ B _ hk D.gd.N_even hΨ hF A _ ho
    (Pr.matIrr_open_gd D g₁ hM B hB A _ ho (by rw [e1]; exact hT)) K D.gd.quad D.η_ker (D.rhoK _ hr)
    (fun s => by rw [e1]; rfl) N NeZero.one_le had.level.above
  exact { toAdm3 := had, unl := key }
end

section
open private factor loc_of_int from Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.ERigIU
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J
open Formalism.GaloisCohomology Polynomial UpperTheory.V.Th in
theorem UpperTheory.V.Z.J.rhDep38_rigIUE_alt :
    U3.CohInp → _root_.UpperTheory.V.Af.HypothesesH' → _root_.UpperTheory.V.Th.AdjointLiftingTheorem → UnlEndLogNorm → _root_.UpperTheory.V.Th.RigidityFirstCase := by
  intro hI hH hL hU Ω _ _ _ K _ _ _ _ l hl c N _ e ψ D U g₁ hM S f hf hr ι hT hA
  have hN := hH.litN
  have hσ : Sd.IsCC D.cc := D.conj
  haveI : IsLocalHom (algebraMap ℤ_[l] c.O) := (dvrFacts l c.O).2.2.1
  haveI : CharP (ResidueField c.O) l := by
    rw [CharP.charP_iff_prime_eq_zero hl.out, ← map_natCast (residue c.O), residue_eq_zero_iff,
      mem_maximalIdeal, mem_nonunits_iff, ← map_natCast (algebraMap ℤ_[l] c.O)]
    intro hu
    exact PadicInt.prime_p.not_unit (isUnit_of_map_unit _ _ hu)
  haveI : IsAlgClosure K Ω := ⟨IsAlgClosure.isAlgClosed ℚ, Algebra.IsAlgebraic.tower_top (K := ℚ) K⟩
  obtain ⟨B, hB, -, -, -, hB', -⟩ := U3.dat_loc D
  have hF := Fr.gd_ex ⟨⟨hN.coh.lf, hN.coh.lt, hN.coh.le, hN.coh.gf, hN.coh.ge, hN.coh.pt⟩, hN.coh.uo, hN.coh.gw⟩
    Ω K l c N e ψ D B hB
  have hΨ : Chr.Psi l e (Chr.dirG ℚ Ω ψ) D.cc = 1 := by
    show D.Ψ D.cc = 1
    exact (U3.dat_facts D).2.2.1
  have hram := fun B' h => RHDep38.ramified_multiple_replay D.η D.η_ker (l * N) B' h
  have hk : Pr.LinkHyp c N e D.η D.cc B (l * N * (discr K).natAbs) :=
    ⟨D.gd.e_pos, dvd_mul_right _ _,
      mul_ne_zero (mul_ne_zero hl.out.ne_zero (NeZero.ne N)) (Int.natAbs_ne_zero.2 (discr_ne_zero K)), hram, hB, hσ⟩
  obtain ⟨A, hA1, hA2, f', hA3, hf'⟩ := factor f hf
  haveI : IsLocalRing A := hA1.toIsLocalRing
  have ho := Pr.ordPt_of_gd hI.loc D g₁ hM U S B hB' A f' (loc_of_int f')
  have e1 : UnitaryThreeInertia.push A.val (U3.push f' S.r.hom) = U3.push f S.r.hom :=
    MonoidHom.ext fun g => SemidirectProduct.ext (Units.ext (Matrix.ext fun a b => hf' _)) rfl
  have had := _root_.UpperTheory.V.Z.J.rhDep38_admissible_typeI_even_level_alt hI hH hU D hM S f hf hr ι hT hA
  have he := D.gd.e_pos
  have hfr : FreeAt l (D.rhoK _ hr) :=
    _root_.UpperTheory.V.Z.J.free_at_of_unlinked_of_automorphic_cyclotomic_twist hH K Ω l D.gd.l_odd ι 3 (by decide) _ (-1) N _ had.level.cont (by rw [_root_.zpow_neg_one]; exact had.aut)
      (NeZero.one_le) (by
        intro i j hij
        fin_cases i <;> fin_cases j <;> simp at hij ⊢ <;> omega) had.unl
  have key := _root_.UpperTheory.V.Z.Win.Dn.rigEnd3_alt hH hL Ω l ι c N e ψ D.η D.cc g₁ B _ hk hΨ hF A _ ho
    (Pr.matIrr_open_gd D g₁ hM B hB A _ ho (by rw [e1]; exact hT)) K D.gd.quad D.η_ker (D.rhoK _ hr)
    (fun s => by rw [e1]; rfl) hA hfr
  rwa [e1] at key
end

section
open private loc_of_int exists_fac from Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.IntIffNorm
open UpperTheory.GalN.V
section Factor
open IsLocalRing UpperTheory.V UpperTheory.V.U3 UpperTheory.V.Alg UpperTheory.V.HV UpperTheory.V.Base
end Factor
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial UpperTheory.V UpperTheory.V.HV GlobalTheory.GalOfCusp UpperTheory.V.Th
open UpperTheory.V.Base in
theorem UpperTheory.V.Z.Win.RR.rhDep38_rigII_a_alt :
    U3.CohInp → _root_.UpperTheory.V.Af.HypothesesH' → _root_.UpperTheory.V.Th.AdjointLiftingTheorem → _root_.UpperTheory.V.Th.RigiditySecondCase := by
  intro hC hH hL Ω _ _ _ K _ _ _ _ l hl c N _ e ψ D U g₁ hM S f hf ι hII W hW hext hdet hmod
  have hpt := U3.isPt_push D hM S f hf
  have he := D.gd.e_pos
  haveI : IsAlgClosure K Ω := ⟨IsAlgClosure.isAlgClosed ℚ, Algebra.IsAlgebraic.tower_top (K := ℚ) K⟩
  obtain ⟨B, hB, -, -, -, hBj, -⟩ := U3.dat_loc D
  haveI : IsLocalHom (algebraMap ℤ_[l] c.O) := (dvrFacts l c.O).2.2.1
  haveI : CharP (ResidueField c.O) l := by
    rw [CharP.charP_iff_prime_eq_zero hl.out, ← map_natCast (residue c.O), residue_eq_zero_iff,
      mem_maximalIdeal, mem_nonunits_iff, ← map_natCast (algebraMap ℤ_[l] c.O)]
    intro hu
    exact PadicInt.prime_p.not_unit (isUnit_of_map_unit _ _ hu)
  have hram := fun B' h => RHDep38.ramified_multiple_replay D.η D.η_ker (l * N) B' h
  have hd0 : (discr K).natAbs ≠ 0 := Int.natAbs_ne_zero.2 (discr_ne_zero K)
  have hlink : Pr.LinkHyp c N e D.η D.cc B (l * N * (discr K).natAbs) :=
    ⟨he, dvd_mul_right _ _, mul_ne_zero (mul_ne_zero hl.out.ne_zero (NeZero.ne N)) hd0, hram, hB, D.conj⟩
  have hN := hH.litN
  have hframe := Fr.gd_ex ⟨⟨hN.coh.lf, hN.coh.lt, hN.coh.le, hN.coh.gf, hN.coh.ge, hN.coh.pt⟩, hN.coh.uo, hN.coh.gw⟩
    Ω K l c N e ψ D B hB
  obtain ⟨A, hA1, hA2, hfA⟩ := exists_fac f hf
  haveI : Module.Finite ℤ_[l] A := Module.Finite.trans c.O A
  haveI := (UpperTheory.V.abelian₂.dvr_finite l A).1
  have hord := Pr.ordPt_of_gd hC.loc D g₁ hM U S B hBj A (f.codRestrict A hfA) (loc_of_int _)
  have hpush : UnitaryThreeInertia.push A.val (U3.push (f.codRestrict A hfA) S.r.hom) = U3.push f S.r.hom := rfl
  have hM1 : 1 ≤ N * (discr K).natAbs := Nat.one_le_iff_ne_zero.2 (mul_ne_zero (NeZero.ne N) hd0)
  have hm : StrictAnti ![(e : ℤ), -(e : ℤ)] := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp at hij ⊢ <;> omega
  have hlev := (U3.typeII_ord hC D hM hpt hII W hext hW hdet).1
  have hwt : Af.IsCycWt l 0 (Matrix.GeneralLinearGroup.det.comp W) := by
    have hodd : Odd (discr K).natAbs := Nat.coprime_two_right.1 (D.gd.cop.coprime_dvd_right D.gd.N_even.two_dvd)
    refine ⟨(discr K).natAbs, Matrix.GeneralLinearGroup.det.comp W, hodd.pos, fun s hs => Units.ext ?_, by simp⟩
    have h1 : s ∈ D.η.ker := D.η_ker ▸ UpperTheory.mem_galOf_quadratic_of_fixes_discr_roots_of_unity Ω K D.gd.quad hodd s hs
    have h2 := hdet s
    rw [show D.η s = 1 from h1] at h2
    simpa using h2
  have hcyc := U3.typeII_irr_cyc hC D hM hpt hII W hext
  have hirrK : Af.IsIrr (W.comp (AlgEquiv.restrictScalarsHom ℚ : G K Ω →* G ℚ Ω)) :=
    ⟨top_ne_bot, fun _ _ _ => trivial, fun X hX hs => hcyc.2.2 X hX fun g v hv => hs g v hv⟩
  have hWQ := _root_.UpperTheory.GalN.V.witAQ_of_isModularA hH.toClassicalTheorems hW hwt he hmod
  obtain ⟨nf, hnf⟩ := _root_.UpperTheory.GalN.V.mod0'_alt hmod
  have hadm : ∃ θ, Af.IsCycWt l 0 θ ∧ Af.DualTw W θ :=
      ⟨_, hwt, Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, 1; -1, 0] (by simp), fun s => by
        have hd : ((Matrix.GeneralLinearGroup.det.comp W s : (Qbar l)ˣ) : Qbar l) = (W s).val.det := rfl
        rw [hd, Matrix.det_fin_two (W s).val]
        ext i j
        simp only [Matrix.mul_apply, Fin.sum_univ_two]
        fin_cases i <;> fin_cases j <;> simp <;> ring⟩
  have haut := _root_.UpperTheory.GalN.V.autKQ0_alt hH K Ω D.gd.quad l ι 2 (by norm_num) W 0 hW
    (_root_.UpperTheory.GalN.V.newformAut0_alt hH.toClassicalTheorems _ (by omega) nf l Ω ι W _ hnf) hadm hirrK
  have hunl := (unlRes K Ω l 2 _ _ W hM1).2 (fun i j => by
    fin_cases i <;> fin_cases j <;> simp <;> omega) hlev
  have hres : Continuous (AlgEquiv.restrictScalarsHom ℚ : G K Ω →* G ℚ Ω) := (galEmbTop ℚ K Ω).1.continuous
  have hfree := _root_.UpperTheory.V.Z.Win.RR.freePUA_alt hH K Ω D.gd.quad l D.gd.l_odd ι 2 le_rfl _ _ _ hM1 hm (hW.comp hres) haut (hWQ K D.gd.quad hirrK) hunl
  obtain ⟨π, hreg, -, hatt⟩ := haut
  refine _root_.UpperTheory.V.Z.Win.Dn.rigid_end_two_w_of_printed_adjoint_lifting hH hL Ω l ι c N e ψ D.η D.cc g₁ B _ hlink (U3.dat_facts D).2.2.1 hframe A _ hord hII
    (fun g hg => Subtype.ext ((U3.typeII_facts hC D hM hpt hII).1 g hg)) K D.gd.quad D.η_ker W hW hext.1 hdet
    ⟨π, hreg, hatt⟩ (hWQ K D.gd.quad hirrK) fun A' hA' => ?_
  obtain ⟨g, hg, hc, α, hα, hp⟩ := hfree A' hA'
  exact ⟨AlgEquiv.restrictScalarsHom ℚ g, hg, hc, α, hα, hp⟩
end

section
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.Z.J
open UpperTheory.V.HV UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J
theorem rhDep38_count_i_of_printed_bound_k_kato_automorphy (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hKa : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW) (h3 : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt) : CountI :=
  have hC := _root_.UpperTheory.V.HV.Core0.cohInp_alt hH.litN hK
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  U3.countI (U3.corGK (_root_.UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints hH.toClassicalTheorems)
    (_root_.UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds Alg.lemmaP hKa (_root_.UpperTheory.V.Z.J.rhDep38_rigIUE_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE)
      (_root_.UpperTheory.V.Z.Win.RR.rhDep38_rigII_a_alt hC hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH)) (_root_.UpperTheory.V.Z.J.rhDep38_admissible_typeI_even_level_alt hC hH hE) h3)))

end UpperTheory.V.Z.J
end

#print axioms RHDep38.ramified_disc
#print axioms RHDep38.ramified_multiple_replay
#print axioms UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy
#print axioms UpperTheory.V.Z.J.rhDep38_count_i_of_printed_bound_k_kato_automorphy
rh_scan UpperTheory.V.Z.J.rigIUE_alt limit 2000
rh_scan UpperTheory.V.Z.J.rhDep38_rigIUE_alt limit 2000
rh_scan UpperTheory.V.Z.Win.RR.rigII_a_alt limit 2000
rh_scan UpperTheory.V.Z.Win.RR.rhDep38_rigII_a_alt limit 2000
rh_scan UpperTheory.V.Z.J.rhDep38_count_i_of_printed_bound_k_kato_automorphy limit 2000
rh_prune RHDep38.ramified_disc as RHDep38.ramified_disc_pruned
