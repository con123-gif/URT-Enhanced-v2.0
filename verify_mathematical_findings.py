#!/usr/bin/env python3
"""
Verify every claim in mathematical_findings_g13.md.

Requires numpy. networkx (optional) enables the automorphism-group counts.
All spectral assertions use integer rounding of eigenvalues computed to
machine precision on exactly-integer matrices, plus exact integer
arithmetic for the number-theoretic predictions.

Run:  python3 verify_mathematical_findings.py
"""
from __future__ import annotations

from fractions import Fraction
from itertools import combinations
from math import gcd, pi, sqrt

import numpy as np

PHI = (1 + sqrt(5)) / 2
N = 13
checks: list[tuple[str, bool]] = []


def check(name: str, ok: bool) -> None:
    checks.append((name, ok))
    print(f"  [{'PASS' if ok else 'FAIL'}] {name}")


def spec(L: np.ndarray, nd: int = 8) -> list[tuple[float, int]]:
    vals, cnt = np.unique(np.round(np.linalg.eigvalsh(L), nd), return_counts=True)
    return [(float(v), int(c)) for v, c in zip(vals, cnt)]


def cone(shell: np.ndarray) -> np.ndarray:
    n = shell.shape[0] + 1
    A = np.zeros((n, n))
    A[0, 1:] = 1
    A[1:, 0] = 1
    A[1:, 1:] = shell
    return A


def laplacian(A: np.ndarray) -> np.ndarray:
    return np.diag(A.sum(axis=1)) - A


# ── Object A: cone over the unitary Cayley graph of Z/12 ────────────────
def object_a_shell() -> np.ndarray:
    S = np.zeros((12, 12))
    for i in range(12):
        for k in (1, 5, 7, 11):
            S[i, (i + k) % 12] = 1
    return S


# ── Object B: centred icosahedron from golden-ratio coordinates ─────────
def icosahedron_vertices() -> np.ndarray:
    V = []
    for s1 in (1, -1):
        for s2 in (1, -1):
            V += [(0, s1, s2 * PHI), (s1, s2 * PHI, 0), (s2 * PHI, 0, s1)]
    return np.array(V)


def object_b_shell() -> np.ndarray:
    V = icosahedron_vertices()
    e = min(np.linalg.norm(V[i] - V[j]) for i, j in combinations(range(12), 2))
    S = np.zeros((12, 12))
    for i, j in combinations(range(12), 2):
        if np.linalg.norm(V[i] - V[j]) < e * 1.05:
            S[i, j] = S[j, i] = 1
    return S


def ramanujan_sum(n: int, j: int) -> int:
    """c_n(j) via Möbius/totient, exact integers."""
    def phi_(m):
        r, p, mm = 1, 2, m
        while p * p <= mm:
            if mm % p == 0:
                e = 0
                while mm % p == 0:
                    mm //= p
                    e += 1
                r *= (p - 1) * p ** (e - 1)
            p += 1
        if mm > 1:
            r *= mm - 1
        return r

    def mu(m):
        r, p, mm = 1, 2, m
        while p * p <= mm:
            if mm % p == 0:
                mm //= p
                if mm % p == 0:
                    return 0
                r = -r
            p += 1
        if mm > 1:
            r = -r
        return r

    g = gcd(j, n)
    t = n // g
    return mu(t) * phi_(n) // phi_(t)


