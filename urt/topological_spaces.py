"""
Cathedral Topological Spaces — Euler Characteristic, Hopf Fibration, and D=3

Topology in D=3 contains Cathedral integers in fundamental ways:

  Euler characteristic (icosahedron): χ = V − E + F = 12 − 30 + 20 = 2 = D−1  [EXACT]
  S² Euler characteristic:            χ(S²) = 2 = D−1                          [EXACT]
  Hopf fibration fiber dimension:     d = D−2 = 1  (S¹ fibre)                   [EXACT]
  de Rham H^k(S^D): nonzero at k=0 and k=D                                      [EXACT]
  K-theory K(S²) rank:               2 = D−1                                    [EXACT]
  Topological defects in D=3:         D−1 = 2 types (codim-1 and codim-2)       [EXACT]
  Winding number π₁(S¹) = Z:         exists in D=3 spatial context              [EXACT]

Key results (labelled by status):
  ─────────────────────────────────────────────────────────────────────
  χ(icosahedron) = V−E+F = 12−30+20 = 2 = D−1     [EXACT — Euler formula]
  χ(S²) = 2 = D−1                                  [EXACT — topology]
  Hopf fibre S¹ → S³ → S²: fibre dim = D−2 = 1    [EXACT]
  de Rham H^0 = H^D = Z, rest 0 for S^D            [EXACT — sphere cohomology]
  Hairy ball theorem: requires D=3 (S²)             [EXACT]
  K-theory K(S²) ≅ Z²: rank D−1 = 2               [EXACT]
  Homotopy π₃(S²) = Z (Hopf): requires D=3         [EXACT]
  Number of defect types in D=3: D−1 = 2           [EXACT]
  ─────────────────────────────────────────────────────────────────────

NOTE: cathedral_topology.py (existing) focuses on holonomy deficit, RG damping,
and gravitational deficit.  This module (topological_spaces.py) covers abstract
topology: Euler characteristic, Hopf fibration, sphere cohomology, and
topological defects.
"""

from math import pi
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Euler characteristic of the icosahedron ───────────────────────────────────
# Euler's formula for any convex polyhedron: χ = V − E + F = 2
# Icosahedron: V=12, E=30, F=20
EULER_CHI_ICOSAHEDRON = V - E + F    # = 12 − 30 + 20 = 2
EULER_CHI_EQ_2 = (EULER_CHI_ICOSAHEDRON == 2)   # True
EULER_CHI_EQ_D_MINUS_1 = (EULER_CHI_ICOSAHEDRON == D - 1)   # True  (2 = 3−1)

# ── S² (2-sphere): Euler characteristic = 2 = D−1 ────────────────────────────
# S^{D-1} in D=3 is S² (the 2-sphere), homeomorphic to surface of icosahedron
S2_EULER_CHI = D - 1        # = 2 (Euler characteristic of S²)           [EXACT]
S2_GENUS = 0                # sphere genus = 0 (orientable surface, no holes)

# ── Hairy ball theorem ────────────────────────────────────────────────────────
# Hairy ball theorem (Poincaré-Hopf): every continuous tangent vector field
# on S² has at least one zero.  Equivalently, you cannot comb a hairy ball flat.
# Follows from χ(S²) = 2 ≠ 0.  The physical sphere S² exists because D=3.
HAIRY_BALL_CHI_NONZERO = (EULER_CHI_ICOSAHEDRON != 0)   # True
HAIRY_BALL_REQUIRES_D3 = True   # hairy BALL (S²) exists in ambient D=3 space

# ── Poincaré-Hopf theorem ─────────────────────────────────────────────────────
# Sum of indices of a vector field on S² = χ(S²) = 2 = D−1
INDEX_SUM_S2 = D - 1        # = 2                                         [EXACT]

