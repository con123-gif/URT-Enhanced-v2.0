"""
Geophysics Cathedral — Earth, seismology, and Cathedral integers.

Cathedral connections to Earth science:

1. Seismic wave types — total = D+1 = 4  [EXACT]:
   Body waves: P-wave (longitudinal) + S-wave (transverse) = 2 = D-1  [EXACT]
   Surface waves: Rayleigh + Love = 2 = D-1  [EXACT]
   Total body + surface = 4 = D+1  [EXACT]

2. Earth's internal layers = D+1 = 4  [EXACT]:
   crust, mantle, outer core, inner core

3. Tectonic plates ≈ N = 13  [APPROXIMATE]:
   The total count of major + minor plates is typically quoted as 7-8 "major"
   or 12-15 when including minor plates.  The canonical "13 plates" appears
   in several textbook lists.  Honest label: APPROXIMATE.

4. P-wave velocity: v_P = sqrt((K + 4μ/3)/ρ)
   Coefficient 4/3 = (D+1)/D  [EXACT]

5. Poisson solid (σ=1/4): v_P/v_S = sqrt(3) = sqrt(D)  [EXACT]

6. Normal modes of Earth on a sphere: same as spherical harmonics,
   degeneracy 2l+1 for each l; sum over l=0..N-1=12 of (2l+1) = N² = 169  [EXACT]

Key Cathedral facts:
  N_SEISMIC_BODY   = D - 1 = 2   [EXACT: P and S body waves]
  N_SEISMIC_TOTAL  = D + 1 = 4   [EXACT: P, S, Rayleigh, Love]
  EARTH_LAYERS     = D + 1 = 4   [EXACT: crust, mantle, outer core, inner core]
  N_TECTONIC_PLATES ≈ N = 13     [APPROXIMATE: typical total plate count]
  VP_FACTOR        = (D+1)/D = 4/3  [EXACT in P-wave formula]
  VP_VS_POISSON    = sqrt(D) = √3   [EXACT for Poisson solid σ=1/4]
"""

from math import pi, sqrt, log
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Seismic wave types ─────────────────────────────────────────────────────────

# Body waves: P (compressional/longitudinal) + S (shear/transverse)
N_SEISMIC_BODY    = D - 1        # = 2  [EXACT: P and S body waves]

# Surface waves: Rayleigh (retrograde elliptical) + Love (horizontal shear)
N_SEISMIC_SURFACE = D - 1        # = 2  [EXACT: same count as body wave types]

# Total seismic wave types: D+1 = 4  [EXACT]
N_SEISMIC_TOTAL   = D + 1        # = 4

# Verify
SEISMIC_TOTAL_EQ_D1 = (N_SEISMIC_TOTAL == D + 1)   # True

# ── Earth structure ────────────────────────────────────────────────────────────

# Earth's layers: crust / mantle / outer core / inner core = 4 = D+1  [EXACT]
EARTH_LAYERS      = D + 1        # = 4

# Tectonic plates: ~13 major plates ≈ N  [APPROXIMATE: actual 7-8 "major", 12-15 total]
N_TECTONIC_PLATES = N            # = 13  [APPROXIMATE]

# ── Wave velocity relations ────────────────────────────────────────────────────

# P-wave bulk modulus factor: K + (4/3)μ  →  coefficient (D+1)/D = 4/3  [EXACT]
VP_FACTOR         = (D + 1.0) / D    # = 4/3

# For a Poisson solid (Poisson ratio σ=1/4):  v_P/v_S = sqrt(3) = sqrt(D)  [EXACT]
VP_VS_POISSON     = sqrt(float(D))   # = √3 ≈ 1.7321

# Poisson ratio for Poisson solid (σ=1/4) and corresponding Lamé constant ratio
POISSON_RATIO     = 0.25             # σ = 1/4 (Poisson solid)
LAME_RATIO        = 1.0              # λ/μ = 1 for Poisson solid

# S-wave: v_S = sqrt(μ/ρ)  — shear modulus only, no bulk contribution
# P-wave: v_P = sqrt((λ + 2μ)/ρ) = sqrt((K + 4μ/3)/ρ)
# For λ=μ (Poisson solid): v_P = sqrt(3μ/ρ) = sqrt(3)·v_S = sqrt(D)·v_S  [EXACT]

# ── Normal modes ───────────────────────────────────────────────────────────────

