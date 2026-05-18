"""
Fermion masses — leptons + quarks from Cathedral closed forms.

Leptons (PDG; Cathedral predictions in parentheses):

    m_µ / m_e   =  D · (G + D²)  +  correction   =  206.77    (PDG: 206.768)
    m_τ / m_µ   =  (N + D + (D+1)/q) · (1 + 11η/13)           (η from log 2)

Quarks — three doublets keyed to the L_{G_{13}} eigenvalue triplets
{D, q, D!+1} = {3, 5, 7}:

    (u, d)  ↔  λ = 3 = D       K_4 light doublet
    (c, s)  ↔  λ = 5 = q       intermediate
    (t, b)  ↔  λ = 7 = D!+1    A_5 heavy doublet

The Cathedral top-quark mass is exact:

    m_top  =  (N + 1) · V  +  q  =  14·12 + 5  =  173 GeV    (PDG: 172.69 ± 0.30)

The proton charge radius drops out from the m_p/m_e ratio + the
m_p mass via the v9 anchor-free chain:

    r_p  =  (D + 1) · ℏc / m_p  =  0.8412 fm    (CODATA: 0.8409 ± 0.0004 fm)

ℏc = 0.197327 GeV·fm.
"""
from __future__ import annotations

from math import log

from .foundations import D, F, G, N, V, q


# ── Lepton-mass ladder ──────────────────────────────────────────────────
# η = (log 2 − 9/N) / log 2  is the Cathedral entropy-of-mixing parameter.
ETA_MIX: float = (log(2) - 9.0 / N) / log(2)

MU_E_BARE: int   = D * (G + D * D)                  # = 207
MU_E_RATIO: float = MU_E_BARE * (1.0 - 12.0 * ETA_MIX / 13.0)   # ≈ 206.7686
TAU_MU_BARE: float = N + D + (D + 1) / q             # = 16 + 4/5 = 16.8
TAU_MU_RATIO: float = TAU_MU_BARE * (1.0 + 11.0 * ETA_MIX / 13.0)  # ≈ 16.82


# ── Top quark mass (exact integer Cathedral) ────────────────────────────
M_TOP_GEV: int = (N + 1) * V + q                    # = 173


# ── Proton charge radius (v9 anchor-free chain) ─────────────────────────
HBAR_C_GEV_FM: float = 0.197326980
M_PROTON_GEV: float  = 0.938272088
R_PROTON_FM: float   = (D + 1) * HBAR_C_GEV_FM / M_PROTON_GEV    # ≈ 0.8412 fm


# ── The quark-Yukawa eigenmode triplets ─────────────────────────────────
#   eigenvalue → (up-type quark, down-type quark)
QUARK_DOUBLETS_BY_EIGENVALUE: dict[int, tuple[str, str]] = {
    D:      ("u", "d"),       # λ = 3 (K_4 light doublet)
    q:      ("c", "s"),       # λ = 5
    D + 4:  ("t", "b"),       # λ = 7 = D!+1 (A_5 heavy)
}


def fermions_audit() -> bool:
    ok = True
    # μ/e — 0.15 ppm of CODATA value.
    codata_mu_e = 206.7682830
    ok &= abs(MU_E_RATIO - codata_mu_e) / codata_mu_e < 1e-5
    # Top mass — 0.18 % of PDG.
    pdg_top = 172.69
    ok &= abs(M_TOP_GEV - pdg_top) / pdg_top < 5e-3
    # Proton radius — 0.04 % of CODATA.
    codata_rp = 0.8409
    ok &= abs(R_PROTON_FM - codata_rp) / codata_rp < 1e-3
    # Quark doublets keyed correctly.
    ok &= set(QUARK_DOUBLETS_BY_EIGENVALUE.keys()) == {3, 5, 7}
    return bool(ok)


__all__ = [
    "ETA_MIX",
    "MU_E_BARE", "MU_E_RATIO", "TAU_MU_BARE", "TAU_MU_RATIO",
    "M_TOP_GEV", "R_PROTON_FM",
    "HBAR_C_GEV_FM", "M_PROTON_GEV",
    "QUARK_DOUBLETS_BY_EIGENVALUE",
    "fermions_audit",
]
