#!/usr/bin/env python3
"""Exact regression for the CountQ selected-family aggregation.

This is not a proof of CountPAlt/CountQAlt or RH.  It checks, with exact
integer arithmetic, the finite aggregation equation isolated from the pinned
countQ_alt proof.  For nonnegative c_j and Y >= 1, every injectively selected
subfamily obeys

  sum_i c[u(i)] Y^A[u(i)] <= (sum_j c[j]) Y^max_j A[j].

The rootSum factor is also applied for the actual rank-two shape n=2:
six fixed candidates, five selected fields, root factor 2^(n+1)=8.
"""

from itertools import combinations, product


def check_family(c, a, ys, selected_sizes, root_factor=1):
    assert len(c) == len(a) and len(c) > 0
    csum = sum(c)
    amax = max(a)
    asum = sum(a)
    checks = strict_old = 0
    for k in selected_sizes:
        for selected in combinations(range(len(c)), k):
            for y in ys:
                exact_selected_endpoint = sum(c[j] * y ** a[j] for j in selected)
                improved = csum * y ** amax
                old_source_shape = k * csum * y ** asum
                assert exact_selected_endpoint <= improved
                assert root_factor * exact_selected_endpoint <= root_factor * improved
                assert improved <= old_source_shape
                checks += 1
                strict_old += improved < old_source_shape
    return checks, strict_old


def main():
    checks = strict = families = 0

    # Exhaustive small full families.  Selection is injective because it is
    # represented by a subset; endpoint cardinalities dominate every d_i
    # satisfying 0 <= d_i <= c[u(i)] Y^A[u(i)].
    for j in range(2, 5):
        for c in product(range(3), repeat=j):
            for a in product(range(4), repeat=j):
                q, s = check_family(c, a, range(1, 5), [j - 1])
                checks += q
                strict += s
                families += 1

    # Rank-two source shape: n=2, six candidates from quadFam(6), five
    # selected by exists_avoid, rootSum factor 8.  Exhaustive bounded grid.
    for c in product(range(2), repeat=6):
        for a in product(range(3), repeat=6):
            q, s = check_family(c, a, range(1, 6), [5], root_factor=8)
            checks += q
            strict += s
            families += 1

    # Concrete strict witness matching n=2.
    c = (1, 2, 3, 4, 5, 6)
    a = (0, 1, 2, 3, 4, 5)
    y = 2
    selected = (0, 1, 2, 3, 4)
    endpoint = sum(c[j] * y ** a[j] for j in selected)
    improved = sum(c) * y ** max(a)
    old = 5 * sum(c) * y ** sum(a)
    assert 8 * endpoint <= 8 * improved < 8 * old

    print("COUNTQ EXACT AGGREGATION REGRESSION")
    print(f"families={families}")
    print(f"endpoint inequalities checked={checks}")
    print(f"strict improvement over source-shaped bound={strict}")
    print(
        "rank2 strict witness: "
        f"8*endpoint={8 * endpoint}, 8*improved={8 * improved}, "
        f"8*old={8 * old}"
    )
    print("RESULT: exact integer regression passed")


if __name__ == "__main__":
    main()
