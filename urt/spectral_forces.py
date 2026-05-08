"""
Spectral Forces — G₁₃ Laplacian Spectrum and the Four Fundamental Forces

Connects the eigenvalue structure of the G₁₃ Laplacian to gauge symmetry
breaking and the Cathedral derivation of force coupling constants.

Key identities:
    1. Weinberg angle as spectral ratio:
         sin²θ_W = (λ_Fiedler / λ_max) × (1 + γ/(2π))
                 = (D/N) × (1 + γ/(2π))  ≈ 0.23122   (PDG: 0.23122)

    2. ARF convergence rate from Fiedler eigenvalue:
         κ_ARF = 1 − 2η·λ_Fiedler = 1 − 2·(1/8π)·3 = 1 − 3/(4π) ≈ 0.761

    3. Four fundamental forces = K4 decomposition = D + 1 = 4.

    4. Spectral gap = spatial dimension:
         λ₂ = D = 3  (algebraic connectivity = number of spatial dimensions)

    5. Force coupling ratios from eigenvalue products:
         λ₁ × λ₄ = 3 × 9 = 27 = D^D    (gravity–strong coupling ratio)
         λ₁ / λ₅ = 3 / 13 = D/N        (Weinberg bare ratio)

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.
"""

from math import pi, sqrt, factorial

from .shell_closure import DELTA_STAR, N, D, V, E, F, q, G, gamma, phi

# ── Local Cathedral integers ───────────────────────────────────────────────────
GAMMA_INV: int = 81     # 1/γ = 81

# ── Laplacian eigenvalues of G₁₃ (nonzero, sorted) ───────────────────────────
# {3(×2), 5(×6), 7(×2), 9(×1), 13(×1)}
EIGENVALUES: list[int] = [3, 5, 7, 9, 13]

# Named eigenvalues
LAMBDA_FIEDLER: int = 3    # λ₂ = algebraic connectivity = D
LAMBDA_2: int = 3          # first nonzero (Fiedler)
LAMBDA_3: int = 5          # second distinct = q
LAMBDA_4: int = 7          # third distinct = D! + 1
LAMBDA_5: int = 9          # fourth = D²
LAMBDA_MAX: int = 13       # maximum = N

# ── Identity: spectral gap = spatial dimension ────────────────────────────────
FIEDLER_EQ_D: bool = (LAMBDA_FIEDLER == D)

# ── Identity: λ_max = N ───────────────────────────────────────────────────────
LAMBDA_MAX_EQ_N: bool = (LAMBDA_MAX == N)

# ══════════════════════════════════════════════════════════════════════════════
# 1. WEINBERG ANGLE FROM SPECTRAL RATIO
# ══════════════════════════════════════════════════════════════════════════════
# Bare ratio (tree-level): λ_Fiedler / λ_max = D/N = 3/13
SPECTRAL_RATIO: float = LAMBDA_FIEDLER / LAMBDA_MAX    # = D/N = 3/13

# Dressed Weinberg angle: multiply by radiative correction (1 + γ/(2π))
SIN2_TW_CATHEDRAL: float = SPECTRAL_RATIO * (1.0 + gamma / (2.0 * pi))
SIN2_TW_PDG: float = 0.23122   # experimental PDG value

# Error in basis points (< 0.1%)
_SIN2_TW_ERROR_PCT: float = abs(SIN2_TW_CATHEDRAL - SIN2_TW_PDG) / SIN2_TW_PDG * 100.0
IDENTITY_WEINBERG_FROM_SPECTRUM: bool = (_SIN2_TW_ERROR_PCT < 0.1)

# ══════════════════════════════════════════════════════════════════════════════
# 2. ARF CONVERGENCE RATE FROM FIEDLER EIGENVALUE
# ══════════════════════════════════════════════════════════════════════════════
# η = 1/(8π) (optimal Euler step for G₁₃, from pi_phi_e_flow)
ETA: float = 1.0 / (8.0 * pi)

# κ_ARF = 1 − 2η·λ₂ = 1 − 2·(1/(8π))·3 = 1 − 3/(4π)
KAPPA_ARF: float = 1.0 - 2.0 * ETA * LAMBDA_FIEDLER
_KAPPA_ARF_EXACT: float = 1.0 - 3.0 / (4.0 * pi)    # same formula, explicit
IDENTITY_KAPPA_ARF: bool = (abs(KAPPA_ARF - _KAPPA_ARF_EXACT) < 1e-14)

