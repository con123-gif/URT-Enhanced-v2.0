#!/usr/bin/env python3
"""Source-pinned audit of the actual CountQ admissibility call.

This verifies source/data-flow anchors.  It is not a Lean kernel check and does
not prove AdmResNAlt, CountQAlt, a prime-window estimate, or RH.
"""

from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
ROOT = Path(__file__).resolve().parents[3]
UPSTREAM = ROOT.parent / "rh_upstream"

COUNTQ = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "FrobeniusTraceCountBoundOfCmEigensystemCount.lean"
)
ADM = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "LevelAdmissibleRestrictionHolds.lean"
)
AUT = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean"
)
LEVEL_RES = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/SemisimpleLevels/LevelFRes.lean"
)
SAFE_RES = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean"
)


def between(text: str, start: str, end: str) -> str:
    i = text.index(start)
    j = text.index(end, i)
    return text[i:j]


def main() -> None:
    actual_pin = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=UPSTREAM, text=True
    ).strip()
    assert actual_pin == PIN, f"upstream checkout is {actual_pin}, expected {PIN}"
    for path in (COUNTQ, ADM, AUT, LEVEL_RES, SAFE_RES):
        assert path.is_file(), f"missing pinned source checkout: {path}"

    countq = COUNTQ.read_text()
    adm = ADM.read_text()
    aut = AUT.read_text()
    level_res = LEVEL_RES.read_text()
    safe_res = SAFE_RES.read_text()

    ex = between(countq, "  case ex =>", "  case two =>")
    hirr_at = ex.index("    have hirr :=")
    hadm_at = ex.index("    have hadm :=", hirr_at)
    direct = ex[hirr_at:hadm_at + 260]

    assert "resTwo" in direct
    assert "have hadm := hA" in direct
    assert "\u03b9 r hr hirr" in direct
    assert "hA" in direct and "tw r" not in direct[direct.index("have hadm := hA"):]

    adm_res = between(aut, "def AdmResNAlt : Prop :=", "end UpperTheory.GalN.V")
    for forbidden in ("discr", "KillsMu", "quadratic", "\u03b4"):
        assert forbidden not in adm_res
    assert "AdmRNAlt \u03b9 M m wt r" in adm_res
    assert "IsIrr (r.comp (res ℚ Ω K))" in adm_res
    assert "AdmPNAlt ι M m (r.comp (res ℚ Ω K))" in adm_res

    body = between(adm, "theorem UpperTheory.V.Z.Win.A4.admissible_restriction", "end\nend")
    assert "Lev.levelFRes ℚ K Ω l n M m r hC" in body
    assert "safeRes' K" in body
    assert "discr" not in body and "KillsMu" not in body and "tw r" not in body

    level_decl = between(level_res, "theorem UpperTheory.V.Lev.levelFRes", " := by")
    safe_decl = between(safe_res, "theorem safeRes'", " :=")
    assert "discr" not in level_decl and "Unram" not in level_decl
    assert "discr" not in safe_decl and "Unram" not in safe_decl

    print(f"PIN: {PIN}")
    print("PASS: actual countQ_alt proves restricted irreducibility with resTwo")
    print("PASS: it applies hA to the original r and hr, never to tw r delta")
    print("PASS: AdmResNAlt has no discriminant, sign, or KillsMu parameter")
    print("PASS: levelFRes and safeRes' declarations require no l-unramified premise")
    print("RESULT: prune the entire quadratic-twist admissibility subtree from this caller")
    print("LIMIT: source/data-flow audit only; prepared Lean certificate is not compiled")


if __name__ == "__main__":
    main()

