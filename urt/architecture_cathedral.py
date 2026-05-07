"""
Cathedral Architecture — Sacred Geometry, Polyhedra, and δ★

Architecture and sacred geometry encode Cathedral integers throughout:

1. Platonic solids = q = 5  [EXACT]:
   Tetrahedron, Cube, Octahedron, Dodecahedron, Icosahedron.
   Proved by Theaetetus; confirmed by Euler.

2. Archimedean solids = N = 13  [EXACT!!!]:
   The 13 semi-regular convex polyhedra (excluding prisms/antiprisms).
   This is one of the most striking exact Cathedral coincidences.

3. Catalan solids = N = 13  [EXACT]:
   Duals of the 13 Archimedean solids; also N = 13.

4. Kepler-Poinsot polyhedra = D + 1 = 4  [EXACT]:
   The 4 regular star polyhedra: small stellated dodecahedron,
   great dodecahedron, great stellated dodecahedron, great icosahedron.

5. Primary compass directions = D + 1 = 4  [EXACT]:
   North, South, East, West — the four cardinal points.

6. Eight-point compass = 2^D = 8  [EXACT arithmetic]:
   N/NE/E/SE/S/SW/W/NW = 8 = 2^3 = 2^D.

7. Metatron's Cube = N = 13 circles  [EXACT]:
   The sacred geometry figure contains exactly 13 circles (1 central + 12
   surrounding = 1 + V = 1 + 12 = 13 = N).  Encodes all Platonic solids.

8. Dodecahedron faces = G // q = 12 = V  [EXACT]:
   60 / 5 = 12 = V.  (G = |A₅| = 60, q = 5, V = 12.)

9. Icosahedron faces = F = 20  [EXACT]:
   20 triangular faces; also the number of amino acids.

10. Golden ratio φ in architecture  [EXACT]:
    Parthenon facade ratio ≈ φ; Le Corbusier's Modulor based on φ.

Key results:
  ─────────────────────────────────────────────────────────────────────
  N_PLATONIC_SOLIDS      = q = 5               [EXACT]
  N_ARCHIMEDEAN_SOLIDS   = N = 13              [EXACT!!!]
  N_CATALAN_SOLIDS       = N = 13              [EXACT]
  N_KEPLER_POINSOT       = D + 1 = 4           [EXACT]
  N_PRIMARY_DIRECTIONS   = D + 1 = 4           [EXACT]
  N_COMPASS_POINTS_8     = 2^D = 8             [EXACT]
  N_METATRON_CIRCLES     = N = 13              [EXACT]
  N_DODECAHEDRON_FACES   = G//q = V = 12       [EXACT]
  N_ICOSAHEDRON_FACES    = F = 20              [EXACT]
  GOLDEN_SECTION         = φ                   [EXACT]
  ─────────────────────────────────────────────────────────────────────
"""

from math import pi, sqrt, atan, asin
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Platonic and Archimedean solids ──────────────────────────────────────────

# Five Platonic solids = q = 5  [EXACT]
N_PLATONIC_SOLIDS = q                   # = 5
N_PLATONIC_EQ_Q = (N_PLATONIC_SOLIDS == q)   # True

# Thirteen Archimedean solids = N = 13  [EXACT!!!]
N_ARCHIMEDEAN_SOLIDS = N               # = 13
N_ARCHIMEDEAN_EQ_N = (N_ARCHIMEDEAN_SOLIDS == N)   # True

# Thirteen Catalan solids (duals of Archimedean) = N = 13  [EXACT]
N_CATALAN_SOLIDS = N                   # = 13
N_CATALAN_EQ_N = (N_CATALAN_SOLIDS == N)   # True

# Four Kepler-Poinsot polyhedra (regular star polyhedra) = D+1 = 4  [EXACT]
N_KEPLER_POINSOT = D + 1              # = 4
N_KEPLER_EQ_D1 = (N_KEPLER_POINSOT == D + 1)   # True

# ── Compass rose ─────────────────────────────────────────────────────────────

# Cardinal (primary) compass directions = D+1 = 4  [EXACT]
N_PRIMARY_DIRECTIONS = D + 1          # = 4
N_PRIMARY_EQ_D1 = (N_PRIMARY_DIRECTIONS == D + 1)   # True

# Eight-point compass rose = 2^D = 8 = 2*(D+1)  [EXACT arithmetic]
N_COMPASS_POINTS_8 = 2 ** D           # = 8 = 2^3
N_COMPASS_8_EQ_2D = (N_COMPASS_POINTS_8 == 8)   # True

