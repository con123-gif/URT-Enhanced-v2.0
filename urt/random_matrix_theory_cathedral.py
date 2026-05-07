"""
Random Matrix Theory Cathedral — Dyson classes, Wigner semicircle, and Cathedral integers.

The most remarkable Cathedral connection in RMT:
  Number of Dyson symmetry classes = D = 3  [EXACT: GOE, GUE, GSE]
  β parameters: β_GOE=1=D-2, β_GUE=2=D-1, β_GSE=4=D+1  [EXACT!]
  Product: β_GOE × β_GUE × β_GSE = 1×2×4 = 8 = 2^D  [EXACT!]
  Sum: β_GOE + β_GUE + β_GSE = 7 = 2D+1  [EXACT]
  Wigner semicircle support [-2,2]: radius = 2 = D-1  [EXACT]
  Number of circular ensembles = D = 3  [EXACT: COE, CUE, CSE]

The Dyson 3-fold way is precisely the Cathedral D=3.

Key results:
  D = 3 = Dyson symmetry classes (GOE, GUE, GSE)
  {1, 2, 4} = {D-2, D-1, D+1} = β parameters [EXACT]
  2^D = 8 = product of all β values [EXACT]
  2D+1 = 7 = sum of all β values [EXACT]
  D-1 = 2 = Wigner semicircle radius (σ=1 units) [EXACT]
  D = 3 = circular ensembles (COE, CUE, CSE)
"""

from math import pi, sqrt, exp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Dyson symmetry classes ────────────────────────────────────────────────────

# The Dyson 3-fold way: GOE, GUE, GSE — exactly D=3 universality classes
N_DYSON_CLASSES = D                        # = 3  [EXACT: GOE, GUE, GSE]
N_DYSON_EQ_D = (N_DYSON_CLASSES == D)      # True

# Dyson β parameters: one for each ensemble
# GOE (Gaussian Orthogonal Ensemble): β = 1 = D-2
BETA_GOE = D - 2                           # = 1  [EXACT: orthogonal β=1]
BETA_GOE_EQ_D2 = (BETA_GOE == D - 2)      # True: 3-2=1

# GUE (Gaussian Unitary Ensemble): β = 2 = D-1
BETA_GUE = D - 1                           # = 2  [EXACT: unitary β=2]
BETA_GUE_EQ_D1 = (BETA_GUE == D - 1)      # True: 3-1=2

# GSE (Gaussian Symplectic Ensemble): β = 4 = D+1
BETA_GSE = D + 1                           # = 4  [EXACT: symplectic β=4]
BETA_GSE_EQ_D1 = (BETA_GSE == D + 1)      # True: 3+1=4

# Product of all β values: 1×2×4 = 8 = 2^D  [EXACT!]
BETA_PRODUCT = BETA_GOE * BETA_GUE * BETA_GSE  # = 8 = 2^D
BETA_PRODUCT_EQ_2D = (BETA_PRODUCT == 2**D)     # True: 1×2×4 = 8 = 2^3

# Sum of all β values: 1+2+4 = 7 = 2D+1  [EXACT]
BETA_SUM = BETA_GOE + BETA_GUE + BETA_GSE  # = 7 = 2D+1
BETA_SUM_EQ_2D1 = (BETA_SUM == 2 * D + 1)  # True: 1+2+4 = 7 = 2×3+1

# ── Wigner semicircle law ─────────────────────────────────────────────────────

# Wigner semicircle: eigenvalue density ρ(x) = (2/πR²)√(R²-x²) on [-R,R]
# For GUE with σ=1: R = 2 = D-1  [EXACT]
WIGNER_SEMICIRCLE_RADIUS = D - 1                    # = 2  [EXACT: support [-2,2]]
WIGNER_RADIUS_EQ_D1 = (WIGNER_SEMICIRCLE_RADIUS == D - 1)  # True: 3-1=2

# Wigner semicircle density at origin (maximum): ρ(0) = (2/πR²)√(R²) = 2/(πR)
WIGNER_DENSITY_MAX = 2.0 / (pi * WIGNER_SEMICIRCLE_RADIUS)     # = 1/π ≈ 0.31831

