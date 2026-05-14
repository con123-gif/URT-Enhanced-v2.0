"""
urt/cathedral_mass_external.py — Testing M★ against established physics

The M★ refactor's strongest claim is that the framework's unit is
*internally forced* (from D=3 + spherical geometry) rather than
*externally measured* (M_Pl from G).  If that's right, then expressing
*independently measured* physical scales — masses, temperatures, energy
densities — in M★ units should reveal Cathedral structure that wasn't
visible in M_Pl units.

This module runs five external validation programs:

  A. γ-LADDER PLACEMENT
     For every measured SM mass, T_CMB, ρ_Λ^(1/4), and H_0,
     compute the γ-exponent k such that M_obs / M★ ≈ γ^k.
     Check whether k is a Cathedral integer.

  B. PREFACTOR EXTRACTION
     Given the closest Cathedral integer k, extract the prefactor
     α = (M_obs / M★) / γ^k and identify whether α matches a
     Cathedral O(1) number.

  C. CROSS-COMPARISON WITH OTHER NATURAL UNITS
     Compare M★ against Planck, reduced-Planck (M_Pl/√(8π)),
     Stoney mass.  Surface any clean Cathedral ratios.

  D. M★-MASS BLACK HOLE THERMODYNAMICS
     Closed-form Cathedral expressions for an M★-mass black hole:
     entropy S_BH, Hawking temperature, surface gravity.

  E. THOROUGH MATHEMATICAL IDENTITY SEARCH
     Compare M★ = 4π√2 ≈ 17.7715 against ~50 classical constants
     (Catalan, Apéry's ζ(3), Khinchin, Glaisher-Kinkelin, …).
"""
from __future__ import annotations

from math import pi, sqrt, log, log2, log10, exp, cos, sin
from typing import Dict, List, Tuple, Optional

from .shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR
from .cathedral_mass import M_STAR_DIMENSIONLESS, M_STAR_OVER_M_PL, M_PL_GEV_OBSERVED


# ── External observational data (PDG/CODATA/Planck) ───────────────────────
# Values in GeV (or dimensionless).  Sources noted inline.

# M★ in GeV via the gravity anchor.
M_STAR_GEV = M_PL_GEV_OBSERVED * M_STAR_OVER_M_PL    # ≈ 3.20 × 10¹⁹ GeV

# Standard-Model particle masses (PDG 2022)
SM_MASSES_GEV: Dict[str, float] = {
    "m_e":      5.10999e-4,
    "m_mu":     0.105658,
    "m_tau":    1.77686,
    "m_u":      2.16e-3,
    "m_d":      4.67e-3,
    "m_s":      93.4e-3,
    "m_c":      1.27,
    "m_b":      4.18,
    "m_t":      172.69,
    "m_W":      80.379,
    "m_Z":      91.188,
    "m_H":      125.10,
    "m_p":      0.938272088,
    "Lambda_QCD": 0.210,
    "v_EW":     246.219651,
}

# Cosmological scales (Planck 2018)
COSMO_SCALES_GEV: Dict[str, float] = {
    "T_CMB":              2.7255 * 8.617e-14,    # 2.348e-13 GeV
    "rho_Lambda^(1/4)":   2.34e-12,              # (2.34 meV)
    "H_0":                67.36e3 / 3.0857e22 * 6.5821e-25,   # 1.44e-42 GeV
}

# Other natural unit definitions for cross-comparison
NATURAL_UNITS_GEV: Dict[str, float] = {
    "M_Pl (1/√G)":             M_PL_GEV_OBSERVED,
    "M̄_Pl reduced (M_Pl/√8π)": M_PL_GEV_OBSERVED / sqrt(8.0 * pi),
    "M_string (heterotic ~)":  1.0e17,
    "M_GUT (Cathedral v9)":    3.73e16,
    "M_Stoney (e²/G)^(1/2)":   M_PL_GEV_OBSERVED * sqrt(1.0 / 137.036),   # ≈ M_Pl·√α
    "M_Compton-Schwarz":       M_PL_GEV_OBSERVED / sqrt(2.0),
}


