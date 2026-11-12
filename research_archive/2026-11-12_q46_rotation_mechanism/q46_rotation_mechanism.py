#!/usr/bin/env python3
"""Q46 (Claude): the zero middle-flip coset is derived from one order-3 element of A5.

Imports the original Q28 (hence Q3) source, Git-blob pinned, as Q44/Q45 do; does not import
the Q42-Q45 scripts.  Exact integer arithmetic only; nothing is fitted.

Setting (Q42-Q45).  Digit i -> code axis o_i, mask s, code_{o,s}(h) = XOR_i (h_i^s_i) << o_i,
Q2 edges E_0 = {(h, Lh ^ c) : h in F2^6, c in F2}, Lh = 2h mod 64 (digit shift i -> i+1),
X_{o,s} = code_{o,s}(E_0), c_O(o,s) = edges of X_{o,s} in A5 orbital O (80 orbitals).
o is exceptional iff c(o,s) = c(o,s^12) for some s (Q42-Q45: exactly 6 of 12 classes).

rho = digit rotation i -> i+2 (mod 6); Z = cyclic digit shift i -> i+1 (mod 6).
D(t) = (t ^ Lt) with digit 0 cleared;  E_0 ^ (t,t) = E_{D(t)} := {(h, Lh ^ D(t) ^ c)}.

Proved (each step checked on its full finite domain):
 L1 (realisation)  An element g of A5 acts through o on digits as rho^{+-1} (with some digit
    signs eps_o) iff o is exceptional; for those o such g form exactly one C3 subgroup.
    Derivation: rho fixes exactly the synthemes P1, P3, P5; an order-3 element of A5 fixes
    exactly two synthemes of the total T (A5 acts on T as on 5 points), so T_o contains two P's
    (Q45 criterion).  Conversely the two P's of T_o have a C3 common stabiliser in A5, and the
    only order-3 digit maps preserving both are the hexagon rotations rho^{+-1}.
 L2 (frame)  eps_o lies in Im(1 + rho), so for t0 with t0 ^ rho t0 = eps_o and s* = s ^ t,
    t = s ^ t0, g(code_{o,s*}(h)) = code_{o,s*}(rho h) for all h: in that frame g IS rho, and
    X_{o,s} = code_{o,s*}(E_D), X_{o,s^12} = code_{o,s*}(E_{D^20}), D = D(s ^ t0).
 L3 (moving cut)  rho^j E_D = {(k, Zk ^ y) : y in {rho^j D, rho^j D ^ e_{2j}}} : rotating the
    Q2 shift moves its cut from 5|0 to 1|2 to 3|4.  Hence the <rho>-symmetrised edge multiset
    of E_D is determined by the multiset Y_D = {rho^j D, rho^j(D ^ e0)}_j, i.e. by the
    multiset of rho-orbits {[D], [D ^ e0]}.
 L4 (solution)  {[D],[D^e0]} = {[D^20],[D^e0^20]}  <=>  D in {4, 16, 46, 58} (digit 0 cleared).
    Derivation: the crossed match needs (1+rho^k)D = 21, impossible (odd parity on the even
    digits); the straight match needs the odd part in {0, 42} and the even part
    (x0,x1,x2) on digits (0,2,4) to solve (1+rho)x = 20 & (1+rho^2)x = 5, or
    (1+rho^2)x = 20 & (1+rho)x = 17; the solutions with x0 = 0 are e2 and e4.
 THEOREM  For each exceptional o, every s with D(s ^ t0) in {4,16,46,58} has equal <g>-orbital,
    hence equal A5-orbital, counts: c(o,s) = c(o,s^12), so S_{o,s} = S_{o,s^12}.  This set has
    8 masks; it equals the census zero set (so the zero coset is derived, not read off).
 Also checked: the A4-orbital identity holds on the same 8 masks for both A4 = Stab(P) with
    P in T_o, and on no mask for the other three A4's of T_o; no V4, C2, C5 or other C3 of A5
    gives it on any mask.  The converse (A5-orbital equality => <g>-orbital equality) is
    checked by census, not derived.
"""
from __future__ import annotations
from collections import Counter
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
perms = np.array([np.asarray(p, dtype=np.int64) for p in perms])
bits = np.asarray(bits, dtype=np.int64)
check(perms.shape == (60, 64) and bits.shape == (64, 6), 'Q28 data')
for h in range(64):
    check(Q[h].sum() == 2 and Q[h, 2*h % 64] == 1 and Q[h, (2*h+1) % 64] == 1, 'primitive Q2')
