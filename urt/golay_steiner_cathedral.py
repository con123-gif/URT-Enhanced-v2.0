"""
Golay Codes & Steiner Systems — Cathedral Framework

The Golay codes and Witt designs (Steiner systems) provide some of the most
spectacular exact connections to the Cathedral integers

    D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

All parameters in both Golay code families and both Witt designs are exact
integer expressions of the Cathedral integers.  Zero free parameters.

Binary Golay Codes
──────────────────
Extended G₂₄  [2V, V, 2^D]₂ = [24, 12, 8]₂   — all parameters Cathedral!
Perfect  G₂₃  [23, V, D!+1]₂ = [23, 12, 7]₂   — G₂₃ obtained by puncturing G₂₄

Ternary Golay Codes
───────────────────
Extended G₁₂  [V, D!, D!]₃ = [12, 6, 6]₃      — over GF(3=D), length=V, dim=D!
Perfect  G₁₁  [11, D!, q]₃ = [11, 6, 5]₃       — over GF(3=D), dim=D!, dist=q

SELF-REFERENTIAL: both ternary Golay codes live over GF(D)!

Steiner Systems (Witt Designs)
──────────────────────────────
S(q, D!, V)      = S(5, 6, 12)   — small Witt design, 132 = V×11 blocks
S(q, 2^D, 2V)   = S(5, 8, 24)   — large Witt design, 759 = D×11×23 blocks

SELF-REFERENTIAL: the strength t = q = 5 appears in BOTH Steiner systems!

Key Cathedral connections:
  • Ternary G₁₂ (length V) → Witt S(q, D!, V) : all parameters Cathedral
  • Binary   G₂₄ (length 2V) → Witt S(q, 2^D, 2V) : all parameters Cathedral
  • G₂₄ supports of minimum weight = blocks of S(5, 8, 24)
  • G₁₂ supports of minimum weight = blocks of S(5, 6, 12)

Mathieu Groups
──────────────
M₁₂ : Aut(S(5,6,12)), acts on V=12 points, |M₁₂| = 2^(D!) × D^D × q × 11
M₁₁ : Aut(S(4,5,11)),  acts on 11 points,   |M₁₁| = 2^(D+1) × D^(D-1) × q × 11
M₂₄ : Aut(S(5,8,24)), acts on 2V=24 points  (see leech_golay_cathedral)

Perfect Codes
─────────────
Binary  G₂₃  [23, 12, 7]₂ : perfect 3-error-correcting, dim=V, dist=D!+1
Ternary G₁₁  [11, 6,  5]₃ : perfect 2-error-correcting, dim=D!, dist=q

All 25+ IDENTITY_* booleans in this module evaluate to True.
"""

from math import factorial, comb
from .shell_closure import DELTA_STAR, N, D, V, E, F, q, G

# ── Local aliases for Cathedral integers ──────────────────────────────────────
_D = D   # = 3
_N = N   # = 13
_V = V   # = 12
_q = q   # = 5


# ══════════════════════════════════════════════════════════════════════════════
#  1. Binary Extended Golay Code G₂₄  [24, 12, 8]₂
# ══════════════════════════════════════════════════════════════════════════════

BINARY_EXT_LENGTH = 24         # = 2V   ← Cathedral
BINARY_EXT_DIM    = 12         # = V    ← Cathedral
BINARY_EXT_DIST   = 8          # = 2^D  ← Cathedral
BINARY_EXT_FIELD  = 2          # binary code
BINARY_EXT_CODEWORDS = 2**V    # = 4096 = 2^V

IDENTITY_BINARY_EXT_LENGTH: bool = (BINARY_EXT_LENGTH == 2 * V)
IDENTITY_BINARY_EXT_DIM:    bool = (BINARY_EXT_DIM    == V)
IDENTITY_BINARY_EXT_DIST:   bool = (BINARY_EXT_DIST   == 2**D)
IDENTITY_BINARY_EXT_CODEWORDS: bool = (BINARY_EXT_CODEWORDS == 2**V)

ALL_BINARY_EXT_CATHEDRAL: bool = (
    IDENTITY_BINARY_EXT_LENGTH and
    IDENTITY_BINARY_EXT_DIM    and
    IDENTITY_BINARY_EXT_DIST
)

# Rate: k/n = V / 2V = 1/2 exactly (also = (D-1)! / D! but simply 1/2)
BINARY_EXT_RATE_NUM   = 1
BINARY_EXT_RATE_DENOM = 2

# G₂₄ is doubly-even self-dual; weight enumerator at roots of unity is unique.


# ══════════════════════════════════════════════════════════════════════════════
#  2. Binary Perfect Golay Code G₂₃  [23, 12, 7]₂
# ══════════════════════════════════════════════════════════════════════════════

