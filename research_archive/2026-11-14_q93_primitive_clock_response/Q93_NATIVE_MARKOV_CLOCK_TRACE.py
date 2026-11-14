#!/usr/bin/env python3
"""Q93: exact history powers and a conditional 24-clock Gaussian trace law.

Native Q(h,2h)=Q(h,2h+1)=1/2; no synthetic matrices or measured inputs.
The Gaussian clock residual action is a DECLARED assumption, not a physical ARF.
"""
from fractions import Fraction
from math import e, isclose, pi, sin, sqrt


def supports(bits):
    n = 1 << bits
    return [
        [frozenset(((1 << i) * h + b) % n for b in range(1 << i))
         for h in range(n)]
        for i in range(bits + 1)
    ]


def gram(bits):
    """Exact Tr[(Q^i-P)^T (Q^j-P)], i,j=0,...,bits-1."""
    su = supports(bits)
    g = []
    for i in range(bits):
        row = []
        for j in range(bits):
            overlap = sum(len(su[i][h] & su[j][h])
                          for h in range(1 << bits))
            row.append(Fraction(overlap, 1 << (i + j)) - 1)
        g.append(row)
    return g


def check_bits(bits):
    n = 1 << bits
    su = supports(bits)
    assert all(len(s) == (1 << i)
               for i, rows in enumerate(su) for s in rows)
    assert all(len(su[bits][h]) == n for h in range(n))  # Q^bits = P
    observed = gram(bits)
    expected = [
        [Fraction((1 << (bits-i)) - 1 if i == j else 0)
         for j in range(bits)] for i in range(bits)
    ]
    assert observed == expected, (bits, observed)
    total = sum(expected[i][i] for i in range(bits))
    assert total == (1 << (bits+1)) - bits - 2
    return total, [int(expected[i][i]) for i in range(bits)]


def response_24(charge=1):
    golden = (1 + sqrt(5)) / 2
    theta = charge * 2*pi/golden**2
    r = pi/e
    analytic = (24*120 + 144/sin(12*theta)**2)/r**2
    mode_sum = sum(
        (120 + 1/(4*sin((theta + 2*pi*k/24)/2)**2))/r**2
        for k in range(24)
    )
    assert isclose(mode_sum, analytic, rel_tol=1e-12, abs_tol=1e-8)
    return analytic


def main():
    for bits in range(1, 8):
        total, diag = check_bits(bits)
        print(f"bits={bits}: diagonal={diag}; total={int(total)}")
    assert check_bits(6) == (Fraction(120), [63, 31, 15, 7, 3, 1])
    print("Native 64-history Frobenius orthogonality: EXACT PASS")
    print("One-mode trace: 120 + (2 - 2 cos omega)^(-1)")
    print("24-clock trace: 2880 + 144 csc^2(12 theta) before r^(-2)")
    for charge in (1, 2, 4):
        print(f"golden phase charge {charge}: r-scaled trace {response_24(charge):.12f}")
    print("Q93 EXACT CORE + NUMERICAL PHASE CHECK: PASS")


if __name__ == "__main__":
    main()