check(all(bits[h, i] == (h >> i) & 1 for h in range(64) for i in range(6)), 'bit convention')
ar = np.arange(64)

# ---- A5 as signed axis maps g(u) = pi(u) ^ f
def axis_map(dst):
    out = np.zeros(64, dtype=np.int64)
    for i in range(6): out |= ((ar >> i) & 1) << dst[i]
    return out
A5 = []
for p in perms:
    f = int(p[0]); dst = tuple(int(p[1 << i] ^ f).bit_length() - 1 for i in range(6))
    check(np.array_equal(axis_map(dst) ^ f, p), 'A5 element is a signed axis map')
    A5.append((dst, f, p))
def order(p):
    q, k = p.copy(), 1
    while not np.array_equal(q, ar): q, k = p[q], k + 1
    return k

def orbitals(G):
    lab = -np.ones((64, 64), dtype=np.int64); n = 0
    for u in range(64):
        for v in range(64):
            if lab[u, v] < 0:
                for g in G: lab[g[u], g[v]] = n
                n += 1
    return lab, n
orb, n80 = orbitals(perms)
check(n80 == 80, '80 orbitals')

# ---- orders (same class representatives as Q44/Q45)
remaining = set(permutations(range(6))); orders = []
while remaining:
    o = min(remaining)
    orbit = {tuple(a[0][i] for i in o) for a in actions}
    check(len(orbit) == 60 and orbit <= remaining, 'free A5 action on orders')
    remaining -= orbit; orders.append(o)
check(len(orders) == 12, '12 classes')

H_, B_ = np.r_[ar, ar], np.r_[2*ar % 64, (2*ar+1) % 64]
def code(o, s):
    return ((bits ^ np.array([(s >> i) & 1 for i in range(6)])) << np.array(o)).sum(axis=1)
def cnt(o, s, lab=orb, n=80):
    c = code(o, s); return np.bincount(lab[c[H_], c[B_]], minlength=n)
census = {o: [s for s in range(64) if np.array_equal(cnt(o, s), cnt(o, s ^ 12))] for o in orders}
exc = [o for o in orders if census[o]]
check(len(exc) == 6 and all(len(census[o]) == 8 for o in exc), 'census: six orders, 8 zero masks each')

# ---- digit-side maps
def dperm(p, h): return sum(((h >> i) & 1) << p[i] for i in range(6))
RHO, RHO2 = (2, 3, 4, 5, 0, 1), (4, 5, 0, 1, 2, 3)
ZSH = (1, 2, 3, 4, 5, 0)
rho = lambda h, j=1: h if j % 3 == 0 else rho(dperm(RHO, h), j - 1)
L = lambda h: (h << 1) & 63
Dof = lambda t: (t ^ L(t)) & 62
par = lambda x: bin(x).count('1') & 1

# synthemes / total (as in Q45)
def synthemes(S):
    S = list(S)
    if not S: yield frozenset(); return
    a = S[0]
    for b in S[1:]:
        for t in synthemes([x for x in S if x not in (a, b)]): yield t | {frozenset((a, b))}
SYN = list(synthemes(range(6)))
act = lambda d, t: frozenset(frozenset(d[x] for x in pr) for pr in t)
T = [t for t in SYN if len({act(d, t) for d, _, _ in A5}) == 5]
check(len(T) == 5 and len(set().union(*T)) == 15, 'A5-invariant total T')
S_ = lambda *pairs: frozenset(frozenset(p) for p in pairs)
P = [S_((0,1),(2,3),(4,5)), S_((0,3),(2,5),(4,1)), S_((0,5),(2,1),(4,3))]
check([t for t in SYN if act(RHO, t) == t] == [t for t in SYN if t in P] and len(P) == 3,
      'rho fixes exactly the synthemes P1, P3, P5')