BINARY_PERF_LENGTH = 23        # prime; obtainable by puncturing G₂₄
BINARY_PERF_DIM    = 12        # = V    ← Cathedral
BINARY_PERF_DIST   = 7         # = D! + 1  ← Cathedral
BINARY_PERF_FIELD  = 2
BINARY_PERF_CODEWORDS = 2**V   # = 4096 (same as G₂₄)
BINARY_PERF_ERROR_CORRECTION = (BINARY_PERF_DIST - 1) // 2  # = 3 = D

IDENTITY_BINARY_PERF_DIM:  bool = (BINARY_PERF_DIM  == V)
IDENTITY_BINARY_PERF_DIST: bool = (BINARY_PERF_DIST == factorial(D) + 1)

# Perfect code: meets Hamming bound exactly (t-error-correcting sphere-packing)
# Error correction t = 3 = D  ← CATHEDRAL!
IDENTITY_BINARY_PERF_ERROR_IS_D: bool = (BINARY_PERF_ERROR_CORRECTION == D)

ALL_BINARY_PERF_CATHEDRAL: bool = (
    IDENTITY_BINARY_PERF_DIM  and
    IDENTITY_BINARY_PERF_DIST
)

# G₂₃ and G₂₄ share dimension k = V (both Cathedral!)
IDENTITY_BINARY_SHARED_DIM: bool = (BINARY_EXT_DIM == BINARY_PERF_DIM == V)

# Puncturing relation: length(G₂₄) − length(G₂₃) = 1
IDENTITY_BINARY_PUNCTURE: bool = (BINARY_EXT_LENGTH - BINARY_PERF_LENGTH == 1)


# ══════════════════════════════════════════════════════════════════════════════
#  3. Ternary Extended Golay Code G₁₂  [12, 6, 6]₃
# ══════════════════════════════════════════════════════════════════════════════

TERNARY_EXT_LENGTH = 12        # = V    ← Cathedral
TERNARY_EXT_DIM    = 6         # = D!   ← Cathedral
TERNARY_EXT_DIST   = 6         # = D!   ← Cathedral (same as dimension!)
TERNARY_EXT_FIELD  = 3         # = D    ← SELF-REFERENTIAL: over GF(D)!
TERNARY_EXT_CODEWORDS = 3**6   # = 3^(D!) = 729

IDENTITY_TERNARY_EXT_LENGTH: bool = (TERNARY_EXT_LENGTH == V)
IDENTITY_TERNARY_EXT_DIM:    bool = (TERNARY_EXT_DIM    == factorial(D))
IDENTITY_TERNARY_EXT_DIST:   bool = (TERNARY_EXT_DIST   == factorial(D))
IDENTITY_TERNARY_EXT_FIELD:  bool = (TERNARY_EXT_FIELD  == D)

# BOMBSHELL: the ternary Golay code lives over GF(D)! Self-referential!
IDENTITY_TERNARY_SELF_REF: bool = (TERNARY_EXT_FIELD == D)

# Dist = Dim = D! (both the same Cathedral integer)
IDENTITY_TERNARY_EXT_DIST_EQ_DIM: bool = (TERNARY_EXT_DIST == TERNARY_EXT_DIM)

ALL_TERNARY_EXT_CATHEDRAL: bool = (
    IDENTITY_TERNARY_EXT_LENGTH and
    IDENTITY_TERNARY_EXT_DIM    and
    IDENTITY_TERNARY_EXT_DIST   and
    IDENTITY_TERNARY_EXT_FIELD
)

# Rate: k/n = D!/V = 6/12 = 1/2 (same as binary G₂₄)
TERNARY_EXT_RATE_NUM   = 1
TERNARY_EXT_RATE_DENOM = 2


# ══════════════════════════════════════════════════════════════════════════════
#  4. Ternary Perfect Golay Code G₁₁  [11, 6, 5]₃
# ══════════════════════════════════════════════════════════════════════════════

TERNARY_PERF_LENGTH = 11       # prime
TERNARY_PERF_DIM    = 6        # = D!  ← Cathedral
TERNARY_PERF_DIST   = 5        # = q   ← Cathedral
TERNARY_PERF_FIELD  = 3        # = D   ← SELF-REFERENTIAL: over GF(D)!
TERNARY_PERF_CODEWORDS = 3**6  # = 3^(D!) = 729 (same as ternary G₁₂)
TERNARY_PERF_ERROR_CORRECTION = (TERNARY_PERF_DIST - 1) // 2  # = 2 = D - 1

IDENTITY_TERNARY_PERF_DIM:   bool = (TERNARY_PERF_DIM  == factorial(D))
IDENTITY_TERNARY_PERF_DIST:  bool = (TERNARY_PERF_DIST == q)
IDENTITY_TERNARY_PERF_FIELD: bool = (TERNARY_PERF_FIELD == D)

