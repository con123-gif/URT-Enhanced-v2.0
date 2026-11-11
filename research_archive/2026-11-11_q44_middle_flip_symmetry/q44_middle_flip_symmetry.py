#!/usr/bin/env python3
"""Q44 (Claude): the Q43 eight-character support is forced by three native symmetries.

Does not import GPT's Q42/Q43 scripts; imports the original Q28 (hence Q3) source,
Git-blob pinned.  Exact integer arithmetic only; nothing is fitted.

Setting (as in Q42/Q43).  Unsigned axis order o, sign mask s in F2^6 (bit i = digit i):
code_{o,s}(h) = XOR_i (bit_i(h) XOR s_i) << o_i.  X_{o,s} = transported primitive Q2,
c_O(o,s) = number of its 128 edges in A5 orbital O (80 orbitals), and
E_o(s) = sum_O (c_O(o,s) - c_O(o,s^12))^2  (the Q43 middle-flip defect).

Theorem (proved by Lemmas A-C, each checked below on its full finite domain):
  A. Q2 is the shift h -> 2h+b.  The history translations
       a(h) = h ^ (digits {0,2,4}),  b(h) = h ^ (digits {1,3,5})
     satisfy Q2[a h, b h'] = Q2[h, h'] for all h, h'  (alternation; one of the two
     assignments holds, which one is determined below), and Q2[h^63, h'^63] = Q2[h, h'].
  B. Central inversion C: x -> x^63 on codes commutes with all 60 original A5 code
     permutations; hence O -> (1xC)O and O -> (CxC)O are permutations of the 80 orbitals.
  C. From A, B: c(o, s ^ alt) = c(o, s) o (1xC)  and  c(o, s^63) = c(o, s) o (CxC)
     for every o, s (as 80-vectors, up to the fixed orbital permutations), where alt is
     the alternating mask singled out by A.  And E_o(s^12) = E_o(s) by definition.
  => E_o(s ^ v) = E_o(s) for all v in V = <12, alt, 63> = {0,12,21,25,38,42,51,63},
     i.e. the Walsh support of E_o lies in the annihilator V^perp = <15,17,34>
     = {0,15,17,30,34,45,51,60}  (Q43's H), and the zero set of E_o is a union of
     V-cosets (Q43's affine three-flats).  No orbital convolution or representation
     decomposition is needed.
Cross-checks (not part of the proof): the 12 x 64 direct census of E_o is V-invariant,
its Walsh support lies in H and spans H for every order (so V is exactly the stabiliser),
the canonical-order expansion equals Q43's, and the six zero orders/seeds equal Q43's.
"""
from __future__ import annotations
from contextlib import redirect_stdout
from io import StringIO
from itertools import permutations
from pathlib import Path
import hashlib, json, runpy, sys, time
import numpy as np

START = time.monotonic()
ROOT = Path(__file__).resolve().parents[1]
Q3 = ROOT/'2026-11-11_q3_twirled_chronology_classes'/'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'
Q28 = ROOT/'2026-11-11_q28_twirled_third_trace'/'q28_twirled_third_trace.py'

def git_blob(path):
    raw = path.read_bytes()
    return hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()

def check(cond, msg):
    if not cond:
        print('FAIL:', msg); sys.exit(1)

check(git_blob(Q3) == 'bc67d3ba72a73f08a6d2fe6c1b54ca2eadafc984', 'Q3 blob')
check(git_blob(Q28) == '6e22cb7654176c6499ee138737f4f85240619ec7', 'Q28 blob')
with redirect_stdout(StringIO()):
    ns = runpy.run_path(str(Q28))
perms, Q, bits, actions = (ns[k] for k in ('perms', 'Q', 'bits', 'actions'))
perms = [np.asarray(p, dtype=np.int64) for p in perms]
bits = np.asarray(bits, dtype=np.int64)
check(len(perms) == 60 and bits.shape == (64, 6), 'Q28 data')
for h in range(64):
    check(Q[h].sum() == 2 and Q[h, 2*h % 64] == 1 and Q[h, (2*h+1) % 64] == 1, 'primitive Q2')

