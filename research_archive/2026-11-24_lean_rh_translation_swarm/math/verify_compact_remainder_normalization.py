#!/usr/bin/env python3
"""Exact-rational audit of the compact remainder scalar adapter.

This does not audit Lean elaboration, source combinatorics, asymptotics, or RH.
It checks equations (7) and (11) in the companion note plus negative controls.
"""

from fractions import Fraction as Q
from random import Random


def check_case(rng: Random) -> None:
    a = Q(rng.randint(1, 30), rng.randint(1, 9))
    m = Q(rng.randint(1, 30), rng.randint(1, 9))
    T = Q(rng.randint(1, 30), rng.randint(1, 9))
    U = Q(rng.randint(0, 30), rng.randint(1, 9))
    phi = Q(rng.randint(0, 30), rng.randint(1, 9))
    L = Q(rng.randint(1, 30), rng.randint(1, 9))

    # Enforce the native density input U <= T*L without selecting from labels.
    if U > T * L:
        U = T * L * Q(rng.randint(0, 9), 10)

    rx1 = Q(rng.randint(-40, 40), rng.randint(1, 9))
    r1 = Q(rng.randint(-40, 40), rng.randint(1, 9))
    slack = Q(rng.randint(0, 30), rng.randint(1, 9))
    e = rx1 - U * r1 / T + slack

    f = phi * U
    star_cap = f * a * L**5
    # Choose m*rem at or below the star cap, allowing negative remainders.
    mrem = star_cap - Q(rng.randint(0, 50), rng.randint(1, 9))
    rem = mrem / m
    rx = rem / (a * T) + rx1 - U * r1 / T

    assert rem == a * (T * (rx - rx1) + U * r1)
    assert rx == m * rem / m / a / T + (rx1 - U / T * r1)
    assert m * rem <= star_cap
    assert T * rx1 - U * r1 <= T * e
    assert m * a * T * (rx - e) <= phi * a * T * L**6
    assert rx <= phi * L**6 / m + e


def negative_controls() -> None:
    # Without the second-scale bound, all other premises can hold while the
    # conclusion fails: rem=0, U=f=phi=0, Rx=Rx1=1, e=0.
    a = m = T = L = rx = rx1 = Q(1)
    U = f = phi = r1 = e = rem = Q(0)
    assert rem == a * (T * (rx - rx1) + U * r1)
    assert m * rem <= f * a * L**5
    assert f == phi * U and U <= T * L
    assert not (m * a * T * (rx - e) <= phi * a * T * L**6)

    # The normalized equation requires nonzero a,m,T; division by any of them
    # is not a removable source premise.
    for denominator in ("a", "m", "T"):
        vals = {"a": Q(1), "m": Q(1), "T": Q(1)}
        vals[denominator] = Q(0)
        try:
            _ = Q(1) / vals[denominator]
        except ZeroDivisionError:
            pass
        else:
            raise AssertionError(f"missing zero guard for {denominator}")


def main() -> None:
    rng = Random(0xC0A7)
    for _ in range(5000):
        check_case(rng)
    negative_controls()
    print("COMPACT REMAINDER NORMALIZATION EXACT-RATIONAL PASS")
    print("cases=5000 negative_controls=4 arithmetic=fractions.Fraction")
    print("scope=scalar adapter only; no Lean/source/asymptotic/RH claim")


if __name__ == "__main__":
    main()
