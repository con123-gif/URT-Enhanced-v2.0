import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoHostVanE
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN40 character boxes 25 Nov 2026. SOURCE-MATCHED conditional consumer reduction / PREPARED Lean, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d075, AGENTS 8db0201d, continuity 61459cfd. Peer audit 3e19ae4d direct tame cancellation, integration a5f9e057 (separate global LemmaK removal), dependency 20e156a7, Galois 51654a1e and prime 2f96ecf8 surveyed. Prior RUN39 1c042f1c retained. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Upstream search shows later cache-configuration commits 686902ae and b7a0adab; no switch of pin.
Native blobs relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/:
SoCocL.lean dcf4e5309372b443b989f37055d34a1071aa9140
SoLineNeg.lean bc274f45064e9d602be9f6b0079fc8f03ec8b1dd
SoHostVanE.lean 4d97dce5963b96608015bfdc5de00f94eae9c5bd
SoCobIndex.lean 5325653886d13eb817239ef25d99a6850fb065ae
SoDefs.lean b3bbfe232c241fbf3f147b255dcf5b49b2d7d229
CobDown.lean b879489f7a7b2dbbb325d8e219cbec88dfdcadbc
SoLocTors.lean 03febd0586428cd935da832be4c378cc7628ad64
SoDecNe.lean 0c7f77ff142f96b2cde9aa70814e94c96255ab1b
Mathlib GroupTheory/Index.lean 579a2624ffd741af6c3d1735cc4c8d20a6189ad9 (index_eq_zero_of_relIndex_eq_zero, index_ne_zero_of_finite).

Audit's direct tame proof need NOT establish the full decomposition-group coboundary away from l. Native So.soCoc consumes only CobOn on inertia at every A and CobOn on Dec at A.valuation(l)<1. Hence at v not dividing l it suffices to prove z=0 on ker(psi) intersect inertia. Indeed So.cobIndex applies with finite relative index (psi open kernel has finite index in G); zero is CobOn with a=1,m=0. This avoids unramified quotient density, Frobenius normalization of the coboundary and normal descent from ker(psi) to full Dec in the away-l route. Actual negative weight -e, e>=1, so Q^(-e)-Q !=0. Peer tame argument on finite kernel extension supplies zero in ordinary local-field mathematics: inertia there is precisely I intersect ker psi; cyclotomic action trivial on inertia, z additive, kills wild inertia (pro-p vs pro-l), Frobenius conjugation gives (Q^(-e)-Q)z(t)=0 after wild inertia killed. Q is residue size of kernel field. No assertion of exact tame relation in absolute group. No need to prove anything about z(F) or quotient generation. Finite-index averaging proof already native. Above-l and trivial-place arguments retained. Need native local tame transport, not established by this file. No global deletions; original So.soCoc and its LemmaK, PT, LF_K, LT_K remain here; peer integration candidate not composed. Same host and all arithmetic windows retained.

Original selected graph: CountV -> So.hostVanE -> So.lineNeg -> So.soCocL -> So.locTors -> locKill + decNe + cobLim; also So.soCoc and cobPlace. Candidate: same callers via hostVanE40/lineNeg40/soCocL40 -> AwayInertia40 -> AwayInertiaZero40 via cobIndex; above-l cobPlace and global So.soCoc unchanged. Original graph and axiom ledger retained; all other branches open. Cache key includes source/toolchain, actual k/Omega/l/c/psi/e/z/v/A and kernel extension residue size. Backtrack via away40_of_native if transport not available. Do not merge local finiteness removals globally.
Executed 40 fail-on-error source/hash/unique-edit/reversal assertions in connector JS; these are not kernel tests. Initial generation stopped on ambiguous pl_uniq and host intro matches; corrected to exact declaration and intro offsets. CI status JSONs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and 7da354941e402b6f8b364ed03d8c5c82d27b7717 reread (returncode 0); job lists confirm success for 45577239749 and 45576756833, conditional root axioms propext/Classical.choice/Quot.sound. No new kernel scan/prune/axiom evidence or CI claimed; local native replay not performed. Native requests below are preparations, no circular RH imports.
RESUME HERE: compile this consumer adapter, link tame-inertia transport only for zero-on-intersection supplier, check native above-l valuation coercion and actual CountV caller with original and reduced scans/axioms; coordinate with audit and integration rather than proving full Dec away l. HANDOFF TO audit / CountV / integration / kernel.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X