# history index of a bit row
row_index = {tuple(bits[h]): h for h in range(64)}
check(len(row_index) == 64, 'bits bijective')
def digits_mask(ds):
    return sum(1 << i for i in ds)
def hist_translate(m):          # h -> h with digits in mask m flipped
    return np.array([row_index[tuple(bits[h] ^ np.array([(m >> i) & 1 for i in range(6)]))]
                     for h in range(64)], dtype=np.int64)
def preserves(ta, tb):
    return np.array_equal(Q[np.ix_(ta, tb)], Q)

# ---- Lemma A
EVEN, ODD = digits_mask((0, 2, 4)), digits_mask((1, 3, 5))     # 21, 42
check((EVEN, ODD) == (21, 42), 'masks')
tE, tO, tAll = hist_translate(EVEN), hist_translate(ODD), hist_translate(63)
A_EO, A_OE = preserves(tE, tO), preserves(tO, tE)
check(A_EO or A_OE, 'Lemma A: an alternation automorphism of Q2')
check(preserves(tAll, tAll), 'Lemma A: complement automorphism of Q2')
# head digit set alt: Q2[t_alt h, t_alt' h'] = Q2[h,h']; the pair (alt, alt') with alt^alt' = 63
ALT, ALTP = (EVEN, ODD) if A_EO else (ODD, EVEN)

# ---- Lemma B
for p in perms:
    check(np.array_equal(p[np.arange(64) ^ 63], p ^ 63), 'Lemma B: C commutes with A5')
orb = -np.ones((64, 64), dtype=np.int64)
n = 0
for u in range(64):
    for v in range(64):
        if orb[u, v] < 0:
            for p in perms:
                orb[p[u], p[v]] = n
            n += 1
check(n == 80, '80 orbitals')
ar = np.arange(64)
pi_1C = np.full(80, -1); pi_CC = np.full(80, -1)
for u in range(64):
    for v in range(64):
        for pi, (a, b) in ((pi_1C, (u, v ^ 63)), (pi_CC, (u ^ 63, v ^ 63))):
            t = orb[a, b]
            check(pi[orb[u, v]] in (-1, t), 'orbital map well defined')
            pi[orb[u, v]] = t
check(sorted(pi_1C) == list(range(80)) and sorted(pi_CC) == list(range(80)), 'orbital permutations')

# ---- Lemma C (checked on every one of the 12 x 64 signed dictionaries)
remaining = set(permutations(range(6)))
orders = []
while remaining:
    o = min(remaining)
    orbit = {tuple(a[0][i] for i in o) for a in actions}
    check(len(orbit) == 60 and orbit <= remaining, 'free A5 action on orders')
    remaining -= orbit
    orders.append(o)
check(len(orders) == 12, '12 unsigned orders')
H_, B_ = np.r_[ar, ar], np.r_[2*ar % 64, (2*ar+1) % 64]
def counts(o, s):
    code = ((bits ^ np.array([(s >> i) & 1 for i in range(6)])) << np.array(o)).sum(axis=1)
    check(sorted(code.tolist()) == list(range(64)), 'bijective code')
    return np.bincount(orb[code[H_], code[B_]], minlength=80).astype(np.int64)
C = {}
for o in orders:
    for s in range(64):
        C[o, s] = counts(o, s)
for o in orders:
    for s in range(64):
        c = C[o, s]
        # orbital of the edge under s^ALT is (1xC) of the orbital under s (relabelled by Lemma A)
        check(np.array_equal(C[o, s ^ ALT][pi_1C], c) or np.array_equal(C[o, s ^ ALT], c[pi_1C]),
              ('Lemma C alternation', o, s))
        check(np.array_equal(C[o, s ^ 63], c[pi_CC]), ('Lemma C inversion', o, s))
# pin the direction of the alternation relation
alt_dir = 'c(s^alt)[pi] = c(s)' if all(np.array_equal(C[o, s ^ ALT][pi_1C], C[o, s])
                                       for o in orders for s in range(64)) else 'c(s^alt) = c(s)[pi]'

