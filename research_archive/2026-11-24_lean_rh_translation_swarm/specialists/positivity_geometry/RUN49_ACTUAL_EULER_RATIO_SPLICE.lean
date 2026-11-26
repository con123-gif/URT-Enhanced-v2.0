import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatio
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.EulerProductMeasureIntegralStatement
import CompanionTheory.SpectralGeometry.LocalGlobalProofs.AdelicAnalysis.SiegelMeanValueNonnegativeStatement
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN49, lane 7, 26 Nov 2026. SOURCE-MATCHED HUMAN REDUCTION; LEAN PREPARED, NOT COMPILED.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 mandatory engine read first.
AGENTS, SWARM/HANDOFF/EXPANSION, continuity/state/runner openings read.
Latest peer summaries: integration fccd0f04, theta f95e6528, editor b86025dc,
audit 4072e556, Galois d843aa72, character 0cfcd0a6. RUN48 a66af433 retained.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; newer upstream 11437ebe3e9938e25d3122bd645d56eee1cd4b56 not adopted.
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

NEW actual caller splice: RUN48 left global box and test measurability and
actW/atInv identification as premises. Native EulerBox.measurableSet_box
already proves box measurability by finitely many exceptional places,
using intOff and continuity of projections. No countability argument is
needed. For the same local self-dual lattices the native compact-open
lemma supplies local measurability and local_value49 (unchanged RUN46)
supplies the measure; use one local witness per place for both. The native
actW definition and instMulActionTup use literally the same actTup term;
IsHaarH and IsFDH are definitionally the hypotheses already in VolTie.
Hence selected nonnegative theta mean directly equals the native atInv
count, no comparison theorem. The native arch test and hquot are unchanged.
The proof below replaces the complex test / IsPureFin / SW1b2 block in
ratio_of_setting, not merely an external stand-alone mean theorem.
No separate hbox, hA, hPhiT or arbitrary tensor-factorization premise.
No loss of sign or local positivity. After evaluating actual fibres:
  V'/V = c^f * product_v locDens_v.
Native ratio_of_eq supplies cancellation of the positive finite a;
same hval yields exact original rank ratio. The candidate host wrapper
propagates this to VolumeRatio₂ at the retied lattice, whose Gram is
unchanged. SelectedEuler49 is an ALTERNATIVE interface: existence of
selfdual scalar fibres and their Euler measure at the selected beta,
character, basis, Haar and FD. It is not asserted that the original
SW1b2 implies all of IsEulerProd, or that it is already proved.

Original graph: volumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting
-> SW1b2 + pure finite tensor + local density + arch + unfolding.
Overlay: volumeRatio_of_host49 -> ratio_of_setting49 -> SelectedEuler49
+ EulerBox.measurableSet_box + EulerBox.euler_box + theta mean
+ native local_value49 / arch / unfolding / ratio_of_eq.
Retain original graph, other consumers, all pending nodes and axiom evidence.
Remaining selected supplier: prove existence of standard Haar and Gram
fibres with actual native SWMeas; establish rank-one Gram set and
Hermitian pairing identification, scalar regular fibre transport and
product-one rescaling, arch extension and nonzero finite scales at
same witnesses; replay this caller and then ASK-MAIN. RUN45-48 are
candidate components, not proven native suppliers. Cache keyed by pin,
toolchain,F,E,sigma,J,M,b,L,beta,psi,mu,FD,fibre family,actual caller.
Backtrack to original route if native dictionary/axiom comparison fails.
No URT comparison. No local Lean/lake/elan. Historical CI runs
45577239749 and 45576756833 status JSONs reread (pass, exit 0); conditional
root axioms propext, Classical.choice, Quot.sound; bounded scan pending 324.
No new compilation, no native pruning/scan result and no root obligation retired.

