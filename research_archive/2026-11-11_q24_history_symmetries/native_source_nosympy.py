#!/usr/bin/env python3
"""Sympy-free exact reconstruction of the Q11 native hidden-5 source.

Same construction, step for step, as
`2026-11-10_signed_a5_covariance/signed_a5_covariance.py` (icosahedron,
20 faces, six antipodal axes, quartic native face source, hidden P5,
five A4 singlet lines), but with an exact Fraction matrix routine instead of
sympy, so that it runs in sandboxes without sympy. The certificate that
imports this file cross-checks it against the original Q11 module whenever
sympy is importable (it is on GitHub CI).

No fitted, measured or random inputs.
"""
from fractions import Fraction as F
from itertools import combinations, product
import networkx as nx


class K:
    """a + b*sqrt(5) with rational a, b."""
    __slots__ = ('a', 'b')

    def __init__(self, a=0, b=0):
        if isinstance(a, K):
            self.a, self.b = a.a, a.b
        else:
            self.a, self.b = F(a), F(b)

    def __add__(self, y):
        y = K(y); return K(self.a + y.a, self.b + y.b)
    __radd__ = __add__

    def __neg__(self): return K(-self.a, -self.b)
    def __sub__(self, y): return self + -K(y)
    def __rsub__(self, y): return K(y) - self

    def __mul__(self, y):
        y = K(y); return K(self.a*y.a + 5*self.b*y.b, self.a*y.b + self.b*y.a)
    __rmul__ = __mul__

    def __truediv__(self, y):
        y = K(y); d = y.a*y.a - 5*y.b*y.b
        assert d
        return K((self.a*y.a - 5*self.b*y.b)/d, (self.b*y.a - self.a*y.b)/d)

    def __eq__(self, y):
        y = K(y); return (self.a, self.b) == (y.a, y.b)

    def __hash__(self): return hash((self.a, self.b))
    def key(self): return (self.a, self.b)
    def __repr__(self): return f'{self.a}+({self.b})sqrt(5)'


Z, PHI = K(0), K(F(1, 2), F(1, 2))

# ---- exact rational matrices (lists of lists of Fraction) ----
def mat(n, m, f=lambda i, j: F(0)): return [[F(f(i, j)) for j in range(m)] for i in range(n)]
def eye(n): return mat(n, n, lambda i, j: 1 if i == j else 0)
def mmul(A, B):
    Bt = list(zip(*B))
    return [[sum((a*b for a, b in zip(r, c)), F(0)) for c in Bt] for r in A]
def madd(A, B, s=1): return [[a + s*b for a, b in zip(r, q)] for r, q in zip(A, B)]
def mscale(A, s): return [[s*a for a in r] for r in A]
def mT(A): return [list(r) for r in zip(*A)]
def minv(A):
    n = len(A); M = [list(r) + e for r, e in zip(A, eye(n))]
    for c in range(n):
        p = next(r for r in range(c, n) if M[r][c] != 0)
        M[c], M[p] = M[p], M[c]
        piv = M[c][c]; M[c] = [x/piv for x in M[c]]
        for r in range(n):
            if r != c and M[r][c] != 0:
                f = M[r][c]; M[r] = [x - f*y for x, y in zip(M[r], M[c])]
    return [r[n:] for r in M]
def trace(A): return sum((A[i][i] for i in range(len(A))), F(0))


pts = ([(Z, K(a), K(b)*PHI) for a, b in product((-1, 1), repeat=2)]
       + [(K(a), K(b)*PHI, Z) for a, b in product((-1, 1), repeat=2)]
       + [(K(a)*PHI, Z, K(b)) for a, b in product((-1, 1), repeat=2)])
def inner(a, b): return sum((x*y for x, y in zip(a, b)), Z)
def determinant(vs):
    a, b, c = vs
    return a[0]*(b[1]*c[2]-b[2]*c[1]) - a[1]*(b[0]*c[2]-b[2]*c[0]) + a[2]*(b[0]*c[1]-b[1]*c[0])

