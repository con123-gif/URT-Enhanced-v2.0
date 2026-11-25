import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LinkedUnlE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

/-!
Lane 12 RUN40, 25 Nov 2026. SOURCE-MATCHED / PREPARED Lean, NOT COMPILED. RH OPEN.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine and original e0dc8f7f read; SWARM, HANDOFF, AGENTS, continuity/state/log/protocol openings and CI consulted. Latest 12 peer commits surveyed; kernel 72bd1ee, integration a5f9e057, Galois 3408a84 inspected. Prior lane 46e9230b retained (no merge of uncompiled candidates). Observed working head 72bd1ee1011da96cfe763fa2005d2a4174eb273e. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Actual CountI and CountV use both the linked-unramified and adjoint-lifting routes, which share the same DenseThresholdMainCase under the same hH. Inspecting native TCoreOf, its full PhiAll packet is used only once, at (hΦ l L Ω s V).2.1. Hence the exact weaker consumer premise is PhiCond for the global G0 only, not for Γ or the local Gv. This is not a claim that the other fields are globally irrelevant. In native RegDet, hΦ is used exactly once, to establish finite-dimensionality of the twisted-adjoint cocycle module. The finite trace detector subsequently follows from Det.finDet with no use of hΦ. Thus the stronger condition may be replaced by Module.Finite (Qbar l) (Z1 (Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ))) at that consumer; the source-derived bridge recovers it from PhiCond with the original continuity argument. All irreducibility, density, continuity, epsilon nontriviality and trace hypotheses retained. Original ordinary_vanishing_two still uses full phiAll for b0Ex: do NOT globally retire any PhiAll component. This run isolates a smaller mathematical interface, not a proof of new finiteness.
Original selected graph: CountI/CountV -> linkedUnlE -> core_alt_bis -> core_of_ord_vanishing_two_phi_all -> PhiAll (G0 projection), regDet -> finite_cocycles; CountI/CountV -> adjoint_lifting_of_cohomology -> same core_alt_bis; ordinary_vanishing_two -> phiAll separately. Candidate: CountI/CountV -> shared hCore -> rhDep40_core_g0 -> PhiG0 -> regDet_bridge -> regDet_finite; linkedUnlE_core and adjointLiftingTheorem_of_locPrints_of_core both consume hCore; ordinary and other siblings unchanged. Do not combine distinct hH/host instances. Cache key pin/toolchain + actual l,L,Ω,s,V,F,O,ρ,P and all local hypotheses/typeclass data. Original graphs and axiom records stay intact; backtrack to native body or earlier candidate if replay fails.
Pinned native blobs (relative to AutomorphicVarieties):
TheoremsMuLinked/GaloisRepresentationTypes/RegDet.lean ec11b5520764aba76f59a564cfadfb95120fabf7
WeilGroupCharacters/LocCFTAll.lean d30b7131ff84203e3975b2b0912911c48ae3fa15
ModularityArgument/ThresholdArguments/DenseThresholdCases/TCoreOf.lean 118ed364d436cd0e7153e12f6430487eba9fcd39
ModularityArgument/ThresholdArguments/DenseThresholdCases/ThFinal.lean 9fe53935d841b9439d38f29fdc844a48ed70d876
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e
ModularityArgument/ThresholdArguments/DenseThresholdCases/AdLOf.lean 9c20444e8d122e5f6a73c880239671ba9e128aae
ModularityArgument/ThresholdArguments/DenseThresholdCases/TOrdVan.lean 62344a2c95c533cc4e219a5900f881e9bde8af46
ModularityArgument/ThresholdArguments/DenseThresholdCases/LocPublished.lean 51bdd3149222f1fc08f7b1efa0fe63c36168c082
Executed 63 fail-on-error connector JS source/identity/reversal checks (not Lean). Initial construction halted on ambiguous reverse text match; corrected to reverse at exact patch offset, then reran checks. Native lean/lake absent and git DNS fails locally. Re-read published baseline CI status files for 45577239749 and 45576756833: pass only for existing engine/conditional root. No new CI replay, no new axiom evidence. The new candidate has native scans, prune and bounded search bridge below; not queued or compiled. No physical gates or protected workflows changed.
RESUME HERE: replay this module in pinned native environment; compare actual CountI/CountV scans with original and RUN39 separately before merging. Prove or reduce the remaining actual finite-cocycle supplier and inspect Det.finDet for a directly finite trace-image criterion. Full PhiAll remains at ordinary b0Ex, and all other count/geometry/prime-window obligations remain open.
HANDOFF TO kernel extractor, integration, Galois, audit.
-/

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial Matrix UpperTheory.V UpperTheory.V.HV UpperTheory.V.Alg GlobalTheory.GalOfCusp
theorem UpperTheory.V.Th.rhDep40_regDet_finite :
    ∀ {l : ℕ} [Fact l.Prime] (F : W.GFrame l) (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)] {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l)) (P : GL (Fin n) (Qbar l)), 1 ≤ n → Module.Finite (Qbar l) (Z1 (Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ))) → (∃ g : F.G₀, F.ε g ≠ 1) → Continuous ρ → Th.TypeI F ρ → Th.N3 F ρ → Th.RegDet F O ρ P := by
  intro l _ F O _ _ _ _ n ρ P hn hΦ hε hρ hI h3
  classical
  haveI : CompactSpace F.G₀ :=
    isCompact_iff_compactSpace.1 (Subgroup.isClosed_of_isOpen _ F.η_open).isCompact
  have halg : ∀ x : ℤ_[l], algebraMap ℤ_[l] (Qbar l) x = algebraMap ℚ_[l] (Qbar l) (x : ℚ_[l]) :=
    fun x => IsScalarTower.algebraMap_apply ℤ_[l] ℚ_[l] (PadicAlgCl l) x
  have hχ : ∀ g : F.G₀, ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) =
      algebraMap ℚ_[l] (Qbar l) (((F.ε g : ℤ_[l]ˣ) : ℤ_[l]) : ℚ_[l]) := fun g => by
    rw [← halg, IsScalarTower.algebraMap_apply ℤ_[l] O (Qbar l)]
    rfl
  have hχc : Continuous fun g : F.G₀ => ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) := by
    simp only [hχ]
    have h1 : Continuous fun g : F.G₀ => ((F.ε g : ℤ_[l]ˣ) : ℤ_[l]) :=
      Units.continuous_val.comp (F.ε_cont.comp continuous_subtype_val)
    exact (continuous_algebraMap ℚ_[l] (PadicAlgCl l)).comp (continuous_subtype_val.comp h1)
  have hm : Continuous fun g => W.mat ρ g := Units.continuous_val.comp hρ
  have hm' : Continuous fun g : F.G₀ => W.mat ρ g⁻¹ := hm.comp continuous_inv
  let R : Representation (Qbar l) F.G₀ (Matrix (Fin n) (Fin n) (Qbar l)) :=
    Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)
  have hR : ∀ g X, R g X =
      ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) • (W.mat ρ g * X * W.mat ρ g⁻¹) := fun g X => by
    have e : W.mat ρ g⁻¹ = Units.val (ρ g)⁻¹ := by
      rw [← map_inv ρ g]; rfl
    rw [e]
    rfl
  haveI : Module.Finite (Qbar l) (Z1 R) := hΦ
  let S : Type := {σ : F.G₀ // σ ∈ F.G' ∧ (W.mat ρ σ).charpoly.Separable}
  let f : S → ℕ → Z1 R →ₗ[Qbar l] Qbar l := fun σ k =>
    { toFun := fun z => (z.1 σ.1 * W.mat ρ σ.1 ^ k).trace
      map_add' := fun a b => by
        simp only [Submodule.coe_add, Pi.add_apply, Matrix.add_mul, Matrix.trace_add]
      map_smul' := fun c a => by
        simp only [Submodule.coe_smul, Pi.smul_apply, Matrix.smul_mul, Matrix.trace_smul, RingHom.id_apply] }
  obtain ⟨T, hT⟩ := Det.finDet f
  refine ⟨T.card, fun j => (T.equivFin.symm j).1.1, fun j => (T.equivFin.symm j).1.2, ?_⟩
  intro z hzc hz _ htr
  have hzZ : z ∈ Z1 R := (mem_Z1_iff_cocycle _ _).2 ⟨hzc, fun g h => by rw [hR]; exact hz g h⟩
  have hall := hT ⟨z, hzZ⟩ fun s hs k =>
    htr s.1 ⟨T.equivFin ⟨s, hs⟩, by simp only [Equiv.symm_apply_apply]⟩ k
  refine Det.detG ρ (F.eps O (Qbar l)) F.G' z hn (Abelianization.commutator_subset_ker _) ?_ ?_ hI hz ?_
  · intro g hg
    have h1 : F.ε g = 1 := hg
    rw [MonoidHom.mem_ker]
    apply Units.ext
    rw [hχ, h1]
    simp
  · obtain ⟨g, hg⟩ := hε
    intro h
    apply hg
    have h1 := hχ g
    rw [h, MonoidHom.one_apply, Units.val_one, ← map_one (algebraMap ℚ_[l] (Qbar l))] at h1
    have h2 := (algebraMap ℚ_[l] (Qbar l)).injective h1
    exact Units.ext (Subtype.ext h2.symm)
  · intro g hg
    by_contra hne
    have ho : IsOpen {x : F.G₀ | (z x * W.mat ρ x).trace ≠ 0} :=
      isOpen_ne_fun (hzc.mul hm).matrix_trace continuous_const
    obtain ⟨σ, ⟨h1, h2⟩, h4⟩ := h3 _ ho ⟨g, hne, hg⟩
    have h5 : (z σ * W.mat ρ σ ^ 1).trace = 0 := hall ⟨σ, h2, h4⟩ 1
    rw [pow_one] at h5
    exact h1 h5

theorem UpperTheory.V.Th.rhDep40_regDet_bridge :
    ∀ {l : ℕ} [Fact l.Prime] (F : W.GFrame l) (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)] {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l)) (P : GL (Fin n) (Qbar l)), 1 ≤ n → PhiCond F.G₀ l → (∃ g : F.G₀, F.ε g ≠ 1) → Continuous ρ → Th.TypeI F ρ → Th.N3 F ρ → Th.RegDet F O ρ P := by
  intro l _ F O _ _ _ _ n ρ P hn hΦ hε hρ hI h3
  classical
  haveI : CompactSpace F.G₀ :=
    isCompact_iff_compactSpace.1 (Subgroup.isClosed_of_isOpen _ F.η_open).isCompact
  have halg : ∀ x : ℤ_[l], algebraMap ℤ_[l] (Qbar l) x = algebraMap ℚ_[l] (Qbar l) (x : ℚ_[l]) :=
    fun x => IsScalarTower.algebraMap_apply ℤ_[l] ℚ_[l] (PadicAlgCl l) x
  have hχ : ∀ g : F.G₀, ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) =
      algebraMap ℚ_[l] (Qbar l) (((F.ε g : ℤ_[l]ˣ) : ℤ_[l]) : ℚ_[l]) := fun g => by
    rw [← halg, IsScalarTower.algebraMap_apply ℤ_[l] O (Qbar l)]
    rfl
  have hχc : Continuous fun g : F.G₀ => ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) := by
    simp only [hχ]
    have h1 : Continuous fun g : F.G₀ => ((F.ε g : ℤ_[l]ˣ) : ℤ_[l]) :=
      Units.continuous_val.comp (F.ε_cont.comp continuous_subtype_val)
    exact (continuous_algebraMap ℚ_[l] (PadicAlgCl l)).comp (continuous_subtype_val.comp h1)
  have hm : Continuous fun g => W.mat ρ g := Units.continuous_val.comp hρ
  have hm' : Continuous fun g : F.G₀ => W.mat ρ g⁻¹ := hm.comp continuous_inv
  let R : Representation (Qbar l) F.G₀ (Matrix (Fin n) (Fin n) (Qbar l)) :=
    Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)
  have hR : ∀ g X, R g X =
      ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) • (W.mat ρ g * X * W.mat ρ g⁻¹) := fun g X => by
    have e : W.mat ρ g⁻¹ = Units.val (ρ g)⁻¹ := by
      rw [← map_inv ρ g]; rfl
    rw [e]
    rfl
  haveI : Module.Finite (Qbar l) (Z1 R) := Det.finite_cocycles_matrixRepresentation_of_phiCond R hΦ fun X => by
    simp only [hR]
    exact hχc.smul ((hm.mul continuous_const).mul hm')
  exact UpperTheory.V.Th.rhDep40_regDet_finite F O ρ P hn (show Module.Finite (Qbar l) (Z1 R) from inferInstance) hε hρ hI h3

end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing UpperTheory.V.HV GlobalTheory.GalOfCusp
namespace UpperTheory.V.W
def RHDep40PhiG0 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [IsCMField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (s : HidaSetting l L Ω) (V : s.Lev),
    Alg.PhiCond V.frame.G₀ l
theorem rhDep40_phiG0_of_phiAll (h : PhiAll) : RHDep40PhiG0 := by
  intro l _ L Ω _ _ _ _ _ _ s V
  exact (h l L Ω s V).2.1
end UpperTheory.V.W
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial Matrix UpperTheory.V UpperTheory.V.HV UpperTheory.V.Alg GlobalTheory.GalOfCusp
private theorem ad_eq {H K : Type} [Group H] [CommRing K] {n : ℕ} (ρ : H →* GL (Fin n) K) (g : H) (X : Matrix (Fin n) (Fin n) K) :
    Loc.adGL ρ g X = W.mat ρ g * X * W.mat ρ g⁻¹ := by
  change _ = (ρ g : Matrix (Fin n) (Fin n) K) * X * (ρ g⁻¹ : GL (Fin n) K)
  rw [map_inv]
  rfl
private theorem cont_sub {H K : Type} [Group H] [TopologicalSpace H] [ContinuousInv H] [CommRing K] [TopologicalSpace K]
    [IsTopologicalRing K] {n : ℕ} {a y : H → Matrix (Fin n) (Fin n) K} (ha : Continuous a) (hy : Continuous y)
    (X : Matrix (Fin n) (Fin n) K) : Continuous fun g => y g - (a g * X * a g⁻¹ - X) :=
  hy.sub (((ha.matrix_mul continuous_const).matrix_mul (ha.comp continuous_inv)).sub continuous_const)
theorem UpperTheory.V.Th.rhDep40_core_g0 :
    _root_.UpperTheory.V.Th.OrdVan2Alt → W.RHDep40PhiG0 → _root_.UpperTheory.V.Th.DenseThresholdMainCase := by
  intro hO hΦ l _ L Ω _ _ _ _ _ _ s V hV _ c _ n h2 h4 r h0 B ι x ρ hN P R hP hR z hz hzo
  obtain ⟨h, hh⟩ := hN.arith
  obtain ⟨hD, -⟩ := Det.redB x ρ hN.rep
  have hfull : Submodule.span (Qbar l) (Set.range (W.mat ρ)) = ⊤ :=
    KStar.Schema.span_eq_top_of_irreducible _ fun N hs => hN.irr N fun g _ => hs g
  have hI := (Ws.Eb.relKill B x ρ hfull hD).2
  obtain ⟨X₀, hpol, hext⟩ := Det.polNorm V.frame ρ P R z hR hz.2
  have heps : ∃ g : V.frame.G₀, V.frame.ε g ≠ 1 := by
    obtain ⟨g, -, hg⟩ := h0.2.2
    refine ⟨g, fun e => hg ?_⟩
    have e' : (V.frame.ε.comp V.frame.η.ker.subtype) g = 1 := e
    rw [W.GFrame.eps, MonoidHom.comp_apply, e', map_one]
  have hdet := UpperTheory.V.Th.rhDep40_regDet_bridge V.frame c.O ρ P (by omega) (hΦ l L Ω s V) heps hN.cont hN.irr hN.n3
  have hno : ∀ (v : W.Vl l L) i j, x.psi v i ≠ x.psi v j * (cycBar L Ω l).comp (Dec (F := L) (s.A v)).subtype := by
    intro v i j e
    by_cases hij : i = j
    · subst hij
      have h1 := (s.hA v.1 ((l : ℕ) : 𝓞 (W.Lp L))).2 v.2
      exact Det.epsDec (s.A v.1) (s.w v.1) (s.hw v.1) ((s.hw v.1 _).1 (by simpa using h1)) (left_eq_mul.1 e)
    · obtain ⟨g, hg, hf⟩ := hN.free v
      refine hf i j hij 1 one_pos ?_
      have e1 : V.ε (toGS Ω V.S' (W.resP L Ω (Subtype.val g))) = cycZ (W.Lp L) Ω l (W.resP L Ω (Subtype.val g)) :=
        DFunLike.congr_fun V.hε _
      have e2 : cycZ L Ω l (Subtype.val g) = 1 := e1.symm.trans hg
      have e3 : cycBar L Ω l (Subtype.val g) = 1 := by rw [cycBar, MonoidHom.comp_apply, e2, map_one]
      have e4 : x.psi v i g = x.psi v j g * cycBar L Ω l (Subtype.val g) := DFunLike.congr_fun e g
      rw [e3, mul_one] at e4
      simp only [pow_one]
      exact e4
  have hc : Continuous fun g : V.frame.G₀ => W.mat ρ g := Units.continuous_val.comp hN.cont
  refine (hO l L Ω s V c n r B ι x h ρ P hV h2 h4 h0 hh hD hN.cont hN.aut hfull hP hN.unr0 hno hdet
    (fun g => z g - Pa.dY V.frame (W.mat ρ) X₀ g) ⟨?_, fun g g' => ?_, hpol, fun u g hg => ?_, fun v => ?_⟩).elim hext
  · exact cont_sub hc (hz.1.comp continuous_subtype_val) X₀
  · have e1 : z ((g * g' : V.frame.G₀) : V.frame.Γ) = z g + W.mat ρ g * z g' * W.mat ρ g⁻¹ := by
      rw [← ad_eq, ← hR.ad]
      exact hz.2 _ _
    have e2 : W.mat ρ g * W.mat ρ g⁻¹ = 1 := by rw [← map_mul, mul_inv_cancel, map_one]
    simp only [e1, Pa.dY, _root_.mul_inv_rev, map_mul]
    noncomm_ring
  · simp only [hzo.ine u g hg, Pa.dY, W.mat, MonoidHom.comp_apply, map_inv, hI u g hg]
    simp
  · obtain ⟨a, X, ha⟩ := hzo.ord v
    refine ⟨a⁻¹, X - X₀, fun g => ?_⟩
    obtain ⟨a1, a2, a3, a4⟩ := ha g
    have e : z (V.frame.φ v g) - Pa.dY V.frame (W.mat ρ) X₀ (V.frame.φ v g) - Pa.dY V.frame (W.mat ρ) (X - X₀) (V.frame.φ v g) =
        z (V.frame.φ v g) - (Loc.adGL (ρ.comp (V.frame.φ v)) g X - X) := by
      rw [ad_eq]
      have e1 : ∀ t, W.mat (ρ.comp (V.frame.φ v)) t = W.mat ρ (V.frame.φ v t) := fun _ => rfl
      simp only [Pa.dY, e1, map_inv]
      noncomm_ring
    rw [inv_inv, e]
    exact ⟨a1, a2, a3, a4⟩
end

end

section
open UpperTheory.Top UpperTheory.V.HV
namespace UpperTheory.V.Th
theorem rhDep40_core_from_prints (hH : _root_.UpperTheory.V.Af.HypothesesH') : DenseThresholdMainCase :=
  rhDep40_core_g0 (ordinary_vanishing_two_of_printed_hida hH)
    (W.rhDep40_phiG0_of_phiAll (W.phiAll (_root_.UpperTheory.V.W.cohP_alt hH.litN)))
end UpperTheory.V.Th
end

section
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.Z.J
open UpperTheory.V.HV UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J
theorem rhDep40_linkedUnlE_core (hH : _root_.UpperTheory.V.Af.HypothesesH') (hCore : _root_.UpperTheory.V.Th.DenseThresholdMainCase) : LinkedUnlE :=
  have hN := hH.litN
  have hA := hH.toClassicalTheorems
  _root_.UpperTheory.Gal.projectedFormsSystemPart.linkedUnlE_alt hN.aut.art (_root_.UpperTheory.V.W.local_class_field_theory_all_of_literal_automorphy hN) (_root_.UpperTheory.V.HV.Core.modU_of_printsH hH) (_root_.UpperTheory.V.Z.J.D.modularity_n_of_printed_mult_comp hH Z.Mult.mult_free Z.Mult.compOf_free) levEx
    (lamEx (_root_.UpperTheory.V.W.local_class_field_theory_all_of_literal_automorphy hN)) (b0Ex (phiAll (_root_.UpperTheory.V.W.cohP_alt hN))) (_root_.UpperTheory.V.Z.Sym.W.unitary_three_automorphy_dense_of_prints hH) (_root_.UpperTheory.V.Z.Win.Birth.seed2_alt hH) (_root_.UpperTheory.V.Sd.twist_of_printed_results hA) (_root_.UpperTheory.V.Sd.alg_cyclotomic_of_printed_results hA) (_root_.UpperTheory.V.Sd.alg_restriction_of_printed_results hA)
    (tanA (_root_.UpperTheory.V.W.global_compat_printed_of_literal_automorphy_n hN) (_root_.UpperTheory.V.W.locPrints_of_litN hN)) hCore
theorem rhDep40_count_i (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hKa : _root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.KatoTwoW) (h3 : _root_.UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt) : CountI :=
  have hC := _root_.UpperTheory.V.HV.Core0.cohInp_alt hH.litN hK
  have hCore := _root_.UpperTheory.V.Th.rhDep40_core_from_prints hH
  have hE := unlEnd3E (rhDep40_linkedUnlE_core hH hCore)
  have hLift := _root_.UpperTheory.V.Th.adjointLiftingTheorem_of_locPrints_of_core (_root_.UpperTheory.V.HV.U.locPrints_of_litN hH.litN) hCore
  U3.countI (U3.corGK (_root_.UpperTheory.V.Z.J.propGK_of_numberU3U_of_oneCharU (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints hH.toClassicalTheorems)
    (_root_.UpperTheory.V.Z.J.oneCharU_of_katoTwoW_rig_admI_automorphy hC Alg.M.main_holds Alg.M.mprime_holds Alg.lemmaP hKa (_root_.UpperTheory.V.Z.J.rigIUE_alt hC hH hLift hE)
      (_root_.UpperTheory.V.Z.Win.RR.rigII_a_alt hC hH hLift) (_root_.UpperTheory.V.Z.J.admissible_typeI_even_level_alt hC hH hE) h3)))
theorem rhDep40_count_v (hH : _root_.UpperTheory.V.Af.HypothesesH') (hK : ∃ CK : ℝ, LemmaK CK) (hS : _root_.UpperTheory.V.Aut.ThmS6Core_s) : CountV := by
  have hN := hH.litN
  have hCore := _root_.UpperTheory.V.Th.rhDep40_core_from_prints hH
  have hE := unlEnd3E (rhDep40_linkedUnlE_core hH hCore)
  have hLift := _root_.UpperTheory.V.Th.adjointLiftingTheorem_of_locPrints_of_core (_root_.UpperTheory.V.HV.U.locPrints_of_litN hH.litN) hCore
  obtain ⟨CK, hL⟩ := hK
  exact _root_.UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host (_root_.UpperTheory.V.UnitaryThreeInertia.unitary_lift_of_reduced_core hS) Alg.M.main_holds Alg.M.mprime_holds hN.coh.lf hN.coh.lt hN.coh.le
    hN.coh.gf hN.coh.ge hN.coh.pt (X.So.hostVanE CK hL (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK hN.coh.lf hN.coh.lt hN.coh.le)
    (X.xpp (X.corX X.lemmaX X.residual_bernoulli_nonvanishing)) (_root_.UpperTheory.V.Z.J.hostRigidUE_alt hH hLift hE) (_root_.UpperTheory.V.Z.J.hostNumberUE_alt hH hE (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints hH.toClassicalTheorems))

end UpperTheory.V.Z.J
end

theorem rhDep40_projection_replay (h : UpperTheory.V.W.PhiAll) : UpperTheory.V.W.RHDep40PhiG0 := by
  first
  | (rh_reduce 3 using [UpperTheory.V.W.rhDep40_phiG0_of_phiAll h]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact UpperTheory.V.W.rhDep40_phiG0_of_phiAll h

#print axioms UpperTheory.V.Th.regDet
#print axioms UpperTheory.V.Th.rhDep40_regDet_finite
#print axioms UpperTheory.V.Th.rhDep40_core_g0
#print axioms UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy
#print axioms UpperTheory.V.Z.J.rhDep40_count_i
#print axioms UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift
#print axioms UpperTheory.V.Z.J.rhDep40_count_v
rh_scan UpperTheory.V.Th.regDet limit 2000
rh_scan UpperTheory.V.Th.rhDep40_regDet_finite limit 2000
rh_scan UpperTheory.V.Th.rhDep40_core_g0 limit 2000
rh_scan UpperTheory.V.Z.J.rhDep40_count_i limit 2000
rh_scan UpperTheory.V.Z.J.rhDep40_count_v limit 2000
rh_prune UpperTheory.V.W.rhDep40_phiG0_of_phiAll as UpperTheory.V.W.rhDep40_phiG0_pruned
