/-!
RUN35 — lane 5, 25 Nov 2026. SOURCE-MATCHED / PREPARED; not compiled.
Mission blob cd0a176134d46b5b624896e56843a24915c14477.
Native pin 40e56bab026552e089d7afcfeff08d2defb9c005. FOneCharU 3560d196d696e5ebceded72e747a060392837b91, NumberU3US b31b9a1b9f3e84a792e915f864c681034c9eb258,
RhoKApply c4e9ab5ef67ade0119eaa89837301b7368ff548e (Dat.rhoK_apply, IsPt.red/int),
IsPtOf bdbc6364c883af07a4ca6a86e51480bdb9b458bb (isPt_push),
OneChar 500557b0d4b61403ac9d7cd94c67efaa8900fb74 (trace_reducible_three_dim),
FPropGKU 4887bdf435a54a8ab856102e15d60da39d041970 (actual consumer).
Living proof blob 464e82f81f646d4af85e1f5f70d379026df46261 lines 143-148, 160.
Peer heads bb0948b0 (fixed-layer budget), 490330a6 (no-layer principal
consumer), bb971bc3 (linked rigidity), 3f25eb66 (native evidence gate).
Do not mix source revisions. RUN34 blob 98ecbad0c1185e466d2f801f6d95097b3edd92b5.

RESULT: strengthen the native OneCharU_s supplier WITHOUT new
mathematical premises. For each selected rho, every g in G_K,
  ||tr rho(g) - (1+u(g)+u(g)^(-1))||_l < 1,
u = embedded Psi restricted to G_K. Proof: each selected f is a local
point by hT.1; isPt_push supplies red for every matrix entry. rhoK_apply
identifies the matrix exactly with the left component. The diagonal
reference has trace u+1+u^-1. The trace discrepancy is the sum of
three diagonal discrepancies; the ultrametric triangle inequality
bounds its norm by their maximum, strictly below 1. Retain the
original T.image rho and injectivity, admissibility, length bound.
The public coefficient descent h4 identifies u at EVERY g, not
merely the reference Frobenius. Thus the same predicate descends
without another witness or new coefficient uniformity assumption.
This supplies the missing congruence interface in RUN34; it is not
the complete finite-union aggregate consumer proof.

Original selected source graph: FPropGKU.propGK <- OneCharU_s <-
oneCharU_of_katoTwoW_rig_admI_automorphy <- private oneChar_unramU <-
model_upper, isPt_push, vlen_le, coefficient descent.
Candidate: same graph plus retained trace congruence in private
and public suppliers; old statement recovered by forget bridge.
No original edges retired, no kernel graph or axiom closure inferred.
Still open: actual singleton NumberU caller, residue-field reduction
and inversion-orbit finite weighted union, all nine original
supplier hypotheses, other VWinAt same-host leaves. Do not claim RH.
Source transformation: 10 unique anchors checked in retrieved
pinned text, generated this overlay; no Lean or Lake available.
Peer native evidence gate reported Landau error/sorryAx (3f25eb66);
baseline engine CI alone is not evidence for this candidate.
Native scan/prune/reduce/auto/frontier commands below are PREPARED;
need actual CI logs per file and caller substitution before PASS.
No URT advantage measured; exact algebra is sufficient here.
RESUME HERE: batch compile RUN30-35 with warmed pinned imports and
engine; fix exact elaboration failures. Then use OneCharU_res35 in
actual singleton FPropGKU adaptation and prove union multiplicity
with common residue field; retain original fallback. HANDOFF TO
integration, kernel and formal audit. New verified root closures: 0.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FOneCharU
import RHProofTermPrune
import RHRecursiveReductionAutoV3
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.DiscreteSeriesCoefficientsCuspidal
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.LinkedUnramifiedChains.WeightInfinitesimalCharacters.OneCharU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.RigEnd3
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.NumberU3US
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.AutomorphyUnramifiedCoefficients
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.AdmissibleOfTypeII
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FPtHypU
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.AutomorphyLifting.AutomorphyDescent.AutNewformW
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.KatoQuadraticCharacters.SphericalDecomposition.KatoTwoW

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

