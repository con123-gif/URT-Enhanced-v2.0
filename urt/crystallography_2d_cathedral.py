"""
Cathedral 2D Crystallography — Wallpaper Groups, Surface Science, and δ★

Two-dimensional crystallography is saturated with Cathedral integers:

  Bravais lattices in 2D    = q = 5        (5 Bravais nets)        [EXACT!!!]
  Crystallographic PGs in 2D = N−D = 10    (10 point groups)       [EXACT: 13−3=10]
  Hexagonal coordination    = V/2 = 6      (6 nearest neighbours)  [EXACT]
  Square coordination       = D+1 = 4      (4 nearest neighbours)  [EXACT]
  Honeycomb coordination    = D = 3        (graphene z=3)          [EXACT!!!]
  Allowed rotations in 2D   = q = 5        (1,2,3,4,6-fold)        [EXACT]
  Graphene sublattices      = D−1 = 2      (A and B)               [EXACT]
  Graphene Dirac valleys    = D−1 = 2      (K and K')              [EXACT]
  Penrose fold symmetry     = q = 5        (5-fold quasicrystal)   [EXACT]
  2D quasicrystal fold      = q = 5        (decagonal order)       [EXACT]
  Wallpaper groups          = 17           (17 = N+D+1)            [EXACT arithmetic]

Key results:
  ─────────────────────────────────────────────────────────────────────
  2D Bravais lattices = q = 5                EXACT
  Point groups 2D = N−D = 10                 EXACT
  Honeycomb coord = D = 3 (graphene)         EXACT
  Allowed 2D rotations = q = 5              EXACT
  Penrose fold = q = 5                       EXACT
  Golden ratio φ in Penrose tiling           EXACT
  ─────────────────────────────────────────────────────────────────────

Note on wallpaper groups: 17 = N + D + 1 = 13 + 3 + 1 is an exact
arithmetic identity.  The classification theorem (1891, Fedorov/Schoenflies)
establishes exactly 17 distinct planar symmetry groups.
"""

from math import sqrt, pi, log, isfinite
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Wallpaper groups ─────────────────────────────────────────────────────────
# The 17 wallpaper groups classify all 2D periodic tilings up to isomorphism.
# 17 = N + D + 1 = 13 + 3 + 1  [EXACT arithmetic]
N_WALLPAPER_GROUPS = N + D + 1   # = 17  [EXACT arithmetic identity]
N_WALLPAPER_GROUPS_VALUE = 17    # confirmed value

# ── 2D crystallographic point groups ────────────────────────────────────────
# Exactly 10 crystallographic point groups in 2D (1,2,3,4,6 + mirror variants)
# 10 = N − D = 13 − 3  [EXACT]
N_POINT_GROUPS_2D = N - D        # = 10  [EXACT: 13−3 = 10]

# ── 2D Bravais lattices ──────────────────────────────────────────────────────
# Five 2D Bravais nets: oblique, rectangular, centred rectangular,
# square, hexagonal
N_BRAVAIS_2D = q                 # = 5  [EXACT!!!]

# ── Lattice coordination numbers ─────────────────────────────────────────────
HEXAGONAL_COORD   = V // 2       # = 6  [EXACT: hexagonal close-packed]
TRIANGULAR_COORD  = V // 2       # = 6  [EXACT: same as hexagonal]
SQUARE_COORD      = D + 1        # = 4  [EXACT: square lattice]
HONEYCOMB_COORD   = D            # = 3  [EXACT!!!: graphene / honeycomb]
KAGOME_COORD      = D + 1        # = 4  [APPROXIMATE: kagome lattice z≈4]

# ── Allowed crystallographic rotations in 2D ─────────────────────────────────
# Crystallographic restriction theorem: only 1, 2, 3, 4, 6-fold rotations
# allowed → 5 = q distinct fold values
N_ALLOWED_ROT_2D  = q            # = 5  [EXACT]
ALLOWED_FOLDS_2D  = [1, 2, 3, 4, 6]  # the 5 allowed fold values

# ── Graphene sublattice structure ─────────────────────────────────────────────
GRAPHENE_SUBLATTICES  = D - 1    # = 2  [EXACT: A and B sublattice]
GRAPHENE_DIRAC_POINTS = D - 1    # = 2  [EXACT: K and K' valleys]

# ── Penrose tiling ────────────────────────────────────────────────────────────
PENROSE_FOLD      = q            # = 5  [EXACT: pentagonal/5-fold symmetry]
QUASICRYSTAL_2D_FOLD = q        # = 5  [EXACT: decagonal quasicrystals]
PHI_IN_PENROSE    = phi          # φ = (1+√5)/2 appears in Penrose geometry [EXACT]

# ── Additional 2D physics connections ────────────────────────────────────────
# Graphene Brillouin zone: hexagonal → 6 = V/2 K-point corners
GRAPHENE_BZ_CORNERS = V // 2    # = 6  [EXACT]
# 2D Ising model: square lattice z=4=D+1
ISING_2D_SQUARE_COORD = D + 1   # = 4  [EXACT]
# 2D critical exponent: η = 1/4 (exact for 2D Ising)
ETA_ISING_2D = 1.0 / (2 * (D - 1))   # = 1/4  [EXACT for 2D Ising]


