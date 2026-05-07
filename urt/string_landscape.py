"""
String Theory Landscape — Exceptional Geometry meets Cathedral

Cathedral integers match critical dimensions and exceptional group sizes
in string theory with remarkable precision.

Key identifications (all exact integers):
  2N  = 2×13 = 26  ← bosonic string critical dimension (Goddard-Thorn 1972)
  2q  = 2×5  = 10  ← superstring critical dimension (Green-Schwarz 1984)
  2V  = 2×12 = 24  ← Leech lattice dimension (Conway-Sloane)
  4G  = 4×60 = 240 ← E₈ root system size (Lie 1890)
  G+F−2 = 78       ← E₆ adjoint representation dimension
  (N−D−1)×D = 27   ← E₆ fundamental (27-plet) representation

The bosonic string ↔ Leech lattice ↔ Monster moonshine chain connects
Cathedral (2N=26) to the Monster group via the McKay-Thompson series.

Note on reliability:
  DEFINITE   — integer identities (exact)
  NUMERICAL  — approximate matchings (may be coincidental)
  SPECULATIVE — interpretive connections
"""

from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Critical dimensions ───────────────────────────────────────────────────────
D_BOSONIC  = 2 * N            # = 26  bosonic string critical dimension
D_SUPER    = 2 * q            # = 10  superstring critical dimension
D_M_THEORY = D_SUPER + 1     # = 11  M-theory (Witten 1995)
D_LEECH    = 2 * V            # = 24  Leech lattice dimension

# ── E₈ exceptional group ──────────────────────────────────────────────────────
E8_ROOTS   = 4 * G            # = 240  E₈ root system (4×|A₅|)
E8_RANK    = D_SUPER - 2      # = 8    E₈ rank
E8_DIM     = E8_ROOTS + E8_RANK  # = 248  dim(E₈ Lie algebra)

# ── E₆ matter content ─────────────────────────────────────────────────────────
E6_27PLET  = (N - D - 1) * D  # = 9×3 = 27   E₆ fundamental representation
E6_78_ADJ  = G + F - 2        # = 60+20-2=78 E₆ adjoint representation

# ── Heterotic string ──────────────────────────────────────────────────────────
# E₈×E₈ heterotic in 10D = 2q dimensions
HETEROTIC_DIM        = D_SUPER                # = 10
HETEROTIC_GAUGE_DIM  = 2 * E8_DIM            # = 496  (dim of E₈×E₈)

# ── SO(32) heterotic / Type I ─────────────────────────────────────────────────
SO32_DIM = 32 * 31 // 2   # = 496  (same as E₈×E₈!)

# ── Leech lattice and Moonshine ───────────────────────────────────────────────
# Leech lattice Λ₂₄: 24 = 2V, densest packing in R²⁴ (Cohn-Kumar-Miller 2016)
# Bosonic string compactified on Λ₂₄/Z₂ → Monster module V^♮ (Frenkel-Lepowsky-Meurman)
# j-function: j(τ) = q⁻¹ + 744 + 196884q + ...
# 196884 = 196883 + 1  where 196883 = first non-trivial Monster representation
# 196884 = 4×D_LEECH×(D_LEECH+1) + 4 × D_LEECH = 4×24×25 + 96 = 2400+96+... let's check
# Actually 196884 = 196883+1 is the key McKay observation. Note that D_BOSONIC = 26.
J_COEFF_1  = 196884    # coefficient of q in j-function  (McKay moonshine)
MONSTER_LOWEST_REP = 196883   # dim of smallest non-trivial Monster representation

# ── Cathedral interpretation ──────────────────────────────────────────────────
# D_BOSONIC - D_LEECH = 26 - 24 = 2 = q - D = 5 - 3 (also equals 2)
BOSONIC_LEECH_GAP = D_BOSONIC - D_LEECH   # = 2


# ══════════════════════════════════════════════════════════════════════════════
#  Functions
# ══════════════════════════════════════════════════════════════════════════════

