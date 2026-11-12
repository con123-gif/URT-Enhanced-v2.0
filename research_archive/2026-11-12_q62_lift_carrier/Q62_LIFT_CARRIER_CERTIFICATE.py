#!/usr/bin/env python3
"""Q62 certificate: the C3-selected history lifts versus the native carriers H13+H51 and im U_h,
and what the original Q3 source and the 24-clock overlap say about beta = 0 versus beta = 1.

Exact arithmetic only (Fractions, Q(sqrt5) pairs, integers). Exits non-zero on any failure.
Nothing fitted, nothing random. Original objects, all imported or rebuilt from archived code:
  * icosahedron, faces, antipodal pairs, Ph = 1 - C(C^TC)^{-1}C^T : Q24 sympy-free rebuild of Q11
  * im U_h : P8 = M Ph M^T / 2 on the 64 axis words (Q49 E1 construction, rebuilt here)
  * H13 = deg0 + deg6 + deg1 + V5 (Walsh), V5 = span{ y -> Qd(u(y),u(y)) : Qd traceless },
    u(y) = sum of the six chosen axis vertices (the vector of the archived quartic face source)
  * lifts sigma_beta, signed dictionaries D, A5 classes, the 6 exceptional Q24 orbits and their
    selected beta : imported from the Q61 certificate (re-executed here)
  * S_D : the original Q3 geometric A5 twirl of the primitive two-successor Q2 (Q3 module)
  * C24 : the original 2026-11-09 Haar overlap of the 24-clock (Q49 build_overlap)
"""
from fractions import Fraction as F
from itertools import combinations, permutations
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import runpy, sys, time
import numpy as np
import networkx as nx
from networkx.algorithms.isomorphism import GraphMatcher, categorical_edge_match, categorical_node_match

t0 = time.time()
ARCH = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ARCH / '2026-11-11_q24_history_symmetries'))
with redirect_stdout(StringIO()):
    import native_source_nosympy as ns
    q61 = runpy.run_path(str(ARCH / '2026-11-12_q61_inverse_limit_lifts' / 'Q61_INVERSE_LIMIT_LIFTS_CERTIFICATE.py'))
    q3 = runpy.run_path(str(ARCH / '2026-11-11_q3_twirled_chronology_classes' / 'Q3_TWIRLED_CHRONOLOGY_CLASSES_2026_11_11.py'))
    q49 = runpy.run_path(str(ARCH / '2026-11-12_q49_native_ward_history_map' / 'q49_native_ward_history_map.py'), run_name='q49')
K, KZ = ns.K, ns.Z
pts, pairs, faces = ns.pts, ns.pairs, ns.faces
exc, orbits, index, sigma, classes, actions = (q61[k] for k in ('exc', 'orbits', 'index', 'sigma', 'classes', 'actions'))
assert len(classes) == 768 and len(exc) == 48 and len(orbits) == 6
report = {}
N = 64

def check(c, msg):
    if not c:
        raise SystemExit('FAIL: ' + msg)

# ------------------------------------------------------------ carriers in the axis-word frame y
# im U_h: bit j = 1 picks pairs[j][1] (Q49 convention); P8 = M Ph M^T / 2, rational
M = [[F(0)] * 20 for _ in range(N)]
for y in range(N):
    ch = {pairs[i][(y >> i) & 1] for i in range(6)}
    for k, f in enumerate(faces):
        if set(f) <= ch: M[y][k] = F(1)
P8 = [[x / 2 for x in r] for r in ns.mmul(ns.mmul(M, ns.H), ns.mT(M))]
check(ns.mmul(P8, P8) == P8 and ns.trace(P8) == 8, 'P8 projector of rank 8')

# H13: Walsh characters; V5 coefficients on the 15 degree-2 characters are 2 Qd(v_i, v_j)
v = [pts[pairs[i][0]] for i in range(6)]
PR = list(combinations(range(6), 2))
def quad(z, a, b):  # the five traceless quadratic forms of the archived Walsh H13 certificate
    return [2*(a[0]*b[0]-a[1]*b[1]), 2*(a[0]*b[0]+a[1]*b[1]-2*a[2]*b[2]),
            a[0]*b[1]+a[1]*b[0], a[0]*b[2]+a[2]*b[0], a[1]*b[2]+a[2]*b[1]][z]