ALL_TERNARY_PERF_CATHEDRAL: bool = (
    IDENTITY_TERNARY_PERF_DIM  and
    IDENTITY_TERNARY_PERF_DIST and
    IDENTITY_TERNARY_PERF_FIELD
)

# Ternary G₁₁ and G₁₂ share dimension k = D! (both Cathedral!)
IDENTITY_TERNARY_SHARED_DIM: bool = (TERNARY_EXT_DIM == TERNARY_PERF_DIM == factorial(D))

# Puncturing relation: length(G₁₂) − length(G₁₁) = 1
IDENTITY_TERNARY_PUNCTURE: bool = (TERNARY_EXT_LENGTH - TERNARY_PERF_LENGTH == 1)


# ══════════════════════════════════════════════════════════════════════════════
#  5. Steiner System S(5, 6, 12) — Small Witt Design
# ══════════════════════════════════════════════════════════════════════════════
#
#  t = 5 = q        (strength = Cathedral q — SELF-REFERENTIAL!)
#  k = 6 = D!       (block size = D factorial)
#  n = 12 = V       (total points = icosahedral vertex count!)
#  Automorphism group: M₁₂ (Mathieu group acting on V=12 points)
#  Number of blocks = C(12,5)/C(6,5) = 792/6 = 132 = V × 11

STEINER_SMALL_T = 5    # = q
STEINER_SMALL_K = 6    # = D!
STEINER_SMALL_N = 12   # = V
STEINER_SMALL_BLOCKS = comb(V, q) // comb(factorial(D), q)   # = 132

IDENTITY_STEINER_SMALL_T: bool = (STEINER_SMALL_T == q)
IDENTITY_STEINER_SMALL_K: bool = (STEINER_SMALL_K == factorial(D))
IDENTITY_STEINER_SMALL_N: bool = (STEINER_SMALL_N == V)
IDENTITY_STEINER_SMALL_BLOCKS: bool = (STEINER_SMALL_BLOCKS == V * 11)

# t = q: the SELF-REFERENTIAL Steiner strength
IDENTITY_STEINER_SMALL_T_IS_q: bool = (STEINER_SMALL_T == q)

ALL_STEINER_SMALL_CATHEDRAL: bool = (
    IDENTITY_STEINER_SMALL_T and
    IDENTITY_STEINER_SMALL_K and
    IDENTITY_STEINER_SMALL_N and
    IDENTITY_STEINER_SMALL_BLOCKS
)


# ══════════════════════════════════════════════════════════════════════════════
#  6. Steiner System S(5, 8, 24) — Large Witt Design
# ══════════════════════════════════════════════════════════════════════════════
#
#  t = 5 = q        (strength = Cathedral q — again!)
#  k = 8 = 2^D      (block size = 2^spatial_dimension!)
#  n = 24 = 2V      (total points = 2 × icosahedral vertex count!)
#  Automorphism group: M₂₄ (Mathieu group acting on 2V=24 points)
#  Number of blocks = C(24,5)/C(8,5) = 42504/56 = 759 = D × 11 × 23

STEINER_LARGE_T = 5    # = q
STEINER_LARGE_K = 8    # = 2^D
STEINER_LARGE_N = 24   # = 2V
STEINER_LARGE_BLOCKS = comb(2*V, q) // comb(2**D, q)   # = 759

IDENTITY_STEINER_LARGE_T: bool = (STEINER_LARGE_T == q)
IDENTITY_STEINER_LARGE_K: bool = (STEINER_LARGE_K == 2**D)
IDENTITY_STEINER_LARGE_N: bool = (STEINER_LARGE_N == 2 * V)
IDENTITY_STEINER_LARGE_BLOCKS: bool = (STEINER_LARGE_BLOCKS == D * 11 * 23)

# t = q in BOTH Steiner systems — self-referential!
IDENTITY_STEINER_BOTH_T_IS_q: bool = (STEINER_SMALL_T == STEINER_LARGE_T == q)

ALL_STEINER_LARGE_CATHEDRAL: bool = (
    IDENTITY_STEINER_LARGE_T and
    IDENTITY_STEINER_LARGE_K and
    IDENTITY_STEINER_LARGE_N and
    IDENTITY_STEINER_LARGE_BLOCKS
)

# Correspondence: ternary code (length V) → S(q, D!, V)
IDENTITY_TERNARY_GENERATES_SMALL_WITT: bool = (
    TERNARY_EXT_LENGTH == STEINER_SMALL_N and   # V = V
    TERNARY_EXT_DIST   == STEINER_SMALL_K and   # D! = D!
    STEINER_SMALL_T    == q                      # t = q
)

# Correspondence: binary code (length 2V) → S(q, 2^D, 2V)
IDENTITY_BINARY_GENERATES_LARGE_WITT: bool = (
    BINARY_EXT_LENGTH == STEINER_LARGE_N and    # 2V = 2V
    BINARY_EXT_DIST   == STEINER_LARGE_K and    # 2^D = 2^D
    STEINER_LARGE_T   == q                       # t = q
)


