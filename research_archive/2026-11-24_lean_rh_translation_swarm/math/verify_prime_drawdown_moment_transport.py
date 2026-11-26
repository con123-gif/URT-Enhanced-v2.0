#!/usr/bin/env python3
"""Formula audit for dyadic Chebyshev-drawdown moment transport.

Actual primes are used to check the exact shell identity and the pointwise
Jensen inequality.  No finite computation is evidence for the open
asymptotic supplier or RH.
"""

from __future__ import annotations

import bisect
import math
from fractions import Fraction

import numpy as np


LIMIT = 8_000
MOMENTS = (1, 2, 3, 4, 6, 8)
GAUSS_NODES, GAUSS_WEIGHTS = np.polynomial.legendre.leggauss(20)


def primes_up_to(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for q in range(2, math.isqrt(n) + 1):
        if sieve[q]:
            sieve[q * q : n + 1 : q] = b"\x00" * (((n - q * q) // q) + 1)
    return [q for q in range(2, n + 1) if sieve[q]]


PRIMES = primes_up_to(LIMIT)
LOG_PREFIX = [0.0]
for q in PRIMES:
    LOG_PREFIX.append(LOG_PREFIX[-1] + math.log(q))


def theta(x: float) -> float:
    return LOG_PREFIX[bisect.bisect_right(PRIMES, x)]


def shell(x: float) -> float:
    lo = bisect.bisect_right(PRIMES, x / 2.0)
    hi = bisect.bisect_right(PRIMES, x)
    return sum((2.0 - x / q) * math.log(q) for q in PRIMES[lo:hi])


def breakpoints(x: float) -> list[float]:
    lo = x / 2.0
    i = bisect.bisect_right(PRIMES, lo)
    j = bisect.bisect_left(PRIMES, x)
    return [lo, *map(float, PRIMES[i:j]), x]


def integrate_error_kernel(x: float) -> float:
    """x * integral_[x/2,x] (theta(t)-t)/t^2 dt, cell-exact."""
    total = 0.0
    pts = breakpoints(x)
    for a, b in zip(pts, pts[1:]):
        mid = (a + b) / 2.0
        th = theta(mid)
        total += x * (th * (1.0 / a - 1.0 / b) - math.log(b / a))
    return total


def drawdown_moment_at_x(x: float, r: int) -> float:
    """Positive Gaussian integration on the exact prime-cell partition."""
    ex = theta(x) - x
    total = 0.0
    pts = breakpoints(x)
    for u, v in zip(pts, pts[1:]):
        th = theta((u + v) / 2.0)
        a = th - ex
        upper = min(v, a)
        if upper > u:
            midpoint = (u + upper) / 2.0
            halfwidth = (upper - u) / 2.0
            ts = midpoint + halfwidth * GAUSS_NODES
            values = x * np.maximum(a - ts, 0.0) ** r / ts**2
            total += halfwidth * float(np.dot(GAUSS_WEIGHTS, values))
    return max(total, 0.0)


def exact_discrete_jensen_audit() -> int:
    checks = 0
    values = (-3, -1, 0, 2, 5)
    weights = ((1, 1), (1, 2), (2, 3), (1, 3, 2))
    for raw_weights in weights:
        denominator = sum(raw_weights)
        ws = [Fraction(w, denominator) for w in raw_weights]
        for shift in range(len(values)):
            ds = [Fraction(values[(shift + i) % len(values)]) for i in range(len(ws))]
            for r in MOMENTS:
                mean = sum((w * d for w, d in zip(ws, ds)), Fraction(0))
                lhs = max(mean, 0) ** r
                rhs = sum(w * max(d, 0) ** r for w, d in zip(ws, ds))
                assert lhs <= rhs
                checks += 1
    return checks


def main() -> None:
    c = 1.0 - math.log(2.0)
    xs = [float(q) for q in PRIMES if 4_000 <= q <= LIMIT]
    xs += [n + 0.37 for n in range(4_000, LIMIT, 7)]
    max_identity_residual = 0.0
    max_ratio = {r: 0.0 for r in MOMENTS}
    pointwise_checks = 0

    for x in xs:
        d_direct = c * x - shell(x)
        d_transport = integrate_error_kernel(x) - (theta(x) - x)
        residual = abs(d_direct - d_transport)
        max_identity_residual = max(max_identity_residual, residual)
        assert residual <= 2e-9 * max(1.0, abs(d_direct), abs(d_transport))
        for r in MOMENTS:
            lhs = max(d_direct, 0.0) ** r
            rhs = drawdown_moment_at_x(x, r)
            assert lhs <= rhs + 2e-8 * max(1.0, lhs, rhs), (x, r, lhs, rhs)
            if rhs > 0.0:
                max_ratio[r] = max(max_ratio[r], lhs / rhs)
            pointwise_checks += 1

    jensen_checks = exact_discrete_jensen_audit()
    for t in range(1, 101):
        coefficient = Fraction(1, t * t) * (
            Fraction((2 * t) ** 2, 2) - Fraction(t * t, 2)
        )
        assert coefficient == Fraction(3, 2)

    # Strict separation: adding a common constant leaves every drawdown
    # unchanged while increasing an absolute error moment.
    e = [Fraction(-2), Fraction(1), Fraction(4)]
    shifted = [v + 100 for v in e]
    assert [e[i] - e[-1] for i in range(3)] == [shifted[i] - shifted[-1] for i in range(3)]
    assert sum(abs(v) for v in shifted) > sum(abs(v) for v in e)

    print(f"x_checks={len(xs)}")
    print(f"pointwise_moment_checks={pointwise_checks}")
    print(f"exact_discrete_jensen_checks={jensen_checks}")
    print(f"max_identity_residual={max_identity_residual:.12g}")
    for r in MOMENTS:
        print(f"r={r}_max_shell_positive_power_over_drawdown_moment={max_ratio[r]:.12g}")
    print("fubini_coefficient_three_halves=PASS")
    print("common_shift_separation=PASS")
    print("RESULT=PASS (finite formula audit only)")


if __name__ == "__main__":
    main()
