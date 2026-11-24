#!/usr/bin/env python3
"""Source-match check for grok_swarm/native_family_existence/02_recAtG.
Usage: python3 verify_recatg_sources.py <upstream git checkout containing pin 40e56ba>
For each cited file: checks the git blob id at the pin and that each quoted token
occurs verbatim in that blob. Reads git objects only; builds nothing."""
import subprocess, sys
PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
A = "src/Development/AbelianVarietyTheory/"
CHECKS = [
 (A+"Proofs/IwasawaDecomposition/LayeredAutomorphicDataExistsOfTwoPasses.lean", "f806b0837feaff12732319d3363e4e69eb1145a8",
  ["theorem untw_set_eq (B : Base) (pl : Finset ℕ) (f : Fr B.toPre) :",
   "(TwDat.untw B pl).set f = {1, f.del, f.del'}",
   "theorem recAtG_of_two_passes : (∀ D : D7, Formalism.L2.Theta.VolTieG D → StandardLattice.VolumeEqMass₂ D) →",
   "∀ (KP : GroupRetwisting.BaseP) (Q Q' : V4.Slot), GroupRetwisting.BaseCond KP → GroupRetwisting.FirstG KP Q → GroupRetwisting.ExportF KP Q → GroupRetwisting.SecondG KP Q Q' →",
   "RecAtG (fun K D Y => GroupRetwisting.FromCoreAt Q' K D Y ∧ DQ.TupUsedAt D ∧ DQ.TwAllAt D Y.nch Y.xd ∧ DQ.MtStableAt D)",
   "large₂.inter", "lg_forced K", "evG_of_ev GlobalTheory.Mem.Top.LayOfCore.lay_of_core", "TwDat.untw B", "(fun _ => ∅) (fun _ _ _ => ∅)",
   "c'.real.vol", "c'.mtStable", "untw_set_eq"]),
 (A+"Proofs/IwasawaDecomposition/ExistsLayeredDataOfGoodScaleContexts.lean", "602831e3781a09ebc44c278956ab2ed88ced7d69",
  ["theorem recExP_of_recAtG : StandardLattice.SiegelMassRatioCM → ∀ (Q' : V4.Slot) (QO : Par → ∀ D : D7, Obj D → Prop),",
   "(EvP fun κ K => ∀ β : BPt K, β.Is Q' → QO κ β.D β.O) → RecExP (fun κ => DQ.withQD (fun D O => κ.Pos → QO κ D O))",
   "min ε0 ε1", "window_lower", "exists_du_nat", "DsP_pos_and_lower", "qd_setDiv"]),
 (A+"Definitions/AutomorphicMembership/NotBaseCondFalse.lean", "1ede65afb6ce7496de4d6f499273361d6c14a197",
  ["BaseCond", "FirstG", "ExportF", "SecondG", "FromCoreAt", "lg_forced"]),
 (A+"Definitions/AutomorphicMembership/CmQuadraticFormEqAlternatingForm.lean", "3523944c86f7a80bce53a6ac1f0b01eb6e9ad5b4",
  ["large₂", "large₂.inter", "large₂.imp", "evG_of_ev", "EvG.imp", "EvG.inter", "RecAtG"]),
 (A+"Proofs/IwasawaDecomposition/ExistsLayerParametersAdmissible.lean", "2e4f99eb5b4a8465ede9e9ee6a3da91396c2cded",
  ["lay_of_core", "tame_of_pow"]),
 (A+"Proofs/GlobalInterpolation/WindowLower.lean", "e5f2ea4ece6d70dc5f81840771ae4e83acec9595", ["window_lower"]),
 (A+"Definitions/AutomorphicMembership/RecExGOfRecAtG.lean", "423f8c1029818c32e8d23fecd7af821cda7593a0", ["exists_du_nat"]),
 (A+"Proofs/IwasawaDecomposition/DsPPosAndLower.lean", "d03219ef22ef837ec342470efdeb3aba73163971", ["DsP_pos_and_lower"]),
 (A+"Proofs/GlobalInterpolation/TwGoodOneSetDiv.lean", "2fa93dab2902f5aa62fcfc5edc0266aa8c400a67",
  ["theorem qd_setDiv : ∀ (D : D7) (O : Obj D)"]),
 (A+"Definitions/GlobalTwisting/SetUnipotentTranslate.lean", "c68508dee7da78bbe8ba8aec3d57342997468574", ["ChGood"]),
 (A+"Definitions/AutomorphicMembership/ThetaChr.lean", "1ee88f700e811dc8629270caaf6a098965498f22",
  ["def MemberE (𝒮 : Slots) : Prop :=",
   "BaseCond KPx ∧ FirstG KPx (IsBuiltE 𝒮) ∧ ExportF KPx (IsBuiltE 𝒮) ∧ SecondG KPx (IsBuiltE 𝒮) (IsGoodE 𝒮)"]),
 (A+"Definitions/AutomorphicMembership/PositionOfIntro.lean", "2f5ae548723476b8834b75d04bc26c8d9231159d", ["KPx"]),
 ("src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HypothesesNonemptyOfUnramifiedExponents.lean",
  "c0ce994aa86f737b707b5617fb10bcfb35c0117e", ["large_unramified_exponent_bundles_exist_alt", "(fun _ => hMem)", "nonempty_hyps_of_allRows_alt"]),
 ("src/Development/AutomorphicArithmetic/CharacterBoxes/SmallestPrimePolynomialBound.lean", "1371d778fdf0b74c36c85371da718894f74263a6",
  ["theorem UpperTheory.Top.hostQ :",
   "SmallPrimeOne → ∀ (la : ℝ) (G : FReq), HostExW la G.req → DC.HostExQW la G.req",
   "(3 + 2 * C8) * A", "smallest_prime_polynomial_bound"]),
 (A+"Definitions/GlobalTwisting/LogCondLeThree.lean", "8e3d3a30a2d801bf03b6f79dbee8415beb2484e3",
  ["def SmallPrimeOne : Prop := ∃ A : ℝ, 1 ≤ A ∧ ∀ M : ℕ, 2 ≤ M → ∃ p : ℕ, p.Prime ∧ p % M = 1 ∧ (p : ℝ) ≤ (M : ℝ) ^ A"]),
 (A+"Definitions/GlobalTwisting/ThinScalesIffHostBound.lean", "1de433cc5ce2fa941ca72691bc75a3bccb667634", ["def HostExW (la : ℝ) (P : HostReq) : Prop :="]),
 (A+"Definitions/GlobalTwisting/AuxiliaryPrimeMemAvoidedPrimes.lean", "9ca81e4194b4501231f8624b0c1a393af0dbc8fa",
  ["def HostExQW (la : ℝ) (P : HostReq) : Prop := HostExW la fun C5 s R H q0 => q0 = q0H H ∧ P C5 s R H q0"]),
 ("src/Formalism/PeriodIntegrals/OrbitalBoundsConclusion/MinkowskiQ.lean", "83074a2a8ccbd538ee17daf0ccde2cb3676ed7ca",
  ["theorem minkowski_bound_rat : PI.MinkowskiBoundQ := PI.MkQ.minkowskiBoundQ"]),
 ("src/Formalism/PeriodIntegrals/MinkowskiQ.lean", "c92c3a788f8c74bf74b1999f476ca576184eecfb",
  ["def MinkowskiBoundQ : Prop :=", "Nat.card G ∣ minkowskiM N"]),
 ("src/Formalism/PeriodIntegrals/Minkowski.lean", "101aac27a89ce18bf842932a135072f21218532d",
  ["def minkowskiExp (N p : ℕ) : ℕ := ∑ i ∈ Finset.range (N + 1), N / (p ^ i * (p - 1))",
   "def minkowskiM (N : ℕ) : ℕ := ∏ p ∈ (Finset.range (N + 2)).filter Nat.Prime, p ^ minkowskiExp N p"]),
 ("src/Formalism/FlagUnipotentLattices/MemOfOrthogonalAnisotropic.lean", "bfe4673a2fc741b79d560890f57b36145a2e73bb",
  ["namespace Formalism.HermitianLatticeCounting.S6",
   "def minkowskiExp (N p : ℕ) : ℕ := ∑ i ∈ Finset.range (N + 1), N / (p ^ i * (p - 1))",
   "def minkowskiM (N : ℕ) : ℕ := ∏ p ∈ (Finset.range (N + 2)).filter Nat.Prime, p ^ minkowskiExp N p"]),
 ("src/Formalism/LocalRingCardinality/DataMink.lean", "7960934a9be5851b0eafc9f3b3008b10b92d1485",
  ["abbrev minkM (n : ℕ) : ℕ := Formalism.HermitianLatticeCounting.S6.minkowskiM n"]),
 ("src/Formalism/SharpRestriction/GlobalSchurBounds/MainIn.lean", "52d1c096fc2cf82732bf2a030a2c5e063841106a",
  ["def MinkMult (n M : ℕ) : Prop :=", "∀ H : Subgroup (Matrix.GeneralLinearGroup (Fin n) ℚ), Finite H → Nat.card H ∣ M"]),
 ("src/Formalism/SharpRestriction/DesignExistsOfChoices.lean", None, ["def MinkDiv : Prop := ∀ n : ℕ, MinkMult n (minkM n)"]),
 ("src/Formalism/PeriodIntegrals/UnitaryGroupMassFormula/MinkowskiTorsionFree/Lattice.lean", None,
  ["theorem minkowskiBoundQ : PI.MinkowskiBoundQ := by", "card_dvd_minkowskiNumber"]),
]
def git(repo, *a):
    return subprocess.run(["git", "-C", repo, *a], capture_output=True, text=True, timeout=120)
def main():
    repo = sys.argv[1]
    fails = 0; ntok = 0
    for path, blob, toks in CHECKS:
        r = git(repo, "rev-parse", f"{PIN}:{path}")
        got = r.stdout.strip()
        if blob is not None and got != blob:
            print(f"FAIL blob {path}: expected {blob} got {got or r.stderr.strip()}"); fails += 1; continue
        txt = git(repo, "cat-file", "-p", got).stdout
        for t in toks:
            ntok += 1
            if t not in txt:
                print(f"FAIL token missing in {path}: {t!r}"); fails += 1
        print(f"ok   {got[:12]} {path} ({len(toks)} tokens)")
    print(f"files={len(CHECKS)} tokens={ntok} failures={fails}")
    sys.exit(1 if fails else 0)
main()
