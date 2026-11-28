#!/usr/bin/env python3
"""Independent bounded challenge for the A395110 interlacing-matrix reduction.

This checks every symmetric binary k-by-k matrix for k <= 6.  It is not a
proof of the general uniqueness theorem and must not be counted as a solution.
"""

from itertools import product


def matrices(k):
    upper = [(i, j) for i in range(k) for j in range(i, k)]
    for bits in product((0, 1), repeat=len(upper)):
        c = [[0] * k for _ in range(k)]
        for bit, (i, j) in zip(bits, upper):
            c[i][j] = c[j][i] = bit
        yield c


def interlacing_word(c):
    k = len(c)
    prefix = [[sum(c[i][: j + 1]) for j in range(k)] for i in range(k)]
    if any(prefix[-1][j] not in (0, 1) for j in range(k)):
        return None
    if any(
        prefix[i][j] - prefix[i + 1][j] not in (0, 1)
        for i in range(k - 1)
        for j in range(k)
    ):
        return None
    totals = [sum(row) for row in c]
    word = tuple(
        totals[i] - totals[i + 1] if i + 1 < k else totals[i]
        for i in range(k)
    )
    assert all(bit in (0, 1) for bit in word)
    assert all(totals[i] == sum(word[i:]) for i in range(k))
    assert c[0] == [1 if j < totals[0] else 0 for j in range(k)]
    return word


def main():
    for k in range(1, 7):
        seen = {}
        for c in matrices(k):
            word = interlacing_word(c)
            if word is not None:
                assert word not in seen
                seen[word] = c
        assert len(seen) == 2**k
        assert set(seen) == set(product((0, 1), repeat=k))
        print(f"k={k}: {len(seen)} matrices; one for every binary word")


if __name__ == "__main__":
    main()
