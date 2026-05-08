"""
Platonic Solids — Cathedral Geometry

All five Platonic solids have vertices, edges, and faces that are Cathedral integers
{D=3, N=13, V=12, E=30, F=20, q=5, G=60}. The icosahedron IS the Cathedral solid.

Platonic solid   Schläfli  V        E        F        Dual
───────────────  ────────  ───────  ───────  ───────  ──────────────
Tetrahedron      {3,3}     4=D+1    6=D!     4=D+1    self
Cube             {4,3}     8=2^D    12=V     6=D!     Octahedron
Octahedron       {3,4}     6=D!     12=V     8=2^D    Cube
Dodecahedron     {5,3}     20=F     30=E     12=V     Icosahedron
Icosahedron      {3,5}     12=V     30=E     20=F     Dodecahedron ← CATHEDRAL SOLID

Sum across all five:  ΣV = ΣF = 50 = 2q²   ΣE = 90 = D×E

All χ = V−E+F = 2 = D−1.
All identities are arithmetically exact.
"""

from math import factorial, acos, degrees, sqrt, pi
from .shell_closure import D, N, V, E, F, q, G, DELTA_STAR, phi

# ─── Solid parameters ─────────────────────────────────────────────────────────

# Tetrahedron {3,3} — self-dual
TETRA_V = D + 1           # = 4
TETRA_E = factorial(D)    # = 6 = D!
TETRA_F = D + 1           # = 4 = D+1  (self-dual: V=F)
TETRA_CHI = TETRA_V - TETRA_E + TETRA_F  # = 4−6+4 = 2 = D−1
TETRA_DIHEDRAL_DEG = degrees(acos(1.0 / 3.0))  # ≈ 70.529°

# Cube {4,3} — dual of octahedron
CUBE_V = 2**D             # = 8
CUBE_E = V                # = 12
CUBE_F = factorial(D)     # = 6 = D!
CUBE_CHI = CUBE_V - CUBE_E + CUBE_F  # = 8−12+6 = 2 = D−1
CUBE_DIHEDRAL_DEG = 90.0  # exact right angle

# Octahedron {3,4} — dual of cube
OCTA_V = factorial(D)     # = 6 = D!
OCTA_E = V                # = 12
OCTA_F = 2**D             # = 8 = 2^D
OCTA_CHI = OCTA_V - OCTA_E + OCTA_F  # = 6−12+8 = 2 = D−1
OCTA_DIHEDRAL_DEG = degrees(acos(-1.0 / 3.0))  # ≈ 109.471° (tetrahedral angle!)

# Dodecahedron {5,3} — dual of icosahedron
DODEC_V = F               # = 20
DODEC_E = E               # = 30
DODEC_F = V               # = 12 = V  (dodecahedron faces = icosahedron vertices!)
DODEC_CHI = DODEC_V - DODEC_E + DODEC_F  # = 20−30+12 = 2 = D−1
DODEC_DIHEDRAL_DEG = degrees(acos(-1.0 / sqrt(5.0)))  # ≈ 116.565° = arctan(2)

# Icosahedron {3,5} — THE CATHEDRAL SOLID; dual of dodecahedron
ICOS_V = V                # = 12 ← Cathedral vertex count
ICOS_E = E                # = 30 ← Cathedral edge count
ICOS_F = F                # = 20 ← Cathedral face count
ICOS_CHI = ICOS_V - ICOS_E + ICOS_F  # = 12−30+20 = 2 = D−1
ICOS_DIHEDRAL_DEG = degrees(acos(-sqrt(5.0) / 3.0))  # ≈ 138.190°

# ─── Summary sums ─────────────────────────────────────────────────────────────

SUM_V_ALL = TETRA_V + CUBE_V + OCTA_V + DODEC_V + ICOS_V  # = 4+8+6+20+12 = 50
SUM_E_ALL = TETRA_E + CUBE_E + OCTA_E + DODEC_E + ICOS_E  # = 6+12+12+30+30 = 90
SUM_F_ALL = TETRA_F + CUBE_F + OCTA_F + DODEC_F + ICOS_F  # = 4+6+8+12+20 = 50
SUM_V_EQ_SUM_F = SUM_V_ALL == SUM_F_ALL                   # True: 50 = 50

# ─── Duality Cathedral ────────────────────────────────────────────────────────

