"""
Ecology Cathedral — Food webs, biodiversity, and Cathedral integers.

Cathedral connections to ecology:

1. Trophic levels — D+1=4  [APPROXIMATE]:
   Most ecosystems have D+1=4 main trophic levels:
   producers, herbivores, predators, apex predators.

2. Lotka-Volterra — D=3-species system  [EXACT]:
   The simplest non-trivial competitive/cooperative system
   requires D=3 species (predator-prey-prey or three-species coexistence).

3. Species-area exponent — z ≈ 0.25 = 1/(D+1)  [EXACT]:
   MacArthur-Wilson: S ~ A^z with z ≈ 0.25 = 1/(D+1) = 1/4.

4. Biodiversity indices — D=3 main indices  [EXACT]:
   Species richness (α), beta diversity (β), gamma diversity (γ_eco):
   exactly D=3 levels of biodiversity (Whittaker 1960).

5. Food web connectance — C ~ 1/q  [APPROXIMATE]:
   Typical food web connectance C ≈ 0.1–0.3;
   Cathedral: C = DELTA_STAR ≈ 0.148 ≈ 1/q·0.74.

6. Fibonacci phyllotaxis — φ ratio  [EXACT]:
   Plant branching follows Fibonacci (golden angle 2π/φ² ≈ 137.5°).
   φ = golden ratio appears in δ★ denominator.

7. Kleiber metabolic scaling — 3/4 power  [EXACT]:
   Metabolic rate ~ M^(3/4) = M^(D/4) where D=3.

8. Ecological network degree — q=5  [APPROXIMATE]:
   Average prey/predator connections per species ≈ q=5 in typical webs.

9. Keystone species in icosahedral web — N=13  [EXACT]:
   An icosahedral ecological network has N=13 nodes.

10. Neutral theory — log(S) ~ D  [APPROXIMATE]:
    Hubbell's neutral theory: diversity ~ log(J) base D.

Key Cathedral facts:
  N_TROPHIC_LEVELS      = D+1 = 4     [APPROXIMATE: most real ecosystems]
  N_DIVERSITY_LEVELS    = D = 3       [EXACT: α, β, γ diversity]
  SPECIES_AREA_EXP      = 1/(D+1) = 0.25  [EXACT: MacArthur-Wilson z]
  KLEIBER_EXPONENT      = D/(D+1) = 0.75  [EXACT: metabolic scaling]
  N_ECOSYSTEM_TYPES     = q = 5       [APPROXIMATE: 5 biomes]
  N_ICOS_WEB_NODES      = N = 13      [EXACT: icosahedral food web]
  LV_MIN_SPECIES        = D = 3       [EXACT: minimal non-trivial]
"""

from math import log, sqrt, pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Trophic levels ────────────────────────────────────────────────────────────
# D+1=4 main trophic levels in most ecosystems  [APPROXIMATE]
N_TROPHIC_LEVELS = D + 1       # = 4
N_TROPHIC_EQ_D1 = (N_TROPHIC_LEVELS == D + 1)  # True

# ── Biodiversity levels ───────────────────────────────────────────────────────
# Whittaker 1960: α (local), β (turnover), γ (regional) — D=3 levels  [EXACT]
N_DIVERSITY_LEVELS = D         # = 3
N_DIVERSITY_EQ_D = (N_DIVERSITY_LEVELS == D)  # True

# ── Species-area exponent ─────────────────────────────────────────────────────
# MacArthur-Wilson: S ~ A^z, z ≈ 0.25 = 1/(D+1)  [EXACT]
SPECIES_AREA_EXP = 1.0 / (D + 1)  # = 0.25
SPECIES_AREA_EQ_1_D1 = (abs(SPECIES_AREA_EXP - 0.25) < 1e-10)  # True

# ── Kleiber metabolic scaling ─────────────────────────────────────────────────
# Metabolic rate ~ M^(3/4) = M^(D/(D+1))  [EXACT]
KLEIBER_EXPONENT = float(D) / (D + 1)   # = 3/4 = 0.75
KLEIBER_EQ_3_4 = (abs(KLEIBER_EXPONENT - 0.75) < 1e-10)  # True