def AwayInertia40 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal → CobOn (Chr.Psi l e ψ)⁻¹ z (Ine (F := k) A)

def AwayInertiaZero40 : Prop :=
  ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v → ((l : ℕ) : 𝓞 k) ∉ v.asIdeal → ∀ g ∈ ψ.ker ⊓ Ine (F := k) A, z g = 0

theorem away40_of_zero (hZ : AwayInertiaZero40) : AwayInertia40 := by
  intro k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc v A hv hvl
  haveI : IsGalois k Ω := {}
  haveI : Finite (G k Ω ⧸ ψ.ker) := Subgroup.quotient_finite_of_isOpen _ ho
  have hi : ψ.ker.relIndex (Ine (F := k) A) ≠ 0 := by
    intro h
    exact Subgroup.index_ne_zero_of_finite (ψ.ker.index_eq_zero_of_relIndex_eq_zero h)
  exact So.cobIndex c.O _ _ z hz ψ.ker _ hi
    (cobOn_of_eq_zero _ (hZ k Ω l c ψ ho e he z hz hc v A hv hvl))

theorem away40_of_native (lf : LocalFiniteness) (lt : LocalTateDuality)
    (le : LocalEulerChar) : AwayInertia40 := by
  intro k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc v A hA hv
  rw [Chr.Psi_inv] at hz ⊢
  have ho' : IsOpen ((ψ⁻¹).ker : Set (G k Ω)) := by
    have : (ψ⁻¹).ker = ψ.ker := by
      ext g
      simp [MonoidHom.mem_ker]
    rwa [this]
  exact (So.locTors lf lt le k Ω l c.O ψ⁻¹ ho' _ (by omega) (by omega) v A hA hv z hz hc).mono (Ine_le_Dec A)

theorem UpperTheory.V.X.So.soCocL40 : ∀ CK : ℝ, LemmaK CK → GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → AwayInertia40 → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → (∀ v : HeightOneSpectrum (𝓞 k), ((l : ℕ) : 𝓞 k) ∈ v.asIdeal → ∃ A : ValuationSubring Ω, IsPlaceOver A v ∧ CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A)) → CobOn (Chr.Psi l e ψ)⁻¹ z ⊤ := by
  intro CK hK pt fK tK hI k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc hl
  have above : ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v →
      ((l : ℕ) : 𝓞 k) ∈ v.asIdeal → CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A) := by
    intro v A hA hv
    obtain ⟨A', hA', h⟩ := hl v hv
    exact So.cobPlace k Ω c.O _ z hz v A' A hA' hA h
  refine So.soCoc CK hK pt fK tK k Ω l c ψ ho e he z hz hc (fun A => ?_) fun A hA => ?_
  · by_cases h : A = ⊤
    · rw [((places k Ω l A).2.1 h).1]
      refine cobOn_of_eq_zero _ fun g hg => ?_
      rw [Subgroup.mem_bot.1 hg]
      simpa using hz 1 1
    · obtain ⟨v, hv⟩ := (places k Ω l A).1 h
      by_cases hvl : ((l : ℕ) : 𝓞 k) ∈ v.asIdeal
      · exact (above v A hv hvl).mono (Ine_le_Dec A)
      · exact hI k Ω l c ψ ho e he z hz hc v A hv hvl
  · obtain ⟨v, hv⟩ := (places k Ω l A).1 fun h => ((places k Ω l A).2.1 h).2 hA
    have hvl : ((l : ℕ) : 𝓞 k) ∈ v.asIdeal := by
      apply (hv ((l : ℕ) : 𝓞 k)).2
      simpa using hA
    exact above v A hv hvl

