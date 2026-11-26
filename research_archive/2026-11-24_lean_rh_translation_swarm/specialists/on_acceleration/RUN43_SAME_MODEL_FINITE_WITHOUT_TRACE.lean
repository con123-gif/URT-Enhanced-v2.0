import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.MainCotSpan
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.Mprime
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FOneCharU
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN43 lane 14, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including mandatory
pipeline, SWARM/HANDOFF/EXPANSION/AGENTS consulted. Peers 49cea008 (restricted
cotangent lower), b0fd82e7 (one torsion cutoff), f304da1a (shared CountI/V
trace), cd8a9fa9, ea6dac73, 8c83c632, 75e75229 read excerpts. No merging
uncompiled overlays. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

Result: on the actual CountI same-model path, finiteness of Vlen is
independent of the trace test, KatoTwoW and both positive-point rigidity
suppliers. With the native model and its weight-zero finite algebra,
nonpositive-weight rigidity supplies M1; smoothness and SpansCot(-1)
give a finite lattice quotient. Precisely, P=cotLat(-1),
N=comap(cotSpan Q.F), full rank by SpansCot, and native Smith exponents
c_i >= 0 yield length(P/N)=sum_i c_i < infinity. Apply the existing
vlen_le with mprime_holds to that same model. No trace nonvanishing needed
for finiteness alone. The nonpositive-weight rigidity proof is literally
the middle field of FPtHypU, using only CohInp and the actual base point.
The full trace inequality still requires the original stronger
hypotheses; do not substitute this projection for the whole OneCharU_s.
Without SpansCot, e.g. free rank-one P over Z_3 and N=0, finiteness fails.
Native main_holds and mprime_holds are real theorem bodies; LinkedUnlE
already supplies both at the actual CountI caller, so they are NOT two
new open assumptions to prove. They are not globally removed by an
adapter, and their transitive dependencies still require independent audit.

Original selected graph (qualitative projection):
CountI -> corGK -> propGK -> OneCharU -> oneChar_unramU -> model_upper
  -> M1,M2,M3,M4,M5,LemmaM -> main_holds -> rk_holds,sm_holds,core_holds
  -> PtHyp (fixed,rigid0,rigid) and nonzero trace;
oneChar_unramU -> vlen_le -> mprime_holds.
Reduced qualitative graph:
oneChar_unramU_finite43 -> model_len_finite43 -> M2,M1 ->
  cotLen_finite43 -> rk_holds,sm_holds;
  -> rigid_nonpositive43 -> tanCoc_isBK,bloch_kato_nonpositive_weight;
  -> vlen_le -> mprime_holds.
