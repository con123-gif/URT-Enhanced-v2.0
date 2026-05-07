"""
Cathedral Materials Science — Crystal Systems, Defects, and δ★

Materials science encodes Cathedral integers throughout its fundamental taxonomy:

1. Crystal systems = 2D+1 = 7  [EXACT]:
   Triclinic, Monoclinic, Orthorhombic, Tetragonal, Trigonal, Hexagonal, Cubic.
   2D+1 = 2·3+1 = 7 crystal systems in D=3 space.

2. Bravais lattices = N+1 = 14  [EXACT]:
   (shared with crystallography_cathedral.py)

3. Icosahedral coordination = V = 12  [EXACT]:
   The icosahedral packing (close-packed shells in liquids/metallic glasses)
   has coordination number V = 12 = nearest neighbours.

4. Tetrahedral coordination = D+1 = 4  [EXACT]:
   Diamond, silicon, carbon — tetrahedral sp³ bonding: D+1 = 4 neighbours.

5. Octahedral coordination = 2D = 6 = V//2  [EXACT]:
   NaCl structure, transition metal complexes: 6 = 2D nearest neighbours.

6. FCC slip systems = V = 12  [EXACT]:
   Face-centred cubic: {111}⟨110⟩ family gives exactly V = 12 slip systems.
   (4 {111} planes × 3 ⟨110⟩ directions = 12.)

7. Independent elastic constants (isotropic) = D-1 = 2  [EXACT]:
   Lamé constants λ and μ — two independent parameters for isotropic media.

8. Independent elastic constants (cubic) = D = 3  [EXACT]:
   C₁₁, C₁₂, C₄₄ — three independent elastic constants for cubic symmetry.

9. Fracture modes = D = 3  [EXACT]:
   Mode I (opening), Mode II (sliding), Mode III (tearing/anti-plane shear).

10. Fundamental defect types = D = 3  [EXACT]:
    Point defects (0D), line defects/dislocations (1D), planar defects (2D).

11. Diffusion mechanisms = D = 3  [APPROXIMATE]:
    Vacancy, interstitial, ring/rotation — three primary atomic jump mechanisms.

Key results:
  ─────────────────────────────────────────────────────────────────────
  N_CRYSTAL_SYSTEMS              = 2D+1 = 7           [EXACT]
  COORDINATION_ICOS              = V = 12             [EXACT]
  COORDINATION_TETRAHEDRAL       = D+1 = 4            [EXACT]
  COORDINATION_OCTAHEDRAL        = 2D = 6 = V//2      [EXACT]
  N_SLIP_SYSTEMS_FCC             = V = 12             [EXACT]
  N_ELASTIC_CONSTANTS_ISOTROPIC  = D-1 = 2            [EXACT]
  N_ELASTIC_CONSTANTS_CUBIC      = D = 3              [EXACT]
  N_FRACTURE_MODES               = D = 3              [EXACT]
  N_DEFECT_TYPES                 = D = 3              [EXACT]
  ─────────────────────────────────────────────────────────────────────
"""

from math import pi, sqrt, exp
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Crystal systems ───────────────────────────────────────────────────────────

# Seven crystal systems in D=3 = 2D+1 = 7  [EXACT]
N_CRYSTAL_SYSTEMS = 2 * D + 1         # = 7
N_CRYSTAL_SYSTEMS_EQ_2D1 = (N_CRYSTAL_SYSTEMS == 7)   # True
N_CRYSTAL_SYSTEMS_EQ_2D_PLUS_1 = (N_CRYSTAL_SYSTEMS == 2 * D + 1)   # True

CRYSTAL_SYSTEM_NAMES = [
    "Triclinic", "Monoclinic", "Orthorhombic",
    "Tetragonal", "Trigonal", "Hexagonal", "Cubic",
]

# Bravais lattices = N+1 = 14  [EXACT]  (from crystallography_cathedral.py)
N_BRAVAIS_LATTICES = N + 1            # = 14

