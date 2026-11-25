import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TCoreOf
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

/-!
Lane 12 RUN41, 25 Nov 2026. Human source-matched local reduction / PREPARED Lean, NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory engine, original e0dc8f7f, SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, continuity/state/protocol/log openings read. Peer commits 619e11df (CountV qualitative Sha), 700e3969 (integration), a35ccf3d (audit), dbbc49e3 (character), efa4abe2 (editor) inspected; no combining their uncompiled changes. Prior dependency 20e156a7 preserved. Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native RegDet uses f(s,k)(z)=tr(z(s)rho(s)^k) for all k, but the only later use of hall is k=1, on the dense regular subset S of N=F.G'. Select finite trace functionals f(s)=tr(z(s)rho(s)) using native finDet with Unit index instead of Nat. If these vanish then all first traces vanish on S, and by continuity and N3 they vanish on N. Native detG then makes the cocycle a coboundary. Keep native RegDet conclusion (which may require all powers) as a compatibility bridge; no unsupported claim that its downstream consumers supply only first traces. Actual native TCoreOf caller copied and uses bridge. No new assumptions in bridge. The conditional trace-only theorem avoids PhiCond and finite-dimensionality directly, but the bridge still uses both.
Human check of limitation: under original detG hypotheses, kernel of the full first-trace map on continuous Z1 is exactly B1: one inclusion by detG+density; reverse follows for g in N from chi(g)=1 and cyclic trace tr((rho(g)Yrho(g)^-1-Y)rho(g))=0. B1 is a quotient of Mat_n, finite dimension <=n². Finite trace detection (even merely finitely many linear functionals) is therefore equivalent to finite-dimensionality of Z1 in this context, via injection Z1/B1 -> K^T and finite kernel. Thus do NOT represent this as solving or strictly weakening the cohomological finiteness obstruction. It removes the unnecessary infinite power-index family from the detector construction, and pinpoints the real finiteness bottleneck.
Original selected source graph: CountI/CountV -> shared core_alt_bis -> core_of_ord_vanishing_two_phi_all -> regDet -> finite_cocycles_matrixRepresentation_of_phiCond -> finite_cocycles_colRep_of_phiCond -> continuousCocycles_fg_integral_of_phiCond -> locallyConstant_cocycles_finite_of_phi. RegDet -> Det.finDet (Nat), Det.detG. Candidate: core41 -> bridge41 -> trace_of_finite -> Det.finDet (Unit), finite_cocycles_matrixRepresentation_of_phiCond; bridge41 -> regDet_trace -> Det.detG. Other uses of PhiAll (ordinary b0Ex etc.) retained. Cache exact pin/toolchain, host F,c,O,rho,P and instantiated hypotheses incl typeclasses, not theorem names alone. Backtrack original on failed replay. No global dependency deletion, no RH proof import. Preserve prior graphs, axiom evidence and all pending nodes.
Upstream source blobs relative to AutomorphicVarieties:
RegDet.lean ec11b5520764aba76f59a564cfadfb95120fabf7 (TheoremsMuLinked/GaloisRepresentationTypes)
FinDet.lean 89f57c48ec5d728d464dd625a3784d85acafe464, DetGCentral.lean 257f91268ae10e66b9d655cd11d80e3519acd6f0 (TheoremsMuLinked/CharacteristicPolynomials)
OrdZero.lean baabe925a6eb098970e7766c290873c4078ff0bf
TCoreOf.lean 118ed364d436cd0e7153e12f6430487eba9fcd39 (ModularityArgument/ThresholdArguments/DenseThresholdCases)
LocallyConstantCocyclesFiniteOfPhi.lean fc158bd325fad86e18310fc313cabd7588fd1b74
ContinuousCocyclesFgIntegralOfPhiCond.lean 52ffca2754d5dc76bc3edafdc726052b74a9f6b2
Executed 38 connector JS checks: pinned blob ec11b5520764aba76f59a564cfadfb95120fabf7; pinned blob 118ed364d436cd0e7153e12f6430487eba9fcd39; pinned blob 89f57c48ec5d728d464dd625a3784d85acafe464; pinned blob baabe925a6eb098970e7766c290873c4078ff0bf; pinned blob 257f91268ae10e66b9d655cd11d80e3519acd6f0; pinned blob fc158bd325fad86e18310fc313cabd7588fd1b74; pinned blob 52ffca2754d5dc76bc3edafdc726052b74a9f6b2; binder extraction; rename actual RegDet unique; rename actual RegDet inverse; narrow premise unique; narrow premise inverse; original finiteness span; one trace selector unique; one trace selector inverse; restrict native htr to first power unique; restrict native htr to first power inverse; density now uses single trace unique; density now uses single trace inverse; drop continuity used only by finite-cocycle bridge unique; drop continuity used only by finite-cocycle bridge inverse; drop inverse continuity used only by finite-cocycle bridge unique; drop inverse continuity used only by finite-cocycle bridge inverse; drop local compactness witness used only by finite-cocycle bridge unique; drop local compactness witness used only by finite-cocycle bridge inverse; original statement bridge unique; original statement bridge inverse; actual core name unique; actual core name inverse; actual TCoreOf consumer replacement unique; actual TCoreOf consumer replacement inverse; core private helpers renamed; original downstream detG calls retained; candidate no extra proof assumptions; native finite detector uses all labels but permits Unit; upstream residual hom finiteness only one call; integral source calls residual finiteness; no sorry/admit in candidate bodies. These are pinned-source and reversible substitution checks, NOT Lean execution. Native lean/lake unavailable; git DNS failed. Existing baseline CI status JSON reread, runs 45577239749 and 45576756833 pass only their old engine/root tests; new file not queued, no new axiom evidence. Commands below are prepared for native replay.
RESUME HERE: verify this file and actual core bridge in native environment; then target the single residual action kernel in locallyConstant_cocycles_finite_of_phi (hΦ used only as hΦ ρ.ker hker, with ρ' the actual residual action in cocycles_finitely_generated). Supply finite open-kernel Hom(ker ρ', F_l) directly for the same host, not for every open subgroup, while retaining other independent consumers of PhiCond/PhiAll. Do not repeat the trace-image equivalence as a new weakening. All full-window uniform arithmetic and prime-window obligations remain open.
HANDOFF TO: kernel extractor, integration, Galois, audit.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial Matrix UpperTheory.V UpperTheory.V.HV UpperTheory.V.Alg GlobalTheory.GalOfCusp