Original quantitative graph and all other callers retained. No proof-term
edge, axiom or constructor deletion claimed; context key includes exact
D,U,S,M,c,l,e,psi,host and consumer projection; backtrack if replay fails.
Source ledger (paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
CommutativeAlgebra/GradedModulesLength/MainCotSpan.lean 52e45205d53b2e339e7467f91fab3fb015b438da
CommutativeAlgebra/GradedModulesLength/Mprime.lean 7a0d0423cebb2d4a5b3193d7e58515195ac54421
CommutativeAlgebra/GradedModulesLength/SmHolds.lean 42702dd85bd19736efb7d6341d2d181d766cb30f
CommutativeAlgebra/GradedModulesLength/LinPartApply.lean cb6802a745ea34833571f93cfbde1a036298751b
CommutativeAlgebra/OrbitVanishingLocal.lean 5aacd23b05f73bd138d4e9adb04268c61988ae15
UnitaryThreeGroups/ModelUpper.lean b5bd5708c17a55d1a0f190eb9908ff15e2b3cd44
UnitaryThreeGroups/VlenLe.lean 7366053a17524d379ac789425deea06678f2d3bf
UnitaryThreeGroups/GradedModelSpansCotOfRigidWeights.lean 6092bc04cee4fde3694d3af9146da1257c015688
UnitaryThreeGroups/ModelIdealFinitenessOfWeightZeroFinite.lean ee215983b7b9e3372dd7155b496b7c04411ed8e9
ModularityArgument/ThresholdArguments/DenseThresholdCases/FPtHypU.lean 691a4043b5e6b8345da617fa616e4f46c7da07f8
ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean 3560d196d696e5ebceded72e747a060392837b91
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
Local Lean/lake unavailable. Existing CI jobs 45577239749,45576756833,
45670987597 freshly fetched: pick/run/record success; NONE validates this file.
Executed 47 fail-on-error pinned blob/statement/dataflow checks in connector
JS. No new essential RH obligation discharged, no runtime gain claim.
RESUME HERE: replay this file in warmed pinned Lean with engine oleans.
If open private fails use same-module FPtHypU overlay. Audit both actual
original and new declarations and preserve constructor-inclusive graphs.
Use this only where a qualitative projection is consumed; for quantitative
CountI follow actual core_holds and the surviving same-host trace catalogue,
not another attempt to prove already-supplied LemmaM/Mprime.
HANDOFF TO integration, Galois, audit, kernel. RH OPEN.
-/
set_option maxHeartbeats 1000000
set_option synthInstance.maxHeartbeats 200000

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.Alg.M UpperTheory.V.U3 UpperTheory.V.Z.J

theorem UpperTheory.V.Alg.M.cotLen_finite43 :
    ∀ (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (maximalIdeal O) O] [CharZero O]
      (A : Type) [CommRing A] [Algebra O A] (𝒜 : ℤ → Submodule O A) [GradedAlgebra 𝒜] (x : A →ₐ[O] O), IsWRing 𝒜 x →
      ∀ (r s r' s' m : ℕ) (Q : Eqns 𝒜 x r s r' s' m),
      SmoothPt 𝒜 x (mDims r s r' s' m) → SpansCot x 𝒜 (-1) Q.F →
      cotLen x 𝒜 (-1) Q.F ≠ ⊤ := by
  intro O _ _ _ _ _ A _ _ 𝒜 _ x hW r s r' s' m Q hsm hF
  haveI := hW.co
  obtain ⟨hfin, hrk⟩ := rk_holds O A 𝒜 x hW _ hsm
  have hrk' : Module.finrank O (cotLat x 𝒜 (-1)) = r := by rw [hrk]; simp [mDims]
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible O
  obtain ⟨F', y, c, hspan, hy, hlast, hlen⟩ :=
    sm_holds O A 𝒜 x (hW.fixed _ (by norm_num)) r Q.F Q.hF hfin hrk' hF ϖ hϖ
  rw [hlen]
  exact ENat.coe_ne_top _

theorem UpperTheory.V.U3.model_len_finite43 :
    ∀ {l : ℕ} [Fact l.Prime] {c : Coef l} {Γ H : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
      {η : Γ →* ℤˣ} {Ψ : Γ →* (c.O)ˣ} {N : Set Γ} {ι : H →* Γ} {hι : Continuous ι}
      {U : Univ (GCond.noCondition c.O (η.comp ι) (Ψ.comp ι))} {I : Ideal U.R} {cc g₁ : Γ} (S : SRing N hι U I cc g₁) (M : Model S (PadicAlgCl l)), l ≠ 2 → Marks η Ψ cc g₁ →
      Module.Finite c.O (weightZeroSubalgebra c.O S.r.hom) →
      (∀ j : ℤ, j ≤ 0 → RigidWt j S.r.hom (toBar M.x₀)) → M.len ≠ ⊤ := by
  classical
  intro l _ c Γ H _ _ _ _ _ _ η Ψ N ι hι U I cc g₁ S M hl hmk hfin hrig
  letI := M.cr
  letI := M.al
  letI := M.gr
  have hM2 := modelIdeal_finiteness_of_weightZero_finite S M hl hmk hfin
  have hM1 := gradedModel_spansCot_of_rigid_weights S M hl hmk hM2 hrig
  haveI := c.dvr
  obtain ⟨-, -, -, hcomp, -, -, -, -, -⟩ := UpperTheory.V.Base.dvrFacts l c.O
  haveI := hcomp
  obtain ⟨-, hsm, hF, -, -⟩ := hM1
  change cotLen M.x M.𝒜 (-1) M.Q.F ≠ ⊤
  exact cotLen_finite43 c.O M.A M.𝒜 M.x M.wring M.r M.s M.r' M.s' M.m M.Q hsm hF

section
open private isLocPt_toBar map_reducible_three_dim coboundary_of_mem_B1 from Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.MapReducibleThreeDim
theorem UpperTheory.V.Z.J.rigid_nonpositive43 :
    U3.CohInp → ∀ {Ω : Type} [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] {K : Type} [Field K] [NumberField K] [Algebra K Ω]
      {l : ℕ} [Fact l.Prime] {c : Coef l} {N : ℕ} [NeZero N] {e : ℕ} {ψ : DirichletCharacter c.O N} (D : Dat Ω K c e ψ) {U : D.ULoc} {g₁ : G ℚ Ω}, D.Marked g₁ → ∀ (S : D.Ring U g₁), ∀ x₀ : S.R →ₐ[c.O] c.O, IsBase D.η D.Ψ S.r.hom x₀ →
      ∀ j : ℤ, j ≤ 0 → RigidWt j S.r.hom (toBar x₀) := by
  intro hC Ω _ _ _ K _ _ _ l _ c N _ e ψ D U g₁ hM S x₀ hx
  have h0 : push (toBar x₀) S.r.hom = r0 D.η D.ΨQ := by
    have e1 : push (toBar x₀) S.r.hom =
        (GG.map (algebraMap c.O (PadicAlgCl l))).comp (push x₀ S.r.hom) := rfl
    rw [e1, show push x₀ S.r.hom = r0 D.η D.Ψ from hx, map_reducible_three_dim]
    rfl
  intro j hj F hF hw
  have h1 := tanCoc_isBK hC D hM S F (hF ▸ isLocPt_toBar x₀)
  rw [hF, h0] at h1
  rw [h0]
  exact coboundary_of_mem_B1 _ _ (bloch_kato_nonpositive_weight hC D j hj _ h1.1 hw h1.2)
end

section
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
theorem UpperTheory.V.Z.J.oneChar_unramU_finite43
    (hC : U3.CohInp) (hLP : LemmaP)
    (hA : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt)
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (K : Type) [Field K] [NumberField K] [IsCMField K] [Algebra K Ω]
    [IsAlgClosure K Ω] (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N] (e : ℕ) (ψ : DirichletCharacter c.O N)
    (he : eO l c.O = 1) (hG : GD Ω K l e ψ) (ι : Qbar l ≃+* ℂ) :
    Vlen Ω c e ψ ≠ ⊤ := by
  classical
  obtain ⟨D⟩ := exists_dat hG
  obtain ⟨g₁, hM, hFin, hB, hW⟩ := hA Ω K l c N e ψ D he ι
  obtain ⟨U⟩ := exists_uLoc hC D
  obtain ⟨S⟩ := exists_ring hC D U g₁ hM
  obtain ⟨M⟩ := exists_model hC hLP D hM S
  have hrig := rigid_nonpositive43 hC D hM S M.x₀ M.base
  have hlen := model_len_finite43 S M hG.l_odd hM (hFin U S) hrig
  have hV := vlen_le hC Alg.M.mprime_holds D hM S M
  exact ne_top_of_le_ne_top hlen hV

theorem UpperTheory.V.Z.J.oneCharU_native43 :
    U3.CohInp → LemmaP → _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW → _root_.UpperTheory.V.Th.RigidityFirstCase → _root_.UpperTheory.V.Th.RigiditySecondCase → _root_.UpperTheory.V.Z.J.AdmI_s → _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt → _root_.UpperTheory.V.Z.J.OneCharU_s := by
  intro hC hLP hK hRI hRII hAd hA
  first
  | (rh_reduce 1 using [UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy, Alg.M.main_holds, Alg.M.mprime_holds]; done)
  | (rh_auto_frontier 1; done)
  | (rh_auto 1; done)
  | exact UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds hLP hK hRI hRII hAd hA
end

rh_prune UpperTheory.V.Alg.M.main_holds as RHMain43Pruned
rh_prune UpperTheory.V.Alg.M.mprime_holds as RHMprime43Pruned
rh_scan UpperTheory.V.Alg.M.main_holds limit 2000
rh_scan UpperTheory.V.Alg.M.cotLen_finite43 limit 2000
rh_scan UpperTheory.V.U3.model_upper limit 2000
rh_scan UpperTheory.V.U3.model_len_finite43 limit 2000
rh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy limit 2000
rh_scan UpperTheory.V.Z.J.oneChar_unramU_finite43 limit 2000
#print axioms UpperTheory.V.Alg.M.main_holds
#print axioms UpperTheory.V.Alg.M.mprime_holds
#print axioms UpperTheory.V.Alg.M.cotLen_finite43
#print axioms UpperTheory.V.U3.model_len_finite43
#print axioms UpperTheory.V.Z.J.rigid_nonpositive43
#print axioms UpperTheory.V.Z.J.oneChar_unramU_finite43
#print axioms UpperTheory.V.Z.J.oneCharU_native43