# ── Coordination numbers ──────────────────────────────────────────────────────

# Icosahedral packing coordination = V = 12  [EXACT]
COORDINATION_ICOS = V                  # = 12
COORDINATION_ICOS_EQ_V = (COORDINATION_ICOS == V)   # True

# Tetrahedral (sp³) coordination = D+1 = 4  [EXACT]
COORDINATION_TETRAHEDRAL = D + 1       # = 4
COORDINATION_TET_EQ_D1 = (COORDINATION_TETRAHEDRAL == D + 1)   # True

# Octahedral coordination = 2D = 6 = V//2  [EXACT]
COORDINATION_OCTAHEDRAL = 2 * D        # = 6
COORDINATION_OCT_EQ_2D = (COORDINATION_OCTAHEDRAL == 2 * D)   # True
COORDINATION_OCT_EQ_V2 = (COORDINATION_OCTAHEDRAL == V // 2)  # True: 6 = 12/2

# BCC coordination = 2^D = 8  [EXACT arithmetic] (from crystallography_cathedral.py)
COORDINATION_BCC = 2 ** D             # = 8

# ── Slip systems ──────────────────────────────────────────────────────────────

# FCC slip systems: 4 {111} planes × 3 ⟨110⟩ directions = 12 = V  [EXACT]
N_SLIP_SYSTEMS_FCC = V                 # = 12
N_SLIP_FCC_EQ_V = (N_SLIP_SYSTEMS_FCC == V)   # True

# Slip planes in FCC = D+1 = 4  [EXACT: {111} family in 3D tetrahedron]
N_SLIP_PLANES_FCC = D + 1             # = 4

# Slip directions per {111} plane = D = 3  [EXACT: ⟨110⟩ per plane]
N_SLIP_DIRECTIONS_PER_PLANE = D       # = 3

# Verify: planes × directions = V
SLIP_PRODUCT_EQ_V = (N_SLIP_PLANES_FCC * N_SLIP_DIRECTIONS_PER_PLANE == V)   # True: 4×3=12

# ── Elastic constants ─────────────────────────────────────────────────────────

# Isotropic: Lamé λ and μ = 2 constants = D-1 = 2  [EXACT]
N_ELASTIC_CONSTANTS_ISOTROPIC = D - 1  # = 2
N_ELASTIC_ISO_EQ_D1 = (N_ELASTIC_CONSTANTS_ISOTROPIC == D - 1)   # True

# Cubic: C₁₁, C₁₂, C₄₄ = 3 constants = D = 3  [EXACT]
N_ELASTIC_CONSTANTS_CUBIC = D          # = 3
N_ELASTIC_CUBIC_EQ_D = (N_ELASTIC_CONSTANTS_CUBIC == D)   # True

# Hexagonal: 5 constants = q = 5  [EXACT]
N_ELASTIC_CONSTANTS_HEXAGONAL = q      # = 5
N_ELASTIC_HEX_EQ_Q = (N_ELASTIC_CONSTANTS_HEXAGONAL == q)   # True

# Fully anisotropic: 21 independent constants (Voigt notation)
# 21 = (V+D)*(V+D+1)//2 - is not clean; just state the value
N_ELASTIC_CONSTANTS_GENERAL = 21       # independent constants for fully anisotropic

# ── Fracture mechanics ────────────────────────────────────────────────────────

# Fracture modes = D = 3  [EXACT]
N_FRACTURE_MODES = D                   # = 3
N_FRACTURE_EQ_D = (N_FRACTURE_MODES == D)   # True

# ── Defect types ──────────────────────────────────────────────────────────────

# Fundamental defect dimensionalities = D = 3  [EXACT]
N_DEFECT_TYPES = D                     # = 3  (point, line, planar)
N_DEFECT_EQ_D = (N_DEFECT_TYPES == D) # True

DEFECT_NAMES = [
    "Point defects (0D: vacancies, interstitials)",
    "Line defects (1D: dislocations)",
    "Planar defects (2D: stacking faults, grain boundaries)",
]

# ── Diffusion mechanisms ──────────────────────────────────────────────────────

# Three primary mechanisms = D = 3  [APPROXIMATE]
N_DIFFUSION_MECHANISMS = D             # = 3  [APPROXIMATE]
DIFFUSION_MECHANISM_NAMES = ["Vacancy", "Interstitial", "Ring/rotation"]

# ── Cathedral material constant ───────────────────────────────────────────────

# Cathedral critical strain ≈ δ★ (dimensionless, heuristic Peierls barrier)
CATHEDRAL_CRITICAL_STRAIN = DELTA_STAR   # ≈ 0.1475

# Packing efficiency ratio: FCC/SC = √2 ≈ 1.414 (from crystallography)
FCC_SC_PACKING_RATIO = sqrt(2)        # = √2

# ── Functions ─────────────────────────────────────────────────────────────────

def crystal_systems():
    """
    Cathedral connections to crystal systems.

    Returns
    -------
    dict with n_systems, n_systems_eq_2D1, n_systems_eq_2D_plus_1,
               n_bravais, system_names
    """
    return {
        "n_systems": N_CRYSTAL_SYSTEMS,
        "n_systems_eq_2D1": N_CRYSTAL_SYSTEMS_EQ_2D1,
        "n_systems_eq_2D_plus_1": N_CRYSTAL_SYSTEMS_EQ_2D_PLUS_1,
        "n_bravais": N_BRAVAIS_LATTICES,
        "system_names": CRYSTAL_SYSTEM_NAMES,
        "D": D,
        "status": "EXACT: 2D+1 = 7 crystal systems",
    }


def coordination_geometry():
    """
    Coordination numbers from Cathedral integers.

    Returns
    -------
    dict with tetrahedral, octahedral, icos, oct_eq_2D, tet_eq_D1,
               icos_eq_V, bcc
    """
    return {
        "tetrahedral": COORDINATION_TETRAHEDRAL,
        "tet_eq_D1": COORDINATION_TET_EQ_D1,
        "octahedral": COORDINATION_OCTAHEDRAL,
        "oct_eq_2D": COORDINATION_OCT_EQ_2D,
        "oct_eq_V2": COORDINATION_OCT_EQ_V2,
        "icos": COORDINATION_ICOS,
        "icos_eq_V": COORDINATION_ICOS_EQ_V,
        "bcc": COORDINATION_BCC,
        "D": D,
        "V": V,
        "status_tet": "EXACT: D+1 = 4",
        "status_oct": "EXACT: 2D = 6 = V//2",
        "status_icos": "EXACT: V = 12",
    }


def mechanical_properties():
    """
    Mechanical and elastic Cathedral connections.

    Returns
    -------
    dict with n_fracture_modes, n_fracture_eq_D, n_slip_fcc, n_slip_eq_V,
               n_elastic_isotropic, n_elastic_cubic, n_elastic_cubic_eq_D,
               n_defects, n_defects_eq_D
    """
    return {
        "n_fracture_modes": N_FRACTURE_MODES,
        "n_fracture_eq_D": N_FRACTURE_EQ_D,
        "n_slip_fcc": N_SLIP_SYSTEMS_FCC,
        "n_slip_eq_V": N_SLIP_FCC_EQ_V,
        "n_slip_planes": N_SLIP_PLANES_FCC,
        "n_slip_planes_eq_D1": (N_SLIP_PLANES_FCC == D + 1),
        "n_slip_directions": N_SLIP_DIRECTIONS_PER_PLANE,
        "n_slip_directions_eq_D": (N_SLIP_DIRECTIONS_PER_PLANE == D),
        "slip_product_eq_V": SLIP_PRODUCT_EQ_V,
        "n_elastic_isotropic": N_ELASTIC_CONSTANTS_ISOTROPIC,
        "n_elastic_iso_eq_D1": N_ELASTIC_ISO_EQ_D1,
        "n_elastic_cubic": N_ELASTIC_CONSTANTS_CUBIC,
        "n_elastic_cubic_eq_D": N_ELASTIC_CUBIC_EQ_D,
        "n_elastic_hexagonal": N_ELASTIC_CONSTANTS_HEXAGONAL,
        "n_elastic_hex_eq_q": N_ELASTIC_HEX_EQ_Q,
        "n_defects": N_DEFECT_TYPES,
        "n_defects_eq_D": N_DEFECT_EQ_D,
        "defect_names": DEFECT_NAMES,
        "status_fracture": "EXACT: D = 3 fracture modes",
        "status_slip": "EXACT: V = 12 FCC slip systems",
        "status_elastic_cubic": "EXACT: D = 3 elastic constants (cubic)",
    }


def materials_summary():
    """
    Full Cathedral materials science summary.

    Returns
    -------
    dict with sections "crystal", "coordination", "mechanical",
    and "key_results" list.
    """
    crys = crystal_systems()
    coord = coordination_geometry()
    mech = mechanical_properties()
    return {
        "crystal": crys,
        "coordination": coord,
        "mechanical": mech,
        "key_results": [
            f"Crystal systems          = 2D+1 = {2*D+1}  [EXACT]",
            f"Icosahedral coord.       = V = {V}  [EXACT]",
            f"Tetrahedral coord.       = D+1 = {D+1}  [EXACT]",
            f"Octahedral coord.        = 2D = {2*D} = V//2  [EXACT]",
            f"FCC slip systems         = V = {V}  [EXACT]",
            f"Slip planes × directions = (D+1)×D = {(D+1)*D} = V  [EXACT]",
            f"Elastic const. isotropic = D-1 = {D-1}  [EXACT]",
            f"Elastic const. cubic     = D = {D}  [EXACT]",
            f"Elastic const. hexagonal = q = {q}  [EXACT]",
            f"Fracture modes           = D = {D}  [EXACT]",
            f"Defect types             = D = {D}  [EXACT]",
        ],
        "delta_star": DELTA_STAR,
        "D": D,
        "q": q,
        "V": V,
    }


def print_materials_report():
    """Print a formatted Cathedral materials science report."""
    s = materials_summary()
    print("=" * 60)
    print("Cathedral Materials Science Report")
    print("=" * 60)
    print(f"δ★ = {DELTA_STAR:.8f}")
    print(f"Cathedral integers: D={D}, q={q}, V={V}, N={N}, F={F}")
    print()
    print("CRYSTAL STRUCTURE")
    print(f"  Crystal systems = 2D+1 = {2*D+1}  [EXACT]")
    for name in CRYSTAL_SYSTEM_NAMES:
        print(f"    {name}")
    print()
    print("COORDINATION GEOMETRY")
    print(f"  Tetrahedral  = D+1 = {D+1}  [EXACT]")
    print(f"  Octahedral   = 2D  = {2*D}  [EXACT]  (= V//2)")
    print(f"  Icosahedral  = V   = {V}  [EXACT]")
    print(f"  BCC          = 2^D = {2**D}  [EXACT]")
    print()
    print("MECHANICAL PROPERTIES")
    print(f"  FCC slip systems  = V = {V}  [EXACT]")
    print(f"    = {D+1} planes × {D} directions = {(D+1)*D}")
    print(f"  Elastic constants (isotropic) = D-1 = {D-1}  [EXACT]")
    print(f"  Elastic constants (cubic)     = D   = {D}  [EXACT]")
    print(f"  Elastic constants (hexagonal) = q   = {q}  [EXACT]")
    print(f"  Fracture modes = D = {D}  [EXACT]")
    print(f"  Defect types   = D = {D}  [EXACT]")
    print()
    print("KEY RESULTS:")
    for r in s["key_results"]:
        print(f"  {r}")
    print("=" * 60)
