#!/usr/bin/env python3
"""Finite regression for the classwise large-sieve far-pair obstruction.

The accompanying report contains the analytic proof.  This checks exact
finite identities and inequalities on genuine primes; it does not prove an
asymptotic prime estimate or RH.
"""

from collections import defaultdict
import cmath
import math


LOG2 = math.log(2.0)
C = 1.0 - LOG2
X = 4096


def sieve(n: int) -> list[int]:
    values = bytearray(b"\x01") * (n + 1)
    values[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if values[p]:
            values[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [n for n in range(2, n + 1) if values[n]]


PRIMES = [p for p in sieve(2 * X) if X / 2 < p <= 2 * X]
COEFF = {p: math.log(p) / p for p in PRIMES}


def phi(s: float) -> float:
    if 0.0 <= s <= LOG2:
        return 2.0 * math.exp(-s) - 1.0
    return 0.0


def phi_hat(t: float) -> complex:
    if t == 0.0:
        return C
    z = 1.0 + 1j * t
    return 2.0 * (1.0 - cmath.exp(-z * LOG2)) / z - (
        1.0 - cmath.exp(-1j * t * LOG2)
    ) / (1j * t)


def deficit(x: float) -> float:
    return C * x - math.fsum(
        (2.0 - x / p) * math.log(p) for p in PRIMES if x / 2 < p <= x
    )


def shell_log(u: float) -> float:
    return C - math.fsum(COEFF[p] * phi(u - math.log(p)) for p in PRIMES)


def exact_exp_integral(items: list[int], tmax: float) -> float:
    """Integral from -T to T of |sum a_p exp(-it log p)|^2."""
    total = 2.0 * tmax * math.fsum(COEFF[p] ** 2 for p in items)
    cross = []
    for i, p in enumerate(items):
        lp = math.log(p)
        ap = COEFF[p]
        for q in items[i + 1 :]:
            delta = lp - math.log(q)
            cross.append(4.0 * ap * COEFF[q] * math.sin(tmax * delta) / delta)
    return total + math.fsum(cross)


def main() -> None:
    # Exact logarithmic shell identity (2), away from endpoint conventions.
    shell_residual = 0.0
    for ratio in (1.001, 1.05, 1.2, 1.5, 1.9, 1.999):
        x = X * ratio
        residual = abs(deficit(x) / x - shell_log(math.log(x)))
        shell_residual = max(shell_residual, residual)
    assert shell_residual < 2e-14, shell_residual

    # Fourier transform and bounded-variation estimate (4).
    fourier_margin = math.inf
    for t in (0.01, 0.1, 0.5, 1.0, 2.0, 5.0, 20.0, 100.0):
        margin = min(1.0, 2.0 / abs(t)) - abs(phi_hat(t))
        assert margin >= -2e-15, (t, margin)
        fourier_margin = min(fourier_margin, margin)

    # Chebyshev-derived coefficient bound (7).
    a2 = math.fsum(a * a for a in COEFF.values())
    a2_bound = 32.0 * LOG2 * math.log(2.0 * X) / X
    assert a2 <= a2_bound

    checks = 0
    min_class_slack = math.inf
    min_cauchy_slack = math.inf
    max_full_ratio = 0.0
    gap_terms = []
    omitted_recombination_failures = 0
    for h in (1, 8, 64, 512):
        classes: dict[int, list[int]] = defaultdict(list)
        for p in PRIMES:
            classes[p % h].append(p)
        for tmax in (0.5, 2.0, 8.0):
            full = exact_exp_integral(PRIMES, tmax)
            class_integrals = []
            class_bounds = []
            for items in classes.values():
                value = exact_exp_integral(items, tmax)
                local_a2 = math.fsum(COEFF[p] ** 2 for p in items)
                bound = (2.0 * tmax + 4.0 * math.pi * X / h) * local_a2
                slack = bound - value
                assert slack >= -2e-9, (h, tmax, slack)
                min_class_slack = min(min_class_slack, slack)
                class_integrals.append(value)
                class_bounds.append(bound)
                checks += 1
            cauchy_rhs = h * math.fsum(class_integrals)
            cauchy_slack = cauchy_rhs - full
            assert cauchy_slack >= -2e-8, (h, tmax, cauchy_slack)
            min_cauchy_slack = min(min_cauchy_slack, cauchy_slack)
            combined_bound = h * math.fsum(class_bounds)
            formula_bound = (2.0 * h * tmax + 4.0 * math.pi * X) * a2
            assert abs(combined_bound - formula_bound) < 2e-10 * formula_bound
            assert full <= formula_bound + 2e-8
            max_full_ratio = max(max_full_ratio, full / formula_bound)
            false_bound = (2.0 * tmax + 4.0 * math.pi * X / h) * a2
            if full > false_bound + 2e-8:
                omitted_recombination_failures += 1
        gap_terms.append(4.0 * math.pi * X * a2)

    # The separation gain X/H is exactly cancelled by H-class recombination.
    gap_spread = max(gap_terms) - min(gap_terms)
    assert gap_spread < 1e-12
    assert omitted_recombination_failures > 0

    print(
        "large-sieve far-pair loss: OK; "
        f"X={X}, primes={len(PRIMES)}, shell_checks=6, "
        f"shell_residual={shell_residual:.3e}, fourier_checks=8, "
        f"min_fourier_margin={fourier_margin:.3e}, a2={a2:.9g}, "
        f"a2_bound={a2_bound:.9g}, class_checks={checks}, "
        f"min_class_slack={min_class_slack:.3e}, "
        f"min_cauchy_slack={min_cauchy_slack:.3e}, "
        f"max_full/bound={max_full_ratio:.6f}, "
        f"gap_term={gap_terms[0]:.9g}, gap_spread={gap_spread:.3e}"
        f", omitted_recombination_failures={omitted_recombination_failures}"
    )


if __name__ == "__main__":
    main()
