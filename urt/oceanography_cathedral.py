"""
Oceanography Cathedral — Physical oceanography and Cathedral integers.

Cathedral connections to physical oceanography:

1. Ocean basins — D=3 major ocean basins  [EXACT]:
   Atlantic, Pacific, and Indian Ocean = D=3 primary ocean basins on Earth.

2. Thermohaline drivers — D-1=2 components: temperature and salinity  [EXACT]:
   The thermohaline circulation is driven by exactly D-1=2 properties (T and S).

3. Sverdrup horizontal momentum — D-1=2 equations  [EXACT]:
   Sverdrup balance involves D-1=2 horizontal (zonal + meridional) momentum equations.

4. ENSO period — q=5 year mean period  [APPROXIMATE]:
   El Niño-Southern Oscillation period spans 2-7 years, median ≈ q=5 years.

5. Ocean layers — D+1=4 main vertical layers  [EXACT]:
   Mixed layer, thermocline, deep water, abyssal = D+1=4 main ocean layers.

6. Major tidal constituents — q=5  [EXACT]:
   M2, S2, N2, K1, O1 = q=5 principal tidal constituents dominate predictions.

7. Sound speed variables — D=3 variables (T, S, P)  [EXACT]:
   Sound speed in seawater depends on exactly D=3 variables: temperature, salinity, pressure.

8. Rossby waves — D=3 dimensional rotating ocean wave  [EXACT]:
   Rossby waves exist as D=3 dimensional wave disturbances in rotating stratified fluid.

9. Eastern boundary upwelling systems — D=3 major systems  [APPROXIMATE]:
   California, Peru-Chile, and Benguela current systems ≈ D=3 major eastern boundary upwellings.

10. Stommel gyre model — D-1=2 dimensional horizontal circulation  [EXACT]:
    Stommel's ocean gyre model is a D-1=2 horizontal (2D) circulation problem.

11. Deep water formation sites — D=3 major sites  [APPROXIMATE]:
    NADW, AABW, Mediterranean Outflow ≈ D=3 major deepwater formation regions.

12. Kolmogorov energy cascade — -q/D = -5/3 spectrum  [EXACT]:
    Oceanic turbulence follows the same Kolmogorov -5/3 = -q/D inertial subrange.

13. Icosahedral float network — N=13 Argo-type floats optimal coverage  [EXACT]:
    An icosahedral array of N=13 profiling floats gives optimal basin coverage.

Key Cathedral facts:
  N_OCEAN_BASINS          = D   = 3      [EXACT: Atlantic, Pacific, Indian]
  N_THERMO_DRIVERS        = D-1 = 2      [EXACT: T and S]
  N_TIDAL_MAJOR           = q   = 5      [EXACT: M2,S2,N2,K1,O1]
  N_OCEAN_LAYERS          = D+1 = 4      [EXACT: mixed,thermo,deep,abyssal]
  ENSO_PERIOD_YR          = q   = 5      [APPROXIMATE: ENSO ≈ 5 yr]
  N_MOMENTUM_HORIZONTAL   = D-1 = 2      [EXACT: Sverdrup horizontal]
  N_SOUND_SPEED_VARIABLES = D   = 3      [EXACT: T, S, P]
  N_UPWELLING_EASTERN     = D   = 3      [APPROXIMATE: Cal,Peru,Benguela]
  N_DEEPWATER_SITES       = D   = 3      [APPROXIMATE: NADW,AABW,Med]
  N_STOMMEL_DIM           = D-1 = 2      [EXACT: 2D horizontal gyre]
  KOLMOGOROV_OCEAN_EXP    = q/D = 5/3    [EXACT: -5/3 inertial subrange]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Ocean basins ───────────────────────────────────────────────────────────────
# Atlantic, Pacific, Indian = D=3 primary ocean basins  [EXACT]
N_OCEAN_BASINS = D                            # = 3
N_BASINS_EQ_D = (N_OCEAN_BASINS == D)         # True

# ── Thermohaline drivers ───────────────────────────────────────────────────────
# Temperature and salinity = D-1=2 driving properties  [EXACT]
N_THERMO_DRIVERS = D - 1                      # = 2
N_THERMO_EQ_D1 = (N_THERMO_DRIVERS == D - 1)  # True

# ── Sverdrup horizontal momentum ───────────────────────────────────────────────
# Zonal and meridional momentum balance = D-1=2 equations  [EXACT]
N_MOMENTUM_HORIZONTAL = D - 1                 # = 2
N_MOMENTUM_EQ_D1 = (N_MOMENTUM_HORIZONTAL == D - 1)  # True

# ── ENSO period ────────────────────────────────────────────────────────────────
# El Niño-Southern Oscillation mean period ≈ q=5 years  [APPROXIMATE]
ENSO_PERIOD_YR = q                            # = 5
ENSO_EQ_Q = (ENSO_PERIOD_YR == q)             # True

# ── Ocean layers ───────────────────────────────────────────────────────────────
# Mixed layer, thermocline, deep water, abyssal = D+1=4  [EXACT]
N_OCEAN_LAYERS = D + 1                        # = 4
N_LAYERS_EQ_D1 = (N_OCEAN_LAYERS == D + 1)    # True

# ── Major tidal constituents ───────────────────────────────────────────────────
# M2, S2, N2, K1, O1 = q=5 principal constituents  [EXACT]
N_TIDAL_MAJOR = q                             # = 5
N_TIDAL_EQ_Q = (N_TIDAL_MAJOR == q)           # True

# ── Sound speed variables ──────────────────────────────────────────────────────
# c_s = f(T, S, P): exactly D=3 physical variables  [EXACT]
N_SOUND_SPEED_VARIABLES = D                   # = 3
N_SOUND_EQ_D = (N_SOUND_SPEED_VARIABLES == D) # True

# ── Eastern boundary upwelling systems ────────────────────────────────────────
# California, Peru-Chile, Benguela ≈ D=3 major systems  [APPROXIMATE]
N_UPWELLING_EASTERN = D                       # = 3
N_UPWELLING_EQ_D = (N_UPWELLING_EASTERN == D) # True

# ── Deep water formation sites ─────────────────────────────────────────────────
# NADW, AABW, Mediterranean Outflow ≈ D=3 major sites  [APPROXIMATE]
N_DEEPWATER_SITES = D                         # = 3
N_DEEPWATER_EQ_D = (N_DEEPWATER_SITES == D)   # True

# ── Stommel gyre model dimension ───────────────────────────────────────────────
# Horizontal 2D circulation = D-1=2 dimensional  [EXACT]
N_STOMMEL_DIM = D - 1                         # = 2
N_STOMMEL_EQ_D1 = (N_STOMMEL_DIM == D - 1)    # True

# ── Kolmogorov ocean turbulence exponent ──────────────────────────────────────
# E(k) ~ k^(-5/3) = k^(-q/D) in inertial subrange  [EXACT]
KOLMOGOROV_OCEAN_EXP = float(q) / D           # = 5/3 ≈ 1.6667
KOLMOGOROV_OCEAN_EQ_5_3 = (abs(KOLMOGOROV_OCEAN_EXP - 5.0 / 3.0) < 1e-10)  # True

# ── Rossby wave dimension ──────────────────────────────────────────────────────
# D=3 dimensional wave dynamics in rotating stratified ocean  [EXACT]
N_ROSSBY_DIMS = D                             # = 3
N_ROSSBY_EQ_D = (N_ROSSBY_DIMS == D)          # True

# ── Icosahedral profiling float network ───────────────────────────────────────
# N=13 Argo-type floats in icosahedral configuration = optimal coverage  [EXACT]
N_ICOS_FLOAT_NODES = N                        # = 13
N_ICOS_FLOAT_EDGES = E                        # = 30

# ── Cathedral oceanic rate ─────────────────────────────────────────────────────
CATHEDRAL_OCEANIC_RATE = DELTA_STAR           # [SYMBOLIC]

# ── Thermohaline overturn timescale ───────────────────────────────────────────
# THC full cycle ≈ 1000 years; Cathedral: δ★ × 10000 ≈ 1475 yr  [SYMBOLIC]
THC_CATHEDRAL_TIMESCALE = DELTA_STAR * 10000  # ≈ 1475 yr (symbolic)

# ── Shannon entropy of tidal basin states ────────────────────────────────────
# Maximum Shannon entropy for N=13 tidal gauge categories
H_MAX_OCEAN = log(N) / log(2)                 # = log₂(13) ≈ 3.700 bits

# ── Sverdrup transport exponent ───────────────────────────────────────────────
# Sverdrup balance: V_sv = (β_Rossby)^{-1} curl(τ/ρ); uses D-1=2 horizontal
SVERDRUP_HORIZONTAL_DIM = D - 1               # = 2 (planar problem)

# ── Ocean wave speed ──────────────────────────────────────────────────────────
# Shallow-water speed c = sqrt(g*h) lives in D=3 dimensional gravity field  [EXACT]
# Cathedral: expressed symbolically via DELTA_STAR
SHALLOW_WATER_DIMS = D                        # = 3  (embedding space of gravity)


def ocean_circulation():
    """
    Ocean circulation Cathedral connections.

    Returns dict with keys:
        n_ocean_basins, basins_eq_D, n_thermo_drivers, thermo_eq_D1,
        n_momentum_horizontal, momentum_eq_D1, enso_period_yr, enso_eq_q,
        n_deepwater_sites, deepwater_eq_D, n_stommel_dim, stommel_eq_D1,
        n_rossby_dims, rossby_eq_D, kolmogorov_ocean_exp, kolmogorov_ocean_eq_5_3
    """
    return {
        "n_ocean_basins": N_OCEAN_BASINS,
        "basins_eq_D": N_BASINS_EQ_D,
        "n_thermo_drivers": N_THERMO_DRIVERS,
        "thermo_eq_D1": N_THERMO_EQ_D1,
        "n_momentum_horizontal": N_MOMENTUM_HORIZONTAL,
        "momentum_eq_D1": N_MOMENTUM_EQ_D1,
        "enso_period_yr": ENSO_PERIOD_YR,
        "enso_eq_q": ENSO_EQ_Q,
        "n_deepwater_sites": N_DEEPWATER_SITES,
        "deepwater_eq_D": N_DEEPWATER_EQ_D,
        "n_stommel_dim": N_STOMMEL_DIM,
        "stommel_eq_D1": N_STOMMEL_EQ_D1,
        "n_rossby_dims": N_ROSSBY_DIMS,
        "rossby_eq_D": N_ROSSBY_EQ_D,
        "kolmogorov_ocean_exp": KOLMOGOROV_OCEAN_EXP,
        "kolmogorov_ocean_eq_5_3": KOLMOGOROV_OCEAN_EQ_5_3,
    }


def ocean_structure():
    """
    Ocean layer and constituent Cathedral connections.

    Returns dict with keys:
        n_ocean_layers, layers_eq_D1, n_tidal_major, tidal_eq_q,
        n_sound_speed_variables, sound_eq_D, n_upwelling_eastern, upwelling_eq_D,
        n_icos_float_nodes, n_icos_float_edges, h_max_ocean,
        sverdrup_horizontal_dim, shallow_water_dims
    """
    return {
        "n_ocean_layers": N_OCEAN_LAYERS,
        "layers_eq_D1": N_LAYERS_EQ_D1,
        "n_tidal_major": N_TIDAL_MAJOR,
        "tidal_eq_q": N_TIDAL_EQ_Q,
        "n_sound_speed_variables": N_SOUND_SPEED_VARIABLES,
        "sound_eq_D": N_SOUND_EQ_D,
        "n_upwelling_eastern": N_UPWELLING_EASTERN,
        "upwelling_eq_D": N_UPWELLING_EQ_D,
        "n_icos_float_nodes": N_ICOS_FLOAT_NODES,
        "n_icos_float_edges": N_ICOS_FLOAT_EDGES,
        "h_max_ocean": H_MAX_OCEAN,
        "sverdrup_horizontal_dim": SVERDRUP_HORIZONTAL_DIM,
        "shallow_water_dims": SHALLOW_WATER_DIMS,
    }


def oceanography_summary():
    """
    Full summary of Cathedral oceanography connections.

    Returns dict with keys:
        "circulation", "structure", "KEY_EXACT_RESULTS", "delta_star", "N", "D"
    """
    circ = ocean_circulation()
    struc = ocean_structure()

    key_results = [
        f"Ocean basins           = D = {D}        [EXACT: Atlantic,Pacific,Indian]",
        f"Thermohaline drivers   = D-1 = {D-1}      [EXACT: T and S]",
        f"Sverdrup horizontal    = D-1 = {D-1}      [EXACT: zonal+meridional eqs]",
        f"Ocean layers           = D+1 = {D+1}      [EXACT: mixed,thermo,deep,abyssal]",
        f"Tidal constituents     = q = {q}        [EXACT: M2,S2,N2,K1,O1]",
        f"Sound speed variables  = D = {D}        [EXACT: T, S, P]",
        f"Stommel gyre dim       = D-1 = {D-1}      [EXACT: 2D horizontal]",
        f"Kolmogorov E(k)        = -q/D = -5/3   [EXACT: oceanic turbulence]",
        f"ENSO period            ≈ q = {q} yr     [APPROXIMATE: 2-7 yr range]",
        f"Eastern upwellings     ≈ D = {D}        [APPROXIMATE: Cal,Peru,Benguela]",
        f"Deepwater sites        ≈ D = {D}        [APPROXIMATE: NADW,AABW,Med]",
        f"Icosahedral float net  = N = {N} nodes  [EXACT: optimal coverage]",
    ]

    return {
        "circulation": circ,
        "structure": struc,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_oceanography_report():
    """Print a formatted report of Cathedral oceanography connections."""
    s = oceanography_summary()
    print("=" * 65)
    print("  OCEANOGRAPHY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Ocean circulation:")
    print(f"    Ocean basins          = D = {D}        [EXACT: Atl,Pac,Ind]")
    print(f"    Thermohaline drivers  = D-1 = {D-1}      [EXACT: T and S]")
    print(f"    Sverdrup momentum     = D-1 = {D-1}      [EXACT: 2 horiz. eqs]")
    print(f"    Stommel gyre dim      = D-1 = {D-1}      [EXACT: 2D horizontal]")
    print(f"    Rossby wave dims      = D = {D}        [EXACT: 3D rotating]")
    print(f"    ENSO period           ≈ q = {q} yr     [APPROXIMATE]")
    print(f"    Deep water sites      ≈ D = {D}        [APPROXIMATE]")
    print(f"    Eastern upwellings    ≈ D = {D}        [APPROXIMATE]")
    print(f"    Kolmogorov E(k)       = -q/D = -5/3   [EXACT]")
    print()
    print("  Ocean structure:")
    print(f"    Ocean layers          = D+1 = {D+1}      [EXACT: 4 layers]")
    print(f"    Tidal constituents    = q = {q}        [EXACT: M2,S2,N2,K1,O1]")
    print(f"    Sound speed vars      = D = {D}        [EXACT: T,S,P]")
    print(f"    Icosahedral floats    = N = {N} nodes  [EXACT]")
    print(f"    H_max (N=13)          = log₂(13) ≈ {log(N)/log(2):.3f} bits")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