Source blobs checked:
VolumeRatioOfUnfolding.lean bf534d0467940a3315375b49ab216a548170c422
GenusMassVolumes.lean 525618b770cb535fd890f10277af11ffbe76af40
EulerProductMeasureIntegral.lean 39b1a75127124a462b3f92f92a77deeb89da1ce7
AdelicTupleProjectionsStatement.lean 954caf0d4911f6ede85b71ef8b443371f81d7b6d
SiegelMeanValueNonnegativeStatement.lean e8232f9fe01024f00bbec8c9db034cafb225b3fe
SiegelWeilMeasureRankOneStatement.lean 6f5b52e9069e8be9faf38d53202fd4433c2414ad
RUN46 source 73d669627283c06fdaf4af385a6c32315892e945.
33 fail-on-error source SHA/token and unique source-splice assertions executed in connector V8.
RESUME HERE: stage this single certificate in pinned native runner; first
compile actual ratio_of_setting49 and volumeRatio_of_host49 with engines.
Prove SelectedEuler49 from native SWMeas using RUN45-48; audit all remaining
scalar transport and measure witnesses. Do not write further reformulations
of the ratio. Feed verified actual volume supplier to signed ASK-MAIN.
HANDOFF TO kernel, integration, theta, editor and audit. RH OPEN.
-/

noncomputable section
open NumberField IsDedekindDomain MeasureTheory Matrix Formalism.BasicNotions Formalism.MainNotions.StandardLattice Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes GlobalTheory.IndefiniteRowSideFullHecke
open HeckeCharacterZeroLocus.SiegelWeilU GlobalTheory.CompanionTheory.SW
open scoped ENNReal NNReal TensorProduct
namespace GlobalTheory.VolRatioUnfold
attribute [local instance] Formalism.BasicNotions.Host.cmStar
section Fin49
variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E] {σ : E →ₐ[F] E}

theorem local_value49 (hL5 : PlaceSplittingTypes.SelfDualLatticeDensity) (hσ : IsCMExt F E σ) {M : ℕ} (hM : 1 ≤ M)
    {J : Matrix (Fin M) (Fin M) E} (hJ : IsHermND σ J) (v : HeightOneSpectrum (𝓞 F))
    (hv : SelfDualUnramifiedPlaces.UnramifiedPlace F E v) {ψ : AddChar (AF F) ℂ} (hψ : IsCharAF F ψ)
    (hi : LocalAdditiveCharacterDual.IndexFinite F ψ v)
    (L : Submodule (SelfDualUnramifiedPlaces.maxOrder F E v) (Fin M → Fv F v ⊗[F] E)) (hL : SelfDualUnramifiedPlaces.IsSelfDualLattice σ J v L)
    (μ : Measure (Fin 1 → Fin M → Fv F v ⊗[F] E)) (ν : Measure (Fv F v))
    (hμ : SelfDual μ fun X Y => psiV F ψ v (BR (Fv F v) σ J X Y)) (hν : SelfDual ν fun s t => psiV F ψ v (s * t))
    (fib : Fv F v → Measure (Fin 1 → Fin M → Fv F v ⊗[F] E))
    (U : Set (Fin 1 → Fin M → Fv F v ⊗[F] E))
    (hU : {X | qR (Fv F v) σ J (X 0) ≠ 0} ⊆ U)
    (hfib : IsFibreFamily μ (fun X => qR (Fv F v) σ J (X 0)) id U ν {c | c ≠ 0} fib)
    (β : Fv F v) (hβ : Valued.v β = 1) :
    fib β {X | X 0 ∈ L} = ENNReal.ofReal (LocalAdditiveCharacterDual.locDens F E ψ M v) := by
  obtain ⟨χ, hχ, hχψ⟩ := GlobalTheory.T.exists_localComponent_adelicAddChar F ψ hψ v hi
  have hχ' : (χ : Fv F v → ℂ) = psiV F ψ v := funext hχψ
  obtain ⟨η, hη⟩ := GlobalTheory.LocalDensityCompare.exists_eta F E v
  have hEta := (GlobalTheory.LocalDensityCompare.isEtaAt_iff F E v hσ.2.2.1 η).2 ⟨hv, hη⟩
  obtain ⟨⟨c, hc⟩, h⟩ := hL5 F E σ hσ M J hM hJ v η hEta χ hχ
  have h1 := ((h c hc L ((GlobalTheory.LocalDensityCompare.isSelfDualLattice_iff v σ J L).1 hL) μ
    (by rw [SdW, hχ']; exact hμ) ν (by rw [SdR, hχ']; exact hν)).2.2 β hβ).1 U {c | c ≠ 0} fib
    hU subset_rfl hfib
  refine h1.1.trans (congrArg _ ?_)
  have h2 := GlobalTheory.T.adicIntegersCharacterDualIndex_eq_residue_card_zpow F ψ v c (by simpa only [PlaceSplittingTypes.IsDualExp, hχψ] using hc)
  rw [LocalAdditiveCharacterDual.locDens, h2, PlaceSplittingTypes.densityValue, PlaceSplittingTypes.dualIndex, LocalAdditiveCharacterDual.eulerInv, hη]
  rfl

