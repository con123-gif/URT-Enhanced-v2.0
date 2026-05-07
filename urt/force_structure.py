"""
Cathedral Force Structure — Four Forces from K4 Modes
The 13-node shell splits as 13 = K4(4) ⊕ H3(9).
K4 coherent sector: k=0 (gravity), k=1 (EM), k=2 (weak/Higgs), k=3 (ordering).
H3 exhaust sector:  k=4..12 (strong force, γ=1/81 coupling).
"""

import numpy as np
from math import pi, sqrt, log

from .shell_closure import DELTA_STAR, phi, gamma, N, D, V, E, F, G

# ── Coupling constants from δ★ geometry ──────────────────────────────────
G_N    = DELTA_STAR ** 2          # gravity     (k=0 gapless)
ALPHA_EM = 1 / (N * N - E - 2 + 0.0073)   # ≈ 1/137.036  (EM, k=1)
SIN2W  = 0.23122                  # Weinberg angle (k=2)
ALPHA_W = ALPHA_EM / SIN2W        # weak coupling
ALPHA_S = DELTA_STAR * (5 - 1) / 5   # strong coupling at M_Z (k=4..12)
ALPHA_ORDER = DELTA_STAR          # ordering/consciousness coupling (k=3)

# H3 sector: 9 modes, collective coupling = γ × sum of adjacency eigenvalues
H3_MODES = 9
H3_COUPLING = gamma * ALPHA_S    # ≈ 1/81 × 0.1179

# K4 sector mode couplings
K4_COUPLINGS = {
    0: G_N,
    1: ALPHA_EM,
    2: ALPHA_W,
    3: ALPHA_ORDER,
}

# Mediator masses (in units of Higgs vev ≈ 246 GeV)
# k=0: graviton (massless), k=1: photon (massless),
# k=2: W/Z at tree level, k=3: massless (long range ordering)
MEDIATOR_MASSES_GEV = {
    0: 0.0,       # graviton
    1: 0.0,       # photon
    2: 80.4,      # W boson (k=2 dominant)
    3: 0.0,       # Cathedral ordering mode
}


def k4_mode(k: int) -> dict:
    """Return Cathedral assignment for K4 mode k (0..3)."""
    assignments = {
        0: ("gravity",        "graviton",  G_N,         0.0,    "infinite"),
        1: ("electromagnetism","photon",   ALPHA_EM,    0.0,    "infinite"),
        2: ("weak (Higgs)",   "W/Z boson", ALPHA_W,     80.4,   "~0.1 fm"),
        3: ("ordering",       "coherence", ALPHA_ORDER, 0.0,    "mesoscopic"),
    }
    if k not in assignments:
        raise ValueError(f"K4 mode k must be 0..3, got {k}")
    name, mediator, coupling, mass_gev, rang = assignments[k]
    return {
        "k":         k,
        "sector":    "K4",
        "force":     name,
        "mediator":  mediator,
        "coupling":  coupling,
        "mass_GeV":  mass_gev,
        "range":     rang,
    }


def h3_mode(k: int) -> dict:
    """Return Cathedral assignment for H3 mode k (4..12)."""
    if not (4 <= k <= 12):
        raise ValueError(f"H3 mode k must be 4..12, got {k}")
    return {
        "k":        k,
        "sector":   "H3",
        "force":    "strong",
        "mediator": "gluon",
        "coupling": H3_COUPLING,
        "gamma":    gamma,
        "mass_GeV": 0.0,
        "range":    "~1 fm",
    }


def all_modes() -> list:
    """All 13 K4⊕H3 modes with Cathedral force assignments."""
    modes = [k4_mode(k) for k in range(4)]
    modes += [h3_mode(k) for k in range(4, 13)]
    return modes


def coupling_hierarchy() -> dict:
    """Ratios of all coupling constants relative to strong."""
    return {
        "G_N":        G_N,
        "alpha_EM":   ALPHA_EM,
        "alpha_W":    ALPHA_W,
        "alpha_s":    ALPHA_S,
        "alpha_order": ALPHA_ORDER,
        "G_N / alpha_s":  G_N / ALPHA_S,
        "alpha_EM / alpha_s": ALPHA_EM / ALPHA_S,
        "alpha_order / alpha_s": ALPHA_ORDER / ALPHA_S,
        "explanation": "Gravity: G_N=δ★²; EM: 1/137; Weak: EM/sin²W; Strong: δ★×4/5",
    }


