#!/usr/bin/env python3
"""galois_rows RUN 3 static replay: blob ids at the pin + verbatim declaration text. Not Lean elaboration.
Usage: python3 RUN3_replay_checks.py /path/to/riemann-hypothesis-clone"""
import subprocess, sys
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
S = "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/"
T = "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/"
CHECKS = [
 [S+"ExistsSolvableCmExtensionAbelianCompletion.lean", "788132cf58a64b0dde8a86b28242cd99191e0a8c", [
   "theorem exists_cm_solvDisj_dec_eq : ∀ (Ω : Type) [Field Ω] (E : Type) [Field E] [NumberField E] [IsCMField E]",
   "(∀ g ∈ Dec (F := maximalRealSubfield E) A, ∀ x : E, g (algebraMap E Ω x) = algebraMap E Ω x) → ∀ V : Subgroup (Dec (F := E) A), IsOpen (V : Set (Dec (F := E) A)) → commutator (Dec (F := E) A) ≤ V → ∀ N : Subgroup (G E Ω), IsOpen (N : Set (G E Ω))",
   "SolvDisj M N ∧ ∀ g : Dec (F := E) A, (∀ x : M, (g : G E Ω) (algebraMap M Ω x) = algebraMap M Ω x) ↔ g ∈ V",
   "theorem resHom_injective : Function.Injective (resHom (F := F) (E := E) A)",
   "theorem resHom_surjective : Function.Surjective (resHom (F := F) (E := E) A)",
   "theorem commutator_le_map (V : Subgroup (Dec (F := E) A)) (hc : commutator (Dec (F := E) A) ≤ V) :",
   "GlobalTheory.T.exists_cmField_lift_disjoint_of_real_solvable Ω E v N hNo",
   "GlobalTheory.T.exists_abelian_totallyReal_ext_prescribedCompletion Ω (maximalRealSubfield E) A v hv",
   "isSolvable_of_comm fun a b => hab.toIsMulCommutative.is_comm.comm a b",
   "rw [hM (g : G E Ω), ← mem_map_iff (F := maximalRealSubfield E) A V g, ← hdecF, IntermediateField.mem_fixingSubgroup_iff]"]],
 [S+"ExistsSolvableCmExtensionAbelianCompletionStatement.lean", "4c6f90f5890d2e5b6602d0aef88130d870b4ccfd", [
   "theorem _root_.GlobalTheory.T.exists_solvable_cm_extension_abelianCompletion",
   "first | exact @GlobalTheory.AboveL.exists_cm_solvDisj_dec_eq"]],
 [S+"ExistsSolvableCmExtensionSplitPlace.lean", "0e627042838381dd7fe04125a82fb8b668abaf61", [
   "theorem exists_cm_solvable_split : ∀ (Ω : Type) [Field Ω] (E : Type) [Field E] [NumberField E] [IsCMField E]",
   "SolvDisj M N ∧ (∀ g ∈ Dec (F := E) A, ∀ x : M, g (algebraMap M Ω x) = algebraMap M Ω x) ∧ ∀ g ∈ Dec (F := maximalRealSubfield M) A, ∀ x : M, g (algebraMap M Ω x) = algebraMap M Ω x",
   "theorem mem_dec_congr {K K' Ω : Type}",
   "asIdeal := w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 E))",
   "let V : Subgroup (Dec (F := F) A) := K.fixingSubgroup.subgroupOf (Dec (F := F) A)",
   "rw [IsGalois.card_aut_eq_finrank, Algebra.IsQuadraticExtension.finrank_eq_two F E]; exact Nat.prime_two",
   "have hcomm : commutator (Dec (F := F) A) ≤ V := by",
   "GlobalTheory.T.exists_abelian_totallyReal_ext_prescribedCompletion Ω F A v hv V hVo hcomm T hvT",
   "obtain ⟨T, hvT, hlift⟩ := GlobalTheory.T.exists_cmField_lift_disjoint_of_real_solvable Ω E v N hN"]],
 [S+"ExistsSolvableCmExtensionSplitPlaceStatement.lean", "4d9e0009d3e6883e99a34535fb0a50a0e1e4b263", [
   "theorem _root_.GlobalTheory.T.exists_solvable_cm_extension_split_place",
   "first | exact @GlobalTheory.AboveL.exists_cm_solvable_split"]],
 [S+"ExistsCmFieldLiftDisjointOfRealSolvable.lean", "5303f7356d31225a10fba555ddecd683ef3d7784", [
   "theorem GlobalTheory.KLift.exists_cm_lift :",
   "∃ T : Finset (HeightOneSpectrum (𝓞 (maximalRealSubfield E))), v ∉ T ∧ ∀ F₁ : IntermediateField (maximalRealSubfield E) Ω, FiniteDimensional (maximalRealSubfield E) F₁ → IsGalois (maximalRealSubfield E) F₁ → IsSolvable (F₁ ≃ₐ[maximalRealSubfield E] F₁) → (∀ φ : F₁ →+* ℂ, ComplexEmbedding.IsReal φ) → (∀ u ∈ T, ∀ A' : ValuationSubring Ω, IsPlaceOver A' u → Dec (F := maximalRealSubfield E) A' ≤ F₁.fixingSubgroup)",
   "(∀ g : G E Ω, (∀ x : M, g (algebraMap M Ω x) = algebraMap M Ω x) ↔ ∀ z ∈ F₁, g z = z) ∧ ∀ z ∈ F₁, ∃ x ∈ maximalRealSubfield M, algebraMap M Ω x = z",
   "GlobalTheory.T.finite_decompositionGroups_cover_openQuotient Ω (maximalRealSubfield E) v",
   "let M : IntermediateField E Ω := IntermediateField.adjoin E (F₁ : Set Ω)",
   "(GlobalTheory.T.cm_subfields_compositum_closed Ω E).2.2 M (F₁ : Set Ω)",
   "exact solvable_of_solvable_injective hinj",
   "hT (AlgEquiv.restrictScalarsHom (maximalRealSubfield E) g)"]],
 [S+"ExistsCmFieldLiftDisjointOfRealSolvableStatement.lean", "7e93ec1f83161209a35ce996f39fcfa450a8a64e", [
   "first | exact @GlobalTheory.KLift.exists_cm_lift"]],
 [S+"ExistsAbelianTotallyRealExtPrescribedCompletion.lean", "74824e74ef4f40266085f0dacd7b7878592b51c3", [
   "theorem loc_char :",
   "theorem gal_char :",
   "theorem one_char (Ω : Type)",
   "theorem exists_abelian_real_field :",
   "∃ F₁ : IntermediateField F Ω, FiniteDimensional F F₁ ∧ IsAbelianGalois F F₁ ∧ (∀ φ : F₁ →+* ℂ, ComplexEmbedding.IsReal φ) ∧ (∀ g : Dec (F := F) A, (g : G F Ω) ∈ F₁.fixingSubgroup ↔ g ∈ V) ∧ ∀ u ∈ T, ∀ A' : ValuationSubring Ω, IsPlaceOver A' u → Dec (F := F) A' ≤ F₁.fixingSubgroup",
   "obtain ⟨art, ha⟩ := GlobalTheory.globalArtinReciprocity_holds F Ω",
   "obtain ⟨a, haL⟩ := GlobalTheory.localArtinExists_holds F Ω A v h",
   "GlobalTheory.DelEps.Twist.exists_hchar_prescribed F (insert v T)",
   "obtain ⟨τ, hτ⟩ := GlobalTheory.ConjWD.exists_weil_eq_on (h := h) g.2 L",
   "GlobalTheory.HilbertFromArtin.art_sign_eq ha j c hc",
   "rw [ha.dec u A' hA']",
   "CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity (Dec (F := F) A ⧸ V) ℂ hq",
   "obtain ⟨L, hLf, hLa, hL⟩ := GlobalTheory.RayFromArtin.exists_field φ ho"]],
 [S+"ExistsAbelianTotallyRealExtPrescribedCompletionStatement.lean", "0c35a56c26222526ae5d5ca9e8d0e80df0f8a182", [
   "first | exact @GlobalTheory.AbStep.exists_abelian_real_field"]],
 [S+"FiniteDecompositionGroupsCoverOpenQuotient.lean", "840f45a05091a881f148d0169a8014e8d687934b", [
   "∃ T : Finset (HeightOneSpectrum (𝓞 F)), v ∉ T ∧ ∀ g : G F Ω, ∃ u ∈ T, ∃ A' : ValuationSubring Ω, IsPlaceOver A' u ∧ ∃ x ∈ Dec (F := F) A', ∃ n ∈ N, g = x * n",
   "GlobalTheory.Published.cheb_holds F Ω U.toSubgroup U.isOpen U.isNormal' g {v}",
   "isCompact_univ.elim_finite_subcover"]],
 [S+"FiniteDecompositionGroupsCoverOpenQuotientStatement.lean", "0a81780d1c4999ac5cc6064fd38327dbed33ca9a", [
   "first | exact @GlobalTheory.DecCover.main"]],
 [S+"CmSubfieldsCompositumClosedStatement.lean", "c385108b7146750dc3e4474b1657f04778455700", [
   "∀ (M : IntermediateField E Ω) [NumberField M] (S : Set Ω), (∀ x ∈ S, ∀ φ : Ω →+* ℂ, (φ x).im = 0) → M = IntermediateField.adjoin E S → IsCMField M"]],
 ["src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsHcharPrescribedTrivial.lean", "649f9a3d86d776230c34d9dd01dca743893f90c8", [
   "theorem exists_hchar_prescribed (k : Type) [Field k] [NumberField k] (S : Finset (HeightOneSpectrum (𝓞 k)))",
   "∃ η : HChar k, (∃ n : ℕ, 0 < n ∧ η.OrderDvd n) ∧ (∀ u : InfinitePlace k, η.locInf u = 1) ∧ ∀ w ∈ S, η.loc w = θ w",
   "obtain ⟨T, hST, hT⟩ := GlobalTheory.ChevalleySUnits.exists_places k S m hm0",
   "GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom (Ideles k)",
   "have hxz : x = Units.mk0 z hz0 ^ m"]],
 [T+"LocalComponentsOfSmoothCharacters.lean", "5ee15c3184e5d35e00ed976305352c0174a19f5e", [
   "theorem hasSat_of_unlinked_unr : UpperTheory.Gal.ToralGalois.Inq → ∀ (E : Type) [Field E] [NumberField E] [IsCMField E] (n : ℕ), 1 ≤ n →",
   "(∀ j (x : (w.adicCompletion E)ˣ), Valued.v (x : w.adicCompletion E) = 1 → ξ j x = 1) →",
   "∀ ϖ : (w.adicCompletion E)ˣ, Valued.v (ϖ : w.adicCompletion E) = WithZero.exp (-1 : ℤ) →",
   "(CG.mk π).HasSat w (Finset.univ.val.map fun j => ξ j ϖ)",
   "obtain ⟨t, hU⟩ := exists_isUnitarisable_twist hn π w σ hσ",
   "have hg : IsGeneric σ.ρ := Generic.isGeneric_of_isLocComp E n π w σ hσ",
   "rw [hc, TwistSupp.unlinked_map_nu]",
   "equiv_prodIrr_chars hI.gen _ (isSmooth_twist σ.smooth hχ.detChar)",
   "theorem equiv_prodIrr_chars (hGU : GlobalTheory.Published.GenericUnitaryDualGL)",
   "obtain ⟨h, δ, Δ, s, hL, -, -, hd, ⟨φ⟩⟩ := hGU.exists_prod hs hi hu hg",
   "GlobalTheory.geometricLemma_of_filtration GlobalTheory.Laid.bzfin_holds GlobalTheory.geometricLemmaFiltration_holds",
   "GlobalTheory.CompanionTheory.Hypotheses₂.TD.hasSupport_unique hG GlobalTheory.Laid.bzfin_holds hs2 hsup",
   "exact hun _ h1 _ h0 rfl",
   "theorem hasSatGL_of_equiv_prodIrr",
   "GlobalTheory.GenSph.isSpherical_prodIrr_uc (fun i => ζ i ϖ) hd'",
   "GlobalTheory.LFun.SatCompare.hasSatGL_of_hasSatakeGL",
   "obtain ⟨π₀, t, hu, he⟩ := CG.exists_isUnitary_twist_absPow (CG.mk π) ha",
   "GlobalTheory.ResW.isUnitarisable_of_isLocComp_cusp E a π₀ ha ((CG.isUnitary_mk π₀).1 hu) w _ hlc",
   "exact GlobalTheory.HeightCounting.Blocks.hasSatGL_locRep hσ hS",
   "first | (exact @GlobalTheory.SphUnr.hasSat_of_unlinked_unr)"]],
 [T+"FrobeniusCharpolyEqSatakeOfPlaceAbove.lean", "a57bfc2948bb91412fa00ee7e5c81a96ab4f5619", [
   "GlobalTheory.SphUnr.hasSat_of_unlinked_unr hI M n hn P u T hT (fun j => (ξ0 j).comp (GlobalTheory.BCChar.normU w u))"]],
]
repo = sys.argv[1]; ok = bad = 0
for path, blob, needles in CHECKS:
    got = subprocess.run(["git","-C",repo,"rev-parse",f"{PIN}:{path}"],capture_output=True,text=True).stdout.strip()
    text = subprocess.run(["git","-C",repo,"cat-file","blob",got],capture_output=True,text=True).stdout
    r = got == blob; ok += r; bad += (not r); print(("OK  " if r else "BAD ")+"blob "+blob[:8]+" "+path)
    for n in needles:
        r = n in text; ok += r; bad += (not r); print(("OK  " if r else "BAD ")+"text "+n[:90])
print(f"checks ok={ok} bad={bad}")
sys.exit(1 if bad else 0)