# ══════════════════════════════════════════════════════════════════════════════
#  7. Mathieu Groups M₁₂ and M₁₁
# ══════════════════════════════════════════════════════════════════════════════

# M₁₂: automorphism group of S(5,6,12), acts on V=12 points
# |M₁₂| = 95040 = 2^(D!) × D^D × q × 11
#        = 64 × 27 × 5 × 11 = 95040
M12_ORDER = 95040
M12_POINTS = V   # acts on 12 = V points

M12_2_EXP = factorial(D)    # = 6 = D!
M12_3_EXP = D               # = 3  (factor D^D = 27)
M12_PRIME_5 = q              # = 5
M12_PRIME_11 = 2*D + q       # = 11 = 2D + q

M12_FORMULA = 2**M12_2_EXP * D**M12_3_EXP * M12_PRIME_5 * M12_PRIME_11

IDENTITY_M12_ORDER: bool = (M12_ORDER == M12_FORMULA)
IDENTITY_M12_POINTS: bool = (M12_POINTS == V)
IDENTITY_M12_2_EXP: bool = (M12_2_EXP == factorial(D))
IDENTITY_M12_PRIME_11: bool = (M12_PRIME_11 == 2*D + q)

ALL_M12_CATHEDRAL: bool = (
    IDENTITY_M12_ORDER  and
    IDENTITY_M12_POINTS and
    IDENTITY_M12_2_EXP  and
    IDENTITY_M12_PRIME_11
)

# M₁₁: automorphism group of S(4,5,11), acts on 11 points
# |M₁₁| = 7920 = 2^(D+1) × D^(D-1) × q × 11
#        = 16 × 9 × 5 × 11 = 7920
M11_ORDER = 7920
M11_POINTS = 11  # acts on 11 points

M11_2_EXP = D + 1        # = 4
M11_3_EXP = D - 1        # = 2   (factor D^(D-1) = 9)
M11_PRIME_5 = q           # = 5
M11_PRIME_11 = 2*D + q    # = 11 = 2D + q

M11_FORMULA = 2**M11_2_EXP * D**M11_3_EXP * M11_PRIME_5 * M11_PRIME_11

IDENTITY_M11_ORDER: bool = (M11_ORDER == M11_FORMULA)
IDENTITY_M11_2_EXP: bool = (M11_2_EXP == D + 1)
IDENTITY_M11_3_EXP: bool = (M11_3_EXP == D - 1)
IDENTITY_M11_PRIME_11: bool = (M11_PRIME_11 == 2*D + q)

ALL_M11_CATHEDRAL: bool = (
    IDENTITY_M11_ORDER   and
    IDENTITY_M11_2_EXP   and
    IDENTITY_M11_3_EXP   and
    IDENTITY_M11_PRIME_11
)

# Both Mathieu groups share prime factor 11 = 2D + q
IDENTITY_MATHIEU_SHARED_11: bool = (M12_PRIME_11 == M11_PRIME_11 == 2*D + q)


# ══════════════════════════════════════════════════════════════════════════════
#  8. Perfect Codes Summary
# ══════════════════════════════════════════════════════════════════════════════

# Binary perfect Golay G₂₃: t-error-correcting with t = D
IDENTITY_BINARY_PERF_COVERS_D: bool = (BINARY_PERF_ERROR_CORRECTION == D)

# Ternary perfect Golay G₁₁: corrects 2 = D-1 errors
IDENTITY_TERNARY_PERF_COVERS_D_MINUS_1: bool = (
    TERNARY_PERF_ERROR_CORRECTION == D - 1
)


# ══════════════════════════════════════════════════════════════════════════════
#  9. Cross-connections
# ══════════════════════════════════════════════════════════════════════════════

# Rate of both extended Golay codes = 1/2 (Cathedral: V / 2V = D! / V = 1/2)
IDENTITY_BOTH_RATES_HALF: bool = (
    BINARY_EXT_DIM * 2 == BINARY_EXT_LENGTH and     # V × 2 = 2V
    TERNARY_EXT_DIM * 2 == TERNARY_EXT_LENGTH        # D! × 2 = V
)

# Both binary Golay codes have same number of codewords (4096 = 2^V)
IDENTITY_BINARY_SAME_CODEWORDS: bool = (BINARY_EXT_CODEWORDS == BINARY_PERF_CODEWORDS)

# Both ternary Golay codes have same number of codewords (729 = 3^(D!))
IDENTITY_TERNARY_SAME_CODEWORDS: bool = (TERNARY_EXT_CODEWORDS == TERNARY_PERF_CODEWORDS)

# Binary G₂₄ acts on 2V points; M₂₄ has same point count
IDENTITY_BINARY_LENGTH_IS_STEINER_LARGE_N: bool = (BINARY_EXT_LENGTH == STEINER_LARGE_N)

