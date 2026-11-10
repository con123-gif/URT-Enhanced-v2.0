#!/usr/bin/env python3
"""alt_cycle17: derive or refute source-matching from Hamming-parity orbit labels."""
from __future__ import annotations

import json
from collections import Counter, defaultdict
from itertools import permutations
from pathlib import Path

import numpy as np

PHI = (1.0 + np.sqrt(5.0)) / 2.0
PHIB = (1.0 - np.sqrt(5.0)) / 2.0


def parity_perm(p):
    return sum(p[i] > p[j] for i in range(5) for j in range(i + 1, 5)) % 2


def mul(p, q):
    return tuple(p[q[i]] for i in range(5))


def inv(p):
    return tuple(p.index(i) for i in range(5))


I = tuple(range(5))


def power(p, k):
    a = I
    for _ in range(k):
        a = mul(a, p)
    return a


G = [p for p in permutations(range(5)) if parity_perm(p) == 0]
cycle = (1, 2, 3, 4, 0)
H = {power(cycle, j) for j in range(5)}
cosets = sorted({frozenset(mul(g, h) for h in H) for g in G}, key=lambda c: min(c))
idx = {c: i for i, c in enumerate(cosets)}
perms12 = [[idx[frozenset(mul(g, h) for h in c)] for c in cosets] for g in G]
order = {g: next(n for n in (1, 2, 3, 5) if power(g, n) == I) for g in G}
normalizer = [g for g in G if {mul(mul(g, h), inv(g)) for h in H} == H]
n = next(g for g in normalizer if g not in H and order[g] == 2)
opposite = [idx[frozenset(mul(mul(min(c), n), h) for h in H)] for c in cosets]
pairs = []
seen = set()
for i in range(12):
    if i not in seen:
        pairs.append((i, opposite[i]))
        seen.update(pairs[-1])
assert len(pairs) == 6

sets = [frozenset(pair[(mask >> k) & 1] for k, pair in enumerate(pairs)) for mask in range(64)]
index = {x: i for i, x in enumerate(sets)}
perms64 = []
for p in perms12:
    q = [index[frozenset(p[i] for i in ss)] for ss in sets]
    perms64.append(q)

unused = set(range(64))
orbits = []
while unused:
    seed = min(unused)
    orb = {perm[seed] for perm in perms64}
    orbits.append(sorted(orb))
    unused -= orb
orbits.sort(key=lambda o: (len(o), o[0]))
assert [len(o) for o in orbits] == [12, 12, 20, 20]


def hamming_weight(mask):
    return bin(mask).count("1")


def all_flip(mask):
    return mask ^ 63


orbit_of = {}
for oi, orb in enumerate(orbits):
    for s in orb:
        orbit_of[s] = oi

orbit_parity = {}
orbit_weights = {}
parity_constant = {}
for oi, orb in enumerate(orbits):
    par = Counter(hamming_weight(s) % 2 for s in orb)
    wts = Counter(hamming_weight(s) for s in orb)
    orbit_parity[oi] = {int(k): int(v) for k, v in par.items()}
    orbit_weights[oi] = {int(k): int(v) for k, v in wts.items()}
    parity_constant[oi] = len(par) == 1

assert all(parity_constant.values())
assert all(orbit_of[s] == orbit_of[all_flip(s)] for s in range(64))

# Each 12-orbit ≅ permutation module on 12 icosahedral vertices = 1⊕3⊕3'⊕5.
# Compute the character of perms12 and decompose against the A5 table.
# A5 classes: 1A (1), 2A double transpositions (15), 3A (20), 5A (12), 5B (12).
CHARS = {
    "1":  np.array([1.0, 1.0, 1.0, 1.0, 1.0]),
    "3":  np.array([3.0, -1.0, 0.0, PHI, PHIB]),
    "3'": np.array([3.0, -1.0, 0.0, PHIB, PHI]),
    "4":  np.array([4.0, 0.0, 1.0, -1.0, -1.0]),
    "5":  np.array([5.0, 1.0, -1.0, 0.0, 0.0]),
}
CLSZ = np.array([1.0, 15.0, 20.0, 12.0, 12.0])
assert abs(CLSZ.sum() - 60.0) < 1e-12


def class_of(g):
    o = order[g]
    if o == 1:
        return 0
    if o == 2:
        return 1
    if o == 3:
        return 2
    # order 5: split 5A / 5B by the character of the standard 3
    # (01234) type vs inverse. Use cycle type on {0,1,2,3,4}:
    # a 5-cycle (a0 a1 a2 a3 a4) is in the class of (01234) or (01243).
    # Standard split: sum of fifth roots / trace of rotation by ±72°.
    # We use: the permutation of five letters written as a 5-cycle
    # (start at 0): 0, g[0], g[g[0]], ... ; the two classes are inverses.
    # Identify class by whether g is conjugate in A5 to a fixed 5-cycle.
    # Practical test: χ_3(g) = φ for 5A and φ̄ for 5B, but we don't have
    # the 3-representation yet. Use the well-known: two 5-cycles on 5
    # letters are A5-conjugate iff they are even-conjugate, equivalently
    # iff one is not the inverse of a conjugate of the other? In A5,
    # a 5-cycle and its inverse lie in distinct classes.
    # Label by the cycle (0, g0, g^2 0, ...) vs its inverse: pick the
    # lexicographically smaller rotation among g and g^{-1} as 5A if
    # a fixed representative test passes.
    #
    # Concrete invariant: write the 5-cycle starting at 0 as
    # (0 a b c d). It is of "plus" type if the permutation
    # 0->a->b->c->d->0 has the same cyclic orientation as (0 1 2 3 4)
    # up to an even relabelling — equivalently, the cross-ratio like
    # quadratic residue of the steps.
    # The standard invariant: for σ = (a0 a1 a2 a3 a4), the class is
    # determined by whether a1-a0, a2-a0, ... as elements of F5, after
    # scaling, match {1,2,3,4} squares {1,4} in a fixed way.
    seq = [0]
    x = g[0]
    while x != 0:
        seq.append(x)
        x = g[x]
    assert len(seq) == 5
    # Step in F5 from 0: seq[1] as generator.
    step = seq[1] % 5
    # Squares in F5: 1^2=1, 2^2=4, 3^2=4, 4^2=1. Quadratic residues: 1,4.
    # Class 5A if step is a quadratic residue, 5B otherwise (2 or 3).
    # This is the standard F5-residue split of 5-cycles in A5 ≅ PSL(2,5)
    # up to swapping the two labels, which we will not need to pin down
    # because χ_perm is the same on both 5-classes (verified below).
    return 3 if step in (1, 4) else 4


