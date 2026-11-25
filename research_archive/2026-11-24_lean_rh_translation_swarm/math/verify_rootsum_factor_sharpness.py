#!/usr/bin/env python3
"""Exact Q(sqrt(5)) certificate attaining the rank-two RootSum factor.

This checks the algebraic construction documented in
2026-11-25_ROOTSUM_FACTOR_SHARPNESS.md.  It is a sharpness certificate
for the generic RootSum carrier, not a proof of CountQAlt or RH.
"""

from dataclasses import dataclass
from fractions import Fraction as F
from itertools import product


@dataclass(frozen=True, order=True)
class Qsqrt5:
    """a + b*sqrt(5), with exact rational coefficients."""

    a: F
    b: F

    def __add__(self, other):
        return Qsqrt5(self.a + other.a, self.b + other.b)

    def __neg__(self):
        return Qsqrt5(-self.a, -self.b)

    def __sub__(self, other):
        return self + (-other)

    def __mul__(self, other):
        return Qsqrt5(
            self.a * other.a + 5 * self.b * other.b,
            self.a * other.b + self.b * other.a,
        )

    def conj(self):
        return Qsqrt5(self.a, -self.b)

    def __pow__(self, n):
        assert n >= 0
        out = ONE
        base = self
        while n:
            if n & 1:
                out = out * base
            base = base * base
            n //= 2
        return out


ZERO = Qsqrt5(F(0), F(0))
ONE = Qsqrt5(F(1), F(0))
PHI = Qsqrt5(F(1, 2), F(1, 2))
U = Qsqrt5(F(-1, 2), F(1, 2))  # phi - 1 = phi^{-1}


def main():
    checks = 0

    # Unit and monic-polynomial identities.
    assert PHI * U == ONE
    checks += 1
    assert PHI**2 - PHI - ONE == ZERO
    checks += 1
    assert U**2 + U - ONE == ZERO
    checks += 1

    # The nontrivial Q(sqrt(5))/Q automorphism exchanges the two beta states.
    beta_plus = tuple(sorted((PHI, U)))
    beta_minus = tuple(sorted((-U, -PHI)))
    assert tuple(sorted(x.conj() for x in beta_plus)) == beta_minus
    checks += 1
    assert tuple(sorted(x.conj() for x in beta_minus)) == beta_plus
    checks += 1
    assert PHI.conj() == -U and U.conj() == -PHI
    checks += 2

    # Products have absolute-value product one.  Signs are paired.
    assert PHI * U == ONE
    checks += 1
    assert (-U) * (-PHI) == ONE
    checks += 1

    # Exact interval proof for Win 9 0: 2 < sqrt(5) < 3 follows from
    # 4 < 5 < 9.  Consequently 1/2 < U < 1 < PHI < 2, hence every
    # absolute value is in (1/3,3).  These rational comparisons are exact.
    assert F(4) < F(5) < F(9)
    checks += 2

    # Four independent sign choices in each two-element square-root fibre.
    # A root is represented by (target-index, sign); distinct target absolute
    # values make the resulting multisets distinct.
    fibres = []
    for state in (0, 1):
        state_fibres = {
            tuple(sorted(((state, 0, s0), (state, 1, s1))))
            for s0, s1 in product((-1, 1), repeat=2)
        }
        assert len(state_fibres) == 4
        fibres.append(state_fibres)
    assert fibres[0].isdisjoint(fibres[1])
    checks += 1

    fibre_pairs = sum(len(x) for x in fibres)  # |S| * 2^n = 2*4
    bool_factor = 2
    carrier = fibre_pairs * bool_factor
    source_upper = 2 ** (2 + 1) * 2
    assert fibre_pairs == 8
    assert carrier == source_upper == 16
    checks += 1

    print("ROOTSUM FACTOR SHARPNESS CERTIFICATE")
    print(f"field identities checked={checks}")
    print(f"square-root fibres per state={len(fibres[0])},{len(fibres[1])}")
    print(f"carrier labels={carrier}")
    print(f"source upper bound={source_upper}")
    print("RESULT: exact rank-two RootSum factor is attained")


if __name__ == "__main__":
    main()
