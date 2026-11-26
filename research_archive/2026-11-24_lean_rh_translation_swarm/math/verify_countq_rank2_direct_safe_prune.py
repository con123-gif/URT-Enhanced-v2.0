#!/usr/bin/env python3
"""Pinned-source and exact-arithmetic audit for rank-two direct restriction.

This is a source/data-flow certificate, not Lean kernel elaboration and not a
proof of the surviving automorphy, level, duality, prime-window, or RH leaves.
"""

from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
ROOT = Path(__file__).resolve().parents[3]
UPSTREAM = ROOT.parent / "rh_upstream"

ADM = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "LevelAdmissibleRestrictionHolds.lean"
)
AUT = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/AutQN.lean"
)
SAFE = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean"
)
CALLER = UPSTREAM / (
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/"
    "ModularityArgument/ThresholdArguments/DenseThresholdCases/"
    "FrobeniusTraceCountBoundOfCmEigensystemCount.lean"
)


def between(text: str, start: str, end: str) -> str:
    i = text.index(start)
    return text[i:text.index(end, i)]


def main() -> None:
    actual_pin = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=UPSTREAM, text=True
    ).strip()
    assert actual_pin == PIN, (actual_pin, PIN)
    for path in (ADM, AUT, SAFE, CALLER):
        assert path.is_file(), path

    adm = ADM.read_text()
    aut = AUT.read_text()
    safe = SAFE.read_text()
    caller = CALLER.read_text()

    body = between(adm, "theorem UpperTheory.V.Z.Win.A4.admissible_restriction", "end\nend")
    assert "hr.irr" in body and "hr.safe" in body
    assert body.count("hr.irr") == 1
    assert body.count("hr.safe") == 1
    final_line = next(line for line in body.splitlines() if "safeRes' K" in line)
    assert "hr.irr" in final_line and "hr.safe" in final_line
    body_without_final = body.replace(final_line, "")
    assert "hr.irr" not in body_without_final and "hr.safe" not in body_without_final

    adm_pn = between(aut, "structure AdmPNAlt", "theorem csdN'_alt")
    assert "safe :" in adm_pn and "SafePA l M m r" in adm_pn
    safe_pa = between(safe, "def SafePA", "example : type_of% @Keep.SafeU")
    assert "∀ i j, m i ≠ m j + 1" in safe_pa

    rank_two_call = between(caller, "theorem frobenius_trace_count_bound_of_rat_eigensystem_count_alt", "end\nsection")
    assert "hQ 2 le_rfl" in rank_two_call
    assert "![(e : ℤ), -(e : ℤ)]" in rank_two_call
    assert "0 hanti hrev e habs M hM" in rank_two_call

    checked = 0
    for e in range(1, 10001):
        m = (e, -e)
        for i in range(2):
            for j in range(2):
                assert m[i] != m[j] + 1
                checked += 1

    print(f"PIN: {PIN}")
    print("PASS: original restriction theorem uses hr.irr/hr.safe only in safeUP -> safeRes")
    print("PASS: the actual final trace caller specializes CountQAlt to rank 2, weights (e,-e)")
    print(f"PASS: exact SafePA gap checked for e=1..10000 ({checked} ordered pairs)")
    print("RESULT: replace safeUP/safeRes by the weight-only SafePA right disjunct")
    print("SURVIVORS: IsAutQA, Level, DualTw, restricted IsIrr, and global hypotheses")
    print("LIMIT: source/arithmetic PASS only; prepared Lean theorem is not compiled")


if __name__ == "__main__":
    main()

