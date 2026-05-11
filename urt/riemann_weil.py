"""
Weil-positivity Cathedral — finite explicit-formula infrastructure on G_{13}.

The Riemann Hypothesis is equivalent to the **positivity of the Weil
quadratic form** on test functions supported in [-U, U]:

    W[h]  =  pole(h)  +  2 · Γ(h)  −  prime(h)  ≥  0     ∀ admissible h

This module provides the *finite Cathedral discretisation* of this
quadratic form on the 13-shell G_{13}:

    W_Cath[h]  =  pole_disc(h) + 2 · Γ_disc(h) − prime_disc(h) + Cath_ct(h)

where each term is the Cathedral-discretised counterpart of the
classical formula, and Cath_ct is a counterterm built from the
Laplacian eigenstructure of G_{13}.

What this module DOES
---------------------

  * Provides the 13-shell Laplacian-eigenvalue infrastructure (spectrum
    {0, 3, 3, 5×6, 7×2, 9, 13}, trace D!·V = 72) needed for any
    Weil-positivity attack inside the framework.
  * Computes the K₄ / A₅ = 4 / 9 sector split of the spectrum, matching
    the framework's 4 + 9 = 13 sector geometry.
  * Computes a positive-definite Cathedral counterterm
        A_Cath(u) = δ★ · (1 + (u/N)²)
    that is *provably* positive for all u (no fabricated certificate).
  * Evaluates the four-term Weil quadratic across Gaussian, cosine and
    Legendre test bases, reporting each component independently.

What this module does NOT do
----------------------------

  * It does NOT prove RH.  The cross-basis numbers it reports are
    finite-Cathedral approximations on a 13-node graph; RH requires
    positivity for *all* admissible test functions at the *continuum*.
  * It does NOT claim a "frozen RKHS certificate" — the upload's
    `cathedral_riemann_*` files attempted such a certificate with
    hand-tuned polynomial coefficients, but those coefficients are not
    verifiably positive-definite when actually evaluated, so they are
    not imported here.

Status
------

Infrastructure module.  Replaces previous gap noted in `urt.prime_spectral`
(which only matched the first three Laplacian eigenvalues to the first
three Riemann zeros to 0.001-0.7 %; it had no Weil-positivity
machinery at all).

References
----------
Weil, "Sur les 'formules explicites' de la théorie des nombres
premiers" (1952).
Upload `cathedral_riemann_autonomous_solver_stepper.py` for the
heuristic RH-attack pipeline — preserved for inspection, not imported.
"""
from __future__ import annotations

from math import pi, sqrt, log, exp
from typing import Callable, List, Dict
import numpy as np

# ── Cathedral integers ─────────────────────────────────────────────────────
D, N, V, E, F, q, G = 3, 13, 12, 30, 20, 5, 60
PHI = (1 + sqrt(5)) / 2
GAMMA = 1 / D ** 4
DELTA_STAR = (1 - GAMMA) * pi / (N * PHI)


# ── 13-shell URT prime-scattering kernel ──────────────────────────────────

def cathedral_laplacian() -> np.ndarray:
    """G_{13} Laplacian.  Spectrum {0, 3, 3, 5×6, 7×2, 9, 13}, tr = 72 = D!·V."""
    from .shell_closure import _L
    return _L.copy()


def prime_kernel_eigenvalues() -> np.ndarray:
    """Sorted Cathedral prime-kernel eigenvalues."""
    return np.sort(np.linalg.eigvalsh(cathedral_laplacian()))


def K4_A5_split(eigvals: np.ndarray = None) -> Dict[str, np.ndarray]:
    """
    K₄ / A₅ sector split of the 13 Laplacian eigenvalues.

    Lowest 4 (including zero mode) → K₄ "coherent" sector
    Remaining 9                    → A₅ "exhaust" sector
    Matches the framework's 4 + 9 = 13 split everywhere else.
    """
    if eigvals is None:
        eigvals = prime_kernel_eigenvalues()
    return {
        "K4_eigvals": eigvals[:4],
        "A5_eigvals": eigvals[4:],
    }


def cathedral_laplacian_trace() -> float:
    """tr(L_{13}) = 72 = D!·V — used as positivity normaliser."""
    return float(cathedral_laplacian().trace())


# ── Cathedral counterterm: provably-positive A_Cath ───────────────────────

def A_cath(u: float) -> float:
    """
    A_Cath(u) = δ★ · (1 + (u/N)²).

    Manifestly positive for all real u, since δ★ > 0 and (u/N)² ≥ 0.
    This replaces the upload's fabricated 7-coefficient polynomial
    (which was numerically negative-definite at moderate u) with a
    genuine positive-definite counterterm whose closed form is in
    {δ★, N} only.
    """
    return DELTA_STAR * (1 + (u / N) ** 2)


# ── Finite Weil quadratic form ────────────────────────────────────────────

def weil_pole_term(h: Callable[[float], float]) -> float:
    """Pole-side contribution at the trivial zero (λ = 0 of L_{13})."""
    return 2 * h(0.0)


def weil_gamma_term(h: Callable[[float], float], n_nodes: int = 64) -> float:
    """
    Γ-side discretised via the trace-formula contribution from non-zero
    eigenvalues of L_{13}.  Sum over the 12 non-zero modes weighted by
    h(√λ) / √λ.
    """
    eigvals = prime_kernel_eigenvalues()
    s = 0.0
    for lam in eigvals[1:]:        # skip the zero mode
        if lam > 0:
            s += h(sqrt(lam)) / sqrt(lam)
    return 2 * s


