"""
Muon Anomalous Magnetic Moment — a_μ = (g_μ − 2)/2
Cathedral prediction via EW sector (K4 k=2) and H3 NP constraint.

Key Cathedral prediction: sin²θ_W = (D/N)(1+γ/2π) = 0.23122 enters the EW
1-loop correction through the bracket [1 + (1/5)(1−4sin²θ_W)²].
The H3 NP sector provides a constraint on the WIMP coupling y_NP.
"""

from math import pi, sqrt, log
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi
from .electroweak import G_FERMI, SIN2_THETA_W, M_W_GEV, M_Z_GEV

# ── Fundamental constants ────────────────────────────────────────────────────
M_MU_GEV       = 0.1056583755       # muon mass [GeV] (measured input)
ALPHA_EM       = 1 / 137.035999084  # fine-structure constant at q²=0 (Cathedral 1/α)
A_MU_EXP       = 1.16592061e-3      # Fermilab 2023 measurement
A_MU_EXP_ERR   = 4.1e-10            # experimental uncertainty

# ── QED contributions ────────────────────────────────────────────────────────
# Schwinger 1-loop (1948): a_μ^(1) = α/2π
A_MU_1LOOP = ALPHA_EM / (2 * pi)   # ≈ 1.1614e-3

# Petermann 1957 two-loop coefficient:
# C₂ = 197/144 + π²/12 − π²/4·ln2 + 3ζ(3)/4
# ζ(3) = Apéry's constant = 1.2020569...
_ZETA3 = 1.2020569031595942
C2_QED = 197 / 144 + pi**2 / 12 - pi**2 / 4 * log(2) + 3 * _ZETA3 / 4
A_MU_2LOOP = (ALPHA_EM / pi)**2 * C2_QED

# Total QED (1+2 loop) — hadronic/higher order are small corrections
A_MU_QED_SM = A_MU_1LOOP + A_MU_2LOOP   # dominant SM prediction without hadronic

# ── Electroweak 1-loop (Czarnecki–Marciano) ──────────────────────────────────
def _ew_1loop():
    """a_μ^EW(1L) = 5·G_F·m_μ²/(24π²√2)·[1 + (1/5)(1−4sin²θ_W)²]"""
    prefactor = 5 * G_FERMI * M_MU_GEV**2 / (24 * pi**2 * sqrt(2))
    bracket   = 1 + (1 / 5) * (1 - 4 * SIN2_THETA_W)**2
    return prefactor * bracket

A_MU_EW_1L      = _ew_1loop()        # ≈ 194×10⁻¹¹
EW_2LOOP_FACTOR = 0.788              # Czarnecki & Marciano 2001 renormalization
A_MU_EW         = A_MU_EW_1L * EW_2LOOP_FACTOR  # ≈ 153×10⁻¹¹

# ── Cathedral NP / H3 sector ─────────────────────────────────────────────────
# WIMP from dark_matter.py: k=9,10 shell, m_WIMP = δ★·m_Z ≈ 13.45 GeV
M_WIMP_GEV = DELTA_STAR * M_Z_GEV   # Cathedral WIMP mass

# Current world-average discrepancy (Δa_μ = a_μ^exp − a_μ^SM):
# BNL+Fermilab: Δa_μ ≈ 2.51×10⁻⁹  (using BMW hadronic input reduces this)
A_MU_DISCREPANCY = 2.51e-9           # conservative SM discrepancy


# ── Functions ────────────────────────────────────────────────────────────────

def qed_contribution() -> dict:
    """
    QED contributions to a_μ.

    Returns
    -------
    dict
        1loop (Schwinger), 2loop (Petermann), total_qed, C2_qed, alpha_used.
    """
    return {
        "1loop":       A_MU_1LOOP,
        "2loop":       A_MU_2LOOP,
        "C2_qed":      C2_QED,
        "total_qed":   A_MU_1LOOP + A_MU_2LOOP,
        "alpha_used":  ALPHA_EM,
        "schwinger":   ALPHA_EM / (2 * pi),
        "note":        "Dominant SM contribution; 1loop = α/2π (Schwinger 1948)",
    }


def ew_contribution() -> dict:
    """
    Electroweak 1-loop and effective 2-loop correction to a_μ.

    Cathedral sensitivity: sin²θ_W = (D/N)(1+γ/2π) = 0.23122 enters
    the bracket [1 + (1/5)(1−4sin²θ_W)²].

    Returns
    -------
    dict
        1loop, factor_2loop, total_ew, sin2w_used, sensitivity, bracket.
    """
    bracket     = 1 + (1 / 5) * (1 - 4 * SIN2_THETA_W)**2
    prefactor   = 5 * G_FERMI * M_MU_GEV**2 / (24 * pi**2 * sqrt(2))
    # Sensitivity: d(a_EW^1L)/d(sin²θ_W)
    #   = prefactor × d/d(sin²θ_W) [1 + (1/5)(1-4s²)²]
    #   = prefactor × (1/5)·2·(1-4s²)·(-4) = -8/5·prefactor·(1-4s²)
    dsens = -8 / 5 * prefactor * (1 - 4 * SIN2_THETA_W)

    return {
        "1loop":          A_MU_EW_1L,
        "factor_2loop":   EW_2LOOP_FACTOR,
        "total_ew":       A_MU_EW,
        "sin2w_used":     SIN2_THETA_W,
        "bracket":        bracket,
        "prefactor":      prefactor,
        "sensitivity":    dsens,          # d(a_EW)/d(sin²θ_W)
        "G_fermi_used":   G_FERMI,
        "m_mu_used":      M_MU_GEV,
        "note":           ("Cathedral sin²θ_W=(D/N)(1+γ/2π) enters bracket; "
                           "EW 2-loop factor 0.788 from Czarnecki-Marciano 2001"),
    }


