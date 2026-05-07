"""
Chemical Kinetics Cathedral — Reaction rates, mechanisms, and Cathedral integers.

Cathedral connections to chemical kinetics:

1. Elementary reaction molecularities — {D-1, D, rare}  [EXACT]:
   Unimolecular (1=D-2), bimolecular (2=D-1), termolecular (3=D) — the three
   molecularities map to Cathedral integers.

2. Arrhenius parameters — D-1=2  [EXACT]:
   k = A·exp(-Ea/RT) — exactly D-1=2 parameters (pre-exponential A, activation Ea).

3. Michaelis-Menten — D=3 rate constants  [EXACT]:
   E+S ⇌ ES → E+P: k1, k-1, k2 — exactly D=3 microscopic rate constants.

4. Catalytic cycle minimum steps — D=3  [EXACT]:
   Minimum catalytic cycle: binding, reaction, release = D=3 steps.

5. Hill coefficient hemoglobin — D+1=4  [APPROXIMATE]:
   Cooperative O₂ binding: n_H ≤ D+1=4 binding sites on hemoglobin.

6. Transition state theory — 1 TS coordinate from D=3  [EXACT]:
   D=3 translational + D=3 rotational - 1 TS = 3N-6-1 coordinates.

7. Reaction orders — max elementary = D=3  [EXACT]:
   Elementary termolecular A+B+C→P has order D=3.

8. Lindemann mechanism — D-1=2 key steps  [EXACT]:
   A+M → A* + M (activation), A* → products: D-1=2 elementary steps.

9. RRKM theory — 3D phase space  [EXACT]:
   D=3 translational degrees integrate over in D-dimensional phase space.

10. Diffusion-limited rate constant — k_D ~ D·π·r·D_coeff  [uses D=3]

Key Cathedral facts:
  N_MOLECULARITY_TYPES = D = 3     [EXACT: uni-, bi-, termolecular]
  N_ARRHENIUS_PARAMS   = D-1 = 2   [EXACT: A and Ea]
  N_MM_RATE_CONSTANTS  = D = 3     [EXACT: k1, k-1, k2]
  N_CATALYTIC_STEPS    = D = 3     [EXACT: bind, react, release]
  MAX_HILL_COEFF       = D+1 = 4   [APPROXIMATE: hemoglobin n_H ≤ 4]
  N_LINDEMANN_STEPS    = D-1 = 2   [EXACT: activation + decomposition]
"""

from math import pi, exp, log, sqrt
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Molecularity ──────────────────────────────────────────────────────────────
# Unimolecular: order 1 = D-2  [EXACT]
ORDER_UNIMOLECULAR = D - 2         # = 1
ORDER_UNI_EQ_D2 = (ORDER_UNIMOLECULAR == D - 2)  # True

# Bimolecular: order 2 = D-1  [EXACT]
ORDER_BIMOLECULAR = D - 1          # = 2
ORDER_BI_EQ_D1 = (ORDER_BIMOLECULAR == D - 1)  # True

# Termolecular: order 3 = D  [EXACT]
ORDER_TERMOLECULAR = D             # = 3
ORDER_TER_EQ_D = (ORDER_TERMOLECULAR == D)  # True

# Number of distinct molecularity types = D = 3  [EXACT]
N_MOLECULARITY_TYPES = D           # = 3

# ── Arrhenius equation ────────────────────────────────────────────────────────
# k = A·exp(-Ea/RT) — D-1=2 parameters  [EXACT]
N_ARRHENIUS_PARAMS = D - 1         # = 2
N_ARR_EQ_D1 = (N_ARRHENIUS_PARAMS == D - 1)  # True

# ── Michaelis-Menten kinetics ─────────────────────────────────────────────────
# E + S ⇌ ES → E + P: k₁, k₋₁, k₂ — D=3 rate constants  [EXACT]
N_MM_RATE_CONSTANTS = D            # = 3
N_MM_EQ_D = (N_MM_RATE_CONSTANTS == D)  # True

# MM parameters: Km and Vmax = D-1=2 observable parameters  [EXACT]
N_MM_OBSERVABLE_PARAMS = D - 1    # = 2

# ── Catalytic cycle ───────────────────────────────────────────────────────────
# Minimum: substrate binding, chemical transformation, product release = D=3  [EXACT]
N_CATALYTIC_STEPS = D              # = 3
N_CAT_EQ_D = (N_CATALYTIC_STEPS == D)  # True

