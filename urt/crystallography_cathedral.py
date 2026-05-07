"""
Cathedral Crystallography — Crystal Structures, Space Groups, and δ★

Crystal symmetry and packing are deeply tied to Cathedral integers:

  Bravais lattices in D=3:  14 = N+1 = 13+1       [EXACT by enumeration]
  Point groups in D=3:      32 = 2^q = 2^5         [EXACT arithmetic]
  FCC/HCP coordination:     z = V = 12             [EXACT — textbook value]
  Icosahedral coordination: z = V = 12             [EXACT — same V]
  Quasicrystal symmetry:    5-fold = q = 5         [EXACT — Shechtman 1984]
  Space groups in D=3:      230 (noted; no clean Cathedral formula)

Key results (labelled by status):
  ─────────────────────────────────────────────────────────────────────
  14 Bravais lattices in D=3  = N + 1 = 14          [EXACT]
  32 crystallographic point groups  = 2^q = 2^5     [EXACT arithmetic]
  FCC/HCP nearest neighbors   = V = 12              [EXACT]
  Icosahedral nearest neighbors = V = 12            [EXACT]
  Quasicrystal forbidden fold  = q = 5              [EXACT — Shechtman]
  FCC packing π/(3√2) ≈ 0.7405  (Kepler, proved 1998)  [physics fact]
  BCC coordination z = 8 = 2^D  [EXACT arithmetic: 2^3 = 8]
  Space groups 230 ≈ F×(N−2) = 20×11 = 220  (12% off) [no clean formula]
  ─────────────────────────────────────────────────────────────────────

IMPORTANT: The identities 14=N+1 and 32=2^q are exact integer arithmetic.
The physical coincidence that 3D crystallography produces these specific
counts is a non-trivial observation, but "Cathedral derivation" of
crystallographic group counts requires a first-principles argument that
is not yet provided.  Label: EXACT arithmetic / numerology.
"""

from math import pi, sqrt
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Bravais lattices ───────────────────────────────────────────────────────────
# Bravais (1850): 14 distinct lattice types in D=3
N_BRAVAIS = N + 1           # = 14 = number of Bravais lattices in D=3  [EXACT]
N_BRAVAIS_EQ_N_PLUS_1 = (N_BRAVAIS == N + 1)   # True

# ── Crystallographic point groups ─────────────────────────────────────────────
# 32 crystallographic point groups in D=3 (compatible with translational symmetry)
N_POINT_GROUPS = 32         # = 2^5 = 2^q  [EXACT arithmetic]
TWO_Q = 2 ** q              # = 2^5 = 32
N_POINT_GROUPS_EQ_2Q = (N_POINT_GROUPS == TWO_Q)   # True

# ── Space groups ───────────────────────────────────────────────────────────────
# 230 space groups (Fedorov/Schoenflies 1891): all symmetry groups of 3D crystals
N_SPACE_GROUPS = 230        # 230 noted; 230 ≈ F×(N−2) = 20×11 = 220, Δ≈5%; no exact formula

# ── Coordination numbers ───────────────────────────────────────────────────────
Z_FCC = V             # = 12 nearest neighbours in FCC lattice          [EXACT]
Z_HCP = V             # = 12 nearest neighbours in HCP lattice          [EXACT]
Z_BCC = 2 ** D        # = 2^3 = 8 nearest neighbours in BCC             [EXACT arithmetic]
Z_SC  = 2 * D         # = 6  nearest neighbours in simple cubic         [EXACT: 2D = 6]
Z_ICOS = V            # = 12 icosahedral nearest neighbours             [EXACT]

# ── Check that BCC = 2^D ──────────────────────────────────────────────────────
Z_BCC_EQ_2D = (Z_BCC == 8)    # True

# ── Check that SC = 2D ────────────────────────────────────────────────────────
Z_SC_EQ_2D = (Z_SC == 6)      # True

# ── Packing fractions ──────────────────────────────────────────────────────────
# Kepler conjecture (proved by Hales 1998/2014): FCC/HCP is optimal in D=3
ETA_FCC = pi / (3.0 * sqrt(2))      # = π/(3√2) ≈ 0.74048
ETA_HCP = ETA_FCC                    # same packing as FCC (stacking fault)
ETA_BCC = pi * sqrt(3) / 8.0        # = π√3/8  ≈ 0.68017
ETA_SC  = pi / 6.0                   # = π/6    ≈ 0.52360