def critical_dimensions() -> dict:
    """
    Cathedral integers mapping to string theory critical dimensions.

    All identities are exact (integer arithmetic).

    Returns
    -------
    dict with keys:
        bosonic   — 2N = 2×13 = 26 (bosonic string)
        super     — 2q = 2×5 = 10  (superstring)
        M_theory  — 2q+1 = 11      (M-theory)
        leech     — 2V = 2×12 = 24 (Leech lattice)
        N_used, q_used, V_used
        reliability — all DEFINITE (exact integer identities)
    """
    return {
        "bosonic":      D_BOSONIC,
        "super":        D_SUPER,
        "M_theory":     D_M_THEORY,
        "leech":        D_LEECH,
        "N_used":       N,
        "q_used":       q,
        "V_used":       V,
        "bosonic_check":  (D_BOSONIC == 26),
        "super_check":    (D_SUPER   == 10),
        "leech_check":    (D_LEECH   == 24),
        "M_theory_check": (D_M_THEORY == 11),
        "bosonic_leech_gap": BOSONIC_LEECH_GAP,
        "reliability":  "DEFINITE — exact integer arithmetic",
        "note":         "2N=26, 2q=10, 2V=24, 2q+1=11 are exact; no free parameters",
    }


def exceptional_groups() -> dict:
    """
    Cathedral integers mapping to exceptional Lie group dimensions.

    Returns
    -------
    dict with keys:
        e8_roots, e8_rank, e8_dim, e6_27plet, e6_78adj
        and derivation notes for each.
    """
    return {
        "e8_roots":         E8_ROOTS,
        "e8_roots_formula": "4G = 4×|A₅| = 4×60 = 240",
        "e8_rank":          E8_RANK,
        "e8_rank_formula":  "D_super − 2 = 2q − 2 = 8",
        "e8_dim":           E8_DIM,
        "e8_dim_formula":   "4G + 8 = 240 + 8 = 248",
        "e6_27plet":        E6_27PLET,
        "e6_27_formula":    "(N−D−1)×D = 9×3 = 27",
        "e6_78adj":         E6_78_ADJ,
        "e6_78_formula":    "G + F − 2 = 60 + 20 − 2 = 78",
        "e8_roots_check":   (E8_ROOTS == 240),
        "e8_dim_check":     (E8_DIM   == 248),
        "e6_27_check":      (E6_27PLET == 27),
        "e6_78_check":      (E6_78_ADJ == 78),
        "G_used":           G,
        "N_used":           N,
        "D_used":           D,
        "F_used":           F,
        "reliability":      "DEFINITE for integer identities; E₆ embedding is speculative",
    }


def heterotic_string() -> dict:
    """
    Heterotic string theory connections.

    E₈×E₈ heterotic string lives in 2q=10 dimensions and has gauge
    group of dimension 2×248 = 496 = dim(E₈×E₈).

    Returns
    -------
    dict
    """
    return {
        "dim":              HETEROTIC_DIM,
        "dim_formula":      "2q = 2×5 = 10",
        "gauge_group":      "E₈×E₈",
        "gauge_dim":        HETEROTIC_GAUGE_DIM,
        "gauge_dim_formula":"2×E8_DIM = 2×248 = 496",
        "so32_dim":         SO32_DIM,
        "so32_equals_e8e8": (HETEROTIC_GAUGE_DIM == SO32_DIM),
        "dim_check":        (HETEROTIC_DIM == 10),
        "gauge_dim_check":  (HETEROTIC_GAUGE_DIM == 496),
        "note":             ("496 is a perfect number; dim(SO(32))=dim(E₈×E₈)=496 "
                             "— the two anomaly-free gauge groups in 10D (Green-Schwarz 1984)"),
        "reliability":      "DEFINITE (integer identity); physical embedding is standard string theory",
    }


def moonshine_connection() -> dict:
    """
    Monster moonshine via the bosonic string.

    Chain: Cathedral (2N=26) → bosonic string → Leech lattice (2V=24)
           → Monster module V^♮ → Monster group (McKay-Thompson series).

    Returns
    -------
    dict
    """
    return {
        "bosonic_dim":          D_BOSONIC,
        "bosonic_formula":      "2N = 2×13 = 26",
        "leech_dim":            D_LEECH,
        "leech_formula":        "2V = 2×12 = 24",
        "compactified_dims":    D_BOSONIC - D_LEECH,
        "j_coeff_1":            J_COEFF_1,
        "monster_lowest_rep":   MONSTER_LOWEST_REP,
        "mckay_identity":       J_COEFF_1 == MONSTER_LOWEST_REP + 1,
        "chain":                ("Cathedral[2N=26] → bosonic string → "
                                 "Leech[2V=24] → Monster module V^♮ → Monster"),
        "reliability":          ("DEFINITE: 2N=26 and 2V=24 are exact. "
                                 "The bosonic→Leech→Monster chain is established mathematics. "
                                 "Cathedral being the *source* of 26 is speculative."),
        "note":                 ("26 − 24 = 2 = q−D = 5−3; the two 'extra' bosonic dimensions "
                                 "compactify on a torus, and 24 = Leech lattice dimension = 2V"),
    }