def bravais_2d() -> dict:
    """
    2D Bravais lattice system — Cathedral connection.

    There are exactly q=5 distinct 2D Bravais lattices (Bravais nets).

    Returns
    -------
    dict
        n_bravais, n_bravais_eq_q, lattice_names, note.
    """
    return {
        "n_bravais":           N_BRAVAIS_2D,
        "n_bravais_eq_q":      N_BRAVAIS_2D == q,
        "lattice_names":       [
            "oblique (p1/p2)",
            "rectangular (pm/pg/pmm/...)",
            "centred rectangular (cm/cmm)",
            "square (p4/p4m/p4g)",
            "hexagonal (p3/p6/...)",
        ],
        "q_value":             q,
        "note": (
            f"5 = q = {q} Bravais lattices in 2D — EXACT arithmetic. "
            "The icosahedral q=5 matches the number of distinct 2D Bravais nets."
        ),
        "status": "EXACT: N_Bravais_2D = q = 5",
    }


def point_groups_2d() -> dict:
    """
    2D crystallographic point groups — Cathedral connection.

    There are exactly 10 = N−D crystallographic point groups in 2D.

    Returns
    -------
    dict
        n_pg, n_pg_eq_N_D, allowed_rotations, note.
    """
    return {
        "n_pg":                N_POINT_GROUPS_2D,
        "n_pg_eq_N_D":         N_POINT_GROUPS_2D == N - D,
        "formula":             f"N − D = {N} − {D} = {N - D}",
        "point_groups_list":   ["1", "2", "m", "2mm", "4", "4mm",
                                "3", "3m", "6", "6mm"],
        "n_allowed_rots":      N_ALLOWED_ROT_2D,
        "allowed_rots_eq_q":   N_ALLOWED_ROT_2D == q,
        "allowed_folds":       ALLOWED_FOLDS_2D,
        "wallpaper_groups":    N_WALLPAPER_GROUPS,
        "wallpaper_formula":   f"N + D + 1 = {N} + {D} + 1 = {N_WALLPAPER_GROUPS}",
        "note": (
            f"10 = N−D = {N}−{D} crystallographic point groups in 2D [EXACT]. "
            f"5 = q allowed rotation folds in 2D [EXACT]. "
            f"17 = N+D+1 wallpaper groups [EXACT arithmetic]."
        ),
        "status": "EXACT: N_PG_2D = N−D = 10; allowed rots = q = 5",
    }


def lattice_structures_2d() -> dict:
    """
    2D lattice coordination numbers — Cathedral connections.

    Returns
    -------
    dict
        hexagonal_coord, square_coord, honeycomb_coord, honeycomb_eq_D,
        graphene_sublattices, graphene_dirac_pts, note.
    """
    return {
        "hexagonal_coord":          HEXAGONAL_COORD,
        "hexagonal_eq_V2":          HEXAGONAL_COORD == V // 2,
        "triangular_coord":         TRIANGULAR_COORD,
        "square_coord":             SQUARE_COORD,
        "square_eq_D1":             SQUARE_COORD == D + 1,
        "honeycomb_coord":          HONEYCOMB_COORD,
        "honeycomb_eq_D":           HONEYCOMB_COORD == D,
        "kagome_coord":             KAGOME_COORD,
        "graphene_sublattices":     GRAPHENE_SUBLATTICES,
        "graphene_sublattices_eq_D1": GRAPHENE_SUBLATTICES == D - 1,
        "graphene_dirac_points":    GRAPHENE_DIRAC_POINTS,
        "graphene_dirac_eq_D1":     GRAPHENE_DIRAC_POINTS == D - 1,
        "graphene_bz_corners":      GRAPHENE_BZ_CORNERS,
        "graphene_bz_eq_V2":        GRAPHENE_BZ_CORNERS == V // 2,
        "eta_ising_2d":             ETA_ISING_2D,
        "note": (
            f"Hexagonal coord = V/2={V//2} [EXACT]. "
            f"Square coord = D+1={D+1} [EXACT]. "
            f"Honeycomb (graphene) coord = D={D} [EXACT!!!]. "
            f"Graphene: {GRAPHENE_SUBLATTICES} sublattices, {GRAPHENE_DIRAC_POINTS} Dirac pts = D−1={D-1} [EXACT]."
        ),
        "status": "EXACT: honeycomb=D=3; hexagonal=V/2=6; square=D+1=4",
    }


