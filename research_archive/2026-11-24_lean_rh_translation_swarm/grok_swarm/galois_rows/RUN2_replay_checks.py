#!/usr/bin/env python3
"""galois_rows RUN 2 static replay: blob ids at the pin + verbatim declaration text. Not Lean elaboration.
Usage: python3 replay_run2_checks.py /path/to/riemann-hypothesis-clone"""
import subprocess, sys
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
CHECKS = [
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyOfUnlinkedUnramifiedSupport.lean",
  "0919be0cbdca37b90ee1cd6bc083ed2ab01bca14",
  [
   "theorem exists_sph_lift_of_toral : UpperTheory.Gal.ToralGalois.Inq →",
   "ξ j * absPow (w.adicCompletion E) (-((((1 : ℝ) - n) / 2 : ℝ) : ℂ))",
   "GlobalTheory.T.weaklyAttached_toral_of_cm_lift hI Ω E l ι n hn π χ hπ r hr w A h ξ₀ hξ₀ a ha g hg",
   "GlobalTheory.T.exists_isPlaceOver_finiteExtension_of_isPlaceOver E M Ω A w h",
   "GlobalTheory.T.unramified_comp_norm_of_killed_inertia_fixing Ω E M A w u h h' n ξ₀ a ha hkill",
   "GlobalTheory.T.frobenius_charpoly_eq_satake_of_place_above hI Ω E M l n hn π χ hπ A w u h h' σ hσ ξ hξ hsupp hunl a ha P hcl hunr",
   "(satWD h' n B).charPol g' = ∏ j, (X - C ((ξ j (a g₀) : ℂˣ) : ℂ))"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/WeaklyAttachedToralOfCmLift.lean",
  "bad76ae6398b57c0ce0a3cb6c91d3085546d5ef5",
  [
   "theorem exists_cm_lift_fix_charKer : UpperTheory.Gal.ToralGalois.Inq →",
   "GlobalTheory.T.exists_open_galoisSubgroup_trace_ne_zero Ω E l n hn r hr.1",
   "GlobalTheory.T.exists_solvable_cm_extension_split_place Ω E A w h N₀ hN₀o",
   "GlobalTheory.T.exists_cuspidal_charLift_of_solvable_cmExtension hI Ω E M₀ l ι n hn π χ hπ r hr N₀ hN₀ hsd₀",
   "GlobalTheory.T.exists_open_subgroup_weilElement_characterKernel Ω M₀ v₀ A h₀ n",
   "GlobalTheory.T.exists_solvable_cm_extension_abelianCompletion Ω M₀ A v₀ h₀ hfixR₀ V hVo hVc N₁ hN₁o",
   "GlobalTheory.T.cuspRep_characterSupportLift_trans_tower E M₀ M₁ n π π₀ P hl₀ hl₁",
   "GlobalTheory.T.localArtin_comp_norm_compat E M₀ Ω A w v₀ h h₀ a a₀ ha ha₀ t t₀"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/FrobeniusCharpolyEqSatakeOfPlaceAbove.lean",
  "a57bfc2948bb91412fa00ee7e5c81a96ab4f5619",
  [
   "theorem hasSat_charPol_above : UpperTheory.Gal.ToralGalois.Inq →",
   "GlobalTheory.RoadU.TwistSupp.supp_nu_chars",
   "have hsupT := hcl.2 w u σ T hσ hT ξ0 hξ0 hsupσ",
   "GlobalTheory.RoadU.window hI E l n hn π χ hsc wt hwt w σ hσ ξ hξ hsup hun",
   "GlobalTheory.RoadU.unlinked_chars_comp_normU E M w u n ((wt : ℝ) / 2) ξ hξ hwin",
   "GlobalTheory.SphUnr.hasSat_of_unlinked_unr hI M n hn P u T hT",
   "GlobalTheory.SatChar.satWD_charPol_chars",
   "GlobalTheory.ArtinNormU.localArtin_normU E M Ω A w u h h' a a' ha ha' g₀ g' hgg"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/ToralDeRham/ExistsCuspidalCharLiftOfSolvableCmExtension.lean",
  "144a33f1ad69bc73c0ede9cd6e35dfcd4d2c1c95",
  [
   "induction d using Nat.strong_induction_on with",
   "GlobalTheory.T.exists_characterSupportBaseChangeLift_degreeOne K M h1 a ha π",
   "GlobalTheory.SolvUp.exists_normal_prime_index (M ≃ₐ[K] M)",
   "let K₁ := IntermediateField.fixedField H",
   "have hmove : ∃ g : G K Ω, (∃ x : K₁, g (algebraMap K₁ Ω x) ≠ algebraMap K₁ Ω x) ∧ (r g).val.trace ≠ 0 := by",
   "GlobalTheory.T.trace_eq_zero_off_subgroup_of_selfTwist Ω K K₁ hp₁ l ι a π r hr η hη hst g hgM",
   "obtain ⟨P₁, hP₁⟩ := hI.ac K K₁ hp₁ a ha π hnotw",
   "have hc₁ : CharLift π P₁ := hI.chl K K₁ hp₁ a ha π P₁ hP₁",
   "GlobalTheory.T.polarizedPair_baseChange_polarized_same_weight GlobalTheory.automorphicFormsFiniteGL hI.js hI.gk K K₁ l a ha π χ P₁ hP₁ hsc",
   "let N₁ : Subgroup (G K₁ Ω) := N.comap (AlgEquiv.restrictScalarsHom K)"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/PToTor.lean",
  "57031e8055e48e016671b5b6df9d2b330f571c16",
  [
   "UpperTheory.Gal.InertialTypesAlt.SuppBC → UpperTheory.Gal.NearKilling.UnrField → UpperTheory.Gal.NearKilling.AllLift → UpperTheory.Gal.NearKilling.IneNorm → InfLifts → RecChars → UpperTheory.Zero.LLC.RecTExists → ToTor",
   "obtain ⟨hq, hsp⟩ := split_of_padic w p i hi",
   "y.1 ∣ N.factorial",
   "GlobalTheory.CuspRep.UnrSat.eventually_hasSatGL_locRep",
   "obtain ⟨Xf, hXT, hXw, -⟩ := hUnr E Ω w hsp _ hf _ hSfin",
   "obtain ⟨P, χ', hPL, hPs, hPr⟩ := hLift E Ω l n hn π χ hs _ (fun u hu => not_not.1 hu) Xf hXT",
   "obtain ⟨g, hg1, -⟩ := hIne E Xf.K Ω A w w' h h' hXfix art art' hart hart'",
   "have hCh := hChars Xf.K Ω A w' h' n σ' ξ hξ hTS"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/InfLifts.lean",
  "a9ca7e5eb0d1daca656a787100eaab8632934a61",
  [
   "def RecChars : Prop :=",
   "(GlobalTheory.RoadU.Unlinked (chars ξ hξ) → PlainTor (algNorm T)) ∧"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean",
  "90390f831b31ac30e7672dc7d1a499464910ef27",
  [
   "toTor UpperTheory.Gal.InertialTypesAlt.suppBC_outright UpperTheory.Gal.UnramifiedFromSplittingCriterion.unrField_holds UpperTheory.Gal.NearKilling.allLift_holds UpperTheory.Gal.NearKilling.ineNorm"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Definitions/GaloisGeometry/CyclicStrongAtCusp.lean",
  "8b43b079fcf131124b5d37f7a237c8594e84e0ba",
  [
   "def CharLift {K M : Type}",
   "IsLift π P ∧ ∀ (v : HeightOneSpectrum (𝓞 K)) (u : HeightOneSpectrum (𝓞 M)) [u.asIdeal.LiesOver v.asIdeal]"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Definitions/GaloisGeometry/RegPolOfRepOf.lean",
  "afe7d6c03e5980a0802c27acb2beadd984b318ec",
  [
   "IsGalois K M ∧ IsSolvable (M ≃ₐ[K] M) ∧",
   "∀ g : G K Ω, ∃ (x : G M Ω) (n : G K Ω), n ∈ N ∧ g = AlgEquiv.restrictScalarsHom K x * n"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/ArthurClozelStrongTC.lean",
  "22fa0bc1623c997c7135f62bbbdbcbc9aedd1893",
  [
   "(∀ η : HChar K, IsNormChar M η → ¬ SelfTw (CG.mk π).HasSat η) → ∃ P : CuspSub M a, GalCut.IsLift π P"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/AutomorphicVarieties/PublishedTheorems/CyclicBaseChangeC.lean",
  "04b178c97d888b602b1bac3598931e4d331b5747",
  [
   "∀ᶠ v : HeightOneSpectrum (𝓞 F) in Filter.cofinite, η.UnrAt v ∧ ∃ B, sat v B ∧ B.map (· * η.val v) = B"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/TraceEqZeroOffSubgroupOfSelfTwistStatement.lean",
  "022fc6b3ccdee57474784a28140c7b93e8c030da",
  [
   "UpperTheory.V.Published.SelfTw (CG.mk π).HasSat η → ∀ g : G K Ω, (∃ x : M, g (algebraMap M Ω x) ≠ algebraMap M Ω x) → (r g).val.trace = 0"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsSolvableCmExtensionSplitPlaceStatement.lean",
  "4d9e0009d3e6883e99a34535fb0a50a0e1e4b263",
  [
   "SolvDisj M N ∧ (∀ g ∈ Dec (F := E) A, ∀ x : M, g (algebraMap M Ω x) = algebraMap M Ω x)"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsSolvableCmExtensionAbelianCompletionStatement.lean",
  "4c6f90f5890d2e5b6602d0aef88130d870b4ccfd",
  [
   "commutator (Dec (F := E) A) ≤ V →",
   "SolvDisj M N ∧ ∀ g : Dec (F := E) A, (∀ x : M, (g : G E Ω) (algebraMap M Ω x) = algebraMap M Ω x) ↔ g ∈ V"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsOpenSubgroupWeilElementCharacterKernelStatement.lean",
  "01914381f66e0ba917bbd9f9b1dad2336e8c0e77",
  [
   "∀ t : Ine (F := E) A, ∀ x ∈ V, (x : G E Ω) = t → ∀ j, ξ j (a (ineIncl h t)) = 1"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/UnramifiedCompNormOfKilledInertiaFixingStatement.lean",
  "1dc488bd5127c39fe8770e1ae04c5fb3e3b34e17",
  [
   "Valued.v (x : u.adicCompletion M) = 1 → ξ j (GlobalTheory.BCChar.normU w u x) = 1"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/LocalArtinCompNormCompat.lean",
  "c154d1c33e4bbe454a8c31fb923cb3bbf712ac64",
  [
   "a g = GlobalTheory.BCChar.normU v v' (a' g')"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsOpenGaloisSubgroupTraceNeZeroStatement.lean",
  "9764da018b14461a9e002f7609a4af92ed2588f1",
  [
   "∃ N : Subgroup (G K Ω), IsOpen (N : Set (G K Ω)) ∧ ∀ n ∈ N, (r n).val.trace ≠ 0"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/ExistsCharacterSupportBaseChangeLiftDegreeOneStatement.lean",
  "caa76e306801a96f578703ae7410ffc6ee85278a",
  [
   "Module.finrank K M = 1 → ∀ (a : ℕ), 1 ≤ a → ∀ π : CuspSub K a, ∃ P : CuspSub M a, CharLift π P"
  ]
 ],
 [
  "src/Development/AbelianVarietyTheory/Proofs/SatakeParameters/CuspRepCharacterSupportLiftTransTowerStatement.lean",
  "5ede3474a60d26f986de2118fb31435ebc3c5ae2",
  [
   "CharLift π P → CharLift P Q → CharLift π Q"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/RegularSemisimpleFibres/NumberField.lean",
  "be62eb81dd8ea5603fcb3c0b133ae6cc10023188",
  [
   "∀ f : ℕ, normV w = g ^ f → (∀ s, HasSupport τ.ρ s → ∀ y ∈ s, y.1 ∣ f) →",
   "UpperTheory.Zero.LLC.DZ x ∧ ∃ s, HasSupport x.rep s ∧ GlobalTheory.RoadU.Unlinked s ∧"
  ]
 ],
 [
  "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/CharpolyFromTrace/UnlinkedOfType.lean",
  "322b29629a2a8710ab507c62992ee76ad71d5bdd",
  [
   "∀ w' : HeightOneSpectrum (𝓞 X.K), IsPlaceOver A w' → normV w' = normV w ^ f) ∧"
  ]
 ]
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
