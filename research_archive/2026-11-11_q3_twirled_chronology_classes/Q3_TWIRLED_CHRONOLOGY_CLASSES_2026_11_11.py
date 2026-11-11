#!/usr/bin/env python3
"""Q3: the A5-twirled chronology second moment over all 46,080 signed six-axis dictionaries.

Archived objects: the primitive six-bit shift Q2 (h -> 2h, 2h+1 mod 64) and the twirl S = sum_{g in A5} P_g Q2 P_g^T of
`2026-11-10_urt_arf_forward/new_gate/URT_A5_TWIRLED_CHRONOLOGY_SPECTRUM_2026_11_10.py`, with archived second moments
Tr S^2 = 31440 (its coset labeling), 42480 (axes 0,1 exchanged) and 27120 (axes 0,3 exchanged).

A dictionary says which antipodal axis of the icosahedron sits at which bit and with which sign: 720 * 64 = 46,080.
The archive labels vertices abstractly (cosets of C5 in A5); here they are labelled geometrically. Each labeling is one
dictionary relative to the other, so the census over ALL signed dictionaries is convention-free, while any "unsigned"
subset depends on the base sign convention. For dictionary D (a bit permutation with flips, history -> canonical code),
the twirl is S_D = sum_g P_g (D Q2 D^-1) P_g^T with the geometric A5 action P_g on canonical codes.
Tr S_D^2 is constant on A5 x inversion orbits (Q2 commutes with complementing all bits).

Certified: all three archived values occur; the exact number of distinct second moments and their multiplicities.
A single value would be an ordering-independent THEOREM; more than one is the OBSTRUCTION Q3 asks to size.
"""
from __future__ import annotations

import collections
import itertools
import json
import sys
from itertools import combinations
from pathlib import Path

import networkx as nx
import numpy as np

HERE = Path(__file__).resolve().parent
PHI = (1 + 5 ** 0.5) / 2


def geometric_a5_on_codes():
    pts = np.array([(0, a, b * PHI) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a, b * PHI, 0) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a * PHI, 0, b) for a, b in itertools.product((-1, 1), repeat=2)], float)
    pairs, rem = [], set(range(12))
    while rem:
        i = min(rem); j = min(rem - {i}, key=lambda k: np.linalg.norm(pts[i] + pts[k]))
        pairs.append((i, j)); rem -= {i, j}
    G = nx.Graph(); G.add_edges_from((i, j) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(pts[i] - pts[j]) - 2) < 1e-9)
    code_of = {}
    for c in range(64):
        code_of[frozenset(pairs[k][(c >> k) & 1] for k in range(6))] = c
    perms = []
    for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
        p = [m[i] for i in range(12)]
        if np.linalg.det(np.linalg.lstsq(pts, pts[p], rcond=None)[0]) > 0:
            perms.append(np.array([code_of[frozenset(p[pairs[k][(c >> k) & 1]] for k in range(6))] for c in range(64)]))
    assert len(perms) == 60
    return perms


def main() -> int:
    perms = geometric_a5_on_codes()
    Q2 = np.zeros((64, 64), dtype=np.int64)
    for h in range(64):
        Q2[h, 2 * h % 64] = 1; Q2[h, (2 * h + 1) % 64] = 1
    hbits = np.array([[(h >> i) & 1 for i in range(6)] for h in range(64)])

    def moment(order, signs):
        code = ((hbits ^ np.asarray(signs)) << np.asarray(order)).sum(axis=1)   # history -> canonical code
        Dinv = np.empty(64, dtype=int); Dinv[code] = np.arange(64)
        X = Q2[np.ix_(Dinv, Dinv)]
        S = np.zeros((64, 64), dtype=np.int64)
        for p in perms:
            S += X[np.ix_(p, p)]
        return int(np.trace(S @ S))

    values = collections.Counter()
    for order in itertools.permutations(range(6)):
        for signs in itertools.product((0, 1), repeat=6):
            values[moment(order, signs)] += 1
    out = {"signed_dictionaries": 46080, "distinct_second_moments": len(values),
           "values_with_multiplicity": {str(k): v for k, v in sorted(values.items())},
           "archived_values_present": {str(v): v in values for v in (31440, 42480, 27120)}}
    print(json.dumps(out, indent=2))
    (HERE / "Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.json").write_text(json.dumps(out, indent=2) + "\n")
    assert all(out["archived_values_present"].values()), "construction does not reproduce the archived moments"
    assert sum(values.values()) == 46080
    print(f"PASS: all 46,080 signed dictionaries evaluated; {len(values)} distinct A5-twirled second moments; "
          "archived 31440, 42480, 27120 all occur.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
