#!/usr/bin/env python3
"""Replay the static source checks for grok_swarm/galois_rows at the pinned upstream revision.
Usage: python3 replay_source_checks.py /path/to/riemann-hypothesis-clone   (blob:none clone is enough)
Checks: (1) each file's blob id at the pin; (2) each quoted declaration text occurs verbatim in that blob.
This is a STATIC text check, not Lean elaboration."""
import subprocess, sys
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
G = "src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/"
AV = "src/Development/AbelianVarietyTheory/"
CHECKS = [
 (G+"IntegralStructures/RowSrc.lean","f769999ac5e49241993e5efbf81e4d2cded18acd",
  ["theorem galoisLocalGlobalStrong_recParameter : UpperTheory.GalStar.Row0b recT := galoisRepresentations_of_thetaLift UpperTheory.TP.K.tLiftK"]),
 (G+"IntegralStructures/Development.lean","4d4d9506494734f28fce7d39bac1a50650ecf148",
  ["def recT : UpperTheory.GalStar.RecNotion := fun h rc => UpperTheory.Zero.LLC.IsRecT h rc",
   "UpperTheory.Gal.Int.Row.galoisLocalGlobal_of_localGlobalCompatibility h (UpperTheory.Gal.ToralGalois.galoisCompat_unlinkedSupport_of_spherical h) (UpperTheory.Gal.ToralGalois.R2.localGlobalCompatAtIwahoriFixed_of_unlinked (UpperTheory.Gal.ToralGalois.galoisCompat_unlinkedSupport_of_spherical h))",
   "UpperTheory.GalStar.Row0.row0b recT (galoisLocalGlobal_of_geometry_lift geo up)"]),
 (G+"TypeConditions/WeightsConjAlt.lean","486af16ec21e4f8c5a482e1481769093b9448bd4",
  ["tame0 : IsQp w → TmW y → Sqf y → y.mono0 → x.mono0 ∧ ∀ g : ↥(Weil h), deg g = 0 → x.charPol g = y.charPol g",
   "nice : ∀ σ, π.IsLocComp w σ → ∀ rc, Rc h rc → ((IsQp w ∧ TmW (rc (algNorm σ)) ∧ Sqf (rc (algNorm σ))) ∨ Tor (rc (algNorm σ))) → (rc (algNorm σ)).mono0 →",
   "(CG.mk π).IsRegAlg → GlobalTheory.ContraPair.PolarizedPair π χ →\n      ∃ (r : G E Ω →* GL (Fin a) (Qbar l)) (wt : ℤ) (HT : (E →+* Qbar l) → Multiset ℤ), Props Rc π ι r wt HT\n"]),
 (G+"TypeConditions/WeightsConjBis.lean","0a1eab0eb68defc45b4e62d19fbfd01dad459344",
  ["∃ (g : ℕ) (_ : Fact g.Prime) (i : ℚ_[g] ≃+* w.adicCompletion E), Continuous i ∧ (n = 1 ∨ 16 * n ^ 2 < g)",
   "tame0 : IsQpBig w y.lpDim → TmW y → Sqf y → y.mono0 → x.mono0 ∧ ∀ g : ↥(Weil h), deg g = 0 → x.charPol g = y.charPol g",
   "theorem Away.big {x y : WD h} (k : Away x y) : AwayB x y := ⟨k.dim, k.tor, fun q => k.tame0 q.isQp⟩",
   "((IsQpBig w a ∧ TmW (rc (algNorm σ)) ∧ Sqf (rc (algNorm σ))) ∨ Tor (rc (algNorm σ)))",
   "exact ⟨r, wt, HT, k.big Rc⟩"]),
 (G+"IntegralStructures/InertCharpoly/GaloisLocalGlobalOfLocalGlobalCompatibility.lean","eebd76fca5538c7a0156cf330cedd4b663b0d70a",
  ["H E Ω l ι n hn π χ hI r hW w σ hσ hf (Or.inr ⟨q, g⟩)",
   "obtain ⟨t, e⟩ := exists_eq_zpow_mul deg_frob g",
   "have hI : InScope .all l π χ := ⟨hr, hp, trivial⟩",
   "galoisLocalGlobal_of_placeClassCompatibility C H1 (localGlobalAtPlaceClass_of_localGlobal H2 _)",
   "theorem galois_realisation_of_rank_two (C : CoreAll) (H1 : R1) (H2 : LocalGlobalCompatibilityAtPlaceClass fun _ _ _ w n => IsQpBig w n) :"]),
 (G+"SphericalGaloisCompatibility/GaloisCompatUnlinkedSupportOfSpherical.lean","e01a86b5f2ec5fee9e16c3e0556d98bbea26bcbf",
  ["theorem inq_holds : Inq := ⟨UpperTheory.Gal.Int.Inp.inp_holds, UpperTheory.Gal.GamX.charLiftPrime_holds⟩"]),
 (G+"SphericalGaloisCompatibility/ToralDeRham/GaloisCompatUnlinkedSupportOfSpherical.lean","63df8ebae0b20371ab4450898f1c8d1dfbd3a789",
  ["GlobalTheory.RoadU.exists_sph_lift_of_toral hI","GlobalTheory.DRDescent.deRham_descends","GlobalTheory.JumpsDescend.jumps_descend",
   "GlobalTheory.RoadU.toralAbove_of_holds hI (hC.2 .crys) (hC.2 .phi)","GlobalTheory.RoadU.UnlinkedChars.rc_unlinked_chars"]),
 (G+"SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedOfUnlinked.lean","90390f831b31ac30e7672dc7d1a499464910ef27",
  ["r2g mixedOf toTor_holds drDesc UpperTheory.Zero.LLC.recTExists"]),
 (G+"SphericalGaloisCompatibility/PAdicSplitting/R2g.lean","bead0ea008e28652db66a8c6388279194c435c17",
  ["MixedOf → ToTor → DRDesc → UpperTheory.Zero.LLC.RecTExists → GlobalTheory.DeRhamOfPlainTorus.R1 → LocalGlobalCompatAtIwahoriFixedPlaces",
   "rcases hcase with hpt | ⟨hQ, hap⟩","GlobalTheory.AboveL.wdOf_restricts","GlobalTheory.AboveLRes.isPstAt_of_resTo"]),
 (G+"SphericalGaloisCompatibility/PAdicSplitting/LocalGlobalCompatAtIwahoriFixedPlaces.lean","f6b0fadd7bad69ef19b48cae73c42ea6441310df",
  ["(PlainTor (algNorm σ) ∨ (IsQg w ∧ Apart (algNorm σ))) →"]),
 (AV+"Statements/EllipticCurveLevels/IsQg.lean","0b885c4469948ad0276a6e5dae0340f18a905bb8",
  ["π.IsLocComp w σ → PlainTor (algNorm σ) →","def Top : Prop := R1 ∧ R2"]),
 (AV+"Definitions/GaloisGeometry/IsWeight.lean","5a5df49a1801f79e7729826ebc7e639df7857f81",
  ["Continuous r ∧ UpperTheory.V.Af.AttC ι r π","| .all => True"]),
 (AV+"Definitions/GaloisGeometry/CyclicStrongAtCusp.lean","8b43b079fcf131124b5d37f7a237c8594e84e0ba",
  ["def PlainTor (x : IrrGL k) : Prop := ∃ s, HasSupport x.rep s ∧ (∀ y ∈ s, y.1 = 1) ∧ Unlinked s",
   "def CoreAll : Prop := Ex .all ∧ ∀ c, SphericalLevelCondition .all c"]),
]
repo = sys.argv[1]
ok = bad = 0
for path, blob, needles in CHECKS:
    got = subprocess.run(["git","-C",repo,"rev-parse",f"{PIN}:{path}"],capture_output=True,text=True).stdout.strip()
    text = subprocess.run(["git","-C",repo,"cat-file","blob",got],capture_output=True,text=True).stdout
    r = got == blob
    ok += r; bad += (not r)
    print(("OK  " if r else "BAD ")+"blob "+path)
    for n in needles:
        r = n in text
        ok += r; bad += (not r)
        print(("OK  " if r else "BAD ")+"text "+n.splitlines()[0][:90])
print(f"checks ok={ok} bad={bad}")
sys.exit(1 if bad else 0)