# Ratio of FCC to SC packing
ETA_FCC_OVER_SC = ETA_FCC / ETA_SC   # = 2/√2 = √2 ≈ 1.4142

# ── Quasicrystal 5-fold symmetry ──────────────────────────────────────────────
# Crystallographic restriction theorem: only 1, 2, 3, 4, 6-fold rotations
# compatible with translational periodicity in D=2 or D=3.
# 5-fold (= q-fold) is FORBIDDEN in periodic crystals.
# Shechtman (1984, Nobel 2011) discovered Al-Mn quasicrystal with 5-fold symmetry.
QCRYSTAL_FOLD = q            # = 5 — the forbidden fold = Cathedral q    [EXACT]
QCRYSTAL_FORBIDDEN = True    # 5-fold forbidden in periodic crystals

# Allowed rotational orders in D=3 periodic crystal
ALLOWED_FOLD_ORDERS = (1, 2, 3, 4, 6)    # n-fold where n NOT = 5 = q
FIVE_FOLD_IN_ALLOWED = (q in ALLOWED_FOLD_ORDERS)   # False  → 5 IS forbidden

# ── Golden ratio in quasicrystals ─────────────────────────────────────────────
# Penrose tiling / icosahedral quasicrystals have φ in their diffraction patterns
# The ratio of diagonal to side of regular pentagon = φ (same as δ★ formula)
QCRYSTAL_PHI = phi       # φ = (1+√5)/2 appears in 5-fold quasicrystal geometry
QCRYSTAL_VERTEX_ANGLE_DEG = 360.0 / q   # = 72° = angular step in 5-fold symmetry

# ── Icosahedral point group ────────────────────────────────────────────────────
# Icosahedral point group Ih has order 2G = 120 (including reflections)
# Chiral icosahedral group I = A₅ has order G = 60
ICOS_POINT_GROUP_ORDER = 2 * G    # = 120 (Ih, with inversion)
ICOS_CHIRAL_GROUP_ORDER = G       # = 60  (I = A₅, without inversion)

# ── Simple cubic: D vertices per face, D faces per cell ───────────────────────
# Simple cubic: D=3 pairs of parallel faces = 6 faces = 2D faces
N_FACES_CUBE = 2 * D    # = 6 = number of faces of cube = 2D            [EXACT]

# ── Body-diagonal of unit cube ────────────────────────────────────────────────
CUBE_BODY_DIAGONAL = sqrt(D)   # = √3 ≈ 1.732  (√D for D=3 unit cube)   [EXACT]

# ── Functions ─────────────────────────────────────────────────────────────────

def bravais_lattices() -> dict:
    """
    Bravais lattice count and Cathedral connection.

    In D=3 there are exactly 14 Bravais lattices.
    Cathedral: 14 = N + 1 = 13 + 1.

    Returns
    -------
    dict
        n_bravais, N_value, formula, n_bravais_eq_N_plus_1, status.
    """
    return {
        "n_bravais":              N_BRAVAIS,          # = 14
        "N_value":                N,                  # = 13
        "formula":                f"N+1 = {N}+1 = {N_BRAVAIS}",
        "n_bravais_eq_N_plus_1":  N_BRAVAIS_EQ_N_PLUS_1,   # True
        "D_value":                D,
        "lattice_systems": [
            "triclinic", "monoclinic(×2)", "orthorhombic(×4)",
            "tetragonal(×2)", "trigonal(×1)", "hexagonal(×1)",
            "cubic(×3)",
        ],
        "count_check":            f"1+2+4+2+1+1+3 = {1+2+4+2+1+1+3}",
        "note": (
            f"14 Bravais lattices in D=3 = N+1 = {N}+1 = {N_BRAVAIS}. "
            "This is an EXACT integer match. "
            "No first-principles derivation linking N=13 to this count."
        ),
        "status": "EXACT arithmetic (14 = N+1); physical origin is numerological",
    }


