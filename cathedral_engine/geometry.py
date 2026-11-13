"""Five Platonic solids, the 190-dimensional cochain complex, the icosahedral hidden sector, A5 and D6 -> H3.

Exact over Q(sqrt5).  Vertex orders, face orders, face orientations and edge orders reproduce the original
2026-11-07 construction (`research_archive/2026-11-07_joint_interacting_native/
cathedral_constructed_joint_dynamics_2026_11_07.py`, sha256 5577557613a7...): faces are sorted by their
sorted vertex tuple, each face is cyclically ordered counter-clockwise about its outward normal starting where
``numpy.arctan2`` ordering starts, edges are sorted pairs, b1[i,e] = -1, b1[j,e] = +1, b2[e,k] = +-1 by
traversal.  ``tests/test_cathedral_engine.py`` compares every array with the original float construction.
"""
from __future__ import annotations

from fractions import Fraction
from functools import lru_cache
from itertools import combinations, product

from .fields import PHI, Q5
from .linalg import inverse, matmul, transpose, rank_mod_p

__all__ = [
    "SOLIDS", "vertices", "faces", "edges", "boundary_maps", "hodge_dirac_190", "solid_offsets",
    "icosahedron", "a5_rotations", "ih_symmetries", "a5_class_of", "a5_character_table", "antipodal_pairs",
    "d6_h3", "laplacian_charpolys",
]

SOLIDS = ("tetrahedron", "cube", "octahedron", "dodecahedron", "icosahedron")
_I = PHI - 1          # 1/phi


def _vec(*c):
    return tuple(Q5(x) if not isinstance(x, Q5) else x for x in c)


@lru_cache(maxsize=None)
def vertices(name: str) -> tuple:
    pm = list(product((-1, 1), repeat=2))
    if name == "tetrahedron":
        pts = [(1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1)]
    elif name == "cube":
        pts = list(product((-1, 1), repeat=3))
    elif name == "octahedron":
        pts = [(1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)]
    elif name == "dodecahedron":
        pts = (list(product((-1, 1), repeat=3)) + [(0, a * _I, b * PHI) for a, b in pm]
               + [(a * _I, b * PHI, 0) for a, b in pm] + [(a * PHI, 0, b * _I) for a, b in pm])
    elif name == "icosahedron":
        pts = [(0, a, b * PHI) for a, b in pm] + [(a, b * PHI, 0) for a, b in pm] + [(a * PHI, 0, b) for a, b in pm]
    else:
        raise KeyError(name)
    return tuple(_vec(*p) for p in pts)


def _sub(a, b): return tuple(x - y for x, y in zip(a, b))
def _dot(a, b): return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
def _cross(a, b): return (a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0])


def _det3(a, b, c): return _dot(a, _cross(b, c))


@lru_cache(maxsize=None)
def faces(name: str) -> tuple:
    """Faces as vertex tuples in the original order and orientation."""
    P = vertices(name)
    n = len(P)
    planes = {}
    for i, j, k in combinations(range(n), 3):
        nrm = _cross(_sub(P[j], P[i]), _sub(P[k], P[i]))
        if all(not x for x in nrm):
            continue
        off = _dot(nrm, P[i])
        side = [(_dot(nrm, p) - off).sign() for p in P]
        if all(s <= 0 for s in side):
            out = nrm
        elif all(s >= 0 for s in side):
            out = tuple(-x for x in nrm)
        else:
            continue
        key = frozenset(v for v in range(n) if side[v] == 0)
        planes.setdefault(key, out)
    result = []
    for key, out in planes.items():
        ids = sorted(key)
        cen = tuple(sum((P[v][t] for v in ids), Q5(0)) / len(ids) for t in range(3))
        e1 = _sub(P[ids[0]], cen)
        e2 = _cross(out, e1)
        coords = {v: (_dot(_sub(P[v], cen), e1), _dot(_sub(P[v], cen), e2)) for v in ids}
        result.append(tuple(_atan2_sorted(ids, coords)))
    result.sort(key=lambda f: tuple(sorted(f)))
    return tuple(result)


def _atan2_sorted(ids, coords):
    """Exact sort by numpy.arctan2(y, x) in (-pi, pi]: lower half-plane, positive x-axis, upper, negative x-axis."""
    import functools

    def half(v):
        x, y = coords[v]
        if y.sign() < 0: return 0
        if y.sign() == 0 and x.sign() > 0: return 1
        if y.sign() > 0: return 2
        return 3

    def cmp(a, b):
        ha, hb = half(a), half(b)
        if ha != hb:
            return -1 if ha < hb else 1
        (xa, ya), (xb, yb) = coords[a], coords[b]
        s = (xa * yb - ya * xb).sign()
        return -s
    return sorted(ids, key=functools.cmp_to_key(cmp))


