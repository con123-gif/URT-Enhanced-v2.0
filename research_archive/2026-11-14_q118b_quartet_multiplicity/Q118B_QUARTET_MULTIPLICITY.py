#!/usr/bin/env python3
"""Q118b: complement C on the 64 histories, and the 4x4 multiplicity matrix of the
selected Q77 A5-twirled Abar on the four-isotypic block V (two Z3 20-orbits).

Original operators only: Q77 certificate (Krawczyk enclosures t_x on the selected
dictionary D0), its native 60 A5 history permutations, Q114 exact P5 face kernel.
Exact integer/Fraction arithmetic on the midpoint bridge; the enclosure error
eta = 48*err (Q112 norm argument) is carried through every inequality.
No sympy. No fitted or measured input. Exits non-zero on any failure.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from itertools import combinations
from math import isqrt
from pathlib import Path
import runpy, sys
import numpy as np

ARCH = Path(__file__).resolve().parents[1]
with redirect_stdout(StringIO()):
    Q = runpy.run_path(str(ARCH / '2026-11-13_q77_exact_clock_split' / 'Q77_EXACT_CLOCK_SPLIT_CERTIFICATE.py'))
native = Q['G']['G']
perms = [[int(v) for v in p] for p in native['perms']]
index, ns = native['index'], native['ns']
D0 = (0, 2, 4, 6, 10, 9)
assert len(perms) == 60 and D0 in Q['RHO']
N = 64
checks = 0
def ok(cond, msg):
    global checks
    if not cond:
        print('FAIL:', msg); sys.exit(1)
    checks += 1

# ---------- exact integer matrices with a common denominator ----------
def mm(X, Y):
    Yt = list(zip(*Y))
    return [[sum(a * b for a, b in zip(r, col)) for col in Yt] for r in X]
def tr(X): return sum(X[i][i] for i in range(N))
def trprod(X, Y): return sum(X[i][j] * Y[j][i] for i in range(N) for j in range(N))
class R:  # rational matrix = integer matrix / den
    def __init__(s, M, den): s.M, s.den = M, den
    def __matmul__(s, o): return R(mm(s.M, o.M), s.den * o.den)
    def __add__(s, o):
        return R([[a * o.den + b * s.den for a, b in zip(r, q)] for r, q in zip(s.M, o.M)], s.den * o.den)
    def scale(s, f):
        f = Fr(f); return R([[a * f.numerator for a in r] for r in s.M], s.den * f.denominator)
    def eq(s, o): return all(a * o.den == b * s.den for r, q in zip(s.M, o.M) for a, b in zip(r, q))
    def zero(s): return all(a == 0 for r in s.M for a in r)
    def tr(s): return Fr(tr(s.M), s.den)
I = R([[int(i == j) for j in range(N)] for i in range(N)], 1)
Z = R([[0] * N for _ in range(N)], 1)

def order(p):
    k, q = 1, p[:]
    while q != list(range(N)): q = [p[v] for v in q]; k += 1
    return k
ords = [order(p) for p in perms]
chars = {'1': {1: 1, 2: 1, 3: 1, 5: 1}, '3+3p': {1: 6, 2: -2, 3: 0, 5: 1},
         '4': {1: 4, 2: 0, 3: 1, 5: -1}, '5': {1: 5, 2: 1, 3: -1, 5: 0}}
dims = {'1': 1, '3+3p': 3, '4': 4, '5': 5}
Pi = {}
for k in chars:
    M = [[0] * N for _ in range(N)]
    for p, o in zip(perms, ords):
        for i in range(N): M[p[i]][i] += dims[k] * chars[k][o]
    Pi[k] = R(M, 60)
ok(sum((Pi[k] for k in Pi), Z).eq(I), 'central projectors sum to I')
for k in Pi: ok((Pi[k] @ Pi[k]).eq(Pi[k]), 'idempotent ' + k)
rank = {k: Pi[k].tr() for k in Pi}
ok(rank == {'1': 4, '3+3p': 24, '4': 16, '5': 20}, rank)
Cm = R([[int(i == N - 1 - j) for j in range(N)] for i in range(N)], 1)
ok(all(p[N - 1 - h] == N - 1 - p[h] for p in perms for h in range(N)), 'C commutes with A5')

# ---- Part 1: C is a scalar on every isotypic block except the four-isotypic one ----
csign = {}
for k in Pi:
    t = (Cm @ Pi[k]).tr()
    csign[k] = t / rank[k]
ok(csign['1'] == 1 and csign['3+3p'] == -1 and csign['5'] == 1 and csign['4'] == 0, csign)
# Hence for ANY A5-equivariant X: [X, C] = Pi4 [X, C] Pi4.

# orbits; the 20-orbits carry V
seen, orbs = set(), []
for h in range(N):
    if h in seen: continue
    o = sorted({p[h] for p in perms}); seen |= set(o); orbs.append(o)
ok(sorted(map(len, orbs)) == [12, 12, 20, 20], 'orbit sizes')
O20 = [o for o in orbs if len(o) == 20]
def diag(S): return R([[int(i == j and i in S) for j in range(N)] for i in range(N)], 1)
line = {}
for i, o in enumerate(O20):
    ok(set(N - 1 - h for h in o) == set(o), 'orbit closed under C')
    for e in (1, -1):
        L = (Pi['4'] @ diag(set(o)) @ (I + Cm.scale(e))).scale(Fr(1, 2))
        ok((L @ L).eq(L) and L.tr() == 4, 'line (%d,%d) rank-4 projector' % (i, e))
        line[(i, e)] = L

# Walsh projectors; Hbits
def walsh(k):
    ms = [m for m in range(N) if bin(m).count('1') == k]
    return R([[sum((-1) ** (bin(h & m).count('1') + bin(g & m).count('1')) for m in ms)
               for g in range(N)] for h in range(N)], 64)
W2, W3, W4 = walsh(2), walsh(3), walsh(4)
Hb = [[15 * (i == j) for j in range(N)] for i in range(N)]
for a, b in combinations(range(6), 2):
    m = (1 << a) | (1 << b)
    for h in range(N): Hb[h][h ^ m] -= 1
Hb = R(Hb, 1)

# G5 from the original U_h / Q114 distance kernel, exactly
pairs, faces = ns.pairs, ns.faces
adj = {i: [j for j in range(20) if len(set(faces[i]) & set(faces[j])) == 2] for i in range(20)}
def bfs(s):
    d = {s: 0}; fr = [s]
    while fr:
        nx_ = []
        for u in fr:
            for w in adj[u]:
                if w not in d: d[w] = d[u] + 1; nx_.append(w)
        fr = nx_
    return d
kern = {0: Fr(1, 5), 1: Fr(-2, 15), 2: Fr(1, 30), 3: Fr(1, 30), 4: Fr(-2, 15), 5: Fr(1, 5)}
dist = [bfs(i) for i in range(20)]
P5 = [[kern[dist[i][j]] * 30 for j in range(20)] for i in range(20)]   # integer / 30
Mh = [[int(set(f) <= {pairs[k][(h >> k) & 1] for k in range(6)}) for f in faces] for h in range(N)]
G5n = [[sum(Mh[h][f] * int(P5[f][g]) * Mh[k][g] for f in range(20) for g in range(20)) for k in range(N)] for h in range(N)]
G5 = R(G5n, 60)
ok((G5 @ G5).eq(G5) and G5.tr() == 4, 'G5 rank-4 projector')
ok((Pi['4'] @ W2).eq(G5), 'G5 = Pi4 W2 exactly (the Walsh-2 copy of 4)')
W4c = Pi['4'] @ W4
ok(W4c.tr() == 4 and (W4c @ W4c).eq(W4c), 'Walsh-4 copy')
ok((G5 + W4c).eq(line[(0, 1)] + line[(1, 1)]), 'C-even part of V = G5 + Walsh-4 copy')
ok((line[(0, 1)] @ G5).tr() == 2 and (line[(1, 1)] @ G5).tr() == 2, 'G5 = equal mix of the two 20-orbit C-even lines')
basis = {'G5': G5, 'W4': W4c, 'O1-': line[(0, -1)], 'O2-': line[(1, -1)]}
keys = list(basis)
ok(sum((basis[k] for k in keys), Z).eq(Pi['4']), 'adapted basis sums to Pi4')
for a, b in combinations(keys, 2): ok((basis[a] @ basis[b]).zero(), 'orthogonal ' + a + b)
hval = {'G5': 16, 'W4': 16, 'O1-': 18, 'O2-': 18}
for k in keys: ok((Hb @ basis[k]).eq(basis[k].scale(hval[k])), 'Hbits scalar on ' + k)
for k in keys: ok((Cm @ basis[k]).eq(basis[k].scale(1 if k in ('G5', 'W4') else -1)), 'C sign on ' + k)
print('Part 1 exact: C = +1 on 1 and 5, -1 on 3+3prime, traceless on 4; V = G5 + W4 + O1- + O2-;'
      ' Hbits = diag(16,16,18,18), C = diag(+,+,-,-)', flush=True)

# ---------- Part 2: the selected Q77 Abar, exact at midpoints ----------
t, err = [], Fr(0)
for x in range(32):
    lo, hi = Q['Fenc'][(x, Q['RHO'][D0][x])]
    ok(0 < lo <= hi < Fr(1, 2), 'enclosure')
    z = Fr(round((lo + hi) * 2 ** 59), 2 ** 60)
    t.append(z); err = max(err, abs(lo - z), abs(hi - z))
ok(err < Fr(1, 10 ** 14), 'enclosure width')
eta = 48 * err          # Q112: ||Abar_true - Abar_mid||_2 <= 48 err
S = 2 ** 60
Bn = [[0] * N for _ in range(N)]
for x, z in enumerate(t):
    zi = z.numerator * (S // z.denominator)
    a, b = 2 * x, 2 * x + 1
    Bn[x][a] = Bn[x + 32][b] = zi
    Bn[x][b] = Bn[x + 32][a] = S - zi
Nm = [[S * (i == j) - Bn[i][j] for j in range(N)] for i in range(N)]
Ah = mm([list(r) for r in zip(*Nm)], Nm)          # (I-B)^T (I-B) * S^2
idx = [index(h, D0) for h in range(N)]
ok(sorted(idx) == list(range(N)), 'dictionary bijection')
Y = [[0] * N for _ in range(N)]
for i in range(N):
    for j in range(N): Y[idx[i]][idx[j]] = Ah[i][j]
Ab = [[sum(Y[p[i]][p[j]] for p in perms) for j in range(N)] for i in range(N)]
A = R(Ab, 60 * S * S)
ok(all(Ab[i][j] == Ab[j][i] for i in range(N) for j in range(N)), 'Abar symmetric')
ok(all(Ab[p[i]][p[j]] == Ab[i][j] for p in perms for i in range(N) for j in range(N)), 'Abar A5-invariant (exact)')
comm = A @ Cm + (Cm @ A).scale(-1)
for k in ('1', '3+3p', '5'):
    ok((Pi[k] @ comm).zero(), '[Abar,C] vanishes on isotypic ' + k)
PA = {k: basis[k] @ A for k in keys}
m = {}
for k in keys:
    m[k] = PA[k].tr() / 4
    ok((PA[k] @ basis[k]).eq(basis[k].scale(m[k])), 'Schur P A P = m P on ' + k)
s = {}
for a, b in combinations(keys, 2):
    s[(a, b)] = Fr(trprod(PA[a].M, PA[b].M), PA[a].den * PA[b].den) / 4   # = M_ab^2
def sqrt_lo(q): q = Fr(q); return Fr(isqrt(q.numerator * 10 ** 60 // q.denominator), 10 ** 30)
def sqrt_hi(q): return sqrt_lo(q) + Fr(1, 10 ** 30)
print('multiplicity diagonal m =', {k: float(v) for k, v in m.items()})
print('|M_ab| =', {a + '/' + b: float(sqrt_lo(v)) for (a, b), v in s.items()}, flush=True)

# C-breaking on V: certified nonzero
even, odd = ('G5', 'W4'), ('O1-', 'O2-')
cb = sum(s[(a, b)] for a in even for b in odd)
ok(sqrt_lo(cb) - 2 * eta > 0, '[Abar,C] != 0 for the true enclosed bridge')
ok((Pi['4'] @ comm @ Pi['4']).eq(comm), '[Abar,C] = Pi4[Abar,C]Pi4')

# ---------- Part 3: residue concentration bound, all c > 0 ----------
ok(all(m['G5'] + eta < m[k] - eta for k in keys[1:]), 'G5 has the smallest Abar weight')
b2 = sum(s[('G5', k)] for k in keys[1:])            # b^2 = ||(I-P)Abar P||_F^2 / 4
b_hi = sqrt_hi(b2) + 2 * eta                         # sqrt(3) eta < 2 eta
b_lo = sqrt_lo(b2) - 2 * eta
ok(b_lo > 0, 'source leaks: b > 0 (so w1 < 1 for every c > 0)')
e_hi = sqrt_hi(2 * sum(s.values())) + 4 * eta         # ||E||_F, sqrt(12) eta < 4 eta
g1 = m['W4'] - m['G5'] - 2 * eta                     # lower bounds
godd = min(m['O1-'], m['O2-']) - m['G5'] - 2 * eta
gall = min(g1, godd)
ok(gall > e_hi, 'Weyl gap positive')
beta_all = b_hi ** 2 / (gall - e_hi) ** 2
beta_small = b_hi ** 2 / (g1 - e_hi) ** 2
cstar = 2 / (m['W4'] - m['G5'] + 2 * eta - godd)
ok(cstar > 9, 'small-c window contains (0,9]')
lim0 = (1 - float(m['W4'] - m['G5']) / np.sqrt(float(m['W4'] - m['G5']) ** 2 + 4 * float(s[('G5', 'W4')]))) / 2
print('bound: 1-w1 <= %.4e for 0<c<=9 ; <= %.4e for all c>0 ; lim_{c->0} 1-w1 = %.6e'
      % (float(beta_small), float(beta_all), lim0), flush=True)
ok(beta_small < Fr(11, 10 ** 5) and beta_all < Fr(13, 10 ** 4), 'bound values')

# float64 cross-check against the full 64x64 spectrum (controls, not derivations)
Af = np.array([[float(Fr(v, A.den)) for v in r] for r in A.M])
Hf = np.array([[float(v) for v in r] for r in Hb.M])
Gf = np.array([[v / 60. for v in r] for r in G5n])
ev, E = np.linalg.eigh(Gf); E1 = E[:, ev > .5]
for c in (1e-3, 0.1, 1.0, 2.0, 9.0, 10.0, 40 / 3, 48.0, 100.0, 1e4):
    fv, FU = np.linalg.eigh(Hf + c * Af)
    w = np.sum((FU.T @ E1) ** 2, axis=1) / 4
    w1 = w[np.abs(fv - fv[np.argmax(w > 1e-15)]) < 1e-7].sum()
    lowest = fv[w > 1e-15].min()
    ok(abs(lowest - (16 + c * float(m['G5']))) <= c * float(e_hi) + 1e-9, 'lowest source pole near 16+c m_G5')
    bound = float(beta_small) if c <= 9 else float(beta_all)
    ok(0 < 1 - w1 <= bound + 1e-12, 'concentration bound at c=%g' % c)
    if c == 1e-3: ok(abs((1 - w1) - lim0) < 1e-7, 'c->0 limit')
    print('c=%-8g lowest pole %.6f  1-w1 = %.4e  (bound %.3e)' % (c, lowest, 1 - w1, bound), flush=True)
print('Q118b QUARTET MULTIPLICITY / COMPLEMENT / CONCENTRATION: PASS (%d checks)' % checks)
