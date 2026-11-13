#!/usr/bin/env python3
"""Q77 certificate (ACTIVE PROBLEM A, attempt A4): Q73 Part 3 made exact, and its 4+4 split explained.
Exits non-zero on failure.  Nothing fitted, nothing random.  Exact integer / Fraction / Q(sqrt5) arithmetic,
plus rigorous rational interval (Krawczyk) enclosures for the algebraic bridge numbers.

Objects (all original): the 768 A5 dictionary classes, S_D, the Q62 orbits and the Q64 winners (Q64 certificate,
re-executed through Q73); the 88 joint history x 24-clock pieces, their Lebesgue weights mu and the exact Ulam
coupling pi0 of u -> 2u (Q73 Part 1, exact in Q(sqrt5)); the Q24 dictionary maps I, R, S (Q61 ops8).

Part A (exact): the joint chronology graph splits into 32 components, one per URT block
        x = rows {x, x+32} -> columns {2x, 2x+1}; component shapes (row pieces, column pieces, edges).
Part B (exact lemma, checked): on block x the bridge value t_x = B^J_D[x, 2x] depends on S_D only through the
        cross ratio rho_x(D) = S[x,2x] S[x+32,2x+1] / (S[x,2x+1] S[x+32,2x]); t_x = F_x(rho_x) with F_x(1) = 1/2
        exactly.  (Row and column rescalings of the 2x2 history block are diagonal rescalings of the joint
        matrix, and the bridge is unique.)
Part C (rigorous enclosures): F_x(rho) for all 1152 (x, rho) pairs that occur, by interval Newton (Krawczyk)
        in exact rational interval arithmetic; sign(F_x(rho) - 1/2) = sign(rho - 1) on every pair, so the joint
        lift equals the plain-bridge lift wherever no block ties, and every Q73 "lift difference" is a tie.
Part D (exact decision): certified enclosures of L^J(D) = prod_x max(t_x, 1 - t_x)^2 on all 768 classes:
        maximiser = {D0, I D0, RS D0, SR D0}; runner-up = {R, S, IR, IS} D0; strict certified margins.
Part E (exact mechanism): S_{RS D0} = S_{D0} and S_{R D0} = S_{S D0} = R S_{D0}^T R as integer matrices; RS is
        a chronology coincidence on 128 of 768 classes, not a symmetry of the clock: on many other classes
        L^J(RS D) != L^J(D) with disjoint certified enclosures.  The 4+4 split is S_{D0} against its time reverse.
"""
from fractions import Fraction as Fr
from contextlib import redirect_stdout
from io import StringIO
from collections import Counter
from math import isqrt, floor, ceil
from pathlib import Path
import runpy, time, math
import numpy as np

t0 = time.time()
ARCH = Path(__file__).resolve().parent.parent
with redirect_stdout(StringIO()):
    G = runpy.run_path(str(ARCH / '2026-11-13_q73_joint_clock_bridge' / 'Q73_JOINT_CLOCK_BRIDGE_CERTIFICATE.py'))
W64_ = G['W64']
SH, classes, orbit_of, W64 = G['SH'], G['classes'], G['orbit_of'], set(W64_)
pieces, pi0, mu, P = G['pieces'], G['pi0'], G['mu'], G['P']
q61 = G['q61']; clsof, ops8 = q61['clsof'], q61['ops8']
N = 64
NAMES = ['1', 'I', 'R', 'S', 'RS', 'SR', 'IR', 'IS']
D0 = (0, 2, 4, 6, 10, 9)
def check(c, msg):
    if not c: raise SystemExit('FAIL: ' + msg)
report = {}

# ---------------------------------------------------------------- Part A: 32 block components
cell = [pc[0] for pc in pieces]
comp = {}
for x in range(32):
    rows = [i for i in range(P) if cell[i] in (x, x + 32)]
    cols = [i for i in range(P) if cell[i] in (2 * x, 2 * x + 1)]
    edges = [(a, b) for (a, b) in pi0 if a in rows]
    check(all(b in cols for a, b in edges), 'URT block closure of joint edges')
    comp[x] = (rows, cols, edges)
check(sum(len(c[2]) for c in comp.values()) == len(pi0) == 200, 'the 32 blocks partition the 200 joint edges')
for x, (rows, cols, edges) in comp.items():          # each block is one connected bipartite component
    seen, todo = {('r', rows[0])}, [('r', rows[0])]
    while todo:
        s, v = todo.pop()
        for a, b in edges:
            for u, w in ((('r', a), ('c', b)), (('c', b), ('r', a))):
                if u == (s, v) and w not in seen: seen.add(w); todo.append(w)
    check(len(seen) == len(rows) + len(cols), f'block {x} connected (bridge unique up to one gauge)')
