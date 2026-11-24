#!/usr/bin/env python3
"""Exact finite checks for the Green regular-character lane (grok_swarm/green_regular_character).
Upstream: leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005.
Pure integer / polynomial arithmetic over F_g and Z[zeta_N]/Phi_N. No floating point, no random data.
These are INSTANCE checks of statement content; they do not prove the general theorems.
Fails (nonzero exit) on any mismatch."""
import itertools, sys
from collections import Counter
from sympy import cyclotomic_poly, Poly, symbols, primerange
X = symbols('X')
fail = []
def check(c, msg):
    print(("ok   " if c else "FAIL ") + msg)
    if not c: fail.append(msg)

# ---------- polynomials over F_g as coefficient tuples (low->high), monic ----------
def pmul(a, b, g):
    r = [0]*(len(a)+len(b)-1)
    for i, x in enumerate(a):
        for j, y in enumerate(b): r[i+j] = (r[i+j] + x*y) % g
    return tuple(r)
def monics(g, n):  # monic degree n
    for c in itertools.product(range(g), repeat=n): yield tuple(c) + (1,)
def irreducibles(g, n, cache={}):
    key = (g, n)
    if key in cache: return cache[key]
    if n == 0: return []
    red = set()
    for a in range(1, n//2+1):
        for p in all_monics_set(g, a):
            for q in all_monics_set(g, n-a): red.add(pmul(p, q, g))
    res = [f for f in monics(g, n) if f not in red]
    cache[key] = res; return res
_ms = {}
def all_monics_set(g, n):
    if (g, n) not in _ms: _ms[(g, n)] = list(monics(g, n))
    return _ms[(g, n)]
def primelabs(g, n):  # IsPrimeLab n P : monic, irreducible, coeff 0 != 0, natDegree n
    return [f for f in irreducibles(g, n) if f[0] != 0]

# (A) GrPolys.card_monic_coeff_zero_ne_zero instance and (B) the factorisation injection used in `count`
for g in [2, 3, 5]:
    for n in range(1, {2: 7, 3: 5, 5: 3}[g] + 1):
        T = [f for f in monics(g, n) if f[0] != 0]
        check(len(T) == g**n - g**(n-1), f"(A) g={g} n={n}: #monic deg n with f(0)!=0 = {len(T)} = g^n-g^(n-1)")
        # multisets of prime labels of total degree n, built bottom-up, multiplied out
        labs = [(d, P) for d in range(1, n+1) for P in primelabs(g, d)]
        prods = Counter()
        def rec(i, rem, acc):
            if rem == 0: prods[acc] += 1; return
            if i == len(labs): return
            d, P = labs[i]
            k = 0; a = acc
            while k*d <= rem:
                rec(i+1, rem - k*d, a)
                a = pmul(a, P, g); k += 1
        rec(0, n, (1,))
        check(set(prods) == set(T) and all(v == 1 for v in prods.values()),
              f"(B) g={g} n={n}: multisets of prime labels of total degree n <-> T bijectively ({sum(prods.values())} multisets)")

# (C) green_of_regular bridge count: regular Frobenius orbits of characters of F_{g^d}^* <-> IsPrimeLab d polys
for g in [2, 3, 5, 7]:
    for d in range(1, {2: 8, 3: 5, 5: 4, 7: 3}[g] + 1):
        N = g**d - 1
        reg = [k for k in range(N) if len({k*pow(g, i, N) % N for i in range(d)}) == d] if N > 1 else ([0] if d == 1 else [])
        if N == 1: reg = [0]  # g=2,d=1: trivial group, the unique character is regular (d=1)
        orbits = {frozenset(k*pow(g, i, N) % N for i in range(d)) if N > 1 else frozenset([0]) for k in reg}
        npl = len(primelabs(g, d)) if d <= ({2: 8, 3: 5, 5: 3, 7: 2}[g]) else None
        if npl is None:
            # necklace formula (Gauss) for monic irreducibles, minus X when d=1
            from sympy import mobius, divisors
            npl = sum(mobius(d//e)*g**e for e in divisors(d))//d - (1 if d == 1 else 0)
            src = "Gauss formula"
        else: src = "enumeration"
        check(len(orbits) == npl, f"(C) g={g} d={d}: #regular orbits={len(orbits)} = #IsPrimeLab d ({src})={npl}")
        check(all(len(o) == d for o in orbits), f"(C') g={g} d={d}: every regular orbit has exactly d elements")

# (D) GL_2(F_q) instance of the GreenRegularCharacters statement content, q in {2,3,5}, exact in Z[zeta_N]/Phi_N
# Class function: standard cuspidal character attached to regular theta (literature formula, used only as an instance):
#  central a: (q-1)theta(a); a*unipotent (non-semisimple): -theta(a); split a!=b: 0; elliptic z: -(theta(z)+theta(z^q)).
# Checks: degree = prod_{i=1}^{d-1}(q^i-1) = q-1; value on irreducible-charpoly y equals (-1)^(d-1) sum_i theta(z^(q^i));
# norm <chi,chi> = 1; Lean IsCusp radical sum res 1 1 chi 1 1 = 0; tau_theta = tau_theta' iff theta' in {theta, theta^q};
# number of distinct tau equals #IsPrimeLab 2 = (q^2-q)/2.
def gf_tables(q):
    # F_{q^2} = F_q[t]/(m(t)), m a monic irreducible quadratic; elements (a,b) = a + b t
    m = primelabs(q, 2)[0]  # (c0, c1, 1): t^2 = -c1 t - c0
    c0, c1 = m[0], m[1]
    def mul(x, y):
        a, b = x; c, d = y
        bd = b*d
        return ((a*c - bd*c0) % q, (a*d + b*c - bd*c1) % q)
    elems = [(a, b) for a in range(q) for b in range(q) if (a, b) != (0, 0)]
    N = q*q - 1
    for gen in elems:
        p = (1, 0); seen = {}
        for k in range(N):
            seen[p] = k; p = mul(p, gen)
        if len(seen) == N: return mul, gen, seen, N
for q in [2, 3, 5]:
    mul, gen, log, N = gf_tables(q)
    Phi = Poly(cyclotomic_poly(N, X), X)
    def zeta(k): return Poly(X**(k % N), X).rem(Phi)
    # GL_2(F_q) elements and their eigen-structure
    G = [((a, b), (c, d)) for a in range(q) for b in range(q) for c in range(q) for d in range(q) if (a*d - b*c) % q]
    def classify(M):
        (a, b), (c, d) = M
        tr, det = (a + d) % q, (a*d - b*c) % q
        roots = [x for x in range(q) if (x*x - tr*x + det) % q == 0]
        if len(roots) == 0:
            # root z in F_{q^2}: find (u,v) with z^2 - tr z + det = 0
            for z in log:
                z2 = mul(z, z)
                if ((z2[0] - tr*z[0] + det) % q, (z2[1] - tr*z[1]) % q) == (0, 0): return ('ell', z)
        if len(roots) == 2: return ('split', roots)
        r = roots[0]
        return ('central', r) if (b, c, (a - d) % q) == (0, 0, 0) else ('unip', r)
    cls = [classify(M) for M in G]
    Fq_in = lambda x: (x % q, 0)  # embed F_q* into F_{q^2}*
    def chi_k(k):  # theta = zeta^(k*log)
        th = lambda z: k*log[z] % N
        vals = []
        for c in cls:
            if c[0] == 'central': vals.append((q-1)*zeta(th(Fq_in(c[1]))))
            elif c[0] == 'unip': vals.append(-zeta(th(Fq_in(c[1]))))
            elif c[0] == 'split': vals.append(Poly(0, X))
            else:
                z = c[1]; zq = (1, 0)
                for _ in range(q): zq = mul(zq, z)
                vals.append(-(zeta(th(z)) + zeta(th(zq))))
        return vals
    def conj(p):  # zeta^j -> zeta^(-j)
        r = Poly(0, X)
        for (j,), co in p.terms(): r += co*zeta(-j)
        return r.rem(Phi)
    def ip(u, v):
        s = Poly(0, X)
        for a, b in zip(u, v): s += a*conj(b)
        return s.rem(Phi)
    regk = [k for k in range(N) if (k*q - k) % N != 0]
    distinct = {}
    for k in regk:
        v = chi_k(k)
        i1 = G.index(((1, 0), (0, 1)))
        check(v[i1] == Poly(q - 1, X), f"(D) q={q} k={k}: tau(1) = q-1 = prod_(i=1)^(d-1)(q^i-1)")
        nrm = ip(v, v)
        check(nrm == Poly(len(G), X), f"(D) q={q} k={k}: sum |tau|^2 = |G| = {len(G)} (norm 1)")
        rad = Poly(0, X)
        for b in range(q): rad += v[G.index(((1, b), (0, 1)))]
        check(rad.rem(Phi) == Poly(0, X), f"(D) q={q} k={k}: Lean IsCusp radical sum over [[1,b],[0,1]] vanishes")
        distinct.setdefault(tuple(str(x.as_expr()) for x in v), set()).add(k)
    orbit_ok = all(s == {s0 for s0 in s} and len(s) == 2 and {(k*q) % N for k in s} == s for s in distinct.values())
    check(orbit_ok, f"(D) q={q}: tau_k = tau_k' iff k' in {{k, qk}} (each fibre is one Frobenius orbit of size 2)")
    check(len(distinct) == len(primelabs(q, 2)) == (q*q - q)//2,
          f"(D) q={q}: #distinct cuspidal tau = {len(distinct)} = #IsPrimeLab 2 = (q^2-q)/2")
print("FAILURES:", len(fail))
sys.exit(1 if fail else 0)