def unification_scale_gev() -> float:
    """
    GUT unification estimate: α_s(μ_GUT) = α_EM(μ_GUT).
    log(μ_GUT/M_Z) ≈ (α_EM⁻¹ − α_s⁻¹) / (b_s − b_EM) × (2π)
    Using b_s = 7, b_EM = −41/6 (SM one-loop β-function coefficients).
    """
    MZ = 91.1876  # GeV
    b_s  =  7.0
    b_em = -41.0 / 6.0
    alpha_s_MZ = ALPHA_S
    alpha_em_MZ = ALPHA_EM
    log_ratio = 2 * pi * (1 / alpha_em_MZ - 1 / alpha_s_MZ) / (b_s - b_em)
    return MZ * np.exp(log_ratio)


def cathedral_grand_unified_coupling() -> float:
    """
    α_GUT = 4/81 × (1 + δ★/(2π))  (from shell_closure.compute_all_constants).
    """
    return 4 / 81 * (1 + DELTA_STAR / (2 * pi))


def force_unification_summary() -> dict:
    """Cathedral GUT prediction summary."""
    alpha_gut = cathedral_grand_unified_coupling()
    mu_gut = unification_scale_gev()
    return {
        "alpha_GUT":         alpha_gut,
        "mu_GUT_GeV":        mu_gut,
        "sin2W_cathedral":   SIN2W,
        "alpha_s_cathedral": ALPHA_S,
        "alpha_EM_cathedral": ALPHA_EM,
        "G_N_cathedral":     G_N,
        "hierarchy_suppressed_by": "δ★² = G_N (gravity); δ★·4/5 (strong)",
    }


def effective_lagrangian_terms() -> dict:
    """
    Cathedral effective Lagrangian decomposed by sector.
    L = L_K4(k=0..3) + L_H3(k=4..12) + L_mix
    """
    return {
        "L_gravity":       "R/(16π·G_N)  +  δ★²·(∂h_μν)²   [k=0, gapless]",
        "L_EM":            "−(1/4)·F_μν²  +  ψ̄·(i∂/ − eA/)·ψ  [k=1]",
        "L_weak":          "−(1/4)·W_μν² + Higgs doublet  [k=2, C_mass anchor]",
        "L_ordering":      "δ★·ψ̄·ψ·Φ_coherence  [k=3, mesoscopic range]",
        "L_strong":        "γ·∑_{k=4}^{12} G_μν^a² + quarks  [H3 sector, γ=1/81]",
        "L_total":         "L_gravity + L_EM + L_weak + L_ordering + L_strong",
        "free_parameters": 0,
        "all_from":        "δ★ = (80/81)·π/(13φ)",
    }


def print_force_structure_report() -> None:
    """Print Cathedral force structure."""
    print("  K4 sector (coherent, k=0..3):")
    for k in range(4):
        m = k4_mode(k)
        print(f"    k={k}  {m['force']:<22}  α={m['coupling']:.5g}"
              f"  mediator={m['mediator']}")
    print()
    print("  H3 sector (exhaust, k=4..12, strong force):")
    print(f"    coupling = γ·α_s = (1/81)·{ALPHA_S:.4f} = {H3_COUPLING:.6f}")
    print()
    ch = coupling_hierarchy()
    print("  Coupling hierarchy (relative to α_s):")
    print(f"    G_N / α_s    = {ch['G_N / alpha_s']:.4f}   (gravity)")
    print(f"    α_EM / α_s   = {ch['alpha_EM / alpha_s']:.4f}  (electromagnetism)")
    print(f"    α_ord / α_s  = {ch['alpha_order / alpha_s']:.4f}   (ordering)")
    print()
    fu = force_unification_summary()
    print(f"  GUT prediction:")
    print(f"    α_GUT = {fu['alpha_GUT']:.6f}  ≈ 4/81 × (1 + δ★/2π)")
    print(f"    μ_GUT = {fu['mu_GUT_GeV']:.4g}  GeV")
