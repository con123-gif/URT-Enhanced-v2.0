"""
Cone(I_12) — the actual centered icosahedral graph Laplacian (v2.9.86).

Spectral content and the closed-form η_{G_{13}} = 5508/2821 in this
module are due to **James Lockwood** (2026, private communication).
The Cathedral integer factorisation of both 5508 and 2821 and the
connection to the BT8g bimetric reduction were surfaced collaboratively.

This module builds the *graph-theoretically rigorous* Laplacian of the
cone over the icosahedron and verifies the closed-form identity

    η_{G_{13}}  =  Tr'(L^{-1})  =  5508 / 2821

where Tr' is the sum over non-zero eigenvalues.

Why this module exists
----------------------

The framework's `urt.spectrum_cathedral` exposes a postulated
*character spectrum*

    {0, 3², 5⁶, 7², 9, 13}     (trace = D!·V = 72)

which arises from the K_4 ⊕ A_5 representation-theoretic
decomposition (see `urt.sector_unification`).  That object is not
the spectrum of any graph Laplacian — its trace 72 ≠ 84 = 2·|E| for
Cone(I_12).

The actual graph-Laplacian spectrum of the cone over the
icosahedron is

    spec(L)  =  {0, (6−√5)³, 7⁵, (6+√5)³, 13}    (trace = 84 = 2·42)

with 30 icosahedron edges + 12 cone edges = 42 total.

Both objects share A_5 symmetry and the integer eigenvalues
{0, 7, 13}, but they are different Laplacians.  The BT8g sector
(`urt.bt8g_cathedral`) uses *this* (the actual graph) Laplacian, and
the closed-form η = 5508/2821 belongs to this module.

Cathedral factorisation of η
----------------------------

       (D+1) · (1/γ) · (N+D+1)        4 · 81 · 17        5508
η  =  ─────────────────────────  =  ─────────────  =  ───────
       (D!+1) · N · (2^q − 1)         7 · 13 · 31        2821

Every prime in numerator and denominator is Cathedral:
   4 = D+1   = |K_4|              7  = D!+1
  81 = 1/γ   = D^(D+1)            13 = N
  17 = N+D+1 (also # wallpaper)   31 = 2^q − 1 = M_q (Mersenne)

Kirchhoff and resistance
------------------------

  Kf(G_{13})  =  N · η  =  13 · 5508/2821  =  5508/217
                                              (217 = 7·31)
  R̄          =  Kf / C(13,2)  =  918/2821
                                              (918 = 2·D^D·(N+D+1))

CI gate: `from urt import cone_icosahedron_audit_passes`.
"""
from __future__ import annotations

from fractions import Fraction
from math import factorial
from typing import Any, Dict, List, Tuple

import numpy as np

from .shell_closure import D, q, V, N

# Cathedral constants reused below
GAMMA_INV = D ** (D + 1)                # = 81
M_q = 2 ** q - 1                        # = 31


# ── icosahedron adjacency (canonical Schlegel embedding) ────────────────


_ICOSA_EDGES: Tuple[Tuple[int, int], ...] = (
    # top pentagon around vertex 0
    (0, 1), (0, 2), (0, 3), (0, 4), (0, 5),
    (1, 2), (2, 3), (3, 4), (4, 5), (5, 1),
    # middle belt
    (1, 7), (1, 6), (2, 7), (2, 8), (3, 8), (3, 9),
    (4, 9), (4, 10), (5, 10), (5, 6),
    # bottom pentagon around vertex 11
    (6, 7), (7, 8), (8, 9), (9, 10), (10, 6),
    (11, 6), (11, 7), (11, 8), (11, 9), (11, 10),
)


def icosahedron_adjacency() -> np.ndarray:
    """12×12 adjacency matrix of the icosahedron graph (5-regular)."""
    A = np.zeros((12, 12), dtype=int)
    for a, b in _ICOSA_EDGES:
        A[a, b] = A[b, a] = 1
    return A


def cone_adjacency() -> np.ndarray:
    """13×13 adjacency matrix of Cone(I_12) — outer 12 + center vertex 12."""
    A = np.zeros((13, 13), dtype=int)
    A[:12, :12] = icosahedron_adjacency()
    A[12, :12] = 1
    A[:12, 12] = 1
    return A