@lru_cache(maxsize=None)
def edges(name: str) -> tuple:
    return tuple(sorted({tuple(sorted((f[i], f[(i + 1) % len(f)]))) for f in faces(name) for i in range(len(f))}))


@lru_cache(maxsize=None)
def boundary_maps(name: str):
    """(b1, b2): integer V x E and E x F incidence matrices, b1 b2 = 0."""
    P, Fs, Es = vertices(name), faces(name), edges(name)
    look = {e: k for k, e in enumerate(Es)}
    b1 = [[0] * len(Es) for _ in P]
    for k, (i, j) in enumerate(Es):
        b1[i][k] = -1; b1[j][k] = 1
    b2 = [[0] * len(Fs) for _ in Es]
    for k, f in enumerate(Fs):
        for t in range(len(f)):
            i, j = f[t], f[(t + 1) % len(f)]
            b2[look[tuple(sorted((i, j)))]][k] = 1 if i < j else -1
    return b1, b2


@lru_cache(maxsize=None)
def solid_offsets():
    """Per solid: (cochain offset in the 190 space, vertex offset in the 50 vertex space, V, E, F)."""
    out, off, voff = {}, 0, 0
    for s in SOLIDS:
        V, E, F = len(vertices(s)), len(edges(s)), len(faces(s))
        out[s] = (off, voff, V, E, F)
        off += V + E + F; voff += V
    return out


@lru_cache(maxsize=None)
def hodge_dirac_190():
    """The original 190 x 190 integer Hodge-Dirac operator (blocks b1, b1^T, b2, b2^T per solid)."""
    D = [[0] * 190 for _ in range(190)]
    for s, (o, _, V, E, F) in solid_offsets().items():
        b1, b2 = boundary_maps(s)
        for i in range(V):
            for e in range(E):
                if b1[i][e]:
                    D[o + i][o + V + e] = D[o + V + e][o + i] = b1[i][e]
        for e in range(E):
            for k in range(F):
                if b2[e][k]:
                    D[o + V + e][o + V + E + k] = D[o + V + E + k][o + V + e] = b2[e][k]
    return D


def hodge_dirac_facts() -> dict:
    D = hodge_dirac_190()
    D2 = matmul(D, D)
    tr2 = sum(D2[i][i] for i in range(190))
    tr4 = sum(D2[i][j] * D2[j][i] for i in range(190) for j in range(190))
    rk = rank_mod_p(D)                       # lower bound for the rational rank
    kernel = []
    for s, (o, _, V, E, F) in solid_offsets().items():
        h0 = [0] * 190; hf = [0] * 190
        for i in range(V): h0[o + i] = 1
        for k in range(F): hf[o + V + E + k] = 1
        kernel += [h0, hf]
    ker_ok = all(not any(sum(D[i][j] * v[j] for j in range(190)) for i in range(190)) for v in kernel)
    return {"dim": 190, "tr_D2": tr2, "tr_D4": tr4, "rank_lower_bound_mod_p": rk,
            "explicit_kernel_vectors": len(kernel) if ker_ok else None,
            "dim_ker": 190 - rk if ker_ok and 190 - rk == len(kernel) else None}


# ----------------------------------------------------------------------------------------------- icosahedron
@lru_cache(maxsize=None)
def antipodal_pairs() -> tuple:
    """The six axes as (i, j), i the smaller remaining index, j its antipode (original greedy order)."""
    P = vertices("icosahedron")
    rem, pairs = set(range(12)), []
    while rem:
        i = min(rem)
        j = next(k for k in sorted(rem - {i}) if all(not (a + b) for a, b in zip(P[i], P[k])))
        pairs.append((i, j)); rem -= {i, j}
    return tuple(pairs)