for d, f, p in A5:          # A5 acts faithfully on T; order-3 elements fix exactly 2 of 5
    if order(p) == 3: check(sum(act(d, t) == t for t in T) == 2, 'C3 fixes two synthemes of T')
# order-3 digit maps preserving two P's are rho^{+-1}
for a in range(3):
    for b in range(a + 1, 3):
        c3 = [q for q in permutations(range(6)) if act(q, P[a]) == P[a] and act(q, P[b]) == P[b]
              and q != tuple(range(6)) and tuple(q[q[q[i]]] for i in range(6)) == tuple(range(6))]
        check(sorted(c3) == sorted([RHO, RHO2]), 'hexagon P_a u P_b: only rho^{+-1}')

# ---- L1 realisation <=> exceptional ; L2 frame
Im1r = {t ^ rho(t) for t in range(64)}
check(len(Im1r) == 16, 'Im(1+rho) has 16 elements')
GOOD_D = [D for D in range(0, 64, 2)
          if
          Counter(x for j in range(3) for x in (rho(D, j), rho(D ^ 1, j))) ==
          Counter(x for j in range(3) for x in (rho(D ^ 20, j), rho(D ^ 21, j)))]
check(GOOD_D == [4, 16, 46, 58], ('L4 Y-condition solutions', GOOD_D))
# L4 algebra: crossed match impossible, straight match as stated
check(all((D ^ rho(D, k)) != 21 for D in range(64) for k in (1, 2)), 'crossed match impossible')
rows = []
for o in orders:
    inv = {o[i]: i for i in range(6)}
    hits = []
    for d, f, p in A5:
        dig = tuple(inv[d[o[i]]] for i in range(6))
        if dig in (RHO, RHO2):
            hits.append((dig, sum(((f >> o[i]) & 1) << i for i in range(6)), p))
    To = {frozenset(frozenset(inv[x] for x in pr) for pr in t) for t in T}
    check(bool(hits) == (o in exc) == (sum(t in P for t in To) == 2), ('L1 realisation <=> exceptional', o))
    if not hits: continue
    sub = {frozenset(tuple(q.tolist()) for q in (ar, p, p[p])) for _, _, p in hits}
    check(len(hits) == 2 and len(sub) == 1, 'exactly one C3 realises rho^{+-1}')
    dig, eps, g = [x for x in hits if x[0] == RHO][0]
    check(eps in Im1r, 'L2: eps_o in Im(1+rho)')
    t0 = min(t for t in range(64) if t ^ rho(t) == eps)
    # g acts as rho in frame s* = t0: g(code_{o,t0}(h)) = code_{o,t0}(rho h)
    c0 = code(o, t0)
    check(all(g[c0[h]] == c0[rho(h)] for h in range(64)), 'L2: g = rho in frame t0')
    # Pdigit-syntheme stabiliser A4's contain <g>; the A4 identity
    lab3, n3 = orbitals([ar, g, g[g]])
    pred = sorted(s for s in range(64) if Dof(s ^ t0) in GOOD_D)
    for s in range(64):
        # L2: X_{o,s} = code_{o,t0}(E_{D(s^t0)}) and X_{o,s^12} likewise with D ^ 20
        Dv = Dof(s ^ t0)
        Es = {(h, L(h) ^ Dv ^ c) for h in range(64) for c in (0, 1)}
        Xs = set(zip(code(o, s)[H_].tolist(), code(o, s)[B_].tolist()))
        check(Xs == {(int(c0[a]), int(c0[b])) for a, b in Es}, 'L2 frame identity')
        check(Dof((s ^ 12) ^ t0) == Dv ^ 20, 'middle flip is D -> D ^ 20')
        eq3 = np.array_equal(cnt(o, s, lab3, n3), cnt(o, s ^ 12, lab3, n3))
        check(eq3 == (s in pred), ('THEOREM: <g>-orbital identity exactly on predicted masks', o, s))
    check(len(pred) == 8 and pred == census[o], ('THEOREM: predicted = census zero set', o))
    # A4 stabilisers of the five synthemes of T_o
    for t in T:
        A4 = [p for d, f, p in A5 if act(d, t) == t]
        check(len(A4) == 12, 'A4 stabiliser')
        lab4, n4 = orbitals(A4)
        z4 = [s for s in range(64) if np.array_equal(cnt(o, s, lab4, n4), cnt(o, s ^ 12, lab4, n4))]
        isP = frozenset(frozenset(inv[x] for x in pr) for pr in t) in P
        check(z4 == (census[o] if isP else []), ('A4 identity: P-stabilisers only', o))
        if isP: check(all(any(np.array_equal(q, x) for q in A4) for x in (g, g[g])), '<g> in both P-A4s')
        V4 = [p for p in A4 if order(p) <= 2]
        labv, nv = orbitals(V4)
        check(not any(np.array_equal(cnt(o, s, labv, nv), cnt(o, s ^ 12, labv, nv)) for s in range(64)),
              'V4 gives no identity')
    # no other cyclic subgroup of A5 gives the identity on any mask
    cyc = {}
    for d, f, p in A5:
        if order(p) > 1:
            K = [ar]; q = p
            while not np.array_equal(q, ar): K.append(q); q = p[q]
            cyc.setdefault(frozenset(tuple(x.tolist()) for x in K), K)
    check(len(cyc) == 31, '31 cyclic subgroups')
    works = []
    for key, K in cyc.items():
        labk, nk = orbitals(K)
        if any(np.array_equal(cnt(o, s, labk, nk), cnt(o, s ^ 12, labk, nk)) for s in range(64)):
            works.append(key)
    check(works == [next(iter(sub))], 'only <g> among cyclic subgroups')
    rows.append({'order': list(o), 'eps_o': eps, 't0': t0, 'zero_masks': pred})