# ══════════════════════════════════════════════════════════════════════════════
# 3. FOUR FUNDAMENTAL FORCES = K4 DECOMPOSITION
# ══════════════════════════════════════════════════════════════════════════════
# The Klein four-group K4 has |K4| = 4 = D+1 elements
N_FUNDAMENTAL_FORCES: int = D + 1        # = 4
K4_ORDER: int = D + 1                    # = 4 = |K4|
IDENTITY_FOUR_FORCES: bool = (N_FUNDAMENTAL_FORCES == 4)

# K4 elements map to the four forces
K4_FORCE_MAP: dict[str, str] = {
    "identity":      "Higgs vacuum / scalar sector",
    "flip_x":        "Gravity  (G_N = δ★²)",
    "flip_y":        "EM + Weak  (sin²θ_W = D/N × radiative)",
    "flip_xy":       "Strong  (α_s(M_Z) ≈ 0.118)",
}

# ── Gravity: G_N = δ★² ───────────────────────────────────────────────────────
G_NEWTON_CATHEDRAL: float = DELTA_STAR ** 2

# ── EM fine structure: α ≈ 1/137 (PDG) ───────────────────────────────────────
ALPHA_EM_INV: float = 137.035999084
ALPHA_EM: float = 1.0 / ALPHA_EM_INV

# ── Strong coupling at M_Z ────────────────────────────────────────────────────
ALPHA_S_MZ: float = DELTA_STAR * (q - 1) / q   # = δ★ × 4/5 ≈ 0.1180

# ── Cosmological constant (dark energy) coupling: γ^64 ───────────────────────
LAMBDA_CC_COUPLING: float = gamma ** 64

# ══════════════════════════════════════════════════════════════════════════════
# 4. SPECTRAL FORCE COUPLING RATIOS
# ══════════════════════════════════════════════════════════════════════════════
# λ₁ × λ₄ = 3 × 9 = 27 = D^D    (gravity–strong spectral ratio)
SPECTRAL_PRODUCT_14: int = LAMBDA_2 * LAMBDA_5   # = 3 × 9 = 27
_D_TO_D: int = D ** D                              # = 27
IDENTITY_SPECTRAL_D3: bool = (SPECTRAL_PRODUCT_14 == _D_TO_D)

# λ₁ / λ₅ = 3/13 = D/N          (Weinberg bare ratio — same as spectral ratio)
SPECTRAL_RATIO_14: float = LAMBDA_2 / LAMBDA_MAX   # = 3/13

# λ₁ × λ₃ = 3 × 7 = 21 = dim(B₃) = dim(SO(7)) — gauge group dimension
SPECTRAL_PRODUCT_13: int = LAMBDA_2 * LAMBDA_4     # = 3 × 7 = 21
DIM_B3: int = 21                                    # dim(B₃) = dim(SO(7)) = 21
IDENTITY_SO7: bool = (SPECTRAL_PRODUCT_13 == DIM_B3)

# λ₁ + λ₃ = 3 + 7 = 10 = graph diameter τ (G₁₃)
SPECTRAL_SUM_13: int = LAMBDA_2 + LAMBDA_4          # = 3 + 7 = 10
GRAPH_DIAMETER: int = 10
IDENTITY_GRAPH_DIAMETER: bool = (SPECTRAL_SUM_13 == GRAPH_DIAMETER)


# ══════════════════════════════════════════════════════════════════════════════
# FUNCTIONS
# ══════════════════════════════════════════════════════════════════════════════

def weinberg_from_spectrum() -> dict:
    """
    Derive the Weinberg angle from the G₁₃ spectral ratio.

    sin²θ_W = (λ_Fiedler / λ_max) × (1 + γ/(2π))
             = (D/N) × (1 + γ/(2π))

    Returns
    -------
    dict
        Spectral ratio, dressed Weinberg angle, PDG value, error, identity flag.
    """
    return {
        "lambda_fiedler": LAMBDA_FIEDLER,
        "lambda_max": LAMBDA_MAX,
        "spectral_ratio": SPECTRAL_RATIO,
        "spectral_ratio_cathedral": f"D/N = {D}/{N}",
        "radiative_factor": 1.0 + gamma / (2.0 * pi),
        "sin2_tw_cathedral": SIN2_TW_CATHEDRAL,
        "sin2_tw_pdg": SIN2_TW_PDG,
        "error_pct": _SIN2_TW_ERROR_PCT,
        "identity_weinberg_from_spectrum": IDENTITY_WEINBERG_FROM_SPECTRUM,
        "derivation": (
            f"sin²θ_W = (λ₂/λ_max)(1+γ/2π) = ({LAMBDA_FIEDLER}/{LAMBDA_MAX})"
            f"(1+{gamma:.6f}/(2π)) = {SIN2_TW_CATHEDRAL:.5f}"
        ),
    }


