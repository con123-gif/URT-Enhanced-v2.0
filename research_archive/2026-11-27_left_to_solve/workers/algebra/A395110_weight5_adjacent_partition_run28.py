#!/usr/bin/env python3
"""Exact finite challenge for RUN28's {2,3} partition exclusion.

This is supporting evidence only.  The dimension-independent proof is in the RUN28
checkpoint; this program exhausts binary prefixes for 5 <= k <= 9 without assuming
the forced consecutive-block answer.
"""

from itertools import combinations


def solve_prefixes(k: int) -> list[int]:
    h = [[min(i + 1, j + 1) for j in range(k)] for i in range(k)]
    first = tuple(int(i + 1 in (2, 3)) for i in range(k))
    prefixes = [((first,), [5])]
    counts = [1]

    def hdot(row: int, column: tuple[int, ...]) -> int:
        return sum(h[row][r] * column[r] for r in range(k))

    for j in range(1, k):
        weight = sum(min(r + 1, j + 1) * first[r] for r in range(k))
        candidates = [
            tuple(int(i in support) for i in range(k))
            for support in combinations(range(k), weight)
        ]
        next_prefixes = []
        for prefix, moments in prefixes:
            for column in candidates:
                if any(hdot(i, column) != hdot(j, prefix[i]) for i in range(j)):
                    continue
                moment = sum((r + 1) * column[r] for r in range(k))
                previous_curvature = (
                    2 * moments[-1]
                    - (moments[-2] if len(moments) > 1 else 0)
                    - moment
                )
                if previous_curvature in (0, 1):
                    next_prefixes.append((prefix + (column,), moments + [moment]))
        prefixes = next_prefixes
        counts.append(len(prefixes))

        if j <= k - 3:
            assert len(prefixes) == 1, (k, j + 1, len(prefixes))
            support = tuple(i + 1 for i, bit in enumerate(prefixes[0][0][-1]) if bit)
            if j == 1:
                assert support == (1, 2, 3, 4)
            else:
                assert support == tuple(range(j - 1, j + 4))
            assert prefixes[0][1][-1] == 5 * (j + 1)

    assert not prefixes
    return counts


def main() -> None:
    for k in range(5, 10):
        counts = solve_prefixes(k)
        print(f"k={k}: prefix counts {counts}; final extensions=0")


if __name__ == "__main__":
    main()