def weil_prime_term(h: Callable[[float], float],
                    primes: List[int] = None,
                    K_max: int = 3) -> float:
    """Prime-side: Σ_p Σ_{k=1}^K log(p)/p^(k/2) · h(k·log p)."""
    if primes is None:
        primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    s = 0.0
    for p in primes:
        lp = log(p)
        for k in range(1, K_max + 1):
            s += lp / sqrt(p ** k) * h(k * lp)
    return s


def cathedral_counterterm(h: Callable[[float], float],
                          U: float = 9.0, n_nodes: int = 200) -> float:
    """
    Cathedral counterterm 2π · ∫_{-U}^U A_Cath(u) · h(u)² du.

    Since A_Cath > 0 everywhere and h² ≥ 0, this contribution is
    always ≥ 0.  Vanishes only if h ≡ 0.
    """
    us = np.linspace(-U, U, n_nodes)
    du = us[1] - us[0]
    return 2 * pi * du * sum(A_cath(float(u)) * h(float(u)) ** 2 for u in us)


def weil_quadratic(h: Callable[[float], float],
                   U: float = 9.0) -> Dict[str, float]:
    """
    Full Cathedral Weil quadratic form.

    Returns the four components plus the total.  Positivity of
    `W_Cath_total` for every admissible h is the *necessary* finite
    Cathedral check (not sufficient for RH).
    """
    P  = weil_pole_term(h)
    Gm = weil_gamma_term(h)
    Pr = weil_prime_term(h)
    Ac = cathedral_counterterm(h, U=U)
    return {
        "pole":          P,
        "gamma":         Gm,
        "prime":         Pr,
        "cathedral":     Ac,
        "W_Cath_total":  P + Gm - Pr + Ac,
    }


# ── Cross-basis stress test ───────────────────────────────────────────────

def _gaussian_h(width: float = 2.0) -> Callable[[float], float]:
    return lambda u: exp(-(u / width) ** 2)


def _cosine_h(omega: float = 1.0) -> Callable[[float], float]:
    def h(u):
        return float(np.cos(omega * u)) if abs(u) < pi / omega else 0.0
    return h


def _legendre_h(n: int = 4) -> Callable[[float], float]:
    from numpy.polynomial.legendre import legval
    c = np.zeros(n + 1)
    c[n] = 1.0
    def h(u):
        return float(legval(u / 9.0, c)) if abs(u) <= 9.0 else 0.0
    return h


def cross_basis_certificate() -> List[Dict[str, float]]:
    """Cathedral Weil quadratic across three function bases — each row finite."""
    rows: List[Dict[str, float]] = []
    for name, h in (
        ("gaussian_w=2.0", _gaussian_h(2.0)),
        ("gaussian_w=4.0", _gaussian_h(4.0)),
        ("cosine_ω=1.0",   _cosine_h(1.0)),
        ("cosine_ω=0.5",   _cosine_h(0.5)),
        ("legendre_n=4",   _legendre_h(4)),
    ):
        row = {"basis": name}
        row.update(weil_quadratic(h))
        rows.append(row)
    return rows


def riemann_weil_audit_passes() -> bool:
    """
    CI gate (infrastructure only):

      * Cathedral Laplacian spectrum is {0, 3, 3, 5×6, 7×2, 9, 13}
      * tr(L) = D!·V = 72 (Cathedral identity)
      * K₄ / A₅ sector decomposition is 4 + 9 = 13
      * A_Cath is positive at every integer u ∈ [-15, 15]
      * Every Weil-quadratic row is finite and the Cathedral counterterm
        contribution is non-negative

    Does NOT verify the total W_Cath ≥ 0 — that is RH-level and not
    provable from finite infrastructure alone.
    """
    spec = prime_kernel_eigenvalues()
    spec_expected = [0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13]
    if not np.allclose(spec, spec_expected, atol=1e-9):
        return False
    if abs(cathedral_laplacian_trace() - D * 2 * V) > 1e-9:   # D!·V = 6·12 = 72
        return False
    split = K4_A5_split(spec)
    if split["K4_eigvals"].size != 4 or split["A5_eigvals"].size != 9:
        return False
    for u in range(-15, 16):
        if A_cath(float(u)) <= 0:
            return False
    for row in cross_basis_certificate():
        if not np.isfinite(row["W_Cath_total"]):
            return False
        if row["cathedral"] < -1e-9:
            return False
    return True


# ── Report ────────────────────────────────────────────────────────────────

def print_riemann_weil_report():
    print("=" * 76)
    print("Cathedral Weil-Positivity Quadratic — finite explicit formula on G_{13}")
    spec = prime_kernel_eigenvalues()
    print(f"  spectrum  : {spec.round(0).astype(int).tolist()}")
    print(f"  tr(L)     : {cathedral_laplacian_trace():.0f}   "
          f"(should be D!·V = {6*12})")
    s = K4_A5_split(spec)
    print(f"  K₄ sector : {s['K4_eigvals'].round(0).astype(int).tolist()}")
    print(f"  A₅ sector : {s['A5_eigvals'].round(0).astype(int).tolist()}")
    print(f"  A_Cath(u) = δ★ · (1 + (u/N)²)  — manifestly positive")
    print("=" * 76)
    print(f"  {'basis':<20} {'pole':>10} {'gamma':>10} {'prime':>10} "
          f"{'A_cath':>10} {'W_total':>10}")
    print("-" * 76)
    for row in cross_basis_certificate():
        print(f"  {row['basis']:<20} {row['pole']:>10.3f} "
              f"{row['gamma']:>10.3f} {row['prime']:>10.3f} "
              f"{row['cathedral']:>10.3f} {row['W_Cath_total']:>10.3f}")
    print("=" * 76)
    print(f"  audit passes: {riemann_weil_audit_passes()}")
    print("=" * 76)


if __name__ == "__main__":
    print_riemann_weil_report()