B = [[quad(z, v[i], v[j]) for z in range(5)] for (i, j) in PR]
# V5 = span of y -> Qd(u(y),u(y)), u = sum_i s_i v_i: the diagonal part sum_i Qd(v_i,v_i) vanishes
for z in range(5):
    check(sum((quad(z, v[i], v[i]) for i in range(6)), KZ) == KZ, 'traceless forms kill the diagonal')
def kmul(A, C):
    Ct = list(zip(*C)); return [[sum((x*y for x, y in zip(r, c)), KZ) for c in Ct] for r in A]
def kinv(A):
    n = len(A); W = [list(r) + [K(int(i == j)) for j in range(n)] for i, r in enumerate(A)]
    for c in range(n):
        p = next(r for r in range(c, n) if not W[r][c] == KZ); W[c], W[p] = W[p], W[c]
        pv = W[c][c]; W[c] = [x / pv for x in W[c]]
        for r in range(n):
            if r != c and not W[r][c] == KZ:
                f = W[r][c]; W[r] = [x - f*y for x, y in zip(W[r], W[c])]
    return [r[n:] for r in W]
Bt = [list(r) for r in zip(*B)]
Pi5 = kmul(kmul(B, kinv(kmul(Bt, B))), Bt)
check(kmul(Pi5, Pi5) == Pi5 and sum((Pi5[i][i] for i in range(15)), KZ) == K(5), 'V5 rank 5')
def chi(m, y): return -1 if bin(m & y).count('1') % 2 else 1
low = [0, 63] + [1 << i for i in range(6)]
P13 = [[None] * N for _ in range(N)]
for a in range(N):
    for b in range(N):
        x = K(sum(chi(m, a) * chi(m, b) for m in low))
        for k, (i, j) in enumerate(PR):
            ck = chi((1 << i) | (1 << j), a)
            for l, (p, q) in enumerate(PR):
                if not Pi5[k][l] == KZ: x = x + Pi5[k][l] * (ck * chi((1 << p) | (1 << q), b))
        P13[a][b] = x * K(F(1, 64))
check(kmul(P13, P13) == P13 and sum((P13[i][i] for i in range(N)), KZ) == K(13), 'P13 projector of rank 13')

# ------------------------------------------------------------ C1: the carrier symmetry groups
def sp(p, e):
    return tuple(sum((((y >> j) & 1) ^ ((e >> j) & 1)) << p[j] for j in range(6)) for y in range(N))
B6 = [(p, e) for p in permutations(range(6)) for e in range(64)]
def keeps(P, pi):
    return all(P[a][b] == P[pi[a]][pi[b]] for a in range(N) for b in range(N))
stab8 = [(p, e) for p, e in B6 if keeps(P8, sp(p, e))]
check(len(stab8) == 120, '|Stab_B6(P8)| = 120')
ico = {sp(a[0], sum(f << j for j, f in enumerate(a[1]))) for a in actions}
icoI = ico | {tuple(x ^ 63 for x in g) for g in ico}
check(len(icoI) == 120 and {sp(p, e) for p, e in stab8} == icoI, 'Stab_B6(P8) = signed A5 x <inversion>')
def axis_cycles(p):
    seen, c = set(), []
    for i in range(6):
        if i in seen: continue
        l, k = 0, i
        while k not in seen: seen.add(k); k = p[k]; l += 1
        c.append(l)
    return tuple(sorted(c))
ctypes = Counter(axis_cycles(p) for p, e in stab8)
check(ctypes == Counter({(1, 5): 48, (3, 3): 40, (1, 1, 2, 2): 30, (1, 1, 1, 1, 1, 1): 2}), 'axis cycle types of I_h')
# full permutation automorphism group of the H13 projector inside S_64
G13 = nx.Graph()
for a in range(N): G13.add_node(a, c=repr(P13[a][a]))
for a in range(N):
    for b in range(a + 1, N): G13.add_edge(a, b, c=repr(P13[a][b]))
aut13 = {tuple(m[i] for i in range(N)) for m in GraphMatcher(
    G13, G13, node_match=categorical_node_match('c', None), edge_match=categorical_edge_match('c', None)).isomorphisms_iter()}
check(aut13 == icoI, 'Aut_S64(P13) = I_h (120)')
report['C1 Stab_B6(P8) = Aut_S64(P13) = signed A5 x <I> (order)'] = 120
report['C1 axis-permutation cycle types in it'] = dict(ctypes)