def np_h3_constraint() -> dict:
    """
    H3 New Physics constraint: what scalar coupling y_NP explains Δa_μ?

    For a scalar loop with M_WIMP >> m_μ:
        Δa_μ ≈ y_NP² · m_μ² / (4π² · M_WIMP²) × ln(M_WIMP²/m_μ²)

    Cathedral WIMP: M_WIMP = δ★ · m_Z ≈ 13.45 GeV (k=9,10 H3 mode).

    Returns
    -------
    dict
        y_np_required, wimp_mass_gev, log_factor, delta_a_mu_target.
    """
    log_factor   = log(M_WIMP_GEV**2 / M_MU_GEV**2)
    loop_factor  = M_MU_GEV**2 / (4 * pi**2 * M_WIMP_GEV**2)
    # y_NP² · loop_factor · log_factor = Δa_μ  →  y_NP = sqrt(Δa_μ / (loop_factor × ln))
    y_np_sq      = A_MU_DISCREPANCY / (loop_factor * log_factor)
    y_np         = sqrt(abs(y_np_sq))

    return {
        "delta_a_mu_target":  A_MU_DISCREPANCY,
        "wimp_mass_gev":      M_WIMP_GEV,
        "wimp_mass_formula":  "δ★·m_Z",
        "log_factor":         log_factor,
        "loop_factor":        loop_factor,
        "y_np_required":      y_np,
        "y_np_squared":       y_np_sq,
        "perturbative":       y_np < sqrt(4 * pi),   # perturbativity check
        "note":               ("Scalar loop approximation valid for M_WIMP >> m_μ; "
                               "k=9,10 H3 shell from Cathedral dark_matter sector"),
    }


def g2_summary() -> dict:
    """
    Full a_μ summary: QED + EW + NP H3 + experimental comparison.

    Returns
    -------
    dict
        All contributions, experimental value, discrepancy.
    """
    qed = qed_contribution()
    ew  = ew_contribution()
    np  = np_h3_constraint()

    total_theory = qed["total_qed"] + ew["total_ew"]
    discrepancy  = A_MU_EXP - total_theory

    return {
        "qed":                 qed,
        "electroweak":         ew,
        "np_h3":               np,
        "a_mu_exp":            A_MU_EXP,
        "a_mu_exp_err":        A_MU_EXP_ERR,
        "a_mu_qed":            qed["total_qed"],
        "a_mu_ew":             ew["total_ew"],
        "a_mu_theory_partial": total_theory,
        "discrepancy":         discrepancy,
        "significance_sigma":  abs(discrepancy) / A_MU_EXP_ERR,
        "cathedral_prediction": ("EW contribution depends on sin²θ_W = "
                                 f"{SIN2_THETA_W:.5f} (Cathedral K4 k=2)"),
        "delta_star_used":     DELTA_STAR,
        "alpha_em_used":       ALPHA_EM,
    }


def print_g2_report():
    """Print a formatted muon g-2 report."""
    s = g2_summary()
    qed = s["qed"]
    ew  = s["electroweak"]
    np  = s["np_h3"]

    print()
    print("╔" + "═" * 68 + "╗")
    print("║  MUON ANOMALOUS MAGNETIC MOMENT — Cathedral EW + H3 NP" + " " * 12 + "║")
    print("║  a_μ = (g_μ−2)/2   [Fermilab 2023]" + " " * 32 + "║")
    print("╚" + "═" * 68 + "╝")
    print()
    print(f"  QED contributions:")
    print(f"    1-loop Schwinger:  α/2π = {qed['1loop']:.6e}")
    print(f"    2-loop Petermann:  (α/π)²·C₂ = {qed['2loop']:.4e}  (C₂={qed['C2_qed']:.5f})")
    print(f"    Total QED:         {qed['total_qed']:.6e}")
    print()
    print(f"  Electroweak corrections (Cathedral K4 k=2):")
    print(f"    sin²θ_W = (D/N)(1+γ/2π) = {ew['sin2w_used']:.5f}")
    print(f"    Bracket [1+(1/5)(1-4s²)²] = {ew['bracket']:.6f}")
    print(f"    EW 1-loop:         {ew['1loop']:.4e}  (≈{ew['1loop']*1e11:.1f}×10⁻¹¹)")
    print(f"    2-loop factor:     {ew['factor_2loop']}")
    print(f"    EW total:          {ew['total_ew']:.4e}  (≈{ew['total_ew']*1e11:.1f}×10⁻¹¹)")
    print()
    print(f"  Experimental (Fermilab 2023):")
    print(f"    a_μ^exp  = {s['a_mu_exp']:.8e}")
    print(f"    a_μ^err  = {s['a_mu_exp_err']:.1e}")
    print(f"    Discrepancy (QED+EW only): Δa_μ = {s['discrepancy']:.4e}")
    print()
    print(f"  H3 NP constraint (Cathedral WIMP, k=9,10):")
    print(f"    M_WIMP = δ★·m_Z = {np['wimp_mass_gev']:.3f} GeV")
    print(f"    ln(M²/m_μ²) = {np['log_factor']:.4f}")
    print(f"    Required coupling: y_NP = {np['y_np_required']:.4f}")
    print(f"    Perturbative: {np['perturbative']}")
    print()
    print(f"  δ★ = {DELTA_STAR:.8f}  (icosahedral constant)")
    print(f"  α  = 1/{1/ALPHA_EM:.6f}  (Cathedral fine-structure)")
    print()