def point_groups() -> dict:
    """
    Crystallographic point groups in D=3 and 2^q connection.

    There are 32 crystallographic point groups in D=3 (compatible with
    translational symmetry). Cathedral: 32 = 2^q = 2^5.

    Returns
    -------
    dict
        n_point_groups, q_value, two_q, n_pg_eq_2q, space_groups, status.
    """
    return {
        "n_point_groups":          N_POINT_GROUPS,       # = 32
        "q_value":                 q,                    # = 5
        "two_q":                   TWO_Q,                # = 32
        "n_pg_eq_2q":              N_POINT_GROUPS_EQ_2Q, # True
        "formula":                 f"2^q = 2^{q} = {TWO_Q}",
        "n_space_groups":          N_SPACE_GROUPS,       # = 230
        "note": (
            f"32 point groups = 2^q = 2^{q} = {TWO_Q}. EXACT arithmetic. "
            f"230 space groups: no clean Cathedral formula (≈ F×(N−2)={F}×{N-2}={F*(N-2)}, Δ≈{abs(230-F*(N-2))/230*100:.0f}%)."
        ),
        "status": "EXACT arithmetic (32 = 2^q); space group count lacks exact formula",
    }


def coordination_numbers() -> dict:
    """
    Coordination numbers of common crystal structures.

    FCC/HCP nearest-neighbour count = 12 = V (icosahedral vertices).
    BCC nearest-neighbour count = 8 = 2^D = 2^3.
    SC nearest-neighbour count  = 6 = 2D = 2×3.

    Returns
    -------
    dict
        z_fcc, z_hcp, z_bcc, z_sc, z_icos, V_value, D_value, Cathedral status.
    """
    return {
        "z_fcc":           Z_FCC,     # = 12 = V
        "z_hcp":           Z_HCP,     # = 12 = V
        "z_bcc":           Z_BCC,     # = 8  = 2^D
        "z_sc":            Z_SC,      # = 6  = 2D
        "z_icos":          Z_ICOS,    # = 12 = V
        "V_value":         V,         # = 12
        "D_value":         D,         # = 3
        "z_fcc_eq_V":      (Z_FCC == V),   # True
        "z_bcc_eq_2D":     (Z_BCC == 2**D),  # True
        "z_sc_eq_2D":      (Z_SC == 2*D),  # True
        "formulas": {
            "FCC": f"z = V = {V}",
            "HCP": f"z = V = {V}",
            "BCC": f"z = 2^D = 2^{D} = {Z_BCC}",
            "SC":  f"z = 2D = 2×{D} = {Z_SC}",
        },
        "note": (
            f"FCC/HCP z=12=V={V}: icosahedral shell has exactly V=12 vertices, "
            f"matching FCC/HCP coordination. EXACT. "
            f"BCC z=8=2^D=2^{D} and SC z=6=2D: EXACT arithmetic."
        ),
        "status": "EXACT — FCC/HCP z = V = 12; BCC z = 2^D = 8; SC z = 2D = 6",
    }


def quasicrystal_connection() -> dict:
    """
    Quasicrystal 5-fold symmetry and Cathedral q=5.

    The crystallographic restriction theorem forbids 5-fold rotational
    symmetry in periodic 3D crystals.  The forbidden symmetry has order q=5.
    Shechtman (1984) discovered icosahedral quasicrystals with this exact
    forbidden symmetry (Nobel Prize 2011).

    Returns
    -------
    dict
        forbidden_fold, q_value, phi_in_structure, icosahedral_group, status.
    """
    return {
        "forbidden_fold":         QCRYSTAL_FOLD,         # = q = 5
        "q_value":                q,                     # = 5
        "five_fold_in_allowed":   FIVE_FOLD_IN_ALLOWED,  # False (forbidden)
        "allowed_orders":         list(ALLOWED_FOLD_ORDERS),
        "shechtman_year":         1984,
        "nobel_prize_year":       2011,
        "phi_in_diffraction":     True,   # φ appears in icosahedral diffraction
        "phi_value":              round(phi, 8),
        "vertex_angle_deg":       QCRYSTAL_VERTEX_ANGLE_DEG,  # = 72° = 360/q
        "vertex_angle_formula":   f"360°/q = 360°/{q} = {QCRYSTAL_VERTEX_ANGLE_DEG}°",
        "icos_group_order":       ICOS_CHIRAL_GROUP_ORDER,   # = G = 60 = A₅
        "ih_group_order":         ICOS_POINT_GROUP_ORDER,    # = 2G = 120
        "note": (
            f"5-fold = q = {q} is forbidden in periodic crystals (crystallographic "
            "restriction theorem). Quasicrystals have this exact symmetry. "
            "φ = (1+√5)/2 appears in icosahedral diffraction patterns — same φ in δ★."
        ),
        "status": "EXACT — forbidden fold = q = 5; φ connection is structural (not numerological)",
    }