# ------------------------------------------------------------ C2: no lift preserves H13 + H51
lifts_in_B6 = [b for b in (0, 0xffffffff) if any(sigma(b) == sp(p, e) for p in [(1, 2, 3, 4, 5, 0)] for e in range(64))]
check(lifts_in_B6 == [0, 0xffffffff], 'sigma_0 and sigma_1 are signed bit permutations (digit 6-cycle)')
# a signed bit permutation h -> pi(h) ^ e that is a lift must send bit i to bit i+1 (i < 5) and bit 5 to
# bit 0 with e in {0, 1}: exactly sigma_0, sigma_1, whose digit permutation is a 6-cycle (not in I_h)
nlift = 0
for p, e in B6:
    s = sp(p, e)
    if all(s[h] in ((2*h) % 64, (2*h) % 64 + 1) for h in range(N)): nlift += 1
check(nlift == 2, 'exactly two lifts are signed bit permutations')
for D in classes:
    idx = [index(h, D) for h in range(N)]; ii = {y: h for h, y in enumerate(idx)}
    for b in (0, 0xffffffff):
        s = sigma(b); tau = tuple(idx[s[ii[y]]] for y in range(N))
        check(tau not in aut13, 'a C3 candidate lift preserves H13')
report['C2 lifts preserving H13_D (hence H51_D), any dictionary D'] = 0

# ------------------------------------------------------------ C3: no lift preserves im U_h
supp = [y for y in range(N) if P8[y][y] != 0]; Sset = set(supp)
check(len(supp) == 40 and all(all(P8[y][x] == 0 for x in range(N)) for y in range(N) if y not in Sset), 'face support, 40 words')
nface = [sum(set(f) <= {pairs[i][(y >> i) & 1] for i in range(6)} for f in faces) for y in range(N)]
check(Counter(nface) == Counter({0: 12, 1: 20, 4: 20, 5: 12}), 'faces inside the six chosen vertices')
check(all((nface[y] in (1, 4)) == (y in Sset) for y in range(N)),
      'support of P8 = words containing exactly 1 or 4 faces (5-face words are vertex stars, killed by Ph)')
G8 = nx.Graph(); G8.add_nodes_from(supp)
for a in supp:
    for b in supp:
        if a < b and P8[a][b] != 0: G8.add_edge(a, b, c=str(P8[a][b]))
aut8 = [dict(m) for m in GraphMatcher(G8, G8, edge_match=categorical_edge_match('c', None)).isomorphisms_iter()]
check(len(aut8) == 480, '|Aut(P8 on support)| = 480')
restr = {tuple(g[y] for y in supp) for g in icoI}
check(restr <= {tuple(m[y] for y in supp) for m in aut8}, 'I_h restricts into Aut(P8|support)')
# P_sigma P8 P_sigma^T = P8  <=>  sigma maps support to support and acts there as an automorphism.
# lift sigma_beta: for x < 32, beta_x = b gives sigma(x) = 2x + b, sigma(x+32) = 2x + 1 - b (mod 64).
def count_lifts(inS, req):
    tot = 1
    for x in range(32):
        ok = 0
        for b in (0, 1):
            good = True
            for h, bit in ((x, b), (x + 32, 1 ^ b)):
                tgt = ((2*h) % 64) | bit
                if inS[h] != inS[tgt]: good = False
                elif req is not None and inS[h] and tgt != req[h]: good = False
            ok += good
        tot *= ok
        if not tot: return 0
    return tot
pres_U, pres_S = Counter(), Counter()
supp_ok = {}
for D in classes:
    idx = [index(h, D) for h in range(N)]; ii = {y: h for h, y in enumerate(idx)}
    inS = [idx[h] in Sset for h in range(N)]
    pres_U[sum(count_lifts(inS, {h: ii[al[idx[h]]] for h in range(N) if inS[h]}) for al in aut8)] += 1
    n = count_lifts(inS, None); pres_S[n] += 1; supp_ok[D] = n
