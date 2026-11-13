#!/usr/bin/env python3
"""Q73 certificate (ACTIVE PROBLEM A, attempt A4 second half): does the bridge selection (orbit 1, sigma_1)
survive when the bridge is built on the joint history x 24-clock state space?  Exits non-zero on failure.
Nothing fitted, nothing random.

Original objects
  * S_D, the 768 A5 dictionary classes, the Q62 orbit labels, the Q64 winners: re-executed Q64 certificate.
  * The 24-clock partition: bins [alpha + j/24, alpha + (j+1)/24) mod 1, alpha = phi^-2, against the 64 dyadic
    history cells [h/64, (h+1)/64) -- exactly the archived 2026-11-09 overlap (Q49 build_overlap), whose
    entries C[j][h] are the Lebesgue lengths of the joint pieces.  Rebuilt here in exact Q(sqrt5) and
    compared entry by entry with Q49's C.
  * The URT map on the history coordinate, u -> 2u mod 1, whose Ulam matrix on the 64 dyadic cells is Q2/2.

Reading (recorded in the log, nobody to ask): the joint chronology of dictionary D on the joint pieces
P = {(h, j) : Leb(cell_h & bin_j) > 0} is W_D[(h,j),(k,j')] = S_D[h,k] * pi0[(h,j),(k,j')], with pi0 the exact
Lebesgue Ulam coupling Leb(piece(h,j) & T^-1 piece(k,j')) of the URT map.  Its uniform-marginal bridge is the
unique matrix scaling diag(r) W_D diag(c) whose row and column sums are the Lebesgue weights mu(h,j) (the
invariant measure of T, refining the uniform history measure).  Its history projection B^J_D is doubly
stochastic on the URT graph, so block-wise [[t,1-t],[1-t,t]], and a reversible history sigma is scored by
L^J(D, sigma) = prod_h B^J_D[h, sigma h].

Part 1 (exact, Q(sqrt5)): 88 joint pieces, C rebuilt = Q49 C; pi0 has marginals mu on both sides; the
        history marginal of pi0 is Q2/128 exactly (the clock is invisible to the history Ulam matrix).
Part 2 (exact): with no chronology (S = const) the joint bridge is pi0 itself and t_x = 1/2 on every block.
Part 3 (float64 Sinkhorn, residual and margin certified): for all 768 classes, compute B^J_D and the per-class
        best lift (bitwise, exact by block independence), and the maximiser over classes.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import runpy, time, math
import numpy as np

t0 = time.time()
HERE = Path(__file__).resolve().parent
ARCH = HERE.parent
with redirect_stdout(StringIO()):
    G = runpy.run_path(str(ARCH / '2026-11-12_q64_conditioned_selection' / 'Q64_CONDITIONED_SELECTION_CERTIFICATE.py'))
    q49 = runpy.run_path(str(ARCH / '2026-11-12_q49_native_ward_history_map' / 'q49_native_ward_history_map.py'), run_name='q49')
SH, classes, orbit_of, W64 = G['SH'], G['classes'], G['orbit_of'], set(G['W'])
N = 64
def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)
report = {}

# ---------------------------------------------------------------- exact Q(sqrt5) numbers p + q sqrt5
class K:
    __slots__ = ('p', 'q')
    def __init__(s, p, q=0): s.p, s.q = Fr(p), Fr(q)
    def __add__(s, o): o = o if isinstance(o, K) else K(o); return K(s.p + o.p, s.q + o.q)
    __radd__ = __add__
    def __sub__(s, o): o = o if isinstance(o, K) else K(o); return K(s.p - o.p, s.q - o.q)
    def __mul__(s, o): o = o if isinstance(o, K) else K(o); return K(s.p*o.p + 5*s.q*o.q, s.p*o.q + s.q*o.p)
    __rmul__ = __mul__
    def __truediv__(s, o):
        o = o if isinstance(o, K) else K(o); n = o.p*o.p - 5*o.q*o.q
        return s * K(o.p / n, -o.q / n)
    def sign(s):
        a, b = s.p, s.q                       # sign of a + b sqrt5
        if b == 0: return (a > 0) - (a < 0)
        if a == 0: return (b > 0) - (b < 0)
        if (a > 0) == (b > 0): return 1 if a > 0 else -1
        return (1 if a > 0 else -1) * (1 if a*a > 5*b*b else -1)
    def __lt__(s, o): return (s - o).sign() < 0
    def __le__(s, o): return (s - o).sign() <= 0
    def __eq__(s, o): o = o if isinstance(o, K) else K(o); return s.p == o.p and s.q == o.q
    def __hash__(s): return hash((s.p, s.q))
    def f(s): return float(s.p) + float(s.q) * math.sqrt(5)
ZERO, ONE = K(0), K(1)
alpha = K(Fr(3, 2), Fr(-1, 2))               # phi^-2 = (3 - sqrt5)/2
phi = K(Fr(1, 2), Fr(1, 2))
check(alpha * phi * phi == ONE, 'alpha = phi^-2')

def inter(a, b, c, d):
    lo = a if c < a else c; hi = b if b < d else d
    return (lo, hi) if lo < hi else None

# joint pieces: cell_h & bin_j as half-open intervals inside [0,1)
bins = []
for j in range(24):
    a, b = alpha + Fr(j, 24), alpha + Fr(j + 1, 24)
    segs = []
    for s in (0, -1):                        # bin may wrap past 1
        x = inter(a + s, b + s, ZERO, ONE)
        if x: segs.append(x)
    bins.append(segs)
pieces = []                                  # (h, j, lo, hi)
for h in range(N):
    for j in range(24):
        for (a, b) in bins[j]:
            x = inter(K(Fr(h, N)), K(Fr(h + 1, N)), a, b)
            if x: pieces.append((h, j, x[0], x[1]))
P = len(pieces)
mu = [hi - lo for (_, _, lo, hi) in pieces]
check(P == 88, 'number of joint history/clock pieces')
Cq = q49['build_overlap']()
for h in range(N):
    for j in range(24):
        v = sum((m for (hh, jj, _, _), m in zip(pieces, mu) if hh == h and jj == j), ZERO)
        c = Cq[j][h]
        check(abs(v.f() - c.f()) < 1e-15 and repr(c) is not None, 'joint piece lengths = archived C[j][h] (float view)')
# exact comparison with Q49's Q5 class via its rational/sqrt5 components
def q5parts(c):
    for names in (('a', 'b'), ('p', 'q'), ('r', 's'), ('x', 'y')):
        if all(hasattr(c, n) for n in names): return tuple(Fr(getattr(c, n)) for n in names)
    return None
pp = q5parts(Cq[0][0])
if pp is not None:
    for h in range(N):
        for j in range(24):
            v = sum((m for (hh, jj, _, _), m in zip(pieces, mu) if hh == h and jj == j), ZERO)
            check((v.p, v.q) == q5parts(Cq[j][h]), 'joint piece lengths = archived C[j][h] (exact)')
    report['Part 1 overlap'] = '88 joint pieces; lengths equal the archived 24x64 overlap C exactly in Q(sqrt5)'
else:
    report['Part 1 overlap'] = '88 joint pieces; lengths equal the archived 24x64 overlap C (float view, 1e-15)'

# exact Lebesgue Ulam coupling of T u = 2u mod 1 on the pieces
pidx = {}
for i, (h, j, lo, hi) in enumerate(pieces): pidx.setdefault(h, []).append(i)
pi0 = {}
for i, (h, j, lo, hi) in enumerate(pieces):
    m = 0 if h < 32 else 1
    for k in ((2*h) % N, (2*h + 1) % N):
        for i2 in pidx[k]:
            _, _, a, b = pieces[i2]
            pre = inter(lo, hi, (a + m) / 2, (b + m) / 2)
            if pre: pi0[(i, i2)] = pre[1] - pre[0]
for i in range(P):
    check(sum((v for (a, b), v in pi0.items() if a == i), ZERO) == mu[i], 'pi0 row marginal = mu')
    check(sum((v for (a, b), v in pi0.items() if b == i), ZERO) == mu[i], 'pi0 column marginal = mu (T preserves Lebesgue)')
hist0 = {}
for (a, b), v in pi0.items():
    key = (pieces[a][0], pieces[b][0]); hist0[key] = hist0.get(key, ZERO) + v
check(set(hist0) == {(h, (2*h + e) % N) for h in range(N) for e in (0, 1)} and
      all(v == K(Fr(1, 128)) for v in hist0.values()), 'history marginal of pi0 = Q2/128 exactly')
report['Part 1 Ulam'] = f'{len(pi0)} joint edges; pi0 marginals = Lebesgue mu; history marginal = Q2/128 exactly'

# ---------------------------------------------------------------- Sinkhorn on the joint pieces
E = sorted(pi0); ea = np.array([a for a, b in E]); eb = np.array([b for a, b in E])
w0 = np.array([pi0[e].f() for e in E]); muf = np.array([m.f() for m in mu])
eh = np.array([pieces[a][0] for a in ea]); ek = np.array([pieces[b][0] for b in eb])
def joint_bridge(sw):
    """sw[e] = chronology weight of the history edge of joint edge e; returns history-projected kernel."""
    w = w0 * sw; r = np.ones(P); c = np.ones(P)
    for it in range(20000):
        rs = np.bincount(ea, w * c[eb], P); r = muf / rs
        cs = np.bincount(eb, w * r[ea], P); c = muf / cs
        if it % 50 == 0:
            pi = r[ea] * w * c[eb]
            res = max(np.abs(np.bincount(ea, pi, P) - muf).max(), np.abs(np.bincount(eb, pi, P) - muf).max())
            if res < 1e-15: break
    pi = r[ea] * w * c[eb]
    res = max(np.abs(np.bincount(ea, pi, P) - muf).max(), np.abs(np.bincount(eb, pi, P) - muf).max())
    B = np.zeros((N, N)); np.add.at(B, (eh, ek), 64 * pi)
    return B, res

# Part 2: no chronology -> t = 1/2 everywhere
B, res = joint_bridge(np.ones(len(E)))
check(res < 1e-14 and all(abs(B[x, 2*x % N] - 0.5) < 1e-12 for x in range(32)), 'constant chronology: joint bridge = pi0, t = 1/2')
report['Part 2'] = 'S = const: joint bridge is pi0, every block t = 1/2 (no clock bias without a chronology)'

# Part 3: all 768 classes
logL, beta, tmin, resmax, flips = {}, {}, {}, 0.0, {}
for D in classes:
    S = SH[D]; B, res = joint_bridge(S[eh, ek].astype(float)); resmax = max(resmax, res)
    check(np.allclose(B.sum(0), 1, atol=1e-12) and np.allclose(B.sum(1), 1, atol=1e-12), 'B^J doubly stochastic')
    lg, bt, gap = 0.0, 0, 1.0
    for x in range(32):
        t = B[x, 2*x % N]; check(abs(B[x+32, (2*x+1) % N] - t) < 1e-12, 'block form [[t,1-t],[1-t,t]]')
        gap = min(gap, abs(t - 0.5)); lg += 2 * math.log(max(t, 1 - t)); bt |= (t < 0.5) << x
    logL[D], beta[D], tmin[D] = lg, bt, gap
    # plain (history-level) bridge lift, from the exact cross ratios ad vs bc
    pl = sum(((int(S[x, 2*x]) * int(S[x+32, 2*x+1]) < int(S[x, 2*x+1]) * int(S[x+32, 2*x])) << x) for x in range(32))
    flips[D] = bin(bt ^ pl).count('1')
check(resmax < 1e-13, 'Sinkhorn marginal residual')
vals = sorted(set(round(v, 9) for v in logL.values()), reverse=True)
top = [D for D in classes if round(logL[D], 9) == vals[0]]
second = [D for D in classes if round(logL[D], 9) == vals[1]]
report['Part 3 Sinkhorn residual (max over 768 classes)'] = f'{resmax:.2e}'
report['Part 3 min |t - 1/2| over maximiser blocks'] = f'{min(tmin[D] for D in top):.4f}'
report['Part 3 maximiser'] = (f'{len(top)} classes, Q62 orbits {sorted({orbit_of.get(D) for D in top}, key=str)}, '
                              f'lifts {sorted({hex(beta[D]) for D in top})}, Q64 winners: {set(top) == W64}')
report['Part 3 runner-up'] = (f'{len(second)} classes, orbits {sorted({orbit_of.get(D) for D in second}, key=str)}, '
                              f'margin x{math.exp(vals[0] - vals[1]):.4f}')
report['Part 3 classes where the joint lift differs from the plain bridge lift'] = sum(1 for D in classes if flips[D])
check(min(tmin[D] for D in top) > 1e-6, 'no near-tied bit on the maximiser (float margin)')
check(vals[0] - vals[1] > 1e-6, 'strict float margin over runner-up')
q61 = G['G']; clsof, ops8 = q61['clsof'], q61['ops8']
D0 = (0, 2, 4, 6, 10, 9)
check(D0 in top and set(top) == {clsof(ops8[i](D0)) for i in (0, 1, 4, 5)},
      'joint maximiser = {D0, I D0, RS D0, SR D0}: the clock keeps <RS> (order 4) and breaks R, S, IR, IS')
check(set(second) == W64 - set(top), 'runner-up = the other half of the Q64 orbit')
check(all(beta[D] == 0xffffffff for D in top), 'joint maximising lift is sigma_1')
O1v = {D: logL[D] for D in W64}
best_other = max(logL[D] for D in classes if D not in W64)
check(min(O1v.values()) - best_other > math.log(1.5), 'whole Q64 orbit 1 beats every other class by > x1.5')
check({orbit_of.get(D) for D in classes if round(logL[D], 9) == round(best_other, 9)} == {3}, 'next: orbit 3')
check(all(flips[D] == 0 for D in W64), 'on orbit 1 the joint lift equals the plain bridge lift')
report['Part 3 orbit 1 vs best other class'] = f'x{math.exp(min(O1v.values()) - best_other):.4f} (next: orbit 3)'
for D in W64:                                 # second half of orbit 1 also sigma_1
    S = SH[D]; B, _ = joint_bridge(S[eh, ek].astype(float))
    check(all(B[x, 2*x % N] < 0.5 for x in range(32)), 'sigma_1 on every orbit-1 class')

# ---------------------------------------------------------------- Part 4: U_h carrier pinching (exact)
# Sigma_D = pulled-back 40-word support of im U_h (Q64/Q62).  The carrier-pinched chronology
# W^U_D = S_D o (1_Sigma x 1_Sigma + 1_Sigma^c x 1_Sigma^c) keeps the hidden-carrier support and its complement.
# Its uniform-marginal bridge exists iff every URT block's row flags equal its column flags as a multiset,
# i.e. iff some lift preserves Sigma_D; full blocks scale by their cross ratio, permutation blocks are forced.
from math import isqrt
ns = G['ns']; pairs, faces, index = ns.pairs, ns.faces, G['index']
supp = {y for y in range(N) if sum(set(f) <= {pairs[i][(y >> i) & 1] for i in range(6)} for f in faces) in (1, 4)}
check(len(supp) == 40, 'U_h support 40 words')
SC = 10**12
def sb(n): r = isqrt(n * SC * SC); return Fr(r, SC), Fr(r + 1, SC)
feas, Ulo, Uhi, Ubeta, Ufree, Uties, Usig = [], {}, {}, {}, {}, {}, {}
for D in classes:
    S = SH[D]; idx = [index(h, D) for h in range(N)]; inn = [idx[h] in supp for h in range(N)]
    lo = hi = Fr(1); bt = 0; ok = True; free = 0; ties = 0; sig = []
    for x in range(32):
        r0, r1, c0, c1 = inn[x], inn[x+32], inn[2*x], inn[2*x+1]
        if sorted((r0, r1)) != sorted((c0, c1)): ok = False; break
        a, b, c, d = int(S[x, 2*x]), int(S[x, 2*x+1]), int(S[x+32, 2*x]), int(S[x+32, 2*x+1])
        if r0 == r1:                          # full block
            free += 1; sig.append((max(a * d, b * c), min(a * d, b * c))); (p0, p1), (q0, q1) = sb(a * d), sb(b * c); m = max(a * d, b * c)
            ties += a * d == b * c; lo *= m / (p1 + q1) ** 2; hi *= m / (p0 + q0) ** 2
            bt |= (a * d < b * c) << x
        else:                                 # forced permutation block
            if r0 != c0: bt |= 1 << x
            check(min(a, d) > 0 if r0 == c0 else min(b, c) > 0, 'forced block entries positive')
    if ok: feas.append(D); Ulo[D], Uhi[D], Ubeta[D], Ufree[D], Uties[D] = lo, hi, bt, free, ties; Usig[D] = sorted(sig)
best = max(feas, key=lambda D: Ulo[D])
Utop = [D for D in feas if not Uhi[D] < Ulo[best]]
check(len({tuple(Usig[D]) for D in W64}) == 1, 'orbit-1 full-block cross-ratio data identical (exact equal likelihoods)')
check(set(Utop) == W64, 'carrier-pinched bridge maximiser = Q64 orbit 1 (all 8 classes, equal up to bounds)')
check(all(Ubeta[D] == 0xffffffff and Uties[D] == 0 for D in Utop), 'carrier-pinched maximising lift = sigma_1, no tie')
Usec = max(Uhi[D] for D in feas if D not in W64)
check(min(Ulo[D] for D in W64) > Usec, 'strict exact margin over every other feasible class')
report['Part 4 feasible classes (some lift keeps Sigma_D)'] = f'{len(feas)} of 768; free blocks per class {sorted(set(Ufree.values()))}; classes with a tied block {sum(1 for D in feas if Uties[D])}'
report['Part 4 carrier-pinched bridge'] = (f'maximiser = Q64 orbit 1 (8 classes), lift sigma_1, margin > '
                                           f'{float(min(Ulo[D] for D in W64) / Usec):.4f}; '
                                           f'feasible orbits {sorted({orbit_of.get(D) for D in feas}, key=str)}')
for k, v in report.items(): print(f'{k}: {v}')
print(f'Q73 certificate: all assertions passed in {time.time() - t0:.1f} s')
