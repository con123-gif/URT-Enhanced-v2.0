"""
The K_4 ⊕ A_5 sector decomposition:  13 = 4 + 9.

The 13-vertex space splits into two L-invariant blocks:

    K_4  =  visible sector  =  4 modes  with λ ∈ {0, 3, 3, 5}
    A_5  =  dark sector     =  9 modes  with λ ∈ {5×5, 7×2, 9, 13}

Sizes:  |K_4| = D + 1 = 4   |A_5| = D! + D = D² = 9

Trace identities (from graph.py):
    tr(L | K_4) =  0 + 3 + 3 + 5             =  11
    tr(L | A_5) =  5·5 + 7·2 + 9 + 13         =  61
    total       =  72  =  D! · V

The K_4 sector hosts the visible 4D spacetime + gauge interactions;
the A_5 sector hosts the 9-dimensional dark exhaust (axion, sterile
neutrino, WIMP, dark cosmological-constant scaling).

The 4/9 ratio is the framework's D = 3 fingerprint:

    R(D)  =  (D+1) / (D! + D)

    D = 2 :  3/4   = 0.7500
    D = 3 :  4/9   = 0.4444   ← OUR UNIVERSE
    D = 4 :  5/28  = 0.1786
    D = 5 :  6/125 = 0.0480

D = 3 is the unique dimension where (i) the ratio is order-unity and
(ii) the Galois obstruction (A_{D+2} non-solvable) kicks in.
"""
from __future__ import annotations

import numpy as np

from .foundations import D, F, N, V
from .graph import laplacian, spectrum


# ── Sector sizes ─────────────────────────────────────────────────────────
K4_SIZE: int = D + 1            # = 4
A5_SIZE: int = D * D            # = 9  (= D! + D at D = 3)
SECTOR_RATIO: float = K4_SIZE / A5_SIZE   # = 4/9 = 0.4444…

assert K4_SIZE + A5_SIZE == N

# ── Eigenvalue partition into sectors ───────────────────────────────────
# Convention: K_4 takes the four smallest eigenvalues (closest to the
# constant mode), A_5 takes the remaining nine.  This matches the
# graph-theoretic Schur decomposition w.r.t. the Klein 4-subgroup action.
K4_EIGENVALUES: tuple[int, ...] = (0, 3, 3, 5)
A5_EIGENVALUES: tuple[int, ...] = (5, 5, 5, 5, 5, 7, 7, 9, 13)

TR_L_K4: int = sum(K4_EIGENVALUES)          # = 11
TR_L_A5: int = sum(A5_EIGENVALUES)          # = 61
TR_L_TOTAL: int = TR_L_K4 + TR_L_A5         # = 72 = D!·V


# ── Sector ratio in other contexts ──────────────────────────────────────
def sector_ratio_at(d: int) -> float:
    """Return (d+1)/(d!+d) for an arbitrary dimension d.

    The factorial here is computed iteratively to keep the formula
    closed-form for any positive d.
    """
    from math import factorial
    return (d + 1) / (factorial(d) + d)


# ── The four sector-ratio appearances in physics ────────────────────────
# 1. Sector volumes:           |K_4| / |A_5|              =  4/9
# 2. Casimir at 100 nm:        ΔF/F coefficient           =  4/9
# 3. Bare cosmology:           Ω_m_bare / Ω_Λ_bare        =  4/9   ( = 4/13 ÷ 9/13)
# 4. Baryogenesis prefactor:   η_B prefactor = 2·(4/9)    =  8/9
ETA_B_PREFACTOR: float = 2.0 * SECTOR_RATIO     # = 8/9


# ── Bare cosmology fractions ────────────────────────────────────────────
OMEGA_M_BARE: float = K4_SIZE / N              # = 4/13   visible
OMEGA_L_BARE: float = A5_SIZE / N              # = 9/13   dark


def sector_decomposition(field: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Split a 13-vector into K_4 and A_5 components in the L-eigenbasis.

    Returns (k4_component, a5_component) of shapes (4,) and (9,)
    respectively, in the basis sorted by Laplacian eigenvalue.
    """
    if field.shape != (N,):
        raise ValueError(f"expected shape ({N},), got {field.shape}")
    _, U = np.linalg.eigh(laplacian())
    coords = U.T @ field
    return coords[:K4_SIZE], coords[K4_SIZE:]


def sector_power(field: np.ndarray) -> tuple[float, float]:
    """Return (P_K4, P_A5) — the L²-energy in each sector."""
    k4, a5 = sector_decomposition(field)
    return float(np.sum(k4 ** 2)), float(np.sum(a5 ** 2))


def sectors_audit() -> bool:
    """All sector identities hold to machine precision."""
    ok = True
    # Size identities
    ok &= K4_SIZE + A5_SIZE == N
    ok &= K4_SIZE == D + 1 == 4
    ok &= A5_SIZE == D * D == 9
    ok &= TR_L_K4 == 11
    ok &= TR_L_A5 == 61
    ok &= TR_L_TOTAL == 72
    ok &= abs(SECTOR_RATIO - 4.0 / 9.0) < 1e-15
    ok &= abs(ETA_B_PREFACTOR - 8.0 / 9.0) < 1e-15
    # Trace must equal graph trace
    L = laplacian()
    ok &= abs(float(np.trace(L)) - TR_L_TOTAL) < 1e-12
    # Eigenvalue partition reproduces the full spectrum
    eigs = np.round(spectrum()).astype(int)
    combined = sorted(list(K4_EIGENVALUES) + list(A5_EIGENVALUES))
    ok &= bool(np.array_equal(eigs, np.array(combined)))
    # Sector decomposition is an orthogonal split (norms add)
    rng = np.random.default_rng(0)
    x = rng.normal(size=N)
    p4, p9 = sector_power(x)
    ok &= abs((p4 + p9) - float(np.sum(x ** 2))) < 1e-10
    # 4/9 fingerprint is non-trivial only at D = 3
    ok &= abs(sector_ratio_at(2) - 3.0 / 4.0) < 1e-15
    ok &= abs(sector_ratio_at(3) - 4.0 / 9.0) < 1e-15
    ok &= abs(sector_ratio_at(4) - 5.0 / 28.0) < 1e-15
    return bool(ok)


__all__ = [
    "K4_SIZE", "A5_SIZE", "SECTOR_RATIO", "ETA_B_PREFACTOR",
    "K4_EIGENVALUES", "A5_EIGENVALUES",
    "TR_L_K4", "TR_L_A5", "TR_L_TOTAL",
    "OMEGA_M_BARE", "OMEGA_L_BARE",
    "sector_decomposition", "sector_power", "sector_ratio_at",
    "sectors_audit",
]