@lru_cache(maxsize=None)
def icosahedron() -> dict:
    """Face incidence C (20x12), face adjacency, face Laplacian, hidden projector Ph and the 4_3 / 4_5
    projectors P3 = Ph(5-L)/2, P5 = Ph(L-3)/2, all exact rational (original Q79-Q83 definitions)."""
    Fs = faces("icosahedron")
    C = [[Fraction(int(v in f)) for v in range(12)] for f in Fs]
    adj = [[Fraction(int(i != j and len(set(Fs[i]) & set(Fs[j])) == 2)) for j in range(20)] for i in range(20)]
    L = [[(Fraction(3) if i == j else Fraction(0)) - adj[i][j] for j in range(20)] for i in range(20)]
    CtC = matmul(transpose(C), C)
    Pv = matmul(matmul(C, inverse(CtC)), transpose(C))
    Ph = [[(Fraction(1) if i == j else Fraction(0)) - Pv[i][j] for j in range(20)] for i in range(20)]
    fiveL = [[(Fraction(5) if i == j else Fraction(0)) - L[i][j] for j in range(20)] for i in range(20)]
    Lthree = [[L[i][j] - (Fraction(3) if i == j else Fraction(0)) for j in range(20)] for i in range(20)]
    P3 = [[x / 2 for x in r] for r in matmul(Ph, fiveL)]
    P5 = [[x / 2 for x in r] for r in matmul(Ph, Lthree)]
    vertex_adj = [[int(i != j and any(i in f and j in f for f in Fs)) for j in range(12)] for i in range(12)]
    return {"faces": Fs, "C": C, "face_adjacency": adj, "L_face": L, "Ph": Ph, "P3": P3, "P5": P5,
            "vertex_adjacency": vertex_adj, "pairs": antipodal_pairs()}


def _inv3(Mx):
    return inverse([list(r) for r in Mx])


@lru_cache(maxsize=None)
def ih_symmetries() -> tuple:
    """All 120 symmetries of the icosahedron as (vertex permutation, 3x3 Q5 matrix, det sign)."""
    P = vertices("icosahedron")
    adj = icosahedron()["vertex_adjacency"]
    a, b = sorted(j for j in range(12) if adj[0][j])[:2]
    if not adj[a][b]:
        b = next(j for j in range(12) if adj[0][j] and adj[a][j])
    base = [list(P[0]), list(P[a]), list(P[b])]            # rows
    Binv = _inv3(transpose(base))                           # columns -> inverse
    index = {p: i for i, p in enumerate(P)}
    out = []
    for v0 in range(12):
        for va in (j for j in range(12) if adj[v0][j]):
            for vb in (j for j in range(12) if adj[v0][j] and adj[va][j]):
                R = matmul(transpose([list(P[v0]), list(P[va]), list(P[vb])]), Binv)
                img = []
                for p in P:
                    q = tuple(sum((R[r][c] * p[c] for c in range(3)), Q5(0)) for r in range(3))
                    if q not in index:
                        break
                    img.append(index[q])
                else:
                    d = _det3(*[tuple(R[r][c] for r in range(3)) for c in range(3)])
                    out.append((tuple(img), tuple(tuple(r) for r in R), d.sign()))
    assert len(out) == 120
    return tuple(sorted(out))


@lru_cache(maxsize=None)
def a5_rotations() -> tuple:
    """The 60 proper rotations as vertex permutations (sorted), with their matrices."""
    return tuple((g, R) for g, R, s in ih_symmetries() if s > 0)


def a5_class_of(R) -> str:
    """Conjugacy class label from the exact trace: '1', '2', '3', '5A' (tr = phi), '5B' (tr = -1/phi)."""
    t = R[0][0] + R[1][1] + R[2][2]
    if t == 3: return "1"
    if t == -1: return "2"
    if t == 0: return "3"
    if t == PHI: return "5A"
    if t == 1 - PHI: return "5B"
    raise ValueError(f"not an A5 trace: {t}")


@lru_cache(maxsize=None)
def a5_character_table() -> dict:
    """Exact A5 characters on the classes, derived (not typed in): chi3 = trace of the rotation, chi3' its
    Galois conjugate, chi4 = (permutation character on the five Klein subgroups) - 1, chi5 = Sym^2 chi3 - 1.
    Orthogonality is asserted."""
    rots = a5_rotations()
    comp = lambda g, h: tuple(g[h[i]] for i in range(12))
    ident = tuple(range(12))
    invol = [g for g, _ in rots if g != ident and comp(g, g) == ident]
    kleins = sorted({frozenset((ident, x, y, comp(x, y))) for x in invol for y in invol
                     if x != y and comp(x, y) == comp(y, x)}, key=lambda s: sorted(s))
    assert len(kleins) == 5
    inv = lambda g: tuple(g.index(i) for i in range(12))
    classes = {}
    for g, R in rots:
        classes.setdefault(a5_class_of(R), []).append((g, R))
    order = ["1", "2", "3", "5A", "5B"]
    sizes = {c: len(classes[c]) for c in order}
    assert sizes == {"1": 1, "2": 15, "3": 20, "5A": 12, "5B": 12}
    table = {}
    for c in order:
        g, R = classes[c][0]
        chi3 = R[0][0] + R[1][1] + R[2][2]
        R2 = matmul([list(r) for r in R], [list(r) for r in R])
        chi3sq = R2[0][0] + R2[1][1] + R2[2][2]
        perm5 = sum(1 for K in kleins if frozenset(comp(comp(g, x), inv(g)) for x in K) == K)
        table[c] = {"1": Q5(1), "3": chi3, "3'": chi3.conj(), "4": Q5(perm5 - 1),
                    "5": (chi3 * chi3 + chi3sq) / 2 - 1}
    irreps = ["1", "3", "3'", "4", "5"]
    for x in irreps:
        for y in irreps:
            ip = sum((table[c][x] * table[c][y] * sizes[c] for c in order), Q5(0)) / 60
            assert ip == (1 if x == y else 0), (x, y, ip)
    return {"classes": order, "sizes": sizes, "irreps": irreps, "table": table}