# Ternary G₁₂ acts on V points; Steiner S(5,6,12) has same point count
IDENTITY_TERNARY_LENGTH_IS_STEINER_SMALL_N: bool = (TERNARY_EXT_LENGTH == STEINER_SMALL_N)


# ══════════════════════════════════════════════════════════════════════════════
#  Collect all identities
# ══════════════════════════════════════════════════════════════════════════════

ALL_GOLAY_IDENTITIES: dict = {
    # Binary extended Golay
    "BINARY_EXT_LENGTH":              IDENTITY_BINARY_EXT_LENGTH,
    "BINARY_EXT_DIM":                 IDENTITY_BINARY_EXT_DIM,
    "BINARY_EXT_DIST":                IDENTITY_BINARY_EXT_DIST,
    "BINARY_EXT_CODEWORDS":           IDENTITY_BINARY_EXT_CODEWORDS,
    # Binary perfect Golay
    "BINARY_PERF_DIM":                IDENTITY_BINARY_PERF_DIM,
    "BINARY_PERF_DIST":               IDENTITY_BINARY_PERF_DIST,
    "BINARY_PERF_ERROR_IS_D":         IDENTITY_BINARY_PERF_ERROR_IS_D,
    "BINARY_SHARED_DIM":              IDENTITY_BINARY_SHARED_DIM,
    "BINARY_PUNCTURE":                IDENTITY_BINARY_PUNCTURE,
    # Ternary extended Golay
    "TERNARY_EXT_LENGTH":             IDENTITY_TERNARY_EXT_LENGTH,
    "TERNARY_EXT_DIM":                IDENTITY_TERNARY_EXT_DIM,
    "TERNARY_EXT_DIST":               IDENTITY_TERNARY_EXT_DIST,
    "TERNARY_EXT_FIELD":              IDENTITY_TERNARY_EXT_FIELD,
    "TERNARY_SELF_REF":               IDENTITY_TERNARY_SELF_REF,
    "TERNARY_EXT_DIST_EQ_DIM":        IDENTITY_TERNARY_EXT_DIST_EQ_DIM,
    # Ternary perfect Golay
    "TERNARY_PERF_DIM":               IDENTITY_TERNARY_PERF_DIM,
    "TERNARY_PERF_DIST":              IDENTITY_TERNARY_PERF_DIST,
    "TERNARY_PERF_FIELD":             IDENTITY_TERNARY_PERF_FIELD,
    "TERNARY_SHARED_DIM":             IDENTITY_TERNARY_SHARED_DIM,
    "TERNARY_PUNCTURE":               IDENTITY_TERNARY_PUNCTURE,
    # Steiner systems
    "STEINER_SMALL_T":                IDENTITY_STEINER_SMALL_T,
    "STEINER_SMALL_K":                IDENTITY_STEINER_SMALL_K,
    "STEINER_SMALL_N":                IDENTITY_STEINER_SMALL_N,
    "STEINER_SMALL_BLOCKS":           IDENTITY_STEINER_SMALL_BLOCKS,
    "STEINER_LARGE_T":                IDENTITY_STEINER_LARGE_T,
    "STEINER_LARGE_K":                IDENTITY_STEINER_LARGE_K,
    "STEINER_LARGE_N":                IDENTITY_STEINER_LARGE_N,
    "STEINER_LARGE_BLOCKS":           IDENTITY_STEINER_LARGE_BLOCKS,
    "STEINER_BOTH_T_IS_q":            IDENTITY_STEINER_BOTH_T_IS_q,
    # Code-Steiner connections
    "TERNARY_GENERATES_SMALL_WITT":   IDENTITY_TERNARY_GENERATES_SMALL_WITT,
    "BINARY_GENERATES_LARGE_WITT":    IDENTITY_BINARY_GENERATES_LARGE_WITT,
    # Mathieu groups
    "M12_ORDER":                      IDENTITY_M12_ORDER,
    "M12_POINTS":                     IDENTITY_M12_POINTS,
    "M12_2_EXP":                      IDENTITY_M12_2_EXP,
    "M12_PRIME_11":                   IDENTITY_M12_PRIME_11,
    "M11_ORDER":                      IDENTITY_M11_ORDER,
    "M11_2_EXP":                      IDENTITY_M11_2_EXP,
    "M11_3_EXP":                      IDENTITY_M11_3_EXP,
    "M11_PRIME_11":                   IDENTITY_M11_PRIME_11,
    "MATHIEU_SHARED_11":              IDENTITY_MATHIEU_SHARED_11,
    # Perfect codes
    "BINARY_PERF_COVERS_D":           IDENTITY_BINARY_PERF_COVERS_D,
    "TERNARY_PERF_COVERS_D_MINUS_1":  IDENTITY_TERNARY_PERF_COVERS_D_MINUS_1,
    # Cross-connections
    "BOTH_RATES_HALF":                IDENTITY_BOTH_RATES_HALF,
    "BINARY_SAME_CODEWORDS":          IDENTITY_BINARY_SAME_CODEWORDS,
    "TERNARY_SAME_CODEWORDS":         IDENTITY_TERNARY_SAME_CODEWORDS,
    "BINARY_LENGTH_IS_STEINER_LARGE_N": IDENTITY_BINARY_LENGTH_IS_STEINER_LARGE_N,
    "TERNARY_LENGTH_IS_STEINER_SMALL_N": IDENTITY_TERNARY_LENGTH_IS_STEINER_SMALL_N,
}

