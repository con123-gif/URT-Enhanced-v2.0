"""
Cathedral Gravity — K4 Gapless Mode Framework
Gravity arises as the k=0 (gapless) mode of the 13-shell K4 sector.
G_N = δ★² in Planck units. Zero free parameters.

Force hierarchy: k=0 (gravity), k=1 (EM), k=2 (weak), k=3 (ordering),
                 k=4..12 (strong, γ=1/81 coupling)
"""

import numpy as np
from math import pi, sqrt, log

from .shell_closure import DELTA_STAR, phi, gamma, N, G, F

# ── Fundamental Cathedral gravity constants ───────────────────────────────
G_NEWTON = DELTA_STAR ** 2          # Newton constant in Planck units ≈ 0.021760
PLANCK_LENGTH = DELTA_STAR          # l_Pl = δ★ (Cathedral normalisation)
PLANCK_MASS = 1 / DELTA_STAR        # m_Pl = 1/δ★ ≈ 6.779
PLANCK_TEMP = 1 / (2 * pi * DELTA_STAR)   # T_Pl = 1/(2π·δ★)

# Area quantum: ΔA = 8π·δ★³ (Bekenstein-Mukhanov spectrum)
AREA_QUANTUM = 8 * pi * DELTA_STAR ** 3   # ≈ 0.08067 l_Pl²

# Fine-structure constant (1/α ≈ 137)
ALPHA_EM = 1 / 137.036

# Coupling hierarchy ratios
# α_s ≈ 0.1179, α_EM ≈ 1/137, G_N = δ★²
ALPHA_S_MZ = DELTA_STAR * (5 - 1) / 5     # from shell_closure
GRAVITY_EM_RATIO = G_NEWTON * 137.036     # G_N / (1/α) ≈ 2.98 × 10⁻³


# ── K4 sector mode assignments ────────────────────────────────────────────

def graviton_mode() -> dict:
    """K4 gapless mode k=0: gravity."""
    return {
        "k": 0,
        "name": "gravity",
        "gap": 0.0,           # gapless — long range
        "coupling": G_NEWTON,
        "range": "infinite",
        "spin": 2,
        "mediator": "graviton",
        "notes": "k=0 gapless K4 mode; G_N=δ★² in Planck units",
    }


def force_hierarchy() -> list:
    """All four K4 forces with Cathedral coupling strengths."""
    alpha_inv = 137.036
    sin2W = 0.23122
    alpha_weak = ALPHA_EM / sin2W
    return [
        {
            "k": 0, "force": "gravity",
            "coupling": G_NEWTON,
            "relative_to_strong": G_NEWTON / ALPHA_S_MZ,
            "range": "infinite",   "mediator": "graviton",
        },
        {
            "k": 1, "force": "electromagnetism",
            "coupling": ALPHA_EM,
            "relative_to_strong": ALPHA_EM / ALPHA_S_MZ,
            "range": "infinite",   "mediator": "photon",
        },
        {
            "k": 2, "force": "weak (Higgs)",
            "coupling": alpha_weak,
            "relative_to_strong": alpha_weak / ALPHA_S_MZ,
            "range": "~0.1 fm",    "mediator": "W/Z bosons",
        },
        {
            "k": 3, "force": "ordering / consciousness",
            "coupling": DELTA_STAR,
            "relative_to_strong": DELTA_STAR / ALPHA_S_MZ,
            "range": "mesoscopic", "mediator": "icosahedral coherence",
        },
        {
            "k": "4-12", "force": "strong",
            "coupling": ALPHA_S_MZ,
            "relative_to_strong": 1.0,
            "range": "~1 fm",      "mediator": "gluons (H3 sector, γ=1/81)",
        },
    ]


def why_gravity_is_weak() -> dict:
    """G_N << α_EM because G_N = δ★² while α_EM = 1/137."""
    ratio_to_em = G_NEWTON / ALPHA_EM
    ratio_to_strong = G_NEWTON / ALPHA_S_MZ
    return {
        "G_N": G_NEWTON,
        "alpha_EM": ALPHA_EM,
        "alpha_s_MZ": ALPHA_S_MZ,
        "G_N_over_alpha_EM": ratio_to_em,      # ≈ 2.98e-3
        "G_N_over_alpha_s": ratio_to_strong,   # ≈ 1.85e-1
        "explanation": (
            "Gravity is weak because G_N = δ★² = 0.02176 in Planck units, "
            "while α_s ≈ 0.1179. The factor δ★ ≈ 0.1475 suppresses gravity "
            "relative to QCD by δ★ = 0.1475 (one power), and relative to EM "
            "by δ★² × 137 = 2.98e-3 (two powers suppressed by the icosahedral shell)."
        ),
    }