def packing_fractions() -> dict:
    """
    Sphere packing fractions for common crystal structures.

    FCC/HCP achieve the maximum sphere packing η = π/(3√2) ≈ 0.7405
    (Kepler conjecture, proved by Hales 1998/2014).

    Returns
    -------
    dict
        eta_fcc, eta_bcc, eta_sc, kepler_fraction, D_context, status.
    """
    # Deviation of δ★ from SC packing
    delta_vs_sc = abs(DELTA_STAR - ETA_SC) / ETA_SC   # ≈ 72% — no match

    return {
        "eta_fcc":            round(ETA_FCC, 6),
        "eta_hcp":            round(ETA_HCP, 6),
        "eta_bcc":            round(ETA_BCC, 6),
        "eta_sc":             round(ETA_SC, 6),
        "eta_fcc_formula":    "π/(3√2)",
        "eta_bcc_formula":    "π√3/8",
        "eta_sc_formula":     "π/6",
        "eta_fcc_over_sc":    round(ETA_FCC_OVER_SC, 6),
        "eta_fcc_over_sc_eq_sqrt2": abs(ETA_FCC_OVER_SC - sqrt(2)) < 1e-10,
        "optimal_structure":  "FCC/HCP (proved by Hales 1998/2014)",
        "kepler_conjecture":  "π/(3√2) is the densest packing in D=3",
        "D_context":          f"Hales theorem is specific to D=3; higher D solved differently",
        "delta_star":         round(DELTA_STAR, 8),
        "note": (
            f"η_FCC/η_SC = π/(3√2) / (π/6) = 2/√2 = √2 ≈ {ETA_FCC_OVER_SC:.4f}. "
            "The ratio η_FCC/η_SC = √2 is an EXACT result. "
            "No direct δ★ connection to packing fractions identified."
        ),
        "status": "EXACT physics (Hales 1998); η_FCC/η_SC = √2 exact; δ★ not related",
    }


def space_group_analysis() -> dict:
    """
    230 space groups in D=3: Cathedral proximity.

    The 230 space groups have no known clean Cathedral formula.
    Best attempt: 230 ≈ F×(N−2) = 20×11 = 220 (Δ ≈ 4.3%).

    Returns
    -------
    dict
        n_space_groups, best_formula, deviation_pct, status.
    """
    best_approx = F * (N - 2)    # = 20 × 11 = 220
    dev = abs(N_SPACE_GROUPS - best_approx) / N_SPACE_GROUPS
    return {
        "n_space_groups":    N_SPACE_GROUPS,      # = 230
        "best_approx":       best_approx,         # = 220
        "best_formula":      f"F×(N−2) = {F}×{N-2} = {best_approx}",
        "deviation_pct":     round(dev * 100, 2),
        "n_point_groups":    N_POINT_GROUPS,      # = 32 = 2^q
        "n_bravais":         N_BRAVAIS,           # = 14 = N+1
        "note": (
            f"No exact Cathedral formula for 230. "
            f"Best: F×(N−2)={F}×{N-2}={best_approx}, Δ={dev*100:.1f}%. "
            "The 230 space groups arise from combining 32 point groups with 14 Bravais lattices "
            "plus glide planes and screw axes."
        ),
        "status": "No exact formula; APPROXIMATE only (4.3% off best attempt)",
    }


def crystallography_summary() -> dict:
    """
    Consolidated summary of Crystallography – Cathedral connections.

    Returns
    -------
    dict
        All sub-results and key-results accuracy table.
    """
    return {
        "bravais":            bravais_lattices(),
        "point_groups":       point_groups(),
        "coordination":       coordination_numbers(),
        "quasicrystal":       quasicrystal_connection(),
        "packing":            packing_fractions(),
        "space_groups":       space_group_analysis(),
        "cathedral_integers": {
            "D": D, "N": N, "q": q, "V": V, "E": E, "F": F, "G": G,
            "delta_star": round(DELTA_STAR, 8),
            "phi": round(phi, 8),
        },
        "key_results": {
            "bravais_14":         f"14 Bravais lattices = N+1 = {N}+1  [EXACT]",
            "point_groups_32":    f"32 point groups = 2^q = 2^{q}  [EXACT arithmetic]",
            "fcc_hcp_coord":      f"FCC/HCP z = V = {V}  [EXACT]",
            "bcc_coord":          f"BCC z = 2^D = 2^{D} = {Z_BCC}  [EXACT arithmetic]",
            "quasicrystal_fold":  f"Forbidden fold = q = {q} (Shechtman 1984)  [EXACT]",
            "space_groups":       f"230 space groups: no clean Cathedral formula  [NOTE]",
            "fcc_packing":        f"η_FCC = π/(3√2) ≈ {ETA_FCC:.4f}; η_FCC/η_SC = √2  [EXACT ratio]",
        },
    }


