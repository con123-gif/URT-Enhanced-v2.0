#!/usr/bin/env python3
"""Exact arithmetic checks for the count-escape twist-selection reduction.

This is not a proof of RH and does not run Lean.  It checks the rational
parameter choice and the integer block inequalities used to show that the
new count-escape premise is strictly weaker than logarithmic divergence.
"""

from fractions import Fraction


def first_n_for_block(j: int, a: int, q: int, lower: int) -> int:
    """Find N with j(qN+1)2^j <= 2^(aN), preserving increasing blocks."""
    n = max(1, lower)
    while j * (q * n + 1) * (1 << j) > (1 << (a * n)):
        n += 1
    return n


def main() -> None:
    # A representative endpoint epsilon.  All identities below are exact
    # rational identities and the accompanying note proves them for every
    # 0 < epsilon < 1/100.
    epsilon = Fraction(1, 1000)
    eta = Fraction(4, 9) * epsilon
    delta = eta / 2

    assert 0 < eta < 1
    assert 9 * eta == 4 * epsilon < 8 * epsilon
    assert delta == Fraction(2, 9) * epsilon
    assert 0 < delta < 1

    # Write delta=a/q.  Taking X_j=2^(q N_j) and
    # m_j=j*X_j^(1-delta) makes both quantities integral.  The checked
    # inequality implies the j-th block contributes < 2^(-j) to
    # sum log(p)/p, while m_j/(2X_j)^(1-delta) > j/2.
    a, q = delta.numerator, delta.denominator
    previous = 1
    rows = []
    for j in range(1, 17):
        n = first_n_for_block(j, a, q, previous + 1)
        assert j * (q * n + 1) * (1 << j) <= (1 << (a * n))
        # qN is the base-2 logarithm of X_j; no enormous X_j is materialized.
        rows.append((j, n, q * n, (q - a) * n))
        previous = n

    assert all(rows[i][1] < rows[i + 1][1] for i in range(len(rows) - 1))
    print("COUNT_ESCAPE_PARAMETER_IDENTITY_OK")
    print(f"epsilon={epsilon} eta={eta} delta={delta}")
    print("STRICTNESS_BLOCK_ENVELOPES_OK")
    print("j N_j log2(X_j) log2(X_j^(1-delta))")
    for row in rows:
        print(*row)


if __name__ == "__main__":
    main()