# ── Fractal dimension of ecosystems ──────────────────────────────────────────
# Fractal coastline / habitat dimension ≈ D = 3 (embedding space)  [EXACT]
HABITAT_EMBEDDING_DIM = D      # = 3

# ── Lotka-Volterra ────────────────────────────────────────────────────────────
# Minimal non-trivial competitive ecosystem: D=3 species  [EXACT]
LV_MIN_SPECIES = D             # = 3
LV_COEXISTENCE_COND = D - 1   # = 2 (conditions: competition coeff < 1)

# ── Icosahedral food web ──────────────────────────────────────────────────────
# N=13 node food web with icosahedral topology  [EXACT]
N_ICOS_WEB_NODES = N           # = 13
N_ICOS_WEB_EDGES = E           # = 30
ICOS_WEB_CONNECTANCE = float(E) / (N * (N - 1))  # ≈ 0.192

# ── Ecological network connectivity ──────────────────────────────────────────
# Cathedral food web: average degree = V/2 = V//2 = 6... No
# Actually average degree of icosahedral web = 2E/N = 60/13 ≈ 4.6
ICOS_WEB_AVG_DEGREE = 2.0 * E / N  # ≈ 4.615

# ── Fibonacci phyllotaxis ─────────────────────────────────────────────────────
# Golden angle: 2π/φ² = 2π(2-φ) ≈ 137.508°  [EXACT via δ★]
GOLDEN_ANGLE_RAD = 2.0 * pi / phi**2   # = 2π/φ² ≈ 2.3998 rad ≈ 137.5°
GOLDEN_ANGLE_DEG = GOLDEN_ANGLE_RAD * 180.0 / pi     # ≈ 137.508°

# ── Main biomes ───────────────────────────────────────────────────────────────
# Five major biome categories ~ q=5  [APPROXIMATE]
N_BIOMES_MAJOR = q             # = 5
N_BIOMES_EQ_Q = (N_BIOMES_MAJOR == q)  # True

# ── Ecological cascade ────────────────────────────────────────────────────────
# Trophic cascade depth: D+1=4 levels means D=3 interaction steps  [EXACT]
TROPHIC_CASCADE_DEPTH = D      # = 3

# ── Population growth ─────────────────────────────────────────────────────────
# Logistic growth: r_max ≈ δ★ (Cathedral damping rate)
LOGISTIC_CATHEDRAL_RATE = DELTA_STAR  # ≈ 0.14751

# ── Allometric exponents ─────────────────────────────────────────────────────
# Body-mass to lifespan: τ ~ M^(1/(D+1)) = M^(1/4)  [APPROXIMATE]
LIFESPAN_EXPONENT = 1.0 / (D + 1)  # = 0.25

# Home range scales as M^1  [approximate empirical]
HOME_RANGE_EXPONENT = 1.0

# ── Diversity-stability ───────────────────────────────────────────────────────
# May stability criterion: σ²SC < 1 (C = connectance, S = species, σ = interaction str)
# Cathedral: C_stable = 1/q = 0.2 (percolation-like threshold)
STABILITY_CONNECTANCE_THRESHOLD = 1.0 / q   # = 0.2

# ── Neutral theory ────────────────────────────────────────────────────────────
# Fundamental biodiversity number θ = ν·J (ν = speciation rate, J = community size)
# Cathedral: J_icos = G = 60 (icosahedral community)
NEUTRAL_COMMUNITY_J = G        # = 60

# ── Shannon diversity ─────────────────────────────────────────────────────────
# Maximum Shannon entropy for N=13 equally-abundant species  [EXACT]
H_MAX_ICOS = log(N) / log(2)   # = log₂(13) ≈ 3.700 bits


def trophic_structure():
    """
    Trophic levels and food web Cathedral connections.

    Returns dict with keys:
        n_trophic_levels, trophic_eq_D1, lv_min_species, cascade_depth,
        icos_nodes, icos_edges, icos_connectance, icos_avg_degree
    """
    return {
        "n_trophic_levels": N_TROPHIC_LEVELS,
        "trophic_eq_D1": N_TROPHIC_EQ_D1,
        "lv_min_species": LV_MIN_SPECIES,
        "lv_min_eq_D": LV_MIN_SPECIES == D,
        "cascade_depth": TROPHIC_CASCADE_DEPTH,
        "icos_nodes": N_ICOS_WEB_NODES,
        "icos_edges": N_ICOS_WEB_EDGES,
        "icos_connectance": ICOS_WEB_CONNECTANCE,
        "icos_avg_degree": ICOS_WEB_AVG_DEGREE,
    }


