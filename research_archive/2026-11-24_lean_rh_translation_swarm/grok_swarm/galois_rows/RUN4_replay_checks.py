#!/usr/bin/env python3
"""galois_rows RUN 4 static replay (NOT Lean elaboration).
 Part A: blob ids at the pin + verbatim declaration text.
 Part B: repository-wide lexical scan of src/**/*.lean at the pin for axiom-introducing constructs.
Usage: python3 RUN4_replay_checks.py /path/to/riemann-hypothesis-checkout   (working tree must be at PIN)"""
import subprocess, sys, os, re
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
CHECKS = [
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsKummerField.lean",
  "9b99d747707ae6ec6411df14d57a2734a8e2a0f8",
  [
   "theorem exists_kummer_field (E F Ω : Type)",
   "theorem exists_integral_mul {E : Type}",
   "theorem core (E : Type) [Field E] [NumberField E] (Γ : Subgroup Eˣ) [Group.FG Γ]",
   "GlobalTheory.Published.chebotarevDegreeOne' K (AlgebraicClosure E) L τ MainNotions hSKfin",
   "GlobalTheory.frob_fixes_root_of_one_mod K (AlgebraicClosure E) M ζK hζK (v τ) hMv (B τ) (hB τ) (σ τ)",
   "exact hdesc (AlgebraicClosure E) ζ hζ (x : E) w hwK hw",
   "induction m using Nat.recOnPosPrimePosCoprime with",
   "theorem exists_places (E : Type) [Field E] [NumberField E] (S : Finset (HeightOneSpectrum (𝓞 E))) (m : ℕ) (hm : 0 < m) :",
   "∀ x : Eˣ, (∀ v, v ∉ S → v.valuation E (x : E) = 1) → (∀ t ∈ T, t.valuation E ((x : E) - 1) < 1) →",
   "haveI := GlobalTheory.QNorm.sUnits_fg E S"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsPowDescentCyclotomic.lean",
  "c413cc4a61f607c2db5b252019e0167483fc512e",
  [
   "theorem geom_sum_valuation {l : ℕ} (hl : l.Prime) {t : ℕ} (ht1 : 1 < t)",
   "theorem exists_aut {E K : Type}",
   "∃ τ : K ≃ₐ[E] K, τ ζ = ζ ^ (g ^ (Module.finrank ℚ E).factorial)",
   "theorem descent {E K : Type}",
   "have hgeom : ∀ m : ℕ, (k + 1) ^ m = (∑ i ∈ Finset.range m, (k + 1) ^ i) * k + 1",
   "theorem exists_pow_descent_cyclotomic :",
   "set m := (Module.finrank ℚ E).factorial with hm",
   "refine ⟨l ^ (r + s), pow_pos hl.pos _, pow_dvd_pow _ (by omega), ?_⟩",
   "Int.two_pow_sub_pow'"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsFrobFixesRootOfOneModPlace.lean",
  "ab8b7973677479f906a743b5a11f01d8bc82544b",
  [
   "theorem frob_fixes_root_of_one_mod (F Ω : Type)"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsHcharPrescribedTrivial.lean",
  "649f9a3d86d776230c34d9dd01dca743893f90c8",
  [
   "theorem exists_hchar_prescribed (k : Type)",
   "obtain ⟨T, hST, hT⟩ := GlobalTheory.ChevalleySUnits.exists_places k S m hm0",
   "let U : Subgroup (Ideles k) := GlobalTheory.LevelChars.levSub k T 1 ⊓ ⨅ w : S, (θ w).ker.comap (comp w.1)",
   "GlobalTheory.exists_unitary_char_of_open_subgroup_and_hom (Ideles k)",
   "simpa using Complex.norm_eq_one_of_pow_eq_one h2 hm0.ne'",
   "have hxz : x = Units.mk0 z hz0 ^ m",
   "GlobalTheory.Mem.FinOrder.finite_order_of_inf_eq_one k η"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ExistsUnitaryCharOfOpenSubgroupAndHom.lean",
  "6331c58b19b7e64f1bd024b7f1b56a44b9884b2d",
  [
   "(∀ y, α y ∈ U → a y = ψ (α y)) → ∃ χ : G →* ℂˣ, Continuous χ"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/AdelicLatticeProofs/SUnitsNumberFieldFg.lean",
  "6fee38118fd139cdb9fc8c8a67d88bed9ee217f7",
  [
   "theorem _root_.GlobalTheory.QNorm.sUnits_fg :"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ChevalleyUnits.lean",
  "a699116e3c0468a2fecb572914318947db7190e3",
  [
   "theorem GlobalTheory.Published.chevalleyUnits' : GlobalTheory.Published.ChevalleyUnits := by",
   "GlobalTheory.Published.chebotarevDegreeOne' K Ω L g S hS"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/ChevalleyUnits.lean",
  "d13d74f3c21e49b31ac209248fa610082cf1b5e6",
  [
   "def ChevalleyUnits : Prop :="
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ChebotarevDegreeOne.lean",
  "2c25704438d6d5534b03fa6ae224b5fcae830112",
  [
   "theorem chebotarevDegreeOne' : ChebotarevDegreeOne := by",
   "GlobalTheory.T.exists_cyclotomic_crossing_field_deciding_frobenius F Ω L g' m hm hdvd hirr",
   "theorem cheb_holds : GlobalTheory.TwSys.Cheb :=",
   "chebotarevDegreeOne_iff_cheb.1 chebotarevDegreeOne'"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/ChebotarevDegreeOneIffCheb.lean",
  "fa35e626c57a43ce33f8e3a70f5688340a4b09b6",
  [
   "def ChebotarevDegreeOne : Prop :=",
   "theorem chebotarevDegreeOne_iff_cheb : ChebotarevDegreeOne ↔ GlobalTheory.TwSys.Cheb := by"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/GlobalArtinReciprocityHolds.lean",
  "9b0f53df9572bc05e9b4060bc4262388102ac6e7",
  [
   "theorem GlobalTheory.globalArtinReciprocity_holds : GlobalTheory.Published.GlobalArtinReciprocity := CompanionTheory.FamInh.globalArtin"
  ]
 ],
 [
  "src/CompanionTheory/AutomorphicTheory/PlaceSeparation/IsOpenQuotientMapArt0.lean",
  "120a99a5839635f7be8a87bd9bc5b7d5a1bea22b",
  [
   "namespace CompanionTheory.FamInh",
   "theorem globalArtin : GlobalTheory.Published.GlobalArtinReciprocity := fun E Ω _ _ _ _ _ =>",
   "⟨(art0 E Ω)⁻¹, isGlobalArtin_inv⟩"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/LocalArtinExistsHolds.lean",
  "92aa3388f999978a820937937d3f24b73b7e5e15",
  [
   "theorem localArtinExists_holds : LocalArtinExists := by",
   "obtain ⟨art, hart⟩ := globalArtinReciprocity_holds E Ω",
   "T.exists_inverse_localArtin_weilGroup_hom E Ω A w h art hart"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/LocalArtinExists.lean",
  "f61d287856c1dc675840e9f6be1b7fe9bed522eb",
  [
   "def LocalArtinExists : Prop :="
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/FoundationProofs/MemConnectedComponentOfOneOfPos.lean",
  "d86eaa2d5b704e834bb0efe975ef46d95001df84",
  [
   "theorem exists_field {B : Type} [CommGroup B] (φ : G K Ω →* B) (ho : IsOpen (φ.ker : Set (G K Ω))) :"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/HilbertClassFieldOfGlobalArtinReciprocity.lean",
  "2b7321faef0df9a60ca4e62035ed845de839338d",
  [
   "theorem art_sign_eq (ha : IsGlobalArtin art) (j : Ω →+* ℂ) (c : G E Ω)"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/WeilDeligneRelUnique.lean",
  "cee677dc5045d4e267e764824df406a098f3ddf0",
  [
   "theorem exists_weil_eq_on {g : G E Ω} (hg : g ∈ Dec (F := E) A) (L : IntermediateField E Ω)"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/Chl.lean",
  "a2f8772a9af1f32272a540d5a39d7a62a218be73",
  [
   "structure Inq : Prop extends UpperTheory.Gal.Int.Inp.Inp where",
   "chl : ∀ (K M : Type)"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean",
  "e01a86b5f2ec5fee9e16c3e0556d98bbea26bcbf",
  [
   "theorem inq_holds : Inq := ⟨UpperTheory.Gal.Int.Inp.inp_holds, UpperTheory.Gal.GamX.charLiftPrime_holds"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/OfInputs.lean",
  "f400e69e7e620958ac2e9205be7f20107d26b829",
  [
   "structure Inp : Prop where",
   "gen : GlobalTheory.Published.GenericUnitaryDualGL",
   "ac : GlobalTheory.Published.ArthurClozelStrongTC"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/InputsOf.lean",
  "39070d3b7c9ac51c51d6dc2115ee4f027fc850cc",
  [
   "theorem js : GlobalTheory.Published.JacquetShalikaRigidity := PositivityTheory.AdelicQuotientData.jacquetShalikaRigidity",
   "theorem gk : GlobalTheory.Published.GelfandKazhdanDual := UpperTheory.Gal.AbelianGaloisNormality.gk_holds",
   "theorem adm : GlobalTheory.Published.IrreducibleAdmissibleGL := UpperTheory.Zero.LLC.Pr.adm",
   "theorem len : GlobalTheory.Published.StandardFunctorsFiniteLength := PositivityTheory.Tls2.BZGL.standardFunctorsFiniteLength_top",
   "theorem exh : GlobalTheory.Published.LanglandsExhaustionGL := UpperTheory.Zero.LLC.Pr.exh",
   "theorem zel : GlobalTheory.Published.ZelevinskyPolynomialRing := UpperTheory.Zero.LLC.Pr.zel",
   "theorem gen : GlobalTheory.Published.GenericUnitaryDualGL := PositivityTheory.Gud.Fin.genericUnitaryDualGL_holds",
   "theorem ac : GlobalTheory.Published.ArthurClozelStrongTC := UpperTheory.Gal.AbelianGaloisNormality.strongTC_holds",
   "theorem inp_holds : Inp := ⟨js, gk, adm, len, exh, zel, gen, ac, hk, alg, pst⟩"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/CrystallineInputs/Crys.lean",
  "8f176341db3f423d5ea0f163c814084f7f596a1d",
  [
   "theorem pst : GlobalTheory.Published.DeRhamPotSemistable := GlobalTheory.deRham_potentiallySemistable",
   "theorem alg : GlobalTheory.Published.AlgebraicCharacterWD :=",
   "theorem hk : GlobalTheory.Published.HeckeLAdicCharacterAbove :=",
   "theorem crys : GlobalTheory.Published.HeckeLAdicCharacterCrystalline := by"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/LiftFactorization/FirstQuadraticSquareHolds.lean",
  "6ce3439902f75c4f9d67d819e428b9a2a77d41b9",
  [
   "theorem gk_holds : GlobalTheory.Published.GelfandKazhdanDual :=",
   "theorem strongTC_holds : GlobalTheory.Published.ArthurClozelStrongTC := strongOf liftUnr ramSph"
  ]
 ],
 [
  "src/Development/WeilBound/CoreStatements/AutomorphicKernels/UnitaryDualGL/GenericUnitaryDual/GenericUnitaryDualGLHolds.lean",
  "425ed55908b8ea9633a347a6ef80c8701045321c",
  [
   "theorem genericUnitaryDualGL_holds : GlobalTheory.Published.GenericUnitaryDualGL := by"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/MixedUnlinkedExponents/CharLiftPrimeHolds.lean",
  "0c3c148999e24db0d23a4f9350e216e44387e9f6",
  [
   "theorem charLiftPrime_holds : CharLiftPrime := charLiftPrime_of charSupp_holds"
  ]
 ],
 [
  "src/Development/WeilBound/CoreStatements/PublishedTheorems/JacquetShalikaRigidity/JacquetShalikaRigidity.lean",
  "dad600e3584b008f3a384b997ca241ea0820c00b",
  [
   "theorem jacquetShalikaRigidity : GlobalTheory.Published.JacquetShalikaRigidity := rigid rsPole JacquetShalika"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/Multi.lean",
  "ea3ed51ce271cb20eaa5120dddf63aca2c444a06",
  [
   "theorem exh : GlobalTheory.Published.LanglandsExhaustionGL := PositivityTheory.Exh.langlandsExhaustionGL_holds",
   "theorem adm : GlobalTheory.Published.IrreducibleAdmissibleGL := PositivityTheory.Tls2.BZGL.irreducibleAdmissibleGL_top",
   "theorem zel : GlobalTheory.Published.ZelevinskyPolynomialRing :="
  ]
 ],
 [
  "src/Development/WeilBound/CoreStatements/TemperedRepresentationTheory/BernsteinZelevinskyGL/TopStd.lean",
  "5f165146ab8215d0178623460d3fd3098bab66b6",
  [
   "theorem standardFunctorsFiniteLength_top : GlobalTheory.Published.StandardFunctorsFiniteLength := by"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/BzfinHolds.lean",
  "3d22aaf146c00fe5e1db7a7c40e3f41505ee2fda",
  [
   "theorem bzfin_holds : GlobalTheory.Published.BernsteinZelevinskyFiniteness := by"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/GeometricLemmaFiltrationHolds.lean",
  "690f5a0b7f90454712c8ba80dff4d791f34feb33",
  [
   "theorem geometricLemmaFiltration_holds : GlobalTheory.Published.GeometricLemmaFiltration :="
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/FiniteDecompositionGroupsCoverOpenQuotient.lean",
  "840f45a05091a881f148d0169a8014e8d687934b",
  [
   "GlobalTheory.Published.cheb_holds F Ω U.toSubgroup U.isOpen U.isNormal' g {v}"
  ]
 ]
]

repo = sys.argv[1]; ok = bad = 0
def rep(r, msg):
    global ok, bad
    ok += r; bad += (not r); print(("OK  " if r else "BAD ") + msg)
head = subprocess.run(["git","-C",repo,"rev-parse","HEAD"],capture_output=True,text=True).stdout.strip()
rep(head == PIN, "worktree HEAD == PIN (" + head[:12] + ")")
for path, blob, ns in CHECKS:
    got = subprocess.run(["git","-C",repo,"rev-parse",f"{PIN}:{path}"],capture_output=True,text=True).stdout.strip()
    text = subprocess.run(["git","-C",repo,"cat-file","blob",got],capture_output=True,text=True).stdout
    rep(got == blob, "blob "+blob[:8]+" "+path)
    for n in ns: rep(n in text, "text "+n[:90])
# Part B
pats = {"axiom declaration": re.compile(r"^\s*(?:@\[[^\]]*\]\s*)?(?:private |protected |noncomputable |unsafe )*axiom\s", re.M),
        "sorry": re.compile(r"\bsorry\b"), "admit": re.compile(r"\badmit\b"),
        "native_decide": re.compile(r"native_decide"), "ofReduceBool": re.compile(r"ofReduceBool"),
        "implemented_by/extern": re.compile(r"@\[(?:implemented_by|extern)"), "unsafe": re.compile(r"\bunsafe\b"),
        "skipKernelTC": re.compile(r"skipKernelTC"), "axiomDecl/AxiomVal": re.compile(r"axiomDecl|AxiomVal")}
counts = {k: 0 for k in pats}; nfiles = 0; adddecl = []
for root, _, files in os.walk(os.path.join(repo, "src")):
    for f in files:
        if not f.endswith(".lean"): continue
        nfiles += 1; p = os.path.join(root, f); s = open(p, encoding="utf-8").read()
        for k, rx in pats.items(): counts[k] += len(rx.findall(s))
        for m in re.finditer(r"addDecl \(\.(\w+)", s): adddecl.append((os.path.relpath(p, repo), m.group(1)))
print("scanned .lean files:", nfiles)
for k, c in counts.items(): rep(c == 0, f"scan {k}: {c} occurrences")
print("addDecl sites:", adddecl)
rep(all(kind in ("defnDecl", "thmDecl") for _, kind in adddecl), "every addDecl site adds only defnDecl/thmDecl")
print(f"checks ok={ok} bad={bad}")
sys.exit(1 if bad else 0)