# ── A: γ-ladder placement of measured scales in M★ units ──────────────────

def gamma_exponent_in_M_star(M_obs_GeV: float) -> float:
    """If M_obs / M★ = γ^k, return k.  Pure logarithm in γ = 1/81."""
    if M_obs_GeV <= 0 or M_obs_GeV >= M_STAR_GEV:
        return 0.0
    return log(M_obs_GeV / M_STAR_GEV) / log(gamma)


def closest_cathedral_integer(k: float) -> Tuple[int, float]:
    """Round k to nearest Cathedral integer and return (int, deviation).

    Cathedral integers tested: D, q, V, N, E, F, G + classical integer
    combinations  D², 2^q, N+D+1, (D+1)·V, 2·V, D!·V, etc.
    """
    cathedral_ks = sorted({
        D, q, D+1, V, D!=0 and 2**q, N, N+D+1, V+D, V+q,
        D*D, D**D, 2*V, D*q, E, F, F+D, F+V, G,
        # Negative / fractional rarely useful, but include a few small ones
        D-1, D-2, q-D, V-D,
    })
    closest = min(cathedral_ks, key=lambda c: abs(k - c))
    return closest, abs(k - closest)


def gamma_ladder_table() -> List[Tuple[str, float, float, int, float]]:
    """For every measured scale, return (name, GeV, γ-exponent k, closest Cathedral
    integer, |Δ|).

    Reading: closest-Cathedral-integer rows with |Δ| < 0.5 are
    "Cathedral-natural placements"; larger |Δ| means the prefactor
    soaks up the residue.
    """
    out: List[Tuple[str, float, float, int, float]] = []
    all_scales = {**SM_MASSES_GEV, **COSMO_SCALES_GEV}
    for name, val in all_scales.items():
        k = gamma_exponent_in_M_star(val)
        nearest, dev = closest_cathedral_integer(k)
        out.append((name, val, k, nearest, dev))
    return out


def cathedral_natural_placements(tolerance: float = 0.5) -> List[str]:
    """Return scales that fall within `tolerance` of a Cathedral integer
    in the γ-ladder when expressed in M★ units.
    """
    return [name for name, _, _, _, dev in gamma_ladder_table()
            if dev < tolerance]


# ── B: Prefactor extraction and Cathedral identification ──────────────────

# A small library of Cathedral O(1) prefactor candidates.
PREFACTOR_LIBRARY: Dict[str, float] = {
    "1":           1.0,
    "1/2":         0.5,
    "2":           2.0,
    "D":           float(D),         # 3
    "1/D":         1.0 / D,
    "D+1 = 4":     float(D + 1),
    "q = 5":       float(q),
    "1/q":         1.0 / q,
    "q/D":         q / D,
    "D/q":         D / q,
    "D/N":         D / N,
    "8/9":         8.0 / 9.0,
    "D!·V/G":      6 * V / G,        # 1.2
    "(D+1)/(D!+D)": (D+1)/(D*(D-1)*(D-2) if D > 2 else 1 + D),  # 4/9 fingerprint
    "π":           pi,
    "1/π":         1.0 / pi,
    "2π":          2.0 * pi,
    "π/2":         pi / 2.0,
    "π/D":         pi / D,
    "π²":          pi ** 2,
    "1/π²":        1.0 / pi ** 2,
    "φ":           phi,
    "1/φ":         1.0 / phi,
    "φ²":          phi ** 2,
    "1/φ²":        1.0 / phi ** 2,
    "δ★":         DELTA_STAR,
    "1/δ★":       1.0 / DELTA_STAR,
    "cos(π/V)":    cos(pi / V),
}


def best_prefactor_match(alpha: float, tol_pct: float = 5.0) -> Tuple[str, float]:
    """Find the closest Cathedral-primitive expression for a numerical prefactor.

    Returns (name, relative_error_in_percent).  An err < tol_pct counts
    as a "clean" match.
    """
    if alpha == 0:
        return ("0 — zero exactly", 0.0)
    best_name = "?"
    best_err = float("inf")
    for name, val in PREFACTOR_LIBRARY.items():
        if val == 0:
            continue
        err = 100.0 * abs(alpha - val) / abs(alpha)
        if err < best_err:
            best_err = err
            best_name = name
    return best_name, best_err


