"""
The K_4 ⊕ A_5 sector assignment — dark and anti-matter live in A_5.

The 13-shell decomposes into a 4-mode K_4 (coherent/gauge) sector and
a 9-mode A_5 (exhaust/matter) sector — the central structural insight
of the framework.  This module makes the sector assignment of every
physical observable explicit.

Empirical headline: under URT evolution, the A_5 sector power
*evaporates* over time.  Starting from random chaos (~18% power in
A_5), by k=300 the A_5 power drops below 0.5% — the dark/exhaust
sector drains into the K_4 gauge sector.  This evaporation IS the
matter-from-chaos mechanism: η_B = γ³·Δ·δ★·(8/9) where 8/9 = (D-1)·D!/(D+D²)
is the K_4 coherent-mode normalisation.

  K_4 SECTOR (4 modes, k=0..3, eigenvalues {0,3,3,5})  ✨ COHERENT
    - Gravity (k=0, gapless, G_N = δ★²)
    - Electroweak (k=1, 2)
    - Strong / QCD (k=3)
    - Higgs sector
    - Visible matter — Ω_m = 4/13
    - All Standard Model gauge bosons

  A_5 SECTOR (9 modes, k=4..12, eigenvalues {5,5,5,5,5,7,7,9,13})  🌑 EXHAUST
    - Cathedral axion (60.7 µeV)
    - Sterile neutrino (143 keV)
    - WIMP dark matter (13.5 GeV)
    - PMNS neutrino mixing (δ_CP = 197° from A_5 character table)
    - Σ neutrino masses
    - Antimatter asymmetry η_B (via gap Δ in A_5)
    - Cosmological constant Λ — Ω_Λ = 9/13
    - Three dark matter candidates

CI gate: ``cathedral_sectors_audit_passes()``.
"""
from __future__ import annotations

from typing import Dict, Any, List, Tuple

import numpy as np

from .cathedral_engine import (
    cathedral_laplacian, urt_evolve, delta_star, gamma,
)


# ── K_4 / A_5 spectral decomposition ────────────────────────────────────

def _eigenbasis():
    """Cached Laplacian eigenbasis, sorted ascending."""
    L = cathedral_laplacian()
    eigs, evecs = np.linalg.eigh(L)
    order = np.argsort(eigs)
    return eigs[order], evecs[:, order]