shape = {x: (len(r), len(c), len(e)) for x, (r, c, e) in comp.items()}
report['A block component shapes (row pieces, column pieces, edges): count'] = dict(Counter(shape.values()))

# ---------------------------------------------------------------- exact rational interval arithmetic
PREC = 2 ** 110
def rd(lo, hi): return (Fr(floor(lo * PREC), PREC), Fr(ceil(hi * PREC), PREC))
def iadd(a, b): return rd(a[0] + b[0], a[1] + b[1])
def isub(a, b): return rd(a[0] - b[1], a[1] - b[0])
def imul(a, b):
    p = (a[0] * b[0], a[0] * b[1], a[1] * b[0], a[1] * b[1]); return rd(min(p), max(p))
def pt(v): v = Fr(v); return (v, v)
SC = 10 ** 40
s5 = (Fr(isqrt(5 * SC * SC), SC), Fr(isqrt(5 * SC * SC) + 1, SC))
check(s5[0] ** 2 < 5 < s5[1] ** 2, 'sqrt5 bracket')
def kint(k):                                    # Q(sqrt5) number p + q sqrt5 -> rational interval
    a, b = k.p + k.q * s5[0], k.p + k.q * s5[1]; return rd(min(a, b), max(a, b))
PI = {e: kint(v) for e, v in pi0.items()}
MU = [kint(m) for m in mu]

# ---------------------------------------------------------------- Part B/C: F_x(rho) by Krawczyk
def F_enclose(x, rho):
    """Rigorous enclosure of t_x for cross ratio rho (edge weight rho on history edge (x,2x), 1 elsewhere)."""
    rows, cols, edges = comp[x]
    if rho == 1:                                # W = pi0 on the block, already bridged: t = 64 * 1/128
        return (Fr(1, 2), Fr(1, 2))
    wf = {e: (float(rho) if (cell[e[0]] == x and cell[e[1]] == 2 * x) else 1.0) * pi0[e].f() for e in edges}
    wI = {e: (imul(pt(rho), PI[e]) if (cell[e[0]] == x and cell[e[1]] == 2 * x) else PI[e]) for e in edges}
    ri = {a: i for i, a in enumerate(rows)}; ci = {b: i for i, b in enumerate(cols)}
    nr, nc = len(rows), len(cols)
    # float Sinkhorn on the block
    r = np.ones(nr); c = np.ones(nc); muf = np.array([m.f() for m in mu])
    for _ in range(5000):
        rs = np.zeros(nr)
        for (a, b), w in wf.items(): rs[ri[a]] += w * c[ci[b]]
        r = muf[rows] / rs
        cs = np.zeros(nc)
        for (a, b), w in wf.items(): cs[ci[b]] += w * r[ri[a]]
        c = muf[cols] / cs
    r = r * c[0]; c = c / c[0]
    n = nr + nc - 1                              # unknowns z = (r_0..r_{nr-1}, c_1..c_{nc-1}); c_0 = 1
    def F(z):                                   # interval residuals
        rr = z[:nr]; cc = [pt(1)] + z[nr:]
        out = []
        for a in rows:
            s = pt(0)
            for (aa, b), w in wI.items():
                if aa == a: s = iadd(s, imul(w, cc[ci[b]]))
            out.append(isub(imul(rr[ri[a]], s), MU[a]))
        for b in cols[1:]:
            s = pt(0)
            for (a, bb), w in wI.items():
                if bb == b: s = iadd(s, imul(w, rr[ri[a]]))
            out.append(isub(imul(cc[ci[b]], s), MU[b]))
        return out
    def J(z):
        rr = z[:nr]; cc = [pt(1)] + z[nr:]
        M = [[pt(0)] * n for _ in range(n)]
        for (a, b), w in wI.items():
            i, j = ri[a], ci[b]
            M[i][i] = iadd(M[i][i], imul(w, cc[j]))                       # d row_a / d r_a
            if j > 0: M[i][nr + j - 1] = iadd(M[i][nr + j - 1], imul(rr[i], w))   # d row_a / d c_b
            if j > 0:
                M[nr + j - 1][nr + j - 1] = iadd(M[nr + j - 1][nr + j - 1], imul(w, rr[i]))  # d col_b / d c_b
                M[nr + j - 1][i] = iadd(M[nr + j - 1][i], imul(cc[j], w))                    # d col_b / d r_a
        return M
    zf = list(r) + list(c[1:])
    zt = [Fr(v).limit_denominator(10 ** 18) for v in zf]
    Jf = np.array([[float((e[0] + e[1]) / 2) for e in row] for row in J([pt(v) for v in zt])])
    Y = [[Fr(v).limit_denominator(10 ** 15) for v in row] for row in np.linalg.inv(Jf)]
    rad = [abs(v) * Fr(1, 10 ** 9) + Fr(1, 10 ** 15) for v in zt]
    X = [(v - d, v + d) for v, d in zip(zt, rad)]
    fx = F([pt(v) for v in zt]); JX = J(X)
    K = []
    for i in range(n):
        acc = pt(zt[i])
        yf = pt(0)
        for k in range(n): yf = iadd(yf, imul(pt(Y[i][k]), fx[k]))
        acc = isub(acc, yf)
        for j in range(n):
            m = pt(1 if i == j else 0)
            for k in range(n): m = isub(m, imul(pt(Y[i][k]), JX[k][j]))
            acc = iadd(acc, imul(m, (X[j][0] - zt[j], X[j][1] - zt[j])))
        K.append(acc)
    check(all(X[i][0] < K[i][0] and K[i][1] < X[i][1] for i in range(n)),
          f'Krawczyk inclusion K(X) in int(X) (unique bridge enclosed), block {x}, rho {rho}')
    rr = K[:nr]; cc = [pt(1)] + K[nr:]
    t = pt(0)
    for (a, b), w in wI.items():
        if cell[a] == x and cell[b] == 2 * x: t = iadd(t, imul(imul(rr[ri[a]], w), cc[ci[b]]))
    return imul(pt(64), t)