check(pres_U == Counter({0: 768}), 'no lift preserves im U_h for any dictionary')
check(pres_S == Counter({0: 720, 4096: 48}), 'support preserved by 2^12 lifts on 48 classes, by none on 720')
ops8, clsof = q61['ops8'], q61['clsof']
suppD = {D for D, n in supp_ok.items() if n}
sorb = {frozenset(clsof(op(D)) for op in ops8) for D in suppD}
check(len(sorb) == 6 and all(len(o) == 8 and o <= suppD for o in sorb), 'the 48 classes are 6 Q24 orbits')
check(len(suppD & set(exc)) == 8 and (suppD & set(exc)) in sorb and
      {exc[D][2] for D in suppD & set(exc)} == {0xffffffff}, 'overlap with the exceptional orbits: one beta=1 orbit')
# positive control: build one support-preserving lift on an exceptional class and verify it directly
D = min(suppD & set(exc)); idx = [index(h, D) for h in range(N)]; inS = [idx[h] in Sset for h in range(N)]
beta = 0
for x in range(32):
    b = next(b for b in (0, 1) if inS[x] == inS[((2*x) % 64) | b] and inS[x+32] == inS[((2*x) % 64) | (1 ^ b)])
    beta |= b << x
s = sigma(beta)
check(sorted(s) == list(range(N)) and all(inS[h] == inS[s[h]] for h in range(N)), 'control lift preserves support')
check(any(P8[idx[s[a]]][idx[s[c]]] != P8[idx[a]][idx[c]] for a in range(N) for c in range(N)), 'control lift moves P8')
report['C3 lifts preserving im U_h (P_s P8_D P_s^T = P8_D), any D'] = 0
report['C3 classes with a lift preserving the 40-word support of U_h'] = '48 (6 Q24 orbits, 2^12 lifts each); exceptional among them: 8 (one beta=1 orbit)'

# ------------------------------------------------------------ C4: the selected lift on the six orbits
s0, s1 = sigma(0), sigma(0xffffffff)
Q2 = np.zeros((N, N), dtype=np.int64)
for h in range(N): Q2[h, 2*h % 64] = Q2[h, (2*h + 1) % 64] = 1
def Pm(s):
    P = np.zeros((N, N), dtype=np.int64)
    for h in range(N): P[h, s[h]] = 1
    return P
check(np.array_equal(Pm(s0) + Pm(s1), Q2), 'Q2 = P_sigma0 + P_sigma1: the two C3-selected lifts are complementary')
perms = [np.array(p) for p in q3['geometric_a5_on_codes']()]
check(len(perms) == 60, 'Q3 A5 code action')
table = []
for oi, (o, bs) in enumerate(sorted(orbits.items(), key=lambda kv: min(kv[0]))):
    (bsel,) = tuple(bs); rows = Counter(); q3rows = set()
    for D in sorted(o):
        idx = [index(h, D) for h in range(N)]; inS = [idx[h] in Sset for h in range(N)]
        inv = np.empty(N, dtype=np.int64); inv[np.array(idx)] = np.arange(N)
        X = {b: Pm(sigma(b))[np.ix_(inv, inv)] for b in (0, 0xffffffff)}
        S = np.zeros((N, N), dtype=np.int64)
        for p in perms: S += Q2[np.ix_(inv, inv)][np.ix_(p, p)]
        check(np.all(S.sum(axis=1) == 120), 'S_D row sums')
        ov = {b: int(np.trace(S @ X[b].T)) for b in X}
        bun = bsel ^ 0xffffffff
        check(ov[bsel] > ov[bun], 'Q3 source overlap prefers the C3-selected lift')
        q3rows.add((ov[bsel], ov[bun]))
        sel = sigma(bsel)
        tr8 = sum((P8[idx[h]][idx[sel[h]]] for h in range(N)), F(0))
        d8 = sum(((P8[idx[sel[a]]][idx[sel[c]]] - P8[idx[a]][idx[c]])**2 for a in range(N) for c in range(N)), F(0))
        tr13 = sum((P13[idx[h]][idx[sel[h]]] for h in range(N)), KZ)
        check(tr13.b == 0, 'Tr(P13 P_sel) rational')
        check(d8 > 0, 'selected lift moves P8')
        rows[(all(inS[h] == inS[sel[h]] for h in range(N)), str(tr8), str(d8), str(tr13.a))] += 1
    check(len(q3rows) == 1, 'Q3 overlaps constant on each Q24 orbit')
    table.append((oi, hex(bsel), q3rows.pop(), dict(rows)))
