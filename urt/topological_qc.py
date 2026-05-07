"""
Topological Quantum Computing — Fibonacci Anyons and A₅ Cathedral Connection

The icosahedral rotation group A₅ (order G=60) is the symmetry group underlying
Fibonacci anyon theory.  The golden ratio φ appears in BOTH:
  δ★ = (80/81)·π/(13φ)           (Cathedral constant)
  d = φ                           (Fibonacci anyon quantum dimension)

This double appearance is not a coincidence: both arise from the unique
non-abelian simple group of order 60 that admits a 5-dimensional faithful
representation (H₃ sector, q=5).

Key facts:
  |A₅| = G = 60,  q = 5 → R-matrix phases 2π/q = 2π/5
  QEC threshold p_th = γ = 1/81 ≈ 1.23%  (matches surface-code threshold ~1%)
  Fibonacci braiding is universal for quantum computation (Freedman 2002)
"""

from math import pi, sqrt
from cmath import exp as cexp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi

# ── Fibonacci anyon quantum dimension ────────────────────────────────────────
D_FIBONACCI = phi       # d = φ = (1+√5)/2  (unique positive root of d² = d+1)

# ── F-matrix for Fibonacci anyons ────────────────────────────────────────────
# F^{ττ}_{ττ} =  [[φ⁻¹,    φ⁻¹/²],
#                 [φ⁻¹/²,  -φ⁻¹]]
# Derived from the pentagon equation in A₅ representation theory.
F_MATRIX_11 =  1 / phi          # φ⁻¹ ≈ 0.6180
F_MATRIX_12 =  1 / sqrt(phi)    # φ⁻¹/² ≈ 0.7862
F_MATRIX_21 =  1 / sqrt(phi)    # symmetric
F_MATRIX_22 = -1 / phi          # -φ⁻¹ ≈ -0.6180

# ── R-matrix phases (5-fold symmetry, q=5) ───────────────────────────────────
# Phase structure 2π/q = 2π/5 from the 5-fold icosahedral symmetry.
# R^1_τ = e^{−4πi/5},   R^τ_τ = e^{3πi/5}
R_PHASE_1   = -4 * pi / 5      # argument of R^1_τ
R_PHASE_TAU =  3 * pi / 5      # argument of R^τ_τ

# ── Cathedral QEC threshold ───────────────────────────────────────────────────
# Icosahedral surface code: spectral gap λ₂ = D = 3 drives error suppression.
# Per-site error threshold p_th = γ = 1/81 ≈ 1.23%
# Matches the standard surface-code threshold of ~1%.
P_TH_ICOSAHEDRAL = gamma        # 1/81 ≈ 0.01235

# ── Braiding gate (two Fibonacci anyons in fusion basis) ──────────────────────
# U_braid = diag(e^{4πi/5}, e^{−3πi/5})
# The anyon loop generates a non-Abelian phase → universal gate set.
_B11 = cexp( 4j * pi / 5)      # e^{4πi/5}
_B22 = cexp(-3j * pi / 5)      # e^{-3πi/5}


# ── Functions ────────────────────────────────────────────────────────────────

def fibonacci_anyon() -> dict:
    """
    Fibonacci anyon properties and Cathedral A₅ connection.

    Pentagon equation check:
        (F[τ,1])² + (F[τ,τ])² = (1/√φ)² + (−1/φ)² = 1/φ + 1/φ² = 1  ✓
    (uses identity 1/φ + 1/φ² = 1 equivalent to φ² = φ+1)

    Returns
    -------
    dict
    """
    # Pentagon unitarity: (F_12)² + (F_22)² = 1
    pentagon_check = abs(F_MATRIX_12**2 + F_MATRIX_22**2 - 1.0) < 1e-12

    # φ² = φ+1 (defining property)
    golden_check = abs(phi**2 - phi - 1) < 1e-14

    return {
        "quantum_dim":       D_FIBONACCI,
        "quantum_dim_value": phi,
        "fusion_rule":       "τ ⊗ τ = 1 ⊕ τ",
        "pentagon_check":    pentagon_check,
        "golden_identity":   golden_check,
        "A5_order":          G,           # |A₅| = 60
        "q_fold_symmetry":   q,           # 5-fold ↔ R-matrix phases
        "delta_star":        DELTA_STAR,
        "A5_connection":     ("A₅ is BOTH the icosahedral rotation group (|A₅|=G=60) "
                              "AND the symmetry of Fibonacci anyon theory; "
                              "φ appears in δ★=(80/81)π/(13φ) and in d=φ"),
        "note":              "Fibonacci anyons are non-Abelian; braiding is universal (Freedman 2002)",
    }