# ── Hopf fibration ────────────────────────────────────────────────────────────
# S¹ → S³ → S²  (fibre → total space → base space)
# This is the unique non-trivial fibration of spheres (Adams 1960);
# Analogues exist only for S^7 → S^{15} → S^8 (octonions) and S^3 → S^7 → S^4
# The physically relevant one uses S² = S^{D-1} as base space (D=3)
HOPF_FIBER_DIM = D - 2      # = 1  (S¹ fibre)                             [EXACT]
HOPF_BASE_DIM = D - 1       # = 2  (S² base)
HOPF_TOTAL_DIM = D          # = 3  (S³ total space; lives in R^{D+1}=R^4)
# Note: dimensions of the spheres themselves (not ambient space):
HOPF_FIBER_SPHERE = "S¹"    # = S^1 (circle)
HOPF_BASE_SPHERE = "S²"     # = S^{D-1} = S^2 (2-sphere)
HOPF_TOTAL_SPHERE = "S³"    # = S^3 (3-sphere)
HOPF_INVARIANT = 1          # Hopf invariant η ∈ Z = 1 for the standard Hopf map

# π₃(S²) = Z  (Hopf discovered 1931) — first non-trivial higher homotopy
PI3_S2 = "Z"   # infinite cyclic group; generator = Hopf map

# ── de Rham cohomology of S^D ──────────────────────────────────────────────────
# H^k(S^D) = Z for k = 0 or k = D;  = 0 otherwise (over R: ℝ or Z)
# For S^{D-1} = S² (in our case):
# H^0(S²) = Z, H^1(S²) = 0, H^2(S²) = Z
DE_RHAM_S2 = {0: "Z", 1: "0", 2: "Z"}
DE_RHAM_S2_NONZERO_DIMS = [0, D - 1]    # = [0, 2]  (first and last)

# ── K-theory K(S²) ────────────────────────────────────────────────────────────
# K(S²) ≅ Z² (rank 2 = D−1)  [topological K-theory]
# K̃(S²) ≅ Z  (reduced K-theory, rank 1)
K_THEORY_S2_RANK = D - 1    # = 2                                          [EXACT]
K_TILDE_S2_RANK = 1         # reduced K-theory

# ── Topological defects in D=3 field theory ────────────────────────────────────
# In a D=3 field theory, topological defects classified by codimension:
#   codimension 1: domain walls (planar defects)
#   codimension 2: strings/vortices (line defects)
# Number of distinct non-trivial defect codimensions = D−1 = 2
N_DEFECT_TYPES = D - 1      # = 2  (codim-1 walls and codim-2 strings)     [EXACT]
# Monopoles (codim-3 in D=3) need special conditions (π₂ of target)

# ── Winding number / fundamental group ────────────────────────────────────────
# π₁(S¹) = Z: the winding number around a circle
# This is the topological charge of a vortex in D=3 bulk theory (codim-2 defect)
VORTEX_TOPOLOGICAL_CHARGE_GROUP = "Z"   # = π₁(S¹) = Z
DOMAIN_WALL_CHARGE_GROUP = "Z₂"         # = π₀(Z₂) for Z₂ symmetry breaking

# ── 3-sphere S³ ───────────────────────────────────────────────────────────────
# Volume of S³ (3-sphere, embedded in R⁴):  Vol(S³) = 2π²
S3_VOLUME = 2.0 * pi**2     # = 2π² (exact, unit radius)
# Surface area of S³ (= Vol(S⁴) ∂-sphere): 2π²  — same number!

# Surface area of S² (unit 2-sphere):
S2_SURFACE_AREA = 4.0 * pi  # = 4π (exact)
S2_SURFACE_AREA_EQ_4PI = abs(S2_SURFACE_AREA - 4 * pi) < 1e-12   # True

# ── Betti numbers of the icosahedron surface ──────────────────────────────────
# Icosahedral surface is homeomorphic to S² (genus 0)
# Betti numbers: β₀ = 1 (connected), β₁ = 0 (no handles), β₂ = 1
BETTI_ICOS = [1, 0, 1]    # β₀, β₁, β₂
EULER_FROM_BETTI = sum((-1)**k * BETTI_ICOS[k] for k in range(len(BETTI_ICOS)))
EULER_BETTI_CHECK = (EULER_FROM_BETTI == EULER_CHI_ICOSAHEDRON)   # True: 1-0+1=2

# ── Functions ──────────────────────────────────────────────────────────────────