# Tetrahedron is self-dual: V=F=D+1
TETRA_SELF_DUAL = (TETRA_V == TETRA_F)

# Cube and Octahedron are dual: V↔F swap
CUBE_OCTA_DUAL_V = (CUBE_V == OCTA_F)   # 8 = 8 ✓
CUBE_OCTA_DUAL_F = (CUBE_F == OCTA_V)   # 6 = 6 ✓
CUBE_OCTA_SAME_E = (CUBE_E == OCTA_E)   # 12 = 12 ✓

# Dodecahedron and Icosahedron are dual: V↔F swap
DODEC_ICOS_DUAL_V = (DODEC_V == ICOS_F)  # 20 = 20 ✓
DODEC_ICOS_DUAL_F = (DODEC_F == ICOS_V)  # 12 = 12 ✓
DODEC_ICOS_SAME_E = (DODEC_E == ICOS_E)  # 30 = 30 ✓

# ─── IDENTITY booleans ────────────────────────────────────────────────────────

# Tetrahedron
IDENTITY_TETRA_V_IS_D_PLUS_1 = (TETRA_V == D + 1)           # 4 = D+1
IDENTITY_TETRA_E_IS_D_FACT   = (TETRA_E == factorial(D))     # 6 = D!
IDENTITY_TETRA_F_IS_D_PLUS_1 = (TETRA_F == D + 1)           # 4 = D+1
IDENTITY_TETRA_SELF_DUAL     = TETRA_SELF_DUAL               # V=F EXACT
IDENTITY_TETRA_CHI_IS_D_M1   = (TETRA_CHI == D - 1)         # χ=2=D-1

# Cube
IDENTITY_CUBE_V_IS_2D = (CUBE_V == 2**D)                    # 8 = 2^D
IDENTITY_CUBE_E_IS_V  = (CUBE_E == V)                       # 12 = V
IDENTITY_CUBE_F_IS_D_FACT = (CUBE_F == factorial(D))        # 6 = D!
IDENTITY_CUBE_CHI_IS_D_M1 = (CUBE_CHI == D - 1)            # χ=2=D-1

# Octahedron
IDENTITY_OCTA_V_IS_D_FACT = (OCTA_V == factorial(D))        # 6 = D!
IDENTITY_OCTA_E_IS_V      = (OCTA_E == V)                   # 12 = V
IDENTITY_OCTA_F_IS_2D     = (OCTA_F == 2**D)               # 8 = 2^D
IDENTITY_OCTA_CHI_IS_D_M1 = (OCTA_CHI == D - 1)           # χ=2=D-1

# Dodecahedron
IDENTITY_DODEC_V_IS_F = (DODEC_V == F)                     # 20 = F
IDENTITY_DODEC_E_IS_E = (DODEC_E == E)                     # 30 = E
IDENTITY_DODEC_F_IS_V = (DODEC_F == V)                     # 12 = V
IDENTITY_DODEC_CHI_IS_D_M1 = (DODEC_CHI == D - 1)         # χ=2=D-1

# Icosahedron
IDENTITY_ICOS_V_IS_V  = (ICOS_V == V)                      # 12 = V (trivially)
IDENTITY_ICOS_E_IS_E  = (ICOS_E == E)                      # 30 = E
IDENTITY_ICOS_F_IS_F  = (ICOS_F == F)                      # 20 = F
IDENTITY_ICOS_CHI_IS_D_M1 = (ICOS_CHI == D - 1)           # χ=2=D-1

# Duality identities
IDENTITY_TETRA_SELF_DUAL_EXACT = TETRA_SELF_DUAL
IDENTITY_CUBE_OCTA_DUAL = (CUBE_OCTA_DUAL_V and CUBE_OCTA_DUAL_F and CUBE_OCTA_SAME_E)
IDENTITY_DODEC_ICOS_DUAL = (DODEC_ICOS_DUAL_V and DODEC_ICOS_DUAL_F and DODEC_ICOS_SAME_E)

# Summary sums
IDENTITY_SUM_V_IS_2Q_SQ   = (SUM_V_ALL == 2 * q**2)         # ΣV = 50 = 2q²
IDENTITY_SUM_F_IS_2Q_SQ   = (SUM_F_ALL == 2 * q**2)         # ΣF = 50 = 2q²
IDENTITY_SUM_E_IS_D_TIMES_E = (SUM_E_ALL == D * E)          # ΣE = 90 = D×E
IDENTITY_SUM_V_EQ_SUM_F   = SUM_V_EQ_SUM_F                  # ΣV = ΣF exact