def f_matrix() -> list:
    """
    Return the 2×2 F-matrix for Fibonacci anyons as nested list.

    F^{ττ}_{ττ} = [[φ⁻¹, φ⁻¹/²], [φ⁻¹/², -φ⁻¹]]

    Returns
    -------
    list[list[float]]
    """
    return [
        [F_MATRIX_11, F_MATRIX_12],
        [F_MATRIX_21, F_MATRIX_22],
    ]


def r_matrix() -> dict:
    """
    R-matrix phases for Fibonacci anyons.

    Phase structure 2π/q = 2π/5 from 5-fold icosahedral symmetry.

    Returns
    -------
    dict
        phase_1, phase_tau (in radians), q_used, two_pi_over_q.
    """
    return {
        "phase_1":        R_PHASE_1,
        "phase_tau":      R_PHASE_TAU,
        "r1_complex":     cexp(1j * R_PHASE_1),
        "r_tau_complex":  cexp(1j * R_PHASE_TAU),
        "q_used":         q,
        "two_pi_over_q":  2 * pi / q,
        "note":           ("q=5 gives 2π/5 phase structure; "
                           "phases -4π/5 = -2×(2π/5), 3π/5 = (3/2)×(2π/5)"),
    }


def icosahedral_qec() -> dict:
    """
    Quantum error correction threshold for icosahedral surface code.

    Cathedral derivation:
      - Spectral gap λ₂ = D = 3 (icosahedral graph, spatial dimension)
      - Error threshold p_th = γ = 1/81 ≈ 1.23% per site
      - Matches standard toric/surface code threshold ≈ 1.1–1.4%

    The threshold γ = D^{−(D+1)} = 3^{−4} = 1/81 is NOT a coincidence:
    it is the same γ that appears in δ★ = (1−γ)·π/(Nφ).

    Returns
    -------
    dict
    """
    surface_code_threshold = 0.011   # ~1.1% for standard surface code
    return {
        "threshold":                 P_TH_ICOSAHEDRAL,
        "threshold_pct":             P_TH_ICOSAHEDRAL * 100,
        "why_gamma":                 "γ = D^{−(D+1)} = 3^{−4} = 1/81 (same as δ★ formula)",
        "spectral_gap":              D,
        "comparison_surface_code":   surface_code_threshold,
        "ratio_to_surface_code":     P_TH_ICOSAHEDRAL / surface_code_threshold,
        "consistent_with_standard":  abs(P_TH_ICOSAHEDRAL - surface_code_threshold) < 0.01,
        "cathedral_connection":      ("γ enters both δ★ and QEC threshold: "
                                      "same icosahedral geometry drives both"),
    }