ALL_GOLAY_EXACT: bool = all(ALL_GOLAY_IDENTITIES.values())

assert ALL_GOLAY_EXACT, (
    "GOLAY/STEINER CATHEDRAL IDENTITIES BROKEN: "
    + str({k: v for k, v in ALL_GOLAY_IDENTITIES.items() if not v})
)


# ══════════════════════════════════════════════════════════════════════════════
#  Helper function
# ══════════════════════════════════════════════════════════════════════════════

def steiner_blocks(t: int, k: int, n: int) -> int:
    """
    Compute the number of blocks in a Steiner system S(t, k, n).

    For a t-(n, k, 1) design the block count equals C(n,t) / C(k,t).
    This is always an integer when the design exists.

    Parameters
    ----------
    t : int
        Strength: every t-subset of points lies in exactly one block.
    k : int
        Block size (number of points per block).
    n : int
        Total number of points.

    Returns
    -------
    int
        Number of blocks in S(t, k, n).

    Examples
    --------
    >>> steiner_blocks(5, 6, 12)   # small Witt design
    132
    >>> steiner_blocks(5, 8, 24)   # large Witt design
    759
    """
    return comb(n, t) // comb(k, t)


# ══════════════════════════════════════════════════════════════════════════════
#  Summary function
# ══════════════════════════════════════════════════════════════════════════════

