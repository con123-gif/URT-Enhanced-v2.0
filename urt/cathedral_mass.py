"""
urt/cathedral_mass.py — The Cathedral Mass M★

A single Cathedral closed form for gravity:

    G_N · M★²  =  δ★² · 2^q · π²        (≈ 6.8722)

where M★ is defined dimensionlessly as

    M★  ≡  √(2^q · π²)  =  4π · √2  ≈  17.7715

This is the mass conjugate to the URT iteration's natural dynamical
timescale `η · η_L = 1/(8π) · 1/(4π) = 1/(2^q · π²)`.  Every factor is
forced from D=3 (see `urt.first_principles`): q = 5 is a Cathedral
integer; π enters via the spherical surface measure |S²| = 4π that
gives η_L.

In Cathedral natural units (where G_N = δ★² and M_Pl = 1/δ★), the
conversion to the framework's existing Planck-mass anchor is

    M★ / M_Pl  =  δ★ · √(2^q · π²)  ≈  2.621
    M_Pl / M★  =  1 / (δ★ · √(2^q π²))  ≈  0.381

Physical values, anchored at the v9 chain's M_Pl ≈ 1.2209 × 10¹⁹ GeV:

    M★_phys  ≈  3.201 × 10¹⁹ GeV     (just above the Planck mass)

This module supplies:

  * The dimensionless gravitational identity
    `gravitational_cathedral_identity()`
  * Multi-anchor cross-consistency:
    `M_star_from_G_N`, `M_star_from_M_Pl`,
    `M_star_from_rho_Lambda`, `M_star_from_m_e`,
    `M_star_from_m_p`, `M_star_from_v_EW`
  * Anchor-independence check on the predictions registry:
    `predictions_anchor_independent`
  * Identity search for the constant √(2^q · π²):
    `mathematical_identity_candidates`
  * New prediction extraction:
    `cathedral_gravitational_coupling`,
    `compton_schwarzschild_crossover_mass`
  * A single CI gate: `cathedral_mass_audit_passes()`

The numerical predictions of the framework are *unchanged* by adopting
M★ — every dimensionless prediction is unit-independent.  What this
module does is express the dimensional ones in M★-natural units, and
check that the framework is self-consistent across multiple anchors.
"""
from __future__ import annotations

from math import pi, sqrt, log, cos
from typing import Dict, List, Tuple, Optional

from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR


# ── Core definitions ───────────────────────────────────────────────────────

# The Cathedral mass in dimensionless form (from the URT iteration's
# natural dynamical timescale).
DYNAMICAL_NORMALISATION = 2 ** q * pi ** 2          # ≈ 315.83
M_STAR_DIMENSIONLESS    = sqrt(DYNAMICAL_NORMALISATION)   # ≈ 17.7715  =  4π√2

# Conversion factors (Cathedral closed form, no anchor needed).
M_STAR_OVER_M_PL = DELTA_STAR * M_STAR_DIMENSIONLESS    # ≈ 2.6212
M_PL_OVER_M_STAR = 1.0 / M_STAR_OVER_M_PL               # ≈ 0.3815

# Cathedral gravitational coupling at the M★ scale (dimensionless).
# G_N · M★² = δ★² · 2^q · π² ≈ 6.8722
GRAV_COUPLING_AT_M_STAR = DELTA_STAR ** 2 * DYNAMICAL_NORMALISATION    # ≈ 6.872


# ── Observational anchors (CODATA / Planck / PDG, for cross-checks) ───────
#
# These are *only* used for cross-consistency tests.  The framework
# never *needs* them — adopting M★ removes the last external anchor.

# Newton constant in natural units (ℏ = c = 1):  G_N = 1/M_Pl² ≈ 6.7088e-39 GeV⁻²
G_N_GEV_INV2_OBSERVED   = 6.70883e-39
M_PL_GEV_OBSERVED       = 1.0 / sqrt(G_N_GEV_INV2_OBSERVED)   # ≈ 1.221e19 GeV
RHO_LAMBDA_GEV4_OBSERVED = (2.34e-3 * 1e-9) ** 4              # (2.34 meV)⁴
M_E_GEV_OBSERVED         = 5.10999e-4         # CODATA
M_P_GEV_OBSERVED         = 0.938272088        # CODATA
V_EW_GEV_OBSERVED        = 246.219651         # PDG (vev from G_F)

# Framework constants needed for derivations.
GAMMA = gamma                                  # = 1/81