def cone_laplacian() -> np.ndarray:
    """13×13 graph Laplacian L = diag(deg) − A of Cone(I_12)."""
    A = cone_adjacency()
    deg = A.sum(axis=1)
    return np.diag(deg) - A


def cone_edge_count() -> int:
    """|E(Cone(I_12))| = 42 = 30 (icosahedron) + 12 (cone)."""
    return cone_adjacency().sum() // 2


# ── canonical spectrum + verification ──────────────────────────────────


def cone_spectrum_numerical(rounding: int = 10) -> List[float]:
    """Sorted Laplacian eigenvalues via numpy.linalg.eigvalsh."""
    L = cone_laplacian()
    return sorted(np.linalg.eigvalsh(L).round(rounding).tolist())


def cone_spectrum_closed_form() -> Dict[str, Any]:
    """Closed-form spectrum {0, (6−√5)³, 7⁵, (6+√5)³, 13}."""
    sqrt5 = float(np.sqrt(5))
    expected = (
        [0.0]
        + [6 - sqrt5] * 3
        + [7.0] * 5
        + [6 + sqrt5] * 3
        + [13.0]
    )
    return {
        "eigenvalues":   sorted(expected),
        "multiplicities": {
            "0":            1,
            "6 − √5":       3,
            "7":            5,
            "6 + √5":       3,
            "13":           1,
        },
        "fiedler":       6 - sqrt5,        # smallest non-zero
        "largest":       13.0,
        "trace":         84,
        "trace_decomp":  "0 + 3(6−√5) + 5·7 + 3(6+√5) + 13 = 84",
    }


def spectrum_matches_closed_form(tol: float = 1e-9) -> bool:
    """Numerical spec agrees with the closed-form spec to tolerance."""
    computed = cone_spectrum_numerical(rounding=12)
    expected = cone_spectrum_closed_form()["eigenvalues"]
    return all(abs(a - b) < tol for a, b in zip(computed, expected))


# ── η_{G_13} = Tr'(L^{-1}) closed form ─────────────────────────────────


def eta_g13_symbolic() -> Fraction:
    """η = 3/(6−√5) + 5/7 + 3/(6+√5) + 1/13 = 36/31 + 5/7 + 1/13 = 5508/2821.

    The √5 terms cancel exactly:
        3/(6−√5) + 3/(6+√5)  =  6·(2·6)/((6)²−5)  =  36/31
    """
    return Fraction(36, 31) + Fraction(5, 7) + Fraction(1, 13)


def eta_g13_cathedral_factorisation() -> Dict[str, Any]:
    """5508 = (D+1)·(1/γ)·(N+D+1) ;  2821 = (D!+1)·N·M_q."""
    num = (D + 1) * GAMMA_INV * (N + D + 1)        # = 5508
    den = (factorial(D) + 1) * N * M_q             # = 2821
    return {
        "numerator":         num,
        "numerator_form":    "(D+1) · (1/γ) · (N+D+1)",
        "denominator":       den,
        "denominator_form":  "(D!+1) · N · (2^q − 1)",
        "value":             Fraction(num, den),
        "matches_5508_2821": Fraction(num, den) == Fraction(5508, 2821),
    }


# ── Kirchhoff index + average pairwise resistance ──────────────────────


def kirchhoff_index() -> Fraction:
    """Kf(G_{13}) = N · η = 13 · 5508/2821 = 5508/217.   (217 = 7·31)"""
    return N * eta_g13_symbolic()


def average_pairwise_resistance() -> Fraction:
    """R̄ = Kf / C(N, 2) = 918/2821.   (918 = 2·D^D·(N+D+1))"""
    return kirchhoff_index() / Fraction(N * (N - 1), 2)


# ── verification: numerical sum agrees with symbolic ────────────────────


def eta_numerical(rounding: int = 12) -> float:
    """Σ 1/λ_i over non-zero eigenvalues, computed numerically."""
    spec = cone_spectrum_numerical(rounding=rounding)
    return float(sum(1.0 / x for x in spec[1:]))


def numerical_symbolic_agreement(tol: float = 1e-10) -> bool:
    return abs(eta_numerical() - float(eta_g13_symbolic())) < tol


# ── Aggregate audit ────────────────────────────────────────────────────


