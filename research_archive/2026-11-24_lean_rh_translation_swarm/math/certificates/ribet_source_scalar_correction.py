#!/usr/bin/env python3
"""Regression certificate for the audited compact Ribet scalar payment.

The companion Markdown contains the general proof. This is deliberately
not labelled a Lean/kernel certificate.
"""

from __future__ import annotations

import random


def raw(H: int, f: int, T: int, r: int) -> int:
    return 4 + 10 * f * r + T * (2 + 8 * f + 4 * H**22) + H**22 + H


def integration_factor(H: int, f: int, T: int) -> int:
    return 4 + 10 * f + T * (2 + 8 * f + 4 * H**22) + H**22 + H


def native_factor(H: int, f: int, T: int) -> int:
    return 4 + T * (2 + 10 * f + 6 * H**22) + H**22 + H


def check_parameter_box() -> int:
    checked = 0
    for H in range(2, 65):
        for f in range(H + 1):
            for T in range(1, H + 1):
                A = integration_factor(H, f, T)
                N = native_factor(H, f, T)
                assert A <= 4 + 13 * H + 8 * H**2 + 4 * H**23 + H**22
                assert A <= H**27
                assert N <= 4 + 3 * H + 10 * H**2 + H**22 + 6 * H**23
                assert N <= H**27
                for r in range(1, H + 1):
                    C = raw(H, f, T, r)
                    assert C <= r * A
                    assert C <= r * N
                    checked += 1
    return checked


def check_proof_chain_boundaries() -> int:
    checked = 0
    for H in range(2, 10_001):
        assert 4 + 13 * H + 8 * H**2 <= 16 * H**2
        assert 16 * H**2 <= H**6 <= H**22
        assert 4 * H**23 + 2 * H**22 <= 5 * H**23 <= H**27
        assert 4 + 3 * H + 10 * H**2 <= 13 * H**2 <= H**22
        assert 6 * H**23 + 2 * H**22 <= 7 * H**23 <= H**27
        assert 4 * H <= H**22
        checked += 1
    return checked


def check_full_payments() -> int:
    rng = random.Random(72_270_027)
    checked = 0
    for _ in range(50_000):
        H = rng.randint(2, 100)
        f = rng.randint(0, H)
        T = rng.randint(1, H)
        r = rng.randint(1, H)
        c = rng.randint(0, 10_000)
        a = rng.randint(0, 10_000)
        L = rng.randint(0, 10_000)
        left = raw(H, f, T, r) * c + T * a + 4 * r * f * L
        right = r * (H**27 * (c + a) + 4 * f * L)
        assert left <= right
        checked += 1
    return checked


def main() -> None:
    tuples = check_parameter_box()
    boundaries = check_proof_chain_boundaries()
    payments = check_full_payments()
    print(f"rank-weighted parameter tuples: PASS ({tuples})")
    print(f"proof-chain boundary values: PASS ({boundaries})")
    print(f"full payment samples: PASS ({payments})")
    print("prior pointwise-comparison claim: RETRACTED")
    print("kernel replay: NOT RUN")


if __name__ == "__main__":
    main()
