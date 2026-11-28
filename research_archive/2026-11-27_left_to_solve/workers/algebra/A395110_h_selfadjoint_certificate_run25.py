#!/usr/bin/env python3
"""Exact bounded challenge for the corrected A395110 matrix reduction.

The earlier bounded check enumerated only binary mixed-Hessian matrices C.
That was narrower than the stated integer-C lemma.  Here X is the binary
matrix of vertical prefix gaps.  We enumerate every binary X column by
column, reconstruct C = U X U^{-1}, and retain exactly the symmetric C.

This exhausts the corrected finite model through k = 7.  It is evidence for,
not a proof of, the general binary H-self-adjoint extension theorem.
"""

from collections import Counter
from itertools import product


def enumerate_words(k: int):
    bits = list(product((0, 1), repeat=k))
    # (U x)_i = sum_{r >= i} x_r for the upper-triangular all-ones U.
    upper = {x: tuple(sum(x[i:]) for i in range(k)) for x in bits}
    zero = (0,) * k
    columns = []
    c = [[None] * k for _ in range(k)]
    words = []
    nonbinary_c = 0

    def visit(j: int, previous_x):
        nonlocal nonbinary_c
        if j == k:
            words.append(tuple(columns[-1]))
            if any(entry not in (0, 1) for row in c for entry in row):
                nonbinary_c += 1
            return

        for x in bits:
            # Column j of C = U X U^{-1} is U(x_j - x_{j-1}).
            column = tuple(upper[x][i] - upper[previous_x][i] for i in range(k))
            # Entries above the diagonal were fixed earlier by symmetry.
            if any(column[i] != c[j][i] for i in range(j)):
                continue
            old = [c[i][j] for i in range(k)]
            for i in range(k):
                c[i][j] = column[i]
            columns.append(x)
            visit(j + 1, x)
            columns.pop()
            for i, value in enumerate(old):
                c[i][j] = value

    visit(0, zero)
    return Counter(words), nonbinary_c


def main():
    for k in range(1, 8):
        counts, nonbinary_c = enumerate_words(k)
        assert len(counts) == 2**k
        assert set(counts) == set(product((0, 1), repeat=k))
        assert set(counts.values()) == {1}
        assert nonbinary_c == 0
        print(
            f"k={k}: {sum(counts.values())} symmetric extensions; "
            "one per last-column word; nonbinary C=0"
        )


if __name__ == "__main__":
    main()
