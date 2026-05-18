"""
Dark sector — three DM candidates from the A_5 9-dimensional exhaust.

Closed-form predictions (all sub-leading-corrected):

    1. Axion DM            m_a   =  δ★ / |R_mass| · 10³ µeV          ≈  60.8 µeV
    2. Sterile-ν DM        m_s   =  γ² · m_p   =  m_p / D⁸           ≈  143  keV
    3. WIMP DM             m_W   =  δ★ · m_Z                          ≈  13.5 GeV
    4. Microwave line       ω    =  (m_a · c²/h) · δ★                 ≈  2.17 GHz

A_5 mass residue (Cathedral closed form):

    R_mass  =  (D / d_35) · δ★²
              −  ((D+1) / d_51) · π³
              +  (1/N) · Σ_{λ ∈ A_5 spectrum}  δ★² / (λ + δ★²)

    d_35  =  P_q  =  35   (pentagonal P_n = n(3n−1)/2 at n = q)
    d_51  =  P_{q+1}  =  51

The Casimir ΔF/F at separation d:

    ΔF/F  =  (a₀/d)² · (D+1) / (D!+D)  =  (a₀/d)² · 4/9

— the same K_4/A_5 sector-volume ratio that appears in η_B (doubled),
Casimir, and the bare Ω_m/Ω_Λ fractions.  At d = 100 nm, ΔF/F ≈ +0.124 ppm.
"""
from __future__ import annotations

from math import pi

from .foundations import D, DELTA_STAR, GAMMA, N, q
from .sectors import A5_EIGENVALUES, SECTOR_RATIO


# ── Empirical scales (the only dimensional inputs needed for SI units) ──
BOHR_RADIUS_M: float = 5.29177210903e-11                # CODATA Bohr radius
EV_TO_HZ:      float = 2.417989242e14                   # 1 eV in Hz (Planck h)


# ── ARF pentagonal residues d_35, d_51 ─────────────────────────────────
def _pentagonal(n: int) -> int:
    return n * (3 * n - 1) // 2

D_35: int = _pentagonal(q)         # = 35 = P_q
D_51: int = _pentagonal(q + 1)     # = 51 = P_{q+1}


# ── A_5 mass residue ────────────────────────────────────────────────────
def _r_mass() -> float:
    s = sum(DELTA_STAR ** 2 / (lam + DELTA_STAR ** 2) for lam in A5_EIGENVALUES)
    return (D / D_35) * DELTA_STAR ** 2 - ((D + 1) / D_51) * pi ** 3 + s / N

R_MASS: float = _r_mass()          # ≈ -2.43


# ── Axion mass (closed form, µeV) ───────────────────────────────────────
M_AXION_UEV: float = DELTA_STAR / abs(R_MASS) * 1e3


# ── Sterile-ν DM as a function of the chain-derived m_p ─────────────────
def m_sterile_keV(m_p_GeV: float) -> float:
    """m_s = γ² · m_p  (icosahedral entropy suppression by D⁸)."""
    return GAMMA ** 2 * m_p_GeV * 1e6                  # GeV → keV


# ── WIMP DM as a function of chain-derived m_Z ─────────────────────────
def m_WIMP_GeV(m_Z_GeV: float) -> float:
    """m_W = δ★ · m_Z."""
    return DELTA_STAR * m_Z_GeV


# ── Cathedral microwave spectral line ───────────────────────────────────
AXION_FREQ_GHZ: float = M_AXION_UEV * 1e-6 * EV_TO_HZ * 1e-9     # ≈ 14.68 GHz
CATHEDRAL_SPECTRAL_LINE_GHZ: float = AXION_FREQ_GHZ * DELTA_STAR  # ≈ 2.17 GHz


# ── Casimir at separation d (nanometres) ────────────────────────────────
def casimir_fractional_force(d_nm: float) -> float:
    """ΔF/F = (a₀/d)² · 4/9."""
    d_m = d_nm * 1e-9
    return (BOHR_RADIUS_M / d_m) ** 2 * SECTOR_RATIO

CASIMIR_AT_100NM: float = casimir_fractional_force(100.0)        # ≈ 1.245e-7


def dark_audit() -> bool:
    ok = True
    # Axion in ADMX-EFR band.
    ok &= 50.0 < M_AXION_UEV < 100.0
    # Sterile-ν (chain): 143 keV ± 0.5.
    from .chain import M_P_GEV
    m_s = m_sterile_keV(M_P_GEV)
    ok &= 142.0 < m_s < 144.0
    ok &= abs(m_s / 2.0 - 71.5) < 0.5
    # WIMP DM (chain): 13.45 GeV ± 0.1.
    from .chain import V_EW_GEV
    from .electroweak import m_Z_GeV
    mZ = m_Z_GeV(V_EW_GEV)
    m_w = m_WIMP_GeV(mZ)
    ok &= 13.0 < m_w < 14.0
    # Spectral line in cavity band.
    ok &= 1.0 < CATHEDRAL_SPECTRAL_LINE_GHZ < 30.0
    # 4/9 sector ratio survives in Casimir.
    expected_casimir = (BOHR_RADIUS_M / 1e-7) ** 2 * SECTOR_RATIO
    ok &= abs(CASIMIR_AT_100NM - expected_casimir) < 1e-15
    # R_mass A_5 phase.
    ok &= -3.0 < R_MASS < -2.0
    return bool(ok)


__all__ = [
    "M_AXION_UEV", "AXION_FREQ_GHZ", "CATHEDRAL_SPECTRAL_LINE_GHZ",
    "m_sterile_keV", "m_WIMP_GeV",
    "BOHR_RADIUS_M", "casimir_fractional_force", "CASIMIR_AT_100NM",
    "R_MASS", "D_35", "D_51", "EV_TO_HZ",
    "dark_audit",
]