private theorem pl_uniq40 {l : ℕ} (hl : l.Prime) {v w : HeightOneSpectrum (𝓞 ℚ)} (hv : ((l : ℕ) : 𝓞 ℚ) ∈ v.asIdeal)
    (hw : ((l : ℕ) : 𝓞 ℚ) ∈ w.asIdeal) : v = w := by
  have hp : Prime ((l : ℕ) : 𝓞 ℚ) := by
    have h : Prime ((l : ℕ) : ℤ) := Nat.prime_iff_prime_int.mp hl
    have e : ((l : ℕ) : 𝓞 ℚ) = Rat.ringOfIntegersEquiv.symm ((l : ℕ) : ℤ) := by simp
    rw [e]
    exact (MulEquiv.prime_iff Rat.ringOfIntegersEquiv.symm.toMulEquiv).mpr h
  have hm : (Ideal.span {((l : ℕ) : 𝓞 ℚ)}).IsMaximal :=
    ((Ideal.span_singleton_prime hp.ne_zero).mpr hp).isMaximal (by rw [Ne, Ideal.span_singleton_eq_bot]; exact hp.ne_zero)
  exact HeightOneSpectrum.ext
    ((hm.eq_of_le v.isPrime.ne_top ((Ideal.span_singleton_le_iff_mem _).2 hv)).symm.trans
      (hm.eq_of_le w.isPrime.ne_top ((Ideal.span_singleton_le_iff_mem _).2 hw)))

