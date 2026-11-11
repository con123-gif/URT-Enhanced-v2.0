#!/usr/bin/env python3
"""Q40 REVIEW (Claude) of GPT's Q40, plus the operator-equality strengthening that answers Q41.

Does not import GPT's Q40 script; imports the original Q28 (hence Q3) source.

Operators: the unchanged original Q3 geometric A5 code permutations and the
Q28 canonical signed-dictionary construction (Git-blob pinned), the primitive
two-successor Q2 (code variable `Q`: Q[h,2h]=Q[h,2h+1]=1 mod 64) and the
unnormalised twirl S_D[i,j] = sum_{g in A5} X_D[g(i), g(j)], X_D = D Q2 D^-1.
"Q2" in the Q39/Q40 text is this primitive Q; Q2^k is its k-th matrix power.
Everything is integer arithmetic with proved int64 bounds; nothing is fitted.

Proves (exit 0 only if all hold):
  (1) On Q39's 108 cross-orbit equal-signature pairs of inversion classes,
      Tr(S Q2^3) splits 73, Tr(S^2 Q2) splits 93, jointly 96; 12 survive.
  (2) Each of the 12 survivors is a FULL operator equality S_D = S_E between
      different Q24 eight-orbits, with E = D with the signs at digits 2 and 3
      flipped; the orbit pairs are {2,58}, {6,62}, {41,81} (Q28 numbering),
      four inversion classes each.  Hence no invariant of (S_D, Q2) separates
      them, at any order; in particular Q41's Tr(S Q2^4), Tr(S^2 Q2^2) agree
      (computed explicitly below).
  (3) Lemma: S_D[i,j] = (60/|O_ij|) * #{(u,v) in O_ij : X_D[u,v] = 1} over
      the A5 orbitals O (80 of them); the 12 coincidences are equalities of
      the 80-component orbital edge-count vectors.
  (4) Consequently the four traces (Tr S Q2, Tr S Q2^2, Tr S Q2^3, Tr S^2 Q2)
      are a complete invariant of the twirled operator on all 46,080 signed
      dictionaries: exactly 372 distinct operators S_D, 384 inversion classes.
"""
from __future__ import annotations
from collections import Counter, defaultdict
from contextlib import redirect_stdout
from io import StringIO
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
perms, Q, bits, reps, eight, inv, act, actions = (
    ns[k] for k in ('perms', 'Q', 'bits', 'reps', 'eight', 'inv', 'act', 'actions'))
check(len(perms) == 60 and len(reps) == 96, 'Q28 data')
for h in range(64):
    check(Q[h].sum() == 2 and Q[h, 2*h % 64] == 1 and Q[h, (2*h+1) % 64] == 1, 'primitive Q2')
Q_2 = Q @ Q
Q_3 = Q_2 @ Q
# Bounds: S row sums 120, Q2^k row sums 2^k, so Tr(S Q2^3) <= 64*120*8 and
# Tr(S^2 Q2) <= 64*120^2*2, both far below 2^63.
check(64*120**2*4 < 2**62, 'int64 bound (Tr S^2 Q2^2 <= 64*120^2*4)')