def cone_icosahedron_audit() -> Dict[str, Any]:
    """End-to-end audit of the cone-Laplacian spectral identities."""
    closed = cone_spectrum_closed_form()
    return {
        "n_vertices":              13,
        "n_edges":                 cone_edge_count(),
        "spectrum_closed_form":    closed,
        "spectrum_matches":        spectrum_matches_closed_form(),
        "trace_equals_2E":         cone_laplacian().trace() == 2 * cone_edge_count(),
        "trace_value":             int(cone_laplacian().trace()),
        "eta_symbolic":            eta_g13_symbolic(),
        "eta_factorisation":       eta_g13_cathedral_factorisation(),
        "eta_num_sym_match":       numerical_symbolic_agreement(),
        "kirchhoff_index":         kirchhoff_index(),
        "kirchhoff_factorisation": "5508/217 = (D+1)·(1/γ)·(N+D+1) / [(D!+1)·M_q]",
        "average_resistance":      average_pairwise_resistance(),
        "average_resistance_factorisation":
                                    "918/2821 = (D−1)·D^D·(N+D+1) / [(D!+1)·N·M_q]",
    }


def cone_icosahedron_audit_passes() -> bool:
    """All cone-Laplacian identities hold."""
    audit = cone_icosahedron_audit()
    return (
        audit["n_vertices"] == 13
        and audit["n_edges"] == 42
        and audit["spectrum_matches"]
        and audit["trace_equals_2E"]
        and audit["trace_value"] == 84
        and audit["eta_symbolic"] == Fraction(5508, 2821)
        and audit["eta_factorisation"]["matches_5508_2821"]
        and audit["eta_num_sym_match"]
        and audit["kirchhoff_index"] == Fraction(5508, 217)
        and audit["average_resistance"] == Fraction(918, 2821)
    )


def print_cone_icosahedron_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" Cone(I_12) — actual graph Laplacian of the centered icosahedral graph")
    print(bar)

    A = cone_adjacency()
    deg = A.sum(axis=1)
    print(f"\n  Vertices       : 13   (12 outer + 1 center)")
    print(f"  Edges          : {cone_edge_count()}   (= 30 icosahedron + 12 cone)")
    print(f"  Degree sequence: shell = {int(deg[0])}, center = {int(deg[12])}")
    print(f"  Trace(L)       : {int(cone_laplacian().trace())}  (= 2 · |E|)")

    print(f"\n  Closed-form spectrum:")
    cf = cone_spectrum_closed_form()
    for k, m in cf["multiplicities"].items():
        print(f"     λ = {k:<8}  multiplicity {m}")
    print(f"  Fiedler eigenvalue λ₂ = 6 − √5 ≈ {cf['fiedler']:.6f}")
    print(f"  Spectrum matches numerical: {spectrum_matches_closed_form()}")

    print(f"\n  η_{{G_13}}  =  Tr'(L^{{−1}})  =  3/(6−√5) + 5/7 + 3/(6+√5) + 1/13")
    print(f"              =  36/31 + 5/7 + 1/13  =  {eta_g13_symbolic()}")
    f = eta_g13_cathedral_factorisation()
    print(f"  Cathedral:  η  =  ({f['numerator']}/{f['denominator']})")
    print(f"                 =  (D+1)·(1/γ)·(N+D+1)  /  (D!+1)·N·M_q")
    print(f"                 =  4 · 81 · 17  /  7 · 13 · 31")

    print(f"\n  Kirchhoff index Kf  =  N · η  =  {kirchhoff_index()}")
    print(f"  Average resistance  =  Kf / C(13,2)  =  {average_pairwise_resistance()}")

    print()
    print(bar)
    print(f"  cone_icosahedron_audit_passes() = {cone_icosahedron_audit_passes()}")
    print(bar)


__all__ = [
    # Graph constructors
    "icosahedron_adjacency",
    "cone_adjacency",
    "cone_laplacian",
    "cone_edge_count",
    # Spectral
    "cone_spectrum_numerical",
    "cone_spectrum_closed_form",
    "spectrum_matches_closed_form",
    # Cathedral identities
    "eta_g13_symbolic",
    "eta_g13_cathedral_factorisation",
    "eta_numerical",
    "numerical_symbolic_agreement",
    "kirchhoff_index",
    "average_pairwise_resistance",
    # Audit
    "cone_icosahedron_audit",
    "cone_icosahedron_audit_passes",
    "print_cone_icosahedron_report",
]