theorem UpperTheory.V.X.So.lineNeg40 :
    ∀ CK : ℝ, LemmaK CK → GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → AwayInertia40 → ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (N : ℕ) [NeZero N] (e : ℕ) (ψ : DirichletCharacter c.O N) (S : Finset UnitaryThreeInertia.Pl) (A : S → ValuationSubring Ω) (F : UnitaryThreeInertia.Frame c.O (G ℚ Ω) (UnitaryThreeInertia.Gam Ω S) S), 1 ≤ e → UnitaryThreeInertia.IsHostFrame Ω c e ψ S A F → ∀ j : ℤ, j < 0 → ∀ s : ℕ, LineVan F j (lineChar F j s) := by
  intro CK hK pt fK tK hI Ω _ _ _ l hl c N _ e ψ S A F he hF j hj s z hz hc _ _ hD
  obtain ⟨n, rfl⟩ : ∃ n : ℕ, j = -(n : ℤ) := ⟨(-j).toNat, by omega⟩
  have hn : 1 ≤ n := by omega
  let η₀ : G ℚ Ω →* c.Oˣ := (Units.map (Int.castRingHom c.O).toMonoidHom).comp (UnitaryThreeInertia.eta4 Ω)
  let ψ' : G ℚ Ω →* c.Oˣ := Chr.dirG ℚ Ω ψ ^ n * (η₀ ^ s)⁻¹
  have hη : ∀ g, F.η (F.π g) = UnitaryThreeInertia.eta4 Ω g := fun g => DFunLike.congr_fun hF.η g
  have hΨ : ∀ g, F.Ψ (F.π g) = Chr.Psi l e (Chr.dirG ℚ Ω ψ) g := fun g => DFunLike.congr_fun hF.Ψ g
  have hθ : ∀ g, (Chr.Psi l (e * n) ψ')⁻¹ g = lineChar F (-(n : ℤ)) s (F.π g) := by
    intro g
    have h1 : etaO F (F.π g) = η₀ g := by
      simp only [etaO, η₀, MonoidHom.comp_apply, hη]
    simp only [lineChar, MonoidHom.mul_apply, MonoidHom.zpow_apply, MonoidHom.pow_apply, MonoidHom.inv_apply, hΨ, h1,
      Chr.Psi, ψ', zpow_neg, zpow_natCast, mul_pow, pow_mul, mul_inv, inv_inv, mul_assoc]
  have ho : IsOpen (ψ'.ker : Set (G ℚ Ω)) := by
    refine Subgroup.isOpen_mono (H₁ := (Chr.cls ℚ Ω N).ker ⊓ (Chr.cls ℚ Ω 4).ker) (fun g hg => ?_)
      ((Chr.clsFacts ℚ Ω N).1.inter (Chr.clsFacts ℚ Ω 4).1)
    have h1 : Chr.cls ℚ Ω N g = 1 := hg.1
    have h2 : Chr.cls ℚ Ω 4 g = 1 := hg.2
    simp only [MonoidHom.mem_ker, ψ', η₀, UnitaryThreeInertia.eta4, Chr.dirG, MonoidHom.mul_apply, MonoidHom.pow_apply,
      MonoidHom.inv_apply, MonoidHom.comp_apply, h1, h2, map_one, one_pow, inv_one, mul_one]
  have hπc : Continuous F.π := by rw [hF.π]; exact continuous_toGS Ω _
  have hπs : Function.Surjective F.π := by rw [hF.π]; exact QuotientGroup.mk_surjective
  have hz' : Coc (Chr.Psi l (e * n) ψ')⁻¹ (fun g => z (F.π g)) := fun g h => by
    rw [hθ]
    show z (F.π (g * h)) = _
    rw [map_mul, hz]
  obtain ⟨a, ha, m, hm⟩ := So.soCocL40 CK hK pt fK tK hI ℚ Ω l c ψ' ho (e * n) (Nat.mul_pos he hn)
    (fun g => z (F.π g)) hz' (fun k => (hc k).comp_continuous hπc) (fun v hv => by
      obtain rfl : v = F.vl.1 := pl_uniq40 hl.out hv hF.vl
      refine ⟨A F.vl, hF.isOver _, So.cobIndex c.O _ _ _ hz' (UnitaryThreeInertia.eta4 Ω).ker _ ?_ ?_⟩
      · haveI : (UnitaryThreeInertia.eta4 Ω).ker.FiniteIndex := ⟨by rw [Subgroup.index_ker]; exact Nat.card_pos.ne'⟩
        exact Subgroup.FiniteIndex.index_ne_zero
      · obtain ⟨y, hy⟩ := hD hj
        refine ⟨1, one_ne_zero, y, fun g hg => ?_⟩
        rw [one_mul, hθ]
        exact hy ⟨g, by rw [hF.D]; exact hg.2⟩ ((hη g).trans hg.1))
  refine ⟨a, ha, m, fun g _ => ?_⟩
  obtain ⟨g, rfl⟩ := hπs g
  rw [← hθ]
  exact hm g trivial

theorem UpperTheory.V.X.So.hostVanE40 : ∀ CK : ℝ, LemmaK CK → GlobalTheory.Published.PoitouTateDuality → LocalFinitenessK → LocalTateDualityK → AwayInertia40 → UnitaryThreeInertia.HostVanE := by
  intro CK hK hPT hLFK hLTDK hI Ω _ _ _ l _ c N _ e ψ o₁ hD S A F hF
  apply So.vanEOf c.O _ _ _ F
  intro j hj s
  rcases hj.lt_or_eq with hlt | heq
  · exact So.lineNeg40 CK hK hPT hLFK hLTDK hI Ω l c N e ψ S A F hD.e_pos hF j hlt s
  · subst heq
    exact So.lineZero c.O _ _ _ F (UnitaryThreeInertia.frame_class_one Ω c e ψ o₁ hD S A F hF) s


example (hZ : AwayInertiaZero40) : AwayInertia40 := by
  first
  | (rh_reduce 2 using [away40_of_zero]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact away40_of_zero hZ

rh_scan UpperTheory.V.X.So.soCocL limit 2000
rh_scan UpperTheory.V.X.So.soCocL40 limit 2000
rh_scan UpperTheory.V.X.So.hostVanE40 limit 2000
rh_prune away40_of_zero as RHAwayInertiaPruned40
#print axioms UpperTheory.V.X.So.soCocL
#print axioms away40_of_zero
#print axioms away40_of_native
#print axioms UpperTheory.V.X.So.soCocL40
#print axioms UpperTheory.V.X.So.lineNeg40
#print axioms UpperTheory.V.X.So.hostVanE40