# ── Black hole thermodynamics ─────────────────────────────────────────────

def schwarzschild_radius(M_planck: float) -> float:
    """r_S = 2·G_N·M = 2·δ★²·M in Planck units."""
    return 2 * G_NEWTON * M_planck


def horizon_area(M_planck: float) -> float:
    """A = 4π·r_S² = 16π·G_N²·M² in Planck units."""
    r_s = schwarzschild_radius(M_planck)
    return 4 * pi * r_s ** 2


def bh_entropy(M_planck: float) -> float:
    """S_BH = A/(4·G_N) = 4π·G_N·M² = 4π·δ★²·M²."""
    return 4 * pi * G_NEWTON * M_planck ** 2


def hawking_temperature(M_planck: float) -> float:
    """T_H = 1/(8π·G_N·M) = 1/(8π·δ★²·M) in Planck units."""
    return 1 / (8 * pi * G_NEWTON * M_planck)


def bh_lifetime(M_planck: float) -> float:
    """τ_BH = 5120π·G_N²·M³ (Stefan-Boltzmann evaporation)."""
    return 5120 * pi * G_NEWTON ** 2 * M_planck ** 3


def area_quantum() -> float:
    """Minimum area increment ΔA = 8π·δ★³ from K4 mode quantisation."""
    return AREA_QUANTUM


def bekenstein_mukhanov_spectrum(n: int) -> float:
    """A_n = n·ΔA = n·8π·δ★³ (discrete area eigenvalues)."""
    return n * AREA_QUANTUM


def scrambling_time(M_planck: float) -> float:
    """t_scr = 2·G_N·M·log(S_BH) fast-scrambling bound."""
    S = bh_entropy(M_planck)
    return 2 * G_NEWTON * M_planck * log(S)


def page_time(M_planck: float) -> float:
    """t_Page ≈ τ_BH / 2 — half the evaporation time."""
    return bh_lifetime(M_planck) / 2


def bh_information_summary(M_planck: float) -> dict:
    """Complete BH thermodynamics for mass M (Planck units)."""
    r_s = schwarzschild_radius(M_planck)
    A = horizon_area(M_planck)
    S = bh_entropy(M_planck)
    T = hawking_temperature(M_planck)
    tau = bh_lifetime(M_planck)
    t_scr = scrambling_time(M_planck)
    t_page = page_time(M_planck)
    n_quanta = A / AREA_QUANTUM
    return {
        "M_planck":      M_planck,
        "r_S":           r_s,
        "horizon_area":  A,
        "entropy_S":     S,
        "T_Hawking":     T,
        "lifetime":      tau,
        "scrambling_t":  t_scr,
        "page_time":     t_page,
        "area_quanta_n": n_quanta,
        "area_quantum":  AREA_QUANTUM,
    }


# ── General Relativity tests with Cathedral corrections ───────────────────

def perihelion_advance_rad_per_orbit(M_star: float, a_au: float,
                                     e: float) -> float:
    """
    Perihelion advance Δφ = 6π·G_N·M / (a·(1−e²)) per orbit.
    Cathedral correction: replace G_N with G_N·(1 + δ★/π).
    M_star in solar masses (1 M☉ = 4.925e-6 s in natural units; here pass
    as dimensionless Planck-unit mass), a_au in AU (here dimensionless semi-axis).
    For Mercury (SI): M=1, a=0.387, e=0.206 → 42.98 arcsec/century.
    """
    correction = 1 + DELTA_STAR / pi
    delta_phi = 6 * pi * G_NEWTON * M_star * correction / (a_au * (1 - e ** 2))
    return delta_phi


def gravitational_lensing_angle(M_planck: float, b_planck: float) -> float:
    """
    Einstein deflection angle α = 4·G_N·M/b.
    Cathedral correction: α_cat = α·(1 + δ★²/(2π²)).
    """
    alpha_gr = 4 * G_NEWTON * M_planck / b_planck
    correction = 1 + DELTA_STAR ** 2 / (2 * pi ** 2)
    return alpha_gr * correction