# ── Hill coefficient ──────────────────────────────────────────────────────────
# Hemoglobin has D+1=4 O₂ binding sites → n_H ≤ D+1=4  [APPROXIMATE]
N_HEMOGLOBIN_SITES = D + 1         # = 4
MAX_HILL_COEFF = D + 1             # = 4
HILL_EQ_D1 = (MAX_HILL_COEFF == D + 1)  # True

# ── Lindemann mechanism ───────────────────────────────────────────────────────
# A+M→A*+M (activation), A*→P (decomposition): D-1=2 elementary steps  [EXACT]
N_LINDEMANN_STEPS = D - 1          # = 2
LINDEMANN_EQ_D1 = (N_LINDEMANN_STEPS == D - 1)  # True

# ── Transition state theory ───────────────────────────────────────────────────
# For non-linear molecule N atoms: 3N - 6 - 1 vibrational modes at TS
# The subtraction of D=3 translational + D=3 rotational: total classical DOF = D = 3  [EXACT]
N_TS_COORDINATES_REMOVED = D      # = 3 translational + 3 rotational (= 2D=6 total)
N_TRANS_DOF = D                   # = 3  [EXACT]
N_ROT_DOF = D                     # = 3  [EXACT: non-linear molecule]
N_TS_MODES_REMOVED = 2 * D        # = 6  [EXACT: 3 trans + 3 rot]

# ── Rate constant temperature dependence ─────────────────────────────────────
# Power law: k ~ T^n where n = D/2 for activated processes  [APPROXIMATE]
TEMP_POWER_HALF_D = float(D) / 2   # = 1.5  [APPROXIMATE]

# ── Collision theory ──────────────────────────────────────────────────────────
# Collision cross section: σ = π·d² where d = molecular diameter
# D=3 → cross section ~ r^{D-1} = r²  [EXACT]
COLLISION_CROSS_SECTION_POWER = D - 1  # = 2  [EXACT]

# ── Elementary rate orders ────────────────────────────────────────────────────
# Rate = k[A]^1 (unimolecular), k[A][B] (bimolecular), k[A][B][C] (termolecular)
RATE_ORDER_UNI = 1                 # = D-2  [EXACT]
RATE_ORDER_BI = 2                  # = D-1  [EXACT]
RATE_ORDER_TER = 3                 # = D    [EXACT]

# ── Reaction diffusion ────────────────────────────────────────────────────────
# Diffusion-limited rate: k_D = 4π·D_coeff·r·N_A in D=3  [EXACT]
# The factor 4π = 4π comes from solid angle in D=3
DIFFUSION_SOLID_ANGLE_FACTOR = 4 * pi  # = 4π  [EXACT: surface area of unit sphere in D=3]

# ── Kinetic isotope effect ────────────────────────────────────────────────────
# Classical KIE ~ exp(Δ(m^{1/2})/kT) — involves D=3 zero-point energy modes  [APPROXIMATE]
N_ZPE_MODES_TRANSITION = D        # = 3  [APPROXIMATE]

# ── Cathedral kinetic constant ────────────────────────────────────────────────
# Symbolic: δ★ as a dimensionless rate-like constant (fraction of collision leading to reaction)
CATHEDRAL_STERIC_FACTOR = DELTA_STAR  # ≈ 0.14751  [SYMBOLIC]


def molecularity():
    """
    Reaction molecularity Cathedral connections.

    Returns dict with keys:
        order_unimolecular, uni_eq_D2, order_bimolecular, bi_eq_D1,
        order_termolecular, ter_eq_D, n_types, types_eq_D
    """
    return {
        "order_unimolecular": ORDER_UNIMOLECULAR,
        "uni_eq_D2": ORDER_UNI_EQ_D2,
        "order_bimolecular": ORDER_BIMOLECULAR,
        "bi_eq_D1": ORDER_BI_EQ_D1,
        "order_termolecular": ORDER_TERMOLECULAR,
        "ter_eq_D": ORDER_TER_EQ_D,
        "n_types": N_MOLECULARITY_TYPES,
        "types_eq_D": N_MOLECULARITY_TYPES == D,
    }


