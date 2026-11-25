import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import RHCountVQualitativeSha40
import RHShaQualitative42
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 lane 14, 25 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory pipeline), AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d075. Latest 25 commits surveyed including prime-window 2f96ecf8, character boxes dbbc49e3, integration a5f9e057, audit a35ccf3d. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
RESULT: propagate qualitative Sha through all seven actual CountV callers and into original VWin. Prior core needs only finite Chr.V, not quantitative LemmaK; peer supplies qualitative Sha via cancellation of (l^nu)^r and uniform finite cardinal, not quantitative torsion bound. Reuse same field, character, coefficient ring, prime, weight and host. Other CountV local finiteness, Tate duality and Euler premises remain. hN.coh.pt stays at separate countV_of_finiteness_duality_euler_host caller. Do not compose with separate inertia-only reduction without checking compatibility.
Original selected graph: VWin -> CountV -> hostVanE -> lineNeg -> soCocL -> soCoc -> soBar -> soVec -> soFin -> LemmaK -> SFinal(SNum(...STors)). Candidate VWin41 -> CountV41 -> hostVanE41 -> lineNeg41 -> soCocL41 -> soCoc41 -> soBar41 -> soVec41 -> soFin40 -> RHShaFinite40 <- shaLenFinite42_native. Original VWin hK stays at of_four_alt, CountI and joint CountII/III. No global deletion of LemmaK, PT, K-duality, STors or SNum. Integration window_sha41 can replace CountV separately after replay. All original graphs, unresolved axioms and pending nodes preserved. Cache key: pin, toolchain, actual theorem/body, L, Omega, D, l, e, psi, coefficient field and witness context; no cross-host merges. Backtrack to native original if replay fails.
Source ledger relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
LevelCohomology/IntIffNorm.lean | 6645d8e9edcc159cf08c92fb0e5970f3bdcc25e7 | UpperTheory.V.X.soVec | soFin CK hK hPT hLF hLT -> soFin40 hSF
LevelCohomology/FdAdjoinRange.lean | 18b0c460e4f92a7fa7f973d5ddf05ba27fade635 | UpperTheory.V.X.soBar | UpperTheory.V.X.soVec CK hK hPT hLF hLT -> UpperTheory.V.X.soVec41 hSF
LevelCohomology/CobDown.lean | b879489f7a7b2dbbb325d8e219cbec88dfdcadbc | UpperTheory.V.X.So.soCoc | UpperTheory.V.X.soBar CK hK hPT hLF hLT -> UpperTheory.V.X.soBar41 hSF
LevelCohomology/SoCocL.lean | dcf4e5309372b443b989f37055d34a1071aa9140 | UpperTheory.V.X.So.soCocL | So.soCoc CK hK pt fK tK -> So.soCoc41 hSF
LevelCohomology/SoLineNeg.lean | bc274f45064e9d602be9f6b0079fc8f03ec8b1dd | UpperTheory.V.X.So.lineNeg | So.soCocL CK hK pt fK tK -> So.soCocL41 hSF
LevelCohomology/SoHostVanE.lean | 4d97dce5963b96608015bfdc5de00f94eae9c5bd | UpperTheory.V.X.So.hostVanE | So.lineNeg CK hK hPT hLFK hLTDK -> So.lineNeg41 hSF
ModularityArgument/ThresholdArguments/DenseThresholdCases/LinkedUnlE.lean | 01ff1f8cd56f56488e044a35443a8eda3d5d0e3e | count_v_of_printed_bound_k_reduced_unitary_lift | X.So.hostVanE CK hL (_root_.UpperTheory.V.HV.U.pt_s hN) hN.coh.lfK hN.coh.ltK -> X.So.hostVanE41 hSF
ModularityArgument/ThresholdArguments/DenseThresholdCases/WindowBoundOfLiteratureLevel.lean | 01c499108485b16d33791a9e46fbb1e2af865522 | vwin_of_hypotheses_H_E_alt | _root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2 -> _root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift41 hH rhShaFinite_native41 hE.2
Peer qualitative blob 28fbe1909f0e302da7f28180e9ed3cebd85ca4c2; prior core blob d90379de71c26d2ca89603046908fc231f334783. Interface definitions match modulo name.
Executed 94 fail-on-error source hash, unique edit, reverse reconstruction, old-signature, sibling-preservation and interface assertions in connector JS. First attempt rejected a false positive on hK-subscript-zero (ASCII regex word boundary); corrected check to exact old signature/call tokens. No synthetic inputs. Local lean/lake absent. Historical CI statuses 45577239749 and 45576756833 retrieved with returncode 0; baseline engines only. No new native compilation or CI submission, no new axiom evidence. Native private-helper resolution via open private requires replay; if inaccessible use same-module overlay with private helpers in scope. No speed claim or closure of essential premises.
RESUME HERE: stage RUN40 as RHCountVQualitativeSha40 and prime RUN42 as RHShaQualitative42 in warmed pinned runner, replay this file and compare original/reduced actual VWin scans and axioms. If open private fails use exact source overlays. Then integrate checked CountV replacement into window_sha41 and prioritize quantitative SNum/CountI/II and joint geometry rather than further qualitative reformulation.
HANDOFF TO integration, kernel, prime window, audit, Galois.
-/
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