def prefactor_extraction_table() -> List[Tuple[str, float, int, float, str, float]]:
    """For each scale, compute α = (M_obs/M★)/γ^k (where k = nearest Cathedral)
    and the best Cathedral-primitive match.

    Returns (name, M_obs_GeV, k, alpha, best_match, err_pct).
    """
    out = []
    for name, val, k_float, k_int, dev in gamma_ladder_table():
        # Skip rows where γ-ladder placement is too sloppy
        if dev > 1.0:
            continue
        alpha = (val / M_STAR_GEV) / gamma ** k_int
        match_name, match_err = best_prefactor_match(alpha)
        out.append((name, val, k_int, alpha, match_name, match_err))
    return out


def clean_prefactor_count(tol_pct: float = 10.0) -> int:
    """Count scales whose M★-unit prefactor matches a Cathedral O(1) to tol_pct."""
    return sum(1 for *_, err in prefactor_extraction_table() if err < tol_pct)


# ── C: Cross-comparison with other natural-unit systems ───────────────────

def M_star_ratios_to_natural_units() -> List[Tuple[str, float, float]]:
    """M★ vs other natural-unit definitions.

    Returns (name, ratio M★/X, log10(M★/X)).
    """
    out = []
    for name, val in NATURAL_UNITS_GEV.items():
        r = M_STAR_GEV / val
        out.append((name, r, log10(r)))
    return out


def search_cathedral_ratio(target: float, tol_pct: float = 2.0) -> Optional[str]:
    """Find a Cathedral closed form for a numerical ratio.

    Checks combinations of {δ★, √(2^q π²), √(8π), 1/φ, ...} that can
    appear in unit-conversion factors.
    """
    candidates = {
        "1":              1.0,
        "M_STAR_OVER_M_PL":   M_STAR_OVER_M_PL,
        "1/M_STAR_OVER_M_PL": 1.0 / M_STAR_OVER_M_PL,
        "√(8π)":         sqrt(8.0 * pi),
        "M★/M̄_Pl = δ★·√(2^q·8π³)":  DELTA_STAR * sqrt(2**q * 8 * pi**3),
        "1/√α (α=1/137)": sqrt(137.0),
        "N = 13":         float(N),
        "1/φ":            1.0 / phi,
        "2π":             2.0 * pi,
        "D!·V":           6 * V,        # 72
        "16·δ★·π^(3/2)":  16 * DELTA_STAR * pi**1.5,
    }
    for name, val in candidates.items():
        err = 100.0 * abs(target - val) / abs(target) if target != 0 else 0
        if err < tol_pct:
            return f"{name} (err {err:.2f}%)"
    return None


# ── D: M★-mass black hole thermodynamics ──────────────────────────────────

def M_star_bh_entropy() -> float:
    """Bekenstein-Hawking entropy of an M★-mass black hole in k_B units.

    S_BH = A/(4G_N) = 4π·G_N·M★² = 4π · (δ★² · 2^q · π²) = 2^(q+2) · π³ · δ★²
    """
    return 4.0 * pi * DELTA_STAR ** 2 * 2 ** q * pi ** 2


def M_star_bh_hawking_temperature_GeV() -> float:
    """T_H of an M★-mass black hole, in GeV.

    T_H = 1/(8π·G_N·M) = M★ / (8π · δ★² · 2^q · π²)
        = M★ / (2^(q+3) · π³ · δ★²)
    """
    return M_STAR_GEV / (2 ** (q + 3) * pi ** 3 * DELTA_STAR ** 2)


def M_star_bh_surface_gravity_GeV() -> float:
    """κ = 1/(4·G_N·M) at M = M★, in GeV.

    κ = M★ / (4 · δ★² · 2^q · π²) = M★ / (2^(q+2) · π² · δ★²)
    """
    return M_STAR_GEV / (4.0 * DELTA_STAR ** 2 * 2 ** q * pi ** 2)


