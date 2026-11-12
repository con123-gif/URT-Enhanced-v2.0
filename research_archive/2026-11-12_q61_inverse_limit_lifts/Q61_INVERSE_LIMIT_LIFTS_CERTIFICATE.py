#!/usr/bin/env python3
"""Q61 certificate: the inverse-limit completion and the A5 x <I,R,S> symmetries do not select
a reversible lift of the 64-history transfer Q.

Exact integer / Fraction arithmetic only. Exits non-zero on any failed assertion.

Objects (all original, nothing fitted, nothing random):
  * Q(h -> 2h, 2h+1 mod 64) with weight 1/2: the URT two-successor history transfer
    (bit i of h_n is eps_{n-i}; the departing bit is h5).
  * lifts sigma_beta(h) = 2h mod 64 + (h5 xor beta(h mod 32)), beta in {0,1}^32  (Q59 H3).
  * the natural extension: Omega = {0,1}^Z, Bernoulli(1/2) measure, shift T, window pi.
  * Q24 history symmetries I (xor 63), R (bit reversal, R Q R = Q^T), S (alternating masks
    101010 / 010101) and the Q12/Q24 signed A5 action on the six icosahedral axes, pulled back
    to history bits through a signed dictionary D.
"""
from fractions import Fraction as Fr
from itertools import permutations, product
from collections import Counter
from contextlib import redirect_stdout
from io import StringIO
from pathlib import Path
import importlib.util, runpy, sys, time

t0 = time.time()
here = Path(__file__).resolve().parent
q24dir = here.parent / '2026-11-11_q24_history_symmetries'
sys.path.insert(0, str(q24dir))
with redirect_stdout(StringIO()):
    import native_source_nosympy as ns
pairs, proper = ns.pairs, ns.proper
assert len(proper) == 60 and len(pairs) == 6

q11 = here.parent / '2026-11-10_signed_a5_covariance' / 'signed_a5_covariance.py'
if importlib.util.find_spec('sympy') is not None and q11.exists():
    with redirect_stdout(StringIO()):
        orig = runpy.run_path(str(q11))
    assert [tuple(p) for p in orig['pairs']] == [tuple(p) for p in pairs]
    assert sorted(tuple(g) for g in orig['proper']) == sorted(tuple(g) for g in proper)
    crosscheck = 'A5 rotations and axis pairs identical to original Q11 module'
else:
    crosscheck = 'skipped (sympy absent); Q24 sympy-free reconstruction used'

N = 64
HALF = Fr(1, 2)

def succ(h): return ((2*h) % 64, (2*h) % 64 + 1)

# Q acting on functions: (Qv)(h) = (v(2h) + v(2h+1))/2 ; as a matrix Q[h][k]
Q = [[HALF if k in succ(h) else Fr(0) for k in range(N)] for h in range(N)]
def mm(A, B): return [[sum((A[i][k]*B[k][j] for k in range(len(B)) if A[i][k]), Fr(0)) for j in range(len(B[0]))] for i in range(len(A))]
def T(A): return [list(r) for r in zip(*A)]
def eye(n): return [[Fr(int(i == j)) for j in range(n)] for i in range(n)]
def rank(A):
    A = [r[:] for r in A]; r = 0; m = len(A[0])
    for c in range(m):
        p = next((i for i in range(r, len(A)) if A[i][c] != 0), None)
        if p is None: continue
        A[r], A[p] = A[p], A[r]
        for i in range(len(A)):
            if i != r and A[i][c] != 0:
                f = A[i][c]/A[r][c]; A[i] = [x - f*y for x, y in zip(A[i], A[r])]
        r += 1
    return r

report = {}

# ===================== Part N: the natural extension =====================
# N1. Koopman compression: E[f(window_n) | window_0] = (Q^n f)(window_0) for n >= 0 and
#     (Q^T)^{|n|} f for n < 0, computed by exact enumeration of the bits eps_{-5..n} (Bernoulli).
Qpow = [eye(N)]
for n in range(1, 9): Qpow.append(mm(Qpow[-1], Q))
QT = T(Q); QTpow = [eye(N)]
for n in range(1, 9): QTpow.append(mm(QTpow[-1], QT))
def window(bits, n, lo):
    # bits[k - lo] = eps_k ; window at time n has bit i = eps_{n-i}
    return sum(bits[n - i - lo] << i for i in range(6))
for n in range(-8, 9):
    lo, hi = min(-5, n - 5), max(0, n)
    L = hi - lo + 1
    C = [[Fr(0)]*N for _ in range(N)]
    cnt = [0]*N
    for bits in product((0, 1), repeat=L):
        a = window(bits, 0, lo); b = window(bits, n, lo)
        C[a][b] += 1; cnt[a] += 1
    C = [[x / cnt[a] for x in C[a]] for a in range(N)]
    target = Qpow[n] if n >= 0 else QTpow[-n]
    assert C == target, f'compression mismatch at n={n}'
