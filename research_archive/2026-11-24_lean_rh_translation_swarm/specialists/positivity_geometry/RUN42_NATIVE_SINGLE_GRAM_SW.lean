import Development.AbelianVarietyTheory.Proofs.GlobalInterpolation.VolumeRatio
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN42 — native single-Gram Siegel-Weil supplier, fixed host consumer.
25 Nov 2026. SOURCE-MATCHED candidate; PREPARED not compiled. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 and requested
e0dc8f7f snapshot read, SWARM/HANDOFF/EXPANSION, AGENTS/state/continuity
and CI status read (long logs partially). Recent commits surveyed:
theta 20450987, editor efa4abe2 (bodies read), geometry 1c2ef505,
character 778190b4, literature 13df4d53, math ce4b2b8f,
structure 7f95819c, Galois 3b2b21cf, Landau fc0d0ec6,
prime c8cb579a, dependency 5adee016, kernel a824904c, speed 619e11df.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1; Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Upstream current default-path
retrieval returned 404; no semantic comparison or migration claimed.

NEW: reduce the alternative native volume proof at its actual SW
consumer instead of reformulating unverified external Tamagawa
transport. ratio_of_setting has one use of its all-fields, all-ranks
Siegel-Weil assumption, namely SW1b2 of D's existing CM extension,
W.rank and W.gram at chosen beta = +/-1, standard character and
existing tensor test. Replace global hSW with
SW1b2 D.host.F D.host.E D.sp.cm.sig W.rank W.gram.
At actual volumeRatio_of_unfolding, W1=withLat W L ...
changes only lattice and its evidence. Native source explicitly has
an example proving (withLat W L hL hU).gram = W.gram by rfl.
No second Gram or independently chosen host is needed.

The fixed-host wrapper takes SW1b2 only for each W on the same D
having constant signature and rank >=3. Uses the same six named
native suppliers as actual public volumeRatio body. No assertion
that restricted SW is automatic, that these suppliers are independently
axiom-audited, or that other SW consumers are deleted.

Crosscheck of RUN41 rank normalization: native ratio_of_setting uses
standard-character product dF^(1/2-M)/lValEta and cM^f, reciprocal
to RUN41 ratioH. EulerProductOfDensities is supplied by densityProduct_iff
applied to cm_localDensities_productFormula. RealPlaceMeasures uses
selfDualReal, sphereMass and compactDualQuotient. Native fibre density
is not Haar measure on unitary group; separate route to same rank
factor. Keep positivity, nonzero/finite guards, same D/W, actual
lattice and SW hypotheses in copied body. Native ratio_of_eq cancels
before bounds. Two-endpoint Tamagawa transport remains OPEN.

Original source-visible edges:
VolumeRatio.volumeRatio -> volumeRatio_of_unfolding -> ratio_of_setting
-> global SW + standard character local density/arch/actual unfolding.
Candidate overlay: fixed D/signature/rank Gram SW -> unchanged withLat
Gram -> native ratio proof -> fixed-host VolumeRatio2 -> existing
RUN30/RUN31 count route (last bridge not replayed). Original and
reduced graphs and all prior axiom evidence retained; no root closure.
Cache by pin/toolchain,D,F,E,sigma,W.rank,W.gram,signature,lattice retie,
actual test and consumer. Backtrack to original on compile failure.

Source provenance: src/Development/AbelianVarietyTheory/Proofs/GlobalInterpolation/VolumeRatioOfUnfolding.lean blob bf534d0467940a3315375b49ab216a548170c422;
VolumeRatio.lean 2c0102e38f7e31a7132366fdfe495a6b09402738; EulerProductOfDensities.lean b9dc66a827c078d1821f579b3d8c9108001c5fc9;
BlockTheory/GlobalSignature/IsometryTransportFrames.lean 519e108c81f60fc9778fec967cb5ef1cb4252432.
Native theorem bodies below are direct text-derived variants of pinned
ratio_of_setting and volumeRatio_of_unfolding, not independent proof
claims. Exact single-occurrence binder/call replacements; other source
lines retained. 27 executable V8 source/hash/anchor/status checks
succeeded (not proof checks). Native lean/lake absent locally; baseline
CI status JSON for 45577239749 and 45576756833 actually retrieved
status pass/exit 0. No new CI PASS or axiom output. No URT experiment.

RESUME HERE: replay this candidate and original bridge in pinned Lean
with engine modules; compare actual caller and transitive axioms.
Locate actual SW1b2 producer and specialize further to standard
additive character, norm +/-1 and tensor test only if actual consumer
permits. Continue RUN41 transport in parallel; propagate checked
native volume ratio through existing count adapter and same-host
ASK-MAIN budget. Do not claim RH.
HANDOFF TO kernel, theta, integration, editor, audit.
-/

