#!/usr/bin/env python3
"""Q45 (Claude): which unsigned orders have a zero coset of the middle-flip defect.

Imports the original Q28 (hence Q3) source, Git-blob pinned, exactly as Q44 does; does
not import the Q42/Q43/Q44 scripts.  Exact integer arithmetic only; nothing is fitted.

Setting (Q42-Q44).  Unsigned order o (digit i -> code axis o_i), sign mask s,
code_{o,s}(h) = XOR_i (h_i ^ s_i) << o_i,  X_{o,s} = transported primitive Q2 (128 edges),
c_O(o,s) = edges of X_{o,s} in A5 orbital O (80 orbitals),
E_o(s) = sum_O (c_O(o,s) - c_O(o,s^12))^2.  o is "exceptional" iff E_o has a zero.

Proved here (each lemma checked on its full finite domain):
 L1  The signed axis maps g (2^6*720 = 46080) that permute the 80 A5 orbitals form a
     group N of order 240 = |N_B6(A5)|; N/A5 = {1, C, tau, C tau}, C = central inversion.
     For g in N: E_{g.o}(s ^ F_g) = E_o(s)  (orbital relabelling), so E is constant on
     N-orbits of orders.  C fixes every order; tau acts on the 12 classes as 6 transpositions.
 L2  The digit-side signed permutations (pi, t, t') with Q2[pi h ^ t, pi h' ^ t'] equal to
     Q2 or Q2^T have pi = identity (Q2) or pi = reversal R: i -> 5-i (Q2^T) only.
     Reversal gives E_{o R}(s) = E_o(rev s) (orbital transposition; rev(12) = 12).
 So the native order-map group G = <tau, R> acts on the 12 classes; E is G-invariant.
 OBSTRUCTION: G has 5 orbits, sizes (2,2,2 | 4,2).  The six exceptional orders are three
     G-orbits, not one; the digit-{4,5} swap suggested in Q44 is not native and does not
     preserve exceptionality ((0,1,2,5,3,4) exceptional -> (0,1,2,5,4,3) not).
 CRITERION (exact, checked on all 12 classes): A5 has a unique 5-element orbit T on the
     15 synthemes of the 6 axes (a total).  Pull it back to digits: T_o.  Every T_o
     contains exactly two even-odd synthemes (each pair joins an even and an odd digit).
     o is exceptional  <=>  these two are among the three "even" matchings
         P1 = 01|23|45,  P3 = 03|25|41,  P5 = 05|21|43     (pairs {i, i+d mod 6}, i even)
     <=>  T_o contains P1, P3 or P5.  Counting: each syntheme lies in exactly 2 of the 6
     totals, the three P_d lie in exactly 3 totals pairwise, and each total pulls back from
     exactly 2 order classes (tau-pairs), so exactly 6 of 12 orders are exceptional.
 The vanishing itself is still read off one representative per G-orbit (5 evaluations of 8
 coset values); a derivation of S_{o,s} = S_{o,s^12} from the total is NOT given.
"""
from __future__ import annotations
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

def signed_map(dst, f):            # code map: bit i -> bit dst[i], then xor f
    out = np.zeros(64, dtype=np.int64)
    for i in range(6):
        out |= ((ar >> i) & 1) << dst[i]
    return out ^ f

# ---- orbitals
orb = -np.ones((64, 64), dtype=np.int64); n = 0
for u in range(64):
    for v in range(64):
        if orb[u, v] < 0:
            orb[perms[:, u], perms[:, v]] = n; n += 1
check(n == 80, '80 orbitals')

# ---- L1: signed maps permuting the orbitals
N = []
for dst in permutations(range(6)):
    base = signed_map(dst, 0)
    for f in range(64):
        g = base ^ f
        img = orb[np.ix_(g, g)]
        lab = np.full(80, -1)
        lab[orb.ravel()] = img.ravel()          # last write wins; verify consistency
        if np.array_equal(lab[orb], img) and len(set(lab.tolist())) == 80:
            N.append((dst, f, g))
check(len(N) == 240, ('|N|', len(N)))
A5set = {tuple(p) for p in perms.tolist()}
Nset = {tuple(g.tolist()) for _, _, g in N}
for _, _, g in N:   # N normalises A5 (so it is N_B6(A5) intersected with orbital automorphisms)
    gi = np.empty(64, dtype=np.int64); gi[g] = ar
    check(all(tuple(g[p[gi]].tolist()) in A5set for p in perms), 'N normalises A5')
check(A5set <= Nset, 'A5 in N')

