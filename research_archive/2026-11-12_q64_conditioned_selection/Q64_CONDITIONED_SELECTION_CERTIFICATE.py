#!/usr/bin/env python3
"""Q64 certificate: the maximum-likelihood reversible history of the A5-twirled chronology, conditioned
on the URT two-successor rule, is unique up to A5 x <I,R,S> and is the C3-selected lift sigma_1.

Exact integers and Fractions. Exits non-zero on failure. Nothing fitted, nothing random.
Objects: S_D = original Q3 geometric A5 twirl of the primitive two-successor Q2 (Q3 module), pulled back
to history coordinates; lifts sigma_beta, dictionaries, A5 classes, Q24 orbit ops, exceptional data:
imported by re-executing the Q61 certificate.

Principle (stated, not derived): K_D = S_D/120 is the A5-covariant chronology of dictionary D. Condition
it on the URT successor rule h -> {2h, 2h+1}: p_D(h -> k) = S_D[h,k] / (S_D[h,2h] + S_D[h,2h+1]).
The likelihood of a reversible history sigma (a lift of Q) is L(D, sigma) = prod_h p_D(h -> sigma(h)).
Maximise over all 46,080 dictionaries and all 2^32 lifts.
"""
from fractions import Fraction as Fr
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import math, runpy, sys, time
import numpy as np

t0 = time.time()
ARCH = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ARCH / '2026-11-11_q24_history_symmetries'))
with redirect_stdout(StringIO()):
    import native_source_nosympy as ns
    q61 = runpy.run_path(str(ARCH / '2026-11-12_q61_inverse_limit_lifts' / 'Q61_INVERSE_LIMIT_LIFTS_CERTIFICATE.py'))
    q3 = runpy.run_path(str(ARCH / '2026-11-11_q3_twirled_chronology_classes' / 'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'))
G = q61
exc, orbits, index, sigma, classes = G['exc'], G['orbits'], G['index'], G['sigma'], G['classes']
ops8, clsof, beta_of = G['ops8'], G['clsof'], G['beta_of']
Id, Rd, Sd, Iact, Ract, Sact = G['Id'], G['Rd'], G['Sd'], G['Iact'], G['Ract'], G['Sact']
N = 64

def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)

perms = [np.array(p) for p in q3['geometric_a5_on_codes']()]
check(len(perms) == 60, 'Q3 A5 code action')
Q2 = np.zeros((N, N), dtype=np.int64)
for h in range(N): Q2[h, 2*h % 64] = Q2[h, (2*h + 1) % 64] = 1
def S_hist(D):
    idx = [index(h, D) for h in range(N)]
    inv = np.empty(N, dtype=np.int64); inv[np.array(idx)] = np.arange(N)
    X = Q2[np.ix_(inv, inv)]; S = np.zeros((N, N), dtype=np.int64)
    for p in perms: S += X[np.ix_(p, p)]
    check(np.all(S.sum(axis=1) == 120), 'S_D row sums 120')
    return S[np.ix_(idx, idx)]          # history coordinates
SH = {D: S_hist(D) for D in classes}

# each bit beta_x fixes sigma(x) = 2x + b and sigma(x+32) = 2x + 1 - b: every objective below is a product
# or sum of independent per-bit factors, so the maximum over all 2^32 lifts is exact bitwise.
def optimise(S, factor, one, combine):
    tot, beta, ties = one, 0, 0
    for x in range(32):
        v = [factor(S, x, b) for b in (0, 1)]
        tot = combine(tot, max(v)); ties += v[0] == v[1]; beta |= (v[1] > v[0]) << x
    return tot, beta, ties
def cond(S, x, b):
    base = (2*x) % 64
    d1 = int(S[x, base] + S[x, base | 1]); d2 = int(S[x+32, base] + S[x+32, base | 1])
    check(d1 > 0 and d2 > 0, 'every history has twirled weight on its URT successors')
    return Fr(int(S[x, base | b]), d1) * Fr(int(S[x+32, base | (1 ^ b)]), d2)
def lin(S, x, b):
    base = (2*x) % 64; return int(S[x, base | b]) + int(S[x+32, base | (1 ^ b)])
def raw(S, x, b):
    base = (2*x) % 64; return int(S[x, base | b]) * int(S[x+32, base | (1 ^ b)])