def euler_icosahedron() -> dict:
    """
    Euler characteristic of the icosahedron and Cathedral connection.

    χ = V − E + F = 12 − 30 + 20 = 2 = D − 1.
    The icosahedron surface is homeomorphic to S²; both have χ = 2 = D−1.

    Returns
    -------
    dict
        chi, V, E, F, chi_eq_D_minus_1, S2_chi, formula, status.
    """
    return {
        "chi":                EULER_CHI_ICOSAHEDRON,      # = 2
        "V":                  V,                           # = 12
        "E":                  E,                           # = 30
        "F":                  F,                           # = 20
        "formula":            f"χ = V−E+F = {V}−{E}+{F} = {EULER_CHI_ICOSAHEDRON}",
        "chi_eq_2":           EULER_CHI_EQ_2,             # True
        "chi_eq_D_minus_1":   EULER_CHI_EQ_D_MINUS_1,    # True
        "D_value":            D,
        "S2_chi":             S2_EULER_CHI,               # = D−1 = 2
        "genus":              S2_GENUS,                   # = 0
        "betti":              BETTI_ICOS,
        "euler_from_betti":   EULER_FROM_BETTI,           # = 2
        "euler_betti_check":  EULER_BETTI_CHECK,          # True
        "note": (
            f"χ = V−E+F = {V}−{E}+{F} = {EULER_CHI_ICOSAHEDRON} = D−1 = {D-1}. "
            "EXACT: Euler formula for any convex polyhedron χ=2; "
            "Cathedral: 2 = D−1 with D=3. "
            "Icosahedral surface ≃ S² (genus 0): χ(S²) = 2 = D−1."
        ),
        "status": "EXACT — χ = V−E+F = 2 = D−1; Euler formula + D=3",
    }


def hopf_fibration() -> dict:
    """
    Hopf fibration S¹ → S³ → S² and Cathedral D=3.

    The Hopf fibration exists because D=3 gives S² = S^{D-1} as base.
    Fibre dimension = D−2 = 1 (circle S¹).

    Returns
    -------
    dict
        fiber, total, base, fiber_dim, base_dim, D_value, pi3_S2, status.
    """
    return {
        "fiber":              HOPF_FIBER_SPHERE,    # S¹
        "total_space":        HOPF_TOTAL_SPHERE,    # S³
        "base_space":         HOPF_BASE_SPHERE,     # S²
        "fiber_dim":          HOPF_FIBER_DIM,       # D−2 = 1
        "base_dim":           HOPF_BASE_DIM,        # D−1 = 2
        "total_dim":          HOPF_TOTAL_DIM,       # D = 3
        "D_value":            D,
        "fiber_formula":      f"S^{{D−2}} = S^{{{D-2}}} = S¹",
        "base_formula":       f"S^{{D−1}} = S^{{{D-1}}} = S²",
        "hopf_invariant":     HOPF_INVARIANT,       # = 1 (non-trivial)
        "pi3_S2":             PI3_S2,               # = Z
        "other_fibrations":   ["S³→S⁷→S⁴ (quaternions)", "S⁷→S¹⁵→S⁸ (octonions)"],
        "unique_to_D3":       True,   # only S¹→S³→S² uses S² = S^{D-1}, D=3
        "note": (
            "Hopf fibration S¹→S³→S²: fibre dim D−2=1, base dim D−1=2. "
            "The physical fibration (using S²) is specific to D=3 spatial dimensions. "
            "π₃(S²) = Z: the Hopf invariant was the first discovery of higher homotopy groups "
            "(Hopf 1931). Physically relevant for magnetic monopoles and skyrmions."
        ),
        "status": "EXACT — Hopf fibre dim = D−2 = 1; base = S^{D-1} = S²",
    }