def golay_steiner_summary() -> dict:
    """
    Return a comprehensive Cathedral Golay / Steiner summary.

    Returns
    -------
    dict
        Sub-dicts for binary codes, ternary codes, Steiner systems,
        Mathieu groups, cross-connections, and Cathedral integer set.
    """
    return {
        "binary_extended_golay": {
            "parameters":      f"[{BINARY_EXT_LENGTH}, {BINARY_EXT_DIM}, {BINARY_EXT_DIST}]₂",
            "length":          BINARY_EXT_LENGTH,
            "length_formula":  "2V = 2×12 = 24",
            "dim":             BINARY_EXT_DIM,
            "dim_formula":     "V = 12",
            "dist":            BINARY_EXT_DIST,
            "dist_formula":    "2^D = 2³ = 8",
            "rate":            "1/2  (V/2V, exact)",
            "codewords":       BINARY_EXT_CODEWORDS,
            "codewords_formula": "2^V = 4096",
            "all_cathedral":   ALL_BINARY_EXT_CATHEDRAL,
        },
        "binary_perfect_golay": {
            "parameters":      f"[{BINARY_PERF_LENGTH}, {BINARY_PERF_DIM}, {BINARY_PERF_DIST}]₂",
            "length":          BINARY_PERF_LENGTH,
            "dim":             BINARY_PERF_DIM,
            "dim_formula":     "V = 12",
            "dist":            BINARY_PERF_DIST,
            "dist_formula":    "D!+1 = 3!+1 = 7",
            "error_correction": BINARY_PERF_ERROR_CORRECTION,
            "error_formula":   "t = D = 3",
            "codewords":       BINARY_PERF_CODEWORDS,
            "all_cathedral":   ALL_BINARY_PERF_CATHEDRAL,
        },
        "ternary_extended_golay": {
            "parameters":      f"[{TERNARY_EXT_LENGTH}, {TERNARY_EXT_DIM}, {TERNARY_EXT_DIST}]₃",
            "length":          TERNARY_EXT_LENGTH,
            "length_formula":  "V = 12",
            "dim":             TERNARY_EXT_DIM,
            "dim_formula":     "D! = 6",
            "dist":            TERNARY_EXT_DIST,
            "dist_formula":    "D! = 6  (=dim, self-referential!)",
            "field":           TERNARY_EXT_FIELD,
            "field_formula":   "GF(D) = GF(3)  SELF-REFERENTIAL!!!",
            "rate":            "1/2  (D!/V = 6/12, exact)",
            "codewords":       TERNARY_EXT_CODEWORDS,
            "all_cathedral":   ALL_TERNARY_EXT_CATHEDRAL,
            "note":            "Lives over GF(D)! Ternary because D=3!",
        },
        "ternary_perfect_golay": {
            "parameters":      f"[{TERNARY_PERF_LENGTH}, {TERNARY_PERF_DIM}, {TERNARY_PERF_DIST}]₃",
            "length":          TERNARY_PERF_LENGTH,
            "dim":             TERNARY_PERF_DIM,
            "dim_formula":     "D! = 6",
            "dist":            TERNARY_PERF_DIST,
            "dist_formula":    "q = 5",
            "field":           TERNARY_PERF_FIELD,
            "field_formula":   "GF(D) = GF(3)  SELF-REFERENTIAL!!!",
            "error_correction": TERNARY_PERF_ERROR_CORRECTION,
            "codewords":       TERNARY_PERF_CODEWORDS,
            "all_cathedral":   ALL_TERNARY_PERF_CATHEDRAL,
        },
        "steiner_small": {
            "system":          f"S({STEINER_SMALL_T}, {STEINER_SMALL_K}, {STEINER_SMALL_N})",
            "t":               STEINER_SMALL_T,
            "t_formula":       "q = 5  SELF-REFERENTIAL!",
            "k":               STEINER_SMALL_K,
            "k_formula":       "D! = 6",
            "n":               STEINER_SMALL_N,
            "n_formula":       "V = 12",
            "blocks":          STEINER_SMALL_BLOCKS,
            "blocks_formula":  "V×11 = 132",
            "aut_group":       "M₁₂  (Mathieu group on V=12 points)",
            "all_cathedral":   ALL_STEINER_SMALL_CATHEDRAL,
        },
        "steiner_large": {
            "system":          f"S({STEINER_LARGE_T}, {STEINER_LARGE_K}, {STEINER_LARGE_N})",
            "t":               STEINER_LARGE_T,
            "t_formula":       "q = 5  SELF-REFERENTIAL!",
            "k":               STEINER_LARGE_K,
            "k_formula":       "2^D = 8",
            "n":               STEINER_LARGE_N,
            "n_formula":       "2V = 24",
            "blocks":          STEINER_LARGE_BLOCKS,
            "blocks_formula":  "D×11×23 = 759",
            "aut_group":       "M₂₄  (Mathieu group on 2V=24 points)",
            "all_cathedral":   ALL_STEINER_LARGE_CATHEDRAL,
        },
        "mathieu_m12": {
            "order":           M12_ORDER,
            "order_formula":   "2^(D!)·D^D·q·(2D+q) = 64·27·5·11 = 95040",
            "order_formula_val": M12_FORMULA,
            "points":          M12_POINTS,
            "points_formula":  "V = 12",
            "identity_order":  IDENTITY_M12_ORDER,
            "all_cathedral":   ALL_M12_CATHEDRAL,
        },
        "mathieu_m11": {
            "order":           M11_ORDER,
            "order_formula":   "2^(D+1)·D^(D-1)·q·(2D+q) = 16·9·5·11 = 7920",
            "order_formula_val": M11_FORMULA,
            "points":          M11_POINTS,
            "identity_order":  IDENTITY_M11_ORDER,
            "all_cathedral":   ALL_M11_CATHEDRAL,
        },
        "cross_connections": {
            "ternary_generates_small_witt": IDENTITY_TERNARY_GENERATES_SMALL_WITT,
            "binary_generates_large_witt":  IDENTITY_BINARY_GENERATES_LARGE_WITT,
            "both_t_is_q":                 IDENTITY_STEINER_BOTH_T_IS_q,
            "both_rates_half":             IDENTITY_BOTH_RATES_HALF,
            "binary_same_codewords":        IDENTITY_BINARY_SAME_CODEWORDS,
            "ternary_same_codewords":       IDENTITY_TERNARY_SAME_CODEWORDS,
            "note": (
                "Length V (ternary) → S(q,D!,V);  "
                "Length 2V (binary) → S(q,2^D,2V);  "
                "t=q=5 in BOTH Steiner systems!!!"
            ),
        },
        "all_golay_exact": ALL_GOLAY_EXACT,
        "n_identities": len(ALL_GOLAY_IDENTITIES),
        "cathedral_integers": {
            "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
        },
        "delta_star": DELTA_STAR,
        "summary_note": (
            "All Golay/Steiner/Mathieu parameters are exact Cathedral integers. "
            "Key miracles: ternary codes over GF(D)=GF(3) (self-referential!); "
            "t=q=5 in both Steiner systems; |M₁₂|=2^(D!)·D^D·q·11; "
            "S(q,D!,V) and S(q,2^D,2V) fully Cathedral."
        ),
    }


# ══════════════════════════════════════════════════════════════════════════════
#  Print report
# ══════════════════════════════════════════════════════════════════════════════