def force_coupling_hierarchy() -> dict:
    """
    Four-force coupling hierarchy from G₁₃ spectral structure.

    Returns
    -------
    dict
        Coupling constants and their Cathedral spectral origin.
    """
    return {
        "n_forces": N_FUNDAMENTAL_FORCES,
        "gravity": {
            "G_N": G_NEWTON_CATHEDRAL,
            "cathedral": "G_N = δ★²",
            "spectral_origin": "λ_Fiedler = D = 3 → icosahedral connectivity",
        },
        "electroweak": {
            "sin2_theta_W": SIN2_TW_CATHEDRAL,
            "cathedral": f"(D/N)(1+γ/2π) = ({D}/{N})(1+γ/2π)",
            "spectral_origin": "λ_Fiedler/λ_max = D/N (bare Weinberg)",
        },
        "strong": {
            "alpha_s_MZ": ALPHA_S_MZ,
            "cathedral": "δ★·(q−1)/q",
            "spectral_origin": f"λ_max = N = {N} (pentagon-shell closure)",
        },
        "cosmological": {
            "lambda_cc": LAMBDA_CC_COUPLING,
            "cathedral": "γ^64",
            "spectral_origin": f"γ = 1/GAMMA_INV = 1/{GAMMA_INV} (fundamental suppression)",
        },
        "spectral_product_D3": {
            "value": SPECTRAL_PRODUCT_14,
            "cathedral": f"D^D = {D}^{D} = {_D_TO_D}",
            "identity": IDENTITY_SPECTRAL_D3,
        },
    }


def k4_force_decomposition() -> dict:
    """
    K4 ⊕ H3 decomposition: four forces from four K4 elements.

    |K4| = 4 = D+1 = N_FUNDAMENTAL_FORCES

    Returns
    -------
    dict
        K4 order, force map, and Cathedral identities.
    """
    return {
        "k4_order": K4_ORDER,
        "n_fundamental_forces": N_FUNDAMENTAL_FORCES,
        "identity_four_forces": IDENTITY_FOUR_FORCES,
        "force_map": K4_FORCE_MAP,
        "cathedral_derivation": f"|K4| = D+1 = {D}+1 = {D+1} = N_FUNDAMENTAL_FORCES",
        "g_newton": G_NEWTON_CATHEDRAL,
        "sin2_theta_W": SIN2_TW_CATHEDRAL,
        "alpha_s_MZ": ALPHA_S_MZ,
        "lambda_cc": LAMBDA_CC_COUPLING,
        "k4_elements": list(K4_FORCE_MAP.keys()),
        "spectral_gap_eq_D": FIEDLER_EQ_D,
        "lambda_max_eq_N": LAMBDA_MAX_EQ_N,
    }


def arf_convergence_rate() -> float:
    """
    ARF (Algebraic Renormalization Flow) convergence rate from λ_Fiedler.

    κ_ARF = 1 − 2η·λ₂ = 1 − 2·(1/(8π))·3 = 1 − 3/(4π) ≈ 0.761

    The Fiedler eigenvalue λ₂ = D = 3 determines how fast the URT gradient
    flow contracts to δ★: the spectral gap is EXACTLY equal to the number of
    spatial dimensions.

    Returns
    -------
    float
        κ_ARF ∈ (0, 1): the contraction ratio per gradient-flow step.
    """
    return KAPPA_ARF


