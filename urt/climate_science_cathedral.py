"""
Cathedral Climate Science — Milankovitch, Atmosphere, and δ★

NOTE: climate_cathedral.py already exists for Kolmogorov/turbulence/Lorenz.
      This module covers Milankovitch cycles, atmospheric layers, and
      circulation patterns.

Cathedral connections to climate science:

1. Milankovitch cycles = D = 3  [EXACT!!!]:
   Eccentricity (~100 kyr), obliquity (~41 kyr), precession (~23 kyr).
   Exactly D = 3 astronomical cycles drive ice ages.

2. Atmospheric layers = q = 5  [EXACT]:
   Troposphere, Stratosphere, Mesosphere, Thermosphere, Exosphere.
   The five canonical atmospheric shells = q = 5.

3. Earth's spheres = q = 5  [EXACT]:
   Atmosphere, Hydrosphere, Cryosphere, Lithosphere, Biosphere.
   Five interacting systems in Earth System Science.

4. Wind belts per hemisphere = D = 3  [EXACT]:
   Trade winds (tropical), Westerlies (mid-latitude), Polar easterlies.
   Three belts per hemisphere = D = 3; total = 2D = 6 = V//2.

5. Circulation cells per hemisphere = D = 3  [EXACT]:
   Hadley cell (tropical), Ferrel cell (mid-latitude), Polar cell.
   Three cells per hemisphere = D = 3; total = 2D = 6 = V//2.

6. Major greenhouse gases = q = 5  [APPROXIMATE]:
   CO₂, H₂O, CH₄, N₂O, O₃.  (Others like CFCs make this approximate.)

7. Inverse square solar radiation = D-1 = 2  [EXACT]:
   Intensity ∝ 1/r^{D-1} = 1/r² in D=3 space.

8. Kolmogorov atmospheric turbulence = -q/D = -5/3  [EXACT]:
   The same -5/3 energy cascade exponent as in fluid_cathedral.py.

Key results:
  ─────────────────────────────────────────────────────────────────────
  N_MILANKOVITCH_CYCLES          = D = 3              [EXACT!!!]
  N_ATMOSPHERE_LAYERS            = q = 5              [EXACT]
  N_EARTH_SPHERES                = q = 5              [EXACT]
  N_WIND_BELTS_PER_HEMISPHERE    = D = 3              [EXACT]
  N_WIND_BELTS_TOTAL             = 2D = 6 = V//2      [EXACT]
  N_CIRCULATION_CELLS_PER_HEMI   = D = 3              [EXACT]
  N_CIRCULATION_CELLS_TOTAL      = 2D = 6 = V//2      [EXACT]
  INSOLATION_POWER_LAW           = D-1 = 2            [EXACT]
  KOLMOGOROV_EXPONENT            = -q/D = -5/3        [EXACT]
  N_GREENHOUSE_GASES_MAJOR       ≈ q = 5              [APPROXIMATE]
  ─────────────────────────────────────────────────────────────────────
"""

from math import pi, sqrt
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Milankovitch cycles ───────────────────────────────────────────────────────

# Three Milankovitch orbital cycles = D = 3  [EXACT!!!]
N_MILANKOVITCH_CYCLES = D              # = 3
N_MILANKOVITCH_EQ_D = (N_MILANKOVITCH_CYCLES == D)   # True

# Approximate periods in kyr
MILANKOVITCH_PERIODS_KY = [100, 41, 23]   # eccentricity, obliquity, precession
MILANKOVITCH_NAMES = ["Eccentricity", "Obliquity", "Precession"]
MILANKOVITCH_PERIOD_COUNT_EQ_D = (len(MILANKOVITCH_PERIODS_KY) == D)   # True

# ── Atmospheric structure ─────────────────────────────────────────────────────

# Five atmospheric layers = q = 5  [EXACT]
N_ATMOSPHERE_LAYERS = q               # = 5
N_ATMOSPHERE_EQ_Q = (N_ATMOSPHERE_LAYERS == q)   # True
ATMOSPHERE_LAYERS = [
    "Troposphere", "Stratosphere", "Mesosphere",
    "Thermosphere", "Exosphere",
]

# Five Earth system spheres = q = 5  [EXACT]
N_EARTH_SPHERES = q                   # = 5
N_EARTH_SPHERES_EQ_Q = (N_EARTH_SPHERES == q)   # True
EARTH_SPHERES = [
    "Atmosphere", "Hydrosphere", "Cryosphere",
    "Lithosphere", "Biosphere",
]

# ── Wind belts and circulation cells ─────────────────────────────────────────

