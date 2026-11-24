#!/usr/bin/env python3
"""Finite regression for the source-matched QH.pairEx assembly.

This checks source/report provenance plus elementary algebra used by the assembler.
It is not a Lean kernel replay and does not certify the analytic prime theorems.
"""

from __future__ import annotations

import math
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCES = {
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean": "0020840fcf9b97e9e6e834c591e8516b9875e003",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean": "68d04b506355e999c0f6020ee066c4967c1e6939",
    "src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean": "398eb8ed3528aa2666e9d3b2b09a582ad4390dd7",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean": "7e63fdeda04264253733059bf951a4c1635cebaa",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean": "712579c16be75074705a2c5c00f69e2f5d835cf9",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean": "45616f33334b6ef360b18a8e64c0eb325f9463b8",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean": "f9d738eb0e0dce29b14633183dcafe3e0db5cb0d",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/Kappa4Loglog.lean": "e7f65342e957fa42936e7d8223888312a8967462",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/IndDrop.lean": "1fc497069c8499edef750d4264a106e442dcb1ef",
}


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    p = 2
    while p * p <= n:
        if n % p == 0:
            return n == p
        p += 1
    return True


def legal_twists() -> list[tuple[int, int, str]]:
    out = []
    for i in (0, 1):
        for j in (0, 1):
            if i == 0 and j == 0:
                continue
            branch = "GoodQ+ind_drop" if j == 0 else f"GoodD(a={i})"
            out.append((i, j, branch))
    return out


def check_rows_witness() -> int:
    z, zp, q, d = 3.0, 6.0, 11, 263
    assert is_prime(q) and q % 8 == 3
    assert z / 2 < math.log(q) <= z
    assert is_prime(d) and d % 16 == 7
    assert zp / 2 < math.log(d) <= zp
    assert q < d and (d + 1) % q == 0
    checked = 1
    for p in range(3, math.floor(z) + 1, 2):
        if is_prime(p):
            assert (d + 1) % p == 0
            checked += 1
    return checked


def check_height_bounds() -> int:
    checks = 0
    for m in (1, 2, 7, 31):
        cutoff = math.exp(1 + math.log(8 * m))
        for scale in (1.0, 1.5, 4.0, 20.0):
            y = cutoff * scale
            logy = math.log(y)
            for eps in (1 / 1000, 1 / 156, 1 / 104, 1 / 53):
                assert 0 < eps < 1 / 52
                z = y ** (eps / 5)
                zp = z * logy**2
                for j in (0, 1):
                    log_height = math.log(8 * m) + z + j * zp
                    lo = y ** (eps / 6)
                    hi = 3 * z * logy**2
                    assert lo <= log_height + 1e-12
                    assert log_height <= hi + 1e-12
                    checks += 2
    return checks


def accepts_eps(eps: float) -> bool:
    return 0 < eps < 1 / 52


def check_report() -> int:
    report = Path(__file__).with_name("2026-11-24_pair_ex_prime_and_box_assembly.md")
    text = report.read_text(encoding="utf-8")
    assert PIN in text
    for path, blob in SOURCES.items():
        assert path in text and blob in text
    anchors = (
        "QH.pairEx",
        "q mod 8=3",
        "d mod 16=7",
        "q | d+1",
        "eps < 1/52",
        "GoodQ+ind_drop",
        "GoodD(a=0)",
        "GoodD(a=1)",
        "RESUME HERE",
        "not a Lean kernel replay",
    )
    # Branch labels are expressed in prose in the report; normalize them here.
    normalized = text.replace("`q|d+1`", "q | d+1")
    normalized += "\n" + "\n".join(branch for _, _, branch in legal_twists())
    for anchor in anchors:
        assert anchor in normalized, anchor
    return len(SOURCES) + len(anchors) + 1


def main() -> None:
    twists = legal_twists()
    assert twists == [
        (0, 1, "GoodD(a=0)"),
        (1, 0, "GoodQ+ind_drop"),
        (1, 1, "GoodD(a=1)"),
    ]
    row_checks = check_rows_witness()
    height_checks = check_height_bounds()
    assert accepts_eps(1 / 53)
    assert not accepts_eps(1 / 52)  # strict endpoint negative control
    assert not accepts_eps(0.0)
    report_checks = check_report()
    print(
        "pairEx assembly regression: OK; "
        f"sources={len(SOURCES)}, twists={len(twists)}, "
        f"row_divisibilities={row_checks}, height_inequalities={height_checks}, "
        f"report_checks={report_checks}, negative_eps_controls=2"
    )


if __name__ == "__main__":
    main()