edges = [(i, j) for i, j in combinations(range(12), 2)
         if inner([x-y for x, y in zip(pts[i], pts[j])], [x-y for x, y in zip(pts[i], pts[j])]) == 4]
G = nx.Graph(); G.add_nodes_from(range(12)); G.add_edges_from(edges)
faces = [tuple(t) for t in combinations(range(12), 3)
         if all(G.has_edge(i, j) for i, j in combinations(t, 2))]
assert (len(edges), len(faces)) == (30, 20)
faceid = {frozenset(f): i for i, f in enumerate(faces)}
pairs = []; remaining = set(range(12))
while remaining:
    i = min(remaining)
    anti = [j for j in sorted(remaining - {i}) if all(x + y == Z for x, y in zip(pts[i], pts[j]))]
    assert len(anti) == 1
    j = anti[0]; pairs.append((i, j)); remaining -= {i, j}
assert len(pairs) == 6

C = mat(20, 12, lambda i, v: 1 if v in faces[i] else 0)
A = mat(20, 20, lambda i, j: 1 if i != j and len(set(faces[i]) & set(faces[j])) == 2 else 0)
L = madd(mscale(eye(20), 3), A, -1)
H = madd(eye(20), mmul(mmul(C, minv(mmul(mT(C), C))), mT(C)), -1)
P5 = mscale(mmul(H, madd(L, mscale(eye(20), 3), -1)), F(1, 2))
assert mmul(P5, P5) == P5 and trace(P5) == 4

base = determinant([pts[i] for i in (0, 4, 8)])
proper = []
for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
    g = tuple(m[i] for i in range(12))
    d = determinant([pts[g[i]] for i in (0, 4, 8)])
    assert d == base or d == -base
    if d == base: proper.append(g)
proper = sorted(proper)
assert len(proper) == 60
identity = tuple(range(12))
compose = lambda g, h: tuple(g[h[i]] for i in range(12))
def inverse(g): return tuple(g.index(i) for i in range(12))
invol = [g for g in proper if g != identity and compose(g, g) == identity]
subgroups = {frozenset((identity, a, b, compose(a, b))) for a in invol for b in invol
             if a != b and compose(a, b) == compose(b, a)}
assert len(subgroups) == 5
subgroups = sorted(subgroups, key=lambda v: tuple(sorted(v)))

# The archived quartic native face source.
Den = PHI + 2
src = []
for h in range(64):
    u = [Z, Z, Z]
    for i, (a, b) in enumerate(pairs):
        sign = 1 if h & (1 << i) else -1
        for j in range(3): u[j] += sign*pts[a][j]
    norm = inner(u, u)/Den
    aa = []; bb = []
    for pt in pts:
        d = inner(pt, u)/Den
        aa.append(K(F(5, 16))*(d*d - norm/3)); bb.append(d/2)
    row = []
    for face in faces:
        x = sum((aa[i] for i in face), Z); y = sum((bb[i] for i in face), Z)
        row.append(x*x + y*y/2)
    src.append(row)

vacua = []   # (t, r2, scalar line over the 64 axis words)
for sg in subgroups:
    norm = [g for g in proper if frozenset(compose(compose(g, x), inverse(g)) for x in sg) == sg]
    assert len(norm) == 12
    av = mat(20, 20)
    for g in norm:
        for i, f in enumerate(faces): av[faceid[frozenset(g[x] for x in f)]][i] += F(1, 12)
    proj = mmul(mmul(P5, av), P5)
    assert mmul(proj, proj) == proj and trace(proj) == 1
    col = next(i for i in range(20) if any(proj[r][i] != 0 for r in range(20)))
    t = [K(proj[r][col]) for r in range(20)]
    r2 = sum((x*x for x in t), Z)
    assert r2.b == 0 and r2.a > 0
    scalar = [sum((t[j]*src[h][j] for j in range(20)), Z) for h in range(64)]
    vacua.append((t, r2, scalar))