def decompose_character(chi_by_class: dict) -> dict:
    """Multiplicities of the A5 irreps in a character given on the five classes."""
    T = a5_character_table()
    out = {}
    for x in T["irreps"]:
        m = sum((Q5(chi_by_class[c]) * T["table"][c][x] * T["sizes"][c] for c in T["classes"]), Q5(0)) / 60
        assert m.is_rational() and m.a.denominator == 1 and m.a >= 0, (x, m)
        if m.a:
            out[x] = int(m.a)
    return out


# ----------------------------------------------------------------------------------------------- D6 -> H3
@lru_cache(maxsize=None)
def d6_h3() -> dict:
    """D6 -> H3 folding on the six icosahedral axes.

    a_i = icosahedron vertex pairs[i][0].  The Seidel matrix S_ij = sign(a_i . a_j) (i != j) satisfies
    S^2 = 5 I; (I + S)/2 has eigenvalue phi on the geometric H3 triplet and -1/phi on the 3', and the Gram
    matrix of the a_i is phi sqrt5 (I + S/sqrt5).  The 60 D6 roots +-e_i +-e_j map to two shells of 30
    (squared norms 2 phi (sqrt5 + 1) and 2 phi (sqrt5 - 1), ratio phi^2), each an H3 root system.
    """
    P = vertices("icosahedron")
    pairs = antipodal_pairs()
    a = [P[i] for i, _ in pairs]
    S = [[Q5(0) if i == j else Q5(_dot(a[i], a[j]).sign()) for j in range(6)] for i in range(6)]
    S2 = matmul(S, S)
    assert all(S2[i][j] == (5 if i == j else 0) for i in range(6) for j in range(6))
    sq5 = Q5(0, 1)
    Pp = [[((1 if i == j else 0) + S[i][j] / sq5) / 2 for j in range(6)] for i in range(6)]
    Pm = [[((1 if i == j else 0) - S[i][j] / sq5) / 2 for j in range(6)] for i in range(6)]
    gram = [[_dot(a[i], a[j]) for j in range(6)] for i in range(6)]
    assert all(gram[i][j] == PHI * sq5 * ((1 if i == j else 0) + S[i][j] / sq5) for i in range(6) for j in range(6))
    roots = []
    for i, j in combinations(range(6), 2):
        for si, sj in product((1, -1), repeat=2):
            roots.append(tuple(si * x + sj * y for x, y in zip(a[i], a[j])))
    shells = {}
    for r in roots:
        shells.setdefault(_dot(r, r), []).append(r)
    norms = sorted(shells, key=float)
    assert len(norms) == 2 and all(len(shells[n]) == 30 for n in norms)
    assert norms[1] / norms[0] == PHI * PHI
    # each shell is closed under the 120 symmetries (an H3 root system)
    for n in norms:
        sh = set(shells[n])
        for _, R, _ in ih_symmetries():
            assert all(tuple(sum((R[r][c] * v[c] for c in range(3)), Q5(0)) for r in range(3)) in sh for v in shells[n])
    return {"axes": a, "seidel": S, "P_H3": Pp, "P_H3prime": Pm, "labels": (PHI, 1 - PHI),
            "shell_norms": tuple(norms), "shell_sizes": (30, 30)}


@lru_cache(maxsize=None)
def laplacian_charpolys() -> dict:
    """Exact characteristic polynomials of the icosahedral graph Laplacian and of the centred 13-cell."""
    from .linalg import charpoly
    A = icosahedron()["vertex_adjacency"]
    L12 = [[Fraction(5 if i == j else -A[i][j]) for j in range(12)] for i in range(12)]
    L13 = [[Fraction(12)] + [Fraction(-1)] * 12] + [[Fraction(-1)] + [L12[i][j] + (1 if i == j else 0) for j in range(12)]
                                                 for i in range(12)]
    return {"L12": charpoly(L12), "L13": charpoly(L13)}
