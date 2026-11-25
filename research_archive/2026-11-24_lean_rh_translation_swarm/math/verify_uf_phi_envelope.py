#!/usr/bin/env python3
"""Regression for the uF/phi envelope in pinned LevelOfCongruence.

The uF part is exact rational arithmetic.  The logarithmic phi inequality is
checked deterministically with 70-digit Decimal arithmetic on a finite grid.
This is not a Lean replay or a proof of the universal real inequality.
"""

from __future__ import annotations

from decimal import Decimal, localcontext
from fractions import Fraction
from itertools import product
from pathlib import Path


REPORT = Path(__file__).with_name("2026-11-25_uf_phi_envelope.md")


def check(ok: bool, message: str) -> None:
    if not ok:
        raise AssertionError(message)


def wmean(values: tuple[Fraction, ...], weights: tuple[int, ...]) -> Fraction:
    return sum((Fraction(w) * x for w, x in zip(weights, values)), Fraction()) / sum(weights)


def dec(q: Fraction) -> Decimal:
    return Decimal(q.numerator) / Decimal(q.denominator)


def phi_lhs(u: Fraction, h: Fraction) -> Decimal:
    if u == 0:
        return Decimal(0)
    du, dh = dec(u), dec(h)
    return du * (Decimal(1) + dh / du).ln()


def phi_rhs(x: Fraction, upper: Fraction, b: Fraction) -> Decimal:
    return (Decimal(1) + dec(x)).ln() * dec(upper + b)


def main() -> None:
    report = REPORT.read_text(encoding="utf-8")
    anchors = (
        "40e56bab026552e089d7afcfeff08d2defb9c005",
        "9172d2d30c5cec478b08c10a4b34e39fa16ab981",
        "e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef",
        "u_function_le_mean",
        "phi_bound",
        "RESUME HERE",
    )
    counts = {
        "report_checks": 0,
        "pairwise_bounds": 0,
        "weighted_envelopes": 0,
        "phi_grid": 0,
        "zero_branches": 0,
        "negative_controls": 0,
    }
    for anchor in anchors:
        check(anchor in report, f"missing report anchor: {anchor}")
        counts["report_checks"] += 1

    # Exact abstraction of u_function_le_mean.  q=-Ee-h has range at most V.
    # The upper and lower slope bounds are saturated; any slack only helps.
    for size in (1, 2, 3):
        for q_raw in product((-2, 0, 3), repeat=size):
            q = tuple(Fraction(x) for x in q_raw)
            variation = max(q) - min(q)
            for lo_raw in product((0, 2), repeat=size):
                lo = tuple(Fraction(x) for x in lo_raw)
                for weights in product((1, 3), repeat=size):
                    for p_plus, p_minus, c_sl in product((0, 2), repeat=3):
                        # These are muMaxN-h and muN-h after cancelling Ga+Fo.
                        upper_values = tuple(Fraction(p_plus + c_sl) + x for x in q)
                        lower_values = tuple(Fraction(-p_minus) + x - l for x, l in zip(q, lo))
                        k3 = Fraction(p_plus + p_minus + c_sl) + variation
                        for upper in upper_values:
                            for lower, loss in zip(lower_values, lo):
                                check(upper - k3 - loss <= lower, "pairwise uF bound failed")
                                counts["pairwise_bounds"] += 1
                        s = wmean(lower_values, weights)
                        uf = max(upper_values) - s
                        rhs = k3 + wmean(lo, weights)
                        check(uf <= rhs, "weighted uF envelope failed")
                        counts["weighted_envelopes"] += 1

    with localcontext() as ctx:
        ctx.prec = 70
        tolerance = Decimal("1e-60")
        for u in (Fraction(0), Fraction(1, 10), Fraction(1), Fraction(2), Fraction(10)):
            for x in (Fraction(1, 10), Fraction(1), Fraction(2), Fraction(5)):
                for b in (Fraction(1, 10), Fraction(1), Fraction(3)):
                    for h in (x * b / 4, x * b / 2, x * b):
                        for upper in (u, u + 1, 2 * u + 1):
                            check(u <= upper, "bad phi-grid premise")
                            check(h <= x * b, "bad H envelope premise")
                            check(phi_lhs(u, h) <= phi_rhs(x, upper, b) + tolerance,
                                  "phi envelope failed")
                            counts["phi_grid"] += 1
                            if u == 0:
                                counts["zero_branches"] += 1

        # Dropping u<=U can make the claimed conclusion false.
        check(phi_lhs(Fraction(100), Fraction(1)) >
              phi_rhs(Fraction(1), Fraction(0), Fraction(1)), "u<=U negative control")
        counts["negative_controls"] += 1
        # Dropping H<=X*b can also make it false.
        check(phi_lhs(Fraction(1), Fraction(100)) >
              phi_rhs(Fraction(1), Fraction(1), Fraction(1)), "H<=Xb negative control")
        counts["negative_controls"] += 1
        # A range bound on q is essential to the pairwise transport.
        check(Fraction(3) - Fraction(0) > Fraction(2), "variation negative control")
        counts["negative_controls"] += 1

    print("uF/phi envelope regression: OK; " +
          ", ".join(f"{key}={value}" for key, value in counts.items()))


if __name__ == "__main__":
    main()
