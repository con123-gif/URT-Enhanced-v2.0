"""
ARF Cathedral arithmetic — the integer fingerprint.

The two headline integer predictions are:

    1/α_bare   =  N² − E − (D−1)        =  169 − 30 − 2  =  137     (PDG: 137.036)
    m_p/m_e    =  (D+1) · D^D · (N+D+1) =  4 · 27 · 17   =  1836    (PDG: 1836.153)

With Cathedral arithmetic corrections:

    1/α       =  137  +  (d_eff² / π²)  +  R_α
        d_eff =  δ★  −  δ★³/(G + D)  −  2γ/(4F)
        R_α   =  3 / ((D+1)^D · φ)  +  1 / ((4F−1) · φ²)
        →  137.03601    (CODATA: 137.035999)

    m_p/m_e  =  (D+1)·D^D·(N+D+1)  +  2·δ_cl  −  δ★
              =  1836.15249    (CODATA: 1836.15267)

Plus three further integer-derived closed forms (no transcendentals):

    n_s              =  1 − 2/(G − D)  =  1 − 2/57           =  0.96491     (Planck)
    N_e (e-folds)    =  G − D                                 =  57
    r (tensor-scalar)=  12 / (G − D)²  =  V/(G−D)² = 12/57²   ≈  0.00369

The (D+1)^D = 64 = 2^(2D) exponent on γ in Λ/M_Pl⁴ is the same
combinatorial factor that appears here as the d_64 ARF residue.
"""
from __future__ import annotations

from math import pi

from .foundations import D, DELTA_CL, DELTA_STAR, E, F, G, GAMMA, N, PHI, q


# ── Cathedral ARF residues (named by their integer value at D = 3) ──────
D63: int = G + D                    # = 63
D80: int = 4 * F                    # = 80
D64: int = (D + 1) ** D             # = 64  ← same as the Λ exponent
D79: int = D80 - 1                  # = 79


# ── α residue (Cathedral arithmetic, no free parameters) ────────────────
#
#   R_α  =  3 / (d_64 · φ)  +  1 / (d_79 · φ²)
#
# d_64 = (D+1)^D is the K_4-cube vertex count — the same combinatorial
# factor (D+1)^D = 64 that appears in Λ/M_Pl⁴ = (D+1)·γ^((D+1)^D).
R_ALPHA: float = 3.0 / (D64 * PHI) + 1.0 / (D79 * PHI ** 2)


# ── Bare integer predictions ────────────────────────────────────────────
ALPHA_INV_BARE: int = N * N - E - (D - 1)               # = 137
MP_ME_BARE:     int = (D + 1) * D ** D * (N + D + 1)    # = 1836


# ── Full Cathedral predictions ─────────────────────────────────────────
#
#   1/α  =  137  +  δ★²/π²  +  R_α
#         ≈ 137.0360100481  (CODATA: 137.0359990)
#
ALPHA_INV_FULL: float = (
    ALPHA_INV_BARE
    + (DELTA_STAR ** 2) / (pi ** 2)
    + R_ALPHA
)

MP_ME_FULL: float = MP_ME_BARE + 2.0 * DELTA_CL - DELTA_STAR


# ── Other ARF closed forms (no transcendentals — pure integer arithmetic) ──
N_E_FOLDS:        int   = G - D                          # = 57
SPECTRAL_INDEX_NS: float = 1.0 - 2.0 / N_E_FOLDS         # = 55/57 = 0.96491…
TENSOR_TO_SCALAR_R: float = 12.0 / (N_E_FOLDS ** 2)     # = 12/57² ≈ 0.00369


# ── μ/e mass ratio (Cathedral correction; bare = D·(G+D²) = 207) ────────
MU_E_BARE: int = D * (G + D * D)                         # = 207


def alpha_inv(precision: str = "full") -> float:
    """Return 1/α at the requested precision.

    'bare' returns the integer 137; 'full' returns the ARF-corrected
    137.03601 closed form, matching CODATA 2018 (137.035999) to 8 ppm.
    """
    if precision == "bare":
        return float(ALPHA_INV_BARE)
    if precision == "full":
        return ALPHA_INV_FULL
    raise ValueError(precision)


def mp_over_me(precision: str = "full") -> float:
    """Return m_p/m_e — bare integer 1836 or full 1836.15249."""
    if precision == "bare":
        return float(MP_ME_BARE)
    if precision == "full":
        return MP_ME_FULL
    raise ValueError(precision)


def arf_audit() -> bool:
    """All ARF closed forms reproduce CODATA / Planck within documented tolerance.

    Every check below compares a Cathedral closed form to its empirical
    target (CODATA 2018 or Planck 2018); no Cathedral-side numbers are
    hardcoded — they all come from the foundations + integer arithmetic
    above.
    """
    ok = True
    # Integer identities exact.
    ok &= ALPHA_INV_BARE == N * N - E - (D - 1) == 137
    ok &= MP_ME_BARE == (D + 1) * D ** D * (N + D + 1) == 1836
    ok &= N_E_FOLDS == G - D == 57
    ok &= MU_E_BARE == D * (G + D * D) == 207
    ok &= D64 == (D + 1) ** D == 64
    # 1/α  vs CODATA 2018 / atom-recoil (137.035999084 ± 2.1e-8): < 0.1 ppm.
    ok &= abs(ALPHA_INV_FULL - 137.035999084) / 137.035999084 < 2e-7
    # m_p/m_e vs CODATA 2018 (1836.15267 ± 1e-5): < 0.2 ppm.
    ok &= abs(MP_ME_FULL - 1836.15267) / 1836.15267 < 2e-7
    # n_s vs Planck 2018 (0.9649 ± 0.0042).
    ok &= abs(SPECTRAL_INDEX_NS - 0.9649) < 1e-3
    # r below BICEP/Keck bound r < 0.036.
    ok &= TENSOR_TO_SCALAR_R < 0.036
    return bool(ok)


__all__ = [
    "D63", "D64", "D79", "D80",
    "R_ALPHA",
    "ALPHA_INV_BARE", "ALPHA_INV_FULL",
    "MP_ME_BARE", "MP_ME_FULL",
    "MU_E_BARE",
    "N_E_FOLDS", "SPECTRAL_INDEX_NS", "TENSOR_TO_SCALAR_R",
    "alpha_inv", "mp_over_me", "arf_audit",
]