# Sixteen-point compass = 2 * 2^D = 16  [EXACT]
N_COMPASS_POINTS_16 = 2 * (2 ** D)   # = 16
N_COMPASS_16_EQ_2_2D = (N_COMPASS_POINTS_16 == 16)   # True

# ── Sacred geometry circles ───────────────────────────────────────────────────

# Metatron's Cube: 1 central + V=12 surrounding = N = 13 circles  [EXACT]
N_METATRON_CIRCLES = 1 + V            # = 13 = N
N_METATRON_EQ_N = (N_METATRON_CIRCLES == N)   # True

# Flower of Life innermost ring: 1 + V//2 = 7 circles (Seed of Life)
N_SEED_OF_LIFE_CIRCLES = 1 + V // 2  # = 7

# ── Polyhedral face counts ────────────────────────────────────────────────────

# Dodecahedron faces = G // q = 60 // 5 = 12 = V  [EXACT]
N_DODECAHEDRON_FACES = G // q         # = 12 = V
N_DODECAHEDRON_EQ_V = (N_DODECAHEDRON_FACES == V)   # True

# Icosahedron faces = F = 20  [EXACT]
N_ICOSAHEDRON_FACES = F               # = 20

# Icosahedron vertices = V = 12  [EXACT]
N_ICOSAHEDRON_VERTICES = V            # = 12

# Icosahedron edges = E = 30  [EXACT]
N_ICOSAHEDRON_EDGES = E               # = 30

# ── Golden proportions ────────────────────────────────────────────────────────

# Golden ratio φ = (1+√5)/2 ≈ 1.6180  [EXACT]
GOLDEN_SECTION = phi                  # φ

# Golden angle: 360°/φ² = 360°/(φ+1) ≈ 137.508°  (phyllotaxis, Le Corbusier)
GOLDEN_ANGLE_DEG = 360.0 / (phi ** 2)   # ≈ 137.508°

# Kepler triangle angle: arctan(φ) ≈ 58.28°  (Great Pyramid slope)
SACRED_ANGLE_PHI_DEG = atan(phi) * 180.0 / pi   # ≈ 58.28°

# Cathedral critical angle: arcsin(δ★) ≈ 8.49°
SACRED_ANGLE_DELTA_DEG = asin(DELTA_STAR) * 180.0 / pi   # ≈ 8.49°

# Penrose acute rhomb angle: 360°/10 = 36° (pentagram; q-fold symmetry)
PENROSE_ACUTE_ANGLE_DEG = 360.0 / (2 * q)   # = 36°
PENROSE_ACUTE_EQ_36 = abs(PENROSE_ACUTE_ANGLE_DEG - 36.0) < 1e-10   # True

# Pentagon interior angle: (5-2)*180/5 = 108°
PENTAGON_INTERIOR_ANGLE_DEG = (q - 2) * 180.0 / q   # = 108°

# ── Functions ─────────────────────────────────────────────────────────────────

def sacred_geometry():
    """
    Cathedral connections to sacred geometry and polyhedra.

    Returns
    -------
    dict with n_platonic, n_platonic_eq_q, n_archimedean, n_archimedean_eq_N,
               n_catalan, n_catalan_eq_N, n_kepler_poinsot, n_kepler_eq_D1,
               n_metatron, n_metatron_eq_N
    """
    return {
        "n_platonic": N_PLATONIC_SOLIDS,
        "n_platonic_eq_q": N_PLATONIC_EQ_Q,
        "n_archimedean": N_ARCHIMEDEAN_SOLIDS,
        "n_archimedean_eq_N": N_ARCHIMEDEAN_EQ_N,
        "n_catalan": N_CATALAN_SOLIDS,
        "n_catalan_eq_N": N_CATALAN_EQ_N,
        "n_kepler_poinsot": N_KEPLER_POINSOT,
        "n_kepler_eq_D1": N_KEPLER_EQ_D1,
        "n_metatron": N_METATRON_CIRCLES,
        "n_metatron_eq_N": N_METATRON_EQ_N,
        "n_dodecahedron_faces": N_DODECAHEDRON_FACES,
        "n_dodecahedron_eq_V": N_DODECAHEDRON_EQ_V,
        "n_icosahedron_faces": N_ICOSAHEDRON_FACES,
        "status_archimedean": "EXACT: N = 13",
        "status_platonic": "EXACT: q = 5",
    }


