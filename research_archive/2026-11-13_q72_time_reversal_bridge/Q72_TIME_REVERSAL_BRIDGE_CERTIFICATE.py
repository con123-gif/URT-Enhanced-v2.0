#!/usr/bin/env python3
"""Q72 certificate (ACTIVE PROBLEM A, attempt A2b): which conditioning of the native Q3 chronology is the
one a reversible history must be scored against?  Exits non-zero on failure; nothing fitted, nothing random.

Objects (all original, imported by re-executing the Q64 certificate): S_D = Q3 A5 twirl of the primitive
two-successor Q2 in history coordinates, the 768 A5 dictionary classes, the Q24 operations (I, R, S),
the bit-reversal permutation R_g of the 64 histories, the lifts sigma_beta of Q.

M_D = S_D restricted to the URT graph h -> {2h, 2h+1}.  The rows {x, x+32} and columns {2x, 2x+1} form 32
disjoint positive 2x2 blocks [[a,b],[c,d]].  The Gibbs-conditioning family of K_D = S_D/120 on URT
admissibility is F_D = {diag(r) M_D diag(c) stochastic, r, c > 0}; it contains the one-step (Q64) chain
(c = 1), every n-step chain (c = u_{n-1}), the Doob chain (c = Perron vector) and the bridge.

Part 1 (exact): S_{R(D)} = R_g S_D^T R_g on all 768 classes; R is the exact time reversal of the chronology.
Part 2 (exact): the Q64 functional is not R-invariant: L_row o R = L_col = raw / prod(column sums) and
               L_row != L_col on 640 of 768 classes; its maximiser set is R-closed (both peak on orbit 1).
Part 3 (exact): every stochastic member of F_D that also preserves the uniform measure (the invariant
               measure of Q2/2, of K_D and of every lift) is the bridge, block-wise [[t,1-t],[1-t,t]],
               t^2/(1-t)^2 = ad/bc; the bridge is R-covariant.  The one-step and n-step chains (n = 1..30)
               preserve the uniform measure on no class.
Part 4 (float64, margin): the Doob chain's stationary measure is non-uniform on every class.
Part 5 (exact): the R-symmetrised Q64 functional L_row * L_col is uniquely maximised on orbit 1 with sigma_1.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import runpy, time
import numpy as np

t0 = time.time()
HERE = Path(__file__).resolve().parent
with redirect_stdout(StringIO()):
    G = runpy.run_path(str(HERE.parent / '2026-11-12_q64_conditioned_selection' / 'Q64_CONDITIONED_SELECTION_CERTIFICATE.py'))
SH, classes, orbit_of, W64 = G['SH'], G['classes'], G['orbit_of'], set(G['W'])
q61 = G['G']
Rd, clsof, sigma, Ract, Rg = q61['Rd'], q61['clsof'], q61['sigma'], q61['Ract'], q61['Rg']
N = 64
def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)
Rp = np.array(Rg)
check(sorted(Rg) == list(range(N)) and all(Rg[Rg[h]] == h for h in range(N)), 'R_g is an involution of the 64 histories')
edges = {(h, (2*h + b) % N) for h in range(N) for b in (0, 1)}
check({(Rg[k], Rg[h]) for h, k in edges} == edges, 'R_g reverses the URT graph (R Q R = Q^T)')
report = {}

# ---- Part 1: R is exact time reversal of the native chronology
for D in classes:
    S = SH[D]
    check(set(S.sum(axis=0)) == {120} and set(S.sum(axis=1)) == {120}, 'K_D doubly stochastic (uniform invariant)')
    check(np.array_equal(SH[clsof(Rd(D))], S.T[np.ix_(Rp, Rp)]), 'S_{R(D)} = R S_D^T R')
report['Part 1'] = 'S_{R(D)} = R_g S_D^T R_g exactly on all 768 classes; K_D doubly stochastic'

def blocks(S):
    return [(int(S[x, 2*x % N]), int(S[x, 2*x % N | 1]), int(S[x+32, 2*x % N]), int(S[x+32, 2*x % N | 1])) for x in range(32)]
BL = {D: blocks(SH[D]) for D in classes}

def L_row(D, s):
    S = SH[D]; v = Fr(1)
    for h in range(N): v *= Fr(int(S[h, s[h]]), int(S[h, 2*h % N] + S[h, (2*h + 1) % N]))
    return v
def L_col(D, s):
    S = SH[D]; v = Fr(1)
    for h in range(N):
        k = s[h]; p = k >> 1
        v *= Fr(int(S[h, k]), int(S[p, k] + S[p + 32, k]))
    return v
def raw(D, s):
    S = SH[D]; v = 1
    for h in range(N): v *= int(S[h, s[h]])
    return v

# ---- Part 2: the Q64 (forward one-step) functional under R
test_betas = (0, 0xffffffff, 0x0f0f0f0f, 0x5a5a5a5a, 0x13579bdf)
for D in classes:
    D2 = clsof(Rd(D)); colprod = 1
    for k in range(N):
        p = k >> 1; colprod *= int(SH[D][p, k] + SH[D][p + 32, k])
    for b in test_betas:
        s = sigma(b); s2 = Ract(s)
        check(sorted(s2) == list(range(N)) and all(s2[h] in ((2*h) % N, (2*h + 1) % N) for h in range(N)), 'R maps lifts to lifts')
        check(L_row(D2, s2) == L_col(D, s), 'L_row(R(D,sigma)) = L_col(D,sigma)')
        check(L_col(D, s) == Fr(raw(D, s), colprod), 'L_col = raw / prod column sums')
best_row, best_col, best_sym = {}, {}, {}
for D in classes:
    r = c = Fr(1)
    for (a, b, cc, d) in BL[D]:
        m = max(a*d, b*cc); r *= Fr(m, (a + b)*(cc + d)); c *= Fr(m, (a + cc)*(b + d))
    best_row[D], best_col[D], best_sym[D] = r, c, r*c
ndiff = sum(best_row[D] != best_col[D] for D in classes)
check(ndiff == 640, 'L_row and L_col differ (max over lifts) on 640 of 768 classes')
def top(score):
    vals = sorted(set(score.values()), reverse=True)
    return {D for D in classes if score[D] == vals[0]}, vals
for sc in (best_row, best_col):
    Wt, v = top(sc); check(Wt == W64, 'forward and backward one-step functionals both peak on the Q64 orbit')
check(all(best_row[D] == best_col[D] for D in W64), 'on the Q64 orbit L_row = L_col')
report['Part 2'] = ('Q64 functional is not R-invariant: L_row o R = L_col = raw/prod(col sums), differing on 640/768 classes; '
                    'both peak on the Q64 orbit, where they agree')

# ---- Part 3: uniform-preserving members of the family = the bridge; finite-horizon chains are excluded
for D in classes:
    for (a, b, c, d) in BL[D]:
        check(min(a, b, c, d) > 0, 'positive 2x2 blocks')
        # a doubly stochastic scaling [[ra x, rb y],[sc x, sd y]] with all row/col sums 1 forces the form
        # [[t,1-t],[1-t,t]] and t^2/(1-t)^2 = (a d)/(b c) (cross ratio is scaling-invariant): unique t in (0,1).
# R-covariance of the bridge: the cross ratio of an edge's block, read from the edge, is preserved under R
def own_other(D, h, k):
    S = SH[D]; h2 = h ^ 32; k2 = k ^ 1
    return int(S[h, k]) * int(S[h2, k2]), int(S[h, k2]) * int(S[h2, k])
for D in classes:
    D2 = clsof(Rd(D))
    for h, k in edges:
        check(own_other(D2, Rg[k], Rg[h]) == own_other(D, h, k), 'bridge(R D) = R bridge(D)^T R')
report['Part 3a'] = 'bridge unique in the family under uniform preservation (block cross ratio); R-covariant on all 768 classes'
Mi = {}
for D in classes:
    S = SH[D]; M = np.zeros((N, N), dtype=object)
    for h, k in edges: M[h, k] = int(S[h, k])
    Mi[D] = M
NMAX = 30
for D in classes:
    M = Mi[D]; u_prev = [1]*N
    for n in range(1, NMAX + 1):
        u = [sum(M[h, k]*u_prev[k] for k in ((2*h) % N, (2*h + 1) % N)) for h in range(N)]
        col = [Fr(0)]*N
        for h, k in edges: col[k] += Fr(M[h, k]*u_prev[k], u[h])
        check(any(cs != 1 for cs in col), f'n-step chain n={n} is not uniform-preserving')
        u_prev = u
report['Part 3b'] = f'the n-step admissibility chains (n = 1..{NMAX}) preserve the uniform measure on no class (exact)'

# ---- Part 4: Doob chain stationary measure (float64; margin far above round-off)
mins = []
for D in classes:
    M = Mi[D].astype(float)
    w, V = np.linalg.eig(M); i = int(np.argmax(w.real)); lam = w[i].real; u = np.abs(V[:, i].real)
    w2, V2 = np.linalg.eig(M.T); j = int(np.argmax(w2.real)); ul = np.abs(V2[:, j].real)
    check(abs(w2[j].real - lam) < 1e-9 and np.linalg.norm(M @ u - lam*u) < 1e-9*np.linalg.norm(u)
          and np.linalg.norm(M.T @ ul - lam*ul) < 1e-9*np.linalg.norm(ul), 'Perron vectors')
    pi = u*ul; pi /= pi.sum()
    mins.append(float(np.max(np.abs(N*pi - 1))))
check(min(mins) > 0.5, 'Doob stationary measure non-uniform on every class')
report['Part 4'] = f'Doob chain: min over classes of max_h |64 pi_h - 1| = {min(mins):.4f} (float64; uniform would be 0)'

# ---- Part 5: R-symmetrised one-step functional
Ws, vs = top(best_sym)
check(Ws == W64, 'L_row * L_col maximised on the Q64 orbit')
check(vs[0] / vs[1] > 20, 'margin of the symmetrised functional')
lifts = set()
for D in Ws:
    for (a, b, c, d) in BL[D]:
        check(a*d != b*c, 'no tied bit'); lifts.add(a*d > b*c)
check(lifts == {False}, 'every block takes the off-diagonal pair b, c: the lift is sigma_1 (beta = 1)')
report['Part 5'] = f'L_row*L_col: unique maximiser = Q64 orbit, lift sigma_1 unique, margin {float(vs[0]/vs[1]):.4f}'

for k, v in report.items(): print(f'{k}: {v}')
print(f'Q72 certificate: all assertions passed in {time.time() - t0:.1f} s')