def rho_of(S, x):
    a, b, c, d = int(S[x, 2 * x]), int(S[x, 2 * x + 1]), int(S[x + 32, 2 * x]), int(S[x + 32, 2 * x + 1])
    check(min(a, b, c, d) > 0, 'full URT block'); return Fr(a * d, b * c)
RHO = {D: [rho_of(SH[D], x) for x in range(32)] for D in classes}
need = sorted({(x, RHO[D][x]) for D in classes for x in range(32)})
Fenc = {}
for (x, rho) in need:
    Fenc[(x, rho)] = e = F_enclose(x, rho)
    if rho != 1:
        check((e[0] > Fr(1, 2)) == (rho > 1) and (e[1] < Fr(1, 2)) == (rho < 1), 'sign(F_x(rho) - 1/2) = sign(rho - 1)')
wid = max(float(e[1] - e[0]) for e in Fenc.values())
report['C (x, rho) pairs enclosed'] = f'{len(need)} ({len({r for _, r in need})} distinct rho); max enclosure width {wid:.1e}'
# Part B lemma, checked against Q73's float joint bridge on the unrescaled S_D for a spread of classes
E = sorted(pi0); eh = np.array([pieces[a][0] for a, b in E]); ek = np.array([pieces[b][0] for a, b in E])
for D in list(W64) + classes[::97]:
    B, res = G['joint_bridge'](SH[D][eh, ek].astype(float))
    for x in range(32):
        lo, hi = Fenc[(x, RHO[D][x])]
        check(float(lo) - 1e-11 <= B[x, 2 * x] <= float(hi) + 1e-11, 'Q73 float bridge lies in the rho-only enclosure (Part B)')
report['B lemma'] = 't_x = F_x(rho_x) checked against the unrescaled Q73 float bridge on 16 classes x 32 blocks'
ties = Counter(D for D in classes for x in range(32) if RHO[D][x] == 1)
report['C lift'] = (f'joint lift bit = [rho_x < 1] exactly; {len(ties)} classes carry a tied block (t = 1/2 exactly), '
                    f'which contain all {sum(1 for D in classes if G["flips"][D])} Q73 lift-difference classes')
check(all(G['flips'][D] <= ties[D] for D in classes), 'every Q73 lift difference sits on a tied block')

# ---------------------------------------------------------------- Part D: certified L^J on all 768 classes
ONE = pt(1)
def Lenc(D):
    L = ONE
    for x in range(32):
        lo, hi = Fenc[(x, RHO[D][x])]
        m = (lo, hi) if lo >= Fr(1, 2) else ((1 - hi, 1 - lo) if hi <= Fr(1, 2) else None)
        check(m is not None, 'block value decided')
        L = imul(L, imul(m, m))
    return L
