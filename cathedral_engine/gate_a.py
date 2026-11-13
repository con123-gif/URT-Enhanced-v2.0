"""Reusable Gate A objects built from the engine's original operators (Q64 selection, Q83 clock, Q88/Q89 rows).

Nothing here is fitted.  Statements proved by the certificates that use these functions are recorded in the
evidence ledger; the functions themselves only construct objects.
"""
from __future__ import annotations

import ast
from fractions import Fraction
from functools import lru_cache

from .fields import Q5, RadicalTower
from .geometry import icosahedron, vertices
from .histories import M_matrix, SIGMA1_BETA, dictionary_index, selected_orbit, sigma_lift
from .linalg import matmul, rank, rref, transpose
from .provenance import original_path

__all__ = ["sigma1", "selected_dictionaries", "pull_back", "clock_projector", "constraint_matrix",
           "joint_rowspace", "q89_rows", "source_line", "source_family_vectors", "FORBIDDEN_K", "ALLOWED_K"]

FORBIDDEN_K = (2, 10, 14, 22)     # k = 2 (mod 4), k != 0 (mod 3): the multiplicity-5 modes of the P3 carrier
ALLOWED_K = (6, 18)               # k = 2 (mod 4), k = 0 (mod 3): the multiplicity-6 modes


def sigma1() -> tuple:
    return sigma_lift(SIGMA1_BETA)


def selected_dictionaries() -> tuple:
    return selected_orbit()["classes"]


def pull_back(vec20, D):
    """y[a] = (M v)[idx_D[a]]: a face vector carried to URT-history coordinates (raw M; divide by sqrt2 for U_h)."""
    Mm = M_matrix()
    Mv = []
    for row in Mm:
        s = None
        for k, m in enumerate(row):
            if m:
                s = vec20[k] if s is None else s + vec20[k]
        Mv.append(s if s is not None else 0 * vec20[0])
    return [Mv[i] for i in dictionary_index(D)]


@lru_cache(maxsize=None)
def clock_projector(K: tuple):
    from .clock import mode_class_projector
    P, rational = mode_class_projector(sigma1(), K)
    assert rational, f"mode class {K} has an irrational projector"
    return tuple(tuple(r) for r in P)


def constraint_matrix(D, K=FORBIDDEN_K):
    """Pi_K Pi_D M P3 (64 x 20, rational): f -> clock-K content of the P3 source of f under dictionary D."""
    ico = icosahedron()
    Mm = M_matrix()
    idx = dictionary_index(D)
    MD = [[Fraction(Mm[i][k]) for k in range(20)] for i in idx]
    return matmul([list(r) for r in clock_projector(tuple(sorted(K)))], matmul(MD, ico["P3"]))


def joint_rowspace(Ds, K=FORBIDDEN_K):
    rows = []
    per = {}
    for D in Ds:
        R, _ = rref(constraint_matrix(D, K))
        per[D] = len(R)
        rows += R
    J, piv = rref(rows)
    return J, per


@lru_cache(maxsize=None)
def q89_rows() -> tuple:
    """The three integer rows exactly as committed in the Q89 certificate (parsed from its source, not retyped)."""
    tree = ast.parse(original_path("q89_source").read_text())
    for node in ast.walk(tree):
        if isinstance(node, ast.Assign) and any(isinstance(t, ast.Name) and t.id == "rows" for t in node.targets):
            return tuple(tuple(int(x) for x in r) for r in ast.literal_eval(node.value))
    raise KeyError("rows not found in the Q89 certificate")


def source_line(rows=None):
    """Rational spanning vector of {h in im P3 : r . h = 0 for the Q89 rows}, with its dimension."""
    from .linalg import nullspace
    rows = q89_rows() if rows is None else rows
    P3 = icosahedron()["P3"]
    # im P3 = column space of P3; solve P3 c with r . P3 c = 0
    A = matmul([[Fraction(x) for x in r] for r in rows], P3)
    sol = nullspace(A)
    imgs = [[sum((P3[i][j] * c[j] for j in range(20)), Fraction(0)) for i in range(20)] for c in sol]
    basis, _ = rref(imgs)
    return basis


@lru_cache(maxsize=None)
def source_family_vectors() -> dict:
    """(CZ)^2, (CZ)(CXY), (CXY)^2 over Q(sqrt5) for the raw icosahedral coordinate functions Z and XY."""
    P = vertices("icosahedron")
    C = icosahedron()["C"]
    Z = [p[2] for p in P]
    XY = [p[0] * p[1] for p in P]
    CZ = [sum((Z[v] for v in range(12) if C[k][v]), Q5(0)) for k in range(20)]
    CXY = [sum((XY[v] for v in range(12) if C[k][v]), Q5(0)) for k in range(20)]
    return {"Z": Z, "XY": XY, "ZZ": [a * a for a in CZ], "ZXY": [a * b for a, b in zip(CZ, CXY)],
            "XYXY": [b * b for b in CXY]}