# ---- unsigned order classes (same representatives as Q44)
remaining = set(permutations(range(6))); orders = []; cls = {}
while remaining:
    o = min(remaining)
    orbit = {tuple(a[0][i] for i in o) for a in actions}
    check(len(orbit) == 60 and orbit <= remaining, 'free A5 action on orders')
    remaining -= orbit
    for x in orbit: cls[x] = len(orders)
    orders.append(o)
check(len(orders) == 12, '12 classes')

H_, B_ = np.r_[ar, ar], np.r_[2*ar % 64, (2*ar+1) % 64]
def code(o, s):
    return ((bits ^ np.array([(s >> i) & 1 for i in range(6)])) << np.array(o)).sum(axis=1)
def counts(o, s):
    c = code(o, s); return np.bincount(orb[c[H_], c[B_]], minlength=80).astype(np.int64)
def defect(o):
    return np.array([int(((counts(o, s) - counts(o, s ^ 12))**2).sum()) for s in range(64)])
E = {o: defect(o) for o in orders}

# action of N on classes; verify E_{g.o}(s ^ F) = E_o(s) on every order class and g
def left(dst, f, o, s):
    o2 = tuple(dst[x] for x in o)
    F = sum(((f >> o2[i]) & 1) << i for i in range(6))
    return o2, F
order_maps = set()
for dst, f, g in N:
    img = []
    for o in orders:
        o2, F = left(dst, f, o, 0)
        check(np.array_equal(g[code(o, 0)], code(o2, F)), 'left action on codes')
        Eo2 = defect(o2) if o2 not in E else E[o2]
        check(all(Eo2[s ^ F] == E[o][s] for s in range(64)), ('L1 E-invariance', o, dst, f))
        img.append(cls[o2])
    order_maps.add(tuple(img))
check(len(order_maps) == 2, 'N/A5 acts on classes through C2')
tau = [m for m in order_maps if m != tuple(range(12))][0]
check(all(tau[i] != i and tau[tau[i]] == i for i in range(12)), 'tau: six transpositions')

# ---- L2: digit-side signed permutations sending Q2 to Q2 or Q2^T
transl = {}
for t in range(64):
    for t2 in range(64):
        transl.setdefault(Q[np.ix_(ar ^ t, ar ^ t2)].tobytes(), (t, t2))
digit_ok = {}
for pi in permutations(range(6)):
    P = signed_map(pi, 0)                       # history map h -> pi-permuted digits
    M = Q[np.ix_(P, P)]
    # Q2 up to translation <=> M equals a translated copy of Q; Q2^T likewise for M^T
    isQ = M.tobytes() in transl
    isQT = np.ascontiguousarray(M.T).tobytes() in transl
    if isQ or isQT: digit_ok[pi] = (isQ, isQT)
R = (5, 4, 3, 2, 1, 0)
check(set(digit_ok) == {(0, 1, 2, 3, 4, 5), R}, ('L2 digit maps', digit_ok))
check(digit_ok[R] == (False, True) and digit_ok[(0, 1, 2, 3, 4, 5)] == (True, False), 'L2 kinds')
revm = lambda s: sum(((s >> i) & 1) << (5 - i) for i in range(6))
check(revm(12) == 12, 'rev(12) = 12')
Rmap = []
for o in orders:
    oR = tuple(o[5 - i] for i in range(6))
    EoR = defect(oR)
    check(all(EoR[s] == E[o][revm(s)] for s in range(64)), ('L2 reversal E-invariance', o))
    Rmap.append(cls[oR])

# ---- G-orbits
orbits = []; seen = set()
for i in range(12):
    if i in seen: continue
    orbit = {i}; todo = [i]
    while todo:
        x = todo.pop()
        for y in (tau[x], Rmap[x]):
            if y not in orbit: orbit.add(y); todo.append(y)
    seen |= orbit; orbits.append(sorted(orbit))
exc = {i for i, o in enumerate(orders) if (E[o] == 0).any()}
check(len(exc) == 6, 'six exceptional')
check(all(set(O) <= exc or not (set(O) & exc) for O in orbits), 'exceptionality is G-invariant')
exc_orbits = [O for O in orbits if set(O) <= exc]
check(sorted(len(O) for O in exc_orbits) == [2, 2, 2], 'three exceptional G-orbits')
check(sorted(len(O) for O in orbits if not set(O) & exc) == [2, 4], 'non-exceptional orbits 4+2')
# digit-{4,5} swap is not native
sw = lambda o: o[:4] + (o[5], o[4])
w = (0, 1, 2, 5, 3, 4)
check(cls[w] in exc and cls[sw(w)] not in exc, 'digit-45 swap breaks exceptionality')
check(sorted(set(E[(0,1,2,3,4,5)].tolist())) != sorted(set(E[(0,1,2,3,5,4)].tolist())),
      'digit-45 swap is not an E-isometry even where both are exceptional')

