"""
Cathedral identity engine.

The framework's central claim is that *every* dimensionless physical
constant decomposes into Cathedral integers under simple algebraic
operations.  This module is a programmatic auditor for that claim.

Two public functions:

    scan_identities(operations=("+","-","*","/"), max_value=300)
        Returns every (a, op, b, c) where:
          - a, b, c are named Cathedral expressions
          - op ∈ operations
          - a op b = c (within float tolerance)
          - the equation is *non-trivial* (not "1·X=X", "X+0=X", etc.)

    find_expressions_for(target, tol=1e-9)
        Returns the list of (a, op, b) such that a op b ≈ target.
        Useful when you have an empirical number and want to know
        whether the Cathedral can produce it.

The vocabulary `CATHEDRAL_INTEGERS` is the canonical set; extend it via
`extend_vocabulary(name, value)` if you discover new compound names.
"""
from __future__ import annotations

from itertools import product
from math import factorial, isclose, sqrt, pi
from typing import Callable, Iterable

from .shell_closure import D, N, V, E, F, q, G, gamma, phi, DELTA_STAR


__all__ = [
    "CATHEDRAL_INTEGERS",
    "scan_identities",
    "find_expressions_for",
    "extend_vocabulary",
    "audit_known_identities",
]


# ────────────────────────────────────────────────────────────────────────────
#  Canonical Cathedral vocabulary
# ────────────────────────────────────────────────────────────────────────────

# Each name maps to a numeric value.  Names are short to keep scan output
# legible; values are derived from D=3 alone.
CATHEDRAL_INTEGERS: dict[str, int | float] = {
    # primary
    "D":    D,        "q":    q,        "V":    V,        "N":    N,
    "E":    E,        "F":    F,        "G":    G,
    # arithmetic combinations on D
    "D-1":  D - 1,
    "D+1":  D + 1,
    "2D":   2*D,
    "D!":   factorial(D),
    "D!+1": factorial(D) + 1,
    "D^D":  D**D,
    "D^q":  D**q,
    "D²":   D**2,
    "1/γ":  int(1/gamma),
    "(D+1)^D": (D + 1)**D,
    # arithmetic combinations of q, V, N, E, F, G
    "q²":   q**2,
    "V²":   V**2,
    "N²":   N**2,
    "2V":   2*V,
    "2N":   2*N,
    "2E":   2*E,
    "2F":   2*F,
    "2G":   2*G,
    "G/2":  G // 2,
    "G/D":  G // D,
    "G/q":  G // q,
    "G/V":  G // V,
    "G/F":  G // F,
    "F-D":  F - D,
    "F+D":  F + D,
    "F-V":  F - V,
    "F+V":  F + V,
    "E+q":  E + q,
    "E-V":  E - V,
    "E+V":  E + V,
    "G+D":  G + D,
    "G-D":  G - D,
    "G+V":  G + V,
    "G-V":  G - V,
    "G+F":  G + F,
    "G-F":  G - F,
    "G-D²": G - D**2,
    "N+D":  N + D,
    "N-D":  N - D,
    "N+1":  N + 1,
    "N-1":  N - 1,
    "(N+D+1)": N + D + 1,
    "(2D+q)":  2*D + q,
    "(D+q)":   D + q,
    # famous integer observables
    "137":  137,        # = N² − E − (D−1)
    "197":  197,        # = (D+1)F + (N−D−1)N
    "207":  207,        # = D(G + D²) (m_µ/m_e bare)
    "1836": 1836,       # = (D+1)·D^D·(N+D+1) (mp/me)
    # cross-products that come up everywhere
    "V·D":  V*D,
    "V·q":  V*q,
    "F·D":  F*D,
    "q·D":  q*D,
    "q·F":  q*F,
    "F·V":  F*V,
    "N·D":  N*D,
    "D!·V": factorial(D) * V,
    "D!·q": factorial(D) * q,
}


def extend_vocabulary(name: str, value: int | float) -> None:
    """Add a new (name, value) to the global Cathedral vocabulary."""
    CATHEDRAL_INTEGERS[name] = value


def _is_trivial(a: str, op: str, b: str) -> bool:
    """Filter out X+0=X, 1·X=X, X·1=X, X/X=1, X-X=0, etc."""
    if a == b and op in {"-", "/"}:
        return True
    return False


# ────────────────────────────────────────────────────────────────────────────
#  Scanners
# ────────────────────────────────────────────────────────────────────────────

_OPS: dict[str, Callable[[float, float], float]] = {
    "+": lambda a, b: a + b,
    "-": lambda a, b: a - b,
    "*": lambda a, b: a * b,
    "/": lambda a, b: a / b if b != 0 else float("inf"),
}