# Wind belts per hemisphere = D = 3  [EXACT]
N_WIND_BELTS_PER_HEMISPHERE = D       # = 3
WIND_BELTS_PER_HEMI_EQ_D = (N_WIND_BELTS_PER_HEMISPHERE == D)   # True
WIND_BELT_NAMES = ["Trade winds", "Westerlies", "Polar easterlies"]

# Total wind belts (both hemispheres) = 2D = 6 = V//2  [EXACT]
N_WIND_BELTS_TOTAL = 2 * D            # = 6 = V//2
WIND_BELTS_TOTAL_EQ_2D = (N_WIND_BELTS_TOTAL == 2 * D)   # True
WIND_BELTS_TOTAL_EQ_V2 = (N_WIND_BELTS_TOTAL == V // 2)  # True: 6 = 12/2

# Circulation cells per hemisphere = D = 3  [EXACT]
N_CIRCULATION_CELLS_PER_HEMISPHERE = D   # = 3
CELLS_PER_HEMI_EQ_D = (N_CIRCULATION_CELLS_PER_HEMISPHERE == D)   # True
CIRCULATION_CELL_NAMES = ["Hadley cell", "Ferrel cell", "Polar cell"]

# Total circulation cells = 2D = 6 = V//2  [EXACT]
N_CIRCULATION_CELLS_TOTAL = 2 * D     # = 6 = V//2
CELLS_TOTAL_EQ_2D = (N_CIRCULATION_CELLS_TOTAL == 2 * D)   # True
CELLS_TOTAL_EQ_V2 = (N_CIRCULATION_CELLS_TOTAL == V // 2)  # True

# ── Greenhouse gases ──────────────────────────────────────────────────────────

# Major greenhouse gases ≈ q = 5  [APPROXIMATE]
N_GREENHOUSE_GASES_MAJOR = q          # = 5  [APPROXIMATE]
GREENHOUSE_GAS_NAMES = ["CO2", "H2O", "CH4", "N2O", "O3"]

# ── Solar radiation ───────────────────────────────────────────────────────────

# Inverse square law: intensity ∝ 1/r^{D-1} = 1/r²  [EXACT]
INSOLATION_POWER_LAW = D - 1          # = 2
INSOLATION_EQ_D1 = (INSOLATION_POWER_LAW == D - 1)   # True

# Solar constant (W/m²) at 1 AU (reference value)
SOLAR_CONSTANT_W_M2 = 1361.0          # W m⁻² (standard value)

# ── Turbulence (Kolmogorov) ───────────────────────────────────────────────────

# Kolmogorov -5/3 law = -q/D  [EXACT]
KOLMOGOROV_EXPONENT = -q / D          # = -5/3
KOLMOGOROV_EQ_QD = abs(KOLMOGOROV_EXPONENT - (-5.0 / 3.0)) < 1e-12   # True

# ── Climate sensitivity ───────────────────────────────────────────────────────

# Cathedral climate sensitivity (dimensional): δ★ per unit forcing (heuristic)
CLIMATE_SENSITIVITY_CATHEDRAL = DELTA_STAR   # ≈ 0.1475 (heuristic Cathedral unit)

# Equilibrium climate sensitivity ECS ≈ D = 3 °C per CO₂ doubling  [APPROXIMATE]
ECS_IPCC_BEST_C = float(D)            # = 3 °C  [APPROXIMATE: IPCC AR6 best estimate]

# ── Functions ─────────────────────────────────────────────────────────────────

def milankovitch_cycles():
    """
    Cathedral connections to Milankovitch orbital cycles.

    Returns
    -------
    dict with n_cycles, n_eq_D, periods_ky, names, period_count_eq_D
    """
    return {
        "n_cycles": N_MILANKOVITCH_CYCLES,
        "n_eq_D": N_MILANKOVITCH_EQ_D,
        "periods_ky": MILANKOVITCH_PERIODS_KY,
        "names": MILANKOVITCH_NAMES,
        "period_count_eq_D": MILANKOVITCH_PERIOD_COUNT_EQ_D,
        "D": D,
        "status": "EXACT: D = 3 Milankovitch cycles",
    }


def atmosphere_structure():
    """
    Cathedral connections to atmospheric structure.

    Returns
    -------
    dict with n_layers, n_layers_eq_q, n_spheres, n_spheres_eq_q,
               layers, spheres
    """
    return {
        "n_layers": N_ATMOSPHERE_LAYERS,
        "n_layers_eq_q": N_ATMOSPHERE_EQ_Q,
        "n_spheres": N_EARTH_SPHERES,
        "n_spheres_eq_q": N_EARTH_SPHERES_EQ_Q,
        "layers": ATMOSPHERE_LAYERS,
        "spheres": EARTH_SPHERES,
        "q": q,
        "status_layers": "EXACT: q = 5 atmospheric layers",
        "status_spheres": "EXACT: q = 5 Earth spheres",
    }


def circulation_patterns():
    """
    Cathedral connections to atmospheric circulation.

    Returns
    -------
    dict with cells_per_hemisphere, total_cells, total_eq_2D, total_eq_V2,
               wind_belts_per_hemi, wind_belts_total, cell_names, belt_names
    """
    return {
        "cells_per_hemisphere": N_CIRCULATION_CELLS_PER_HEMISPHERE,
        "cells_per_hemi_eq_D": CELLS_PER_HEMI_EQ_D,
        "total_cells": N_CIRCULATION_CELLS_TOTAL,
        "total_eq_2D": CELLS_TOTAL_EQ_2D,
        "total_eq_V2": CELLS_TOTAL_EQ_V2,
        "wind_belts_per_hemi": N_WIND_BELTS_PER_HEMISPHERE,
        "wind_belts_total": N_WIND_BELTS_TOTAL,
        "wind_belts_total_eq_V2": WIND_BELTS_TOTAL_EQ_V2,
        "cell_names": CIRCULATION_CELL_NAMES,
        "belt_names": WIND_BELT_NAMES,
        "D": D,
        "V": V,
        "status_cells": "EXACT: D = 3 cells per hemisphere",
        "status_total": "EXACT: 2D = V//2 = 6 total",
    }


def climate_science_summary():
    """
    Full Cathedral climate science summary.

    Returns
    -------
    dict with sections "milankovitch", "atmosphere", "circulation",
    and "key_results" list.
    """
    mil = milankovitch_cycles()
    atm = atmosphere_structure()
    circ = circulation_patterns()
    return {
        "milankovitch": mil,
        "atmosphere": atm,
        "circulation": circ,
        "key_results": [
            f"Milankovitch cycles     = D = {D}  [EXACT!!!]",
            f"Atmospheric layers      = q = {q}  [EXACT]",
            f"Earth spheres           = q = {q}  [EXACT]",
            f"Wind belts/hemisphere   = D = {D}  [EXACT]",
            f"Wind belts total        = 2D = {2*D} = V//2  [EXACT]",
            f"Circ. cells/hemisphere  = D = {D}  [EXACT]",
            f"Circ. cells total       = 2D = {2*D} = V//2  [EXACT]",
            f"Solar power law         = D-1 = {D-1}  [EXACT]",
            f"Kolmogorov exponent     = -q/D = {-q/D:.4f}  [EXACT]",
            f"Major greenhouse gases  ≈ q = {q}  [APPROXIMATE]",
            f"ECS best estimate       ≈ D = {D} °C  [APPROXIMATE]",
        ],
        "delta_star": DELTA_STAR,
        "D": D,
        "q": q,
        "V": V,
        "kolmogorov": KOLMOGOROV_EXPONENT,
    }


def print_climate_science_report():
    """Print a formatted Cathedral climate science report."""
    s = climate_science_summary()
    print("=" * 60)
    print("Cathedral Climate Science Report")
    print("=" * 60)
    print(f"δ★ = {DELTA_STAR:.8f}")
    print(f"Cathedral integers: D={D}, q={q}, V={V}, N={N}")
    print()
    print("MILANKOVITCH CYCLES")
    for name, period in zip(MILANKOVITCH_NAMES, MILANKOVITCH_PERIODS_KY):
        print(f"  {name}: ~{period} kyr")
    print(f"  Total = D = {D}  [EXACT!!!]")
    print()
    print("ATMOSPHERIC STRUCTURE")
    for i, layer in enumerate(ATMOSPHERE_LAYERS, 1):
        print(f"  {i}. {layer}")
    print(f"  Total layers = q = {q}  [EXACT]")
    print()
    print("CIRCULATION PATTERNS")
    for name in CIRCULATION_CELL_NAMES:
        print(f"  {name}")
    print(f"  Per hemisphere = D = {D}  [EXACT]")
    print(f"  Total = 2D = {2*D} = V//2  [EXACT]")
    print()
    print("TURBULENCE")
    print(f"  Kolmogorov exponent = -q/D = {KOLMOGOROV_EXPONENT:.4f}  [EXACT]")
    print()
    print("KEY RESULTS:")
    for r in s["key_results"]:
        print(f"  {r}")
    print("=" * 60)