fixed_by_class = defaultdict(list)
for g, p12 in zip(G, perms12):
    nfix = sum(1 for i, j in enumerate(p12) if i == j)
    fixed_by_class[class_of(g)].append(nfix)

class_sizes_seen = {c: len(v) for c, v in fixed_by_class.items()}
assert class_sizes_seen[0] == 1
assert class_sizes_seen[1] == 15
assert class_sizes_seen[2] == 20
assert class_sizes_seen[3] + class_sizes_seen[4] == 24
assert class_sizes_seen[3] == 12 and class_sizes_seen[4] == 12

chi_perm = np.array([float(np.mean(fixed_by_class[c])) for c in range(5)])
# Every element in a class should have the same character.
for c in range(5):
    assert len(set(fixed_by_class[c])) == 1

assert abs(chi_perm[0] - 12.0) < 1e-12
assert abs(chi_perm[1] - 0.0) < 1e-12
assert abs(chi_perm[2] - 0.0) < 1e-12
assert abs(chi_perm[3] - 2.0) < 1e-12
assert abs(chi_perm[4] - 2.0) < 1e-12


def inner(ch_a, ch_b):
    return float(np.dot(CLSZ * ch_a, ch_b) / 60.0)


decomp12 = {name: inner(chi_perm, ch) for name, ch in CHARS.items()}
for name, val in decomp12.items():
    assert abs(val - round(val)) < 1e-10
    decomp12[name] = int(round(val))
assert decomp12 == {"1": 1, "3": 1, "3'": 1, "4": 0, "5": 1}

# Orbit-constant multiplication operators are scalars on each orbit.
# Hamming parity as a diagonal operator on C^64:
parity_vec = np.array([(-1) ** hamming_weight(s) for s in range(64)], dtype=float)
# It is constant on each orbit:
orbit_parity_value = {}
for oi, orb in enumerate(orbits):
    vals = set(int(parity_vec[s]) for s in orb)
    assert len(vals) == 1
    orbit_parity_value[oi] = next(iter(vals))

# Distinct values: the two 12-orbits have opposite parity, likewise the two 20s.
p12 = [orbit_parity_value[i] for i in range(2)]
p20 = [orbit_parity_value[i] for i in range(2, 4)]
assert p12[0] != p12[1]
assert p20[0] != p20[1]

# On a single 12-orbit the operator is c * I_12, hence it has the same
# eigenvalue on the 3 and the 3' inside that orbit.
scalar_on_each_orbit = True
same_eigenvalue_on_3_and_3p = True
can_kill_3p_keep_3 = False

# Hamming-weight itself is not an orbit label (varies inside orbits),
# and its A5-invariant part is the constant function 3.
mean_weight = {}
for oi, orb in enumerate(orbits):
    mean_weight[oi] = float(np.mean([hamming_weight(s) for s in orb]))
assert all(abs(mean_weight[i] - 3.0) < 1e-12 for i in range(4))

source_matching_derived = False

result = {
    "H1_orbit_module": {
        "orbit_sizes": [len(o) for o in orbits],
        "parity_constant_on_each_orbit": parity_constant,
        "orbit_hamming_parity": {str(k): v for k, v in orbit_parity.items()},
        "orbit_parity_value": {str(k): int(v) for k, v in orbit_parity_value.items()},
        "all_flip_preserves_each_orbit": True,
        "permutation_character_on_12": chi_perm.tolist(),
        "decomposition_of_a_12_orbit": decomp12,
        "each_12_orbit_is_1_plus_3_plus_3p_plus_5": decomp12 == {"1": 1, "3": 1, "3'": 1, "4": 0, "5": 1},
    },
    "H2_source_matching_implied": source_matching_derived,
    "H3_orbit_projectors": {
        "scalar_on_each_orbit": scalar_on_each_orbit,
        "same_eigenvalue_on_3_and_3p": same_eigenvalue_on_3_and_3p,
        "can_kill_3p_keep_3": can_kill_3p_keep_3,
        "hamming_weight_mean_on_each_orbit": mean_weight,
        "hamming_weight_invariant_part_is_the_constant_3": True,
        "note": (
            "Hamming parity distinguishes the two 12-orbits (and the two 20-orbits) "
            "and is the orbit label used for opposite charges. It cannot separate "
            "3 from 3' inside a 12-orbit, so it does not imply β = 0 with α kept."
        ),
    },
    "classification": {
        "H1": "PROVED",
        "H2": "FALSIFIED",
        "H3": "PROVED",
    },
    "advances_ARF": False,
    "which_ARF": None,
    "next_obstruction": (
        "Source-matching remains an extra assumption. Hamming-parity orbit "
        "labels fix opposite-charge pairings of histories, not the 3 versus 3' "
        "Yukawa channel."
    ),
}

out = Path("/workspace/arf_research/alt_cycle17_source_matching/results.json")
out.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
print("PASS: alt_cycle17")