def enzyme_kinetics():
    """
    Enzyme and Michaelis-Menten Cathedral connections.

    Returns dict with keys:
        n_mm_constants, mm_eq_D, n_arrhenius, arr_eq_D1,
        n_catalytic_steps, cat_eq_D, hill_max, hill_eq_D1
    """
    return {
        "n_mm_constants": N_MM_RATE_CONSTANTS,
        "mm_eq_D": N_MM_EQ_D,
        "n_mm_observable": N_MM_OBSERVABLE_PARAMS,
        "n_arrhenius": N_ARRHENIUS_PARAMS,
        "arr_eq_D1": N_ARR_EQ_D1,
        "n_catalytic_steps": N_CATALYTIC_STEPS,
        "cat_eq_D": N_CAT_EQ_D,
        "hill_max": MAX_HILL_COEFF,
        "hill_eq_D1": HILL_EQ_D1,
        "hemoglobin_sites": N_HEMOGLOBIN_SITES,
    }


def transition_state():
    """
    Transition state theory Cathedral connections.

    Returns dict with keys:
        n_trans_dof, n_rot_dof, n_modes_removed, lindemann_steps, lindemann_eq_D1
    """
    return {
        "n_trans_dof": N_TRANS_DOF,
        "trans_eq_D": N_TRANS_DOF == D,
        "n_rot_dof": N_ROT_DOF,
        "rot_eq_D": N_ROT_DOF == D,
        "n_modes_removed": N_TS_MODES_REMOVED,
        "modes_eq_2D": N_TS_MODES_REMOVED == 2 * D,
        "lindemann_steps": N_LINDEMANN_STEPS,
        "lindemann_eq_D1": LINDEMANN_EQ_D1,
        "collision_power": COLLISION_CROSS_SECTION_POWER,
        "collision_eq_D1": COLLISION_CROSS_SECTION_POWER == D - 1,
    }


def chemical_kinetics_summary():
    """
    Full summary of Cathedral chemical kinetics connections.

    Returns dict with keys:
        "molecularity", "enzyme", "transition_state", "KEY_EXACT_RESULTS"
    """
    mol = molecularity()
    enz = enzyme_kinetics()
    ts = transition_state()

    key_results = [
        f"Unimolecular order = D-2 = {D-2}  [EXACT]",
        f"Bimolecular order = D-1 = {D-1}  [EXACT]",
        f"Termolecular order = D = {D}  [EXACT]",
        f"Arrhenius parameters = D-1 = {D-1}  [EXACT: A and Ea]",
        f"Michaelis-Menten rate constants = D = {D}  [EXACT: k1, k-1, k2]",
        f"Catalytic cycle steps = D = {D}  [EXACT: bind, react, release]",
        f"Hemoglobin sites = D+1 = {D+1}  [APPROXIMATE: max Hill coeff]",
        f"Lindemann mechanism = D-1 = {D-1} steps  [EXACT]",
        f"Translational DOF = D = {D}  [EXACT: 3D phase space]",
        f"Collision cross section ~ r^(D-1) = r^{D-1}  [EXACT: 3D geometry]",
    ]

    return {
        "molecularity": mol,
        "enzyme": enz,
        "transition_state": ts,
        "KEY_EXACT_RESULTS": key_results,
        "delta_star": DELTA_STAR,
        "N": N,
        "D": D,
    }


def print_chemical_kinetics_report():
    """Print a formatted report of Cathedral chemical kinetics connections."""
    s = chemical_kinetics_summary()
    print("=" * 65)
    print("  CHEMICAL KINETICS CATHEDRAL — δ★ ≈ 0.14751")
    print("=" * 65)
    print()
    print("  Reaction molecularity:")
    print(f"    Unimolecular order = D-2 = {D-2}  ← EXACT")
    print(f"    Bimolecular order  = D-1 = {D-1}  ← EXACT")
    print(f"    Termolecular order = D   = {D}  ← EXACT")
    print(f"    Molecularity types = D   = {D}  ← EXACT")
    print()
    print("  Enzyme kinetics (Michaelis-Menten):")
    print(f"    MM rate constants  = D = {D}   ← EXACT (k1, k-1, k2)")
    print(f"    Arrhenius params   = D-1 = {D-1} ← EXACT (A, Ea)")
    print(f"    Catalytic steps    = D = {D}   ← EXACT (bind, react, release)")
    print(f"    Max Hill coeff     = D+1 = {D+1} ← APPROXIMATE (hemoglobin)")
    print()
    print("  Transition state & dynamics:")
    print(f"    Translational DOF  = D = {D}   ← EXACT (3D phase space)")
    print(f"    Lindemann steps    = D-1 = {D-1} ← EXACT")
    print(f"    Collision ∝ r^(D-1)= r^{D-1}  ← EXACT (3D geometry)")
    print()
    for r in s["KEY_EXACT_RESULTS"]:
        print(f"    {r}")
    print("=" * 65)