def M_star_bh_thermo_summary() -> Dict[str, float]:
    """All thermodynamic quantities of an M★-mass black hole."""
    return {
        "S_BH_kB":             M_star_bh_entropy(),
        "S_BH_closed_form":    2 ** (q + 2) * pi ** 3 * DELTA_STAR ** 2,
        "T_Hawking_GeV":       M_star_bh_hawking_temperature_GeV(),
        "T_Hawking_M_star":    1.0 / (2 ** (q + 3) * pi ** 3 * DELTA_STAR ** 2),
        "kappa_GeV":           M_star_bh_surface_gravity_GeV(),
        "r_Schwarzschild_GeV_inv": 2.0 * M_STAR_GEV / M_PL_GEV_OBSERVED ** 2,
    }


# ── E: Thorough mathematical identity search for 4π√2 ──────────────────────

def thorough_classical_identity_search() -> List[Tuple[str, float, float]]:
    """Compare M★ ≡ 4π√2 ≈ 17.7715 against ~50 classical constants.

    Returns (description, value, rel_deviation).  Sorted by |rel_dev|.
    """
    target = M_STAR_DIMENSIONLESS

    # Approximate values of classical constants (to ~10 digits).
    CATALAN     = 0.9159655942
    APERY_ZETA3 = 1.2020569032
    KHINCHIN    = 2.6854520010
    GLAISHER    = 1.2824271291
    EULER_MASC  = 0.5772156649
    LANDAU_RAMA = 0.7642236535
    FEIGENBAUM_d= 4.6692016091
    FEIGENBAUM_a= 2.5029078750
    SILVER_RATIO= 1.0 + sqrt(2.0)
    PLASTIC_RAT = 1.3247179572
    OMEGA_CONST = 0.5671432904
    DEHN_INV    = pi ** 2 / 6.0    # ζ(2)

    cands: List[Tuple[str, float]] = [
        # Trivial identifications (zero-deviation rows)
        ("4π√2  (canonical)",            4.0 * pi * sqrt(2)),
        ("π·2^(q/2)",                    pi * 2 ** (q / 2)),
        ("√(2^q · π²) = √(32 π²)",        sqrt(2 ** q * pi ** 2)),
        # Powers of φ
        ("φ⁴ · D!",                       phi ** 4 * 6),
        ("φ⁵ · 2",                        phi ** 5 * 2),
        ("φ⁶",                            phi ** 6),
        # ζ-values
        ("ζ(2)·D!",                       pi ** 2 / 6 * 6),
        ("ζ(2)²·D!",                      (pi ** 2 / 6) ** 2 * 6),
        ("ζ(3)·V",                        APERY_ZETA3 * V),
        ("ζ(4)·G/q",                      pi ** 4 / 90 * G / q),
        # Coxeter / Lie
        ("h(E_6)·ζ(2)·D/G",               12 * pi ** 2 / 6 * D / G),
        ("h(E_8) = E",                    float(E)),
        ("h(E_8)·ζ(2)/π",                 E * pi / 6),
        ("h(E_8)·φ/D",                    E * phi / D),
        # Sphere-packing / lattices
        ("kissing K(8) = V·F",            float(V * F)),
        ("Leech dim = 2V",                float(2 * V)),
        ("Niemeier count = 2V",           24.0),
        # Modular / number theory
        ("Eisenstein E_4 lead /q",        240.0 / q),
        ("Mathieu order M_12 / G",        95040.0 / G),
        ("Riemann zero t_1 · D",          14.134725 * D / 2.4),
        # Combinatorial
        ("Bell B(q) = q",                 float(q)),
        ("Catalan C(D) = q",              float(q)),
        ("Mersenne M_q · √2",             31 * sqrt(2) / V * pi,),
        # Continued fractions
        ("CF(π) third partial quot D·q",  float(D * q)),
        ("CF(e) period at D, 2D, 3D",     float(D + D + D - 1)),
        # Other transcendentals
        ("Khinchin K",                    KHINCHIN),
        ("Khinchin K · 2π",               KHINCHIN * 2 * pi),
        ("Glaisher-Kinkelin A",           GLAISHER),
        ("Catalan G · sqrt(G)",           CATALAN * sqrt(G)),
        ("Apéry ζ(3)·V",                  APERY_ZETA3 * V),
        ("Feigenbaum δ·D!",               FEIGENBAUM_d * 6),
        ("Feigenbaum α·q",                FEIGENBAUM_a * q),
        ("Silver ratio · q",              SILVER_RATIO * q),
        ("Plastic ratio · V",             PLASTIC_RAT * V),
        ("Omega constant · π²",           OMEGA_CONST * pi ** 2),
        # Cathedral-adjacent combinations
        ("D!·V / D",                      72.0 / D),
        ("D!·V / 4",                      72.0 / 4),
        ("(D+1)·V = 48",                  float((D+1) * V)),
        ("(D+1)·V / D",                   float((D+1) * V) / D),
        ("2N / √2",                       2 * N / sqrt(2)),
        ("Heron 13² / N",                 169 / N),
        ("2π·√G",                         2 * pi * sqrt(G)),
        ("2π · D!",                       2 * pi * 6),
        ("V + q = 17",                    17.0),
        ("(N+D+1) + 1",                   float(N + D + 2)),
        ("ln(81) · q = ln(γ⁻¹)·q",        log(81) * q,),
        # Pythagorean triples
        ("(q,V,N)·2π/N",                  2 * pi * sqrt(q*q + V*V) / N),
        # Polylogarithms
        ("Li_2(1/φ) · D!",                (pi**2/15 - log(phi)**2 / 2) * 6),
        # Selberg etc.
        ("Selberg √8π",                   sqrt(8 * pi)),
    ]

    out = []
    for name, val in cands:
        rel = (val - target) / target if target != 0 else 0.0
        out.append((name, val, rel))
    out.sort(key=lambda r: abs(r[2]))
    return out