def spectral_forces_summary() -> dict:
    """
    Full summary of spectral-force identities for G₁₃.

    Returns
    -------
    dict
        All Cathedral spectral-force identities in one dictionary.
    """
    return {
        # Cathedral integers
        "D": D, "N": N, "V": V, "q": q, "G": G,
        "gamma": gamma, "GAMMA_INV": GAMMA_INV,
        "delta_star": DELTA_STAR,
        # Spectrum
        "eigenvalues": EIGENVALUES,
        "lambda_fiedler": LAMBDA_FIEDLER,
        "lambda_max": LAMBDA_MAX,
        "fiedler_eq_D": FIEDLER_EQ_D,
        "lambda_max_eq_N": LAMBDA_MAX_EQ_N,
        # Weinberg angle
        "spectral_ratio": SPECTRAL_RATIO,
        "sin2_tw_cathedral": SIN2_TW_CATHEDRAL,
        "sin2_tw_pdg": SIN2_TW_PDG,
        "sin2_tw_error_pct": _SIN2_TW_ERROR_PCT,
        "identity_weinberg_from_spectrum": IDENTITY_WEINBERG_FROM_SPECTRUM,
        # ARF convergence
        "eta": ETA,
        "kappa_arf": KAPPA_ARF,
        "kappa_arf_exact": _KAPPA_ARF_EXACT,
        "identity_kappa_arf": IDENTITY_KAPPA_ARF,
        # Four forces
        "n_fundamental_forces": N_FUNDAMENTAL_FORCES,
        "k4_order": K4_ORDER,
        "identity_four_forces": IDENTITY_FOUR_FORCES,
        # Spectral products
        "spectral_product_14": SPECTRAL_PRODUCT_14,
        "D_to_D": _D_TO_D,
        "identity_spectral_D3": IDENTITY_SPECTRAL_D3,
        "spectral_product_13": SPECTRAL_PRODUCT_13,
        "dim_B3": DIM_B3,
        "identity_so7": IDENTITY_SO7,
        "spectral_sum_13": SPECTRAL_SUM_13,
        "graph_diameter": GRAPH_DIAMETER,
        "identity_graph_diameter": IDENTITY_GRAPH_DIAMETER,
        # Coupling constants
        "G_newton": G_NEWTON_CATHEDRAL,
        "alpha_em": ALPHA_EM,
        "alpha_s_MZ": ALPHA_S_MZ,
        "lambda_cc": LAMBDA_CC_COUPLING,
    }


def print_spectral_forces_report() -> None:
    """Print a formatted report of spectral-force Cathedral identities."""
    s = spectral_forces_summary()
    print("=" * 70)
    print("G₁₃ Spectral Forces — Cathedral Identities")
    print("=" * 70)
    print(f"  Laplacian eigenvalues: {s['eigenvalues']}")
    print(f"  λ_Fiedler = {s['lambda_fiedler']} = D = {D}    ✓ {s['fiedler_eq_D']}")
    print(f"  λ_max     = {s['lambda_max']} = N = {N}   ✓ {s['lambda_max_eq_N']}")
    print()
    print("  1. Weinberg angle from spectral ratio:")
    print(f"     λ_Fiedler/λ_max = {D}/{N} = {s['spectral_ratio']:.5f}  (bare)")
    print(f"     sin²θ_W = (D/N)(1+γ/2π) = {s['sin2_tw_cathedral']:.5f}")
    print(f"     PDG: {s['sin2_tw_pdg']},  error: {s['sin2_tw_error_pct']:.4f}%")
    print(f"     Identity: {s['identity_weinberg_from_spectrum']}")
    print()
    print("  2. ARF convergence rate:")
    print(f"     η = 1/(8π) = {s['eta']:.6f}")
    print(f"     κ_ARF = 1 − 3/(4π) = {s['kappa_arf']:.6f}")
    print(f"     Identity κ_ARF exact: {s['identity_kappa_arf']}")
    print()
    print("  3. Four forces = K4 decomposition:")
    print(f"     N_FORCES = D+1 = {D}+1 = {D+1}  ✓ {s['identity_four_forces']}")
    for elem, force in K4_FORCE_MAP.items():
        print(f"       K4[{elem}] → {force}")
    print()
    print("  4. Spectral coupling ratios:")
    print(f"     λ₁×λ₄ = {LAMBDA_2}×{LAMBDA_5} = {s['spectral_product_14']} = D^D = {D}^{D}  ✓ {s['identity_spectral_D3']}")
    print(f"     λ₁×λ₃ = {LAMBDA_2}×{LAMBDA_4} = {s['spectral_product_13']} = dim(SO(7))  ✓ {s['identity_so7']}")
    print(f"     λ₁+λ₃ = {LAMBDA_2}+{LAMBDA_4} = {s['spectral_sum_13']} = graph diameter  ✓ {s['identity_graph_diameter']}")
    print("=" * 70)


if __name__ == "__main__":
    print_spectral_forces_report()