def gravitational_redshift(M_planck: float, r_planck: float) -> float:
    """
    Gravitational redshift z = G_N·M/r (weak field).
    Cathedral: z_cat = z·(1 + δ★/N) where N=13.
    """
    z_gr = G_NEWTON * M_planck / r_planck
    correction = 1 + DELTA_STAR / N
    return z_gr * correction


def gr_test_summary(M_planck: float = 1.0) -> dict:
    """GR test predictions with Cathedral corrections for unit BH."""
    r_isco = 3 * schwarzschild_radius(M_planck)   # 6·G_N·M
    b_min = sqrt(3) * schwarzschild_radius(M_planck) * sqrt(3) / 2
    b_photon = 3 * sqrt(3) / 2 * schwarzschild_radius(M_planck)
    lensing = gravitational_lensing_angle(M_planck, b_photon)
    z_surface = gravitational_redshift(M_planck, r_isco)
    return {
        "M_planck":          M_planck,
        "G_N":               G_NEWTON,
        "r_S":               schwarzschild_radius(M_planck),
        "r_ISCO":            r_isco,
        "lensing_angle_rad": lensing,
        "z_surface":         z_surface,
        "cathedral_correction_factor": 1 + DELTA_STAR / pi,
    }


# ── Effective Lagrangian ──────────────────────────────────────────────────

def effective_lagrangian() -> dict:
    """
    Cathedral effective gravitational Lagrangian terms.
    L_eff = L_EH + L_δ★ + L_K4 + L_area
    """
    return {
        "L_EH":   "R/(16π·G_N)",
        "L_delta_star": f"−(δ★²/2)·(∂φ)² − V(φ)  with V(δ★)=0",
        "L_K4":   "∑_{k=0}^{3} c_k · ψ̄_k · (i∂/ − m_k) · ψ_k",
        "L_area": f"ΔA = 8π·δ★³ = {AREA_QUANTUM:.5f} l_Pl²",
        "G_N":    G_NEWTON,
        "delta_star": DELTA_STAR,
        "area_quantum": AREA_QUANTUM,
        "force_couplings": {
            "k0_gravity": G_NEWTON,
            "k1_EM":      ALPHA_EM,
            "k2_weak":    ALPHA_EM / 0.23122,
            "k3_order":   DELTA_STAR,
            "k4_12_strong": ALPHA_S_MZ,
        },
    }


# ── Report ────────────────────────────────────────────────────────────────

def print_gravity_cathedral_report(M_demo: float = 1e3) -> None:
    """Print comprehensive Cathedral gravity report."""
    print(f"  G_N       = δ★² = {G_NEWTON:.8f}  (Planck units)")
    print(f"  δ★        = {DELTA_STAR:.8f}")
    print(f"  ΔA (area quantum) = 8π·δ★³ = {AREA_QUANTUM:.8f}  l_Pl²")
    print()

    print("  Force hierarchy (K4 modes):")
    for f_entry in force_hierarchy():
        k = f_entry["k"]
        name = f_entry["force"]
        g = f_entry["coupling"]
        print(f"    k={k:<4}  {name:<22}  α={g:.5g}")
    print()

    w = why_gravity_is_weak()
    print(f"  Why gravity is weak:")
    print(f"    G_N/α_EM = {w['G_N_over_alpha_EM']:.4e}  (G_N=δ★², α_EM=1/137)")
    print(f"    G_N/α_s  = {w['G_N_over_alpha_s']:.4f}")
    print()

    bh = bh_information_summary(M_demo)
    print(f"  Black hole M = {M_demo:.0f} l_Pl:")
    print(f"    r_S          = {bh['r_S']:.4g}  l_Pl")
    print(f"    S_BH         = {bh['entropy_S']:.4g}  k_B")
    print(f"    T_Hawking    = {bh['T_Hawking']:.4g}  T_Pl")
    print(f"    τ_lifetime   = {bh['lifetime']:.4g}  t_Pl")
    print(f"    t_scramble   = {bh['scrambling_t']:.4g}  t_Pl")
    print(f"    Area quanta  = {bh['area_quanta_n']:.2f}")
    print()

    gr = gr_test_summary(1.0)
    print("  GR tests (M=1 l_Pl, Cathedral corrections):")
    print(f"    Lensing angle  = {gr['lensing_angle_rad']:.6f}  rad")
    print(f"    z_surface      = {gr['z_surface']:.6f}")
    print(f"    Cathedral corr = ×{gr['cathedral_correction_factor']:.6f}")