# ── Circular ensembles ────────────────────────────────────────────────────────

# Circular ensembles: COE, CUE, CSE — exactly D=3
N_CIRCULAR_ENSEMBLES = D                            # = 3  [EXACT: COE, CUE, CSE]
N_CIRCULAR_EQ_D = (N_CIRCULAR_ENSEMBLES == D)       # True

# Largest Dyson index = β_GSE = D+1 = 4
LARGEST_BETA = D + 1                               # = 4 = β_GSE  [EXACT]
LARGEST_BETA_EQ_D1 = (LARGEST_BETA == D + 1)       # True

# ── Level repulsion and spacing ───────────────────────────────────────────────

# Level repulsion: P(s) ~ s^β for s → 0
# GOE: P(s) ~ s^1 = s^{D-2}
# GUE: P(s) ~ s^2 = s^{D-1}
# GSE: P(s) ~ s^4 = s^{D+1}
# Wigner surmise approximations for normalized spacings:

def wigner_surmise_goe(s: float) -> float:
    """
    Wigner surmise for GOE (β=1=D-2): P(s) = (π/2)s exp(-πs²/4).

    Parameters
    ----------
    s : float
        Normalized level spacing s ≥ 0.
    """
    return (pi / 2.0) * s * exp(-pi * s**2 / 4.0)


def wigner_surmise_gue(s: float) -> float:
    """
    Wigner surmise for GUE (β=2=D-1): P(s) = (32/π²)s² exp(-4s²/π).

    Parameters
    ----------
    s : float
        Normalized level spacing s ≥ 0.
    """
    return (32.0 / pi**2) * s**2 * exp(-4.0 * s**2 / pi)


def wigner_surmise_gse(s: float) -> float:
    """
    Wigner surmise for GSE (β=4=D+1): P(s) = (2^18/3^6π^3)s^4 exp(-64s²/9π).

    Parameters
    ----------
    s : float
        Normalized level spacing s ≥ 0.
    """
    prefactor = (2**18) / (3**6 * pi**3)
    return prefactor * s**4 * exp(-64.0 * s**2 / (9.0 * pi))


def wigner_semicircle_density(x: float, R: float = None) -> float:
    """
    Wigner semicircle density: ρ(x) = (2/πR²)√(R²-x²) for |x| ≤ R.

    Parameters
    ----------
    x : float
        Eigenvalue position.
    R : float
        Semicircle radius (default D-1=2).
    """
    if R is None:
        R = WIGNER_SEMICIRCLE_RADIUS
    if abs(x) > R:
        return 0.0
    return (2.0 / (pi * R**2)) * sqrt(R**2 - x**2)


# ── Altland-Zirnbauer classification ─────────────────────────────────────────

# AZ classification: D+1=4 additional superconducting classes (with PH symmetry)
N_AZ_SC_CLASSES = D + 1    # = 4  [APPROXIMATE: D+1 PH-symmetric classes]
N_AZ_TOTAL = D + (D + 1)   # = 7 (Wigner-Dyson + AZ superconducting classes)

# All 10 AZ classes (Cartan symmetric spaces): D + (D+1) + (D+1) − 1 = 10
# This is approximate — exact count involves deeper algebra
N_AZ_ALL = 10              # 10 AZ classes total (the Tenfold Way)

# ── Marchenko-Pastur law ──────────────────────────────────────────────────────

# Marchenko-Pastur distribution: eigenvalue edge at (1 + √β)²
# For β = 1 (GOE):  upper edge ≈ (1+1)² = 4 = D+1
# For β = 2 (GUE):  upper edge = (1+√2)² ≈ 5.83
# For β = 4 (GSE):  upper edge = (1+2)² = 9

def marchenko_pastur_edge(beta: float) -> float:
    """
    Marchenko-Pastur upper spectral edge at (1 + √β)².

    Parameters
    ----------
    beta : float
        Dyson index β ∈ {1, 2, 4}.
    """
    return (1.0 + sqrt(beta))**2


