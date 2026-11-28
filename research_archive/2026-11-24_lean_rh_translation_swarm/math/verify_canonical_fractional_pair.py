#!/usr/bin/env python3
"""Exact finite regressions for the canonical fractional-pair reduction."""

from fractions import Fraction
from itertools import combinations, product
from pathlib import Path

HERE = Path(__file__).resolve().parent
LEAN = HERE / "2026-11-28_CANONICAL_FRACTIONAL_PAIR_EQUATION.lean"
NOTE = HERE / "2026-11-28_CANONICAL_FRACTIONAL_PAIR_EQUATION.md"


def edges(n):
    return list(combinations(range(n), 2))


def incident_load(n, es, weights):
    return [sum((w for e, w in zip(es, weights) if v in e), Fraction()) for v in range(n)]


def matching_number(es):
    best = 0
    for mask in range(1 << len(es)):
        chosen = [e for j, e in enumerate(es) if mask >> j & 1]
        flat = [v for e in chosen for v in e]
        if len(flat) == len(set(flat)):
            best = max(best, len(chosen))
    return best


def exhaustive_fractional_hitting():
    tested = covering = rounding = 0
    # Exact quarter-unit weights.  n=4 already includes nonuniform packings.
    for n in range(1, 5):
        all_edges = edges(n)
        for nums in product(range(5), repeat=len(all_edges)):
            chosen = [(e, Fraction(a, 4)) for e, a in zip(all_edges, nums) if a]
            es = [e for e, _ in chosen]
            ws = [w for _, w in chosen]
            if any(x > 1 for x in incident_load(n, es, ws)):
                continue
            mass = sum(ws, Fraction())
            assert mass <= 2 * matching_number(es), (n, chosen, mass)
            rounding += 1
            for bad_mask in range(1 << n):
                tested += 1
                bad = {v for v in range(n) if bad_mask >> v & 1}
                if all(any(v in bad for v in e) for e in es):
                    covering += 1
                    assert mass <= len(bad), (n, chosen, bad, mass)
    return tested, covering, rounding


def exhaustive_uniform_degree_embedding():
    tested = covering = 0
    for n in range(1, 6):
        all_edges = edges(n)
        for mask in range(1 << len(all_edges)):
            es = [e for j, e in enumerate(all_edges) if mask >> j & 1]
            deg = [sum(v in e for e in es) for v in range(n)]
            D = max([1] + deg)
            w = Fraction(1, D)
            assert all(Fraction(d, D) <= 1 for d in deg)
            assert sum((w for _ in es), Fraction()) == Fraction(len(es), D)
            for bad_mask in range(1 << n):
                tested += 1
                bad = {v for v in range(n) if bad_mask >> v & 1}
                if all(any(v in bad for v in e) for e in es):
                    covering += 1
                    assert len(es) <= D * len(bad)
    return tested, covering


def check_strict_generalization_example():
    # Path 0-1-2-3: the full-graph uniform 1/Delta mass is 3/2, but the two
    # end edges have mass 2.  This diagnoses the naive full-graph ratio; it
    # is not a strict asymptotic separation because RUN84 may choose them as
    # a degree-one subgraph.
    es = [(0, 1), (1, 2), (2, 3)]
    uniform = Fraction(len(es), 2)
    weights = [Fraction(1), Fraction(0), Fraction(1)]
    assert max(incident_load(4, es, weights)) <= 1
    mass = sum(weights, Fraction())
    assert mass == 2 and mass > uniform
    return uniform, mass


def check_exponents():
    tests = 0
    for p in range(1, 100):
        eps = Fraction(p, 10000)
        eta = 4 * eps / 9
        assert 1 - eta / 2 == 1 - 2 * eps / 9
        assert Fraction(1, 2) + 9 * eta == Fraction(1, 2) + 4 * eps
        assert Fraction(1, 2) + 4 * eps <= Fraction(1, 2) + 8 * eps
        tests += 1
    return tests


def source_guards():
    lean = LEAN.read_text()
    note = NOTE.read_text()
    required_lean = [
        "CanonicalFractionalPairCount",
        "exists_unhit_of_bad_card_lt_mass",
        "RHDepPairMean84.weighted_hit_bound",
        "pair_exists_outside_bad",
        "RHPrimeWindow101.PairGridCost",
        "#print axioms",
    ]
    required_note = [
        "fractional matching number",
        "1-2\\varepsilon/9",
        "RESUME HERE",
        "RH remains open",
    ]
    for anchor in required_lean:
        assert anchor in lean, anchor
    for anchor in required_note:
        assert anchor in note, anchor
    for forbidden in ("sorry", "admit", "native_decide"):
        assert forbidden not in lean, forbidden
    return len(required_lean) + len(required_note)


def main():
    ft, fc, fr = exhaustive_fractional_hitting()
    dt, dc = exhaustive_uniform_degree_embedding()
    u, m = check_strict_generalization_example()
    ex = check_exponents()
    sg = source_guards()
    print(f"fractional hitting: {ft} tests, {fc} covering configurations")
    print(f"maximal-matching rounding controls: {fr}")
    print(f"degree embedding: {dt} tests, {dc} covering configurations")
    print(f"fixed-graph example: uniform={u}, fractional={m}")
    print(f"exponent identities: {ex}; source guards: {sg}")
    print("CANONICAL_FRACTIONAL_PAIR_REGRESSION_OK")


if __name__ == "__main__":
    main()