report['N1 Koopman compression P U^n P = Q^n (n>=0), (Q^T)^|n| (n<0)'] = 'exact for n = -8..8'

# N2. Q is doubly stochastic, Q^6 = J/64, Q nilpotent on the mean-zero space V0 but nonzero there.
assert all(sum(r) == 1 for r in Q) and all(sum(c) == 1 for c in zip(*Q))
assert Qpow[6] == [[Fr(1, 64)]*N for _ in range(N)]
P0 = [[Fr(int(i == j)) - Fr(1, 64) for j in range(N)] for i in range(N)]   # projector onto V0
QV0 = mm(P0, mm(Q, P0))
assert mm(P0, mm(Qpow[6], P0)) == [[Fr(0)]*N for _ in range(N)]
rQ = rank(QV0)
assert rQ == 31
# defects: I - Q^T Q and I - Q Q^T (Sz.-Nagy defect spaces) both rank 32
dQ = rank([[Fr(int(i == j)) - x for j, x in enumerate(r)] for i, r in enumerate(mm(QT, Q))])
dQs = rank([[Fr(int(i == j)) - x for j, x in enumerate(r)] for i, r in enumerate(mm(Q, QT))])
assert dQ == 32 and dQs == 32
report['N2 Q^6 = J/64; Q|V0 nilpotent (index <= 6), rank Q|V0'] = rQ
report['N2 defect ranks rank(I-Q^TQ), rank(I-QQ^T)'] = (dQ, dQs)

# N3. Finite-dimensional obstruction, concrete witness: for f(n) = <W^n x, y> with W finite
#     unitary, f vanishing for n >= 6 forces f = 0 (Vandermonde); a witness x, y in V0 with
#     <Q x, y> != 0 shows no finite unitary power dilation exists (proof in the .md).
x = [Fr(1) if (h & 2) else Fr(-1) for h in range(N)]        # mean zero: sign of bit 1
y = [Fr(1) if (h & 1) else Fr(-1) for h in range(N)]        # mean zero: sign of bit 0 (Qx = y)
assert sum(x) == 0 and sum(y) == 0
Qx = [sum(Q[h][k]*x[k] for k in range(N)) for h in range(N)]
ip = sum(a*b for a, b in zip(Qx, y)) / 64
assert Qx == y and ip == 1
assert all(sum(sum(Qpow[n][h][k]*x[k] for k in range(N))*y[h] for h in range(N)) == 0 for n in range(6, 9))
report['N3 witness <Qx,y> (x=+-bit1, y=+-bit0), <Q^n x,y>=0 for n>=6'] = str(ip)

# N4. Every support-respecting map agrees with the extension exactly half the time.
def sigma(beta): return tuple(((2*h) % 64) | (((h >> 5) & 1) ^ ((beta >> (h & 31)) & 1)) for h in range(N))
def islift(s): return len(set(s)) == N and all(s[h] in succ(h) for h in range(N))
for beta in (0, 0xffffffff, 0x55555555, 0x0000ffff, 0x12345678):
    s = sigma(beta); assert islift(s)
    agree = sum(Q[h][s[h]] for h in range(N)) / N
    assert agree == HALF
report['N4 P(h_{n+1} = sigma(h_n)) for lifts'] = '1/2'

# ===================== Part S: symmetries of the lift set =====================
M0, M1 = 0b101010, 0b010101
def rev(h): return int(format(h, '06b')[::-1], 2)
Ig = tuple(h ^ 63 for h in range(N)); Rg = tuple(rev(h) for h in range(N))
g0 = tuple(h ^ M0 for h in range(N)); g1 = tuple(h ^ M1 for h in range(N))
def inv(s):
    o = [0]*N
    for h, k in enumerate(s): o[k] = h
    return tuple(o)
def comp(a, b): return tuple(a[b[h]] for h in range(N))
def Iact(s): return comp(Ig, comp(s, Ig))
def Ract(s): return comp(Rg, comp(inv(s), Rg))
def Sact(s): return comp(g1, comp(s, g0))
def beta_of(s):
    assert islift(s)
    return sum(((s[h] & 1) ^ ((h >> 5) & 1)) << (h & 31) for h in range(32))