theorem rhShaFinite_native41 : RHShaFinite40 := by
  first
  | (rh_reduce 2 using [shaLenFinite42_native]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact shaLenFinite42_native

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.V.Odd UpperTheory.V.ML UpperTheory.V.X
open TensorProduct nonZeroDivisors
open private int_iff_norm from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.IntIffNorm
open private qo_proj from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.IntIffNorm
open private core from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.IntIffNorm

theorem UpperTheory.V.X.soVec41 :
    RHShaFinite40 → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (E : IntermediateField ℚ_[l] (PadicAlgCl l)) [FiniteDimensional ℚ_[l] E] (ψ : G k Ω →* (PadicAlgCl l)ˣ), IsOpen (ψ.ker : Set (G k Ω)) → (∀ g, (ψ g : PadicAlgCl l) ∈ E) →
    ∀ e : ℕ, 1 ≤ e → ∀ θ : G k Ω → PadicAlgCl l, (∀ g, θ g * (ψ g : PadicAlgCl l) * algebraMap ℤ_[l] (PadicAlgCl l) (cycZ k Ω l g : ℤ_[l]) ^ e = 1) →
    ∀ c : G k Ω → PadicAlgCl l, Continuous c → (∀ g, c g ∈ E) → (∀ g h, c (g * h) = c g + θ g * c h) →
    (∀ A : ValuationSubring Ω, ∃ m, ∀ g ∈ Ine (F := k) A, c g = θ g * m - m) →
    (∀ A : ValuationSubring Ω, A.valuation (l : Ω) < 1 → ∃ m, ∀ g ∈ Dec (F := k) A, c g = θ g * m - m) → ∃ m ∈ E, ∀ g, c g = θ g * m - m := by
  intro hSF k Ω _ _ _ _ _ l _ E _ ψ hψ hψE e he θ hθ c hc hcE hco hI hD
  obtain ⟨h1, h2, h3⟩ := UpperTheory.V.abelian₂.dvr_intClosure l E
  let O := integralClosure ℤ_[l] E
  have hint : ∀ x : E, IsIntegral ℤ_[l] x ↔ ‖x‖ ≤ 1 := int_iff_norm E.val
  haveI : IsGalois k Ω := {}
  haveI : CompactSpace (G k Ω) := inferInstanceAs (CompactSpace (Ω ≃ₐ[k] Ω))
  haveI : Finite (G k Ω ⧸ ψ.ker) := Subgroup.quotient_finite_of_isOpen _ hψ
  have hidx : ψ.ker.index ≠ 0 := Subgroup.index_ne_zero_of_finite
  have hψ1 : ∀ g, ‖(ψ g : PadicAlgCl l)‖ ≤ 1 := by
    intro g
    have h := MonoidHom.mem_ker.1 (ψ.ker.pow_index_mem g)
    rw [map_pow] at h
    have h' : ‖(ψ g : PadicAlgCl l)‖ ^ ψ.ker.index = 1 := by
      rw [← norm_pow, ← Units.val_pow_eq_pow_val, h, Units.val_one, norm_one]
    exact ((pow_eq_one_iff_of_nonneg (norm_nonneg _) hidx).1 h').le
  let ψ₀ : G k Ω →* O :=
    { toFun := fun g => ⟨⟨ψ g, hψE g⟩, (hint _).2 (hψ1 g)⟩
      map_one' := Subtype.ext (Subtype.ext (by simp))
      map_mul' := fun a b => Subtype.ext (Subtype.ext (by simp)) }
  let ψO : G k Ω →* Oˣ := ψ₀.toHomUnits
  have hker : ψO.ker = ψ.ker := by
    ext g
    simp only [MonoidHom.mem_ker, Units.ext_iff, Subtype.ext_iff]
    rfl
  have hfin := soFin40 hSF k Ω l O ψO (hker ▸ hψ) e he
  let ι : O →+* PadicAlgCl l := (algebraMap E (PadicAlgCl l)).comp (algebraMap O E)
  let θO : G k Ω →* Oˣ := ψO⁻¹ * chiO k Ω l O ^ (-(e : ℤ))
  have hθO : ∀ g, ι (θO g : O) = θ g := by
    intro g
    have a1 : θO g * ψO g * chiO k Ω l O g ^ e = 1 := by
      simp only [θO, MonoidHom.mul_apply, MonoidHom.inv_apply, MonoidHom.zpow_apply, zpow_neg, zpow_natCast,
        MonoidHom.pow_apply]
      rw [mul_comm (ψO g)⁻¹, inv_mul_cancel_right, inv_mul_cancel]
    have a2 := congrArg (fun u : Oˣ => ι u) a1
    simp only [Units.val_mul, Units.val_pow_eq_pow_val, map_mul, map_pow, Units.val_one, map_one] at a2
    have a3 : ι (θO g : O) * (ψ g : PadicAlgCl l) * algebraMap ℤ_[l] (PadicAlgCl l) (cycZ k Ω l g : ℤ_[l]) ^ e = 1 := a2
    have a4 := hθ g
    rw [mul_assoc] at a3 a4
    rw [eq_inv_of_mul_eq_one_left a3, eq_inv_of_mul_eq_one_left a4]
  have hsm : ∀ g (x : E), (((θO g : O) • x : E) : PadicAlgCl l) = θ g * x := by
    intro g x
    rw [← hθO]
    rfl
  haveI : IsLocalization (Algebra.algebraMapSubmonoid O ℤ_[l]⁰) E := IsIntegralClosure.isLocalization ℤ_[l] ℚ_[l] E O
  obtain ⟨π, hs, hk⟩ := qo_proj l O E
  have hk' : ∀ x, π x = 0 ↔ ‖x‖ ≤ 1 := fun x =>
    (hk x).trans ⟨fun ⟨o, ho⟩ => (hint x).1 (ho ▸ o.2), fun h => ⟨⟨x, (hint x).2 h⟩, rfl⟩⟩
  have hπ : Continuous π := by
    refine continuous_of_continuousAt_zero π ?_
    refine (continuousAt_const (y := (0 : QO l O))).congr ?_
    filter_upwards [Metric.closedBall_mem_nhds (0 : E) one_pos] with x hx
    exact ((hk' x).2 (by simpa using hx)).symm
  have hl1 : ‖algebraMap O E (l : O)‖ < 1 := by
    have : ‖algebraMap O E (l : O)‖ = ‖algebraMap ℚ_[l] (PadicAlgCl l) l‖ := by
      rw [map_natCast, map_natCast]
      rfl
    rw [this, norm_algebraMap']
    exact Padic.norm_p_lt_one
  have hl0 : algebraMap O E (l : O) ≠ 0 := by
    rw [map_natCast]
    exact Nat.cast_ne_zero.2 (Fact.out : l.Prime).ne_zero
  have hlm : (l : O) ∈ IsLocalRing.maximalIdeal O := by
    rintro ⟨u, hu⟩
    have b1 : ‖algebraMap O E ((u⁻¹ : Oˣ) : O)‖ ≤ 1 := (hint _).1 ((u⁻¹ : Oˣ) : O).2
    have b2 : ‖algebraMap O E (l : O)‖ * ‖algebraMap O E ((u⁻¹ : Oˣ) : O)‖ = 1 := by
      rw [← norm_mul, ← map_mul, ← hu, Units.mul_inv, map_one, norm_one]
    exact absurd b2 (mul_lt_one_of_nonneg_of_lt_one_left (norm_nonneg _) hl1 b1).ne
  have hθE : ∀ g, θ g ∈ E := fun g => hθO g ▸ ((θO g : O) : E).2
  have hE : ∀ (D : Subgroup (G k Ω)) (m : PadicAlgCl l), (∀ g ∈ D, c g = θ g * m - m) →
      ∃ m' : E, ∀ g ∈ D, (⟨c g, hcE g⟩ : E) = (θO g : O) • m' - m' := by
    intro D m hm
    by_cases h : ∀ g ∈ D, θ g = 1
    · refine ⟨0, fun g hg => Subtype.ext ?_⟩
      simp [hm g hg, h g hg]
    push Not at h
    obtain ⟨g₀, hg₀, h⟩ := h
    have hmE : m ∈ E := by
      have : m = c g₀ / (θ g₀ - 1) := by
        rw [hm g₀ hg₀, eq_div_iff (sub_ne_zero.2 h)]
        ring
      rw [this]
      exact div_mem (hcE _) (sub_mem (hθE _) (one_mem _))
    refine ⟨⟨m, hmE⟩, fun g hg => Subtype.ext ?_⟩
    rw [AddSubgroupClass.coe_sub, hsm]
    exact hm g hg
  obtain ⟨m, hm⟩ := core π hs hπ (fun x => (hk' x).1) (Chr.rho l e ψO) (fun g => (θO g : O)) (fun _ _ => rfl)
    (shaFam k Ω l) hfin hlm hl0 hl1 (fun g => ⟨c g, hcE g⟩) (hc.subtype_mk _)
    (fun g h => Subtype.ext (by rw [AddMemClass.coe_add, hsm]; exact hco g h)) (by
      rintro D (⟨A, hA, rfl⟩ | ⟨A, rfl⟩)
      · obtain ⟨m, hm⟩ := hD A hA
        exact hE _ m hm
      · obtain ⟨m, hm⟩ := hI A
        exact hE _ m hm)
  refine ⟨m, m.2, fun g => ?_⟩
  have := congrArg Subtype.val (hm g)
  rw [AddSubgroupClass.coe_sub, hsm] at this
  exact this
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.V.Odd UpperTheory.V.ML UpperTheory.V.X
open private char_finext from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.FdAdjoinRange
open private coc_finext from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.FdAdjoinRange

theorem UpperTheory.V.X.soBar41 :
    RHShaFinite40 → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (ψ : G k Ω →* (PadicAlgCl l)ˣ), IsOpen (ψ.ker : Set (G k Ω)) →
    ∀ e : ℕ, 1 ≤ e → ∀ θ : G k Ω → PadicAlgCl l, (∀ g, θ g * (ψ g : PadicAlgCl l) * algebraMap ℤ_[l] (PadicAlgCl l) (cycZ k Ω l g : ℤ_[l]) ^ e = 1) →
    ∀ c : G k Ω → PadicAlgCl l, Continuous c → (∀ g h, c (g * h) = c g + θ g * c h) →
    (∀ A : ValuationSubring Ω, ∃ m, ∀ g ∈ Ine (F := k) A, c g = θ g * m - m) →
    (∀ A : ValuationSubring Ω, A.valuation (l : Ω) < 1 → ∃ m, ∀ g ∈ Dec (F := k) A, c g = θ g * m - m) → ∃ m, ∀ g, c g = θ g * m - m := by
  intro hSF k Ω _ _ _ _ _ l _ ψ hψ e he θ hθ c hc hcoc h1 h2
  obtain ⟨K₀, hK₀, hψK⟩ := char_finext l (G k Ω) ψ hψ
  have hθK : ∀ g, θ g ∈ K₀ := fun g => by
    have h := hθ g
    rw [mul_assoc] at h
    rw [eq_inv_of_mul_eq_one_left h]
    refine inv_mem (mul_mem (hψK g) (pow_mem ?_ _))
    rw [IsScalarTower.algebraMap_apply ℤ_[l] ℚ_[l] (PadicAlgCl l)]
    exact K₀.algebraMap_mem _
  have hθ1 : θ 1 = 1 := by simpa using hθ 1
  obtain ⟨E, hE, hle, hcE⟩ := coc_finext l (G k Ω) K₀ θ c hθK hθ1 hc hcoc
  obtain ⟨m, -, hm⟩ := UpperTheory.V.X.soVec41 hSF k Ω l E ψ hψ (fun g => hle (hψK g)) e he θ hθ c hc hcE hcoc h1 h2
  exact ⟨m, hm⟩
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X
open private cob_up from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.CobDown
open private cob_down from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.CobDown

theorem UpperTheory.V.X.So.soCoc41 :
    RHShaFinite40 → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → (∀ A : ValuationSubring Ω, CobOn (Chr.Psi l e ψ)⁻¹ z (Ine (F := k) A)) → (∀ A : ValuationSubring Ω, A.valuation (l : Ω) < 1 → CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A)) → CobOn (Chr.Psi l e ψ)⁻¹ z ⊤ := by
  intro hSF k Ω _ _ _ _ _ l _ c ψ hψ e he z hz hc h1 h2
  let ψ' : G k Ω →* (PadicAlgCl l)ˣ := (Units.map c.O.val.toMonoidHom).comp ψ
  have hψ' : IsOpen (ψ'.ker : Set (G k Ω)) := by
    refine Subgroup.isOpen_mono (H₁ := ψ.ker) (fun g hg => ?_) hψ
    have : ψ g = 1 := hg
    show Units.map c.O.val.toMonoidHom (ψ g) = 1
    rw [this, map_one]
  have hcz : Continuous z := ((UpperTheory.V.X.So.adicCont l c).2 _ z).1 hc
  obtain ⟨m, hm⟩ := UpperTheory.V.X.soBar41 hSF k Ω l ψ' hψ' e he
    (fun g => (((Chr.Psi l e ψ)⁻¹ g : c.O) : PadicAlgCl l)) (fun g => by
      have h0 : (((Chr.Psi l e ψ)⁻¹ g : c.Oˣ) : c.O) * (ψ g : c.O) * algebraMap ℤ_[l] c.O (cycZ k Ω l g : ℤ_[l]) ^ e = 1 := by
        have e1 : algebraMap ℤ_[l] c.O (cycZ k Ω l g : ℤ_[l]) = (chiO k Ω l c.O g : c.O) := rfl
        rw [e1, ← Units.val_pow_eq_pow_val, ← Units.val_mul, ← Units.val_mul, Units.val_eq_one]
        show (chiO k Ω l c.O g ^ (e : ℤ) * ψ g)⁻¹ * ψ g * chiO k Ω l c.O g ^ e = 1
        rw [zpow_natCast, mul_assoc, mul_comm (ψ g), inv_mul_cancel]
      have h3 := congrArg c.O.val h0
      rw [map_mul, map_mul, map_pow, map_one, AlgHom.commutes] at h3
      exact h3)
    (fun g => (z g : PadicAlgCl l)) (continuous_subtype_val.comp hcz)
    (fun g h => by exact_mod_cast congrArg Subtype.val (hz g h))
    (fun A => cob_up c.O _ z _ (h1 A)) (fun A hA => cob_up c.O _ z _ (h2 A hA))
  exact cob_down c.O _ z m hm
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X


theorem UpperTheory.V.X.So.soCocL41 : RHShaFinite40 → LocalFiniteness → LocalTateDuality → LocalEulerChar → ∀ (k Ω : Type) [Field k] [NumberField k] [Field Ω] [Algebra k Ω] [IsAlgClosure k Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (ψ : G k Ω →* c.Oˣ), IsOpen (ψ.ker : Set (G k Ω)) → ∀ e : ℕ, 1 ≤ e → ∀ z : G k Ω → c.O, Coc (Chr.Psi l e ψ)⁻¹ z → Alg.AdicCont (maximalIdeal c.O) z → (∀ v : HeightOneSpectrum (𝓞 k), ((l : ℕ) : 𝓞 k) ∈ v.asIdeal → ∃ A : ValuationSubring Ω, IsPlaceOver A v ∧ CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A)) → CobOn (Chr.Psi l e ψ)⁻¹ z ⊤ := by
  intro hSF lf lt le k Ω _ _ _ _ _ l hl c ψ ho e he z hz hc hl
  have key : ∀ (v : HeightOneSpectrum (𝓞 k)) (A : ValuationSubring Ω), IsPlaceOver A v →
      CobOn (Chr.Psi l e ψ)⁻¹ z (Dec (F := k) A) := fun v A hA => by
    by_cases hv : ((l : ℕ) : 𝓞 k) ∈ v.asIdeal
    · obtain ⟨A', hA', h⟩ := hl v hv
      exact So.cobPlace k Ω c.O _ z hz v A' A hA' hA h
    · rw [Chr.Psi_inv] at hz ⊢
      have ho' : IsOpen ((ψ⁻¹).ker : Set (G k Ω)) := by
        have : (ψ⁻¹).ker = ψ.ker := by
          ext g
          simp [MonoidHom.mem_ker]
        rwa [this]
      exact So.locTors lf lt le k Ω l c.O ψ⁻¹ ho' _ (by omega) (by omega) v A hA hv z hz hc
  refine So.soCoc41 hSF k Ω l c ψ ho e he z hz hc (fun A => ?_) fun A hA => ?_
  · by_cases h : A = ⊤
    · rw [((places k Ω l A).2.1 h).1]
      refine cobOn_of_eq_zero _ fun g hg => ?_
      rw [Subgroup.mem_bot.1 hg]
      simpa using hz 1 1
    · obtain ⟨v, hv⟩ := (places k Ω l A).1 h
      exact (key v A hv).mono (Ine_le_Dec A)
  · obtain ⟨v, hv⟩ := (places k Ω l A).1 fun h => ((places k Ω l A).2.1 h).2 hA
    exact key v A hv
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X
open private pl_uniq from Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.SoLineNeg

theorem UpperTheory.V.X.So.lineNeg41 :
    RHShaFinite40 → LocalFiniteness → LocalTateDuality → LocalEulerChar → ∀ (Ω : Type) [Field Ω] [CharZero Ω] [IsAlgClosure ℚ Ω] (l : ℕ) [Fact l.Prime] (c : HV.Coef l) (N : ℕ) [NeZero N] (e : ℕ) (ψ : DirichletCharacter c.O N) (S : Finset UnitaryThreeInertia.Pl) (A : S → ValuationSubring Ω) (F : UnitaryThreeInertia.Frame c.O (G ℚ Ω) (UnitaryThreeInertia.Gam Ω S) S), 1 ≤ e → UnitaryThreeInertia.IsHostFrame Ω c e ψ S A F → ∀ j : ℤ, j < 0 → ∀ s : ℕ, LineVan F j (lineChar F j s) := by
  intro hSF lf lt le Ω _ _ _ l hl c N _ e ψ S A F he hF j hj s z hz hc _ _ hD
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
  obtain ⟨a, ha, m, hm⟩ := So.soCocL41 hSF lf lt le ℚ Ω l c ψ' ho (e * n) (Nat.mul_pos he hn)
    (fun g => z (F.π g)) hz' (fun k => (hc k).comp_continuous hπc) (fun v hv => by
      obtain rfl : v = F.vl.1 := pl_uniq hl.out hv hF.vl
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
end

section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.GaloisCohomology IsLocalRing UpperTheory.V UpperTheory.V.Base UpperTheory.V.X


theorem UpperTheory.V.X.So.hostVanE41 : RHShaFinite40 → LocalFiniteness → LocalTateDuality → LocalEulerChar → UnitaryThreeInertia.HostVanE := by
  intro hSF hLF hLTD hLEC Ω _ _ _ l _ c N _ e ψ o₁ hD S A F hF
  apply So.vanEOf c.O _ _ _ F
  intro j hj s
  rcases hj.lt_or_eq with hlt | heq
  · exact So.lineNeg41 hSF hLF hLTD hLEC Ω l c N e ψ S A F hD.e_pos hF j hlt s
  · subst heq
    exact So.lineZero c.O _ _ _ F (UnitaryThreeInertia.frame_class_one Ω c e ψ o₁ hD S A F hF) s
end

section
open Formalism.GaloisCohomology UpperTheory.Top GlobalTheory.Mem.LiteralAutomorphy
namespace UpperTheory.V.Z.J
open UpperTheory.V.HV UpperTheory.V.Lit UpperTheory.V.W UpperTheory.V.J


theorem count_v_of_printed_bound_k_reduced_unitary_lift41 (hH : _root_.UpperTheory.V.Af.HypothesesH') (hSF : RHShaFinite40) (hS : _root_.UpperTheory.V.Aut.ThmS6Core_s) : CountV := by
  have hN := hH.litN
  have hE := unlEnd3E (_root_.UpperTheory.V.Z.J.linkedUnlE_alt hH)
  exact _root_.UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host (_root_.UpperTheory.V.UnitaryThreeInertia.unitary_lift_of_reduced_core hS) Alg.M.main_holds Alg.M.mprime_holds hN.coh.lf hN.coh.lt hN.coh.le
    hN.coh.gf hN.coh.ge hN.coh.pt (X.So.hostVanE41 hSF hN.coh.lf hN.coh.lt hN.coh.le)
    (X.xpp (X.corX X.lemmaX X.residual_bernoulli_nonvanishing)) (_root_.UpperTheory.V.Z.J.hostRigidUE_alt hH (_root_.UpperTheory.V.HV.DescentVanishingReductions.adjoint_lifting_of_cohomology hH) hE) (_root_.UpperTheory.V.Z.J.hostNumberUE_alt hH hE (_root_.UpperTheory.GalN.V.Win.N.numberU3U_of_prints hH.toClassicalTheorems))
end UpperTheory.V.Z.J
end

section
open UpperTheory.Top
namespace UpperTheory.V.HV.DescentVanishingReductions


theorem vwin_of_hypotheses_H_E_alt41 (hH : _root_.UpperTheory.V.Af.HypothesesH') : VWin :=
  have hK := _root_.UpperTheory.V.ZK.lemmaK_litN_alt hH.litN
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift41 hH rhShaFinite_native41 hE.2)
end UpperTheory.V.HV.DescentVanishingReductions
end

rh_prune UpperTheory.V.X.soVec41
rh_prune UpperTheory.V.X.So.hostVanE41
rh_prune UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift41
rh_scan UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift limit 2000
rh_scan UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift41 limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt41 limit 2000
#print axioms rhShaFinite_native41
#print axioms UpperTheory.V.X.soVec41
#print axioms UpperTheory.V.X.So.hostVanE41
#print axioms UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift41
#print axioms UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt41