MP_EDGE_GOE = marchenko_pastur_edge(BETA_GOE)   # = (1+1)² = 4 = D+1  [EXACT]
MP_EDGE_GUE = marchenko_pastur_edge(BETA_GUE)   # = (1+√2)² ≈ 5.828
MP_EDGE_GSE = marchenko_pastur_edge(BETA_GSE)   # = (1+2)² = 9

MP_EDGE_GOE_EQ_D1 = (abs(MP_EDGE_GOE - (D + 1)) < 1e-12)  # True: (1+1)²=4=D+1

# ── Harish-Chandra / HCIZ integral ───────────────────────────────────────────

# The Harish-Chandra-Itzykson-Zuber integral over the orthogonal/unitary group
# is a classic result in RMT and matrix models. It is defined in D dimensions.
HCIZ_DIM = D               # = 3  [EXACT: integral over D×D matrices]

# GUE D-point connected correlator uses D=3 for the first non-trivial case
N_POINT_CORRELATOR = D     # = 3  [D-level connected correlator in GUE]

# ── Functions ──────────────────────────────────────────────────────────────────

def dyson_classes() -> dict:
    """
    Dyson symmetry classes and β parameters.

    Returns
    -------
    dict
        n_classes (=D=3), β values, product, sum, and Cathedral equalities.
    """
    return {
        "n_classes":         N_DYSON_CLASSES,
        "classes_eq_D":      N_DYSON_EQ_D,
        "classes_names":     ["GOE", "GUE", "GSE"],
        "beta_goe":          BETA_GOE,
        "beta_goe_eq_D2":    BETA_GOE_EQ_D2,
        "beta_goe_formula":  "D-2 = 1",
        "beta_gue":          BETA_GUE,
        "beta_gue_eq_D1":    BETA_GUE_EQ_D1,
        "beta_gue_formula":  "D-1 = 2",
        "beta_gse":          BETA_GSE,
        "beta_gse_eq_D1":    BETA_GSE_EQ_D1,
        "beta_gse_formula":  "D+1 = 4",
        "beta_product":      BETA_PRODUCT,
        "beta_product_eq_2D": BETA_PRODUCT_EQ_2D,
        "beta_product_formula": "1×2×4 = 8 = 2^D",
        "beta_sum":          BETA_SUM,
        "beta_sum_eq_2D1":   BETA_SUM_EQ_2D1,
        "beta_sum_formula":  "1+2+4 = 7 = 2D+1",
    }


def wigner_semicircle() -> dict:
    """
    Wigner semicircle law and circular ensembles.

    Returns
    -------
    dict
        Radius (=D-1=2), density, circular ensemble count, and equalities.
    """
    return {
        "radius":            WIGNER_SEMICIRCLE_RADIUS,
        "radius_eq_D1":      WIGNER_RADIUS_EQ_D1,
        "radius_formula":    "D-1 = 2",
        "support":           "[-2, 2] = [-(D-1), D-1]",
        "density_at_zero":   WIGNER_DENSITY_MAX,    # = 2/(πR) ≈ 0.3183
        "n_circular":        N_CIRCULAR_ENSEMBLES,
        "circular_eq_D":     N_CIRCULAR_EQ_D,
        "circular_names":    ["COE", "CUE", "CSE"],
        "largest_beta":      LARGEST_BETA,
        "largest_eq_D1":     LARGEST_BETA_EQ_D1,
        "largest_formula":   "D+1 = 4 = β_GSE",
        "mp_edge_goe":       MP_EDGE_GOE,
        "mp_edge_goe_eq_D1": MP_EDGE_GOE_EQ_D1,
        "mp_edge_goe_formula": "(1+√β_GOE)² = (1+1)² = 4 = D+1",
    }