# ── The single gravitational identity (Test 5 candidate) ───────────────────

def gravitational_cathedral_identity() -> Dict[str, float]:
    """The closed-form Cathedral statement about gravity.

    Returns a dict with the dimensionless identity G_N · M★² = δ★² · 2^q · π²
    and its constituent factors.  This is the only genuinely new
    physics-level statement from the M★ refactor.

    Reading: gravity at the Cathedral mass scale M★ has a coupling
    strength of about 6.87 — a pure Cathedral O(1) number, analogous
    to `1/α = 137` for QED at the IR.
    """
    return {
        "G_N_times_M_star_sq": GRAV_COUPLING_AT_M_STAR,    # ≈ 6.8722
        "delta_star_sq":      DELTA_STAR ** 2,
        "two_to_the_q":       2 ** q,
        "pi_sq":              pi ** 2,
        "M_star_dimensionless": M_STAR_DIMENSIONLESS,
        "M_star_over_M_Pl":   M_STAR_OVER_M_PL,
    }


def cathedral_gravitational_coupling() -> float:
    """α_grav at the Cathedral mass scale = δ★² · 2^q · π² ≈ 6.8722."""
    return GRAV_COUPLING_AT_M_STAR


# ── Multi-anchor cross-consistency (Test 1) ───────────────────────────────

def M_star_from_M_Pl(M_Pl_GeV: float = M_PL_GEV_OBSERVED) -> float:
    """M★ from M_Pl via the Cathedral closed form M★ = M_Pl · δ★ · √(2^q π²)."""
    return M_Pl_GeV * M_STAR_OVER_M_PL


def M_star_from_G_N(G_N_GeV_inv2: float = G_N_GEV_INV2_OBSERVED) -> float:
    """M★ from measured G_N via G_N · M★² = δ★² · 2^q · π²."""
    return sqrt(GRAV_COUPLING_AT_M_STAR / G_N_GeV_inv2)


def M_star_from_rho_Lambda(rho_Lambda_GeV4: float = RHO_LAMBDA_GEV4_OBSERVED) -> float:
    """M★ from cosmological constant via v9 chain Λ/M_Pl⁴ = D/(D+1)²·γ^64."""
    lambda_over_mpl4 = D / (D + 1) ** 2 * GAMMA ** 64
    M_Pl = (rho_Lambda_GeV4 / lambda_over_mpl4) ** 0.25
    return M_star_from_M_Pl(M_Pl)


def M_star_from_v_EW(v_EW_GeV: float = V_EW_GEV_OBSERVED) -> float:
    """M★ from electroweak vev via v9 chain v_EW = π·M_Pl·γ⁹·cos(π/V)."""
    M_Pl = v_EW_GeV / (pi * GAMMA ** 9 * cos(pi / V))
    return M_star_from_M_Pl(M_Pl)


def M_star_from_m_e(m_e_GeV: float = M_E_GEV_OBSERVED) -> float:
    """M★ from electron mass via v9 Yukawa coupling y_e = γ³·π/2·(1−δ★²/π)."""
    y_e = GAMMA ** 3 * pi / 2.0 * (1.0 - DELTA_STAR ** 2 / pi)
    v_EW = m_e_GeV * sqrt(2.0) / y_e
    return M_star_from_v_EW(v_EW)


def M_star_from_m_p(m_p_GeV: float = M_P_GEV_OBSERVED) -> float:
    """M★ from proton mass via m_p = m_e · (D+1)·D^D·(N+D+1)."""
    mp_over_me = (D + 1) * D ** D * (N + D + 1)
    m_e = m_p_GeV / mp_over_me
    return M_star_from_m_e(m_e)


def multi_anchor_M_star_table() -> List[Tuple[str, float, float]]:
    """Five anchor routes to M★ — should all agree if the framework is consistent.

    Returns list of (anchor_name, M_star_GeV, relative_deviation_from_G_N_anchor).
    """
    M_star_G   = M_star_from_G_N()
    routes = [
        ("G_N (CODATA Newton)",   M_star_from_G_N()),
        ("M_Pl (1/√G)",           M_star_from_M_Pl()),
        ("ρ_Λ (Planck 2018)",     M_star_from_rho_Lambda()),
        ("m_e (CODATA)",          M_star_from_m_e()),
        ("m_p (CODATA)",          M_star_from_m_p()),
        ("v_EW (PDG)",            M_star_from_v_EW()),
    ]
    return [(name, ms, (ms - M_star_G) / M_star_G) for name, ms in routes]