def penrose_tiling() -> dict:
    """
    Penrose tiling and 2D quasicrystals — Cathedral connections.

    Penrose tiling exhibits q=5-fold (pentagonal) symmetry and is built
    on the golden ratio φ, both Cathedral constants.

    Returns
    -------
    dict
        fold, fold_eq_q, phi, phi_value, note.
    """
    # Penrose inflation ratio = φ
    inflation_ratio = phi
    # Tile types in Penrose P2/P3: 2 = D−1
    n_tile_types = D - 1   # = 2 (kite/dart or fat/thin rhombus)
    return {
        "fold":                PENROSE_FOLD,
        "fold_eq_q":           PENROSE_FOLD == q,
        "phi":                 round(phi, 10),
        "phi_formula":         "(1+√5)/2",
        "inflation_ratio":     round(inflation_ratio, 10),
        "n_tile_types":        n_tile_types,
        "n_tile_types_eq_D1":  n_tile_types == D - 1,
        "quasicrystal_fold":   QUASICRYSTAL_2D_FOLD,
        "decagonal_fold":      2 * q,   # = 10 (decagonal quasicrystals)
        "note": (
            f"Penrose tiling: q={q}-fold symmetry [EXACT]. "
            f"Inflation ratio = φ={phi:.6f} (golden ratio, from N={N}) [EXACT]. "
            f"2 tile types = D−1={D-1} [EXACT]. "
            "Decagonal quasicrystals have 2q=10-fold symmetry."
        ),
        "status": "EXACT: Penrose fold = q = 5; φ in tiling = Cathedral φ",
    }


def crystallography_2d_summary() -> dict:
    """
    Consolidated Cathedral 2D Crystallography summary.

    Returns
    -------
    dict
        "bravais", "lattices", "penrose", "key_results", "cathedral_integers".
    """
    bravais = bravais_2d()
    pg = point_groups_2d()
    lattices = lattice_structures_2d()
    penrose = penrose_tiling()
    return {
        "bravais":  bravais,
        "point_groups": pg,
        "lattices": lattices,
        "penrose":  penrose,
        "cathedral_integers": {
            "D": D, "N": N, "q": q, "V": V, "E": E, "F": F, "G": G,
            "phi": round(phi, 6),
            "delta_star": round(DELTA_STAR, 8),
        },
        "key_results": [
            f"2D Bravais lattices = q = {q}  [EXACT]",
            f"2D point groups = N−D = {N-D}  [EXACT]",
            f"Allowed 2D rotations = q = {q} (folds: 1,2,3,4,6)  [EXACT]",
            f"Wallpaper groups = N+D+1 = {N+D+1}  [EXACT arithmetic]",
            f"Hexagonal coord = V/2 = {V//2}  [EXACT]",
            f"Square coord = D+1 = {D+1}  [EXACT]",
            f"Honeycomb (graphene) coord = D = {D}  [EXACT]",
            f"Graphene sublattices = D−1 = {D-1}  [EXACT]",
            f"Penrose fold = q = {q}  [EXACT]",
            f"φ in Penrose inflation = {phi:.6f}  [EXACT]",
        ],
    }


def print_crystallography_2d_report() -> None:
    """Print a formatted Cathedral 2D Crystallography report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL 2D CRYSTALLOGRAPHY REPORT")
    print(f"  δ★={DELTA_STAR:.6f}  N={N}  D={D}  q={q}  V={V}  φ={phi:.6f}")
    print(sep)

    print(f"\n1. 2D BRAVAIS LATTICES = q = {q}  [EXACT]")
    print(f"   5 Bravais nets: oblique, rectangular, centred-rect, square, hexagonal")
    print(f"   N={N} icosahedral shell; q={q} = 5-fold symmetry = 5 lattice types")

    print(f"\n2. 2D POINT GROUPS = N−D = {N}−{D} = {N-D}  [EXACT]")
    print(f"   Crystallographic restriction: only 1,2,3,4,6-fold allowed")
    print(f"   Allowed rotations = q = {q} distinct fold values  [EXACT]")
    print(f"   Wallpaper groups = N+D+1 = {N+D+1}  [EXACT arithmetic]")

    print(f"\n3. LATTICE COORDINATION NUMBERS")
    print(f"   Hexagonal/triangular: z = V/2 = {V//2}  [EXACT]")
    print(f"   Square:               z = D+1 = {D+1}  [EXACT]")
    print(f"   Honeycomb (graphene): z = D   = {D}  [EXACT!!!]")

    print(f"\n4. GRAPHENE — CATHEDRAL CONNECTIONS  [EXACT]")
    print(f"   Sublattices: A,B = D−1 = {D-1}  [EXACT]")
    print(f"   Dirac valleys: K,K' = D−1 = {D-1}  [EXACT]")
    print(f"   BZ corners: {V//2} K-points = V/2  [EXACT]")

    print(f"\n5. PENROSE TILING = q = {q}-FOLD  [EXACT]")
    print(f"   5-fold pentagonal symmetry = q={q} [icosahedral]")
    print(f"   Inflation ratio = φ = {phi:.6f} (golden ratio)  [EXACT]")
    print(f"   Tile types = D−1 = {D-1}  [EXACT]")

    print(f"\n{'SUMMARY':^64}")
    print(f"  [EXACT]  2D Bravais = q = 5; allowed rotations = q = 5")
    print(f"  [EXACT]  Point groups 2D = N−D = 10")
    print(f"  [EXACT]  Graphene z = D = 3; sublattices = D−1 = 2")
    print(f"  [EXACT]  Penrose fold = q = 5; φ in tiling")
    print(sep)