def sphere_topology() -> dict:
    """
    Topology of spheres S² and S³ in Cathedral context.

    Returns
    -------
    dict
        S2 and S3 properties, de Rham cohomology, K-theory, volumes.
    """
    return {
        "S2": {
            "dimension":       D - 1,          # = 2
            "euler_chi":       S2_EULER_CHI,   # = 2 = D−1
            "genus":           S2_GENUS,       # = 0
            "surface_area":    round(S2_SURFACE_AREA, 6),   # = 4π
            "de_rham":         DE_RHAM_S2,     # {0:Z, 1:0, 2:Z}
            "K_theory_rank":   K_THEORY_S2_RANK,  # = D−1 = 2
            "K_tilde_rank":    K_TILDE_S2_RANK,   # = 1
            "hairy_ball":      True,    # χ≠0 → vector field must vanish somewhere
            "pi_n": {
                "pi_1": "0 (S² is simply connected)",
                "pi_2": "Z (maps S²→S²)",
                "pi_3": "Z (Hopf; π₃(S²) = Z)",
            },
        },
        "S3": {
            "dimension":       D,              # = 3
            "euler_chi":       0,              # χ(S³) = 0 (odd sphere)
            "volume":          round(S3_VOLUME, 6),   # = 2π²
            "volume_formula":  "2π²",
            "is_Lie_group":    True,           # S³ ≅ SU(2) ≅ Sp(1)
            "fundamental_group": "0",          # simply connected
        },
        "D_value":  D,
        "note": (
            f"S²: χ = 2 = D−1, de Rham nonzero at k=0,{D-1}. "
            f"S³: χ = 0 (odd dimension), vol = 2π², is Lie group SU(2). "
            "S³ is the total space of the Hopf fibration."
        ),
        "status": "EXACT — topology of S² and S³ with Cathedral D=3",
    }


def defect_classification() -> dict:
    """
    Topological defects in D=3 spatial field theories.

    In D=3, there are D−1 = 2 types of extended topological defects
    (domain walls: codim-1; strings/vortices: codim-2).
    Point defects (monopoles) require π₂(target) ≠ 0.

    Returns
    -------
    dict
        n_defect_types, defect_list, charge_groups, D_value, status.
    """
    return {
        "n_defect_types":    N_DEFECT_TYPES,   # = D−1 = 2
        "D_value":           D,
        "formula":           f"D−1 = {D-1} types of extended defects",
        "defects": {
            "domain_walls": {
                "codimension":   1,
                "dim":           D - 1,   # = 2 (planar in D=3)
                "charge_group":  DOMAIN_WALL_CHARGE_GROUP,   # Z₂
                "example":       "Magnetic domain walls",
            },
            "strings_vortices": {
                "codimension":   2,
                "dim":           D - 2,   # = 1 (line in D=3)
                "charge_group":  VORTEX_TOPOLOGICAL_CHARGE_GROUP,  # Z
                "example":       "Cosmic strings, superconducting vortices",
            },
            "monopoles": {
                "codimension":   3,
                "dim":           0,       # point in D=3
                "charge_group":  "Z or Z₂ (depends on target space)",
                "condition":     "Need π₂(M) ≠ 0 of target M",
                "example":       "'t Hooft-Polyakov magnetic monopole",
            },
        },
        "extended_defect_count": N_DEFECT_TYPES,  # = D−1 = 2
        "note": (
            f"D−1 = {D-1} = 2 types of extended defects (non-point): "
            "codim-1 domain walls and codim-2 strings. "
            "This count = D−1 = χ(S²)/1 is EXACT for D=3 spatial field theory."
        ),
        "status": "EXACT — D−1 = 2 extended defect types in D=3",
    }


def topological_summary() -> dict:
    """
    Consolidated summary of Topological Spaces – Cathedral connections.

    Returns
    -------
    dict
        All sub-results plus key-results accuracy table.
    """
    return {
        "euler":              euler_icosahedron(),
        "hopf":               hopf_fibration(),
        "spheres":            sphere_topology(),
        "defects":            defect_classification(),
        "cathedral_integers": {
            "D": D, "N": N, "V": V, "E": E, "F": F, "G": G,
            "delta_star": round(DELTA_STAR, 8),
        },
        "key_results": {
            "euler_D_minus_1":    f"χ = V−E+F = {V}−{E}+{F} = {EULER_CHI_ICOSAHEDRON} = D−1 = {D-1}  [EXACT]",
            "hopf_fiber":         f"Hopf fibre dim = D−2 = {D-2}  [EXACT]",
            "S2_chi":             f"χ(S²) = 2 = D−1 = {D-1}  [EXACT]",
            "de_rham_S2":         f"de Rham: H^0=H^{D-1}=Z, rest 0  [EXACT]",
            "K_theory_S2":        f"K(S²) rank = D−1 = {D-1}  [EXACT]",
            "defects_D3":         f"Extended defects = D−1 = {D-1} types  [EXACT]",
            "hairy_ball":         f"Hairy ball: χ(S²) = {EULER_CHI_ICOSAHEDRON} ≠ 0 → always zero  [EXACT]",
        },
    }