mul = lambda a, c: a * c; add = lambda a, c: a + c
orbit_of = {}
for oi, (o, bs) in enumerate(sorted(orbits.items(), key=lambda kv: min(kv[0]))):
    for D in o: orbit_of[D] = oi

def winners(fn, one, combine):
    res = {D: optimise(SH[D], fn, one, combine) for D in classes}
    vals = sorted({r[0] for r in res.values()}, reverse=True)
    return res, vals, [D for D in classes if res[D][0] == vals[0]]

report = {}
# ---- main result: conditioned likelihood
res, vals, W = winners(cond, Fr(1), mul)
check(len(W) == 8, 'maximum attained on exactly 8 of the 768 A5 classes')
orb = {frozenset(clsof(op(D)) for op in ops8) for D in W}
check(len(orb) == 1 and next(iter(orb)) == set(W), 'the 8 classes are one Q24 orbit')
check(all(res[D][2] == 0 for D in W), 'no tied bit: the maximising lift is unique on each class')
check({res[D][1] for D in W} == {0xffffffff}, 'maximising lift is sigma_1 (beta = 1)')
check(all(D in exc and exc[D][2] == 0xffffffff for D in W), 'it is the C3-selected lift of an exceptional orbit (Q61)')
for D in W:
    s = sigma(res[D][1])
    for dop, lop in ((Id, Iact), (Rd, Ract), (Sd, Sact)):
        D2 = clsof(dop(D)); check(D2 in W and beta_of(lop(s)) == res[D2][1], 'I,R,S-covariance of the maximiser')
check(vals[0] / vals[1] > 4, 'margin over the runner-up')
second = [D for D in classes if res[D][0] == vals[1]]
check({orbit_of.get(D) for D in second} == {3} and {res[D][1] for D in second} == {0xffffffff}, 'runner-up orbit')
report['maximum likelihood L*'] = f'{vals[0]} ~ {float(vals[0]):.6e}'
report['runner-up / ratio'] = f'{float(vals[1]):.6e} / {float(vals[0]/vals[1]):.6f}'
report['maximiser'] = f'one Q24 orbit (8 A5 classes, Q62 orbit {orbit_of[W[0]]}), lift sigma_1 unique, A5 x <I,R,S>-covariant'
report['maximiser classes'] = sorted(W)

# ---- independent corroboration: on this orbit (and on no other exceptional orbit) sigma_1 preserves the
# 40-word support of im U_h (Q62 C3); the support is the set of axis words containing exactly 1 or 4 faces.
pairs, faces = ns.pairs, ns.faces
supp = {y for y in range(N) if sum(set(f) <= {pairs[i][(y >> i) & 1] for i in range(6)} for f in faces) in (1, 4)}
check(len(supp) == 40, 'U_h support 40 words')
keep = {}
for D, (b,) in ((D, tuple({exc[D][2]})) for D in exc):
    idx = [index(h, D) for h in range(N)]; s = sigma(b)
    keep[D] = all((idx[h] in supp) == (idx[s[h]] in supp) for h in range(N))
check({D for D in exc if keep[D]} == set(W), 'U_h support kept by the C3 lift exactly on the maximising orbit')
report['corroboration'] = 'the maximising orbit is the unique exceptional orbit where sigma_1 keeps the im U_h support'

# ---- the two unconditioned objectives disagree (recorded so they are not retried as the principle)
rl, vl, Wl = winners(lin, 0, add)
check(vl[0] == 568 and {orbit_of.get(D) for D in Wl} == {5} and {hex(rl[D][1]) for D in Wl} == {'0xffee77ff', '0xbbffffdd'},
      'linear Q3 overlap: orbit 5, non-C3 lifts')
rr, vr, Wr = winners(raw, 1, mul)
check(len(Wr) == 16 and {orbit_of.get(D) for D in Wr} == {3, 5} and {rr[D][1] for D in Wr} == {0xffffffff},
      'unconditioned likelihood: tie between orbits 3 and 5')
report['linear overlap (unconditioned)'] = 'max 568 on orbit 5, lifts 0xffee77ff / 0xbbffffdd (not C3)'
report['raw likelihood (unconditioned)'] = 'tie: orbits 3 and 5, sigma_1 (identical weights on every sigma_1 cycle)'

for k, v in report.items(): print(f'{k}: {v}')
print(f'Q64 certificate: all assertions passed in {time.time() - t0:.1f} s')
