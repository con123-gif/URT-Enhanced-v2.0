#!/usr/bin/env python3
"""Exact finite regression for the source-matched QH.pair_share assembly.

This validates complement cardinalities, interval/constant monotonicity and the
nested G1/G2(q) construction. It is not a Lean replay or analytic proof.
"""

from __future__ import annotations

import itertools
import math
from fractions import Fraction
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCES = {
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean":
        "712579c16be75074705a2c5c00f69e2f5d835cf9",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/Stage1Succ.lean":
        "79f79fe71e41f403a4d22e5b86540410748ac7c3",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/CharOf.lean":
        "3eeed8077330efa249cde313d99d89a7c09d8ba6",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean":
        "45616f33334b6ef360b18a8e64c0eb325f9463b8",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean":
        "7e63fdeda04264253733059bf951a4c1635cebaa",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean":
        "f9d738eb0e0dce29b14633183dcafe3e0db5cb0d",
}


def subsets(items: tuple[int, ...]):
    for mask in range(1 << len(items)):
        yield {items[i] for i in range(len(items)) if mask & (1 << i)}


def check_share_of_bad() -> int:
    checks = 0
    for n in range(8):
        pset = tuple(range(n))
        for good_mask in range(1 << n):
            good = {x for x in pset if good_mask & (1 << x)}
            bad = set(pset) - good
            candidates = {Fraction(0), Fraction(1, 3), Fraction(1, 2), Fraction(1), Fraction(2)}
            if n:
                candidates.add(Fraction(len(bad), n))
                candidates.add(Fraction(len(bad) + 1, n))
            for eta in candidates:
                assumption = True
                for bset in subsets(pset):
                    if bset <= bad:
                        assumption &= Fraction(len(bset)) <= eta * n
                        checks += 1
                if assumption:
                    assert Fraction(1 - eta) * n <= len(good)
                    assert good <= set(pset)
                    assert all(x not in bad for x in good)
                    checks += 3
    return checks


def check_boxall_mono_model() -> tuple[int, int]:
    checks = 0
    for y0 in (1.0, 2.0, math.e, 10.0):
        for c, cp in ((-2.0, -1.0), (0.0, 0.0), (1.0, 3.0), (2.5, 2.5)):
            assert c <= cp and math.log(y0) >= 0
            old_bound = c * math.log(y0)
            new_bound = cp * math.log(y0)
            assert old_bound <= new_bound + 1e-14
            for x, xp in ((y0, y0), (y0 + 3, y0 + 1), (y0 + 10, y0 + 5)):
                assert xp <= x
                for j in range(21):
                    y = y0 + (xp - y0) * j / 20
                    assert y0 <= y <= x
                    checks += 1
    # Negative control 1: log Y changes the direction when Y<1.
    y0, c, cp = 0.5, 1.0, 2.0
    old_bound, new_bound = c * math.log(y0), cp * math.log(y0)
    assert old_bound > new_bound
    # Negative control 2: enlarging the upper interval creates an uncovered point.
    y0, x, xp, y = 1.0, 2.0, 3.0, 2.5
    assert y0 <= y <= xp and not (y0 <= y <= x)
    return checks, 2


def check_nested_sets() -> tuple[int, int]:
    density_checks = nonempty_checks = 0
    eta = Fraction(1, 2)
    for n1 in range(1, 13):
        p1 = set(range(n1))
        # At most floor(eta*n1) bad first primes.
        bad1 = set(range(n1 // 2))
        g1 = p1 - bad1
        assert Fraction(len(bad1)) <= eta * n1
        assert Fraction(1 - eta) * n1 <= len(g1)
        assert g1
        density_checks += 2
        nonempty_checks += 1
        for q in g1:
            n2 = q + 3
            p2 = set(range(100 * q, 100 * q + n2))
            bad2 = set(sorted(p2)[: n2 // 2])
            g2 = p2 - bad2
            assert Fraction(len(bad2)) <= eta * n2
            assert Fraction(1 - eta) * n2 <= len(g2)
            assert g2 <= p2 and g2
            density_checks += 3
            nonempty_checks += 1
    # eta>=1 is allowed: the density lower bound can be nonpositive.
    assert Fraction(1 - 2) * 5 <= 0
    density_checks += 1
    return density_checks, nonempty_checks


def check_max_constant_and_interval() -> int:
    checks = 0
    for c1, c2 in itertools.product((Fraction(1, 3), Fraction(1), Fraction(7, 2)), repeat=2):
        c = max(c1, c2)
        assert c1 <= c and c2 <= c and c > 0
        for y in (1.0, 2.0, 5.0):
            logy = math.log(y)
            assert float(c1) * logy <= float(c) * logy + 1e-14
            assert float(c2) * logy <= float(c) * logy + 1e-14
            checks += 5
    return checks


def check_report() -> int:
    report = Path(__file__).with_name("2026-11-24_pair_share_nested_density.md")
    text = report.read_text(encoding="utf-8")
    assert PIN in text
    for path, blob in SOURCES.items():
        assert path in text and blob in text
    anchors = (
        "QH.pair_share",
        "boxAll_mono",
        "share_of_bad",
        "G2(q)",
        "C = max(C1,C2)",
        "Y0 = max(max(Y1,Y2),1)",
        "X<=Y^K",
        "eta=1/2",
        "card G + card D = card P",
        "not a Lean kernel replay",
        "Failed attempts / limitations",
        "RESUME HERE",
    )
    for anchor in anchors:
        assert anchor in text, anchor
    return 1 + len(SOURCES) + len(anchors)


def main() -> None:
    complement_checks = check_share_of_bad()
    mono_checks, mono_negative = check_boxall_mono_model()
    nested_checks, nonempty_checks = check_nested_sets()
    max_checks = check_max_constant_and_interval()
    report_checks = check_report()
    print(
        "pair_share nested-density regression: OK; "
        f"sources={len(SOURCES)}, complement_checks={complement_checks}, "
        f"boxall_mono_checks={mono_checks}, nested_checks={nested_checks}, "
        f"nonempty_checks={nonempty_checks}, max_interval_checks={max_checks}, "
        f"report_checks={report_checks}, negative_controls={mono_negative}"
    )


if __name__ == "__main__":
    main()