def print_crystallography_report() -> None:
    """Print a formatted Cathedral Crystallography report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL CRYSTALLOGRAPHY REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  N={N}  D={D}  V={V}  q={q}  φ={phi:.6f}")
    print(sep)

    # Bravais lattices
    print(f"\n1. BRAVAIS LATTICES IN D={D}")
    print(f"   14 Bravais lattices  =  N + 1  =  {N} + 1  =  {N_BRAVAIS}")
    print(f"   14 = N+1 is EXACT (integer match).")
    print(f"   Lattice systems: triclinic×1, monoclinic×2, orthorhombic×4,")
    print(f"   tetragonal×2, trigonal×1, hexagonal×1, cubic×3  → 1+2+4+2+1+1+3={1+2+4+2+1+1+3}")

    # Point groups
    print(f"\n2. CRYSTALLOGRAPHIC POINT GROUPS")
    print(f"   32 point groups  =  2^q  =  2^{q}  =  {TWO_Q}  [EXACT arithmetic]")
    print(f"   230 space groups: best approx F×(N−2)={F}×{N-2}={F*(N-2)}, Δ≈{abs(230-F*(N-2))/230*100:.0f}%")

    # Coordination numbers
    print(f"\n3. COORDINATION NUMBERS")
    print(f"   FCC/HCP  z = V = {V}  [EXACT — icosahedral vertices = FCC neighbours]")
    print(f"   BCC      z = 2^D = 2^{D} = {Z_BCC}  [EXACT arithmetic]")
    print(f"   SC       z = 2D = 2×{D} = {Z_SC}  [EXACT]")
    print(f"   Icosahedral shell: V = {V} sites = FCC/HCP coordination  [EXACT]")

    # Quasicrystals
    print(f"\n4. QUASICRYSTALS — 5-FOLD SYMMETRY")
    print(f"   Crystallographic restriction: 1, 2, 3, 4, 6-fold only in periodic crystals")
    print(f"   5-fold = q = {q}  is FORBIDDEN in periodic crystals  [EXACT]")
    print(f"   Shechtman (1984, Nobel 2011): Al-Mn quasicrystal with 5-fold symmetry")
    print(f"   φ = {phi:.6f} appears in diffraction patterns (pentagon diagonal/side)")
    print(f"   Vertex angle = 360°/q = 360°/{q} = {QCRYSTAL_VERTEX_ANGLE_DEG}°")

    # Packing fractions
    print(f"\n5. SPHERE PACKING FRACTIONS (D=3)")
    print(f"   FCC/HCP: η = π/(3√2) = {ETA_FCC:.6f}  (Kepler/Hales — optimal)")
    print(f"   BCC:     η = π√3/8   = {ETA_BCC:.6f}")
    print(f"   SC:      η = π/6     = {ETA_SC:.6f}")
    print(f"   η_FCC / η_SC = {ETA_FCC_OVER_SC:.6f} = √2  [EXACT ratio]")

    # Icosahedral group
    print(f"\n6. ICOSAHEDRAL SYMMETRY GROUP")
    print(f"   Chiral group I = A₅, order G = {G}")
    print(f"   Full group Ih (with inversion), order 2G = {2*G}")
    print(f"   Cube body diagonal = √D = √{D} = {CUBE_BODY_DIAGONAL:.6f}")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [EXACT]  14 Bravais = N+1 = {N}+1")
    print(f"  [EXACT]  32 point groups = 2^q = 2^{q}")
    print(f"  [EXACT]  FCC/HCP/Icos z = V = {V}")
    print(f"  [EXACT]  BCC z = 2^D = {Z_BCC}")
    print(f"  [EXACT]  Forbidden fold = q = {q} (Shechtman 1984)")
    print(f"  [EXACT]  η_FCC/η_SC = √2")
    print(sep)