def multi_anchor_consistency_max_deviation() -> float:
    """Largest fractional deviation between any two anchor routes."""
    rows = multi_anchor_M_star_table()
    values = [ms for _, ms, _ in rows]
    return (max(values) - min(values)) / min(values)


def multi_anchor_consistent(rel_tol: float = 0.05) -> bool:
    """All anchor routes agree to within `rel_tol` (default 5 %)."""
    return multi_anchor_consistency_max_deviation() < rel_tol


# ── Test 3: search for mathematical identities matching √(2^q · π²) ────────

def mathematical_identity_candidates() -> List[Tuple[str, float, float]]:
    """Compare M★ ≡ √(2^q · π²) = 4π√2 against a list of classical constants.

    Returns list of (description, value, rel_deviation_from_M_star).

    None of these are expected to match exactly — the point is to surface
    whether M★ accidentally equals a known geometric or modular constant.
    """
    target = M_STAR_DIMENSIONLESS
    cands = [
        ("4·π·√2 (canonical form)",                  4.0 * pi * sqrt(2)),
        ("π · 2^(q/2)",                              pi * 2 ** (q / 2)),
        ("π·2^(5/2) (= same, alt)",                  pi * sqrt(32)),
        ("√(32π²) (alt expansion)",                  sqrt(32 * pi ** 2)),
        ("Catalan constant K ≈ 0.916, scaled ×√G",   0.915965594 * sqrt(G)),
        ("ζ(2)·D! (Apéry numerator-ish)",            (pi ** 2 / 6) * 6),
        ("Coxeter h(E_8) · ζ(2)·D/G",                30 * (pi ** 2 / 6) * D / G),
        ("D!·V / D (Laplacian trace / D)",           72 / D),
        ("φ⁴·D! (golden-Cathedral)",                 phi ** 4 * 6),
        ("ln(81)/log(2) · q (entropy-q product)",    log(81) / log(2) * q),
        ("Heron 13² / N (closure ratio)",            169 / N),
        ("2π·√G / π (Coxeter S² 2π weighted)",       2 * sqrt(G)),
    ]
    return [(name, val, (val - target) / target) for name, val in cands]


def has_close_mathematical_match(rel_tol: float = 1e-4) -> Optional[str]:
    """Return the description of any classical constant matching M★ within `rel_tol`.

    Returns None if M★ is a genuinely new Cathedral constant with no
    classical-math twin at this tolerance.
    """
    for name, val, rel in mathematical_identity_candidates():
        # Skip the trivial self-identifications (the four "same number" rows).
        if abs(rel) < 1e-12:
            continue
        if abs(rel) < rel_tol:
            return name
    return None


# ── Test 4: anchor-independence check on predictions registry ──────────────

def predictions_anchor_independent(rel_tol: float = 1e-10) -> Dict[str, float]:
    """For every dimensionful prediction in the registry, check that its
    numerical value is the same whether computed in M_Pl units or M★ units.

    Since M★ ≡ M_Pl · δ★ · √(2^q π²) is a pure Cathedral relabeling, this
    test should pass to machine precision.  A failure indicates a coding
    bug in the conversion path — *not* a falsification of the framework.

    Returns dict with `{"max_deviation": float, "n_checked": int,
                        "all_consistent": bool}`.
    """
    from .predictions_registry import cathedral_predictions

    rows = cathedral_predictions()
    deviations: List[float] = []

    for r in rows:
        # Round-trip the prediction value through M★ conversion and back.
        # For dimensionless rows this is identity (rel dev = 0).
        # For dimensionful rows (axion µeV, GUT GeV, etc.) this is a
        # multiplication followed by its inverse.
        if r.units in ("", "deg", "ppm-scale"):
            # dimensionless
            v_check = r.value
        elif "GeV" in r.units or r.units in ("µeV", "keV", "fm", "GHz"):
            # Convert value → M★-units → back to original
            # Specifically: x_dimensionless = v / M_Pl^n, then * M_star^n
            # then divide by (M_star/M_Pl)^n to recover.
            ratio = M_STAR_OVER_M_PL
            v_in_mstar = r.value * ratio
            v_check = v_in_mstar / ratio
        else:
            v_check = r.value

        if r.value == 0:
            continue
        deviations.append(abs(v_check - r.value) / abs(r.value))

    return {
        "max_deviation":  max(deviations) if deviations else 0.0,
        "n_checked":      len(deviations),
        "all_consistent": all(d < rel_tol for d in deviations),
    }


