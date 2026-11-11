#!/usr/bin/env python3
"""Q30: fifth and all higher traces of the native Q3 A5-twirled chronology S_D
on the 48 Q28/Q29 residual eight-orbits.

Imports the original Q28 enumeration (which imports the original Q3 geometric A5
operator on the 64 history codes and the primitive Q2). No synthetic matrices,
no fitting, no measured inputs. Exact integer arithmetic throughout:
  * Tr S^k for k <= 8 in int64 (bound 64*120^k < 2^63, entries >= 0, row sums 120);
  * Tr S^k for k <= 64 modulo 17 primes p < 2^28 (each int64 product < 2^56, a sum
    of 64 of them < 2^62), whose product exceeds 64*120^64 >= |Tr S^k|, so equality
    mod every prime is equality over Z (CRT). Equal power sums for k = 1..64 give
    equal characteristic polynomials (Newton identities over Q), hence equal
    Tr S^k for every k >= 1.
  * Permutation conjugacies P S P^T = S' found by VF2 and then checked entrywise.
Exits non-zero on any failed assertion.
"""
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from itertools import product
from pathlib import Path
import json, runpy, time
import numpy as np
import networkx as nx
from networkx.algorithms import isomorphism as iso

t0 = time.time()
root = Path(__file__).resolve().parents[1]
q28 = root / '2026-11-11_q28_twirled_third_trace' / 'q28_twirled_third_trace.py'
assert q28.is_file(), q28
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(q28))
perms, Q, bits = (ns[x] for x in ('perms', 'Q', 'bits'))
reps, eight, alt, rev, inv = (ns[x] for x in ('reps', 'eight', 'alt', 'rev', 'inv'))
assert len(perms) == 60 and len(reps) == 96
assert np.all(Q.sum(axis=1) == 2)