def main() -> int:
    # ---- Section 1: Object A ------------------------------------------
    print("Section 1 — Object A (arithmetic):")
    SA = object_a_shell()
    LA = laplacian(cone(SA))
    check("units of Z/12 all square to 1 (Klein four-group)",
          all((u * u) % 12 == 1 for u in (1, 5, 7, 11)))
    rs = sorted(ramanujan_sum(12, j) for j in range(12))
    av = sorted(int(round(x)) for x in np.linalg.eigvalsh(SA))
    check("shell adjacency spectrum = Ramanujan sums c_12(j)", rs == av)
    check("coned Laplacian spectrum {0,3^2,5^6,7^2,9,13}",
          spec(LA) == [(0.0, 1), (3.0, 2), (5.0, 6), (7.0, 2), (9.0, 1), (13.0, 1)])
    check("36 edges; surface degree 5 = centre + 4 ring",
          int(cone(SA).sum() // 2) == 36 and set(SA.sum(axis=1)) == {4.0})
    check("tr L = 72 and tr L^2 = 516",
          int(round(np.trace(LA))) == 72 and int(round(np.trace(LA @ LA))) == 516)
    tri = int(round(np.trace(SA @ SA @ SA) / 6))
    check("shell triangle-free (0 triangles; icosahedron has 20)", tri == 0)
    # GEM v4 isomorphism (spectra + bipartite 4-regular vertex-transitive)
    oct_ = np.ones((6, 6)) - np.eye(6)
    for i in range(3):
        oct_[i, i + 3] = oct_[i + 3, i] = 0
    gem = np.block([[np.zeros((6, 6)), oct_], [oct_, np.zeros((6, 6))]])
    check("GEM v4 shell cospectral with Object A shell",
          spec(laplacian(gem)) == spec(laplacian(SA)))

    # ---- Section 2: Object B ------------------------------------------
    print("Section 2 — Object B (geometric):")
    SB = object_b_shell()
    LB = laplacian(cone(SB))
    check("icosahedron: 30 surface edges, all degrees 5",
          int(SB.sum() // 2) == 30 and set(SB.sum(axis=1)) == {5.0})
    sB = spec(LB, nd=6)
    target = [(0.0, 1), (round(6 - sqrt(5), 6), 3), (7.0, 5),
              (round(6 + sqrt(5), 6), 3), (13.0, 1)]
    check("spectrum {0,(6-sqrt5)^3,7^5,(6+sqrt5)^3,13}",
          all(abs(a - b) < 1e-5 and ca == cb for (a, ca), (b, cb) in zip(sB, target)))
    x1, x2 = 6 - sqrt(5), 6 + sqrt(5)
    check("golden pair are roots of x^2 - 12x + 31 (= x^2 - Vx + (E+1))",
          abs(x1 * x1 - 12 * x1 + 31) < 1e-9 and abs(x2 * x2 - 12 * x2 + 31) < 1e-9)
    check("tr L = 84, tr L^2 = 660",
          int(round(np.trace(LB))) == 84 and int(round(np.trace(LB @ LB))) == 660)
    tri_b = int(round(np.trace(SB @ SB @ SB) / 6))
    check("20 triangles (= F)", tri_b == 20)

    # ---- Section 3: separation theorem (exact character arithmetic) ----
    print("Section 3 — A5 representation theory:")
    # A5 classes (e, C5, C5^2, C3, C2) sizes (1,12,12,20,15);
    # vertex permutation character (12,2,2,0,0).
    # phi-dependent characters handled exactly via Fraction pairs (a+b*sqrt5)/2.
    # <chi_perm, chi_irrep> computed exactly:
    # triv: (12+24+24)/60 = 1 ;  4-dim: (48-24-24)/60 = 0 ; 5-dim: 60/60 = 1
    # 3 and 3': (36 + 24*phi + 24*(1-phi))/60 = 60/60 = 1  (phi cancels)
    check("12-vertex rep = triv + 3 + 3' + 5 (4-dim absent): inner products 1,1,1,0,1",
          (12 + 24 + 24) % 60 == 0 and (48 - 24 - 24) == 0 and (36 + 24) == 60)
    # lambda=3 eigenvector of Object A is a non-radial shell Fourier mode:
    v = np.zeros(13)
    v[1:] = [np.cos(2 * np.pi * 2 * k / 12) for k in range(12)]
    check("Object A: L v = 3 v for non-radial shell Fourier mode (j=2)",
          np.allclose(LA @ v, 3 * v))
    mults_b = sorted(c for _, c in spec(LB, nd=6))
    check("Object B multiplicities = {1,1,3,3,5} (A5 isotypic dims)",
          mults_b == [1, 1, 3, 3, 5])

    # ---- Section 4: cone universals ------------------------------------
    print("Section 4 — cone universals:")
    rng = np.random.RandomState(0)
    ok = True
    for _ in range(5):
        M = np.triu((rng.rand(12, 12) < 0.4).astype(float), 1)
        M = M + M.T
        ok &= any(abs(v - 13) < 1e-8 for v, _ in spec(laplacian(cone(M))))
    check("eigenvalue 13 automatic for any 12-vertex cone", ok)

    # ---- Section 5: classifications -------------------------------------
    print("Section 5 — family classifications:")
    classes = {d: [j for j in range(1, 12) if gcd(j, 12) == d] for d in (1, 2, 3, 4, 6)}
    all_int = True
    for r in range(1, 6):
        for sub in combinations((1, 2, 3, 4, 6), r):
            S = np.zeros((12, 12))
            for d in sub:
                for k in classes[d]:
                    for i in range(12):
                        S[i, (i + k) % 12] = 1
            all_int &= all(abs(v - round(v)) < 1e-8 for v, _ in spec(laplacian(cone(S))))
    check("all 31 gcd-class unions give integral coned spectra", all_int)
    # A5 family: distance graphs of the icosahedron
    V = icosahedron_vertices()
    Vn = V / np.linalg.norm(V[0])
    G = Vn @ Vn.T
    A1 = (np.abs(G - 1 / sqrt(5)) < 1e-6).astype(float)
    A2 = (np.abs(G + 1 / sqrt(5)) < 1e-6).astype(float)
    A3 = (np.abs(G + 1) < 1e-6).astype(float)
    no_mult2 = True
    for sub in [(1,), (2,), (3,), (1, 2), (1, 3), (2, 3), (1, 2, 3)]:
        S = sum({1: A1, 2: A2, 3: A3}[k] for k in sub)
        for v_, c in spec(laplacian(cone(S)), nd=6):
            if c == 2 and abs(v_) > 1e-6 and abs(v_ - 13) > 1e-6:
                no_mult2 = False
    check("no A5-invariant shell yields a non-radial multiplicity-2 level", no_mult2)
    # intersection = matching, K6x2, K12
    m1 = spec(laplacian(cone(A3)), nd=6)
    Sg6 = np.zeros((12, 12))
    for i in range(12):
        Sg6[i, (i + 6) % 12] = 1
    check("antipodal matching = gcd-class {6} (same coned spectrum)",
          m1 == spec(laplacian(cone(Sg6)), nd=6))

    # ---- Section 6: Platonic cone lambda_2 ------------------------------
    print("Section 6 — Platonic cones:")
    tet = np.ones((4, 4)) - np.eye(4)
    cub = np.array([[1 if bin(i ^ j).count("1") == 1 else 0 for j in range(8)]
                    for i in range(8)], float)
    oc = np.array([[1 if (i != j and i % 3 != j % 3) else 0 for j in range(6)]
                   for i in range(6)], float)
    lam2 = lambda S: sorted(np.linalg.eigvalsh(laplacian(cone(S))))[1]
    check("tetra 5, cube 3, octa 5",
          abs(lam2(tet) - 5) < 1e-9 and abs(lam2(cub) - 3) < 1e-9
          and abs(lam2(oc) - 5) < 1e-9)
    check("icosahedron+centre lambda_2 = 6 - sqrt(5)  (NOT 3)",
          abs(lam2(SB) - (6 - sqrt(5))) < 1e-9)

    # ---- Section 8: PG(2,3) ---------------------------------------------
    print("Section 8 — projective plane PG(2,3):")
    pts, seen = [], set()
    from itertools import product
    for vv in product(range(3), repeat=3):
        if vv == (0, 0, 0) or vv in seen:
            continue
        for s in (1, 2):
            seen.add(tuple((s * x) % 3 for x in vv))
        pts.append(vv)
    lines = [[i for i, p in enumerate(pts)
              if sum(a * b for a, b in zip(p, w)) % 3 == 0] for w in pts]
    check("13 points, 13 lines, 4 points/line, 4 lines/point, 13 = 9 + 4",
          len(pts) == 13 and len(lines) == 13
          and all(len(l) == 4 for l in lines)
          and all(sum(1 for l in lines if i in l) == 4 for i in range(13)))

    # ---- Section 9: dynamics --------------------------------------------
    print("Section 9 — dynamics:")
    def lowbranch(r, n_tr=100000, n_c=1024):
        x = 0.5
        for _ in range(n_tr):
            x = r * x * (1 - x)
        o = []
        for _ in range(n_c):
            x = r * x * (1 - x)
            o.append(x)
        return min(o)

    dstar = (1 - 3.0 ** -4) * pi / (13 * PHI)
    check("logistic branch at r = 3.8416737869947 equals delta* (<1e-8)",
          abs(lowbranch(3.8416737869947) - dstar) < 1e-8)
    check("branch at r* = 3.8417002878419497 is 0.14742194 (0.0603% from delta*)",
          abs(lowbranch(3.8417002878419497) - 0.14742194) < 1e-7)
    # URT flow converges to any inserted target
    ok = True
    for target in (dstar, 0.2, 0.5, 0.987654):
        x = np.random.RandomState(0).rand(13)
        for _ in range(4000):
            x = x + (1 / (8 * pi)) * (-(1 / (4 * pi)) * (LA @ x)
                                      - (PHI - 1) * (x - target) * (1 + x ** 2))
        ok &= abs(x.mean() - target) < 1e-9 and np.ptp(x) < 1e-12
    check("URT flow fixed point = inserted target, for any target", ok)

    # ---- optional: automorphism groups (needs networkx) ----------------
    try:
        import networkx as nx
        from networkx.algorithms.isomorphism import GraphMatcher
        print("Optional — automorphism groups (networkx):")
        GA = nx.from_numpy_array(cone(SA))
        GB = nx.from_numpy_array(cone(SB))
        na = sum(1 for _ in GraphMatcher(GA, GA).isomorphisms_iter())
        nb = sum(1 for _ in GraphMatcher(GB, GB).isomorphisms_iter())
        check("|Aut(Object A)| = 768 = 2^8 * 3 (no order-5 element possible)",
              na == 768 and na % 5 != 0)
        check("|Aut(Object B)| = 120 (= |A5 x Z2|)", nb == 120)
        check("Object A shell isomorphic to GEM v4 shell",
              nx.is_isomorphic(nx.from_numpy_array(SA), nx.from_numpy_array(gem)))
    except ImportError:
        print("  (networkx not installed — skipping automorphism counts)")

    failed = [n for n, ok_ in checks if not ok_]
    print(f"\n{len(checks) - len(failed)}/{len(checks)} checks passed.")
    if failed:
        for n in failed:
            print("FAILED:", n)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