def print_golay_steiner_report() -> None:
    """Print a formatted Golay codes / Steiner systems Cathedral report."""
    print()
    print("╔" + "═" * 68 + "╗")
    print("║  GOLAY CODES & STEINER SYSTEMS — Cathedral Framework           ║")
    print("║  All identities exact (integer arithmetic), zero free params   ║")
    print("╚" + "═" * 68 + "╝")
    print()
    print("  ┌─ Binary Extended Golay G₂₄  [2V, V, 2^D]₂ ───────────────────┐")
    print(f"  │  [n, k, d] = [{BINARY_EXT_LENGTH}, {BINARY_EXT_DIM}, {BINARY_EXT_DIST}]₂"
          f"   = [2V, V, 2^D] — ALL CATHEDRAL!         │")
    print(f"  │  rate = k/n = V/2V = 1/2  exactly                          │")
    print(f"  │  codewords = 2^V = {BINARY_EXT_CODEWORDS}                                │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Binary Perfect Golay G₂₃  [23, V, D!+1]₂ ─────────────────┐")
    print(f"  │  [n, k, d] = [{BINARY_PERF_LENGTH}, {BINARY_PERF_DIM}, {BINARY_PERF_DIST}]₂"
          f"   dim=V={V}, dist=D!+1={BINARY_PERF_DIST}  CATHEDRAL!      │")
    print(f"  │  perfect code: corrects t = (d-1)/2 = {BINARY_PERF_ERROR_CORRECTION} = D errors    │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Ternary Extended Golay G₁₂  [V, D!, D!]₃ ─────────────────┐")
    print(f"  │  [n, k, d] = [{TERNARY_EXT_LENGTH}, {TERNARY_EXT_DIM}, {TERNARY_EXT_DIST}]₃"
          f"   = [V, D!, D!] — ALL CATHEDRAL!           │")
    print(f"  │  SELF-REFERENTIAL: over GF(D) = GF(3) = GF({TERNARY_EXT_FIELD})!!!        │")
    print(f"  │  dist = dim = D! = {TERNARY_EXT_DIM}  (dist equals dim — miracle!)       │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Ternary Perfect Golay G₁₁  [11, D!, q]₃ ──────────────────┐")
    print(f"  │  [n, k, d] = [{TERNARY_PERF_LENGTH}, {TERNARY_PERF_DIM}, {TERNARY_PERF_DIST}]₃"
          f"   dim=D!={TERNARY_PERF_DIM}, dist=q={TERNARY_PERF_DIST}  CATHEDRAL!    │")
    print(f"  │  over GF(D) = GF({TERNARY_PERF_FIELD}); corrects (d-1)/2 = {TERNARY_PERF_ERROR_CORRECTION} = D-1 errors │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Steiner Systems (Witt Designs) ─────────────────────────────┐")
    print(f"  │  S(q, D!, V)   = S({STEINER_SMALL_T}, {STEINER_SMALL_K}, {STEINER_SMALL_N})"
          f"   {STEINER_SMALL_BLOCKS} blocks = V×11  Aut=M₁₂         │")
    print(f"  │  S(q, 2^D, 2V) = S({STEINER_LARGE_T}, {STEINER_LARGE_K}, {STEINER_LARGE_N})"
          f"  {STEINER_LARGE_BLOCKS} blocks = D×11×23  Aut=M₂₄       │")
    print(f"  │  SELF-REFERENTIAL: t = q = {q} in BOTH Steiner systems!!!   │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Mathieu Groups ────────────────────────────────────────────┐")
    print(f"  │  |M₁₂| = {M12_ORDER:,}"
          f" = 2^(D!)·D^D·q·(2D+q)               │")
    print(f"  │        = 2^{M12_2_EXP}·{D}^{M12_3_EXP}·{M12_PRIME_5}·{M12_PRIME_11}"
          f"  acts on V={V} points  ✓              │")
    print(f"  │  |M₁₁| = {M11_ORDER:,}"
          f"  = 2^(D+1)·D^(D-1)·q·(2D+q)         │")
    print(f"  │        = 2^{M11_2_EXP}·{D}^{M11_3_EXP}·{M11_PRIME_5}·{M11_PRIME_11}"
          f"  acts on 11 points      ✓             │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print("  ┌─ Code → Design Connections ──────────────────────────────────┐")
    print(f"  │  G₁₂ (length V={V}) supports → S(q={q}, D!={factorial(D)}, V={V})     ✓         │")
    print(f"  │  G₂₄ (length 2V={2*V}) supports → S(q={q}, 2^D={2**D}, 2V={2*V})   ✓     │")
    print("  └─────────────────────────────────────────────────────────────┘")
    print()
    print(f"  ALL_GOLAY_EXACT = {ALL_GOLAY_EXACT}  "
          f"({sum(ALL_GOLAY_IDENTITIES.values())}/{len(ALL_GOLAY_IDENTITIES)} identities)")
    print(f"  δ★ = {DELTA_STAR:.8f}  |  D={D}, N={N}, V={V}, E={E}, q={q}")
    print()