for oi, b, q, rows in table:
    report[f'C4 orbit {oi} (beta {b}): Q3 overlap Tr(S_D X^T) selected/complement'] = q
    report[f'C4 orbit {oi} (beta {b}): (keeps U_h support, Tr(P8 P), ||P P8 P^T - P8||^2, Tr(P13 P)) : #classes'] = rows
check(sorted(t[2] for t in table if t[1] == '0x0') == [(348, 196), (348, 204), (348, 244)], 'Q3 overlaps, beta=0 orbits')
check(sorted(t[2] for t in table if t[1] == '0xffffffff') == [(348, 172), (564, 236), (564, 284)], 'Q3 overlaps, beta=1 orbits')
# family split of Tr(P13 P_sel): the low Walsh part (deg 0, 1, 6) gives 2 for sigma_0, 0 for sigma_1,
# because chi_63 is sigma_0-even and sigma_1-odd and no digit is fixed; the V5 part gives the rest
low13 = {b: sum(chi(m, h) * chi(m, sigma(b)[h]) for m in low for h in range(N)) // 64 for b in (0, 0xffffffff)}
check(low13 == {0: 2, 0xffffffff: 0}, 'low Walsh part of Tr(P13 P_sigma)')
keep = [(t[0], t[1]) for t in table if any(k[0] for k in t[3])]
check(len(keep) == 1 and keep[0][1] == '0xffffffff' and all(k[0] for k in table[keep[0][0]][3]),
      'selected lift keeps the U_h support on exactly one (beta=1) orbit, on all its 8 classes')

# ------------------------------------------------------------ C5: the 24-clock overlap
C = q49['build_overlap'](); Q5 = q49['Q5']
def clock(s):
    x = Q5(0)
    for j in range(24):
        for h in range(N): x = x + C[j][h] * C[j][s[h]]
    return 1536 * x
c0, c1 = clock(s0), clock(s1)
check(c0 == Q5(F(91477, 24), -1704) and c1 == Q5(F(5, 8), 0), 'clock overlaps')
check((c0 - c1).sign() > 0, 'clock overlap prefers sigma_0')
report['C5 1536 Tr(C24 P_s C24^T): sigma_0, sigma_1'] = (repr(c0), repr(c1), round(c0.f(), 10), c1.f())

# ------------------------------------------------------------ C6: Q3-overlap maximisation over all 2^32 lifts
# Tr(S_D X_beta^T) = sum_x w_x(beta_x): each bit beta_x enters only through h = x and h = x + 32,
# so the maximum over all lifts is attained bitwise; ties counted exactly.
def q3_argmax(D):
    idx = [index(h, D) for h in range(N)]
    inv = np.empty(N, dtype=np.int64); inv[np.array(idx)] = np.arange(N)
    X = Q2[np.ix_(inv, inv)]; S = np.zeros((N, N), dtype=np.int64)
    for p in perms: S += X[np.ix_(p, p)]
    ties, beta = 0, 0
    for x in range(32):
        w = [int(S[idx[x], idx[(2*x) % 64 | b]] + S[idx[x+32], idx[(2*x) % 64 | (1 ^ b)]]) for b in (0, 1)]
        if w[0] == w[1]: ties += 1
        elif w[1] > w[0]: beta |= 1 << x
    return ties, beta
nonexc, excm = Counter(), Counter()
for D in classes:
    ties, beta = q3_argmax(D)
    if D in exc:
        excm[(ties, hex(beta) if ties == 0 else None, hex(exc[D][2]))] += 1
    else:
        nonexc[ties] += 1
check(excm == Counter({(0, '0x0', '0x0'): 16, (0, '0xffffffff', '0xffffffff'): 16, (4, None, '0x0'): 8,
                       (0, '0xffee77ff', '0xffffffff'): 4, (0, '0xbbffffdd', '0xffffffff'): 4}), 'Q3 argmax, exceptional')
check(nonexc == Counter({0: 40, 2: 104, 4: 208, 6: 144, 8: 168, 10: 40, 12: 16}), 'Q3 argmax, non-exceptional')
report['C6 exceptional classes: (ties, unique Q3-argmax beta, C3-selected beta) : #'] = dict(excm)
report['C6 non-exceptional classes: #tied bits of the Q3 argmax : #classes'] = dict(sorted(nonexc.items()))

for k, val in report.items(): print(f'{k}: {val}')
print(f'Q62 certificate: all assertions passed in {time.time() - t0:.1f} s')
