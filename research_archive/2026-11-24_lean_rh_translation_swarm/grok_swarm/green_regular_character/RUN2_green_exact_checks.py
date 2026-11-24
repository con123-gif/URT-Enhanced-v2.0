"""RUN2 exact finite checks (green_regular_character lane).
Exact arithmetic only: elements of Z[zeta_m] are integer exponent-count vectors reduced modulo the m-th cyclotomic
polynomial with sympy at the end; all divisions are exact Fractions.  These are illustrations of the statements for
GL_2(F_p), not proofs of the general Lean declarations.
"""
from fractions import Fraction
from itertools import product
import sympy as sp
X = sp.symbols('x')

def red(vec, m):
    """value of sum vec[e] zeta_m^e as a sympy expr reduced mod Phi_m"""
    poly = sum(int(c) * X**e for e, c in enumerate(vec))
    return sp.rem(sp.expand(poly), sp.cyclotomic_poly(m, X), X)

def gl2(p):
    return [(a, b, c, d) for a, b, c, d in product(range(p), repeat=4) if (a*d - b*c) % p]
def mul(g, h, p):
    a, b, c, d = g; e, f, gg, hh = h
    return ((a*e + b*gg) % p, (a*f + b*hh) % p, (c*e + d*gg) % p, (c*f + d*hh) % p)
def inv(g, p):
    a, b, c, d = g; di = pow((a*d - b*c) % p, p - 2, p)
    return ((d*di) % p, (-b*di) % p, (-c*di) % p, (a*di) % p)

def gelfand_graev_norm(p):
    """<gg,gg> where gg = Ind_U^G psi, U upper unipotent, psi(u_x) = zeta_p^x (nontrivial).
    gg(g) = (1/|U|) sum_{x in G, x g x^-1 in U} psi(x g x^-1)."""
    G = gl2(p); U = p
    val = {}
    for g in G:
        v = [0] * p
        for x in G:
            y = mul(mul(x, g, p), inv(x, p), p)
            if y[0] == 1 and y[2] == 0 and y[3] == 1:
                v[y[1]] += 1
        val[g] = v
    tot = [0] * p
    for g in G:
        v = val[g]
        for e1, c1 in enumerate(v):
            if c1:
                for e2, c2 in enumerate(v):
                    if c2:
                        tot[(e1 - e2) % p] += c1 * c2
    r = red(tot, p)
    assert r.is_Integer, r
    return Fraction(int(r), len(G) * U * U)

def hc_pairings(p):
    """GL_2(F_p), B upper triangular, chi_(a,b)(diag(t1,t2)) = z^(a*log t1 + b*log t2), z = zeta_(p-1).
    Returns dict ((a,b),(a',b')) -> <Ind_B chi, Ind_B chi'>."""
    m = p - 1
    gen = next(r for r in range(2, p) if all(pow(r, m // q, p) != 1 for q in sp.primefactors(m))) if p > 2 else 1
    lg = {pow(gen, i, p): i for i in range(m)}
    G = gl2(p); Bsz = m * m * p
    chars = [(a, b) for a in range(m) for b in range(m)]
    # for each g: multiset of (log t1, log t2) of x g x^-1 in B
    data = {}
    for g in G:
        cnt = {}
        for x in G:
            y = mul(mul(x, g, p), inv(x, p), p)
            if y[2] == 0:
                k = (lg[y[0]], lg[y[3]]); cnt[k] = cnt.get(k, 0) + 1
        data[g] = cnt
    out = {}
    for c1 in chars:
        for c2 in chars:
            tot = [0] * m
            for g in G:
                for (s, t), n1 in data[g].items():
                    e1 = c1[0]*s + c1[1]*t
                    for (u, w), n2 in data[g].items():
                        tot[(e1 - c2[0]*u - c2[1]*w) % m] += n1 * n2
            r = red(tot, m) if m > 1 else sp.Integer(tot[0])
            assert r.is_Integer, r
            out[(c1, c2)] = Fraction(int(r), len(G) * Bsz * Bsz)
    return out

if __name__ == "__main__":
    print("== Gelfand-Graev norm <gg,gg> = sum_rho m_rho^2 on GL_2(F_p); upstream bound g^n - g^(n-1) with n = 2")
    for p in (2, 3, 5):
        nrm = gelfand_graev_norm(p)
        print(f"p={p}: <gg,gg> = {nrm}; p^2-p = {p*p-p}; equal: {nrm == p*p-p}")
    print("== Harish-Chandra products of GL_1 characters (cuspidal for GL_1) in GL_2(F_p):")
    print("   expected <Ind(a,b), Ind(a',b')> = [(a,b)=(a',b')] + [(a,b)=(b',a')]; Nodup (a!=b) gives norm 1")
    for p in (3, 5):
        P = hc_pairings(p); bad = 0; norms = {}
        for (c1, c2), v in P.items():
            exp = int(c1 == c2) + int(c1 == (c2[1], c2[0]))
            bad += (v != exp)
            if c1 == c2: norms[c1[0] != c1[1]] = norms.get(c1[0] != c1[1], set()) | {v}
        print(f"p={p}: {len(P)} pairs checked, mismatches = {bad}; self-pairing values: Nodup -> {sorted(norms.get(True, []))}, repeated -> {sorted(norms.get(False, []))}")
    print("== rootSum regularity condition and sign of the degree (isChar_psi_rootSum_of_regular)")
    for q in (2, 3, 4, 5, 7):
        for d in (2, 3):
            M = q**d - 1
            reg = [k for k in range(M) if all((k * q**i - k) % M for i in range(1, d))]
            nfilter_ok = all(sum(1 for i in range(d) if (k * q**i - k) % M == 0) == 1 for k in reg)
            deg = (-1)**(d - 1) * __import__('math').prod(1 - q**i for i in range(1, d))
            print(f"q={q} d={d}: regular k mod q^d-1: {len(reg)}; Frobenius orbits: {len(reg)//d} (divisible: {len(reg)%d==0}); "
                  f"#{{i<d : k q^i = k}} = 1 for all regular k: {nfilter_ok}; (-1)^(d-1) prod_(1<=i<d)(1-q^i) = {deg} > 0: {deg > 0}")