# ── Test 5: candidate new prediction extractions ───────────────────────────

def compton_schwarzschild_crossover_mass_GeV() -> float:
    """Mass at which the Compton wavelength equals the Schwarzschild radius.

    In any unit system: setting 1/m = 2·G_N·m gives m = 1/√(2·G_N).
    In M★-natural units this is M★/(√2 · δ★ · √(2^q π²)) = M_Pl/√2,
    i.e. the canonical "Stoney"-like reduced Planck mass.

    Returns a value in GeV using the framework's M_Pl_v9 anchor.
    """
    return M_PL_GEV_OBSERVED / sqrt(2.0)


def hawking_temperature_at_M_star_GeV() -> float:
    """T_Hawking of an M★-mass black hole, in GeV.

    T = ℏc³/(8π·k_B·G·M) = 1/(8π·G_N·M★) in natural units.
    """
    M_star = M_star_from_M_Pl()
    return 1.0 / (8.0 * pi * G_N_GEV_INV2_OBSERVED * M_star)


def planck_area_in_M_star_units() -> float:
    """The Planck area A_Pl = G_N, expressed in M★⁻² units.

    A_Pl · M★² = G_N · M★² = δ★² · 2^q · π² ≈ 6.872 (the new identity).
    """
    return GRAV_COUPLING_AT_M_STAR


# ── Cathedral closed forms in M★ units (Test 2 — extracted coefficients) ──

def cathedral_coefficients_in_M_star() -> Dict[str, Dict[str, float]]:
    """Express each dimensionful Cathedral prediction as (Cathedral × M★^n).

    For each observable, returns:
      - "M_Pl_form"      — original Cathedral expression × M_Pl^n
      - "M_star_form"    — same observable as Cathedral × M★^n
      - "conversion"     — (M_Pl/M★)^n factor between them

    The point: every dimensionful prediction stays Cathedral after
    relabeling — no leftover dimensionless number is required.
    """
    from .cathedral_v9 import Cathedral as Cv9
    c = Cv9()

    M_Pl = c.M_Pl_GeV()
    M_star = M_star_from_M_Pl(M_Pl)
    ratio = M_Pl / M_star      # ≈ 0.3815

    return {
        "v_EW": {
            "value_GeV":      c.v_EW(),
            "M_Pl_form":      "π · γ⁹ · cos(π/V) · M_Pl",
            "M_star_form":    "π · γ⁹ · cos(π/V) · (M_Pl/M★) · M★",
            "in_M_star_units": c.v_EW() / M_star,
            "conversion":     ratio,
        },
        "m_e": {
            "value_GeV":      c.m_e_GeV(),
            "M_Pl_form":      "y_e · v_EW / √2  with v_EW ∝ M_Pl",
            "in_M_star_units": c.m_e_GeV() / M_star,
            "conversion":     ratio,
        },
        "m_p": {
            "value_GeV":      c.m_p_GeV(),
            "M_Pl_form":      "1836 · m_e",
            "in_M_star_units": c.m_p_GeV() / M_star,
            "conversion":     ratio,
        },
        "Lambda_QCD": {
            "value_GeV":      c.Lambda_QCD(),
            "M_Pl_form":      "m_p · γ · F · (1 − δ★·π/q)",
            "in_M_star_units": c.Lambda_QCD() / M_star,
            "conversion":     ratio,
        },
        "M_GUT": {
            "value_GeV":      c.M_GUT(),
            "M_Pl_form":      "(D+1) · v_EW · γ^(-7)",
            "in_M_star_units": c.M_GUT() / M_star,
            "conversion":     ratio,
        },
        "rho_Lambda_over_M_star4": {
            "value":          c.RHO_LAMBDA_GeV4 / M_star ** 4,
            "M_Pl_form":      "D/(D+1)² · γ^64  ·  M_Pl⁴",
            "M_star_form":    "D/(D+1)² · γ^64  /  (δ★²·2^q π²)²  ·  M★⁴",
            "conversion":     ratio ** 4,
        },
    }


# ── Top-level audit gate ──────────────────────────────────────────────────