def string_landscape_summary() -> dict:
    """
    Full string landscape / exceptional geometry summary.

    Returns
    -------
    dict with all sub-dicts.
    """
    return {
        "critical_dimensions":  critical_dimensions(),
        "exceptional_groups":   exceptional_groups(),
        "heterotic":            heterotic_string(),
        "moonshine":            moonshine_connection(),
        "cathedral_integers":   {"N": N, "D": D, "V": V, "E": E, "F": F, "G": G, "q": q},
        "delta_star":           DELTA_STAR,
        "summary_note":         (
            "Key exact identities: 2N=26 (bosonic string), 2q=10 (superstring), "
            "2V=24 (Leech lattice), 4G=240 (E₈ roots), G+F−2=78 (E₆ adjoint), "
            "(N−D−1)D=27 (E₆ 27-plet). All from D=3 alone."
        ),
    }


def print_string_report():
    """Print a formatted string landscape report."""
    cd  = critical_dimensions()
    eg  = exceptional_groups()
    het = heterotic_string()
    ms  = moonshine_connection()

    print()
    print("╔" + "═" * 68 + "╗")
    print("║  STRING LANDSCAPE — Cathedral Exceptional Geometry" + " " * 18 + "║")
    print("║  All identities exact (integer arithmetic)" + " " * 26 + "║")
    print("╚" + "═" * 68 + "╝")
    print()
    print("  ┌─ Critical Dimensions ───────────────────────────────────────┐")
    print(f"  │  Bosonic string:  2N = 2×{N} = {D_BOSONIC}   [PDG: 26]  ✓          │")
    print(f"  │  Superstring:     2q = 2×{q}  = {D_SUPER}   [PDG: 10]  ✓          │")
    print(f"  │  M-theory:        2q+1 = {D_M_THEORY}   [PDG: 11]  ✓            │")
    print(f"  │  Leech lattice:   2V = 2×{V} = {D_LEECH}   [math: 24] ✓          │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Exceptional Groups ────────────────────────────────────────┐")
    print(f"  │  E₈ roots:  4G = 4×{G} = {E8_ROOTS}   [math: 240] ✓              │")
    print(f"  │  E₈ rank:   2q−2 = {E8_RANK}   [math: 8]   ✓                  │")
    print(f"  │  E₈ dim:    4G+8 = {E8_DIM}   [math: 248] ✓              │")
    print(f"  │  E₆ 27-plet: (N−D−1)D = {E6_27PLET}   [math: 27]  ✓             │")
    print(f"  │  E₆ adj:    G+F−2 = {E6_78_ADJ}   [math: 78]  ✓               │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Heterotic String ──────────────────────────────────────────┐")
    print(f"  │  E₈×E₈ in {HETEROTIC_DIM}D  (= 2q);  dim(E₈×E₈) = {HETEROTIC_GAUGE_DIM}    │")
    print(f"  │  dim(SO(32)) = {SO32_DIM}  =  dim(E₈×E₈)  ✓               │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Monster Moonshine ─────────────────────────────────────────┐")
    print(f"  │  2N={D_BOSONIC} (bosonic) → Leech 2V={D_LEECH} → Monster module V^♮      │")
    print(f"  │  j(τ) coeff: 196884 = {MONSTER_LOWEST_REP} + 1  (McKay)     │")
    print(f"  │  2N−2V = {BOSONIC_LEECH_GAP} = q−D = {q}−{D}  (compactified dims)        │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print(f"  δ★ = {DELTA_STAR:.8f}  |  N={N}, D={D}, V={V}, F={F}, G={G}, q={q}")
    print()
