import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatio
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN43, 26 Nov 2026, lane 7 — SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED. RH OPEN.
Current mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 including mandatory
pipeline, original e0dc8f7f snapshot, SWARM/HANDOFF/EXPANSION/AGENTS and
continuity/state/runner/log openings consulted. Peer cdd5e8d1 theta,
c9fdbd77 editor, f304da1a integration and 65a89b19 Landau read excerpts;
other latest peer commits surveyed. No merging uncompiled peer results.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1 / Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Latest upstream observed
cfc627e6ebb14d339b2cfbd22d872fbadba4a93c; no migration.
StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d;
VolumeRatioOfUnfolding.lean bf534d0467940a3315375b49ab216a548170c422;
RUN42 candidate 3a5032757bd66675c48e7f25963f3fff474c77a1. Native public volumeRatio imports
VolumeRatioOfUnfolding and its six suppliers. Original selected graph:
volumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting -> SW1b2
(AllSome, OnH, OnSD, all fibre families, convergence and mean).
Reduced selected graph: fixed-host volumeRatio_of_host43 ->
ratio_of_setting43 -> SWAt43 + unchanged local density and Euler product.
Original/reduced graph overlay only; no new kernel edge or axiom evidence.

NEW: actual ratio consumer chooses beta=+/-1, standard psi from hEu,
and mu,F from VolTie. SW1b2 is only used to extract one tuple of four
self-dual measures, two fibre families and the mean equality. Its
separate Multipliable field is not used: hmul from existing Euler
product supplies convergence after exact local-density substitution.
Thus weaken SW1b2 to SWAt43: for actual sign, standard character and
given Haar/domain, there EXIST compatible measures/families satisfying
the mean identity. No global existence of Haar/domain/character in
this supplier, no universal assertion across possible local measures,
and no independent product-convergence requirement. All test-function
premises retained (further finite-indicator restriction possible).
The original implication follows by selecting witnesses and projecting
(h9 fi fv hfi hfv).2. Keep positivity/finiteness guards and same host.
After substitution the only mean identity consumed is meanL = a times
the product of native local densities, while a cancels from the
unfolding equation using a != 0 and a != top. No RH-scale estimate proved.

19 executable source/hash/unique replacement checks performed in
V8 (not mathematical or Lean checks). Baseline CI status JSON for
45577239749, 45576756833 retrieved status pass/returncode 0; not evidence
for this file. Local lean/lake absent. This file prepared for pinned
native replay with engine imports; no CI registration or new PASS.
Preserve prior axiom evidence, all unresolved nodes. Context cache:
pin/toolchain/D/W/Gram/sign/beta/psi/mu/domain/test/fibre/consumer.
Backtrack to original if replay fails. No URT comparison required.

RESUME HERE: replay original bridge and new ratio at actual caller,
then establish the selected mean equality independently (unfolding
and orbit/fibre compatibility; do not assume SWAt43). Check literature
supplier for SW1b2 and retain all other consumers. Integrate only after
audit with same-host signed ASK-MAIN bound. RH OPEN.
HANDOFF TO kernel, audit, theta, integration, editor.
-/

noncomputable section
open NumberField IsDedekindDomain MeasureTheory Matrix Formalism.BasicNotions Formalism.MainNotions.StandardLattice Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes GlobalTheory.IndefiniteRowSideFullHecke
open scoped ENNReal TensorProduct
namespace GlobalTheory.VolRatioUnfold
attribute [local instance] Formalism.BasicNotions.Host.cmStar

section SWAt
variable (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E]
  (σ : E →ₐ[F] E) (M : ℕ) (J : Matrix (Fin M) (Fin M) E)

def SWAt43 : Prop :=
  3 ≤ M → ∀ (β : F), (β = 1 ∨ β = -1) → ∀ (d : ℕ) (b : Module.Basis (Fin d) F E)
    (Φ : (Fin 1 → Fin M → AF F ⊗[F] E) → ℝ≥0∞) (Φi : (Fin 1 → Fin M → Ainf F ⊗[F] E) → ℝ≥0∞)
    (Φf : (Fin 1 → Fin M → Af F ⊗[F] E) → ℂ)
    (Φv : ∀ v : HeightOneSpectrum (𝓞 F), (Fin 1 → Fin M → Fv F v ⊗[F] E) → ℂ),
    Measurable Φi → IsPureFin b Φf Φv → (∀ v Y, 0 ≤ (Φv v Y).re ∧ (Φv v Y).im = 0) →
    (∀ X, Φ X = Φi (projInf X) * ENNReal.ofReal (Φf (projFin X)).re) →
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
        (fv : ∀ v, Fv F v → Measure (Fin 1 → Fin M → Fv F v ⊗[F] E)),
        IsFibreFamily μi (fun X => qR (Ainf F) σ J (X 0)) id Set.univ νi {c | ∀ w, c w ≠ 0} fi ∧
        (∀ v, IsFibreFamily (μv v) (fun X => qR (Fv F v) σ J (X 0)) id Set.univ (νv v) {c | c ≠ 0}
          (fv v)) ∧
        meanL μ 𝓕 (fun h => ∑' x : {x : Fin 1 → Fin M → E | x 0 ≠ 0 ∧
            hE σ J (x 0) (x 0) = algebraMap F E β},
          Φ (h⁻¹ • ratTup (F := F) (AF F) (x : Fin 1 → Fin M → E))) =
        (∫⁻ X, Φi X ∂(fi (algebraMap F (Ainf F) β))) *
          ∏' v, ∫⁻ X, ENNReal.ofReal (Φv v X).re ∂(fv v (algebraMap F (Fv F v) β))