# ---- Theorem and annihilator
V = {0}
for g in (12, ALT, 63):
    V |= {v ^ g for v in V}
V = {a ^ b for a in V for b in V}
check(V == {0, 12, 21, 25, 38, 42, 51, 63}, ('V', sorted(V)))
par = lambda x: bin(x).count('1') & 1
H = {r for r in range(64) if all(par(r & v) == 0 for v in V)}
check(H == {0, 15, 17, 30, 34, 45, 51, 60}, ('annihilator', sorted(H)))
check(H == {(a*15) ^ (b*17) ^ (c*34) for a in (0, 1) for b in (0, 1) for c in (0, 1)}, 'H = <15,17,34>')

# ---- cross-checks against the direct census (not used in the proof)
chi = np.array([[1 - 2*par(r & s) for s in range(64)] for r in range(64)], dtype=np.int64)
out = []
for o in orders:
    E = np.array([int(((C[o, s] - C[o, s ^ 12])**2).sum()) for s in range(64)], dtype=np.int64)
    for s in range(64):
        for v in V:
            check(E[s ^ v] == E[s], ('V-invariance', o, s, v))
    raw = chi @ E
    check(np.all(raw % 64 == 0), 'integral Walsh')
    coeff = {int(r): int(raw[r] // 64) for r in range(64) if raw[r]}
    check(set(coeff) <= H, ('support in H', o))
    span = {0}
    for r in coeff:
        span |= {x ^ r for x in span}
    span = {a ^ b for a in span for b in span}
    stab = {v for v in range(64) if all(E[s ^ v] == E[s] for s in range(64))}
    zeros = sorted(int(s) for s in range(64) if E[s] == 0)
    if zeros:
        check(set(zeros) == {zeros[0] ^ v for v in V}, 'zero set is one V-coset')
    out.append({'order': o, 'coeff': coeff, 'span_is_H': span == H, 'stabiliser': sorted(stab),
                'zeros': zeros, 'min_defect': int(E.min()),
                'seeds': sorted({min({s, s ^ 12, s ^ 63, s ^ 51}) for s in zeros})})
for r in out:
    check(set(r['stabiliser']) == V, ('stabiliser exactly V', r['order']))
check(out[0]['order'] == (0, 1, 2, 3, 4, 5) and
      out[0]['coeff'] == {0: 388, 17: 52, 30: 156, 34: -52, 45: -116, 51: 12}, ('Q43 canonical identity', out[0]['coeff']))
expected = {(0,1,2,3,4,5): [5,16], (0,1,2,3,5,4): [5,16], (0,1,2,5,3,4): [2,23],
            (0,1,4,2,5,3): [1,20], (0,1,4,5,2,3): [7,18], (0,1,4,5,3,2): [7,18]}
check({r['order']: r['seeds'] for r in out if r['zeros']} == expected, 'Q43 exceptional orders and seeds')
nonexc = [r['min_defect'] for r in out if not r['zeros']]
check(nonexc == [168, 192, 168, 168, 192, 168], ('Q43 minima', nonexc))

print(json.dumps({
    'task': 'Q44', 'type': 'THEOREM (symmetry explanation of Q43 support) + REVIEW AGREE on Q43 data',
    'q3_git_blob': git_blob(Q3), 'q28_git_blob': git_blob(Q28),
    'lemma_A_alternation': {'head_mask': ALT, 'tail_mask': ALTP}, 'lemma_A_complement': True,
    'lemma_B_central_inversion_commutes_with_A5': True,
    'orbital_permutations_1xC_CxC': True, 'alternation_relation': alt_dir,
    'V': sorted(V), 'H_annihilator': sorted(H),
    'stabiliser_of_E_o_equals_V_for_all_12_orders': True,
    'support_spans_H_for_orders': [r['order'] for r in out if r['span_is_H']],
    'exceptional_orders': {str(k): v for k, v in expected.items()},
    'physical_ARFs': 'not derived', 'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'elapsed_s': round(time.monotonic() - START, 2)}, indent=2, sort_keys=True))