end Fin49


section SWAt
variable (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]
  (σ : E →ₐ[F] E) (M : ℕ) (J : Matrix (Fin M) (Fin M) E)

def SelectedEuler49 : Prop :=
  3 ≤ M → ∀ (β : F), (β = 1 ∨ β = -1) → ∀ (d : ℕ) (b : Module.Basis (Fin d) F E)
    ∀ (ψ : AddChar (AF F) ℂ), IsCharAF F ψ →
    (∀ a, psiInf F ψ a = LocalAdditiveCharacterDual.stdInf F a) →
    ∀ (μ : Measure (HA (AF F) σ J)), μ.IsHaarMeasure →
    ∀ (𝓕 : Set (HA (AF F) σ J)), IsFundamentalDomain (HFinIn (AF F) σ J) 𝓕 μ →
    ∃ (μi : Measure (Fin 1 → Fin M → Ainf F ⊗[F] E))
      (νi : Measure (Ainf F))
      (μv : ∀ v : HeightOneSpectrum (𝓞 F), Measure (Fin 1 → Fin M → Fv F v ⊗[F] E))
      (νv : ∀ v : HeightOneSpectrum (𝓞 F), Measure (Fv F v)),
      SelfDual μi (fun X Y => psiInf F ψ (BR (Ainf F) σ J X Y)) ∧
      SelfDual νi (fun s t => psiInf F ψ (s * t)) ∧
      (∀ v, SelfDual (μv v) (fun X Y => psiV F ψ v (BR (Fv F v) σ J X Y))) ∧
      (∀ v, SelfDual (νv v) (fun s t => psiV F ψ v (s * t))) ∧
      ∃ (fi : Ainf F → Measure (Fin 1 → Fin M → Ainf F ⊗[F] E))
        (fv : ∀ v, Fv F v → Measure (Fin 1 → Fin M → Fv F v ⊗[F] E))
        (Uv : ∀ v, Set (Fin 1 → Fin M → Fv F v ⊗[F] E)),
        IsFibreFamily μi (fun X => qR (Ainf F) σ J (X 0)) id Set.univ νi {c | ∀ w, c w ≠ 0} fi ∧
        (∀ v, {X | qR (Fv F v) σ J (X 0) ≠ 0} ⊆ Uv v) ∧
        (∀ v, IsFibreFamily (μv v) (fun X => qR (Fv F v) σ J (X 0)) id (Uv v) (νv v) {c | c ≠ 0}
          (fv v)) ∧
        IsEulerProd b (thetaMeas σ J μ 𝓕 {X | X 0 ≠ 0 ∧ hE σ J (X 0) (X 0) = algebraMap F E β}) 1
          (fi (algebraMap F (Ainf F) β)) (fun v => fv v (algebraMap F (Fv F v) β))
end SWAt


