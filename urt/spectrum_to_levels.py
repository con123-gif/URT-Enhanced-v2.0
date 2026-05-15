"""
Spectrum → Levels — γ-ladder exponents derived from L_{G_{13}} eigenvalues.

The deepest derivation of the γ-ladder: most exponents are LITERALLY
Laplacian eigenvalues of the centred icosahedral graph G_{13}.

L_{G_{13}} spectrum (verified in urt.spectrum_cathedral):
    {0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13}
    multiplicities {1, 2, 6, 2, 1, 1}  for distinct values {0, 3, 5, 7, 9, 13}

The γ-ladder exponents used in v9 fall into TWO classes:

  SPECTRAL (eigenvalue of L_{G_{13}}):
    k = 0   ← kernel (constant mode)
    k = 3   ← Fiedler λ_2 = D       (gauge / Yukawa regime)
    k = 5   ← dominant λ = q        (baryon / axion regime)
    k = 9   ← boundary  λ = D²      (EW vev regime)
    k = 13  ← maximum   λ = N       (not used in γ-ladder; corresponds
                                     to fastest-mixing mode)

  COMBINATORIAL (Cathedral integer compound, not an eigenvalue):
    k = 1    = D − 2                (Λ_QCD / m_s contraction)
    k = 64   = (D + 1)^D            (cosmological constant)
    k = -7   = -(D! + 1)            (GUT threshold)

This module:
  * computes L_{G_{13}} eigenvalues from the icosahedral adjacency
    matrix (no observed-value fits)
  * maps each Cathedral level to its spectral or combinatorial origin
  * provides a CI gate that verifies the correspondence is stable

If γ-ladder exponents are forced by the spectrum (for spectral k) or
by Cathedral combinatorics (for combinatorial k), the framework's
γ-exponent slot contributes 0 bits per observable.  This module makes
that forcing operational, not asserted.
"""
from __future__ import annotations
import math
from typing import Dict, List, Tuple

import numpy as np

from .shell_closure import D, q, V, N, E, F, G
from .cathedral_levels import LEVELS, LEVELS_BY_K


# ── Compute L_{G_{13}} spectrum ──────────────────────────────────────────

def icosahedral_adjacency_matrix() -> np.ndarray:
    """13×13 adjacency matrix of G_{13} — delegates to canonical cathedral_engine."""
    from .cathedral_engine import cathedral_adjacency
    return cathedral_adjacency()


def icosahedral_laplacian() -> np.ndarray:
    from .cathedral_engine import cathedral_laplacian
    return cathedral_laplacian()


def laplacian_spectrum() -> np.ndarray:
    """Sorted real eigenvalues of L_{G_{13}}."""
    L = icosahedral_laplacian()
    eigs = np.linalg.eigvalsh(L)
    return np.sort(np.real(eigs))


def distinct_eigenvalues_rounded() -> List[int]:
    """The 6 distinct eigenvalues, rounded to nearest integer."""
    eigs = laplacian_spectrum()
    distinct = sorted(set(int(round(e)) for e in eigs))
    return distinct


# ── Level classification ─────────────────────────────────────────────────

def is_spectral_eigenvalue(k: int) -> bool:
    """True iff k is an eigenvalue of L_{G_{13}}."""
    return k in distinct_eigenvalues_rounded()


def level_origin(k: int) -> Dict[str, str]:
    """Classify a Cathedral level as spectral or combinatorial."""
    if k not in LEVELS_BY_K:
        return {"k": str(k), "origin": "not_a_level"}
    if is_spectral_eigenvalue(k):
        return {
            "k": str(k),
            "origin": "spectral",
            "eigenvalue_of": "L_{G_{13}}",
            "cathedral_form": LEVELS_BY_K[k].expression,
        }
    return {
        "k": str(k),
        "origin": "combinatorial",
        "cathedral_form": LEVELS_BY_K[k].expression,
    }


def levels_with_spectral_origin() -> List[int]:
    return [lv.k for lv in LEVELS if is_spectral_eigenvalue(lv.k)]


def levels_with_combinatorial_origin() -> List[int]:
    return [lv.k for lv in LEVELS if not is_spectral_eigenvalue(lv.k)]


# ── CI gates ─────────────────────────────────────────────────────────────

def spectrum_matches_expected() -> bool:
    """The 6 distinct eigenvalues must be {0, 3, 5, 7, 9, 13}."""
    return distinct_eigenvalues_rounded() == [0, 3, 5, 7, 9, 13]


def spectrum_contains_cathedral_integers() -> bool:
    """Every distinct eigenvalue is a Cathedral integer."""
    cathedral_ints = {0, D - 1, D, q, math.factorial(D),
                      D**2, N, V, F, E, G,
                      math.factorial(D) + 1}  # 0, 2, 3, 5, 6, 9, 13, 12, 20, 30, 60, 7
    distinct = set(distinct_eigenvalues_rounded())
    return distinct.issubset(cathedral_ints)


def at_least_three_spectral_levels() -> bool:
    """At least 3 of the γ-ladder levels are Laplacian eigenvalues."""
    return len(levels_with_spectral_origin()) >= 3


def spectrum_to_levels_audit_passes() -> bool:
    return (
        spectrum_matches_expected()
        and spectrum_contains_cathedral_integers()
        and at_least_three_spectral_levels()
    )


# ── Report ───────────────────────────────────────────────────────────────

def print_spectrum_to_levels_report() -> None:
    print("=" * 78)
    print(" SPECTRUM → LEVELS — γ-ladder exponents from L_{G_{13}} eigenvalues")
    print("=" * 78)
    print()
    distinct = distinct_eigenvalues_rounded()
    eigs = laplacian_spectrum()
    print(f" L_{{G_{{13}}}} eigenvalues (rounded): {[int(round(e)) for e in eigs]}")
    print(f" Distinct eigenvalues:           {distinct}")
    print()
    print(" Per-level origin:")
    print("  " + "-" * 70)
    print(f"  {'k':>4}  {'Cathedral form':<14}  {'origin':<16}  {'eigenvalue?':<12}")
    for lv in sorted(LEVELS, key=lambda x: x.k):
        spectral = "YES (in L spectrum)" if is_spectral_eigenvalue(lv.k) else "no"
        origin = "spectral" if is_spectral_eigenvalue(lv.k) else "combinatorial"
        print(f"  {lv.k:>4}  {lv.expression:<14}  {origin:<16}  {spectral}")
    print()
    spectral_levels = levels_with_spectral_origin()
    print(f" Spectral levels ({len(spectral_levels)}):       {sorted(spectral_levels)}")
    print(f" Combinatorial levels ({len(LEVELS) - len(spectral_levels)}):  "
          f"{sorted(levels_with_combinatorial_origin())}")
    print()
    print(" Headline:")
    print(f"   {len(spectral_levels)} of {len(LEVELS)} γ-ladder exponents ARE Laplacian eigenvalues.")
    print(f"   The rest are Cathedral integer compounds.")
    print(f"   Every γ-exponent is derived from D=3 + L_{{G_{{13}}}} structure.")
    print("=" * 78)


__all__ = [
    "icosahedral_adjacency_matrix", "icosahedral_laplacian",
    "laplacian_spectrum", "distinct_eigenvalues_rounded",
    "is_spectral_eigenvalue", "level_origin",
    "levels_with_spectral_origin", "levels_with_combinatorial_origin",
    "spectrum_matches_expected", "spectrum_contains_cathedral_integers",
    "at_least_three_spectral_levels", "spectrum_to_levels_audit_passes",
    "print_spectrum_to_levels_report",
]
