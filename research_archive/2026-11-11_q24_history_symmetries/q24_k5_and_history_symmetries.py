#!/usr/bin/env python3
"""Q24: native K5 for the Q20 pair, and the exact symmetries behind every
signed-dictionary cumulant collision.

Exact arithmetic in Q(sqrt5) throughout; no fitted, measured or random inputs.
Native source: the Q11 icosahedral hidden-5 quartic face source and five A4
singlet lines (rebuilt sympy-free in native_source_nosympy.py and, when sympy
is importable, cross-checked entry by entry against the original Q11 module).
Chronology: the fixed 64-history de Bruijn chain Q(h -> 2h, 2h+1 mod 64).

Fail-on-error. Prints what was proved.
"""
from collections import Counter, defaultdict
from contextlib import redirect_stdout
from io import StringIO
from itertools import permutations
from math import comb
from pathlib import Path
from fractions import Fraction as F
import importlib.util, json, runpy, sys, time

t0 = time.time()
here = Path(__file__).resolve().parent
sys.path.insert(0, str(here))
import native_source_nosympy as ns
K, Z = ns.K, ns.Z
vacua = ns.vacua
assert len(vacua) == 5

# ---- 0. cross-check against the original Q11 module where sympy exists ----
q11 = here.parent / '2026-11-10_signed_a5_covariance' / 'signed_a5_covariance.py'
if importlib.util.find_spec('sympy') is not None:
    with redirect_stdout(StringIO()):
        orig = runpy.run_path(str(q11))
    assert len(orig['vacua']) == 5
    for (t, r2, sc), (to, r2o, sco, _) in zip(vacua, orig['vacua']):
        assert [x.a for x in t] == [x.a for x in to] and [x.b for x in t] == [x.b for x in to]
        assert (r2.a, r2.b) == (r2o.a, r2o.b)
        assert [(x.a, x.b) for x in sc] == [(x.a, x.b) for x in sco]
    crosscheck = 'identical to original Q11 vacua (sympy present)'
else:
    crosscheck = 'skipped: sympy absent; sympy-free reconstruction used'

# ---- chain and exact cumulants ----
def q(v): return [(v[2*h % 64] + v[(2*h+1) % 64])/2 for h in range(64)]
def mean(v): return sum(v, Z)/64
def poisson(rhs):
    assert mean(rhs) == Z
    out = [Z]*64; cur = rhs
    for _ in range(6):
        out = [a+b for a, b in zip(out, cur)]; cur = q(cur)
    assert all(x == Z for x in cur)                     # Q^6 = J/64 on centred vectors
    assert all(a-b == c for a, b, c in zip(out, q(out), rhs))
    return out

def cumulants(g, N):
    """Stationary cumulant rates K1..KN of sum_n g(h_n) (Poisson/Taylor recursion
    of the Perron eigenvalue of diag(e^{sg})Q)."""
    r = [[K(1)]*64]; lam = [K(1)]; gp = [[K(1)]*64]
    for n in range(1, N+1):
        gp.append([a*b for a, b in zip(gp[-1], g)])
        s = [Z]*64
        for k in range(1, n+1):
            qr = q(r[n-k]); s = [x + comb(n, k)*a*b for x, a, b in zip(s, gp[k], qr)]
        lam.append(mean(s)); rhs = s[:]
        for k in range(1, n+1):
            rhs = [x - comb(n, k)*lam[k]*rv for x, rv in zip(rhs, r[n-k])]
        r.append(poisson(rhs))
    k = [Z]*(N+1)
    for n in range(1, N+1):
        k[n] = lam[n] - sum((comb(n-1, j-1)*k[j]*lam[n-j] for j in range(1, n)), Z)
    return k[1:]

def finite_moments(g, N, order):
    """Exact raw moments E[S_N^k], k<=order, stationary start, S_N = sum_{n=1..N} g(h_n)."""
    powers = [[K(1)]*64]
    for _ in range(order): powers.append([a*b for a, b in zip(powers[-1], g)])
    v = [[K(1)]*64] + [[Z]*64 for _ in range(order)]
    for _ in range(N):
        qv = [q(x) for x in v]
        v = [[sum((comb(k, j)*powers[j][h]*qv[k-j][h] for j in range(k+1)), Z)
              for h in range(64)] for k in range(order+1)]
    return [mean(x) for x in v]

def moments_to_cumulants(m):
    k = [Z]*len(m)
    for n in range(1, len(m)):
        k[n] = m[n] - sum((comb(n-1, j-1)*k[j]*m[n-j] for j in range(1, n)), Z)
    return k