def code_map(D):
    code = ((bits ^ np.array([x & 1 for x in D], dtype=np.int64)) <<
            np.array([x//2 for x in D], dtype=np.int64)).sum(axis=1)
    check(sorted(code.tolist()) == list(range(64)), 'dictionary bijective')
    inverse = np.empty(64, dtype=np.int64); inverse[code] = np.arange(64)
    return inverse

def X_of(D):
    inverse = code_map(D)
    return Q[np.ix_(inverse, inverse)]

def twirl(D):
    X = X_of(D)
    S = np.zeros((64, 64), dtype=np.int64)
    for p in perms:
        S += X[np.ix_(p, p)]
    check(np.all(S.sum(axis=0) == 120) and np.all(S.sum(axis=1) == 120), 'S stochastic x120')
    return S

def sig4(S):
    SS = S @ S
    out = (int(np.sum(S*Q.T)), int(np.sum(S*Q_2.T)), int(np.sum(S*Q_3.T)), int(np.sum(SS*Q.T)))
    return out

# --- inversion classes: one representative per {d, I(d)} in every eight-orbit
classes = []
for k, D in enumerate(reps):
    seen = set()
    for d in sorted(eight(D)):
        if d in seen:
            continue
        seen |= {d, inv(d)}
        classes.append((k, d))
check(len(classes) == 384, '384 inversion classes')
Smat = {}
sig = {}
for k, d in classes:
    S = twirl(d)
    check(np.array_equal(S, twirl(inv(d))), 'inversion is an operator equality')
    Smat[(k, d)] = S
    sig[(k, d)] = sig4(S)
# direct-product cross-check of the contractions on a few classes
for c in classes[:3] + classes[-3:]:
    S = Smat[c]
    check(sig[c] == (int(np.trace(S@Q)), int(np.trace(S@Q_2)), int(np.trace(S@Q_3)),
                     int(np.trace(S@S@Q))), 'contraction = trace')

# --- (1) Q39 collisions and their refinement
by2 = defaultdict(list)
for c in classes:
    by2[sig[c][:2]].append(c)
check(len(by2) == 297, 'Q39: 297 global signatures')
pairs = [(a, b) for v in by2.values() for i, a in enumerate(v) for b in v[i+1:]]
check(len(pairs) == 108 and all(a[0] != b[0] for a, b in pairs), 'Q39: 108 cross-orbit pairs')
split3 = sum(sig[a][2] != sig[b][2] for a, b in pairs)
splitSS = sum(sig[a][3] != sig[b][3] for a, b in pairs)
survivors = [(a, b) for a, b in pairs if sig[a] == sig[b]]
check((split3, splitSS, 108-len(survivors)) == (73, 93, 96), ('refinement counts', split3, splitSS, len(survivors)))
check(len(survivors) == 12, '12 survivors')
first_split = next(({'D': list(a[1]), 'E': list(b[1]), 'orbits': [a[0], b[0]],
                     'sig_D': list(sig[a]), 'sig_E': list(sig[b])}
                    for a, b in pairs if sig[a] != sig[b]), None)

# --- (2) survivors are full operator equalities, by a middle-digit sign flip
def mid(D):
    return tuple(x ^ (1 if i in (2, 3) else 0) for i, x in enumerate(D))
Q_4 = Q_3 @ Q
orbit_pairs = Counter()
q41 = []
for a, b in survivors:
    A, B = Smat[a], Smat[b]
    ta = (int(np.sum(A*Q_4.T)), int(np.sum((A@A)*Q_2.T)))
    tb = (int(np.sum(B*Q_4.T)), int(np.sum((B@B)*Q_2.T)))
    check(ta == tb, 'Q41 traces agree')
    q41.append(ta)
    check(np.array_equal(Smat[a], Smat[b]), ('full operator equality', a, b))
    check(b[1] in (mid(a[1]), mid(inv(a[1]))), ('middle flip relation', a, b))
    orbit_pairs[tuple(sorted((a[0], b[0])))] += 1
check(orbit_pairs == Counter({(2, 58): 4, (6, 62): 4, (41, 81): 4}), orbit_pairs)

# --- (4) completeness: distinct operators = distinct 4-signatures = 372
distinct_ops = {Smat[c].tobytes() for c in classes}
distinct_sig = set(sig.values())
check(len(distinct_ops) == 372 and len(distinct_sig) == 372, (len(distinct_ops), len(distinct_sig)))
op_to_sig = {}
for c in classes:
    op_to_sig.setdefault(Smat[c].tobytes(), set()).add(sig[c])
check(all(len(v) == 1 for v in op_to_sig.values()), 'sig is a function of S')
# every one of the 46,080 dictionaries lies in an A5 orbit of an image of a rep,
# and S is A5-transport invariant (checked on samples here; Q39 checks 180)
for k, d in (classes[0], classes[200], classes[-1]):
    for a in actions[::7]:
        check(np.array_equal(twirl(act(d, a)), Smat[(k, d)]), 'A5 transport invariance')

# --- (3) orbital lemma
orb_id = -np.ones((64, 64), dtype=np.int64)
n_orb = 0
for i in range(64):
    for j in range(64):
        if orb_id[i, j] < 0:
            for p in perms:
                orb_id[p[i], p[j]] = n_orb   # orbit of (i,j) under the 60 code permutations
            n_orb += 1
# orbit closure check: orb_id constant on each orbit
for p in perms:
    check(np.array_equal(orb_id[np.ix_(p, p)], orb_id), 'orbitals A5-stable')
size = np.bincount(orb_id.ravel(), minlength=n_orb)
check(n_orb == 80, ('80 orbitals', n_orb))
def orbital_counts(d):
    X = X_of(d)
    return np.bincount(orb_id.ravel(), weights=X.ravel(), minlength=n_orb).astype(np.int64)
for c in classes[:4] + [a for a, _ in survivors[:2]]:
    cnt = orbital_counts(c[1])
    lhs = Smat[c] * size[orb_id]
    check(np.array_equal(lhs, 60 * cnt[orb_id]), 'orbital lemma')
for a, b in survivors:
    check(np.array_equal(orbital_counts(a[1]), orbital_counts(b[1])), 'orbital count vectors equal')

w = survivors[0]
result = {
    'task': 'Q40 review + Q41', 'review_verdict': 'AGREE',
    'q41_traces_TrSQ2^4_TrS^2Q2^2_on_12_survivors': q41, 'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'q3_git_blob': git_blob(Q3), 'q28_git_blob': git_blob(Q28),
    'cross_orbit_pairs': len(pairs),
    'split_by_TrSQ2cubed': split3, 'split_by_TrS2Q2': splitSS,
    'split_jointly': 108 - len(survivors), 'survivors': len(survivors),
    'survivors_are_full_operator_equalities': True,
    'survivor_relation': 'E = D with signs flipped at digits 2 and 3',
    'survivor_orbit_pairs_Q28_index': {str(k): v for k, v in sorted(orbit_pairs.items())},
    'distinct_twirled_operators': len(distinct_ops),
    'inversion_classes': len(classes),
    'four_trace_signature_complete': True,
    'A5_orbitals': n_orb,
    'first_split_witness': first_split,
    'survivor_witness': {'D': list(w[0][1]), 'E': list(w[1][1]), 'orbits': [w[0][0], w[1][0]],
                         'signature': list(sig[w[0]])},
    'physical_ARFs': 'not derived',
    'elapsed_s': round(time.monotonic() - START, 3)}
print(json.dumps(result, indent=2, sort_keys=True))