noncomputable section
open NumberField IsDedekindDomain MeasureTheory Matrix Formalism.BasicNotions Formalism.MainNotions.StandardLattice Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes GlobalTheory.IndefiniteRowSideFullHecke
open scoped ENNReal TensorProduct
namespace GlobalTheory.VolRatioUnfold
attribute [local instance] Formalism.BasicNotions.Host.cmStar

set_option maxHeartbeats 1000000 in
theorem ratio_of_setting42 (hL5 : PlaceSplittingTypes.SelfDualLatticeDensity) (hR3 : ActionCoordinates.RealPlaceMeasures)
    (hEu : LocalAdditiveCharacterDual.EulerProductOfDensities)
    (D : D7) (hU : LatticeTensorUnfolding.Unfolding D) (hV : VolTie D) (W W' : HSpace D.host.E)
    (hSW : SW1b2 D.host.F D.host.E D.sp.cm.sig W.rank W.gram)
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
  have hβ0 : β ≠ 0 := by rcases hβ1 with h | h <;> simp [h]
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
  have hsw := hSW hr β hβ0 _ b (LatticeTensorUnfolding.latTensor (L0c D W) Φi) Φi Φf Φv hΦi hpure
    (fun v Y => by by_cases h : Y 0 ∈ GlobalTheory.AdelicU.latLoc D.host.F (GlobalTheory.AdelicU.frameLat W) v <;> simp [Φv, h])
    (fun X => by
      rw [LatticeTensorUnfolding.latTensor, GlobalTheory.AdelicU.hermitianSpaceBaseLattice_eq_frameLattice, mul_comm]
      by_cases h : projFin X 0 ∈ latHat D.host.F D.host.E (GlobalTheory.AdelicU.frameLat W : Set (Fin W.rank → D.host.E)) <;>
        simp [Φf, h])
  obtain ⟨⟨μi, hμi⟩, ⟨νi, hνi⟩, ⟨μv, hμv⟩, ⟨νv, hνv⟩, h8⟩ := (((hsw.2 ψ hψ).2 μ hμ.1).2 𝓕 h𝓕)
  obtain ⟨⟨fi, hfi⟩, ⟨fv, hfv⟩, h9⟩ := h8 μi νi μv νv hμi hνi hμv hνv
  have hmean := (h9 fi fv hfi hfv).2
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

theorem volumeRatio_of_host42 (D : D7)
    (hSW : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P, Q)) → 3 ≤ W.rank →
      SW1b2 D.host.F D.host.E D.sp.cm.sig W.rank W.gram) :
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
  have hSW₁ : SW1b2 D.host.F D.host.E D.sp.cm.sig W₁.rank W₁.gram :=
    hSW W P Q hW hsig hr
  refine ratio_of_setting42 GlobalTheory.LatticeDensityClosed.selfDualLatticeDensity
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
theorem volumeRatio_original42
    (hSW : ∀ (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E] [Algebra F E] (σ : E →ₐ[F] E),
      IsCMExt F E σ → ∀ (M : ℕ) (J : Matrix (Fin M) (Fin M) E), IsHermND σ J → SW1b2 F E σ M J) :
    ∀ D : D7, VolTie D → VolumeRatio₂ D := by
  intro D
  have hloc : ∀ (W : HSpace D.host.E) (P Q : ℕ), W.SigOK →
      (∀ τ, W.sig τ = (P, Q)) → 3 ≤ W.rank →
      SW1b2 D.host.F D.host.E D.sp.cm.sig W.rank W.gram := by
    intro W P Q hW hs hr
    exact hSW _ _ _ (GlobalTheory.AdelicU.isCMExt_host D) _ _
      (GlobalTheory.Mem.VolExists.isHermND D.sp.cm W)
  first
  | (rh_reduce 2 using [volumeRatio_of_host42]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact volumeRatio_of_host42 D hloc

rh_scan ratio_of_setting limit 2000
rh_scan volumeRatio_of_unfolding limit 2000
rh_scan GlobalTheory.VolRatioFromSecondClause.volumeRatio limit 2000
rh_scan volumeRatio_of_host42 limit 2000
rh_prune ratio_of_setting42 as RH42SingleGramPruned
rh_prune volumeRatio_of_host42 as RH42HostPruned
#print axioms GlobalTheory.VolRatioFromSecondClause.volumeRatio
#print axioms ratio_of_setting42
#print axioms volumeRatio_of_host42
#print axioms volumeRatio_original42
end GlobalTheory.VolRatioUnfold
