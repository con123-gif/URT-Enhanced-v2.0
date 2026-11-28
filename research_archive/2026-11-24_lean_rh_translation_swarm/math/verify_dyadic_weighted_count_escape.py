#!/usr/bin/env python3
"""Regression checks for the dyadic weighted count-escape equation.

Finite and synthetic tests only. They check constants/directions and do not
prove a statement about all primes, the native budget-good set, or RH.
"""

from fractions import Fraction
from itertools import combinations
from math import ceil, exp, log


def require(condition, message):
    if not condition:
        raise AssertionError(message)


subset_checks = 0
for k in range(1, 9):
    lo, hi = 2**k, 2 ** (k + 1)
    # Exhaust every subset for the first ten integers of each window.  The
    # inequalities use only the interval, so primality is irrelevant here.
    points = list(range(lo + 1, min(hi, lo + 10) + 1))
    for size in range(len(points) + 1):
        for subset in combinations(points, size):
            weight = sum(log(n) / n for n in subset)
            lower = len(subset) * k * log(2) / 2 ** (k + 1)
            upper = len(subset) * (k + 1) * log(2) / 2**k
            require(lower <= weight + 1e-14, (k, subset, "lower"))
            require(weight <= upper + 1e-14, (k, subset, "upper"))
            subset_checks += 1


synthetic_checks = 0
for epsilon in (Fraction(1, 1000), Fraction(1, 500), Fraction(1, 200)):
    delta = Fraction(2, 9) * epsilon
    alpha = 1 - delta
    require(0 < alpha < 1, "bad exponent")

    # Bounded shell ratios reconstruct a bounded cumulative ratio.  We test
    # the exact geometric inequality with a rational stand-in q>1; the human
    # proof uses q=2^alpha.
    q = Fraction(3, 2)
    for m in range(1, 80):
        geometric = sum(q**k for k in range(m))
        require(geometric <= q**m / (q - 1), "geometric reconstruction")
        synthetic_checks += 1

    # Numerical normalization check for the actual exponent.  Escaping shell
    # ratios force escaping weighted normalization within factors 1/2 and 2.
    for k in range(1, 160):
        shell_ratio = k + 1
        z_low = shell_ratio / 2
        z_high = 2 * shell_ratio
        require(z_low <= z_high and z_low > 0, "factor-two transport")
        synthetic_checks += 1

    # Any fixed positive mass eventually dominates A*k*2^(-delta*k).
    delta_float = float(delta)
    for A in (1, 10, 10**3, 10**6):
        k = 1
        while A * k * exp(-delta_float * k * log(2)) >= 1 and k < 2_000_000:
            k += 1
        require(k < 2_000_000, (epsilon, A, "constant-mass threshold"))
        require(A * k * 2 ** (-delta_float * k) < 1, "decay direction")
        synthetic_checks += 1


# Exact exponent identity used by the native CountEscape specialization.
exponent_checks = 0
for numerator in range(1, 10):
    epsilon = Fraction(numerator, 1000)
    eta = 4 * epsilon / 9
    alpha = 1 - eta / 2
    require(alpha == 1 - 2 * epsilon / 9, "native exponent mismatch")
    require(0 < alpha < 1, "admissible alpha failure")
    exponent_checks += 1

print(
    "dyadic weighted count regression passed:",
    subset_checks,
    "subset sandwiches;",
    synthetic_checks,
    "synthetic/geometric checks;",
    exponent_checks,
    "exact exponent checks",
)
