"""The original all-five nonlinear hidden source, exactly (2026-11-07 ``hidden_source``; Q81 radical form).

    Eraw = harmonic moments of the 50 vertices (degree 1 and 2 scalar harmonics of the unit vectors),
    Eglobal = Eraw G^{-1/2} (G = Eraw^T Eraw), Iico = I H^{-1/2} (H = I^T I, I the icosahedron block),
    Plinear = Iico Eglobal^T,  x = Plinear v50,  f = (C x)^2 (entrywise),  h3 = P3 f,  h5 = P5 f.

Everything here is exact in a RadicalTower: sqrt5, sqrt3, sqrt2 and further prime radicals, rho = sqrt((5+sqrt5)/2)
(the icosahedral vertex norm), and the two nested radicals of each 2x2 Gram block inverse square root
B^{-1/2} = sqrt(tr B + 2 sqrt(det B)) (B + sqrt(det B) I)^{-1} (Cayley-Hamilton; Q81).  ``hidden_source_float``
runs the original numpy function unmodified for comparison.
"""
from __future__ import annotations

from fractions import Fraction
from functools import lru_cache

from .fields import RadicalTower, Q5
from .geometry import SOLIDS, icosahedron, solid_offsets, vertices
from .linalg import matvec

__all__ = ["SourceTower", "exact_source", "hidden_source_float", "q81_reference"]

GRAM_BLOCKS = ((0, 7), (1, 6), (2, 5), (3,), (4,))
Q81_PRINTED = {"norm3": "0.032194544822365221694503455948311627", "norm5": "0.0018261794348137894279051028989514859"}


class SourceTower:
    """A RadicalTower with the Cathedral's standard radicals and Q5 -> tower conversion."""

    def __init__(self, bits: int = 400):
        self.T = RadicalTower(bits)
        self.s5 = self.T.sqrt_rational(5)
        self.s2 = self.T.sqrt_rational(2)
        self.s3 = self.T.sqrt_rational(3)

    def q5(self, x) -> object:
        x = x if isinstance(x, Q5) else Q5(x)
        return self.T.const(x.a) + self.s5 * x.b

    def inv_sqrt_norm(self, n2: Q5):
        """1/sqrt(n2) for a positive Q5 n2: rational radicals canonically, otherwise a new generator."""
        if n2.is_rational():
            return 1 / self.T.sqrt_rational(n2.a)
        return 1 / self.T.sqrt(self.q5(n2), "rho" if n2 == Q5(Fraction(5, 2), Fraction(1, 2)) else None)


def _moments_row(st: SourceTower, p):
    X, Y, Z = (st.q5(c) for c in p)
    n2 = p[0] * p[0] + p[1] * p[1] + p[2] * p[2]
    r = st.inv_sqrt_norm(n2)
    x, y, z = X * r, Y * r, Z * r
    s2, s6 = st.s2, st.s2 * st.s3
    return [x, y, z, (x * x - y * y) / s2, (x * x + y * y - 2 * z * z) / s6, s2 * x * y, s2 * x * z, s2 * y * z]


def _inv_sqrt_block(st: SourceTower, B):
    """B^{-1/2} for a positive 1x1 or 2x2 block (Cayley-Hamilton form)."""
    T = st.T
    if len(B) == 1:
        return [[1 / T.sqrt(B[0][0], "g")]]
    det = B[0][0] * B[1][1] - B[0][1] * B[1][0]
    sd = T.sqrt(det, "sqrt_detB")
    tau = T.sqrt(B[0][0] + B[1][1] + 2 * sd, "tau")
    a, b, c, d = B[0][0] + sd, B[0][1], B[1][0], B[1][1] + sd
    den = a * d - b * c
    return [[tau * d / den, -tau * b / den], [-tau * c / den, tau * a / den]]