theorem swAt43_of_SW (hSW : SW1b2 F E σ M J) : SWAt43 F E σ M J := by
  intro hr β hβ d b Φ Φi Φf Φv hΦi hpure hpos hprod ψ hψ _ μ hμ 𝓕 h𝓕
  have hβ0 : β ≠ 0 := by rcases hβ with h | h <;> simp [h]
  have hsw := hSW hr β hβ0 d b Φ Φi Φf Φv hΦi hpure hpos hprod
  obtain ⟨⟨μi, hμi⟩, ⟨νi, hνi⟩, ⟨μv, hμv⟩, ⟨νv, hνv⟩, h8⟩ := (((hsw.2 ψ hψ).2 μ hμ).2 𝓕 h𝓕)
  obtain ⟨⟨fi, hfi⟩, ⟨fv, hfv⟩, h9⟩ := h8 μi νi μv νv hμi hνi hμv hνv
  exact ⟨μi, νi, μv, νv, hμi, hνi, hμv, hνv, fi, fv, hfi, hfv, (h9 fi fv hfi hfv).2⟩
end SWAt

set_option maxHeartbeats 1000000 in
theorem ratio_of_setting43 (hL5 : PlaceSplittingTypes.SelfDualLatticeDensity) (hR3 : ActionCoordinates.RealPlaceMeasures)
    (hEu : LocalAdditiveCharacterDual.EulerProductOfDensities)
    (D : D7) (hU : LatticeTensorUnfolding.Unfolding D) (hV : VolTie D) (W W' : HSpace D.host.E)
    (hSW : SWAt43 D.host.F D.host.E D.sp.cm.sig W.rank W.gram)
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
  let Φv : ∀ v : HeightOneSpectrum (𝓞 D.host.F), (Fin 1 → Fin W.rank → Fv D.host.F v ⊗[D.host.F] D.host.E) → ℂ :=
    fun v => {X | X 0 ∈ GlobalTheory.AdelicU.latLoc D.host.F (GlobalTheory.AdelicU.frameLat W) v}.indicator 1
  let Φf : (Fin 1 → Fin W.rank → Af D.host.F ⊗[D.host.F] D.host.E) → ℂ :=
    {X | X 0 ∈ latHat D.host.F D.host.E (GlobalTheory.AdelicU.frameLat W : Set (Fin W.rank → D.host.E))}.indicator 1
  have hpure : IsPureFin b Φf Φv :=
    ⟨GlobalTheory.T.isSchwartzBruhat_indicator_localLatticeCompletion _ _ _ _ hlat, (GlobalTheory.T.eventually_localLatticeCompletion_eq_coordinateLattice _ _ _ _ b _ hlat).mono fun v hv => by simp only [Φv, hv],
      GlobalTheory.T.indicator_completedLattice_eq_finprod_local _ _ _ _ hlat⟩
  have hsw := hSW hr β hβ1 _ b (LatticeTensorUnfolding.latTensor (L0c D W) Φi) Φi Φf Φv hΦi hpure
    (fun v Y => by by_cases h : Y 0 ∈ GlobalTheory.AdelicU.latLoc D.host.F (GlobalTheory.AdelicU.frameLat W) v <;> simp [Φv, h])
    (fun X => by
      rw [LatticeTensorUnfolding.latTensor, GlobalTheory.AdelicU.hermitianSpaceBaseLattice_eq_frameLattice, mul_comm]
      by_cases h : projFin X 0 ∈ latHat D.host.F D.host.E (GlobalTheory.AdelicU.frameLat W : Set (Fin W.rank → D.host.E)) <;>
        simp [Φf, h]) ψ hψ hψi μ hμ.1 𝓕 h𝓕
  obtain ⟨μi, νi, μv, νv, hμi, hνi, hμv, hνv, fi, fv, hfi, hfv, hmean⟩ := hsw
  have hloc : ∀ v, ∫⁻ X, ENNReal.ofReal (Φv v X).re ∂(fv v (algebraMap D.host.F (Fv D.host.F v) β)) =
      ENNReal.ofReal (LocalAdditiveCharacterDual.locDens D.host.F D.host.E ψ W.rank v) := by
    intro v
    obtain ⟨Lv, hLv, hmem⟩ := GlobalTheory.T.exists_selfDualLattice_completion_maxOrder _ _ _ _ _ _ hJ hlat hsd v
    have hop := (GlobalTheory.LocalDensityCompare.lattice_compact_open v D.sp.cm.sig hσ Lv hLv.1 hLv.2.1).2
    have hlc := GlobalTheory.LocalDensityCompare.lcs (F := D.host.F) (E := D.host.E) v
    haveI := hlc.2.1
    haveI : BorelSpace (Fv D.host.F v ⊗[D.host.F] D.host.E) := ⟨rfl⟩
    have hms : MeasurableSet {X : Fin 1 → Fin W.rank → Fv D.host.F v ⊗[D.host.F] D.host.E | X 0 ∈ Lv} :=
      hop.measurableSet
    rw [← local_value hL5 hσ (by omega) hJ v
      (fun w _ => GlobalTheory.BaseChangeExistsCompare.unram_of_cm D D.sp.cm w) hψ (hfin v) Lv hLv _ _ (hμv v) (hνv v) _ (hfv v)
      (algebraMap D.host.F (Fv D.host.F v) β) (by rcases hβ1 with h | h <;> simp [h]),
      ← lintegral_indicator_one hms]
    refine lintegral_congr fun X => ?_
    by_cases h : X 0 ∈ Lv
    · have h' := (hmem _).1 h
      simp [Φv, h, h']
    · have h' := mt (hmem _).2 h
      simp [Φv, h, h']
  simp only [hloc] at hmean
  rw [tprod_ofReal (fun v => (hpos v).le) hmul, hfibre μi νi fi hμi hνi hfi, meanL] at hmean
  have hsum := (lintegral_congr fun h => tsum_coords D W s β hβE
    (LatticeTensorUnfolding.atInv D.sp.cm.sig W.gram (LatticeTensorUnfolding.latTensor (L0c D W) Φi) h)).trans hunf
  replace hmean := (congrArg ((μ 𝓕)⁻¹ * ·) hsum).symm.trans hmean
  simp only [hIa, hvol, hvol', hcard, ActionCoordinates.cM] at hmean
  have hc : 0 < (2 * Real.pi) ^ W.rank / ((W.rank - 1).factorial : ℝ) := by have := Real.pi_pos; positivity
  rw [ratio_of_eq (D.vol_pos W) (D.vol_pos W') hc hppos ha0 hat hmean, mul_div_assoc]
  congr 1
  simpa [LocalAdditiveCharacterDual.absInf, LocalAdditiveCharacterDual.dF, vInv_host, fDeg_host] using hval

theorem volumeRatio_of_host43 (D : D7)
    (hSW : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P, Q)) → 3 ≤ W.rank →
      SWAt43 D.host.F D.host.E D.sp.cm.sig W.rank W.gram) :
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
  have hSW₁ : SWAt43 D.host.F D.host.E D.sp.cm.sig W₁.rank W₁.gram :=
    hSW W P Q hW hsig hr
  refine ratio_of_setting43 GlobalTheory.LatticeDensityClosed.selfDualLatticeDensity
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

-- Original-statement implication; no import of the claimed RH theorem.
theorem volumeRatio_original43
    (hSW : ∀ (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E] (σ : E →ₐ[F] E),
      IsCMExt F E σ → ∀ (M : ℕ) (J : Matrix (Fin M) (Fin M) E), IsHermND σ J → SW1b2 F E σ M J) :
    ∀ D : D7, VolTie D → VolumeRatio₂ D := by
  intro D
  have hloc : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P, Q)) → 3 ≤ W.rank →
      SWAt43 D.host.F D.host.E D.sp.cm.sig W.rank W.gram := by
    intro W P Q hW hs hr
    exact swAt43_of_SW _ _ _ _ _ (hSW _ _ _ (GlobalTheory.AdelicU.isCMExt_host D) _ _
      (GlobalTheory.Mem.VolExists.isHermND D.sp.cm W))
  first
  | (rh_reduce 2 using [volumeRatio_of_host43]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact volumeRatio_of_host43 D hloc

rh_scan swAt43_of_SW limit 2000
rh_prune swAt43_of_SW as RH43SWBridgePruned
#print axioms swAt43_of_SW
rh_scan ratio_of_setting limit 2000
rh_scan volumeRatio_of_unfolding limit 2000
rh_scan GlobalTheory.VolRatioFromSecondClause.volumeRatio limit 2000
rh_scan volumeRatio_of_host43 limit 2000
rh_prune ratio_of_setting43 as RH43SelectedSWPruned
rh_prune volumeRatio_of_host43 as RH43HostPruned
#print axioms GlobalTheory.VolRatioFromSecondClause.volumeRatio
#print axioms ratio_of_setting43
#print axioms volumeRatio_of_host43
#print axioms volumeRatio_original43
end GlobalTheory.VolRatioUnfold