section
open private chHom gd_chHom exists_unram isPush_push trace_reducible_three_dim from Development.AutomorphicArithmetic.AutomorphicVarieties.TheoremsMuLinked.GaloisRepresentationTypes.OneChar
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.MainNotions.N Formalism.BasicNotions Formalism.BasicNotions.Loc GlobalTheory.GalOfCusp Matrix IsLocalRing
open UpperTheory.V UpperTheory.V.Base UpperTheory.V.HV UpperTheory.V.Alg UpperTheory.V.U3 UpperTheory.V.Z.J
attribute [-instance] UpperTheory.V.Pr.IsCD.toIsDomain UpperTheory.V.Pr.IsCD.toIsDiscreteValuationRing
def UpperTheory.V.Z.J.OneCharU_res35 : Prop :=
  ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (K : Type) [Field K] [NumberField K] [IsCMField K] [Algebra K Ω]
    [IsAlgClosure K Ω] (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N] (e : ℕ) (ψ : DirichletCharacter c.O N),
    GD Ω K l e ψ → ∀ (ι : Qbar l ≃+* ℂ) (σ : G K Ω) (t : Qbar l),
    t = algebraMap c.O (PadicAlgCl l) ((Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω σ) : c.O) + 1 +
      (((Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω σ))⁻¹ : c.Oˣ) : c.O)) →
    (∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ →
      (ρ σ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace ≠ t) →
    Vlen Ω c e ψ ≠ ⊤ ∧ ∃ X : Finset (G K Ω →* GL (Fin 3) (Qbar l)),
      (∀ ρ ∈ X, _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ) ∧ (∀ ρ ∈ X, ∀ ρ' ∈ X, Af.RepIso ρ ρ' → ρ = ρ') ∧
      (∀ ρ ∈ X, ∀ g : G K Ω,
        let u : (PadicAlgCl l)ˣ := Units.map (algebraMap c.O (PadicAlgCl l)).toMonoidHom
          (Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω g))
        ‖(ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ((u : Qbar l) + 1 + ((u⁻¹ : (PadicAlgCl l)ˣ) : Qbar l))‖ < 1) ∧
      Vn Ω c e ψ ≤ 2 * ∑ ρ ∈ X, vl l ((ρ σ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - t)

private theorem oneChar_unramU35 (hC : U3.CohInp) (hLM : LemmaM) (hLM' : LemmaM') (hLP : LemmaP) (hK : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW)
    (hRI : _root_.UpperTheory.V.Th.RigidityFirstCase) (hRII : _root_.UpperTheory.V.Th.RigiditySecondCase) (hAd : _root_.UpperTheory.V.Z.J.AdmI_s) (hA : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt)
    (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (K : Type) [Field K] [NumberField K] [IsCMField K] [Algebra K Ω]
    [IsAlgClosure K Ω] (l : ℕ) [Fact l.Prime] (c : Coef l) (N : ℕ) [NeZero N] (e : ℕ) (ψ : DirichletCharacter c.O N)
    (he : eO l c.O = 1) (hG : GD Ω K l e ψ) (ι : Qbar l ≃+* ℂ) (σ : G K Ω) (t : Qbar l)
    (ht : t = algebraMap c.O (PadicAlgCl l) ((Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω σ) : c.O) + 1 +
      (((Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω σ))⁻¹ : c.Oˣ) : c.O)))
    (hne : ∀ ρ : G K Ω →* GL (Fin 3) (Qbar l), _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ →
      (ρ σ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace ≠ t) :
    Vlen Ω c e ψ ≠ ⊤ ∧ ∃ X : Finset (G K Ω →* GL (Fin 3) (Qbar l)),
      (∀ ρ ∈ X, _root_.UpperTheory.V.Z.J.Adm3U_s ι e N ρ ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) ρ) ∧ (∀ ρ ∈ X, ∀ ρ' ∈ X, Af.RepIso ρ ρ' → ρ = ρ') ∧
      (∀ ρ ∈ X, ∀ g : G K Ω,
        let u : (PadicAlgCl l)ˣ := Units.map (algebraMap c.O (PadicAlgCl l)).toMonoidHom
          (Chr.Psi l e (Chr.dirG ℚ Ω ψ) (galEmb ℚ K Ω g))
        ‖(ρ g : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - ((u : Qbar l) + 1 + ((u⁻¹ : (PadicAlgCl l)ˣ) : Qbar l))‖ < 1) ∧
      Vn Ω c e ψ ≤ 2 * ∑ ρ ∈ X, vl l ((ρ σ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - t) := by
  classical
  obtain ⟨D⟩ := exists_dat hG
  obtain ⟨g₁, hM, hFin, hB, hW⟩ := hA Ω K l c N e ψ D he ι
  obtain ⟨U⟩ := exists_uLoc hC D
  obtain ⟨S⟩ := exists_ring hC D U g₁ hM
  obtain ⟨M⟩ := exists_model hC hLP D hM S
  have hmult : ∀ f : S.R →ₐ[c.O] PadicAlgCl l, HasMult D.η (push f S.r.hom) := fun f g => S.r.hasMult g
  let ρ : (S.R →ₐ[c.O] PadicAlgCl l) → (G K Ω →* GL (Fin 3) (Qbar l)) := fun f => D.rhoK (push f S.r.hom) (hmult f)
  have hσ : D.η (galEmb ℚ K Ω σ) = 1 := by
    rw [← MonoidHom.mem_ker, D.η_ker]
    exact galEmb_mem ℚ K Ω σ
  have htr : ∀ f, trDiff D.η D.Ψ S.r.hom (galEmb ℚ K Ω σ) f =
      (ρ f σ : Matrix (Fin 3) (Fin 3) (Qbar l)).trace - t := by
    intro f
    rw [trDiff, trace_reducible_three_dim, ht]
    congr 1
    exact AddMonoidHom.map_trace (f : S.R →+* PadicAlgCl l) _
  have hadm : ∀ f, TwoPt D.η S.r.hom f → _root_.UpperTheory.V.Z.J.Adm3U_s ι e N (ρ f) ∨ _root_.UpperTheory.V.Z.Win.Dn.Adm2A ι e (N * (discr K).natAbs) (ρ f) := by
    intro f hf
    have hp := isPt_push D hM S f hf.1
    rcases (twoPt_shape S hG.l_odd hM f hf).1 with h | h
    · exact Or.inl (hAd D hM S f hf.1 (hmult f) ι h (hB U S _ _ _ (isPush_push f _) h))
    · exact Or.inr (_root_.UpperTheory.GalN.V.adm2B_rhoK_of_typeII_of_modular_extensions hC D hM hp ι h
        (hW U S _ _ (isPush_push f _) h (typeII_facts hC D hM hp h).1))
  obtain ⟨hlen, T, hT, hTo, hle⟩ := model_upper S M hG.l_odd hM hLM (hFin U S)
    (_root_.UpperTheory.V.Z.J.ptHyp_of_autB_of_lemW_of_isBase hC hK hRI hRII D hM S ι hB hW M.x₀ M.base) (galEmb ℚ K Ω σ) hσ
    fun f hf => by rw [htr]; exact sub_ne_zero.2 (hne _ (hadm f hf))
  have hV := vlen_le hC hLM' D hM S M
  have hinj : ∀ f ∈ T, ∀ f' ∈ T, Af.RepIso (ρ f) (ρ f') → f = f' := by
    rintro f hf f' hf' ⟨g, hg⟩
    obtain ⟨s, hs⟩ := (twoPt_shape S hG.l_odd hM f (hT.1 f hf)).2 f' (hT.1 f' hf').1 ⟨g, fun x hx => by
      rw [D.η_ker, ← range_galEmb] at hx
      obtain ⟨y, rfl⟩ := hx
      exact (congrArg Units.val (eq_mul_inv_iff_mul_eq.1 (hg y))).symm⟩
    exact hTo f hf f' hf' s hs
  refine ⟨ne_top_of_le_ne_top hlen hV, T.image ρ, fun x hx => ?_, fun x hx x' hx' h => ?_, ?_, ?_⟩
  · obtain ⟨f, hf, rfl⟩ := Finset.mem_image.1 hx
    exact hadm f (hT.1 f hf)
  · obtain ⟨f, hf, rfl⟩ := Finset.mem_image.1 hx
    obtain ⟨f', hf', rfl⟩ := Finset.mem_image.1 hx'
    rw [hinj f hf f' hf' h]
  · intro x hx g
    obtain ⟨f, hf, rfl⟩ := Finset.mem_image.1 hx
    have hp := isPt_push D hM S f (hT.1 f hf).1
    let y := galEmb ℚ K Ω g
    let A := (push f S.r.hom y).mat
    let B := (r0 D.η D.ΨQ y).mat
    change ‖A.trace - ((D.ΨQ y : Qbar l) + 1 + (((D.ΨQ y)⁻¹ : (PadicAlgCl l)ˣ) : Qbar l))‖ < 1
    rw [← trace_reducible_three_dim D.η D.ΨQ y]
    change ‖A.trace - B.trace‖ < 1
    simp only [Matrix.trace, Fin.sum_univ_three]
    have h0 : ‖A 0 0 - B 0 0‖ < 1 := hp.red y 0 0
    have h1 : ‖A 1 1 - B 1 1‖ < 1 := hp.red y 1 1
    have h2 : ‖A 2 2 - B 2 2‖ < 1 := hp.red y 2 2
    have hsum : ‖(A 0 0 - B 0 0) + (A 1 1 - B 1 1) + (A 2 2 - B 2 2)‖ < 1 :=
      (IsUltrametricDist.norm_add_le_max _ _).trans_lt (max_lt
        ((IsUltrametricDist.norm_add_le_max _ _).trans_lt (max_lt h0 h1)) h2)
    convert hsum using 1 <;> ring
  · rw [Finset.sum_image fun f hf f' hf' h => hinj f hf f' hf' ⟨1, fun s => by rw [h, one_mul, inv_one, mul_one]⟩]
    simp only [← htr]
    exact (Chr.nrm_mono l hV hlen).trans hle
theorem UpperTheory.V.Z.J.oneCharU_res35_of_native :
    U3.CohInp → LemmaM → LemmaM' → LemmaP → _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW → _root_.UpperTheory.V.Th.RigidityFirstCase → _root_.UpperTheory.V.Th.RigiditySecondCase → _root_.UpperTheory.V.Z.J.AdmI_s → _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt → _root_.UpperTheory.V.Z.J.OneCharU_res35 := by
  intro hC hLM hLM' hLP hK hRI hRII hAd hA Ω _ _ _ K _ _ _ _ _ l _ c N _ e ψ hG ι σ t ht hne
  obtain ⟨c', ψ', he, hψ⟩ := exists_unram c ψ hG.ord
  have h1 : chHom c.O.val.toRingHom ψ = chHom c'.O.val.toRingHom ψ' := MulChar.ext fun a => hψ a
  have hG' : GD Ω K l e ψ' :=
    (gd_chHom c'.O.val.toRingHom Subtype.val_injective ψ').1
      (h1 ▸ (gd_chHom c.O.val.toRingHom Subtype.val_injective ψ).2 hG)
  obtain ⟨h2, h3⟩ := coefIndep Ω l c c' N e ψ ψ' hψ
  have h4 : ∀ g, Units.map (algebraMap c.O (PadicAlgCl l)).toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ) g) =
      Units.map (algebraMap c'.O (PadicAlgCl l)).toMonoidHom (Chr.Psi l e (Chr.dirG ℚ Ω ψ') g) := by
    intro g
    simp only [Chr.Psi, MonoidHom.mul_apply, MonoidHom.zpow_apply, map_mul, map_zpow]
    congr 1
    exact Units.ext (hψ _)
  have h5 := congrArg Units.val (h4 (galEmb ℚ K Ω σ))
  have h6 := congrArg (fun u : (PadicAlgCl l)ˣ => (u⁻¹).val) (h4 (galEmb ℚ K Ω σ))
  rw [Ne, h2, h3]
  have ht' : t = algebraMap c'.O (PadicAlgCl l) ((Chr.Psi l e (Chr.dirG ℚ Ω ψ') (galEmb ℚ K Ω σ) : c'.O) + 1 +
      (((Chr.Psi l e (Chr.dirG ℚ Ω ψ') (galEmb ℚ K Ω σ))⁻¹ : c'.Oˣ) : c'.O)) := by
    rw [ht, map_add, map_add, map_add, map_add, map_one, map_one]
    exact congrArg₂ (· + ·) (congrArg (· + 1) h5) h6
  obtain ⟨hfin, X, ha, hi, hr, hv⟩ := oneChar_unramU35 hC hLM hLM' hLP hK hRI hRII hAd hA Ω K l c' N e ψ' he hG' ι σ t ht' hne
  refine ⟨hfin, X, ha, hi, ?_, hv⟩
  intro ρ hρ g
  dsimp
  rw [h4 (galEmb ℚ K Ω g)]
  exact hr ρ hρ g
end

theorem UpperTheory.V.Z.J.oneCharU_res35_forget (h : UpperTheory.V.Z.J.OneCharU_res35) :
    UpperTheory.V.Z.J.OneCharU_s := by
  intro Ω _ _ _ K _ _ _ _ _ l _ c N _ e ψ hG ι σ t ht hne
  obtain ⟨hf, X, ha, hi, hr, hv⟩ := h Ω K l c N e ψ hG ι σ t ht hne
  exact ⟨hf, X, ha, hi, hv⟩

example (h : UpperTheory.V.Z.J.OneCharU_res35) : UpperTheory.V.Z.J.OneCharU_s := by
  first | rh_reduce 2 using [UpperTheory.V.Z.J.oneCharU_res35_forget] | exact UpperTheory.V.Z.J.oneCharU_res35_forget h
example (h : UpperTheory.V.Z.J.OneCharU_res35) : UpperTheory.V.Z.J.OneCharU_s := by
  first | (rh_auto 2; done) | exact UpperTheory.V.Z.J.oneCharU_res35_forget h
example (h : UpperTheory.V.Z.J.OneCharU_res35) : UpperTheory.V.Z.J.OneCharU_s := by
  rh_auto_frontier 2
  all_goals exact UpperTheory.V.Z.J.oneCharU_res35_forget h
#print axioms UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy
#print axioms UpperTheory.V.Z.J.oneCharU_res35_of_native
#print axioms UpperTheory.V.Z.J.oneCharU_res35_forget
rh_scan UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy limit 2000
rh_scan UpperTheory.V.Z.J.oneCharU_res35_of_native limit 2000
rh_prune UpperTheory.V.Z.J.oneCharU_res35_of_native as RH35OneCharResidualPruned