LJ = {D: Lenc(D) for D in classes}
best_lo = max(v[0] for v in LJ.values())
top = [D for D in classes if LJ[D][1] >= best_lo]
img = {nm: clsof(op(D0)) for nm, op in zip(NAMES, ops8)}
half1 = {img[n] for n in ('1', 'I', 'RS', 'SR')}; half2 = {img[n] for n in ('R', 'S', 'IR', 'IS')}
check(set(top) == half1, 'certified maximiser = {D0, I D0, RS D0, SR D0}')
check(len({SH[D].tobytes() for D in half1}) == 1 and len({SH[D].tobytes() for D in half2}) == 1,
      'each half of orbit 1 carries one chronology (integer equality), so L^J is exactly constant on it')
rest = [D for D in classes if D not in half1 | half2]
check(min(LJ[D][0] for D in half2) > max(LJ[D][1] for D in rest), 'certified: second half of orbit 1 beats every other class')
r12 = (LJ[D0][0] / LJ[img['R']][1], LJ[D0][1] / LJ[img['R']][0])
r2o = (LJ[img['R']][0] / max(LJ[D][1] for D in rest), LJ[img['R']][1] / max(LJ[D][0] for D in rest))
nxt = [D for D in rest if LJ[D][1] >= max(LJ[E][0] for E in rest)]
check({orbit_of.get(D) for D in nxt} == {3}, 'next best: orbit 3')
check(all(RHO[D][x] < 1 for D in half1 | half2 for x in range(32)), 'orbit 1: every block strictly rho < 1, lift sigma_1, no tie')
report['D maximiser'] = '{D0, I D0, RS D0, SR D0}, D0 = (0,2,4,6,10,9), lift sigma_1, certified unique (no tie)'
report['D margin half 1 / half 2'] = f'in [{float(r12[0]):.12f}, {float(r12[1]):.12f}]'
report['D margin half 2 / best other class (orbit 3)'] = f'in [{float(r2o[0]):.12f}, {float(r2o[1]):.12f}]'

# ---------------------------------------------------------------- Part E: mechanism
def rev(h): return int(format(h, '06b')[::-1], 2)
Rp = np.array([rev(h) for h in range(N)])
S0 = SH[D0]
check((SH[img['RS']] == S0).all() and (SH[img['I']] == S0).all(), 'S_{RS D0} = S_{I D0} = S_{D0} (integers)')
check((SH[img['R']] == S0.T[np.ix_(Rp, Rp)]).all(), 'S_{R D0} = R S_{D0}^T R (time reversal, Q72)')
check((SH[img['S']] == SH[img['R']]).all(), 'S_{S D0} = S_{R D0}')
rs_eq = [D for D in classes if (SH[clsof(ops8[4](D))] == SH[D]).all()]
check(len(rs_eq) == 128 and all((SH[clsof(ops8[1](D))] == SH[D]).all() for D in classes), 'S_{RS D} = S_D on exactly 128 classes; S_{I D} = S_D on all 768')
rs_orbits = Counter(orbit_of.get(D) for D in rs_eq)
split = [D for D in classes if D not in rs_eq and (LJ[D][1] < LJ[clsof(ops8[4](D))][0] or LJ[clsof(ops8[4](D))][1] < LJ[D][0])]
check(len(split) > 0, 'RS is not a symmetry of the joint clock bridge')
# R never a symmetry where the chronology is not R-self-dual? count certified R-splits
r_split = sum(1 for D in classes if LJ[D][1] < LJ[clsof(ops8[2](D))][0] or LJ[clsof(ops8[2](D))][1] < LJ[D][0])
# the plain bridge ties D and R D exactly: same multiset of max(rho, 1/rho)
def ms(D): return sorted(max(r, 1 / r) for r in RHO[D])
check(all(ms(D) == ms(clsof(ops8[2](D))) for D in classes), 'plain bridge: rho multisets of D and R D agree (exact tie)')
perblk = [(x, shape[x], RHO[D0][x], RHO[img['R']][x]) for x in range(32)]
moved = [p for p in perblk if p[2] != p[3]]
diff_shapes = Counter(p[1] for p in moved)
report['E chronologies on orbit 1'] = 'two: S_{D0} (= S_{I D0} = S_{RS D0} = S_{SR D0}) and its time reverse R S_{D0}^T R'
report['E S_{RS D} = S_D'] = f'128 of 768 classes, Q62 orbits {sorted(rs_orbits.items(), key=lambda kv: str(kv[0]))}'
report['E certified L^J(RS D) != L^J(D) on'] = f'{len(split)} classes (so no clock symmetry realises RS)'
report['E certified L^J(R D) != L^J(D) on'] = f'{r_split} of 768 classes'
report['E blocks where rho differs between D0 and R D0'] = f'{len(moved)} of 32; their shapes {dict(diff_shapes)}'
for k, v in report.items(): print(f'{k}: {v}')
print(f'Q77 certificate: all assertions passed in {time.time() - t0:.1f} s')