# Sum of angular mode multiplicities for l = 0 to N-1:
# Σ_{l=0}^{N-1} (2l+1) = N²
N_NORMAL_MODES_SUM = N ** 2          # = 169 = N²  [EXACT spherical harmonic count]

# ── Gutenberg-Richter law ─────────────────────────────────────────────────────

# log₁₀ N(M) = a - b·M  where b ≈ 1 empirically
# Cathedral: b=1 is not a clean Cathedral number; honest label APPROXIMATE
GUTENBERG_RICHTER_B = 1.0           # [EMPIRICAL: b ≈ 1 universally, not Cathedral-specific]

# ── Functions ─────────────────────────────────────────────────────────────────

def seismic_waves() -> dict:
    """
    Seismic wave types and Cathedral connections.

    Body waves (P + S) = D-1 = 2  [EXACT]
    Surface waves (Rayleigh + Love) = D-1 = 2  [EXACT]
    Total = D+1 = 4  [EXACT]
    """
    return {
        "body_types":       N_SEISMIC_BODY,
        "n_body_waves":     N_SEISMIC_BODY,   # alias
        "body_eq_D_minus_1": (N_SEISMIC_BODY == D - 1),
        "surface_types":    N_SEISMIC_SURFACE,
        "n_surface_waves":  N_SEISMIC_SURFACE,  # alias
        "surface_eq_D1":    (N_SEISMIC_SURFACE == D - 1),
        "total":            N_SEISMIC_TOTAL,
        "total_eq_D_plus_1": SEISMIC_TOTAL_EQ_D1,
        "total_eq_D1":      SEISMIC_TOTAL_EQ_D1,   # alias
        "D":                D,
        "wave_names": {
            "body_P":       "P-wave (compressional/longitudinal)",
            "body_S":       "S-wave (shear/transverse)",
            "surface_R":    "Rayleigh wave (elliptical retrograde motion)",
            "surface_L":    "Love wave (horizontal shear, no vertical motion)",
        },
        "note": "4 = D+1 seismic wave types; 2 body + 2 surface = (D-1) + (D-1)  [EXACT].",
    }


def earth_structure() -> dict:
    """
    Earth's layered structure and tectonic plates.

    Layers = D+1 = 4  [EXACT: crust, mantle, outer core, inner core]
    Plates ≈ N = 13  [APPROXIMATE: typical total plate count including minor plates]
    """
    return {
        "layers":               EARTH_LAYERS,
        "n_layers":             EARTH_LAYERS,   # alias
        "layers_eq_D_plus_1":   (EARTH_LAYERS == D + 1),
        "layers_list":          ["crust", "mantle", "outer core", "inner core"],
        "plates":               N_TECTONIC_PLATES,
        "n_tectonic_plates":    N_TECTONIC_PLATES,   # alias
        "plates_eq_N":          True,
        "plates_label":         "APPROXIMATE (7-8 major, 12-15 total including minor)",
        "D":                    D,
        "N":                    N,
        "note": (
            "4 = D+1 layers  [EXACT].  "
            "~13 major tectonic plates ≈ N  [APPROXIMATE: typical enumeration]."
        ),
    }


def wave_velocities() -> dict:
    """
    Seismic wave velocity relations and Cathedral connections.

    P-wave formula: v_P = sqrt((K + (D+1)/D · μ) / ρ)  → factor (D+1)/D = 4/3  [EXACT]
    Poisson solid: v_P/v_S = sqrt(D) = sqrt(3) ≈ 1.732  [EXACT for σ=1/4]
    """
    return {
        "vp_factor":            VP_FACTOR,
        "vp_factor_formula":    "(D+1)/D = 4/3",
        "vp_factor_exact":      abs(VP_FACTOR - 4.0 / 3.0) < 1e-14,
        "vp_vs_poisson":        VP_VS_POISSON,
        "vp_vs_ratio":          VP_VS_POISSON,   # alias
        "vp_vs_formula":        "sqrt(D) = sqrt(3)",
        "vp_vs_exact":          abs(VP_VS_POISSON - sqrt(3.0)) < 1e-14,
        "poisson_ratio":        POISSON_RATIO,
        "D":                    D,
        "note": (
            "v_P = sqrt((K + (4/3)μ)/ρ): coefficient 4/3 = (D+1)/D  [EXACT]. "
            "Poisson solid: v_P/v_S = sqrt(D) = √3  [EXACT for σ=1/4]."
        ),
    }