def best_classical_match_for_M_star(tol_rel: float = 1e-4) -> Optional[str]:
    """Return the best non-trivial classical match for 4π√2, if any.

    "Trivial" = a different way of writing 4π√2 itself (e.g. √(32π²)).
    """
    for name, _, rel in thorough_classical_identity_search():
        if abs(rel) < 1e-12:
            continue       # trivial restatement
        if abs(rel) < tol_rel:
            return f"{name} (rel dev {rel:+.2e})"
    return None


# ── Top-level external audit ──────────────────────────────────────────────

def external_validation_audit() -> Dict[str, object]:
    """Full external-validation audit of the M★ refactor."""
    gamma_table = gamma_ladder_table()
    pref_table  = prefactor_extraction_table()

    return {
        # γ-ladder placement
        "n_scales_tested":         len(gamma_table),
        "n_cathedral_placements":  len(cathedral_natural_placements(tolerance=0.5)),
        "cathedral_placements":    cathedral_natural_placements(tolerance=0.5),
        # Prefactor extraction
        "n_prefactors_clean":      clean_prefactor_count(tol_pct=10.0),
        "n_prefactors_examined":   len(pref_table),
        # Math identity search
        "best_classical_match":    best_classical_match_for_M_star(tol_rel=1e-3),
        "n_classical_constants_tested": len(thorough_classical_identity_search()),
        # M★ BH thermodynamics
        "M_star_BH_entropy":       M_star_bh_entropy(),
        "M_star_BH_entropy_closed_form": "2^(q+2) · π³ · δ★²",
        # cross-comparison
        "M_star_over_M_red_Pl":    M_STAR_GEV / (M_PL_GEV_OBSERVED / sqrt(8*pi)),
    }


def external_validation_passes(min_cathedral_placements: int = 8,
                                min_clean_prefactors: int = 4) -> bool:
    """Pass if at least N scales land at Cathedral integers AND at least
    M of those prefactors match a Cathedral O(1).
    """
    a = external_validation_audit()
    return (a["n_cathedral_placements"] >= min_cathedral_placements
            and a["n_prefactors_clean"] >= min_clean_prefactors)