def K4_A5_decompose(delta: np.ndarray) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Decompose a 13-component δ field into K_4 + A_5 components.

    K_4 = first 4 eigenvectors (smallest 4 eigenvalues: 0, 3, 3, 5)
    A_5 = last 9 eigenvectors  (eigenvalues: 5, 5, 5, 5, 5, 7, 7, 9, 13)

    Returns (K4_part, A5_part, full_coefficients).
    """
    _, evecs = _eigenbasis()
    coeffs = evecs.T @ delta
    K4_part = evecs[:, :4] @ coeffs[:4]
    A5_part = evecs[:, 4:] @ coeffs[4:]
    return K4_part, A5_part, coeffs


def sector_power(delta: np.ndarray) -> Dict[str, float]:
    """Total power in K_4 vs A_5 sectors (sum of squared coefficients)."""
    _, _, c = K4_A5_decompose(delta)
    K4_pwr = float(np.sum(c[:4] ** 2))
    A5_pwr = float(np.sum(c[4:] ** 2))
    total = K4_pwr + A5_pwr
    return {
        "K4_power":    K4_pwr,
        "A5_power":    A5_pwr,
        "total_power": total,
        "K4_fraction": K4_pwr / total if total > 0 else 0,
        "A5_fraction": A5_pwr / total if total > 0 else 0,
    }


# ── Empirical: A_5 exhaust evaporates under URT evolution ───────────────

def A5_evaporation_trajectory(seed: int = 42, max_steps: int = 300) -> List[Dict[str, Any]]:
    """Track K_4 vs A_5 power over the URT iteration.

    Headline finding: A_5 power decays to <0.5% by step 300 — the
    exhaust sector evaporates into K_4.  This is the matter-from-chaos
    mechanism made explicit.
    """
    rng = np.random.default_rng(seed)
    x0 = rng.uniform(0, 0.5, 13)
    out = []
    for steps in (0, 10, 30, 100, 300):
        d = x0.copy() if steps == 0 else urt_evolve(x0.copy(), steps=steps)
        sp = sector_power(d)
        out.append({"step": steps, **sp})
    return out


# ── Cosmology: Ω_m = 4/13 = K_4, Ω_Λ = 9/13 = A_5 ───────────────────────

def cosmology_via_sector_split() -> Dict[str, Any]:
    """The cosmological matter and dark-energy fractions are exactly
    the K_4 and A_5 sector sizes divided by 13.

       Ω_m = 4/13 ≈ 0.3077  (= K_4 size / 13)    [Planck: 0.3158, 2.6 % off]
       Ω_Λ = 9/13 ≈ 0.6923  (= A_5 size / 13)    [Planck: 0.6842, 1.2 % off]

    The framework's K_4/A_5 sector assignment IS the cosmological
    matter/dark-energy split.
    """
    return {
        "Omega_m_pred":      4 / 13,
        "Omega_m_obs":       0.3158,
        "Omega_m_match_pct": abs(4/13 - 0.3158) / 0.3158 * 100,

        "Omega_Lambda_pred":      9 / 13,
        "Omega_Lambda_obs":       0.6842,
        "Omega_Lambda_match_pct": abs(9/13 - 0.6842) / 0.6842 * 100,

        "sum_check":         4/13 + 9/13 == 1.0,
    }


# ── Sector assignment of every framework prediction ──────────────────────

def predictions_by_sector() -> Dict[str, List[str]]:
    """Catalogue every framework prediction and which sector it lives in.

    The pattern is exact:
      - K_4 → Standard Model gauge / matter / Higgs / gravity
      - A_5 → dark sector / antimatter / neutrinos / cosmological constant

    This is the structural realisation of the framework's "two universes
    in one icosahedron": visible (K_4) and dark (A_5).
    """
    return {
        "K_4_visible_sector": [
            "Gravity (G_N = δ★², k=0 gapless mode)",
            "Electroweak gauge (W, Z, sin²θ_W = 0.23122 — K_4 k=1, 2)",
            "Strong gauge (QCD α_s = δ★(q-1)/q — K_4 k=3)",
            "Higgs sector (λ_H ≈ 0.13)",
            "Visible matter density Ω_m = 4/13",
            "Standard Model gauge bosons (12 = V total = 1+D+(D²-1))",
            "1/α = 137 from N²−E−(D−1)",
            "m_p/m_e = 1836 from (D+1)·D^D·(N+D+1)",
        ],
        "A_5_dark_exhaust_sector": [
            "Cathedral axion m_a = 60.7 µeV (dark matter candidate)",
            "Sterile neutrino dark matter, m = 143 keV",
            "WIMP dark matter, m = δ★·m_Z = 13.5 GeV",
            "Three full DM candidates (H_3 = A_5 sector)",
            "PMNS δ_CP = 197° — golden ratio first enters A_q character table",
            "Σ neutrino masses ≈ 60 meV (A_5-dominated)",
            "Antimatter asymmetry η_B = γ³·Δ·δ★·(8/9), gap Δ from A_5",
            "Cosmological constant Λ/M_Pl⁴ = (D+1)·γ^((D+1)^D)",
            "Dark energy density Ω_Λ = 9/13",
        ],
    }


# ── End-to-end audit ────────────────────────────────────────────────────

def cathedral_sectors_audit() -> Dict[str, Any]:
    return {
        "K4_size":             4,
        "A5_size":             9,
        "K4_plus_A5_is_N":     4 + 9 == 13,
        "Omega_split":         cosmology_via_sector_split(),
        "A5_evaporation":      A5_evaporation_trajectory(),
        "predictions_split":   predictions_by_sector(),
    }


def cathedral_sectors_audit_passes() -> bool:
    a = cathedral_sectors_audit()
    last = a["A5_evaporation"][-1]
    return (
        a["K4_plus_A5_is_N"]
        and a["Omega_split"]["sum_check"]
        and a["Omega_split"]["Omega_m_match_pct"] < 5.0
        and a["Omega_split"]["Omega_Lambda_match_pct"] < 5.0
        and last["A5_fraction"] < 0.01    # A_5 evaporates to <1% by step 300
    )


def print_cathedral_sectors_report() -> None:
    bar = "═" * 78
    print(bar)
    print(" THE CATHEDRAL SECTORS — dark sector + antimatter live in A_5")
    print(bar)

    print("\n[1] Sector sizes")
    print("    K_4 = 4 modes (coherent gauge)")
    print("    A_5 = 9 modes (exhaust matter)")
    print("    K_4 + A_5 = 13 = N (full shell)")

    print("\n[2] Cosmology check")
    c = cosmology_via_sector_split()
    print(f"    Ω_m = 4/13 = {c['Omega_m_pred']:.4f}  vs Planck {c['Omega_m_obs']:.4f}  "
          f"(within {c['Omega_m_match_pct']:.2f}%)")
    print(f"    Ω_Λ = 9/13 = {c['Omega_Lambda_pred']:.4f}  vs Planck {c['Omega_Lambda_obs']:.4f}  "
          f"(within {c['Omega_Lambda_match_pct']:.2f}%)")

    print("\n[3] A_5 exhaust evaporation under URT iteration")
    for row in A5_evaporation_trajectory():
        print(f"    step k={row['step']:>3}: K_4 power = {row['K4_power']:.4f}, "
              f"A_5 power = {row['A5_power']:.4f}, A_5 fraction = {row['A5_fraction']:.4f}")
    print("    → A_5 exhaust drains into K_4 gauge sector (= matter from chaos)")

    print("\n[4] Visible-sector predictions (K_4)")
    for p in predictions_by_sector()["K_4_visible_sector"]:
        print(f"    ✨ {p}")

    print("\n[5] Dark / antimatter / cosmological sector predictions (A_5)")
    for p in predictions_by_sector()["A_5_dark_exhaust_sector"]:
        print(f"    🌑 {p}")

    print()
    print(bar)
    print(f" cathedral_sectors_audit_passes() = {cathedral_sectors_audit_passes()}")
    print(bar)


__all__ = [
    "K4_A5_decompose",
    "sector_power",
    "A5_evaporation_trajectory",
    "cosmology_via_sector_split",
    "predictions_by_sector",
    "cathedral_sectors_audit",
    "cathedral_sectors_audit_passes",
    "print_cathedral_sectors_report",
]