probe = [0, 0xffffffff, 0x55555555, 0xaaaaaaaa, 0x0000ffff, 0x12345678] + [1 << i for i in range(32)]
for b in probe:
    s = sigma(b)
    for f in (Iact, Ract, Sact): assert islift(f(s))
    assert Iact(Iact(s)) == s and Ract(Ract(s)) == s and Sact(Sact(s)) == s
    # on lifts the three induced maps commute (R's inversion absorbs the parity swap R M0 R = M1):
    assert Iact(Ract(s)) == Ract(Iact(s)) and Iact(Sact(s)) == Sact(Iact(s)) and Ract(Sact(s)) == Sact(Ract(s))
    assert beta_of(s) == b
grp8 = (lambda u: u, Iact, Ract, Sact, lambda u: Iact(Ract(u)), lambda u: Iact(Sact(u)),
        lambda u: Ract(Sact(u)), lambda u: Iact(Ract(Sact(u))))
orbit_sizes = Counter(len({f(sigma(b)) for f in grp8}) for b in probe)
assert len({f(sigma(0x12345678)) for f in grp8}) == 8          # the induced group has order exactly 8
report['S0 I,R,S induce commuting involutions on the 2^32 lifts (group Z2^3); orbit sizes on probes'] = dict(orbit_sizes)

# Linear (GF(2)) constraint systems for g_out sigma g_in^{-1} = sigma, i.e. sigma(g_in h) = g_out sigma(h)
def constraints(gin, gout):
    cons = []
    for h in range(N):
        h2 = gin[h]; xv = h & 31; yv = h2 & 31; ok = []
        for bx in (0, 1):
            t = gout[((2*h) % 64) | (((h >> 5) & 1) ^ bx)]
            if t >> 1 != (h2 & 31): continue
            ok.append((bx, (t & 1) ^ ((h2 >> 5) & 1)))
        if not ok: return None
        if len(ok) == 1: cons += [(xv, None, ok[0][0]), (yv, None, ok[0][1])]
        else: cons.append((xv, yv, ok[0][0] ^ ok[0][1]))
    return cons
class UF:
    def __init__(s, n=33): s.p = list(range(n)); s.v = [0]*n; s.ok = True
    def find(s, u):
        if s.p[u] == u: return u, 0
        r, q = s.find(s.p[u]); s.p[u] = r; s.v[u] ^= q; return r, s.v[u]
    def add(s, cons):
        if cons is None: s.ok = False; return s
        for xv, yv, c in cons:
            yv = 32 if yv is None else yv
            rx, px = s.find(xv); ry, py = s.find(yv)
            if rx == ry:
                if px ^ py != c: s.ok = False
            else: s.p[rx] = ry; s.v[rx] = px ^ py ^ c
        return s
    def free(s): return None if not s.ok else len({s.find(u)[0] for u in range(33)}) - 1
    def solutions(s):
        roots = sorted({s.find(u)[0] for u in range(32)} - {s.find(32)[0]})
        out = []
        for vals in product((0, 1), repeat=len(roots)):
            a = dict(zip(roots, vals)); a[s.find(32)[0]] = 0
            out.append(sum(((a[s.find(u)[0]] ^ s.find(u)[1]) & 1) << u for u in range(32)))
        return out
cI = constraints(Ig, Ig); cS = constraints(g0, g1)
fI, fS, fIS = UF().add(cI).free(), UF().add(cS).free(), UF().add(cI).add(cS).free()
assert (fI, fS, fIS) == (16, 16, 8)
uIS = UF().add(cI).add(cS)
fixIS = uIS.solutions(); assert len(fixIS) == 256
for b in fixIS: s = sigma(b); assert Iact(s) == s and Sact(s) == s
fix8 = [b for b in fixIS if Ract(sigma(b)) == sigma(b)]
assert len(fix8) == 64
basis = []
for b in fix8:
    for v in basis: b = min(b, b ^ v)
    if b: basis.append(b)
assert len(basis) == 6 and all((a ^ b) in set(fix8) for a in fix8 for b in fix8)
def ctype(s):
    seen = set(); c = []
    for h in range(N):
        if h in seen: continue
        l, k = 0, h
        while k not in seen: seen.add(k); k = s[k]; l += 1
        c.append(l)
    return tuple(sorted(c))
types = Counter(ctype(sigma(b)) for b in fix8)
assert 0 in fix8 and 0xffffffff in fix8
report['S1 |Fix I|, |Fix S|, |Fix <I,S>|'] = (2**fI, 2**fS, 2**fIS)
report['S1 |Fix <I,R,S>| (F2-linear subspace of beta, dim 6)'] = len(fix8)
report['S1 distinct cycle types among them'] = len(types)
report['S1 repeated cycle types'] = [k for k, v in types.items() if v > 1]