def print_external_validation_report() -> None:
    """Human-readable report."""
    a = external_validation_audit()
    print("=" * 78)
    print("M★ External-Physics Validation Report")
    print("=" * 78)
    print()
    print("A. γ-LADDER PLACEMENT")
    print(f"   {'Scale':<22}{'GeV':>13}{'γ-exp k':>11}{'nearest':>10}{'|Δ|':>9}")
    print("   " + "-" * 65)
    for name, val, k, k_int, dev in gamma_ladder_table():
        flag = "✓" if dev < 0.5 else (" " if dev < 1.0 else " ")
        print(f"   {name:<22}{val:>13.3e}{k:>11.3f}{k_int:>10d}{dev:>9.3f} {flag}")
    print()
    print(f"   Cathedral-integer placements (|Δ|<0.5):  "
          f"{a['n_cathedral_placements']}/{a['n_scales_tested']}")
    print()
    print("B. PREFACTOR EXTRACTION  (M_obs/M★ = α · γ^k_Cathedral)")
    print(f"   {'Scale':<22}{'k':>5}{'α':>14}{'best Cathedral form':<26}{'err':>7}")
    print("   " + "-" * 73)
    for name, val, k, alpha, match, err in prefactor_extraction_table():
        flag = "✓" if err < 5 else ("?" if err < 15 else " ")
        print(f"   {name:<22}{k:>5}{alpha:>14.4e}  {match:<22}{err:>6.1f}% {flag}")
    print(f"\n   Cathedral-prefactor matches (<10%):     "
          f"{a['n_prefactors_clean']}/{a['n_prefactors_examined']}")
    print()
    print("C. MATHEMATICAL IDENTITY SEARCH for M★ = 4π√2")
    print(f"   Classical constants tested: {a['n_classical_constants_tested']}")
    print(f"   Best non-trivial match (rel<1e-3): {a['best_classical_match'] or 'NONE'}")
    print()
    print("D. M★-MASS BLACK HOLE THERMODYNAMICS  (Cathedral closed forms)")
    thermo = M_star_bh_thermo_summary()
    print(f"   S_BH         = 2^(q+2)·π³·δ★²   = {thermo['S_BH_kB']:.4f} k_B")
    print(f"   T_Hawking/M★ = 1/(2^(q+3)·π³·δ★²) = {thermo['T_Hawking_M_star']:.4e}")
    print(f"   κ /M★        = 1/(4·δ★²·2^q·π²)  = "
          f"{thermo['kappa_GeV']/M_STAR_GEV:.4e}")
    print()
    print("E. CROSS-COMPARISON WITH OTHER NATURAL UNITS")
    for name, ratio, log_r in M_star_ratios_to_natural_units():
        match = search_cathedral_ratio(ratio, tol_pct=5.0)
        match_str = f"  ←  {match}" if match else ""
        print(f"   M★/{name:<28} = {ratio:>13.4e}{match_str}")
    print("=" * 78)


__all__ = [
    "M_STAR_GEV",
    "SM_MASSES_GEV", "COSMO_SCALES_GEV", "NATURAL_UNITS_GEV",
    "gamma_exponent_in_M_star",
    "closest_cathedral_integer",
    "gamma_ladder_table",
    "cathedral_natural_placements",
    "PREFACTOR_LIBRARY",
    "best_prefactor_match",
    "prefactor_extraction_table",
    "clean_prefactor_count",
    "M_star_ratios_to_natural_units",
    "search_cathedral_ratio",
    "M_star_bh_entropy",
    "M_star_bh_hawking_temperature_GeV",
    "M_star_bh_surface_gravity_GeV",
    "M_star_bh_thermo_summary",
    "thorough_classical_identity_search",
    "best_classical_match_for_M_star",
    "external_validation_audit",
    "external_validation_passes",
    "print_external_validation_report",
]