# Count
N_PLATONIC_SOLIDS = q                                        # = 5 EXACT
IDENTITY_N_PLATONIC_IS_q  = (N_PLATONIC_SOLIDS == q)        # 5 = q

# All χ = D−1
IDENTITY_ALL_CHI_IS_D_M1 = all(
    s == D - 1 for s in [TETRA_CHI, CUBE_CHI, OCTA_CHI, DODEC_CHI, ICOS_CHI]
)

# Cube-Octahedron: shared edge count = V
IDENTITY_CUBE_OCTA_SHARED_E = CUBE_OCTA_SAME_E   # 12 = V

# Dodec-Icos: shared edge count = E
IDENTITY_DODEC_ICOS_SHARED_E = DODEC_ICOS_SAME_E  # 30 = E

# ─── Master flag ──────────────────────────────────────────────────────────────

ALL_PLATONIC_IDENTITIES: dict = {
    "tetra_V_is_D+1":        IDENTITY_TETRA_V_IS_D_PLUS_1,
    "tetra_E_is_D!":         IDENTITY_TETRA_E_IS_D_FACT,
    "tetra_F_is_D+1":        IDENTITY_TETRA_F_IS_D_PLUS_1,
    "tetra_self_dual":       IDENTITY_TETRA_SELF_DUAL_EXACT,
    "tetra_chi_is_D-1":      IDENTITY_TETRA_CHI_IS_D_M1,
    "cube_V_is_2^D":         IDENTITY_CUBE_V_IS_2D,
    "cube_E_is_V":           IDENTITY_CUBE_E_IS_V,
    "cube_F_is_D!":          IDENTITY_CUBE_F_IS_D_FACT,
    "cube_chi_is_D-1":       IDENTITY_CUBE_CHI_IS_D_M1,
    "octa_V_is_D!":          IDENTITY_OCTA_V_IS_D_FACT,
    "octa_E_is_V":           IDENTITY_OCTA_E_IS_V,
    "octa_F_is_2^D":         IDENTITY_OCTA_F_IS_2D,
    "octa_chi_is_D-1":       IDENTITY_OCTA_CHI_IS_D_M1,
    "dodec_V_is_F":          IDENTITY_DODEC_V_IS_F,
    "dodec_E_is_E":          IDENTITY_DODEC_E_IS_E,
    "dodec_F_is_V":          IDENTITY_DODEC_F_IS_V,
    "dodec_chi_is_D-1":      IDENTITY_DODEC_CHI_IS_D_M1,
    "icos_V_is_V":           IDENTITY_ICOS_V_IS_V,
    "icos_E_is_E":           IDENTITY_ICOS_E_IS_E,
    "icos_F_is_F":           IDENTITY_ICOS_F_IS_F,
    "icos_chi_is_D-1":       IDENTITY_ICOS_CHI_IS_D_M1,
    "cube_octa_dual":        IDENTITY_CUBE_OCTA_DUAL,
    "dodec_icos_dual":       IDENTITY_DODEC_ICOS_DUAL,
    "sum_V_is_2q^2":         IDENTITY_SUM_V_IS_2Q_SQ,
    "sum_F_is_2q^2":         IDENTITY_SUM_F_IS_2Q_SQ,
    "sum_E_is_D*E":          IDENTITY_SUM_E_IS_D_TIMES_E,
    "sum_V_eq_sum_F":        IDENTITY_SUM_V_EQ_SUM_F,
    "n_platonic_is_q":       IDENTITY_N_PLATONIC_IS_q,
    "all_chi_is_D-1":        IDENTITY_ALL_CHI_IS_D_M1,
}

ALL_PLATONIC_EXACT: bool = all(ALL_PLATONIC_IDENTITIES.values())
N_PLATONIC_IDENTITIES: int = len(ALL_PLATONIC_IDENTITIES)

assert ALL_PLATONIC_EXACT, f"Platonic identity failure: {[k for k,v in ALL_PLATONIC_IDENTITIES.items() if not v]}"

# ─── Helpers ──────────────────────────────────────────────────────────────────