@lru_cache(maxsize=None)
def exact_source(v50: tuple = ((0, 1), (3, 1))) -> dict:
    """The exact source for v50 = sum of coefficient * e_vertex (default e0 + e3, the archived Q81 input).

    Returns tower, the 8-vector Eraw^T v50, Gram blocks, x (12), f (20), h3, h5 and the exact norms."""
    st = SourceTower()
    T = st.T
    offs = solid_offsets()
    rows = []
    for s in SOLIDS:
        rows += [_moments_row(st, p) for p in vertices(s)]
    assert len(rows) == 50
    # Gram matrix and its exact block structure
    G = [[sum((rows[v][i] * rows[v][j] for v in range(50)), T.zero()) for j in range(8)] for i in range(8)]
    blocks_ok = all(not G[i][j] for b in GRAM_BLOCKS for i in b for j in range(8) if j not in b)
    assert blocks_ok, "Gram block structure"
    R = [[T.zero()] * 8 for _ in range(8)]
    block_inv = {}
    for b in GRAM_BLOCKS:
        B = [[G[i][j] for j in b] for i in b]
        Bi = _inv_sqrt_block(st, B) if len(b) == 2 or True else None
        block_inv[b] = Bi
        for ii, i in enumerate(b):
            for jj, j in enumerate(b):
                R[i][j] = Bi[ii][jj]
    ico = rows[offs["icosahedron"][1]: offs["icosahedron"][1] + 12]
    H = [[sum((ico[v][i] * ico[v][j] for v in range(12)), T.zero()) for j in range(8)] for i in range(8)]
    assert all(not H[i][j] for i in range(8) for j in range(8) if i != j), "icosahedral moments are orthogonal"
    J = [1 / T.sqrt(H[i][i]) for i in range(8)]
    w = [T.zero()] * 8
    for vtx, coef in v50:
        for i in range(8):
            w[i] = w[i] + rows[vtx][i] * coef
    Rw = matvec(R, w)
    JRw = [J[i] * Rw[i] for i in range(8)]
    x = [sum((ico[v][i] * JRw[i] for i in range(8) if JRw[i]), T.zero()) for v in range(12)]
    icd = icosahedron()
    Cx = [sum((x[v] for v in range(12) if icd["C"][k][v]), T.zero()) for k in range(20)]
    f = [c * c for c in Cx]
    h3 = [sum((icd["P3"][i][j] * f[j] for j in range(20) if icd["P3"][i][j]), T.zero()) for i in range(20)]
    h5 = [sum((icd["P5"][i][j] * f[j] for j in range(20) if icd["P5"][i][j]), T.zero()) for i in range(20)]
    n3 = sum((a * a for a in h3), T.zero())
    n5 = sum((a * a for a in h5), T.zero())
    return {"st": st, "T": T, "G": G, "R": R, "J": J, "w": w, "x": x, "Cx": Cx, "f": f, "h3": h3, "h5": h5,
            "norm3": n3, "norm5": n5, "rows": rows}


def hidden_source_float(v50):
    """Run the ORIGINAL numpy ``hidden_source`` (definitions executed unmodified from the 2026-11-07 file)."""
    import numpy as np
    from .provenance import load_definitions, original_path
    names = ["phi", "names", "verts", "build_faces", "whiten", "unitrows", "harmonic_moments"]
    ns = load_definitions(original_path("joint_action_2026_11_07"), names)
    verts = ns["verts"]
    Eraw = np.vstack([ns["harmonic_moments"](verts[n]) for n in ns["names"]])
    Eg = ns["whiten"](Eraw)
    Ii = ns["whiten"](ns["harmonic_moments"](verts["icosahedron"]))
    Pl = Ii @ Eg.T
    icd = icosahedron()
    C = np.array([[float(x) for x in r] for r in icd["C"]])
    P3 = np.array([[float(x) for x in r] for r in icd["P3"]]); P5 = np.array([[float(x) for x in r] for r in icd["P5"]])
    xx = Pl @ np.asarray(v50, dtype=complex)
    f = (C @ xx) ** 2
    return P3 @ f, P5 @ f, xx


def q81_reference() -> dict:
    return dict(Q81_PRINTED)