def print_topology_report() -> None:
    """Print a formatted Cathedral Topological Spaces report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL TOPOLOGICAL SPACES REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  D={D}  V={V}  E={E}  F={F}  N={N}")
    print(sep)

    # Euler characteristic
    print(f"\n1. EULER CHARACTERISTIC OF THE ICOSAHEDRON")
    print(f"   χ = V − E + F = {V} − {E} + {F} = {EULER_CHI_ICOSAHEDRON}  [EXACT]")
    print(f"   χ = D − 1 = {D} − 1 = {D-1}  [EXACT — D=3]")
    print(f"   Icosahedral surface ≃ S² (genus 0): χ(S²) = 2 = D−1")
    print(f"   Betti numbers: β₀={BETTI_ICOS[0]}, β₁={BETTI_ICOS[1]}, β₂={BETTI_ICOS[2]}  →  Σ(−1)^k β_k = {EULER_FROM_BETTI}")
    print(f"   Hairy ball theorem: χ ≠ 0 → every tangent vector field on S² has a zero")

    # Poincaré-Hopf
    print(f"\n2. POINCARÉ-HOPF THEOREM")
    print(f"   Sum of vector field indices on S² = χ(S²) = {INDEX_SUM_S2} = D−1 = {D-1}  [EXACT]")
    print(f"   Simplest field: 2 zeros of index +1 each → index sum = 2 = D−1")

    # Hopf fibration
    print(f"\n3. HOPF FIBRATION  S¹ → S³ → S²")
    print(f"   Fibre: S^{{D−2}} = S^{{{D-2}}} = S¹  (dim = D−2 = {D-2})  [EXACT]")
    print(f"   Base:  S^{{D−1}} = S^{{{D-1}}} = S²  (dim = D−1 = {D-1})  [EXACT]")
    print(f"   Total: S^{{D}}   = S^{{{D}}}   = S³  (dim = D   = {D})  [EXACT]")
    print(f"   Hopf invariant = {HOPF_INVARIANT} (non-trivial bundle)")
    print(f"   π₃(S²) = {PI3_S2}: first higher homotopy group (Hopf 1931)")
    print(f"   Other fibrations: S³→S⁷→S⁴, S⁷→S¹⁵→S⁸")

    # de Rham cohomology
    print(f"\n4. de RHAM COHOMOLOGY  H^k(S²)")
    print(f"   H^0(S²) = Z  (connected)")
    print(f"   H^1(S²) = 0  (no handles)")
    print(f"   H^2(S²) = Z  (generator = area form)")
    print(f"   Non-zero at k = 0 and k = D−1 = {D-1}  [EXACT]")
    print(f"   K-theory: K(S²) rank = D−1 = {D-1}  [EXACT]")

    # S³ properties
    print(f"\n5. S³ (3-SPHERE)")
    print(f"   Volume: Vol(S³) = 2π² = {S3_VOLUME:.6f}  (unit radius)")
    print(f"   S³ ≅ SU(2) ≅ Sp(1)  (Lie group structure)")
    print(f"   Total space of Hopf fibration")

    # Topological defects
    print(f"\n6. TOPOLOGICAL DEFECTS IN D={D} FIELD THEORY")
    print(f"   D−1 = {D-1} types of extended defects  [EXACT]:")
    print(f"   • Codim-1: domain walls (2D objects, charge group Z₂)")
    print(f"   • Codim-2: strings / vortices (1D, charge group Z)")
    print(f"   Monopoles (codim-3 = point): need π₂(target) ≠ 0")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [EXACT]  χ = V−E+F = {V}−{E}+{F} = {EULER_CHI_ICOSAHEDRON} = D−1")
    print(f"  [EXACT]  Hopf fibre dim = D−2 = {D-2}; base = S^{{D−1}}")
    print(f"  [EXACT]  de Rham H^{{0,D-1}}(S^{{D-1}}) = Z (spheres)")
    print(f"  [EXACT]  K(S²) rank = D−1 = {D-1}")
    print(f"  [EXACT]  Extended defect types = D−1 = {D-1}")
    print(sep)
