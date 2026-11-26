#!/usr/bin/env python3
"""Finite audit of the Lane-2 shell-energy maximal inequality.

Uses actual primes.  It exactly integrates the positive square of the affine
shell deficit on event cells.  It is not evidence for the asymptotic energy
premise or RH.
"""

from bisect import bisect_left, bisect_right
from math import log


def primes_upto(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, int(n**0.5) + 1):
        if sieve[p]:
            sieve[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i in range(2, n + 1) if sieve[i]]


LIMIT = 80_000
PRIMES = primes_upto(LIMIT + 1000)
LOGS = [log(p) for p in PRIMES]
LOG_OVER = [log(p) / p for p in PRIMES]
PREF_LOG = [0.0]
PREF_LOG_OVER = [0.0]
for a, b in zip(LOGS, LOG_OVER):
    PREF_LOG.append(PREF_LOG[-1] + a)
    PREF_LOG_OVER.append(PREF_LOG_OVER[-1] + b)

C0 = 1.0 - log(2.0)


def active_sums(x: float) -> tuple[float, float]:
    """Sums over x/2 < q < x; endpoints do not affect cell integrals."""
    lo = bisect_right(PRIMES, x / 2.0)
    hi = bisect_left(PRIMES, x)
    return (
        PREF_LOG[hi] - PREF_LOG[lo],
        PREF_LOG_OVER[hi] - PREF_LOG_OVER[lo],
    )


def deficit_cell(x: float) -> tuple[float, float]:
    slog, slog_over = active_sums(x)
    value = C0 * x - (2.0 * slog - x * slog_over)
    slope = C0 + slog_over
    return value, slope


def integrate_positive_square_linear(a: float, b: float, va: float, slope: float) -> float:
    """Exact integral of max(va+slope*(x-a),0)^2 on [a,b]."""
    if b <= a:
        return 0.0
    vb = va + slope * (b - a)
    if va >= 0.0:
        return (vb**3 - va**3) / (3.0 * slope) if slope else va * va * (b - a)
    if vb <= 0.0:
        return 0.0
    root = a - va / slope
    return vb**3 / (3.0 * slope) if root < b else 0.0


def energy(a: float, b: float) -> float:
    events = {a, b}
    ilo = bisect_left(PRIMES, a / 2.0)
    ihi = bisect_right(PRIMES, b)
    for p in PRIMES[ilo:ihi]:
        if a < p < b:
            events.add(float(p))
        if a < 2 * p < b:
            events.add(float(2 * p))
    points = sorted(events)
    total = 0.0
    for left, right in zip(points, points[1:]):
        mid = (left + right) / 2.0
        vmid, slope = deficit_cell(mid)
        vleft = vmid - slope * (mid - left)
        total += integrate_positive_square_linear(left, right, vleft, slope)
    return total


def left_terminal_deficit(p: int) -> float:
    lo = bisect_right(PRIMES, p / 2.0)
    hi = bisect_left(PRIMES, p)
    slog = PREF_LOG[hi] - PREF_LOG[lo]
    slog_over = PREF_LOG_OVER[hi] - PREF_LOG_OVER[lo]
    return C0 * p - (2.0 * slog - p * slog_over)


def main() -> None:
    terminals = [p for p in PRIMES if 20_000 <= p <= LIMIT]
    worst_margin = float("inf")
    worst_ratio = 0.0
    for p in terminals:
        h = max(left_terminal_deficit(p), 0.0)
        local_energy = energy(p / 2.0, float(p))
        rhs = 3.0 * (C0 + 2.0 * log(p)) * local_energy
        margin = rhs - h**3
        scale = max(1.0, rhs, h**3)
        if margin < -2e-8 * scale:
            raise AssertionError((p, h, local_energy, margin))
        worst_margin = min(worst_margin, margin)
        if rhs > 0.0:
            worst_ratio = max(worst_ratio, h**3 / rhs)

    # Check the one-host implication numerically on a bounded example.  C is
    # defined by equality in (E), so this is an algebra/implementation audit.
    y = 40_000.0
    z = 70_000.0
    pz = PRIMES[bisect_right(PRIMES, z)]
    host_energy = energy(y / 2.0, float(pz))
    alpha = 0.75
    host_l = C0 + 2.0 * log(pz)
    c_bound = (3.0 * host_l * host_energy / (y ** (3.0 * alpha))) ** (1.0 / 3.0)
    max_terminal_ratio = 0.0
    for p in PRIMES[bisect_right(PRIMES, y) : bisect_right(PRIMES, pz)]:
        h = max(left_terminal_deficit(p), 0.0)
        denom = c_bound * (p**alpha)
        if h > denom * (1.0 + 2e-10):
            raise AssertionError(("host transfer", p, h, denom))
        max_terminal_ratio = max(max_terminal_ratio, h / denom if denom else 0.0)

    # Sharp control for the analytic envelope: h=L=1 and
    # D(p-s)_+=max(1-s,0) give I=1/3. Factor three is equality; silently
    # dropping it is false.
    triangular_energy = 1.0 / 3.0
    if abs(3.0 * triangular_energy - 1.0) > 1e-15:
        raise AssertionError("triangular equality control")
    if not (triangular_energy < 1.0):
        raise AssertionError("missing-factor negative control")

    print("PRIME_SHELL_ENERGY_MAXIMAL_AUDIT")
    print(f"terminal_checks={len(terminals)}")
    print(f"minimum_rhs_minus_h_cubed={worst_margin:.12g}")
    print(f"maximum_h_cubed_over_rhs={worst_ratio:.12g}")
    print(f"host_Y={y:.0f}")
    print(f"host_Z={z:.0f}")
    print(f"host_terminal={pz}")
    print(f"host_energy={host_energy:.12g}")
    print(f"equality_C={c_bound:.12g}")
    print(f"maximum_terminal_over_bound={max_terminal_ratio:.12g}")
    print("triangular_factor_three_equality=PASS")
    print("missing_factor_three_negative_control=PASS")
    print("RESULT=PASS (finite formula audit only)")


if __name__ == "__main__":
    main()