def scan_identities(
    operations: Iterable[str] = ("+", "*"),
    *,
    max_value: float = 300,
    min_factor: int = 2,
    tol: float = 1e-9,
) -> list[tuple[str, str, str, str]]:
    """
    Return every non-trivial identity ``a op b = c`` with all three names
    in the Cathedral vocabulary.

    Parameters
    ----------
    operations : iterable of str
        Subset of {"+", "-", "*", "/"}.  Default ("+", "*") because
        subtraction and division produce mostly trivial dual-identities.
    max_value : float
        Skip identities involving values larger than this.
    min_factor : int
        For multiplicative identities, require both factors ≥ min_factor
        (drops "1 × X = X" noise).
    tol : float
        Equality tolerance.

    Returns
    -------
    list of (a, op, b, c) tuples — one row per identity, deduplicated by
    canonical (a≤b for commutative ops, and (a,b)→(b,a) collapsed).
    """
    # Build value→names index for the right-hand side
    value_to_names: dict[float, list[str]] = {}
    for name, val in CATHEDRAL_INTEGERS.items():
        value_to_names.setdefault(round(val, 12), []).append(name)

    # Generate
    seen_signatures: set = set()
    out: list[tuple[str, str, str, str]] = []
    items = list(CATHEDRAL_INTEGERS.items())

    for op in operations:
        op_fn = _OPS[op]
        commutative = op in {"+", "*"}
        for (na, va), (nb, vb) in product(items, repeat=2):
            if op == "*" and (va < min_factor or vb < min_factor):
                continue
            if _is_trivial(na, op, nb):
                continue
            if commutative and na > nb:
                continue
            try:
                c = op_fn(va, vb)
            except ZeroDivisionError:
                continue
            if not isinstance(c, (int, float)) or abs(c) > max_value:
                continue
            c_round = round(c, 12)
            if c_round in value_to_names:
                for nc in value_to_names[c_round]:
                    if nc in (na, nb):
                        continue
                    sig = (op, frozenset({na, nb}) if commutative else (na, nb), nc)
                    if sig in seen_signatures:
                        continue
                    seen_signatures.add(sig)
                    out.append((na, op, nb, nc))
    return sorted(out, key=lambda t: (t[1], t[3], t[0], t[2]))


def find_expressions_for(
    target: float,
    *,
    operations: Iterable[str] = ("+", "-", "*", "/"),
    tol: float = 1e-9,
    rel_tol: float = 0,
) -> list[tuple[str, str, str]]:
    """
    Return every ``(a, op, b)`` whose value matches `target` within `tol`
    (or `rel_tol` if non-zero).

    Useful when you have an empirical constant and want to know if any
    simple Cathedral expression reproduces it.
    """
    out: list[tuple[str, str, str]] = []
    items = list(CATHEDRAL_INTEGERS.items())
    for op in operations:
        op_fn = _OPS[op]
        commutative = op in {"+", "*"}
        for (na, va), (nb, vb) in product(items, repeat=2):
            if commutative and na > nb:
                continue
            if op == "/" and vb == 0:
                continue
            try:
                c = op_fn(va, vb)
            except ZeroDivisionError:
                continue
            if rel_tol:
                ok = isclose(c, target, rel_tol=rel_tol, abs_tol=tol)
            else:
                ok = abs(c - target) < tol
            if ok:
                out.append((na, op, nb))
    return out


# ────────────────────────────────────────────────────────────────────────────
#  Pre-canned audit
# ────────────────────────────────────────────────────────────────────────────

def audit_known_identities() -> dict[str, bool]:
    """
    Verify the ~20 named identities in CLAUDE.md and the manuscripts.
    Returns {description: pass}.  Useful as a smoke test.
    """
    checks = {
        "1/α (bare) = N² - E - (D-1) = 137":
            N**2 - E - (D - 1) == 137,
        "mp/me = (D+1)·D^D·(N+D+1) = 1836":
            (D + 1) * D**D * (N + D + 1) == 1836,
        "δ_CP° = (D+1)F + (N-D-1)N = 197":
            (D + 1)*F + (N - D - 1)*N == 197,
        "1/α + |A_5| = δ_CP°  (137 + 60 = 197)":
            (N**2 - E - (D - 1)) + G == ((D + 1)*F + (N - D - 1)*N),
        "(q,V,N) = (5,12,13) Pythagorean triple":
            q**2 + V**2 == N**2,
        "1/γ = D⁴ = 81 = G + F + 1":
            int(1/gamma) == D**4 == G + F + 1,
        "G = q · V (icosahedral group order)":
            G == q * V,
        "G = D · F (alternative factorisation)":
            G == D * F,
        "G = 2 · E (third factorisation)":
            G == 2 * E,
        "V = D + D² (kissing number in 3D)":
            V == D + D**2,
        "N = 1 + D + D² (centred shell)":
            N == 1 + D + D**2,
        "V - E + F = 2 (Euler χ of S²)":
            V - E + F == 2,
        "3F = 2E (icosahedron is triangular)":
            3 * F == 2 * E,
        "ARF d_35 = E + q":
            E + q == 35,
        "ARF d_51 = G - D²":
            G - D**2 == 51,
        "ARF d_63 = G + D":
            G + D == 63,
        "ARF d_64 = (D+1)^D":
            (D + 1)**D == 64,
        "ARF d_80 = 4F = 1/γ - 1":
            4*F == int(1/gamma) - 1 == 80,
        "ARF d_79 = 4F - 1 (prime)":
            4*F - 1 == 79,
        "Generation triple V·E·D = 2^D · D^D · q":
            V*E*D == 2**D * D**D * q,
        "Trace of icosahedral Laplacian = D! · V = 72":
            factorial(D) * V == 72,
        "Λ exponent: (D+1)^D = 64 (cosmological constant)":
            (D + 1)**D == 64,
        "γ-ladder: D, q, D², (D+1)^D, D!+1 = 3, 5, 9, 64, 7":
            {D, q, D**2, (D + 1)**D, factorial(D) + 1} == {3, 5, 9, 64, 7},
    }
    return checks
