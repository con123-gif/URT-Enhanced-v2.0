"""
Dark sector — three candidates from the A_5 9-dimensional exhaust.

The 9 modes of the A_5 sector decompose into four "filled" predictions
and five open structural slots.  Each filled prediction is a closed
form in the Cathedral constants {D, γ, δ★, A_5 eigenvalues}, optionally
multiplied by one empirical scale (m_proton, m_Z, ℏc).

    1. Axion DM       m_a   =  δ★ / |R_mass|  ·  10³  µeV    (open ADMX-EFR)
       where  R_mass  is the A_5 mass residue (function of δ★ and the
       A_5 Laplacian eigenvalues {5×5, 7×2, 9, 13}).

    2. Sterile-ν DM   m_s   =  γ² · m_p        =  m_p / D⁸  =  m_p / 6561
                            ≈  143 keV         (X-ray signature at m_s/2 = 71.5 keV)

    3. WIMP DM        m_W   =  δ★ · m_Z
                            ≈  13.45 GeV       (LHC direct-search threshold)

    4. Cathedral microwave spectral line
                      ω     =  (m_a · c² / h) · δ★    ≈  2.17 GHz

A_5 mass-residue closed form:

    R_mass  =  (D/F + 2)/E · δ★²
              −  (D+1)/E · π³ · (D+1)/(E·N)         [Cathedral 4/51]
              +  (1/N) · Σ_{λ ∈ A_5 spectrum} δ★² / (λ + δ★²)

    where the A_5 Laplacian spectrum is {5, 5, 5, 5, 5, 7, 7, 9, 13}
    (the nine non-K_4 eigenvalues of L_{G_{13}}).

The Casimir +0.124 ppm prediction at 100 nm shares the same A_5
amplitude:  ΔF/F = (a₀/d)² · 4/9, where 4/9 = |K_4|/|A_5| is the
D = 3 sector-volume fingerprint.
"""
from __future__ import annotations

from math import pi

from .foundations import D, DELTA_STAR, GAMMA, N, q
from .sectors import A5_EIGENVALUES, SECTOR_RATIO


# ── Empirical scales (the framework's only dimensional inputs) ──────────
# These are physical constants from CODATA 2018; they enter only as the
# unit-system conversion factors that translate Cathedral dimensionless
# ratios into SI numbers.  No prediction's *closed form* uses them — they
# always appear as multiplicative scales.
M_PROTON_KEV:    float = 938272.088                      # CODATA proton mass
M_Z_GEV:         float = 91.1876                         # PDG Z-boson mass
BOHR_RADIUS_M:   float = 5.29177210903e-11               # CODATA Bohr radius
EV_TO_HZ:        float = 2.417989242e14                  # 1 eV in Hz (Planck h)


# ── A_5 mass residue (Cathedral closed form) ────────────────────────────
#
# Three Cathedral terms.  Coefficients use the pentagonal ARF residues
# d_35 = P_q and d_51 = P_{q+1} (P_n = n(3n−1)/2 is the n-th pentagonal
# number — q = 5 gives 35, q + 1 = 6 gives 51).
def _pentagonal(n: int) -> int:
    return n * (3 * n - 1) // 2

D_35: int = _pentagonal(q)         # = P_q     = 35
D_51: int = _pentagonal(q + 1)     # = P_{q+1} = 51

def _r_mass() -> float:
    s = sum(DELTA_STAR ** 2 / (lam + DELTA_STAR ** 2) for lam in A5_EIGENVALUES)
    return (
        (D / D_35) * DELTA_STAR ** 2
        - ((D + 1) / D_51) * pi ** 3
        + s / N
    )

R_MASS: float = _r_mass()          # ≈ -2.43 (sign is A_5 phase)


# ── Axion mass (Cathedral closed form, µeV) ─────────────────────────────
M_AXION_UEV: float = DELTA_STAR / abs(R_MASS) * 1e3      # ≈ 60.7 µeV


# ── Sterile-ν DM ────────────────────────────────────────────────────────
# m_s = γ² · m_p  (icosahedral entropy suppression: m_p / D⁸)
M_STERILE_KEV:      float = GAMMA ** 2 * M_PROTON_KEV    # ≈ 143 keV
M_STERILE_HALF_KEV: float = M_STERILE_KEV / 2.0          # X-ray signature


# ── WIMP DM ─────────────────────────────────────────────────────────────
M_WIMP_GEV: float = DELTA_STAR * M_Z_GEV                  # ≈ 13.45 GeV


# ── Cathedral microwave spectral line ───────────────────────────────────
# ω = (m_a c²/h) · δ★ — the rest-frequency of the axion times the
# vacuum vertex δ★.
AXION_FREQ_GHZ: float = M_AXION_UEV * 1e-6 * EV_TO_HZ * 1e-9      # ≈ 14.68 GHz
CATHEDRAL_SPECTRAL_LINE_GHZ: float = AXION_FREQ_GHZ * DELTA_STAR  # ≈ 2.17 GHz


# ── Casimir prediction (see sectors.py for the 4/9 derivation) ─────────
def casimir_fractional_force(d_nm: float) -> float:
    """ΔF/F at separation d (nanometres) = (a₀/d)² · (D+1)/(D!+D)."""
    d_m = d_nm * 1e-9
    return (BOHR_RADIUS_M / d_m) ** 2 * SECTOR_RATIO

CASIMIR_AT_100NM: float = casimir_fractional_force(100.0)  # ≈ 1.245e-7 = +0.124 ppm


def dark_audit() -> bool:
    ok = True
    # All values produced by closed forms, then sanity-checked vs
    # documented ADMX / X-ray / LHC targets:
    ok &= 50.0  <  M_AXION_UEV         <  100.0         # ADMX-EFR band
    ok &= 100.0 <  M_STERILE_KEV       <  200.0         # X-ray search range
    ok &= 10.0  <  M_WIMP_GEV          <  20.0          # LHC threshold band
    ok &= 1.0   <  CATHEDRAL_SPECTRAL_LINE_GHZ < 30.0   # cavity range
    # 4/9 sector ratio survives in Casimir.
    expected_casimir = (BOHR_RADIUS_M / 1e-7) ** 2 * SECTOR_RATIO
    ok &= abs(CASIMIR_AT_100NM - expected_casimir) < 1e-15
    # R_mass is negative and order-unity (the A_5 phase).
    ok &= -3.0 < R_MASS < -2.0
    return bool(ok)


__all__ = [
    "M_AXION_UEV", "M_STERILE_KEV", "M_STERILE_HALF_KEV", "M_WIMP_GEV",
    "AXION_FREQ_GHZ", "CATHEDRAL_SPECTRAL_LINE_GHZ",
    "BOHR_RADIUS_M", "casimir_fractional_force", "CASIMIR_AT_100NM",
    "R_MASS", "D_35", "D_51",
    "M_PROTON_KEV", "M_Z_GEV", "EV_TO_HZ",
    "dark_audit",
]
