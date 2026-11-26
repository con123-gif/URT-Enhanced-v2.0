#!/usr/bin/env python3
"""Finite formula audit for the prime-shell positive-moment ladder.

This checks the exact cell integration and maximal inequality on actual primes.
It is not asymptotic evidence for the open moment supplier or for RH.
"""

from __future__ import annotations

import math
from fractions import Fraction


LIMIT = 40_000
TERMINAL_LO = 30_000
MOMENTS = (1, 2, 3, 4, 6, 8)


def primes_up_to(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for q in range(2, math.isqrt(n) + 1):
        if sieve[q]:
            sieve[q * q : n + 1 : q] = b"\x00" * (((n - q * q) // q) + 1)
    return [q for q in range(2, n + 1) if sieve[q]]


def positive_affine_moment(v0: float, v1: float, width: float, r: int) -> float:
    """Integral of max(v(t), 0)^r for an affine v on an interval."""
    if width <= 0.0 or v1 <= 0.0:
        return 0.0
    if v0 >= 0.0:
        if math.isclose(v0, v1, rel_tol=0.0, abs_tol=1e-15):
            return width * v0**r
        return width * (v1 ** (r + 1) - v0 ** (r + 1)) / (
            (r + 1) * (v1 - v0)
        )
    # In this shell every open-cell slope is positive, so this is the only
    # possible sign crossing.
    crossing_fraction = -v0 / (v1 - v0)
    positive_width = width * (1.0 - crossing_fraction)
    return positive_width * v1**r / (r + 1)


def terminal_moments(p: int, primes: list[int]) -> tuple[float, dict[int, float]]:
    c = 1.0 - math.log(2.0)
    a = p / 2.0
    active = [q for q in primes if a / 2.0 < q <= a]
    d = c * a - sum((2.0 - a / q) * math.log(q) for q in active)
    slope = c + sum(math.log(q) / q for q in active)
    events: list[tuple[float, int, int]] = []
    for q in primes:
        if a < q < p:
            events.append((float(q), 0, q))  # arrival: downward jump
        if a < 2 * q < p:
            events.append((float(2 * q), 1, q))  # zero-weight exit
    events.sort()

    moments = {r: 0.0 for r in MOMENTS}
    t = a
    for x, kind, q in events + [(float(p), 2, 0)]:
        d_before = d + slope * (x - t)
        for r in MOMENTS:
            moments[r] += positive_affine_moment(d, d_before, x - t, r)
        d = d_before
        t = x
        if kind == 0:
            d -= math.log(q)
            slope += math.log(q) / q
        elif kind == 1:
            slope -= math.log(q) / q
    return max(d, 0.0), moments


def main() -> None:
    primes = primes_up_to(LIMIT)
    terminals = [p for p in primes if TERMINAL_LO <= p <= LIMIT]
    c = 1.0 - math.log(2.0)
    minimum_margin = {r: math.inf for r in MOMENTS}
    maximum_ratio = {r: 0.0 for r in MOMENTS}

    for p in terminals:
        h, integrals = terminal_moments(p, primes)
        ell = c + 2.0 * math.log(p)
        for r in MOMENTS:
            lhs = h ** (r + 1)
            rhs = (r + 1) * ell * integrals[r]
            margin = rhs - lhs
            tolerance = 1e-9 * max(1.0, rhs, lhs)
            assert margin >= -tolerance, (p, r, h, lhs, rhs)
            minimum_margin[r] = min(minimum_margin[r], margin)
            if rhs > 0.0:
                maximum_ratio[r] = max(maximum_ratio[r], lhs / rhs)

    # Exact exponent identity and the moment gap above one half.
    exponent_rows = []
    for r in MOMENTS:
        exponent = Fraction(1, 2) + Fraction(1, 2 * (r + 1))
        direct = Fraction(1, 1) + Fraction(r, 2)
        direct /= r + 1
        assert exponent == direct
        exponent_rows.append(f"r={r}:exponent={exponent}")

        # Extremal affine triangle: h=L=1 and I_r=1/(r+1).
        triangle_integral = Fraction(1, r + 1)
        assert Fraction(r + 1) * triangle_integral == 1
        assert triangle_integral < 1  # omitting r+1 fails sharply

    print(f"terminal_checks={len(terminals)}")
    print("moments=" + ",".join(map(str, MOMENTS)))
    for r in MOMENTS:
        print(f"r={r}_minimum_rhs_minus_lhs={minimum_margin[r]:.12g}")
        print(f"r={r}_maximum_lhs_over_rhs={maximum_ratio[r]:.12g}")
    print(";".join(exponent_rows))
    print("triangular_factor_r_plus_one_equality=PASS")
    print("missing_factor_negative_control=PASS")
    print("RESULT=PASS (finite formula audit only)")


if __name__ == "__main__":
    main()