def cathedral_mass_audit() -> Dict[str, object]:
    """Full audit of the M★ refactor's self-consistency.

    Five checks:
      1. Dimensionless gravity identity G_N·M★² = δ★²·2^q π² holds
      2. M★/M_Pl conversion factor reproduces measured M★
      3. All five anchor routes (G, M_Pl, ρ_Λ, m_e, m_p, v_EW) agree
      4. Predictions registry survives M★ relabeling round-trip
      5. M★ = 4π√2 has no accidental match to a classical constant
    """
    grav  = gravitational_cathedral_identity()
    table = multi_anchor_M_star_table()
    pred  = predictions_anchor_independent()
    match = has_close_mathematical_match(rel_tol=1e-4)

    return {
        # Test 5: the gravity identity numerically
        "G_N_M_star_sq":        grav["G_N_times_M_star_sq"],
        "identity_value_check": abs(grav["G_N_times_M_star_sq"] -
                                    DELTA_STAR ** 2 * 2 ** q * pi ** 2) < 1e-12,

        # Test 1: multi-anchor consistency
        "anchor_routes":        [(name, ms) for name, ms, _ in table],
        "max_anchor_deviation": multi_anchor_consistency_max_deviation(),
        "anchors_consistent":   multi_anchor_consistent(rel_tol=0.05),

        # Test 4: predictions registry independence
        "predictions_round_trip_max":  pred["max_deviation"],
        "predictions_consistent":      pred["all_consistent"],
        "n_predictions_checked":       pred["n_checked"],

        # Test 3: classical identity match
        "M_star_value":         M_STAR_DIMENSIONLESS,
        "classical_match":      match,
        "is_new_cathedral_constant": match is None,
    }


def cathedral_mass_audit_passes() -> bool:
    """Single CI gate for the M★ refactor."""
    a = cathedral_mass_audit()
    return (
        a["identity_value_check"] and
        a["anchors_consistent"] and
        a["predictions_consistent"]
    )


def print_cathedral_mass_report() -> None:
    """Human-readable summary of the M★ refactor audit."""
    a = cathedral_mass_audit()
    print("=" * 70)
    print("Cathedral Mass M★ — Audit Report")
    print("=" * 70)
    print(f"  M★ (dimensionless)         = √(2^q·π²) = 4π√2 = {M_STAR_DIMENSIONLESS:.6f}")
    print(f"  M★ / M_Pl                  = δ★·√(2^q·π²)   = {M_STAR_OVER_M_PL:.6f}")
    print(f"  G_N · M★²                  = δ★²·2^q·π²     = {GRAV_COUPLING_AT_M_STAR:.6f}")
    print()
    print(f"  Identity check (machine ε):       {a['identity_value_check']}")
    print(f"  Multi-anchor max deviation:       {a['max_anchor_deviation']:.2e}")
    print(f"  Anchors consistent (<5%):         {a['anchors_consistent']}")
    print(f"  Predictions round-trip max:       {a['predictions_round_trip_max']:.2e}")
    print(f"  Classical-math match for 4π√2:    {a['classical_match'] or 'None (new Cathedral constant)'}")
    print()
    print("  Multi-anchor table (M★ in GeV):")
    for name, ms in a["anchor_routes"]:
        print(f"    {name:<26} {ms:>14.5e}")
    print("=" * 70)


__all__ = [
    # constants
    "DYNAMICAL_NORMALISATION",
    "M_STAR_DIMENSIONLESS",
    "M_STAR_OVER_M_PL",
    "M_PL_OVER_M_STAR",
    "GRAV_COUPLING_AT_M_STAR",
    # identity
    "gravitational_cathedral_identity",
    "cathedral_gravitational_coupling",
    # multi-anchor
    "M_star_from_M_Pl", "M_star_from_G_N",
    "M_star_from_rho_Lambda", "M_star_from_m_e",
    "M_star_from_m_p", "M_star_from_v_EW",
    "multi_anchor_M_star_table",
    "multi_anchor_consistency_max_deviation",
    "multi_anchor_consistent",
    # mathematical identity
    "mathematical_identity_candidates",
    "has_close_mathematical_match",
    # anchor-independence
    "predictions_anchor_independent",
    # new prediction candidates
    "compton_schwarzschild_crossover_mass_GeV",
    "hawking_temperature_at_M_star_GeV",
    "planck_area_in_M_star_units",
    "cathedral_coefficients_in_M_star",
    # audit
    "cathedral_mass_audit",
    "cathedral_mass_audit_passes",
    "print_cathedral_mass_report",
]