set_option maxHeartbeats 1000000 in
theorem ratio_of_setting49 (hL5 : PlaceSplittingTypes.SelfDualLatticeDensity) (hR3 : ActionCoordinates.RealPlaceMeasures)
    (hEu : LocalAdditiveCharacterDual.EulerProductOfDensities)
    (D : D7) (hU : LatticeTensorUnfolding.Unfolding D) (hV : VolTie D) (W W' : HSpace D.host.E)
    (hSW : SelectedEuler49 D.host.F D.host.E D.sp.cm.sig W.rank W.gram)
    (P Q P' Q' : ℕ) (s : Bool)
    (x : W.V) (ι : W'.V →ₗ[D.host.E] W.V) (hS : LatticeTensorUnfolding.HidaSetting W W' P Q P' Q' s x ι)
    (hL : ∀ y : W'.V, y ∈ W'.L0 ↔ ι y ∈ W.L0) :
    D.vol W' / D.vol W =
      ((2 * Real.pi) ^ W.rank / ((W.rank - 1).factorial : ℝ)) ^ D.R.f *
        ((2 * D.host.v) ^ D.R.f) ^ ((1 : ℝ) / 2 - W.rank) / Formalism.HermitianLatticesTheory.lValEta D.host.E W.rank := by
  classical
  have hun := hU W W' P Q P' Q' s x ι hS hL
  obtain ⟨hW, hsig, hr, hstep, hx, -, -, -, hW', hsig'⟩ := hS
  have hσ := GlobalTheory.AdelicU.isCMExt_host D
  have hJ := GlobalTheory.Mem.VolExists.isHermND D.sp.cm W
  obtain ⟨τ₀⟩ : Nonempty (D.host.E →+* ℂ) := inferInstance
  have hM : P + Q = W.rank := by simpa [hsig τ₀] using sig_sum W hW τ₀
  have hM' : P' + Q' + 1 = P + Q := by cases s <;> simp at hstep <;> omega
  obtain ⟨⟨μ, hμ⟩, h1⟩ := hV W P Q hW hsig
  obtain ⟨⟨𝓕, h𝓕⟩, h2⟩ := h1 μ hμ
  have hvol := h2 𝓕 h𝓕
  obtain ⟨⟨μ', hμ'⟩, h1'⟩ := hV W' P' Q' hW' hsig'
  obtain ⟨⟨𝓕', h𝓕'⟩, h2'⟩ := h1' μ' hμ'
  have hvol' := h2' 𝓕' h𝓕'
  obtain ⟨⟨θ, hθ⟩, h3⟩ := hμ.2
  obtain ⟨A, hA⟩ := (h3 θ hθ).1
  obtain ⟨⟨⟨ψ, hψ, hψi⟩, -⟩, -, -, hEP⟩ := hEu D.host.F D.host.E D.sp.cm.sig hσ D.sp.cm.cmUnram
  obtain ⟨hfin, hpos, -, hmul, hppos, hval⟩ := ((hEP W.rank (by omega)).2 ψ hψ).2 1 (fun a => by simp [hψi])
  set β : D.host.F := if s then 1 else -1 with hβ
  have hβ1 : β = 1 ∨ β = -1 := by cases s <;> simp [hβ]
  have hβE : algebraMap D.host.F D.host.E β = if s then 1 else -1 := by cases s <;> simp [hβ]
  obtain ⟨Φi, a, hΦi, ha0, hat, hfibre, hquot⟩ := arch hR3 D.cd hσ (GlobalTheory.VolRatioCheck.place_bijective D) hθ hM hM' hJ hA
    (fun i => W.frame.repr x i) β hβ1 (by rw [hE_coords, hx, hβE]) ψ hψi
  obtain ⟨I, hI, hunf⟩ := hun μ μ' hμ hμ' 𝓕 𝓕' h𝓕 h𝓕' (by rw [hvol]; exact ENNReal.ofReal_lt_top)
    (by rw [hvol']; exact ENNReal.ofReal_lt_top) Φi hΦi
  have hIa : I = (ActionCoordinates.cM W.rank)⁻¹ ^ Fintype.card D.what₂.Tau * a := by
    obtain ⟨⟨C, hC⟩, h4⟩ := (hI.2 θ hθ).2 A hA
    obtain ⟨⟨j, hj⟩, h5⟩ := h4 C hC
    obtain ⟨⟨o, ho⟩, h6⟩ := h5 j hj
    obtain ⟨⟨ν, hν⟩, h7⟩ := h6 o ho
    rw [← h7 ν hν]
    exact hquot C j o ν hC hj ho hν
  have hcard : Fintype.card D.what₂.Tau = D.R.f := by
    rw [Fintype.card_of_bijective (GlobalTheory.VolRatioCheck.place_bijective D)]; exact fDeg_host D

  have hlat := GlobalTheory.AdelicU.SelfDual.isLattice_frameLat W
  have hsd := (GlobalTheory.AdelicU.SelfDual.forall_isSelfDualAt_iff hJ.2 hlat).1
    (GlobalTheory.AdelicU.SelfDual.isSelfDualAt_frameLat_of_cm D.sp.cm W)
  haveI : FiniteDimensional D.host.F D.host.E := Module.finite_of_finrank_pos (by rw [hσ.2.2.1]; omega)
  let b := Module.finBasis D.host.F D.host.E
  obtain ⟨μi, νi, μv, νv, hμi, hνi, hμv, hνv, fi, fv, Uv, hfi, hUv, hfv, hEuler⟩ :=
    hSW hr β hβ1 _ b ψ hψ hψi μ hμ.1 𝓕 h𝓕
  let L := GlobalTheory.AdelicU.frameLat W
  let A_v := fun v : HeightOneSpectrum (𝓞 D.host.F) =>
    {X : Fin 1 → Fin W.rank → Fv D.host.F v ⊗[D.host.F] D.host.E | X 0 ∈ GlobalTheory.AdelicU.latLoc D.host.F L v}
  have hlocal : ∀ v, MeasurableSet (A_v v) ∧
      fv v (algebraMap D.host.F (Fv D.host.F v) β) (A_v v) =
        ENNReal.ofReal (LocalAdditiveCharacterDual.locDens D.host.F D.host.E ψ W.rank v) := by
    intro v
    obtain ⟨Lv, hLv, hmem⟩ := GlobalTheory.T.exists_selfDualLattice_completion_maxOrder _ _ _ _ _ _ hJ hlat hsd v
    have hop := (GlobalTheory.LocalDensityCompare.lattice_compact_open v D.sp.cm.sig hσ Lv hLv.1 hLv.2.1).2
    have hlc := GlobalTheory.LocalDensityCompare.lcs (F := D.host.F) (E := D.host.E) v
    haveI := hlc.2.1
    haveI : BorelSpace (Fv D.host.F v ⊗[D.host.F] D.host.E) := ⟨rfl⟩
    have hset : A_v v = {X : Fin 1 → Fin W.rank → Fv D.host.F v ⊗[D.host.F] D.host.E | X 0 ∈ Lv} := by
      ext X
      exact (hmem (X 0)).symm
    rw [hset]
    refine ⟨hop.measurableSet, ?_⟩
    exact local_value49 hL5 hσ (by omega) hJ v
      (fun w _ => GlobalTheory.BaseChangeExistsCompare.unram_of_cm D D.sp.cm w) hψ (hfin v) Lv hLv _ _ (hμv v) (hνv v) _ (Uv v) (hUv v) (hfv v)
      (algebraMap D.host.F (Fv D.host.F v) β) (by rcases hβ1 with h | h <;> simp [h])
  have hA := fun v => (hlocal v).1
  have hcof : ∀ᶠ v in Filter.cofinite, A_v v = latV b v :=
    GlobalTheory.T.eventually_localLatticeCompletion_eq_coordinateLattice _ _ _ _ b _ hlat
  have hfinite : {v | ¬ A_v v = latV b v}.Finite := Filter.eventually_cofinite.1 hcof
  let S := hfinite.toFinset
  have hS' : ∀ v, v ∉ S → A_v v = latV b v := by
    intro v hv
    by_contra hn
    exact hv (hfinite.mem_toFinset.2 hn)
  let box := {X : Fin 1 → Fin W.rank → AF D.host.F ⊗[D.host.F] D.host.E |
      ∀ v, projV v (projFin X) ∈ A_v v}
  have hbox : MeasurableSet box :=
    GlobalTheory.CompanionTheory.SW.EulerBox.measurableSet_box _ _ _ hσ b 1 _ S A_v hA hS'
  have htest : LatticeTensorUnfolding.latTensor (L0c D W) Φi =
      box.indicator (fun X => Φi (projInf X)) := by
    funext X
    have hh : projFin X 0 ∈ latHat D.host.F D.host.E (L : Set (Fin W.rank → D.host.E)) ↔ X ∈ box := by
      exact GlobalTheory.AdelicU.mem_latHat_iff hlat.fg _
    rw [LatticeTensorUnfolding.latTensor, GlobalTheory.AdelicU.hermitianSpaceBaseLattice_eq_frameLattice]
    by_cases hx : X ∈ box
    · simp [hx, hh.mpr hx, L]
    · have hn := mt hh.mp hx
      simp [hx, hn, L]
  have : LocallyCompactSpace (AF D.host.F) := GlobalTheory.AdelicUnitaryTop.locallyCompact_adele _
  obtain ⟨-, -, -, -, -, -, -, hB, -, -⟩ := GlobalTheory.T.tensor_locally_compact_ring _ _ _ hσ (AF D.host.F)
  haveI : BorelSpace (Fin 1 → Fin W.rank → AF D.host.F ⊗[D.host.F] D.host.E) := hB 1 _
  haveI : BorelSpace (Fin 1 → Fin W.rank → Ainf D.host.F ⊗[D.host.F] D.host.E) :=
    (GlobalTheory.ArchUnitaryTop.top_facts D.host.F D.host.E D.sp.cm.sig W.rank 1 W.gram).2.1
  have hproj := (GlobalTheory.T.adelic_tuple_projections _ _ _ hσ _ b 1 W.rank).1
  have ht : Measurable (LatticeTensorUnfolding.latTensor (L0c D W) Φi) := by
    rw [htest]
    exact (hΦi.comp hproj.measurable).indicator hbox
  have hfin' : ∀ v, fv v (algebraMap D.host.F (Fv D.host.F v) β) (A_v v) < ⊤ := by
    intro v
    rw [(hlocal v).2]
    exact ENNReal.ofReal_lt_top
  have he := GlobalTheory.T.euler_product_measure_integral _ _ _ hσ _ b 1 W.rank _ 1 _ _
    hEuler Φi A_v hΦi hA hfin' hcof
  have hp : (fun v => (fv v (algebraMap D.host.F (Fv D.host.F v) β) (A_v v)).toReal) =
      LocalAdditiveCharacterDual.locDens D.host.F D.host.E ψ W.rank := by
    funext v
    rw [(hlocal v).2, ENNReal.toReal_ofReal (hpos v).le]
  rw [hp] at he
  have hi := hfibre μi νi fi hμi hνi hfi
  have hm := GlobalTheory.T.siegel_mean_value_nonnegative _ _ _ hσ W.rank W.gram hJ μ 𝓕 hμ.1 h𝓕
    1 {X | X 0 ≠ 0 ∧ hE D.sp.cm.sig W.gram (X 0) (X 0) = algebraMap D.host.F D.host.E β}
    (LatticeTensorUnfolding.latTensor (L0c D W) Φi) ht
  have hm' : (μ 𝓕)⁻¹ * ∫⁻ h in 𝓕, ∑' X : {X : Fin 1 → Fin W.rank → D.host.E |
      X 0 ≠ 0 ∧ hE D.sp.cm.sig W.gram (X 0) (X 0) = algebraMap D.host.F D.host.E β},
      LatticeTensorUnfolding.atInv D.sp.cm.sig W.gram (LatticeTensorUnfolding.latTensor (L0c D W) Φi) h X ∂μ =
        ∫⁻ X, LatticeTensorUnfolding.latTensor (L0c D W) Φi X ∂
          (thetaMeas D.sp.cm.sig W.gram μ 𝓕 {X | X 0 ≠ 0 ∧ hE D.sp.cm.sig W.gram (X 0) (X 0) = algebraMap D.host.F D.host.E β}) := hm.symm
  have hInt : (∫⁻ X, LatticeTensorUnfolding.latTensor (L0c D W) Φi X ∂
      (thetaMeas D.sp.cm.sig W.gram μ 𝓕 {X | X 0 ≠ 0 ∧ hE D.sp.cm.sig W.gram (X 0) (X 0) = algebraMap D.host.F D.host.E β})) =
        a * ENNReal.ofReal (∏' v, LocalAdditiveCharacterDual.locDens D.host.F D.host.E ψ W.rank v) := by
    rw [htest, lintegral_indicator hbox]
    simpa only [hi, NNReal.coe_one, one_mul] using he.2
  have hmean := hm'.trans hInt
  have hsum := (lintegral_congr fun h => tsum_coords D W s β hβE
    (LatticeTensorUnfolding.atInv D.sp.cm.sig W.gram (LatticeTensorUnfolding.latTensor (L0c D W) Φi) h)).trans hunf
  replace hmean := (congrArg ((μ 𝓕)⁻¹ * ·) hsum).symm.trans hmean
  simp only [hIa, hvol, hvol', hcard, ActionCoordinates.cM] at hmean
  have hc : 0 < (2 * Real.pi) ^ W.rank / ((W.rank - 1).factorial : ℝ) := by have := Real.pi_pos; positivity
  rw [ratio_of_eq (D.vol_pos W) (D.vol_pos W') hc hppos ha0 hat hmean, mul_div_assoc]
  congr 1
  simpa [LocalAdditiveCharacterDual.absInf, LocalAdditiveCharacterDual.dF, vInv_host, fDeg_host] using hval


theorem volumeRatio_of_host49 (D : D7)
    (hSW : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P, Q)) → 3 ≤ W.rank →
      SelectedEuler49 D.host.F D.host.E D.sp.cm.sig W.rank W.gram) :
    VolTie D → VolumeRatio₂ D := by
  intro hV W P Q hW hsig hr s hs
  obtain ⟨x, hx, L, W', ι, hL, hxL, ⟨hW', -, hsig'⟩, hiso, hrange, hlat, -⟩ :=
    GlobalTheory.UnitPerpObj.unitVectorPerp D W W.rank P Q ⟨hW, rfl, hsig⟩ hr (if s then 1 else -1) (if s then P - 1 else P) (if s then Q else Q - 1)
      (by cases s <;> simp_all [SelfDualLatticeComplements.Step])
  refine ⟨x, hx, W', ι, hiso, hrange, hW', fun τ => by rw [hsig' τ]; cases s <;> rfl, ?_⟩
  let W₁ := IsometryTransportFrames.withLat W L hL.1 hL.2
  have hvol : D.vol W = D.vol W₁ :=
    (GlobalTheory.VolIndepClosed.volIndep D).2.2 hV W W₁ P Q ⟨hW, hsig⟩ ⟨hW, hsig⟩ (LinearEquiv.refl _ _) fun _ _ => rfl
  rw [hvol]
  have hSW₁ : SelectedEuler49 D.host.F D.host.E D.sp.cm.sig W₁.rank W₁.gram :=
    hSW W P Q hW hsig hr
  refine ratio_of_setting49 GlobalTheory.LatticeDensityClosed.selfDualLatticeDensity
    GlobalTheory.RealPlaceMeasuresProof.realPlaceMeasures GlobalTheory.DensityProductClosed.eulerProductOfDensities
    D (GlobalTheory.UnfoldingObj.unfolding D) hV W₁ W' hSW₁ P Q _ _ s x ι
    ⟨hW, hsig, hr, ?_, hx, hxL, hiso, hrange, hW', hsig'⟩ fun y => ?_
  · cases s <;> simp at hs ⊢ <;> omega
  · have hinj := SelfDualLatticeComplements.injective_of_isIsomEmb hiso
    constructor
    · intro hy
      have : ι y ∈ W'.L0.map (ι.restrictScalars (𝓞 D.host.E)) := ⟨y, hy, rfl⟩
      rw [hlat] at this
      exact this.1
    · intro hy
      have hp : ι y ∈ SelfDualLatticeComplements.perp W x := by rw [← hrange]; exact ⟨y, rfl⟩
      have : ι y ∈ W'.L0.map (ι.restrictScalars (𝓞 D.host.E)) := by rw [hlat]; exact ⟨hy, hp⟩
      obtain ⟨z, hz, e⟩ := this
      rwa [← hinj e]


theorem host49_bridge (D : D7)
    (hSW : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P,Q)) → 3 ≤ W.rank →
      SelectedEuler49 D.host.F D.host.E D.sp.cm.sig W.rank W.gram) :
    VolTie D → VolumeRatio₂ D := by
  first
  | (rh_reduce 2 using [volumeRatio_of_host49]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact volumeRatio_of_host49 D hSW

rh_scan GlobalTheory.VolRatioUnfold.ratio_of_setting limit 2000
rh_scan ratio_of_setting49 limit 2000
rh_prune ratio_of_setting49 as RH49RatioPruned
rh_scan volumeRatio_of_host49 limit 2000
rh_prune volumeRatio_of_host49 as RH49HostPruned
#print axioms ratio_of_setting49
#print axioms volumeRatio_of_host49
#print axioms host49_bridge
end GlobalTheory.VolRatioUnfold