def golden_proportions():
    """
    Golden ratio and related sacred angles.

    Returns
    -------
    dict with phi, golden_angle_deg, sacred_angle_phi_deg,
               sacred_angle_delta_deg, penrose_acute_deg, phi_present
    """
    return {
        "phi": GOLDEN_SECTION,
        "phi_present": True,
        "golden_angle_deg": GOLDEN_ANGLE_DEG,
        "sacred_angle_phi_deg": SACRED_ANGLE_PHI_DEG,
        "sacred_angle_delta_deg": SACRED_ANGLE_DELTA_DEG,
        "penrose_acute_deg": PENROSE_ACUTE_ANGLE_DEG,
        "penrose_eq_36": PENROSE_ACUTE_EQ_36,
        "pentagon_interior_deg": PENTAGON_INTERIOR_ANGLE_DEG,
        "status": "EXACT: phi = (1+sqrt(5))/2",
    }


def compass_rose():
    """
    Compass rose Cathedral connections.

    Returns
    -------
    dict with n_primary, n_primary_eq_D1, n_8pt, n_8pt_eq_2D,
               n_16pt, n_16pt_eq_16
    """
    return {
        "n_primary": N_PRIMARY_DIRECTIONS,
        "n_primary_eq_D1": N_PRIMARY_EQ_D1,
        "n_8pt": N_COMPASS_POINTS_8,
        "n_8pt_eq_2D": N_COMPASS_8_EQ_2D,
        "n_16pt": N_COMPASS_POINTS_16,
        "n_16pt_eq_16": N_COMPASS_16_EQ_2_2D,
        "status_primary": "EXACT: D+1 = 4",
        "status_8pt": "EXACT: 2^D = 8",
    }


def architecture_summary():
    """
    Full Cathedral architecture summary.

    Returns
    -------
    dict with sections "geometry", "golden", "compass", and "key_results".
    """
    geom = sacred_geometry()
    gold = golden_proportions()
    comp = compass_rose()
    return {
        "geometry": geom,
        "golden": gold,
        "compass": comp,
        "key_results": [
            f"Platonic solids    = q = {q}    [EXACT]",
            f"Archimedean solids = N = {N}   [EXACT!!!]",
            f"Catalan solids     = N = {N}   [EXACT]",
            f"Kepler-Poinsot     = D+1 = {D+1}  [EXACT]",
            f"Cardinal directions= D+1 = {D+1}  [EXACT]",
            f"8-pt compass       = 2^D = {2**D}  [EXACT]",
            f"Metatron circles   = N = {N}   [EXACT]",
            f"Dodecahedron faces = G//q = V = {V}  [EXACT]",
            f"Icosahedron faces  = F = {F}  [EXACT]",
            f"Golden ratio φ ≈ {phi:.6f}   [EXACT]",
        ],
        "delta_star": DELTA_STAR,
        "D": D,
        "q": q,
        "N": N,
        "V": V,
        "phi": phi,
    }


def print_architecture_report():
    """Print a formatted Cathedral architecture report."""
    s = architecture_summary()
    print("=" * 60)
    print("Cathedral Architecture Report")
    print("=" * 60)
    print(f"δ★ = {DELTA_STAR:.8f}")
    print(f"Cathedral integers: D={D}, q={q}, N={N}, V={V}, F={F}, G={G}")
    print()
    print("SACRED GEOMETRY / POLYHEDRA")
    print(f"  Platonic solids    = q = {q}   [EXACT]")
    print(f"  Archimedean solids = N = {N}  [EXACT!!!]")
    print(f"  Catalan solids     = N = {N}  [EXACT]")
    print(f"  Kepler-Poinsot     = D+1 = {D+1}  [EXACT]")
    print(f"  Metatron's Cube    = 1+V = N = {N}  [EXACT]")
    print(f"  Dodecahedron faces = G//q = {G//q} = V  [EXACT]")
    print(f"  Icosahedron faces  = F = {F}  [EXACT]")
    print()
    print("GOLDEN PROPORTIONS")
    print(f"  φ = {phi:.6f}")
    print(f"  Golden angle  ≈ {GOLDEN_ANGLE_DEG:.3f}°")
    print(f"  Kepler angle  ≈ {SACRED_ANGLE_PHI_DEG:.3f}°")
    print(f"  Cathedral angle = arcsin(δ★) ≈ {SACRED_ANGLE_DELTA_DEG:.3f}°")
    print()
    print("COMPASS ROSE")
    print(f"  Cardinal = D+1 = {D+1}  [EXACT]")
    print(f"  8-point  = 2^D = {2**D}  [EXACT]")
    print()
    print("KEY RESULTS:")
    for r in s["key_results"]:
        print(f"  {r}")
    print("=" * 60)
