"""RUN3 exact finite checks (green_regular_character lane). Exact arithmetic only: Z[zeta_m] elements are integer
exponent-count vectors reduced mod the m-th cyclotomic polynomial (sympy), divisions are exact Fractions.
Small-case illustrations of the identities proved in RUN3, not proofs of the general Lean declarations."""
from fractions import Fraction
from itertools import product
import sympy as sp
X = sp.symbols('x')

def red(vec, m):
    if m == 1: return sp.Integer(sum(vec))
    poly = sum(int(c) * X**e for e, c in enumerate(vec))
    return sp.rem(sp.expand(poly), sp.cyclotomic_poly(m, X), X)

def mats(n, p):
    for ent in product(range(p), repeat=n*n):
        M = tuple(tuple(ent[i*n:(i+1)*n]) for i in range(n))
        if det(M, p) % p: yield M
def det(M, p):
    n = len(M)
    if n == 1: return M[0][0] % p
    return sum((-1)**j * M[0][j] * det(tuple(r[:j]+r[j+1:] for r in M[1:]), p) for j in range(n)) % p
def mul(A, B, p):
    n = len(A); return tuple(tuple(sum(A[i][k]*B[k][j] for k in range(n)) % p for j in range(n)) for i in range(n))
def inv(A, p):
    n = len(A); d = det(A, p); di = pow(d, p-2, p)
    if n == 1: return ((di,),)
    cof = [[(-1)**(i+j) * det(tuple(r[:j]+r[j+1:] for k, r in enumerate(A) if k != i), p) for j in range(n)] for i in range(n)]
    return tuple(tuple((cof[j][i]*di) % p for j in range(n)) for i in range(n))
def uniup(M):
    n = len(M); return all(M[i][i] == 1 for i in range(n)) and all(M[i][j] == 0 for i in range(n) for j in range(i))
def sd(M, p):
    return sum(M[i][i+1] for i in range(len(M)-1)) % p

def wh_gg(n, p):
    """wh psi (gg psi n) with psi(x)=zeta_p^x, computed from the definitions:
    gg(x) = |U|^-1 sum_y [y^-1 x y in U] psi(sd(y^-1 x y)); wh(chi) = |U|^-1 sum_{u in U} psi(sd u)^-1 chi(u)."""
    G = list(mats(n, p)); U = [M for M in G if uniup(M)]
    Gi = {M: inv(M, p) for M in G}
    tot = [0]*p
    for u in U:
        for y in G:
            z = mul(mul(Gi[y], u, p), y, p)
            if uniup(z): tot[(sd(z, p) - sd(u, p)) % p] += 1
    r = red(tot, p); assert r.is_Integer, r
    return Fraction(int(r), len(U)**2)

def reciprocity_gl2(p):
    """<chi, gg> = wh chi for every class indicator chi on GL_2(F_p); ip(a,b)=|G|^-1 sum a(x) b(x^-1)."""
    n = 2; G = list(mats(n, p)); U = [M for M in G if uniup(M)]; Gi = {M: inv(M, p) for M in G}
    # gg values as vectors
    ggv = {}
    for x in G:
        v = [0]*p
        for y in G:
            z = mul(mul(Gi[y], x, p), y, p)
            if uniup(z): v[sd(z, p)] += 1
        ggv[x] = v
    # conjugacy classes
    seen, classes = set(), []
    for x in G:
        if x in seen: continue
        c = {mul(mul(Gi[y], x, p), y, p) for y in G}; seen |= c; classes.append(c)
    bad = 0
    for c in classes:
        lhs = [0]*p   # |G| |U| <1_c, gg>
        for x in c:
            for e, k in enumerate(ggv[Gi[x]]): lhs[e] += k
        rhs = [0]*p   # |U| wh(1_c)
        for u in U:
            if u in c: rhs[(-sd(u, p)) % p] += 1
        # lhs counts |U| gg(x^-1), so <1_c,gg> = lhs/(|G||U|); wh(1_c) = rhs/|U|; equality <=> lhs = |G| rhs
        if sp.expand(red(lhs, p) * 1 - red(rhs, p) * len(G)) != 0: bad += 1
    return len(classes), bad