# ---- criterion via the A5-invariant total
def synthemes(S):
    S = list(S)
    if not S: yield frozenset(); return
    a = S[0]
    for b in S[1:]:
        for t in synthemes([x for x in S if x not in (a, b)]):
            yield t | {frozenset((a, b))}
SYN = list(synthemes(range(6)))
check(len(SYN) == 15, '15 synthemes')
A5u = [a[0] for a in actions]
def act_syn(d, t): return frozenset(frozenset(d[x] for x in pr) for pr in t)
syn_orbits = []; left_ = set(SYN)
while left_:
    t = next(iter(left_)); O = {act_syn(d, t) for d in A5u}; left_ -= O; syn_orbits.append(O)
check(sorted(len(O) for O in syn_orbits) == [5, 10], 'A5 syntheme orbits 5 + 10')
T = [O for O in syn_orbits if len(O) == 5][0]
check(len(set().union(*T)) == 15, 'T is a total (partitions the 15 duads)')
for _, _, g in N:                                  # tau preserves T too (so T_o is N-invariant)
    d = [int(g[1 << i] ^ g[0]).bit_length() - 1 for i in range(6)]
    check({act_syn(d, t) for t in T} == T, 'N preserves the total')
def pull(o):
    inv = {o[i]: i for i in range(6)}
    return {frozenset(frozenset(inv[x] for x in pr) for pr in t) for t in T}
S_ = lambda *pairs: frozenset(frozenset(p) for p in pairs)
even_odd = lambda t: all(len({x % 2 for x in pr}) == 2 for pr in t)
P = {1: S_((0,1),(2,3),(4,5)), 3: S_((0,3),(2,5),(4,1)), 5: S_((0,5),(2,1),(4,3))}
check(all(t == S_(*[(i, (i+d) % 6) for i in (0, 2, 4)]) for d, t in P.items()), 'P_d form')
ALT = [t for t in SYN if even_odd(t)]
check(len(ALT) == 6, 'six even-odd synthemes')
crit = {}
for i, o in enumerate(orders):
    To = pull(o)
    alt_in = [t for t in To if even_odd(t)]
    check(len(alt_in) == 2, ('two even-odd synthemes per total', o))
    k = sum(t in P.values() for t in alt_in)
    check(k in (0, 2), ('even-odd synthemes of a total are both P or both non-P', o))
    crit[i] = k == 2
check(all(crit[i] == (i in exc) for i in range(12)), 'CRITERION: exceptional <=> T_o contains P1, P3 or P5')
totals = {i: frozenset(pull(o)) for i, o in enumerate(orders)}
check(len(set(totals.values())) == 6 and all(totals[i] == totals[tau[i]] for i in range(12)),
      'six pulled-back totals, each from one tau-pair')
for t in SYN:
    check(sum(t in Tt for Tt in set(totals.values())) == 2, 'each syntheme in exactly two totals')
check(len({Tt for Tt in set(totals.values()) if any(p in Tt for p in P.values())}) == 3, 'P-totals: 3')

def fmt(i): return list(orders[i])
print(json.dumps({
    'task': 'Q45', 'type': 'THEOREM (G-invariance, total criterion) + OBSTRUCTION (no single native orbit)',
    'q3_git_blob': git_blob(Q3), 'q28_git_blob': git_blob(Q28),
    'orbital_automorphisms_signed': len(N), 'N_mod_A5_on_classes': 'C2 (tau, six transpositions)',
    'digit_maps_Q2_or_Q2T': {'identity': 'Q2', 'reversal': 'Q2^T'},
    'G_orbits': [[fmt(i) for i in O] for O in orbits],
    'exceptional_G_orbits': [[fmt(i) for i in O] for O in exc_orbits],
    'min_defect_by_orbit': [int(min(E[orders[i]].min() for i in O)) for O in orbits],
    'criterion': 'E_o has a zero  <=>  pulled-back A5 total T_o contains 01|23|45, 03|25|14 or 05|12|34',
    'digit_45_swap_native': False,
    'physical_ARFs': 'not derived', 'status': 'CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING',
    'elapsed_s': round(time.monotonic() - START, 2)}, indent=2))
