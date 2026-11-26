#!/usr/bin/env python3
"""Pinned-source audit for the CountQ Level -> LevelF weakening.

This checks exact source data flow.  It is not Lean elaboration and does not
prove any surviving arithmetic, automorphy, prime-window, or RH premise.
"""

from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
ROOT = Path(__file__).resolve().parents[3]
UPSTREAM = ROOT.parent / "rh_upstream"

BASE = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "AutomorphicForms/BlochKatoSelmerVanishes.lean"
)
COUNT3 = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/SemisimpleLevels/CountRankThree.lean"
)
RES = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/SemisimpleLevels/LevelFRes.lean"
)
KEEP = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/KeepLevel.lean"
)
ADM = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "LevelAdmissibleRestrictionHolds.lean"
)
CALLER = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "FrobeniusTraceCountBoundOfCmEigensystemCount.lean"
)


def between(text: str, start: str, end: str) -> str:
    i = text.index(start)
    return text[i : text.index(end, i)]


def main() -> None:
    actual = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=UPSTREAM, text=True
    ).strip()
    assert actual == PIN, (actual, PIN)

    base = BASE.read_text()
    count3 = COUNT3.read_text()
    res = RES.read_text()
    keep = KEEP.read_text()
    adm = ADM.read_text()
    caller = CALLER.read_text()

    level_at = between(base, "def LevelAt", "variable (l) in\n\nstructure Level")
    assert "FlagAt" not in level_at  # expanded FlagAt data in the stronger record
    assert "IsFlagOn" in level_at and "KillsMu" in level_at
    assert "PotCrysAt r A" in level_at
    assert "κ i ≠ κ j *" in level_at

    of_level = between(count3, "theorem LevelF.of_level", "structure AdmPS")
    assert "H.cont" in of_level and "H.away" in of_level and "H.above" in of_level
    assert "exact ⟨A, hA, κ, χ, h1, h2, h3⟩" in of_level
    assert "h3, -⟩ := H.above" in of_level
    assert "PotCrysAt" not in of_level

    direct = between(adm, "theorem UpperTheory.V.Z.Win.A4.admissible_restriction", "end\nend")
    assert direct.count("LevelF.of_level hr.level") == 1
    assert direct.count("hC.cont") == 1

    res_body = res[res.index("theorem UpperTheory.V.Lev.levelFRes") :]
    for projection in ("H.cont", "H.away", "H.above"):
        assert projection in res_body, projection

    core = between(keep, "theorem levelCore_alt", "theorem levelPA_alt")
    for projection in ("hL.cont", "hL.away", "hL.above"):
        assert projection in core, projection

    countq = between(caller, "theorem countQ_alt", "end\nsection")
    assert "hr.level.away" in countq
    assert "have hadm := hA" in countq
    assert "hQ 2 le_rfl" in caller
    assert "![(e : ℤ), -(e : ℤ)]" in caller

    print(f"PIN: {PIN}")
    print("PASS: Level.of_level drops the final LevelAt disjunction")
    print("PASS: rank-two direct restriction can accept LevelF")
    print("NEGATIVE CONTROL: cont, away, and above all survive downstream")
    print("LIMIT: source audit only; prepared Lean is not compiled")


if __name__ == "__main__":
    main()