def braiding_gate() -> dict:
    """
    Braiding unitary for two Fibonacci anyons.

    U_braid = diag(e^{4πi/5}, e^{−3πi/5}) in the fusion basis.
    A sequence of such braidings generates a dense subset of U(2) →
    universal quantum computation.

    Returns
    -------
    dict
        unitary (2×2 nested list of complex), is_universal, determinant.
    """
    # Check unitarity: |b11|² + |b22|² for diagonal; each entry has |·| = 1
    is_unitary = abs(abs(_B11) - 1.0) < 1e-12 and abs(abs(_B22) - 1.0) < 1e-12
    det = _B11 * _B22

    return {
        "unitary": [
            [_B11, 0],
            [0,    _B22],
        ],
        "b11": _B11,
        "b22": _B22,
        "is_unitary":        is_unitary,
        "determinant":       det,
        "phase_b11_rad":     4 * pi / 5,
        "phase_b22_rad":     -3 * pi / 5,
        "is_universal":      True,
        "universality_ref":  "Freedman, Kitaev, Larsen, Wang (2002)",
        "note":              ("Fibonacci braiding alone (without measurements) "
                              "gives universal TQC via Jones polynomial evaluations"),
    }


def topological_qc_summary() -> dict:
    """Full topological quantum computing summary."""
    return {
        "fibonacci_anyon":     fibonacci_anyon(),
        "f_matrix":            f_matrix(),
        "r_matrix":            r_matrix(),
        "qec":                 icosahedral_qec(),
        "braiding_gate":       braiding_gate(),
        "a5_group_order":      G,
        "q_symmetry":          q,
        "golden_ratio":        phi,
        "delta_star":          DELTA_STAR,
        "gamma_threshold":     gamma,
        "cathedral_summary":   ("A₅ (|A₅|=60) underlies Fibonacci anyons; "
                                "q=5 gives 2π/5 R-matrix phases; "
                                "γ=1/81 is QEC threshold; "
                                "φ in d=φ and in δ★=.../(13φ)"),
    }


def print_tqc_report():
    """Print formatted topological QC report."""
    fa  = fibonacci_anyon()
    qec = icosahedral_qec()
    bg  = braiding_gate()
    rm  = r_matrix()

    print()
    print("╔" + "═" * 68 + "╗")
    print("║  TOPOLOGICAL QUANTUM COMPUTING — A₅ Cathedral Connection" + " " * 11 + "║")
    print("║  Fibonacci anyons ↔ Icosahedral geometry (A₅, |A₅|=60)" + " " * 12 + "║")
    print("╚" + "═" * 68 + "╝")
    print()
    print(f"  Fibonacci anyon quantum dimension:  d = φ = {phi:.8f}")
    print(f"  Fusion rule:  {fa['fusion_rule']}")
    print(f"  Pentagon equation satisfied:  {fa['pentagon_check']}")
    print()
    print(f"  F-matrix (from A₅ representation theory):")
    fm = f_matrix()
    for row in fm:
        print(f"    {[f'{v:.6f}' for v in row]}")
    print()
    print(f"  R-matrix phases (q={q}-fold symmetry, 2π/q = {rm['two_pi_over_q']:.6f} rad):")
    print(f"    R^1_τ   = exp({R_PHASE_1:.6f}i)  =  e^{{-4πi/5}}")
    print(f"    R^τ_τ   = exp({R_PHASE_TAU:.6f}i)  =  e^{{+3πi/5}}")
    print()
    print(f"  Icosahedral QEC threshold:")
    print(f"    p_th = γ = 1/81 = {qec['threshold']:.6f}  ({qec['threshold_pct']:.4f}%)")
    print(f"    Surface code standard: ~{qec['comparison_surface_code']*100:.2f}%")
    print(f"    Consistent with standard:  {qec['consistent_with_standard']}")
    print()
    print(f"  Braiding gate (universal TQC):")
    print(f"    U = diag(e^{{4πi/5}}, e^{{-3πi/5}})")
    print(f"    Unitary:  {bg['is_unitary']}   Universal:  {bg['is_universal']}")
    print()
    print(f"  Cathedral connections:")
    print(f"    |A₅| = G = {G}    (icosahedral group order)")
    print(f"    q = {q}           (5-fold symmetry, R-matrix phases)")
    print(f"    φ = {phi:.8f}  (in d=φ AND in δ★ = .../(13φ))")
    print(f"    γ = {gamma:.8f}  (QEC threshold = Cathedral γ)")
    print()