def S_of(D):
    """Original Q3 twirl: S_D = sum over geometric A5 of P_a X_D P_a^T."""
    code = ((bits ^ np.array([x & 1 for x in D], dtype=np.int64)) <<
            np.array([x // 2 for x in D], dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist()) == list(range(64))
    iv = np.empty(64, dtype=np.int64)
    iv[code] = np.arange(64)
    X = Q[np.ix_(iv, iv)]
    S = np.zeros((64, 64), dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p, p)]
    assert S.min() >= 0
    assert np.all(S.sum(axis=1) == 120) and np.all(S.sum(axis=0) == 120)
    return S


def exact_traces(S, kmax=8):
    assert 64 * 120**kmax < 2**63
    P = np.eye(64, dtype=np.int64)
    out = []
    for _ in range(kmax):
        P = P @ S
        out.append(int(np.trace(P)))
    return out


def isprime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


primes, n = [], (1 << 28) - 1
while len(primes) < 17:
    if isprime(n):
        primes.append(n)
    n -= 2
modulus = 1
for p in primes:
    modulus *= p
assert modulus > 64 * 120**64  # |Tr S^k| <= 64*120^k for k <= 64
assert 64 * (primes[0] - 1)**2 < 2**63


def traces_mod(S, p, kmax=64):
    A = S % p
    P = np.eye(64, dtype=np.int64)
    out = []
    for _ in range(kmax):
        P = (P @ A) % p
        out.append(int(np.trace(P)) % p)
    return tuple(out)


def spectral_signature(S):
    return tuple(traces_mod(S, p) for p in primes)


def digraph(S):
    g = nx.DiGraph()
    g.add_nodes_from(range(64))
    for i, j in zip(*np.nonzero(S)):
        g.add_edge(int(i), int(j), w=int(S[i, j]))
    return g


def conjugator(A, B):
    """A permutation P with P A P^T = B (exhaustive VF2), checked entrywise; else None."""
    gm = iso.DiGraphMatcher(digraph(A), digraph(B), edge_match=lambda a, b: a['w'] == b['w'])
    if not gm.is_isomorphic():
        return None
    m = gm.mapping  # node i of A -> node m[i] of B
    perm = np.array([m[i] for i in range(64)])
    Bt = np.zeros_like(B)
    Bt[np.ix_(perm, perm)] = A
    assert np.array_equal(Bt, B)
    return perm


def word_trace(A, w):
    P = np.eye(64, dtype=np.int64)
    for x in w:
        P = P @ (A.T if x else A)
    return int(np.trace(P))


residual = []
split3 = Counter()
k5_values = set()
for D in reps:
    imgs = sorted(eight(D))
    mats = {d: S_of(d) for d in imgs}
    ex = {d: exact_traces(mats[d]) for d in imgs}
    assert len({v[1] for v in ex.values()}) == 1  # Q27: Tr S^2 constant
    k3 = len({v[2] for v in ex.values()})
    split3[k3] += 1
    if k3 != 1:
        continue
    residual.append(D)
    # Q29 reproduced, Q30 literal answer (Tr S^5) and exact k <= 8.
    assert len({tuple(v) for v in ex.values()}) == 1, D
    k5_values.add(ex[D][4])
    # All-order statement: one spectrum on all eight dictionaries.
    sig = {d: spectral_signature(mats[d]) for d in imgs}
    assert len(set(sig.values())) == 1, ('cospectrality fails', D)
assert split3 == Counter({1: 48, 2: 48}), split3
assert len(residual) == 48

# Structure of the cospectrality between D and its alternating flip S(D).
kind = Counter()
words_split = Counter()
first_word_witness = None
first_nonconj_unsplit = None
for D in residual:
    A, B = S_of(D), S_of(alt(D))
    to_B = conjugator(A, B)
    to_Bt = conjugator(A, B.T.copy())
    if to_B is not None:
        kind['conjugate_to_S_alt'] += 1
    elif to_Bt is not None:
        kind['conjugate_to_transpose_only'] += 1
    else:
        kind['cospectral_not_permutation_conjugate'] += 1
    if to_B is not None or to_Bt is not None:
        continue
    found = None
    for L in range(2, 7):
        for w in product((0, 1), repeat=L):
            a, b = word_trace(A, w), word_trace(B, w)
            if a != b:
                found = (w, a, b)
                break
        if found:
            break
    words_split[''.join('T' if x else 'S' for x in found[0]) if found else 'none_len_le_6'] += 1
    if found and first_word_witness is None:
        first_word_witness = {'D': list(D), 'S_D': list(alt(D)),
                              'word': 'Tr(' + ''.join('S^T ' if x else 'S ' for x in found[0]).strip() + ')',
                              'value_D': found[1], 'value_S_D': found[2],
                              'difference': found[1] - found[2]}
    if not found and first_nonconj_unsplit is None:
        first_nonconj_unsplit = list(D)

assert kind == Counter({'conjugate_to_S_alt': 4, 'conjugate_to_transpose_only': 18,
                        'cospectral_not_permutation_conjugate': 26}), kind
assert words_split == Counter({'SST': 6, 'none_len_le_6': 20}), words_split

result = {
    'task': 'Q30', 'native_A5_order': 60, 'history_orbits': 96,
    'residual_orbits': len(residual),
    'TrS5_S_separations': 0, 'TrS5_distinct_values_over_residual': len(k5_values),
    'all_order_trace_separations': 0,
    'proof_of_all_orders': 'Tr S^k equal for k<=64 by CRT over 17 primes '
                           f'(modulus {modulus.bit_length()} bits > 64*120^64) => equal char. polynomial',
    'D_vs_SD_structure': dict(kind),
    'mixed_word_splits_on_26_nonconjugate': dict(words_split),
    'first_mixed_word_witness': first_word_witness,
    'first_nonconjugate_orbit_unsplit_by_words_le_6': first_nonconj_unsplit,
    'integer_exact': True, 'physical_ARFs': 'not derived',
    'seconds': round(time.time() - t0, 2),
}
print(json.dumps(result, indent=2, sort_keys=True))