# S2. A5 pulled back through every signed dictionary D (46,080; 768 A5-classes).
pl = {v: i for i, p in enumerate(pairs) for v in p}
actions = []
for gr in proper:
    t = []; f = []
    for i, (a, b) in enumerate(pairs):
        j = pl[gr[a]]; t.append(j); f.append(0 if gr[a] == pairs[j][0] else 1)
    actions.append((tuple(t), tuple(f)))
assert len(set(actions)) == 60
def index(h, D):
    o = 0
    for i, xx in enumerate(D): o |= (((h >> i) & 1) ^ (xx & 1)) << (xx // 2)
    return o
def act_y(yv, a):
    axes, fl = a; o = 0
    for j in range(6): o |= (((yv >> j) & 1) ^ fl[j]) << axes[j]
    return o
def rho(D, a):
    idx = [index(h, D) for h in range(N)]; ii = {yv: h for h, yv in enumerate(idx)}
    return tuple(ii[act_y(idx[h], a)] for h in range(N))
def trD(D, a): return tuple(2*a[0][xx//2] + ((xx & 1) ^ a[1][xx//2]) for xx in D)
allD = sorted({tuple(2*p[i] + ((s >> i) & 1) for i in range(6)) for p in permutations(range(6)) for s in range(64)})
assert len(allD) == 46080
ident = tuple(range(N))
seen = set(); classes = []
for D in allD:
    if D in seen: continue
    orb = {trD(D, a) for a in actions}; assert len(orb) == 60
    seen |= orb; classes.append(min(orb))
assert len(classes) == 768
census = Counter(); exc = {}
for D in classes:
    gs = [rho(D, a) for a in actions]
    assert len(set(gs)) == 60
    full = UF()
    for g in gs: full.add(constraints(g, g))
    assert full.free() is None                       # no lift commutes with all of A5
    good = [g for g in gs if g != ident and UF().add(constraints(g, g)).free() is not None]
    census[len(good)] += 1
    if good:
        assert len(good) == 2 and comp(good[0], good[1]) == ident and comp(good[0], good[0]) == good[1]
        g = good[0]
        m = g[0]; perm = tuple((g[1 << i] ^ m).bit_length() - 1 for i in range(6))
        assert perm in ((2, 3, 4, 5, 0, 1), (4, 5, 0, 1, 2, 3))      # digit rotation i -> i +- 2
        u = UF().add(constraints(g, g)); assert u.free() == 0         # unique commuting lift
        (b,) = u.solutions()
        assert b in (0, 0xffffffff) and b in fix8
        exc[D] = (perm, m, b)
assert census == Counter({0: 720, 2: 48})
masks = Counter((p, m) for p, m, _ in exc.values())
assert set(masks) <= {((2, 3, 4, 5, 0, 1), 0), ((2, 3, 4, 5, 0, 1), 60), ((4, 5, 0, 1, 2, 3), 0), ((4, 5, 0, 1, 2, 3), 15)}
# group the 48 exceptional classes into Q24 <I,R,S> orbits of dictionaries
def Id(D): return tuple(xx ^ 1 for xx in D)
def Rd(D): return tuple(D[::-1])
def Sd(D): return tuple(xx ^ (i & 1) for i, xx in enumerate(D))
ops8 = [lambda d: d, Id, Rd, Sd, lambda d: Rd(Sd(d)), lambda d: Sd(Rd(d)), lambda d: Id(Rd(d)), lambda d: Id(Sd(d))]
def clsof(D): return min(trD(D, a) for a in actions)
orbits = {}
for D in exc:
    o = frozenset(clsof(op(D)) for op in ops8)
    assert o <= set(exc)                                # exceptional set is <I,R,S>-closed
    orbits.setdefault(o, set()).add(exc[D][2])
assert len(orbits) == 6 and all(len(v) == 1 and len(o) == 8 for o, v in orbits.items())
sel = Counter(next(iter(v)) for v in orbits.values())
assert sel == Counter({0: 3, 0xffffffff: 3})
report['S2 A5 classes: #nontrivial A5 elements commuting with some lift'] = dict(census)
report['S2 lifts commuting with all of rho_D(A5), every D'] = 0
report['S2 exceptional classes: unique C3-commuting lift (beta)'] = {hex(k): v for k, v in Counter(b for _, _, b in exc.values()).items()}
report['S2 exceptional Q24 orbits (of 96) and their selected beta'] = {hex(k): v for k, v in sel.items()}
report['S2 cycle types of the two C3-selected lifts'] = {hex(b): ctype(sigma(b)) for b in (0, 0xffffffff)}
report['cross-check'] = crosscheck

for k, v in report.items(): print(f'{k}: {v}')
print(f'Q61 certificate: all assertions passed in {time.time() - t0:.1f} s')