# ---- L3 moving cut, for all D (digit-0 free) and j
for D in range(64):
    ED = [(h, L(h) ^ D ^ c) for h in range(64) for c in (0, 1)]
    for j in range(3):
        lhs = {(rho(a, j), rho(b, j)) for a, b in ED}
        rhs = {(k, dperm(ZSH, k) ^ y) for k in range(64) for y in (rho(D, j), rho(D, j) ^ (1 << (2*j % 6)))}
        check(lhs == rhs, 'L3 moving cut')
    sym = Counter((rho(a, j), rho(b, j)) for a, b in ED for j in range(3))
    Y = Counter(x for j in range(3) for x in (rho(D, j), rho(D ^ 1, j)))
    check(sym == Counter({(k, dperm(ZSH, k) ^ y): m for k in range(64) for y, m in Y.items()}),
          'L3 symmetrised multiset = Z-graph of Y_D')

print(json.dumps({
    'task': 'Q46', 'type': 'THEOREM (zero coset derived from one C3 of A5) + checked converse',
    'q3_git_blob': git_blob(Q3), 'q28_git_blob': git_blob(Q28),
    'mechanism': 'g in A5 acting through o as digit rotation i->i+2; in the frame s*=t0 it is rho; '
                 'rotating Q2 moves its cut; the symmetrised edge multiset depends on D only via '
                 'the rho-orbits {[D],[D^1]}; middle flip D->D^20 preserves them iff D in {4,16,46,58}',
    'exceptional_orders': rows,
    'A4_identity': 'holds exactly on the zero masks for both P-syntheme A4s; never for the other three',
    'V4_or_other_cyclic': 'no identity on any mask',
    'physical_ARFs': 'not derived', 'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'elapsed_s': round(time.monotonic() - START, 2)}, indent=2))