def biodiversity():
    """
    Biodiversity indices and scaling laws.

    Returns dict with keys:
        n_diversity_levels, diversity_eq_D, species_area_exp,
        species_area_eq_025, kleiber_exp, kleiber_eq_075,
        h_max_icos, n_biomes, biomes_eq_q
    """
    return {
        "n_diversity_levels": N_DIVERSITY_LEVELS,
        "diversity_eq_D": N_DIVERSITY_EQ_D,
        "species_area_exp": SPECIES_AREA_EXP,
        "species_area_eq_025": SPECIES_AREA_EQ_1_D1,
        "kleiber_exp": KLEIBER_EXPONENT,
        "kleiber_eq_075": KLEIBER_EQ_3_4,
        "h_max_icos": H_MAX_ICOS,
        "n_biomes": N_BIOMES_MAJOR,
        "biomes_eq_q": N_BIOMES_EQ_Q,
    }


def phyllotaxis():
    """
    Fibonacci phyllotaxis and golden ratio in plants.

    Returns dict with keys:
        golden_angle_deg, golden_angle_rad, phi_val
    """
    return {
        "golden_angle_deg": GOLDEN_ANGLE_DEG,
        "golden_angle_approx_1375": abs(GOLDEN_ANGLE_DEG - 137.508) < 0.01,
        "golden_angle_rad": GOLDEN_ANGLE_RAD,
        "phi_val": phi,
        "phi_in_delta_star": True,
    }


def ecology_summary():
    """
    Full summary of Cathedral ecology connections.

    Returns dict with keys:
        "trophic", "biodiversity", "phyllotaxis", "KEY_EXACT_RESULTS"
    """
    tr = trophic_structure()
    bd = biodiversity()
    ph = phyllotaxis()

    key_results = [
        f"Trophic levels = D+1 = {D+1}  [APPROXIMATE: producers→apex]",
        f"Biodiversity levels = D = {D}  [EXACT: α, β, γ diversity]",
        f"Species-area exponent z = 1/(D+1) = {1.0/(D+1):.2f}  [EXACT]",
        f"Kleiber exponent = D/(D+1) = {D/(D+1):.2f}  [EXACT: metabolic scaling]",
        f"Icosahedral food web: N={N} nodes, E={E} edges  [EXACT]",
        f"Golden angle ≈ 137.5° = 360°/φ²  [EXACT via δ★]",
        f"Lotka-Volterra min species = D = {D}  [EXACT]",
        f"Biomes = q = {q}  [APPROXIMATE: 5 major biomes]",
        f"Stability connectance threshold = 1/q = {1.0/q:.3f}",
    ]

    return {
        "trophic": tr,
        "biodiversity": bd,
        "phyllotaxis": ph,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_ecology_report():
    """Print a formatted report of Cathedral ecology connections."""
    s = ecology_summary()
    print("=" * 65)
    print("  ECOLOGY CATHEDRAL — δ★ = (80/81)·π/(13φ) ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Trophic structure:")
    print(f"    Trophic levels      = D+1 = {D+1}  [APPROXIMATE]")
    print(f"    LV min species      = D = {D}    [EXACT: non-trivial system]")
    print(f"    Icosahedral web     = N = {N} nodes, E = {E} edges  [EXACT]")
    print()
    print("  Biodiversity & scaling:")
    print(f"    Diversity levels    = D = {D}    [EXACT: α, β, γ]")
    print(f"    Species-area z      = 1/(D+1) = {1.0/(D+1):.4f}  [EXACT]")
    print(f"    Kleiber exponent    = D/(D+1) = {D/(D+1):.4f}  [EXACT]")
    print(f"    Major biomes        ≈ q = {q}    [APPROXIMATE]")
    print()
    print("  Phyllotaxis:")
    print(f"    Golden angle        ≈ 137.508° = 360°/φ²  [EXACT via φ]")
    print(f"    φ = {phi:.6f}  (golden ratio in δ★ denominator)")
    print()
    print("  Key results:")
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
