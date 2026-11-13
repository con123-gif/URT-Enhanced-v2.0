#!/usr/bin/env python3
"""Q82 certificate (ACTIVE PROBLEM A, attempt A3 on the oriented selection).  Exits non-zero on failure.
Nothing fitted, nothing random.  Exact integers / Fractions / Q(sqrt5) except where a line says float64.

Original objects
  * S_D, the 768 A5 dictionary classes, the Q24 maps (ops8), the Q3 geometric A5 action on the 64 codes,
    the dictionary map index(h, D), the native icosahedron (pairs, faces): re-executed Q73 -> Q64 -> Q61/Q3.
  * The 88 joint history x 24-clock pieces and the exact Ulam coupling pi0 of u -> 2u (Q73 Part 1).
  * The 2026-11-10 definition of the source weights (4,2,2,0)
    (`2026-11-10_urt_arf_forward/new_gate/URT_NATIVE_QUARTET_SOURCE_WEIGHTS_2026_11_10.md`):
    Kbar = H + Abar, H = 15I - sum_{i<j} X_i X_j (X_i = flip of code bit i), A = (I-Q)^T (I-Q),
    Abar = (1/60) sum_g R_g A R_g^T, weights tr(P_lambda U_h P_s U_h^T) on the four A5 quartet branches.
    The "A5 chronology coefficient" is the c of the family H + c Abar (that note: c = 1 is a choice).

Part 1 (Q82 as queued: forward-minus-reverse joint clock bridge, D0 against R D0)
  1a exact  : the clock translation u -> u + 1/4 maps URT block x onto block x+16 (row pieces shifted by 6 bins,
              column pieces by 12 bins) with identical Lebesgue data, so F_x = F_{x+16} as functions.
  1b exact  : rho_x(D0) != rho_x(R D0) on exactly 16 blocks, M0 u (M0 + 16), M0 = {2,3,6,7,8,9,12,13}, with
              {rho_F, rho_R} = {1/9, 2/9} and the same data on x and x+16.  Unmoved blocks contribute exactly 0
              (Q77 lemma: the block bridge depends on rho_x only).
  1c        : hence the source-bin profile of B^J_D0 - B^J_RD0 on sigma_1's edges has period 6 (Fourier support
              k = 0 mod 4 of the golden-offset bins), and every k mod 4 four-bin pattern is (u, v, u, v): never a
              relabelling of (4,2,2,0).  float64: values, mixed signs (source and target bins), cycle weights.
Part 2 (exact): the (4,2,2,0) slots are Kbar's four quartet branches, so A3 is decided there:
  2a  H is a scalar on every Walsh block, so for every class and every c > 0 the branch projectors, hence the
      source weights, do not depend on c; c only moves the poles (16 + c a_2, 18 + c mu_pm, 16 + c a_4).
  2b  on the selected orbit 1 (all 8 classes, forward and reverse chronology alike) the weights are exactly
      P5: 4 on the Walsh-2 branch, P3: 2 + 2 on the two Walsh-3 branches, 0 on the Walsh-4 branch, i.e. (4,2,2,0),
      with poles 16 + 4c/3, 18 + 27c/20, 18 + 33c/20 and dark 16 + 3c/2 (c = 1: 52/3, 387/20, 393/20, 35/2).
  2c  census, all 768 classes: (4,2,2,0) holds exactly on 272 classes; the archived poles
      (266/15, 389/20, 391/20; dark 521/30) occur on 32 classes, none in orbit 1.
  2d  with the selected reversible history itself as chronology (Q -> P_sigma1 through D0) the two Walsh-3
      branches merge (one 8-fold pole), so the P3 split is undefined there: the four-pole structure needs Q.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from collections import Counter
from pathlib import Path
import runpy, time, math
import numpy as np

t0 = time.time()
ARCH = Path(__file__).resolve().parent.parent
with redirect_stdout(StringIO()):
    T = runpy.run_path(str(ARCH / '2026-11-13_q73_joint_clock_bridge' / 'Q73_JOINT_CLOCK_BRIDGE_CERTIFICATE.py'))
G = T['G']; q61 = T['q61']
SH, classes, W64 = T['SH'], T['classes'], set(T['W64'])
clsof, ops8 = q61['clsof'], q61['ops8']
pieces, pi0, P, Kq = T['pieces'], T['pi0'], T['P'], T['K']
perms, index, ns = G['perms'], G['index'], G['ns']
N = 64
D0 = (0, 2, 4, 6, 10, 9)
DR = clsof(ops8[2](D0))
def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)
report = {}

# ================================================================ Part 1a: clock translation x -> x + 16
key = {}
for i, (h, j, lo, hi) in enumerate(pieces):
    check((h, j) not in key, 'one joint piece per (cell, bin)'); key[(h, j)] = i
quarter = Kq(Fr(1, 4)); half = Kq(Fr(1, 2)); one = Kq(1)
def shifted(i, dh, dj, du):
    h, j, lo, hi = pieces[i]
    i2 = key.get(((h + dh) % N, (j + dj) % 24)); check(i2 is not None, 'shifted piece exists')
    _, _, lo2, hi2 = pieces[i2]
    d = lo2 - lo
    check(d == du or d == du - one, 'shift is a translation by du mod 1')
    check(hi2 - lo2 == hi - lo, 'shifted piece has the same Lebesgue length')
    return i2
for x in range(16):
    rows = [i for i in range(P) if pieces[i][0] in (x, x + 32)]
    edges = {(a, b): v for (a, b), v in pi0.items() if a in rows}
    img = {(shifted(a, 16, 6, quarter), shifted(b, 32, 12, half)): v for (a, b), v in edges.items()}
    rows2 = [i for i in range(P) if pieces[i][0] in (x + 16, x + 48)]
    edges2 = {(a, b): v for (a, b), v in pi0.items() if a in rows2}
    check(img == edges2, f'block {x} maps onto block {x+16} with identical exact pi0 (Q(sqrt5))')
report['1a'] = 'u -> u+1/4 maps every URT block x onto x+16 exactly (rows +6 bins, columns +12 bins): F_x = F_{x+16}'

# ================================================================ Part 1b: where D0 and R D0 differ
def rho(S, x):
    a, b, c, d = int(S[x, 2*x]), int(S[x, 2*x+1]), int(S[x+32, 2*x]), int(S[x+32, 2*x+1])
    return Fr(a * d, b * c)
rF = [rho(SH[D0], x) for x in range(32)]; rR = [rho(SH[DR], x) for x in range(32)]
moved = [x for x in range(32) if rF[x] != rR[x]]
M0 = [2, 3, 6, 7, 8, 9, 12, 13]
check(moved == M0 + [x + 16 for x in M0], 'moved blocks = M0 u (M0+16)')
check(all({rF[x], rR[x]} == {Fr(1, 9), Fr(2, 9)} for x in moved), 'moved blocks swap rho 1/9 <-> 2/9')
check(all((rF[x], rR[x]) == (rF[x+16], rR[x+16]) for x in M0), 'moved data identical on x and x+16')
neg = [x for x in moved if rF[x] < rR[x]]
report['1b'] = (f'rho differs on 16 blocks {moved}; {{1/9, 2/9}} swapped; forward smaller on {neg} '
                '(t_F < t_R there); all other blocks contribute exactly 0')

# ================================================================ Part 1c: float64 resolution
E = sorted(pi0); ea, eb = np.array([a for a, b in E]), np.array([b for a, b in E])
w0 = np.array([pi0[e].f() for e in E]); muf = np.array([m.f() for m in T['mu']])
eh, ek = np.array([pieces[a][0] for a in ea]), np.array([pieces[b][0] for b in eb])
def bridge(S):
    w = w0 * S[eh, ek].astype(float); r = np.ones(P); c = np.ones(P)
    for it in range(40000):
        r = muf / np.bincount(ea, w * c[eb], P); c = muf / np.bincount(eb, w * r[ea], P)
        if it % 200 == 0:
            pi = r[ea] * w * c[eb]
            if max(abs(np.bincount(ea, pi, P) - muf).max(), abs(np.bincount(eb, pi, P) - muf).max()) < 1e-16: break
    pi = r[ea] * w * c[eb]
    res = max(abs(np.bincount(ea, pi, P) - muf).max(), abs(np.bincount(eb, pi, P) - muf).max())
    check(res < 1e-14, 'Sinkhorn residual'); return 64 * pi
pf, pr = bridge(SH[D0]), bridge(SH[DR])
sig1 = lambda h: ((2*h) % N) | (1 ^ ((h >> 5) & 1))
on = np.array([ek[i] == sig1(eh[i]) for i in range(len(E))])
jsrc = np.array([pieces[a][1] for a in ea]); jtgt = np.array([pieces[b][1] for b in eb])
dsrc = np.bincount(jsrc[on], (pf - pr)[on], 24); dtgt = np.bincount(jtgt[on], (pf - pr)[on], 24)
check(np.allclose(dsrc[:6], dsrc[6:12], atol=1e-12) and np.allclose(dsrc[:12], dsrc[12:], atol=1e-12), 'source-bin profile period 6 (1a+1b)')
F = np.abs(np.fft.fft(dsrc)) ** 2
check(all(F[k] < 1e-20 for k in range(24) if k % 4), 'Fourier support k = 0 mod 4')
m4 = [dsrc[k::4].sum() for k in range(4)]; t4 = [dtgt[k::4].sum() for k in range(4)]
check(abs(m4[0] - m4[2]) < 1e-12 and abs(m4[1] - m4[3]) < 1e-12, 'source mod-4 pattern (u, v, u, v)')
check(min(m4) < -0.03 and max(m4) > 0.09, 'source mod-4 pattern has mixed signs')
check(min(t4) < -0.1 and max(t4) > 0.2, 'target mod-4 pattern has mixed signs')
cyc, seen = [], set()
for h in range(N):
    if h in seen: continue
    c, y = [], h
    while y not in seen: seen.add(y); c.append(y); y = sig1(y)
    cyc.append(c)
check(sorted(len(c) for c in cyc) == [4, 12, 12, 12, 12, 12], 'sigma_1 cycles 4 + 5x12 (Q69)')
Bf = np.zeros((N, N)); Br = np.zeros((N, N)); np.add.at(Bf, (eh, ek), pf); np.add.at(Br, (eh, ek), pr)
ell = {h: math.log(Bf[h, sig1(h)] / Br[h, sig1(h)]) for h in range(N)}
cw = sorted(((len(c), sum(ell[h] for h in c)) for c in cyc), key=lambda t: -t[1])
check(abs(math.exp(sum(ell.values())) - 1.199147606760) < 1e-9, 'total = Q77 certified margin 1.1991476...')
check(sum(1 for _, v in cw if v < -1e-3) == 2, 'two cycle weights negative')
report['1c source bins mod 4 (float64)'] = '(' + ', '.join(f'{v:+.6f}' for v in m4) + ')  [exact form (u,v,u,v)]'
report['1c target bins mod 4 (float64)'] = '(' + ', '.join(f'{v:+.6f}' for v in t4) + ')'
report['1c sigma_1 cycle log-weights (len, float64)'] = ', '.join(f'{n}:{v:+.5f}' for n, v in cw)
report['1c verdict'] = 'no bin or cycle resolution is a non-negative four-weight pattern; (4,2,2,0) cannot appear'

# ================================================================ Part 2: the quartet branches of H + c Abar
def fmat(A): return [[Fr(v) for v in row] for row in A]
def mmul(A, B):
    Bt = list(zip(*B)); return [[sum(a * b for a, b in zip(r, c)) for c in Bt] for r in A]
def inv(A):
    n = len(A); M = [list(r) + [Fr(int(i == j)) for j in range(n)] for i, r in enumerate(A)]
    for col in range(n):
        p = next(r for r in range(col, n) if M[r][col] != 0); M[col], M[p] = M[p], M[col]
        pv = M[col][col]; M[col] = [v / pv for v in M[col]]
        for r in range(n):
            if r != col and M[r][col] != 0:
                f = M[r][col]; M[r] = [a - f * b for a, b in zip(M[r], M[col])]
    return [r[n:] for r in M]
pairs, faces = ns.pairs, ns.faces
verts = sorted({v for f in faces for v in f}); vi = {v: i for i, v in enumerate(verts)}
C = [[Fr(int(v in f)) for v in verts] for f in faces]
Ct = [list(r) for r in zip(*C)]
Ph = mmul(mmul(C, inv(mmul(Ct, C))), Ct); Ph = [[Fr(int(i == j)) - Ph[i][j] for j in range(20)] for i in range(20)]
Lf = [[Fr(3 * (i == j) - (len(set(faces[i]) & set(faces[j])) == 2)) for j in range(20)] for i in range(20)]
P3 = [[v / 2 for v in r] for r in mmul(Ph, [[5 * (i == j) - Lf[i][j] for j in range(20)] for i in range(20)])]
P5 = [[v / 2 for v in r] for r in mmul(Ph, [[Lf[i][j] - 3 * (i == j) for j in range(20)] for i in range(20)])]
Mh = [[Fr(int(set(f) <= {pairs[i][(y >> i) & 1] for i in range(6)})) for f in faces] for y in range(N)]
Mt = [list(r) for r in zip(*Mh)]
G3 = [[v / 2 for v in r] for r in mmul(mmul(Mh, P3), Mt)]      # U_h P3 U_h^T  (U_h = M Ph / sqrt2, Ph P3 Ph = P3)
G5 = [[v / 2 for v in r] for r in mmul(mmul(Mh, P5), Mt)]
check(mmul(Ph, mmul(P3, Ph)) == P3 and mmul(P3, P3) == P3 and mmul(P5, P5) == P5, 'native P3, P5 projectors')
check(sum(G3[i][i] for i in range(N)) == 4 and sum(G5[i][i] for i in range(N)) == 4, 'tr U P_s U^T = 4')
check(mmul(G3, G3) == G3 and mmul(G5, G5) == G5, 'U_h P_s U_h^T are projectors (U_h isometric on hidden)')
Hm = np.full((N, N), 0, dtype=np.int64)
for y in range(N):
    Hm[y, y] = 15
    for i in range(6):
        for j in range(i + 1, 6): Hm[y, y ^ (1 << i) ^ (1 << j)] -= 1
Rm = []
for p in perms:
    R = np.zeros((N, N), dtype=np.int64); R[np.arange(N), p] = 1; Rm.append(R)
def order(p):
    q, k = np.arange(N), 0
    while True:
        q = p[q]; k += 1
        if (q == np.arange(N)).all(): return k
chi4 = {1: 4, 2: 0, 3: 1, 5: -1}
P4x15 = sum(chi4[order(p)] * R for p, R in zip(perms, Rm))           # 15 P4
check((P4x15 @ P4x15 == 15 * P4x15).all() and np.trace(P4x15) == 15 * 16, '15 P4 central idempotent, rank 16')
wal = np.array([[(-1) ** bin(y & m).count('1') for m in range(N)] for y in range(N)], dtype=np.int64)
Pi = {k: sum(np.outer(wal[:, m], wal[:, m]) for m in range(N) if bin(m).count('1') == k) for k in range(7)}  # 64 Pi_k
Ek = {k: Pi[k] @ P4x15 for k in (2, 3, 4)}                                 # 960 E_k
for k in (2, 3, 4):
    check((Ek[k] @ Ek[k] == 960 * Ek[k]).all(), f'E_{k} idempotent')
    check((Pi[k] @ Hm == (2 * k * (6 - k)) * Pi[k]).all() and (Hm @ Pi[k] == Pi[k] @ Hm).all(), f'H = {2*k*(6-k)} on Walsh block {k}')
check([int(np.trace(Ek[k])) // 960 for k in (2, 3, 4)] == [4, 8, 4], 'quartet ranks 4, 8, 4')
check(all((R @ Hm == Hm @ R).all() for R in Rm), 'H commutes with A5')
dG = math.lcm(*[v.denominator for r in G3 + G5 for v in r])
G3n = np.array([[int(v * dG) for v in r] for r in G3], dtype=object); G5n = np.array([[int(v * dG) for v in r] for r in G5], dtype=object)
def trp(A, B): return sum(int(a) * int(b) for a, b in zip(np.asarray(A, dtype=object).ravel(), np.asarray(B, dtype=object).T.ravel()))
for k in (2, 3, 4):        # where the two sources sit (dictionary independent)
    w3, w5 = Fr(trp(Ek[k], G3n), 960 * dG), Fr(trp(Ek[k], G5n), 960 * dG)
    check((w3, w5) == {2: (0, 4), 3: (4, 0), 4: (0, 0)}[k], f'source traces on quartet block {k}')
G3E = np.array(Ek[3], dtype=object) @ G3n
check((G3E == 960 * G3n).all(), 'P3 source lies inside the Walsh-3 quartet block')

def A240(Xh2):
    """240 Abar for history-coordinate kernel Xh2 = 2X (integer), pulled to codes through the dictionary."""
    Y2 = 2 * np.eye(N, dtype=np.int64) - Xh2                              # 2(I - X)
    Y = Y2.T @ Y2                                                         # 4A
    return sum(Y[np.ix_(p, p)] for p in perms)                            # 4 * 60 Abar = 240 Abar
def code(Xh, D):
    idx = np.array([index(h, D) for h in range(N)]); Y = np.zeros((N, N), dtype=np.int64)
    Y[np.ix_(idx, idx)] = Xh; return Y
Q2i = np.zeros((N, N), dtype=np.int64)
for h in range(N): Q2i[h, (2*h) % N] = Q2i[h, (2*h + 1) % N] = 1     # = 2Q
def branches(A):
    """exact quartet data of Abar (A = 240 Abar): a2, a4 (scalars on the rank-4 blocks); on Walsh 3:
    s = tr Lambda, q = tr Lambda^2 of the 2x2 multiplicity matrix; t = tr(G3 Abar) (P3 source)."""
    sc = 960 * 240
    check(all((Pi[k] @ A == A @ Pi[k]).all() for k in range(7)), 'Abar preserves every Walsh weight block')
    check(all((R @ A == A @ R).all() for R in Rm[:12]), 'Abar commutes with A5 (generating sample)')
    a2 = Fr(trp(Ek[2], A), sc * 4); a4 = Fr(trp(Ek[4], A), sc * 4)
    M3 = Ek[3] @ A
    check(np.abs(M3).max() < 2 ** 40, 'int64 headroom')
    s = Fr(int(np.trace(M3)), sc * 4); q = Fr(trp(M3, M3), sc * sc * 4)
    t = Fr(trp(G3n, A), dG * 240)
    return a2, a4, s, q, t
def weights(a2, a4, s, q, t):
    disc = 2 * q - s * s                                                   # (mu+ - mu-)^2
    if disc == 0: return None
    # P3 weight on mu_pm: (t - 4 mu_mp)/(mu_pm - mu_mp); equal split iff t = 2s
    return t == 2 * s
data = {D: branches(A240(code(Q2i, D))) for D in classes}
# 2a: c-independence is structural (H scalar on each block, checked above); poles 16 + c a2, 18 + c mu, 16 + c a4
report['2a'] = 'H is the scalar 2k(6-k) on each Walsh block: branch projectors and source weights are c-independent'
# 2b: the selected orbit
o1 = {D: data[D] for D in W64}
check(len(set(o1.values())) == 1, 'all 8 orbit-1 classes (forward and reverse chronology) give identical quartet data')
a2, a4, s, q, t = data[D0]
r = None
for cand in (Fr(n, 20) for n in range(0, 80)):                             # exact rational roots of mu^2 - s mu + (s^2-q)/2
    if cand * cand - s * cand + (s * s - q) / 2 == 0: r = cand if r is None else r
check(r is not None, 'Walsh-3 branch values rational')
mus = sorted({r, s - r})
check((a2, a4, mus) == (Fr(4, 3), Fr(3, 2), [Fr(27, 20), Fr(33, 20)]), 'orbit-1 Abar branch values 4/3, 3/2, 27/20, 33/20')
check(weights(*data[D0]) is True, 'orbit 1: P3 splits exactly 2 + 2')
wP3 = [(t - 4 * mus[1]) / (mus[0] - mus[1]), (t - 4 * mus[0]) / (mus[1] - mus[0])]
check(wP3 == [2, 2], 'P3 weights exactly 2, 2')
check((16 + a2, 18 + mus[0], 18 + mus[1], 16 + a4) == (Fr(52, 3), Fr(387, 20), Fr(393, 20), Fr(35, 2)), 'c = 1 poles')
for z in (Fr(k, 7) for k in range(1, 12)):                                  # selected-dictionary resolvent at c = 1
    g = 4 / (z - Fr(52, 3)) + 2 / (z - Fr(387, 20)) + 2 / (z - Fr(393, 20))
    check(g == 4 * (2400 * z * z - 91000 * z + 861873) / ((3 * z - 52) * (20 * z - 387) * (20 * z - 393)), 'G_sel closed form')
report['2b selected orbit 1 (all 8 classes)'] = ('weights P5 4 @ 16+4c/3, P3 2 @ 18+27c/20, P3 2 @ 18+33c/20, '
                                                 'dark 0 @ 16+3c/2  => (4,2,2,0) exactly; c = 1: 52/3, 387/20, 393/20, 35/2')
# 2c: census
eq = [D for D in classes if weights(*data[D]) is True]
deg = [D for D in classes if weights(*data[D]) is None]
def poles(D):
    a2, a4, s, q, t = data[D]; return (a2, a4, s, q)
arch = []
for D in classes:
    a2, a4, s, q, t = data[D]
    if (16 + a2, 16 + a4) == (Fr(266, 15), Fr(521, 30)) and s == Fr(389 + 391, 20) - 36 and \
       q == (Fr(389, 20) - 18) ** 2 + (Fr(391, 20) - 18) ** 2:
        arch.append(D)
check(len(eq) == 272 and not deg, '(4,2,2,0) holds exactly on 272 of 768 classes; no degenerate Walsh-3 pair')
check(len(arch) == 32 and set(arch) <= set(eq) and not (set(arch) & W64), 'archived poles on 32 classes, (4,2,2,0) there, none in orbit 1')
orb = lambda D: frozenset(clsof(op(D)) for op in ops8)
report['2c census'] = (f'(4,2,2,0) exactly on {len(eq)}/768 classes ({len({orb(D) for D in eq})} Q24 orbits, '
                       f'{len({poles(D) for D in eq})} pole sets); archived poles 266/15, 389/20, 391/20 | 521/30 on '
                       f'{len(arch)} classes ({len({orb(D) for D in arch})} Q24 orbits), not orbit 1')
# 2d: the selected reversible history as chronology
Ps2 = np.zeros((N, N), dtype=np.int64)
for h in range(N): Ps2[h, sig1(h)] = 2                                     # 2 P_sigma1
a2s, a4s, ss, qs, ts = branches(A240(code(Ps2, D0)))
check(2 * qs - ss * ss == 0, 'sigma_1 chronology: the two Walsh-3 branches coincide (8-fold pole)')
report['2d Q -> P_sigma1 (D0)'] = (f'poles 16+{a2s}c (P5 4), 16+{a4s}c (dark), 18+{ss/2}c (P3 4, 8-fold): '
                                   'P3 split undefined, the four-pole structure needs the two-successor Q')
for k, v in report.items(): print(f'{k}: {v}')
print(f'Q82 certificate: all assertions passed in {time.time() - t0:.1f} s')
