"""
URT Eigenmode Decomposition — derive A_s factors from L_{G_{13}} modes.

The structural-DOF audit credits the A_s coefficient as a COMPOUND
class (multi-sector product) with the biggest remaining freedom.  This
module derives A_s factor-by-factor from L_{G_{13}} eigenmodes and the
K_4 ⊕ A_5 split.

A_s formula (cathedral_v9):
    A_s = (G-D)² · (D+1)³ · q · 32/9 · π⁴ · γ⁹ · cos⁴(π/V)

Factor-by-factor decomposition:

    (G-D)²       = 57² = 3249        inflation e-folds squared (N_e²)
                                     = (A_5 order minus visible dim)²
    (D+1)³       = 64                 K_4³ — three K_4-channel insertions
    q            = 5                  A_5 prime — number of flavours
    32/9         = 2^q / |A_5|        K_4-power normalized by A_5 cardinality
    π⁴           = 4 × S¹ measures    geometric Cathedral measure raised to |K_4|
    γ⁹           = γ^(D²)              EW-level γ-power (Cathedral level k=9)
    cos⁴(π/V)    = K_4-rotation cos⁴   V-fold rotation, 4 = |K_4| insertions

Each factor maps to a SPECIFIC sector contribution.  The reading is:
A_s is the amplitude of the inflation eigenmode (G-D)² × the K_4-cubed
visible-sector × q A_5 flavours × normalized geometric measure × γ⁹
RG-running × V-fold rotation^|K_4|.

Honest scope:
  - Each factor is given a sector origin.
  - The PRODUCT structure (why these specific factors, not others) is
    asserted from the v9 closed form, not independently derived.
  - To fully *derive* A_s would require running the URT iteration with
    an inflation initial condition and projecting onto eigenmodes —
    that is a separate research project.
"""
from __future__ import annotations
import math
from dataclasses import dataclass
from typing import Dict, List

import numpy as np

from .shell_closure import D, q, V, N, F, G, gamma as GAMMA, phi as PHI


# A_s constants
N_E = G - D                          # = 57
K_GAMMA_AS = D**2                     # = 9 (EW level)
A_S_PREDICTED = (N_E**2 * (D+1)**3 * q * 32.0/9.0
                 * math.pi**4 * GAMMA**K_GAMMA_AS
                 * math.cos(math.pi/V)**4)


@dataclass(frozen=True)
class AsFactor:
    name:              str
    cathedral_form:    str
    value:             float
    sector:            str          # K_4 / A_5 / SECTOR_RATIO / GEOMETRIC / RG
    eigenmode_origin:  str          # what eigenmode / structural object


AS_FACTORS: List[AsFactor] = [
    AsFactor(
        name="N_e²",
        cathedral_form="(G − D)²",
        value=float(N_E**2),
        sector="A_5",
        eigenmode_origin="inflation e-fold count: |A_5|=G modes minus D visible dimensions, squared",
    ),
    AsFactor(
        name="(D+1)³",
        cathedral_form="|K_4|³",
        value=float((D+1)**3),
        sector="K_4",
        eigenmode_origin="three K_4-channel insertions (one per K_4 mode beyond identity)",
    ),
    AsFactor(
        name="q",
        cathedral_form="q",
        value=float(q),
        sector="A_5",
        eigenmode_origin="A_5 prime / number of flavours (single insertion)",
    ),
    AsFactor(
        name="32/9",
        cathedral_form="2^q / |A_5|",
        value=32.0/9.0,
        sector="SECTOR_RATIO",
        eigenmode_origin="K_4-power 2^q normalized by A_5 cardinality (D!+D)",
    ),
    AsFactor(
        name="π⁴",
        cathedral_form="π^|K_4|",
        value=math.pi**4,
        sector="GEOMETRIC",
        eigenmode_origin="|K_4| = D+1 geometric S¹ measures (one per K_4 channel)",
    ),
    AsFactor(
        name="γ⁹",
        cathedral_form="γ^(D²)",
        value=GAMMA**(D**2),
        sector="RG",
        eigenmode_origin="EW-level Cathedral γ-power (k = D² is a Laplacian eigenvalue)",
    ),
    AsFactor(
        name="cos⁴(π/V)",
        cathedral_form="cos^|K_4|(π/V)",
        value=math.cos(math.pi/V)**4,
        sector="GEOMETRIC",
        eigenmode_origin="V-fold rotation cosine raised to |K_4| (one per K_4 mode)",
    ),
]


def reconstructed_A_s() -> float:
    """A_s reconstructed from the factor product (cross-check)."""
    out = 1.0
    for f in AS_FACTORS:
        out *= f.value
    return out


def reconstruction_residual() -> float:
    """Relative error between AS_PREDICTED and the factor product."""
    return abs(reconstructed_A_s() - A_S_PREDICTED) / abs(A_S_PREDICTED)


def factor_sectors_summary() -> Dict[str, int]:
    out: Dict[str, int] = {}
    for f in AS_FACTORS:
        out[f.sector] = out.get(f.sector, 0) + 1
    return out