def parab_identity_gl2(p):
    """sum over invariant lines W of lam(g|W) == Ind_P^G (lam o rho)(g), P = stabiliser of W0 = <e1>,
    rho(p) = action on W0 (top-left entry), lam = z^(a log), z = zeta_(p-1). Returns mismatches over all g, a."""
    m = p-1; gen = next(r for r in range(2, p) if all(pow(r, m//q, p) != 1 for q in sp.primefactors(m))) if p > 2 else 1
    lg = {pow(gen, i, p): i for i in range(m)}
    G = list(mats(2, p)); Gi = {M: inv(M, p) for M in G}
    P = [M for M in G if M[1][0] == 0]
    lines = [(1, 0)] + [(t, 1) for t in range(p)]
    bad = 0
    for a in range(m):
        for g in G:
            lhs = [0]*max(m, 1)
            for (x, y) in lines:
                gx, gy = (g[0][0]*x + g[0][1]*y) % p, (g[1][0]*x + g[1][1]*y) % p
                for c in range(1, p):
                    if (c*x % p, c*y % p) == (gx, gy): lhs[(a*lg[c]) % max(m, 1)] += 1
            rhs = [0]*max(m, 1)   # |P| * Ind = sum_{t in G, t^-1 g t in P} lam(rho(t^-1 g t))
            for t in G:
                z = mul(mul(Gi[t], g, p), t, p)
                if z[1][0] == 0: rhs[(a*lg[z[0][0]]) % max(m, 1)] += 1
            if sp.expand(red(lhs, max(m, 1)) * len(P) - red(rhs, max(m, 1))) != 0: bad += 1
    return len(G)*m, bad

def ipgl_count(q, n, k, l):
    N = q**n - 1; return sum(1 for i in range(n) if (k*q**i - l) % N == 0)

def torus_orth(q, n):
    """sum over the N-th roots of unity alpha (N = q^n - 1) of zeta^(k e) conj(zeta^(l e)) = N [k = l mod N]; plus
    the Frobenius-orbit sum used in ipGL_psi_rootSum: sum_alpha sum_{i<n} theta(alpha)^(k q^i) conj theta(alpha)^l = N * count."""
    N = q**n - 1; bad = 0
    for k in range(N):
        for l in range(N):
            vec = [0]*N
            for i in range(n):
                for e in range(N): vec[(e*(k*q**i - l)) % N] += 1
            if red(vec, N) != N * ipgl_count(q, n, k, l): bad += 1
    return N*N, bad

if __name__ == "__main__":
    print("== gg_norm: wh psi (gg psi n) = g^n - g^(n-1), and sum_{j<=k} wh(gg_j) = g^k (sum_wh_gg), from the definitions")
    for (n, p) in [(1, 2), (1, 3), (2, 2), (2, 3), (2, 5), (3, 2), (3, 3)]:
        w = wh_gg(n, p); print(f"n={n} p={p}: wh(gg) = {w}; g^n-g^(n-1) = {p**n - p**(n-1)}; equal: {w == p**n - p**(n-1)}")
    for p in (2, 3):
        s = 1 + sum(wh_gg(j, p) for j in (1, 2, 3))
        print(f"p={p}: 1 + wh(gg_1)+wh(gg_2)+wh(gg_3) = {s}; p^3 = {p**3}; equal: {s == p**3}  (j=0 term = wh on GL_0 = 1)")
    print("== ip_gg reciprocity on GL_2(F_p): <1_C, gg> = wh(1_C) for every conjugacy class C")
    for p in (2, 3, 5):
        nc, bad = reciprocity_gl2(p); print(f"p={p}: {nc} classes, mismatches = {bad}")
    print("== parab_virt core identity on GL_2(F_p), a=1: sum_{invariant lines W} lam(g|W) = Ind_P^G(lam o rho)(g)")
    for p in (2, 3, 5):
        tot, bad = parab_identity_gl2(p); print(f"p={p}: {tot} (g, lam) pairs, mismatches = {bad}")
    print("== ipGL_psi_rootSum torus step: sum_alpha sum_{i<n} theta(alpha)^(k q^i) conj theta(alpha)^l = (q^n-1) #{i<n: k q^i = l}")
    for (q, n) in [(2, 2), (3, 2), (2, 3), (4, 2), (5, 2)]:
        tot, bad = torus_orth(q, n); print(f"q={q} n={n}: {tot} (k,l) pairs, mismatches = {bad}")