def UpperTheory.V.Th.RHDep41TraceFinite {l : ℕ} [Fact l.Prime] (F : W.GFrame l)
    (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)]
    {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l)) : Prop :=
  let S := {σ : F.G₀ // σ ∈ F.G' ∧ (W.mat ρ σ).charpoly.Separable}
  ∃ T : Finset S, ∀ z : Z1 (Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)),
    (∀ s ∈ T, (z.1 s.1 * W.mat ρ s.1).trace = 0) →
    ∀ s : S, (z.1 s.1 * W.mat ρ s.1).trace = 0

theorem UpperTheory.V.Th.rhDep41_trace_of_finite
    {l : ℕ} [Fact l.Prime] (F : W.GFrame l)
    (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)]
    {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l))
    (h : Module.Finite (Qbar l) (Z1 (Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)))) :
    UpperTheory.V.Th.RHDep41TraceFinite F O ρ := by
  classical
  let R : Representation (Qbar l) F.G₀ (Matrix (Fin n) (Fin n) (Qbar l)) :=
    Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)
  haveI : Module.Finite (Qbar l) (Z1 R) := h
  let S : Type := {σ : F.G₀ // σ ∈ F.G' ∧ (W.mat ρ σ).charpoly.Separable}
  let f : S → Unit → Z1 R →ₗ[Qbar l] Qbar l := fun σ _ =>
    { toFun := fun z => (z.1 σ.1 * W.mat ρ σ.1).trace
      map_add' := fun a b => by
        simp only [Submodule.coe_add, Pi.add_apply, Matrix.add_mul, Matrix.trace_add]
      map_smul' := fun c a => by
        simp only [Submodule.coe_smul, Pi.smul_apply, Matrix.smul_mul, Matrix.trace_smul, RingHom.id_apply] }
  obtain ⟨T, hT⟩ := Det.finDet f
  refine ⟨T, ?_⟩
  intro z hz s
  exact hT z (fun t ht _ => hz t ht) s ()

theorem UpperTheory.V.Th.rhDep41_regDet_trace :
    ∀ {l : ℕ} [Fact l.Prime] (F : W.GFrame l) (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)] {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l)) (P : GL (Fin n) (Qbar l)), 1 ≤ n → UpperTheory.V.Th.RHDep41TraceFinite F O ρ → (∃ g : F.G₀, F.ε g ≠ 1) → Continuous ρ → Th.TypeI F ρ → Th.N3 F ρ → Th.RegDet F O ρ P := by
  intro l _ F O _ _ _ _ n ρ P hn hΦ hε hρ hI h3
  classical
  have halg : ∀ x : ℤ_[l], algebraMap ℤ_[l] (Qbar l) x = algebraMap ℚ_[l] (Qbar l) (x : ℚ_[l]) :=
    fun x => IsScalarTower.algebraMap_apply ℤ_[l] ℚ_[l] (PadicAlgCl l) x
  have hχ : ∀ g : F.G₀, ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) =
      algebraMap ℚ_[l] (Qbar l) (((F.ε g : ℤ_[l]ˣ) : ℤ_[l]) : ℚ_[l]) := fun g => by
    rw [← halg, IsScalarTower.algebraMap_apply ℤ_[l] O (Qbar l)]
    rfl
  have hm : Continuous fun g => W.mat ρ g := Units.continuous_val.comp hρ
  let R : Representation (Qbar l) F.G₀ (Matrix (Fin n) (Fin n) (Qbar l)) :=
    Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)
  have hR : ∀ g X, R g X =
      ((F.eps O (Qbar l) g : (Qbar l)ˣ) : Qbar l) • (W.mat ρ g * X * W.mat ρ g⁻¹) := fun g X => by
    have e : W.mat ρ g⁻¹ = Units.val (ρ g)⁻¹ := by
      rw [← map_inv ρ g]; rfl
    rw [e]
    rfl
  let S : Type := {σ : F.G₀ // σ ∈ F.G' ∧ (W.mat ρ σ).charpoly.Separable}
  obtain ⟨T, hT⟩ := hΦ
  refine ⟨T.card, fun j => (T.equivFin.symm j).1.1, fun j => (T.equivFin.symm j).1.2, ?_⟩
  intro z hzc hz _ htr
  have hzZ : z ∈ Z1 R := (mem_Z1_iff_cocycle _ _).2 ⟨hzc, fun g h => by rw [hR]; exact hz g h⟩
  have hall := hT ⟨z, hzZ⟩ fun s hs => by
    simpa only [pow_one] using
      htr s.1 ⟨T.equivFin ⟨s, hs⟩, by simp only [Equiv.symm_apply_apply]⟩ 1
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
    have h5 : (z σ * W.mat ρ σ).trace = 0 := hall ⟨σ, h2, h4⟩
    exact h1 h5

theorem UpperTheory.V.Th.rhDep41_regDet_bridge :
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
  exact UpperTheory.V.Th.rhDep41_regDet_trace F O ρ P hn
    (UpperTheory.V.Th.rhDep41_trace_of_finite F O ρ (show Module.Finite (Qbar l) (Z1 R) from inferInstance))
    hε hρ hI h3

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal IsLocalRing Polynomial Matrix UpperTheory.V UpperTheory.V.HV UpperTheory.V.Alg GlobalTheory.GalOfCusp
private theorem rhDep41_ad_eq {H K : Type} [Group H] [CommRing K] {n : ℕ} (ρ : H →* GL (Fin n) K) (g : H) (X : Matrix (Fin n) (Fin n) K) :
    Loc.adGL ρ g X = W.mat ρ g * X * W.mat ρ g⁻¹ := by
  change _ = (ρ g : Matrix (Fin n) (Fin n) K) * X * (ρ g⁻¹ : GL (Fin n) K)
  rw [map_inv]
  rfl
private theorem rhDep41_cont_sub {H K : Type} [Group H] [TopologicalSpace H] [ContinuousInv H] [CommRing K] [TopologicalSpace K]
    [IsTopologicalRing K] {n : ℕ} {a y : H → Matrix (Fin n) (Fin n) K} (ha : Continuous a) (hy : Continuous y)
    (X : Matrix (Fin n) (Fin n) K) : Continuous fun g => y g - (a g * X * a g⁻¹ - X) :=
  hy.sub (((ha.matrix_mul continuous_const).matrix_mul (ha.comp continuous_inv)).sub continuous_const)
theorem UpperTheory.V.Th.rhDep41_core :
    _root_.UpperTheory.V.Th.OrdVan2Alt → W.PhiAll → _root_.UpperTheory.V.Th.DenseThresholdMainCase := by
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
  have hdet := UpperTheory.V.Th.rhDep41_regDet_bridge V.frame c.O ρ P (by omega) (hΦ l L Ω s V).2.1 heps hN.cont hN.irr hN.n3
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
  · exact rhDep41_cont_sub hc (hz.1.comp continuous_subtype_val) X₀
  · have e1 : z ((g * g' : V.frame.G₀) : V.frame.Γ) = z g + W.mat ρ g * z g' * W.mat ρ g⁻¹ := by
      rw [← rhDep41_ad_eq, ← hR.ad]
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
      rw [rhDep41_ad_eq]
      have e1 : ∀ t, W.mat (ρ.comp (V.frame.φ v)) t = W.mat ρ (V.frame.φ v t) := fun _ => rfl
      simp only [Pa.dY, e1, map_inv]
      noncomm_ring
    rw [inv_inv, e]
    exact ⟨a1, a2, a3, a4⟩
end


theorem rhDep41_trace_replay {l : ℕ} [Fact l.Prime] (F : W.GFrame l)
    (O : Type) [CommRing O] [Algebra ℤ_[l] O] [Algebra O (Qbar l)] [IsScalarTower ℤ_[l] O (Qbar l)]
    {n : ℕ} (ρ : F.G₀ →* GL (Fin n) (Qbar l))
    (h : Module.Finite (Qbar l) (Z1 (Loc.twist (F.eps O (Qbar l)) (Loc.adGL ρ)))) :
    UpperTheory.V.Th.RHDep41TraceFinite F O ρ := by
  first
  | (rh_reduce 3 using [UpperTheory.V.Th.rhDep41_trace_of_finite F O ρ h]; done)
  | (rh_auto_frontier 3; done)
  | (rh_auto 3; done)
  | exact UpperTheory.V.Th.rhDep41_trace_of_finite F O ρ h

#print axioms UpperTheory.V.Th.regDet
#print axioms UpperTheory.V.Th.rhDep41_trace_of_finite
#print axioms UpperTheory.V.Th.rhDep41_regDet_trace
#print axioms UpperTheory.V.Th.rhDep41_regDet_bridge
#print axioms UpperTheory.V.Th.rhDep41_core
rh_scan UpperTheory.V.Th.regDet limit 2000
rh_scan UpperTheory.V.Th.rhDep41_regDet_trace limit 2000
rh_scan UpperTheory.V.Th.rhDep41_core limit 2000
rh_prune UpperTheory.V.Th.rhDep41_trace_of_finite as UpperTheory.V.Th.rhDep41_trace_pruned
