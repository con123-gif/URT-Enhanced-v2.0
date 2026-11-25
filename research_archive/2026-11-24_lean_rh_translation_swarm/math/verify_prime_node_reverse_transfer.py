#!/usr/bin/env python3
"""Regression for the prime-node reverse-transfer theorem.

Finite actual-prime checks only.  The accompanying report contains the exact
analytic proof; this program checks formulas, endpoint conventions and negative
controls without claiming an asymptotic result.
"""

from bisect import bisect_right
import math


LIMIT = 200_000
C = 1.0 - math.log(2.0)
M = 1.0 + 3.0 * math.log(2.0)


def sieve(n: int) -> list[int]:
    s = bytearray(b"\x01") * (n + 1)
    s[0:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if s[p]:
            s[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i in range(2, n + 1) if s[i]]


PRIMES = sieve(LIMIT)
LOGS = [math.log(p) for p in PRIMES]
PLOG = [0.0]
PHARM = [0.0]
for p, lp in zip(PRIMES, LOGS):
    PLOG.append(PLOG[-1] + lp)
    PHARM.append(PHARM[-1] + lp / p)


def band_indices(x: float) -> tuple[int, int]:
    return bisect_right(PRIMES, x / 2.0), bisect_right(PRIMES, x)


def deficit(x: float) -> float:
    i, j = band_indices(x)
    return C * x - 2.0 * (PLOG[j] - PLOG[i]) + x * (PHARM[j] - PHARM[i])


def slope(x: float) -> float:
    i, j = band_indices(x)
    return C + PHARM[j] - PHARM[i]


def direct_deficit(x: float) -> float:
    terms = []
    for p, lp in zip(PRIMES, LOGS):
        if p > x:
            break
        if p > x / 2.0:
            terms.append((2.0 - x / p) * lp)
    return C * x - math.fsum(terms)


def positive_integral(a: float, b: float, theta: float) -> tuple[float, int, float]:
    """Integrate D_+(x) x^(-theta-1) exactly on each affine piece."""
    events = {float(a), float(b)}
    for p in PRIMES:
        if p >= b:
            break
        if p > a:
            events.add(float(p))
        q = 2 * p
        if a < q < b:
            events.add(float(q))
    e = sorted(events)
    total = 0.0
    max_slope = 0.0
    pieces = 0
    for lo, hi in zip(e, e[1:]):
        mid = (lo + hi) / 2.0
        m = slope(mid)
        q = deficit(mid) - m * mid
        max_slope = max(max_slope, m)
        # D is increasing on this open affine interval.
        if m * hi + q <= 0.0:
            pieces += 1
            continue
        start = max(lo, -q / m)
        if start < hi:
            first = m * (hi ** (1.0 - theta) - start ** (1.0 - theta)) / (
                1.0 - theta
            )
            second = q * (start ** (-theta) - hi ** (-theta)) / theta
            value = first + second
            if value < -2e-10:
                raise AssertionError((a, b, theta, lo, hi, value))
            total += max(value, 0.0)
        pieces += 1
    return total, pieces, max_slope


def budget(a: float, b: float, theta: float) -> float:
    i = bisect_right(PRIMES, a)
    j = bisect_right(PRIMES, b)
    return math.fsum(
        max(deficit(float(p)), 0.0) * lp * p ** (-theta - 1.0)
        for p, lp in zip(PRIMES[i:j], LOGS[i:j])
    )


def energy(x: float, theta: float) -> float:
    return max(deficit(x), 0.0) ** 2 * x ** (-theta - 1.0)


def main() -> None:
    # Prefix formula versus independent direct prime sum.
    direct_points = [2.0, 2.9, 3.0, 101.5, 999.0, 10_003.25, 199_999.5]
    direct_residual = max(abs(deficit(x) - direct_deficit(x)) for x in direct_points)
    assert direct_residual < 2e-9, direct_residual

    # Every active-band slope obeys the sharper elementary envelope.
    max_observed_slope = 0.0
    slope_checks = 0
    event_points = sorted(
        {2.0, float(LIMIT)}
        | {float(p) for p in PRIMES}
        | {float(2 * p) for p in PRIMES if 2 * p <= LIMIT}
    )
    for lo, hi in zip(event_points, event_points[1:]):
        if hi > lo:
            m = slope((lo + hi) / 2.0)
            assert C - 2e-12 <= m <= M + 2e-12, (lo, hi, m)
            max_observed_slope = max(max_observed_slope, m)
            slope_checks += 1

    # Prime-jump inequality Delta >= 2 d(p) log(p) p^(-theta-1).
    jump_checks = 0
    min_jump_slack = math.inf
    for theta in (0.55, 0.70, 0.90):
        for p, lp in zip(PRIMES, LOGS):
            post = deficit(float(p))
            delta = (max(post + lp, 0.0) ** 2 - max(post, 0.0) ** 2) * p ** (
                -theta - 1.0
            )
            rhs = 2.0 * max(post, 0.0) * lp * p ** (-theta - 1.0)
            slack = delta - rhs
            assert slack >= -2e-13, (theta, p, slack)
            min_jump_slack = min(min_jump_slack, slack)
            jump_checks += 1

    windows = [
        (2.0, 100.0),
        (10.25, 1_000.0),
        (100.5, 10_000.0),
        (1_000.25, 50_000.0),
        (10_000.75, 199_999.0),
    ]
    transfer_checks = 0
    affine_pieces = 0
    min_transfer_slack = math.inf
    for theta in (0.55, 0.70, 0.90):
        for a, b in windows:
            integral, pieces, local_max = positive_integral(a, b, theta)
            s = budget(a, b, theta)
            slack = M * integral + 0.5 * energy(a, theta) - s
            assert local_max <= M + 2e-12
            assert slack >= -2e-10, (theta, a, b, integral, s, slack)
            min_transfer_slack = min(min_transfer_slack, slack)
            affine_pieces += pieces
            transfer_checks += 1

    # Boundary-energy negative control: approach a positive post-jump deficit
    # from the left.  The budget stays positive while the integral vanishes.
    chosen = None
    for p in PRIMES[10:]:
        if deficit(float(p)) > 1e-4:
            chosen = p
            break
    assert chosen is not None
    p = float(chosen)
    theta = 0.7
    eta = min(1e-7, 0.01 / p)
    integral, _, _ = positive_integral(p - eta, p, theta)
    s = budget(p - eta, p, theta)
    without_boundary = M * integral - s
    with_boundary = M * integral + 0.5 * energy(p - eta, theta) - s
    assert without_boundary < 0.0, (chosen, without_boundary)
    assert with_boundary >= -2e-10, (chosen, with_boundary)

    print(
        "prime-node reverse transfer: OK; "
        f"primes={len(PRIMES)}, direct_checks={len(direct_points)}, "
        f"direct_residual={direct_residual:.3e}, slope_checks={slope_checks}, "
        f"max_slope={max_observed_slope:.12f}, jump_checks={jump_checks}, "
        f"min_jump_slack={min_jump_slack:.3e}, transfer_checks={transfer_checks}, "
        f"affine_pieces={affine_pieces}, min_transfer_slack={min_transfer_slack:.3e}, "
        f"boundary_negative_prime={chosen}, omitted_boundary_slack={without_boundary:.3e}"
    )


if __name__ == "__main__":
    main()