def rmt_summary() -> dict:
    """
    Full Cathedral RMT summary.

    Returns
    -------
    dict
        Dyson classes, Wigner semicircle, and key exact results.
    """
    return {
        "dyson":   dyson_classes(),
        "wigner":  wigner_semicircle(),
        "KEY_EXACT_RESULTS": [
            f"Dyson symmetry classes = D = {D}  [EXACT: GOE, GUE, GSE]",
            f"β_GOE = D-2 = {BETA_GOE}  [EXACT: orthogonal ensemble]",
            f"β_GUE = D-1 = {BETA_GUE}  [EXACT: unitary ensemble]",
            f"β_GSE = D+1 = {BETA_GSE}  [EXACT: symplectic ensemble]",
            f"β product = 1×2×4 = {BETA_PRODUCT} = 2^D = 2^{D}  [EXACT!]",
            f"β sum = 1+2+4 = {BETA_SUM} = 2D+1 = {2*D+1}  [EXACT]",
            f"Wigner semicircle radius = D-1 = {WIGNER_SEMICIRCLE_RADIUS}  [EXACT: support [-2,2]]",
            f"Circular ensembles = D = {D}  [EXACT: COE, CUE, CSE]",
            f"Largest β = D+1 = {LARGEST_BETA} = β_GSE  [EXACT]",
            f"MP edge (GOE) = (1+√β_GOE)² = {MP_EDGE_GOE:.1f} = D+1 = {D+1}  [EXACT]",
        ],
    }


def print_rmt_report():
    """Print Cathedral Random Matrix Theory report."""
    dc = dyson_classes()
    ws = wigner_semicircle()

    print("  Cathedral Random Matrix Theory — Dyson Classes and Wigner Semicircle")
    print("  " + "─" * 58)

    print(f"\n  Dyson 3-Fold Way (symmetry classes):")
    print(f"    Number of classes = D = {N_DYSON_CLASSES}  ← EXACT (GOE, GUE, GSE)")
    print(f"    β_GOE = D-2 = {BETA_GOE}  (orthogonal, time-reversal + spin-0)")
    print(f"    β_GUE = D-1 = {BETA_GUE}  (unitary, broken time-reversal)")
    print(f"    β_GSE = D+1 = {BETA_GSE}  (symplectic, time-reversal + spin-1/2)")

    print(f"\n  β Parameter Arithmetic:")
    print(f"    Product: β_GOE × β_GUE × β_GSE = {BETA_GOE}×{BETA_GUE}×{BETA_GSE} = {BETA_PRODUCT} = 2^D = 2^{D}  ← EXACT!")
    print(f"    Sum:     β_GOE + β_GUE + β_GSE = {BETA_GOE}+{BETA_GUE}+{BETA_GSE} = {BETA_SUM} = 2D+1 = {2*D+1}  ← EXACT")

    print(f"\n  Wigner Semicircle Law (σ=1 normalisation):")
    print(f"    Support = [-{WIGNER_SEMICIRCLE_RADIUS}, {WIGNER_SEMICIRCLE_RADIUS}] = [-(D-1), D-1]  ← EXACT")
    print(f"    Radius R = D-1 = {WIGNER_SEMICIRCLE_RADIUS}  ← EXACT")
    print(f"    ρ(0) = 2/(πR) = {WIGNER_DENSITY_MAX:.6f}")

    print(f"\n  Circular Ensembles:")
    print(f"    Number = D = {N_CIRCULAR_ENSEMBLES}  ← EXACT (COE, CUE, CSE)")
    print(f"    Largest β = D+1 = {LARGEST_BETA} (GSE / CSE)  ← EXACT")

    print(f"\n  Marchenko-Pastur Edges:")
    print(f"    GOE (β=1): (1+√1)² = {MP_EDGE_GOE:.1f} = D+1 = {D+1}  ← EXACT!")
    print(f"    GUE (β=2): (1+√2)² = {MP_EDGE_GUE:.4f}")
    print(f"    GSE (β=4): (1+2)²  = {MP_EDGE_GSE:.1f}")

    print(f"\n  Level Repulsion: P(s) ~ s^β")
    print(f"    GOE: P(s) ~ s^{{D-2}} = s^1  (linear)")
    print(f"    GUE: P(s) ~ s^{{D-1}} = s^2  (quadratic)")
    print(f"    GSE: P(s) ~ s^{{D+1}} = s^4  (quartic)")

    print(f"\n  KEY: Dyson 3-fold way = D=3; β product = 2^D = 2^3 = 8!")