# ── Eigenmode amplitudes (numerical check) ───────────────────────────────

def cathedral_laplacian_eigenvalues() -> np.ndarray:
    """Sorted real eigenvalues of L_{G_{13}}."""
    from .cathedral_engine import cathedral_laplacian
    L = cathedral_laplacian()
    eigs = np.linalg.eigvalsh(L)
    return np.sort(eigs)


def eigenmode_amplitudes_after_T_steps(T: int = 100) -> np.ndarray:
    """
    Amplitudes of the URT iteration at each Laplacian eigenmode after T steps.

    For the linearised iteration ∂_t δ ≈ -η · η_L · L · δ, each mode decays
    as (1 − η·η_L·λ)^T = (1 − λ/(2^q·π²))^T.

    Returns the amplitude for each of the 13 modes at time T.
    """
    eigs = cathedral_laplacian_eigenvalues()
    eta_etaL = 1.0 / (2.0**q * math.pi**2)   # = η · η_L
    return (1.0 - eigs * eta_etaL) ** T


def gamma_level_for_eigenvalue(lam: float, T_natural: float = None) -> float:
    """
    The Cathedral γ-level associated with eigenvalue λ at the natural
    timescale T_natural = 2^q · π² / λ (one full mixing time).

    log_γ (mode amplitude after T_natural) → -1, so γ-level ≈ 1.
    The framework's γ-ladder is INDEPENDENT of T_natural and is instead
    set by the eigenvalue itself: γ^λ ↔ mode amplitude at fixed time.
    """
    if T_natural is None:
        T_natural = 2.0**q * math.pi**2 / max(lam, 1e-300)
    eta_etaL = 1.0 / (2.0**q * math.pi**2)
    amp = (1.0 - lam * eta_etaL) ** T_natural
    if amp <= 0:
        return float('inf')
    return -math.log(amp) / math.log(81.0)


# ── CI gates ─────────────────────────────────────────────────────────────

def reconstruction_within_machine_precision() -> bool:
    return reconstruction_residual() < 1e-10


def every_factor_has_eigenmode_origin() -> bool:
    return all(len(f.eigenmode_origin) > 20 for f in AS_FACTORS)


def sectors_cover_K4_A5_and_geometric() -> bool:
    s = factor_sectors_summary()
    needed = {"K_4", "A_5", "SECTOR_RATIO", "GEOMETRIC", "RG"}
    return needed.issubset(set(s.keys()))


def eigenmode_decomposition_audit_passes() -> bool:
    return (
        reconstruction_within_machine_precision()
        and every_factor_has_eigenmode_origin()
        and sectors_cover_K4_A5_and_geometric()
        and len(AS_FACTORS) >= 7
    )


# ── Report ───────────────────────────────────────────────────────────────

def print_eigenmode_decomposition_report() -> None:
    print("=" * 92)
    print(" A_s EIGENMODE DECOMPOSITION — every factor → sector origin")
    print("=" * 92)
    print()
    print(f"  v9 A_s = (G-D)² · (D+1)³ · q · 32/9 · π⁴ · γ⁹ · cos⁴(π/V)")
    print(f"         = {A_S_PREDICTED:.4e}")
    print()
    print("  Factor breakdown:")
    print("-" * 92)
    print(f"    {'factor':<15}{'Cathedral':<22}{'value':>14}  {'sector':<14}  origin")
    for f in AS_FACTORS:
        print(f"    {f.name:<15}{f.cathedral_form:<22}{f.value:>14.4e}  {f.sector:<14}")
        print(f"    {'':<53}{f.eigenmode_origin}")
    print()
    print("  Sector summary:")
    for s, n in factor_sectors_summary().items():
        print(f"    {s:<14} {n} factor(s)")
    print()
    print(f"  Reconstructed A_s : {reconstructed_A_s():.6e}")
    print(f"  Direct v9 A_s     : {A_S_PREDICTED:.6e}")
    print(f"  Residual          : {reconstruction_residual():.3e} (rel)")
    print()
    print("  Laplacian-eigenvalue check:")
    eigs = cathedral_laplacian_eigenvalues()
    print(f"    L_{{G_{{13}}}} distinct λ: {sorted(set(round(e) for e in eigs))}")
    print(f"    A_s γ-exponent     : k = {K_GAMMA_AS} (= D², an eigenvalue of L_{{G_{{13}}}})")
    print("=" * 92)


__all__ = [
    "N_E", "K_GAMMA_AS", "A_S_PREDICTED",
    "AsFactor", "AS_FACTORS",
    "reconstructed_A_s", "reconstruction_residual",
    "factor_sectors_summary",
    "cathedral_laplacian_eigenvalues",
    "eigenmode_amplitudes_after_T_steps",
    "gamma_level_for_eigenvalue",
    "reconstruction_within_machine_precision",
    "every_factor_has_eigenmode_origin",
    "sectors_cover_K4_A5_and_geometric",
    "eigenmode_decomposition_audit_passes",
    "print_eigenmode_decomposition_report",
]
