#!/usr/bin/env python3
"""Q42: exact sign-mask fibres of the native Q3/Q28 A5-twirled Q2.

Imports the original Git-blob-pinned Q3/Q28 operators. No fitted inputs.
Fails nonzero if the complete 12-order x 64-mask orbital census changes.
"""
from collections import Counter, defaultdict
from contextlib import redirect_stdout
from io import StringIO
from itertools import permutations
from pathlib import Path
import hashlib
import json
import runpy
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
Q3 = ROOT / '2026-11-11_q3_twirled_chronology_classes' / 'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28 = ROOT / '2026-11-11_q28_twirled_third_trace' / 'q28_twirled_third_trace.py'

def git_blob(path):
    b = path.read_bytes()
    return hashlib.sha1(b'blob ' + str(len(b)).encode() + b'\0' + b).hexdigest()

assert git_blob(Q3) == 'bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984'
assert git_blob(Q28) == '6e22cb7654176c6499ee138737f4f85240619ec7'
with redirect_stdout(StringIO()):
    source = runpy.run_path(str(Q28))
perms, actions, bits, Q = (source[k] for k in ('perms', 'actions', 'bits', 'Q'))
assert len(perms) == 60 and len(actions) == 60 and Q.shape == (64, 64)
assert all(Q[h, 2*h % 64] == Q[h, (2*h+1) % 64] == 1 for h in range(64))

# Exact A5 orbitals on ordered pairs of canonical 64-history codes.
orb = -np.ones((64, 64), dtype=np.int16)
for u in range(64):
    for v in range(64):
        if orb[u, v] == -1:
            k = int(orb.max()) + 1
            for p in perms:
                orb[p[u], p[v]] = k
assert int(orb.max()) + 1 == 80
assert all(np.array_equal(orb, orb[np.ix_(p, p)]) for p in perms)
sizes = np.bincount(orb.ravel(), minlength=80)
assert sum(sizes) == 4096

h = np.arange(64, dtype=np.int64)
succ0, succ1 = 2*h % 64, (2*h+1) % 64

def code_of(order, mask):
    signs = np.array([(mask >> i) & 1 for i in range(6)], dtype=np.int64)
    code = ((bits ^ signs) << np.array(order, dtype=np.int64)).sum(axis=1)
    assert len(set(code.tolist())) == 64
    return code

def orbital_counts(order, mask):
    c = code_of(order, mask)
    edge_orbs = np.r_[orb[c, c[succ0]], orb[c, c[succ1]]]
    return tuple(int(x) for x in np.bincount(edge_orbs, minlength=80))

# Proper A5 acts freely on unsigned orders, hence 720/60=12 order classes.
remaining = set(permutations(range(6)))
orders = []
while remaining:
    order = min(remaining)
    orbit = {tuple(a[0][x] for x in order) for a in actions}
    assert len(orbit) == 60 and orbit <= remaining
    remaining -= orbit
    orders.append(order)
assert len(orders) == 12

patterns = Counter()
mask_differences = Counter()
all_vectors = {}
exceptional = []
for order in orders:
    fibres = defaultdict(list)
    for mask in range(64):
        vector = orbital_counts(order, mask)
        assert sum(vector) == 128
        if vector in all_vectors:
            assert all_vectors[vector] == order, 'unexpected cross-unsigned-order equality'
        else:
            all_vectors[vector] = order
        fibres[vector].append(mask)
    pattern = tuple(sorted(Counter(map(len, fibres.values())).items()))
    patterns[pattern] += 1
    assert pattern in (((2, 32),), ((2, 28), (4, 2)))
    if pattern == ((2, 28), (4, 2)):
        exceptional.append(order)
    for group in fibres.values():
        assert len(group) in (2, 4)
        for i, a in enumerate(group):
            for b in group[i+1:]:
                mask_differences[a ^ b] += 1
assert patterns == Counter({((2, 32),): 6, ((2, 28), (4, 2)): 6})
assert mask_differences == Counter({63: 384, 12: 24, 51: 24})
assert len(all_vectors) == 372
assert exceptional == [
    (0,1,2,3,4,5), (0,1,2,3,5,4), (0,1,2,5,3,4),
    (0,1,4,2,5,3), (0,1,4,5,2,3), (0,1,4,5,3,2)]

# The middle flip is NOT a permutation of A5 orbitals: for each
# exceptional order it splits every one of the 80 orbitals.
for exceptional_order in exceptional:
    tt = (1 << exceptional_order[2]) | (1 << exceptional_order[3])
    shifted_orb = orb[np.ix_(h ^ tt, h ^ tt)]
    split = sum(len(set(shifted_orb[orb == k].tolist())) > 1 for k in range(80))
    assert split == 80
order = (0,1,2,3,4,5)
t = (1 << order[2]) | (1 << order[3])

# Concrete primitive-edge witness: mask 16 -> 28 flips digits {2,3}.
# 108 of 128 individual edges change their orbital label, but the total
# count of edges in EACH orbital is unchanged (exact cancellation).
a, b = 16, 28
c = code_of(order, a)
pre = np.r_[orb[c, c[succ0]], orb[c, c[succ1]]]
post = np.r_[orb[c ^ t, c[succ0] ^ t], orb[c ^ t, c[succ1] ^ t]]
assert b == (a ^ 12)
assert int(np.count_nonzero(pre != post)) == 108
assert np.array_equal(np.bincount(pre, minlength=80), np.bincount(post, minlength=80))

# Check the exact orbital lemma against the actual original A5 twirl.
# S_ij = (60 / |O_ij|) * # primitive edges in O_ij.
def native_twirl(mask):
    c = code_of(order, mask)
    inv = np.empty(64, dtype=np.int64)
    inv[c] = h
    X = Q[np.ix_(inv, inv)]
    S = np.zeros((64, 64), dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p, p)]
    count = np.array(orbital_counts(order, mask), dtype=np.int64)
    assert np.array_equal(S * sizes[orb], 60 * count[orb])
    return S
assert np.array_equal(native_twirl(a), native_twirl(b))

print(json.dumps({
    'task': 'Q42', 'source': 'original Q3/Q28, native Q2 and A5 orbitals',
    'unsigned_A5_orders': len(orders), 'signed_representatives': len(orders)*64,
    'patterns': {'32 inversion pairs': 6, '28 inversion pairs + 2 quartets': 6},
    'equal_pair_xor_mask_counts': dict(sorted(mask_differences.items())),
    'exceptional_unsigned_orders': exceptional,
    'distinct_twirled_operators': len(all_vectors),
    'middle_flip_splits_orbitals': split,
    'witness_changed_primitive_edge_orbitals': int(np.count_nonzero(pre != post)),
    'witness_counts_equal': True,
    'physical_ARFs': 'not derived',
    'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING'
}, indent=2, sort_keys=True))