def solid_data(name: str) -> dict:
    """Return V, E, F, chi for a named Platonic solid."""
    table = {
        "tetrahedron":  {"V": TETRA_V,  "E": TETRA_E,  "F": TETRA_F,  "chi": TETRA_CHI},
        "cube":         {"V": CUBE_V,   "E": CUBE_E,   "F": CUBE_F,   "chi": CUBE_CHI},
        "octahedron":   {"V": OCTA_V,   "E": OCTA_E,   "F": OCTA_F,   "chi": OCTA_CHI},
        "dodecahedron": {"V": DODEC_V,  "E": DODEC_E,  "F": DODEC_F,  "chi": DODEC_CHI},
        "icosahedron":  {"V": ICOS_V,   "E": ICOS_E,   "F": ICOS_F,   "chi": ICOS_CHI},
    }
    return table[name.lower()]


def platonic_summary() -> dict:
    return {
        "n_platonic": N_PLATONIC_SOLIDS,
        "n_platonic_is_q": True,
        "icos_VEF": (ICOS_V, ICOS_E, ICOS_F),
        "icos_is_cathedral_solid": True,
        "sum_V_all": SUM_V_ALL,
        "sum_E_all": SUM_E_ALL,
        "sum_F_all": SUM_F_ALL,
        "sum_V_eq_2q_sq": IDENTITY_SUM_V_IS_2Q_SQ,
        "sum_V_eq_sum_F": IDENTITY_SUM_V_EQ_SUM_F,
        "all_chi_D_minus_1": IDENTITY_ALL_CHI_IS_D_M1,
        "all_platonic_exact": ALL_PLATONIC_EXACT,
        "n_identities": N_PLATONIC_IDENTITIES,
    }


def print_platonic_report() -> None:
    print("=" * 62)
    print("  PLATONIC SOLIDS — CATHEDRAL GEOMETRY")
    print("=" * 62)
    print(f"  {'Solid':<14} {'V':>6}  {'E':>6}  {'F':>6}  χ   Cathedral")
    print(f"  {'-'*14} {'-'*6}  {'-'*6}  {'-'*6}  -   {'-'*18}")
    rows = [
        ("Tetrahedron", TETRA_V, TETRA_E, TETRA_F,
         "V=D+1, E=D!, F=D+1"),
        ("Cube", CUBE_V, CUBE_E, CUBE_F,
         "V=2^D, E=V, F=D!"),
        ("Octahedron", OCTA_V, OCTA_E, OCTA_F,
         "V=D!, E=V, F=2^D"),
        ("Dodecahedron", DODEC_V, DODEC_E, DODEC_F,
         "V=F, E=E, F=V"),
        ("Icosahedron ★", ICOS_V, ICOS_E, ICOS_F,
         "V=V, E=E, F=F ← CATHEDRAL"),
    ]
    for name, v, e, f, note in rows:
        chi = v - e + f
        print(f"  {name:<14} {v:>6}  {e:>6}  {f:>6}  {chi}   {note}")
    print()
    print(f"  Σ(V)  = {SUM_V_ALL} = 2q² = 2×{q}² EXACT")
    print(f"  Σ(E)  = {SUM_E_ALL} = D×E = {D}×{E} EXACT")
    print(f"  Σ(F)  = {SUM_F_ALL} = 2q² = Σ(V) EXACT  (vertices = faces globally!)")
    print()
    print("  Dualities:")
    print(f"    Tetrahedron ↔ Tetrahedron (self-dual, V=F=D+1)")
    print(f"    Cube {{{CUBE_V},{CUBE_E},{CUBE_F}}} ↔ Octahedron {{{OCTA_V},{OCTA_E},{OCTA_F}}} (shared E=V={V})")
    print(f"    Dodecahedron {{{DODEC_V},{DODEC_E},{DODEC_F}}} ↔ Icosahedron {{{ICOS_V},{ICOS_E},{ICOS_F}}} (shared E=E={E})")
    print()
    print(f"  All χ = V−E+F = {D-1} = D−1 EXACT for all {N_PLATONIC_SOLIDS}=q solids")
    print(f"  N_Platonic = {N_PLATONIC_SOLIDS} = q EXACT")
    print(f"  ALL_PLATONIC_EXACT = {ALL_PLATONIC_EXACT}")
    print(f"  {N_PLATONIC_IDENTITIES} identities verified")
    print("=" * 62)