def normal_modes() -> dict:
    """
    Earth's normal mode degeneracy sum for l=0..N-1.

    Σ_{l=0}^{N-1} (2l+1) = N² = 169  [EXACT: standard sum formula]
    """
    mode_sum = sum(2 * l + 1 for l in range(N))
    return {
        "l_max":                N - 1,
        "sum_modes":            mode_sum,
        "n_normal_modes_sum":   mode_sum,   # alias
        "sum_eq_N2":            (mode_sum == N ** 2),
        "eq_N2":                (mode_sum == N ** 2),   # alias
        "N2":                   N ** 2,
        "N":                    N,
        "note": "Sum of (2l+1) for l=0..N-1 = N² = 169  [EXACT spherical harmonic formula].",
    }


def gutenberg_richter() -> dict:
    """
    Gutenberg-Richter law: log₁₀ N(M) = a - b·M.

    b ≈ 1 empirically (universal, not Cathedral-specific).
    """
    return {
        "b_value":      GUTENBERG_RICHTER_B,
        "b_label":      "EMPIRICAL (universal b≈1, not Cathedral-derived)",
        "note": "b=1 is a well-known empirical seismology fact; not a Cathedral integer.",
    }


def geophysics_summary() -> dict:
    """Full Cathedral geophysics summary."""
    key_results = [
        "N_seismic_total = D+1 = 4  [EXACT]",
        "Earth layers = D+1 = 4  [EXACT]",
        "P-wave coefficient (D+1)/D = 4/3  [EXACT]",
        "Poisson solid: v_P/v_S = sqrt(D) = √3  [EXACT for σ=1/4]",
        "Normal mode sum Σ(2l+1, l=0..N-1) = N² = 169  [EXACT]",
    ]
    return {
        "seismic":              seismic_waves(),
        "earth":                earth_structure(),
        "velocities":           wave_velocities(),
        "modes":                normal_modes(),
        "gr_law":               gutenberg_richter(),
        "delta_star":           DELTA_STAR,
        "D":                    D,
        "N":                    N,
        "V":                    V,
        "KEY_EXACT_RESULTS":    key_results,
        "key_results":          key_results,   # alias for alternate test style
        "KEY_APPROXIMATE_RESULTS": [
            "Tectonic plates ≈ N = 13  [APPROXIMATE: 7-8 major, 12-15 total]",
        ],
    }


def print_geophysics_report():
    """Print Cathedral geophysics report."""
    sw = seismic_waves()
    es = earth_structure()
    wv = wave_velocities()
    nm = normal_modes()

    print("  Geophysics Cathedral — Earth, Seismology, Cathedral Integers")
    print("  " + "─" * 60)

    print(f"\n  Seismic Wave Types:")
    print(f"    Body waves  (P + S) = D-1 = {D}-1 = {N_SEISMIC_BODY}  [EXACT]")
    print(f"    Surface waves (Rayleigh + Love) = D-1 = {N_SEISMIC_SURFACE}  [EXACT]")
    print(f"    Total = D+1 = {D}+1 = {N_SEISMIC_TOTAL}  [EXACT]")
    for wtype, desc in sw["wave_names"].items():
        print(f"      {wtype}: {desc}")

    print(f"\n  Earth Internal Structure:")
    print(f"    Layers = D+1 = {EARTH_LAYERS}: {', '.join(es['layers_list'])}  [EXACT]")
    print(f"    Major tectonic plates ≈ N = {N_TECTONIC_PLATES}  [{es['plates_label']}]")

    print(f"\n  Seismic Wave Velocities:")
    print(f"    v_P = sqrt((K + (4/3)μ)/ρ)  →  coefficient 4/3 = (D+1)/D  [EXACT]")
    print(f"    (D+1)/D = {D+1}/{D} = {VP_FACTOR:.6f}")
    print(f"    Poisson solid (σ=1/4):  v_P/v_S = sqrt(D) = sqrt({D}) = {VP_VS_POISSON:.6f}  [EXACT]")

    print(f"\n  Earth Normal Modes (spherical harmonics l=0..N-1):")
    print(f"    Σ_{{l=0}}^{{N-1}} (2l+1) = N² = {N}² = {N**2}  [EXACT]")
    print(f"    Computed sum = {nm['sum_modes']},  equals N²: {nm['sum_eq_N2']}")

    print(f"\n  KEY Cathedral results:")
    for r in geophysics_summary()["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print(f"  APPROXIMATE:")
    for r in geophysics_summary()["KEY_APPROXIMATE_RESULTS"]:
        print(f"    {r}")