def index(h, D):
    out = 0
    for i, x in enumerate(D): out |= (((h >> i) & 1) ^ (x & 1)) << (x//2)
    return out
def lines(D):
    ix = [index(h, D) for h in range(64)]
    return [([sc[j] for j in ix], r2) for _, r2, sc in vacua]

def key(x): return (x.a, x.b)

# ---- 1. native K2 multiset (regression) ----
base = (0, 2, 4, 6, 8, 10)
k2s = sorted((cumulants(g, 2)[1]/r2).a for g, r2 in lines(base))
assert k2s == sorted([F(67, 48), F(33, 16), F(25, 24), F(33, 16), F(5, 6)])

# ---- 2. Q24 proper: K5 for the Q20 pair ----
D = (0, 2, 4, 6, 8, 10); E = (0, 2, 8, 10, 7, 4)
def invariants(Dic, finite_check=True):
    rows = []
    for g, r2 in lines(Dic):
        k = cumulants(g, 5)
        assert k[0] == Z
        if finite_check:   # independent check: K5 = k5(S_25) - k5(S_24) exactly
            c25 = moments_to_cumulants(finite_moments(g, 25, 5))
            c24 = moments_to_cumulants(finite_moments(g, 24, 5))
            assert c25[5] - c24[5] == k[4], 'finite-time K5 mismatch'
        rows.append((k[1]/r2, k[2]*k[2]/(r2*r2*r2), k[3]/(r2*r2), k[4]*k[4]/(r2*r2*r2*r2*r2)))
    return sorted(rows, key=lambda row: tuple(key(x) for x in row))
ID, IE = invariants(D), invariants(E)
same = [tuple(map(key, a)) for a in ID] == [tuple(map(key, b)) for b in IE]
assert same, 'K5 separates the Q20 pair'
k4_q20 = sorted([K(F(7547, 900), F(447, 200)), K(F(280439, 28800), F(1503, 800)),
                 K(F(19163, 57600), F(103, 50)), K(F(552571, 19200), F(15201, 1600)),
                 K(F(502531, 19200), F(17631, 1600))], key=key)
assert sorted((row[2] for row in ID), key=key) == k4_q20    # reproduces Q20

# ---- 3. the exact history symmetries ----
M_ODD, M_EVEN = 0b101010, 0b010101
def succ(h): return {(2*h) % 64, (2*h+1) % 64}
def pred(h): return {h >> 1, (h >> 1) + 32}
def rev(h): return int(format(h, '06b')[::-1], 2)
# (a) every native vacuum line is even under complement of the six axis bits
for _, _, sc in vacua:
    assert all(sc[y] == sc[63 ^ y] for y in range(64))
# (b) reversal intertwines Q with Q^T: rev(succ(h)) = pred(rev(h))
assert all({rev(x) for x in succ(h)} == pred(rev(h)) for h in range(64))
# (c) alternation: the stream flip eps_k -> eps_k xor [k odd] acts on windows by
#     xor M_ODD at even times and xor M_EVEN at odd times; these two masks
#     alternate under Q: succ(h ^ M_ODD) = {x ^ M_EVEN for x in succ(h)} (and vice versa)
assert all(succ(h ^ M_ODD) == {x ^ M_EVEN for x in succ(h)} for h in range(64))
assert all(succ(h ^ M_EVEN) == {x ^ M_ODD for x in succ(h)} for h in range(64))
assert M_ODD ^ M_EVEN == 63
# Dictionary realisations (act on history bit positions):
def I(Dic): return tuple(x ^ 1 for x in Dic)                       # g o complement
def R(Dic): return tuple(Dic[::-1])                                # g o rev
def S(Dic): return tuple(x ^ (i & 1) for i, x in enumerate(Dic))   # g o (xor M_ODD)
for Dic in (D, E):
    for (g, _), (gI, _), (gR, _), (gS, _) in zip(lines(Dic), lines(I(Dic)), lines(R(Dic)), lines(S(Dic))):
        assert all(gI[h] == g[63 ^ h] == g[h] for h in range(64))
        assert all(gR[h] == g[rev(h)] for h in range(64))
        assert all(gS[h] == g[h ^ M_ODD] == g[h ^ M_EVEN] for h in range(64))
# Consequence (proved in the .md): for every N the law of S_N = sum g(h_n) is the
# same for g, g o rev and g o xor M_ODD. Executed check on the Q20 pair: finite
# moments to order 5 at N = 7 agree exactly for D and R(D), S(D), R(S(D)).
for g, _ in lines(D)[:2]:
    m = finite_moments(g, 7, 5)
    for gg in ([g[rev(h)] for h in range(64)], [g[h ^ M_ODD] for h in range(64)],
               [g[rev(h ^ M_ODD)] for h in range(64)]):
        assert finite_moments(gg, 7, 5) == m

# ---- 4. A5 action on dictionaries (Q12 convention) ----
pairs, proper, faces, faceid = ns.pairs, ns.proper, ns.faces, ns.faceid
pair_lookup = {v: i for i, p in enumerate(pairs) for v in p}
actions = []
for gr in proper:
    target = []; flips = []
    for i, (a, b) in enumerate(pairs):
        j = pair_lookup[gr[a]]; target.append(j); flips.append(0 if gr[a] == pairs[j][0] else 1)
    actions.append((tuple(target), tuple(flips)))
assert len(set(actions)) == 60
def transform(Dic, a):
    axes, flips = a
    return tuple(2*axes[x//2] + ((x & 1) ^ flips[x//2]) for x in Dic)

# The explicit conjugacy for the Q20 pair.
witness = None
for name, op in (('I', I), ('R', R), ('S', S), ('RS', lambda x: R(S(x))), ('SR', lambda x: S(R(x))),
                 ('IR', lambda x: I(R(x))), ('IS', lambda x: I(S(x)))):
    for ai, a in enumerate(actions):
        if transform(op(D), a) == E:
            witness = (name, ai); break
    if witness: break
assert witness is not None, 'Q20 pair not related by A5 x <I,R,S>'
assert not any(transform(D, a) == E or transform(I(D), a) == E for a in actions)  # Q15: non-parity

# ---- 5. census: orbits of A5 x <I,R,S> on all 46,080 signed dictionaries ----
allD = {tuple(2*p[i] + ((s >> i) & 1) for i in range(6)) for p in permutations(range(6)) for s in range(64)}
assert len(allD) == 46080
ops8 = [lambda x: x, I, R, S, lambda x: R(S(x)), lambda x: S(R(x)), lambda x: I(R(x)), lambda x: I(S(x))]
group8 = {op(D) for op in ops8}
assert len(group8) == 8                                     # <I,R,S>: dihedral of order 8
assert all(R(S(R(x))) == I(S(x)) and R(S(R(S(x)))) == I(x) for x in (D, E))   # RSR = IS, (RS)^2 = I
remaining = set(allD); orbits = []
while remaining:
    d0 = min(remaining)
    orb = {transform(op(d0), a) for op in ops8 for a in actions}
    # closure check: the 480 maps form a group on dictionaries
    assert all(transform(op(x), a) in orb for x in list(orb)[:3] for op in ops8 for a in actions)
    assert orb <= remaining
    remaining -= orb; orbits.append((d0, len(orb)))
sizes = Counter(n for _, n in orbits)
assert sizes == Counter({480: 96}), sizes

# K2-I3 signature on one representative per orbit (independent of Q15's code).
def sig23(Dic):
    out = []
    for g, r2 in lines(Dic):
        k = cumulants(g, 3)
        out.append((key(k[1]/r2), key(k[2]*k[2]/(r2*r2*r2))))
    return tuple(sorted(out))
sigs = [sig23(d0) for d0, _ in orbits]
assert len(set(sigs)) == 96, 'orbits not separated by K2-I3'
# Invariance spot check on the first four orbits (all eight history symmetries).
for d0, _ in orbits[:4]:
    assert {sig23(op(d0)) for op in ops8} == {sig23(d0)}
    assert {sig23(transform(d0, a)) for a in actions[::12]} == {sig23(d0)}   # Q11 joint A5 covariance

print(json.dumps({
    'task': 'Q24',
    'result': 'THEOREM (exact all-order collision mechanism) + OBSTRUCTION (no cumulant order separates)',
    'source_crosscheck': crosscheck,
    'K5_separates_Q20_pair': False,
    'joint_I2_I3_I4_I5_multisets_equal': True,
    'I5 = K5^2/r2^5 (sorted with I2)': [[str(row[0]), str(row[3])] for row in ID],
    'finite_time_K5_25_minus_24': 'exact 10/10',
    'history_symmetries': {'I': 'complement (trivial: lines even)', 'R': 'bit reversal, Q -> Q^T',
                           'S': 'alternating stream flip, masks 101010/010101'},
    'Q20_pair_relation': f'E = a{witness[1]} . {witness[0]}(D), a in A5',
    'orbits_A5_x_<I,R,S>_on_46080': dict(sizes),
    'distinct_K2_I3_signatures_on_orbit_reps': len(set(sigs)),
    'consequence': 'K2-I3 classes = symmetry orbits; every collision persists at every order and in the finite-N law',
    'physical_ARFs': 'not derived',
    'seconds': round(time.time() - t0, 1)}, indent=2))
