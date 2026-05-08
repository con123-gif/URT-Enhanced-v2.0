"""
Lie Representation Cathedral  (v2.9.6)
=======================================
Fundamental representation dimensions of exceptional Lie algebras —
ALL Cathedral integers.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key discoveries:
  G₂  reps: 7=D!+1, 14=N+1, 27=D^D, 64=(D+1)^D, 182=2×(D!+1)×N,
             189=D^D×(D!+1), 273=D×(D!+1)×N, 729=D^(D!), 1728=V^3
  F₄  reps: 26=2N (= bosonic string!), 52=N×(D+1), 273=D×(D!+1)×N,
             324=(D+1)×81, 1053=81×N, 4096=2^V, 8424=2^D×81×N
  E₆  reps: 27=D^D, 78=V(V+1)/2, 351=D^D×N, 2925=q²×D²×N
  E₇  reps: 56=2^D×(D!+1), 133=2G+N, 912=2^(D+1)×(G−D)
  E₈  reps: 248=2^D×(2^q−1)

Cross-module miracles:
  F₄ has a 26-dimensional rep = bosonic string critical dimension = 2N!
  G₂ has a 64-dimensional rep = (D+1)^D = the CC exponent!
  G₂ has a 1728-dimensional rep = V^3 = j-invariant j(i) (Moonshine)!
  E₇ has a 912-dim rep = 2^(D+1) × 57, and 57 = G−D is the n_s denominator!
"""

from math import factorial
from .shell_closure import N, D, V, E, F, q, G

# ── Cathedral aliases ─────────────────────────────────────────────────────────
GAMMA_INV = 81          # = 1/γ = 81

# ── G₂ representations ───────────────────────────────────────────────────────

G2_REPS = [7, 14, 27, 64, 77, 182, 189, 273, 286, 729, 1728]

# 7 = D! + 1 = 3! + 1 = 6 + 1  [first fundamental of G₂]
IDENTITY_G2_7: bool = (7 == factorial(D) + 1)

# 14 = N + 1 = 13 + 1  [second fundamental = adjoint of G₂]
IDENTITY_G2_14: bool = (14 == N + 1)

# 27 = D^D = 3^3  [EXACT]
IDENTITY_G2_27: bool = (27 == D**D)

# 64 = (D+1)^D = 4^3  [THE CC EXPONENT appears as a G₂ rep!]
IDENTITY_G2_64: bool = (64 == (D + 1)**D)

# 77 = (D!+1) × (2D+q) = 7 × 11  [EXACT]
IDENTITY_G2_77: bool = (77 == (factorial(D) + 1) * (2 * D + q))

# 182 = 2 × (D!+1) × N = 2 × 7 × 13  [EXACT]
IDENTITY_G2_182: bool = (182 == 2 * (factorial(D) + 1) * N)

# 189 = D^D × (D!+1) = 27 × 7  [EXACT]
IDENTITY_G2_189: bool = (189 == D**D * (factorial(D) + 1))

# 273 = D × (D!+1) × N = 3 × 7 × 13  [EXACT]
IDENTITY_G2_273: bool = (273 == D * (factorial(D) + 1) * N)

# 729 = D^(D!) = 3^6  [EXACT: D raised to D-factorial]
IDENTITY_G2_729: bool = (729 == D**factorial(D))

# 1728 = V^3 = 12^3  [j-invariant j(i) = G₂ has a rep of this dim!]
IDENTITY_G2_1728: bool = (1728 == V**3)

# Numerical values for use in tests
G2_DIM_7    = factorial(D) + 1               # = 7
G2_DIM_14   = N + 1                          # = 14
G2_DIM_27   = D**D                           # = 27
G2_DIM_64   = (D + 1)**D                     # = 64
G2_DIM_77   = (factorial(D) + 1) * (2*D + q) # = 77
G2_DIM_182  = 2 * (factorial(D) + 1) * N     # = 182
G2_DIM_189  = D**D * (factorial(D) + 1)      # = 189
G2_DIM_273  = D * (factorial(D) + 1) * N     # = 273
G2_DIM_729  = D**factorial(D)                 # = 729
G2_DIM_1728 = V**3                            # = 1728

assert IDENTITY_G2_7,    "G₂: 7 ≠ D!+1"
assert IDENTITY_G2_14,   "G₂: 14 ≠ N+1"
assert IDENTITY_G2_27,   "G₂: 27 ≠ D^D"
assert IDENTITY_G2_64,   "G₂: 64 ≠ (D+1)^D"
assert IDENTITY_G2_77,   "G₂: 77 ≠ (D!+1)(2D+q)"
assert IDENTITY_G2_182,  "G₂: 182 ≠ 2(D!+1)N"
assert IDENTITY_G2_189,  "G₂: 189 ≠ D^D(D!+1)"
assert IDENTITY_G2_273,  "G₂: 273 ≠ D(D!+1)N"
assert IDENTITY_G2_729,  "G₂: 729 ≠ D^(D!)"
assert IDENTITY_G2_1728, "G₂: 1728 ≠ V^3"

# ── F₄ representations ───────────────────────────────────────────────────────

F4_REPS_KEY = [26, 52, 273, 324, 1053, 4096, 8424]

# 26 = 2N  [SAME as bosonic string critical dimension!]
IDENTITY_F4_26: bool = (26 == 2 * N)

# 52 = N × (D+1) = 13 × 4  [adjoint of F₄]
IDENTITY_F4_52: bool = (52 == N * (D + 1))

# 273 = D × (D!+1) × N = 3 × 7 × 13  [shared with G₂!]
IDENTITY_F4_273: bool = (273 == D * (factorial(D) + 1) * N)

# 324 = (D+1) × 81 = (D+1) × GAMMA_INV  [EXACT]
IDENTITY_F4_324: bool = (324 == (D + 1) * GAMMA_INV)

# 1053 = 81 × N = GAMMA_INV × N  [EXACT]
IDENTITY_F4_1053: bool = (1053 == GAMMA_INV * N)

# 4096 = 2^V = 2^12  [EXACT: 2 to the power V!]
IDENTITY_F4_4096: bool = (4096 == 2**V)

# 8424 = 2^D × 81 × N = 8 × 81 × 13  [EXACT]
IDENTITY_F4_8424: bool = (8424 == 2**D * GAMMA_INV * N)

F4_DIM_26   = 2 * N                  # = 26
F4_DIM_52   = N * (D + 1)            # = 52
F4_DIM_273  = D * (factorial(D)+1)*N # = 273
F4_DIM_324  = (D + 1) * GAMMA_INV    # = 324
F4_DIM_1053 = GAMMA_INV * N          # = 1053
F4_DIM_4096 = 2**V                   # = 4096
F4_DIM_8424 = 2**D * GAMMA_INV * N   # = 8424

assert IDENTITY_F4_26,   "F₄: 26 ≠ 2N"
assert IDENTITY_F4_52,   "F₄: 52 ≠ N(D+1)"
assert IDENTITY_F4_273,  "F₄: 273 ≠ D(D!+1)N"
assert IDENTITY_F4_324,  "F₄: 324 ≠ (D+1)×81"
assert IDENTITY_F4_1053, "F₄: 1053 ≠ 81×N"
assert IDENTITY_F4_4096, "F₄: 4096 ≠ 2^V"
assert IDENTITY_F4_8424, "F₄: 8424 ≠ 2^D×81×N"

# ── E₆ representations ───────────────────────────────────────────────────────

E6_REPS_KEY = [27, 78, 351, 2925]

# 27 = D^D = 3^3  [fundamental of E₆; the Albert algebra dimension!]
IDENTITY_E6_27: bool = (27 == D**D)

# 78 = V(V+1)/2 = 12×13/2 = 78  [adjoint of E₆]
IDENTITY_E6_78: bool = (78 == V * (V + 1) // 2)

# 351 = D^D × N = 27 × 13  [EXACT]
IDENTITY_E6_351: bool = (351 == D**D * N)

# 2925 = q^2 × D^2 × N = 25 × 9 × 13  [EXACT: 225 × 13 = 2925]
IDENTITY_E6_2925: bool = (2925 == q**2 * D**2 * N)

E6_DIM_27   = D**D            # = 27
E6_DIM_78   = V * (V+1) // 2  # = 78
E6_DIM_351  = D**D * N        # = 351
E6_DIM_2925 = q**2 * D**2 * N # = 2925

assert IDENTITY_E6_27,   "E₆: 27 ≠ D^D"
assert IDENTITY_E6_78,   "E₆: 78 ≠ V(V+1)/2"
assert IDENTITY_E6_351,  "E₆: 351 ≠ D^D×N"
assert IDENTITY_E6_2925, "E₆: 2925 ≠ q²D²N"

# ── E₇ representations ───────────────────────────────────────────────────────

E7_REPS_KEY = [56, 133, 912]

# 56 = 2^D × (D!+1) = 8 × 7  [first fundamental of E₇]
IDENTITY_E7_56: bool = (56 == 2**D * (factorial(D) + 1))

# 133 = 2G + N = 120 + 13  [adjoint of E₇]
IDENTITY_E7_133: bool = (133 == 2 * G + N)

# 912 = 2^(D+1) × (G−D) = 16 × 57  [G−D=57 is also the n_s denominator!]
IDENTITY_E7_912: bool = (912 == 2**(D + 1) * (G - D))

E7_DIM_56  = 2**D * (factorial(D) + 1)  # = 56
E7_DIM_133 = 2 * G + N                  # = 133
E7_DIM_912 = 2**(D + 1) * (G - D)       # = 912

assert IDENTITY_E7_56,  "E₇: 56 ≠ 2^D(D!+1)"
assert IDENTITY_E7_133, "E₇: 133 ≠ 2G+N"
assert IDENTITY_E7_912, "E₇: 912 ≠ 2^(D+1)(G-D)"

# ── E₈ representation ────────────────────────────────────────────────────────

E8_REPS_KEY = [248]

# 248 = 2^D × (2^q − 1) = 8 × 31  [self-adjoint: only fundamental = adjoint]
IDENTITY_E8_248: bool = (248 == 2**D * (2**q - 1))

E8_DIM_248 = 2**D * (2**q - 1)   # = 248

assert IDENTITY_E8_248, "E₈: 248 ≠ 2^D(2^q−1)"

# ── Cross-module miracles ─────────────────────────────────────────────────────

# F₄ rep 26 = bosonic string critical dimension = 2N
IDENTITY_F4_26_EQ_BOSONIC_STRING: bool = (26 == 2 * N)

# G₂ rep 64 = (D+1)^D = CC exponent
IDENTITY_G2_64_EQ_CC_EXP: bool = (64 == (D + 1)**D)

# G₂ rep 1728 = V^3 = j(i) (j-invariant at i)
IDENTITY_G2_1728_EQ_J_INVARIANT: bool = (1728 == V**3)

# E₇ rep 912 = 16×57; G−D = 57 is the n_s spectral-tilt denominator
IDENTITY_E7_912_NS_DENOMINATOR: bool = ((G - D) == 57)

# Shared rep 273 in both G₂ and F₄
IDENTITY_G2_F4_SHARED_273: bool = (G2_DIM_273 == F4_DIM_273 == 273)

# E₆ adjoint 78 = triangular number T_V
IDENTITY_E6_78_TRIANGULAR_V: bool = (78 == V * (V + 1) // 2)

assert IDENTITY_F4_26_EQ_BOSONIC_STRING, "F₄-26 ≠ 2N"
assert IDENTITY_G2_64_EQ_CC_EXP,        "G₂-64 ≠ (D+1)^D"
assert IDENTITY_G2_1728_EQ_J_INVARIANT, "G₂-1728 ≠ V^3"
assert IDENTITY_E7_912_NS_DENOMINATOR,  "G−D ≠ 57"
assert IDENTITY_G2_F4_SHARED_273,       "G₂ and F₄ shared-273 mismatch"
assert IDENTITY_E6_78_TRIANGULAR_V,     "E₆-78 ≠ T_V"

# ── Summary helpers ───────────────────────────────────────────────────────────

def lie_reps_summary() -> dict:
    """Return a summary dict of all exceptional Lie rep Cathedral identities."""
    return {
        # G₂
        "G2_reps": G2_REPS,
        "G2_7_eq_Dfact_plus1": IDENTITY_G2_7,
        "G2_14_eq_N_plus1": IDENTITY_G2_14,
        "G2_27_eq_D3": IDENTITY_G2_27,
        "G2_64_eq_D1_D": IDENTITY_G2_64,
        "G2_77_identity": IDENTITY_G2_77,
        "G2_182_identity": IDENTITY_G2_182,
        "G2_189_identity": IDENTITY_G2_189,
        "G2_273_identity": IDENTITY_G2_273,
        "G2_729_identity": IDENTITY_G2_729,
        "G2_1728_eq_V3": IDENTITY_G2_1728,
        # F₄
        "F4_reps_key": F4_REPS_KEY,
        "F4_26_eq_2N": IDENTITY_F4_26,
        "F4_52_eq_ND1": IDENTITY_F4_52,
        "F4_273_identity": IDENTITY_F4_273,
        "F4_324_eq_D1x81": IDENTITY_F4_324,
        "F4_1053_eq_81N": IDENTITY_F4_1053,
        "F4_4096_eq_2V": IDENTITY_F4_4096,
        "F4_8424_eq_2D_81_N": IDENTITY_F4_8424,
        # E₆
        "E6_reps_key": E6_REPS_KEY,
        "E6_27_eq_D3": IDENTITY_E6_27,
        "E6_78_eq_TV": IDENTITY_E6_78,
        "E6_351_eq_D3N": IDENTITY_E6_351,
        "E6_2925_eq_q2D2N": IDENTITY_E6_2925,
        # E₇
        "E7_reps_key": E7_REPS_KEY,
        "E7_56_eq_2D_Dfact1": IDENTITY_E7_56,
        "E7_133_eq_2G_N": IDENTITY_E7_133,
        "E7_912_eq_2D1_GmD": IDENTITY_E7_912,
        # E₈
        "E8_reps_key": E8_REPS_KEY,
        "E8_248_eq_2D_2q_1": IDENTITY_E8_248,
        # Cross-module
        "F4_26_eq_bosonic_string": IDENTITY_F4_26_EQ_BOSONIC_STRING,
        "G2_64_eq_CC_exp": IDENTITY_G2_64_EQ_CC_EXP,
        "G2_1728_eq_j_invariant": IDENTITY_G2_1728_EQ_J_INVARIANT,
        "E7_912_ns_denominator": IDENTITY_E7_912_NS_DENOMINATOR,
        "G2_F4_shared_273": IDENTITY_G2_F4_SHARED_273,
        "E6_78_triangular_V": IDENTITY_E6_78_TRIANGULAR_V,
        # Numerical
        "D": D, "N": N, "V": V, "q": q, "G": G,
        "D_factorial": factorial(D),
        "GAMMA_INV": GAMMA_INV,
    }


def print_lie_reps_report() -> None:
    """Print a human-readable Lie representation Cathedral report."""
    s = lie_reps_summary()
    print("=" * 65)
    print("LIE REPRESENTATION CATHEDRAL  (Exceptional Algebras)")
    print("=" * 65)
    print(f"Cathedral integers: D={D}, N={N}, V={V}, q={q}, G={G}")
    print(f"D! = {factorial(D)},  γ_inv = {GAMMA_INV},  2N = {2*N}")
    print()
    print("── G₂ representations ──")
    for r in G2_REPS:
        print(f"  {r}")
    print(f"  7 = D!+1 ({D}!+1):               {IDENTITY_G2_7}")
    print(f"  14 = N+1:                         {IDENTITY_G2_14}")
    print(f"  27 = D^D:                         {IDENTITY_G2_27}")
    print(f"  64 = (D+1)^D  [CC exponent]:      {IDENTITY_G2_64}")
    print(f"  1728 = V^3  [j-invariant]:         {IDENTITY_G2_1728}")
    print()
    print("── F₄ representations (key) ──")
    for r in F4_REPS_KEY:
        print(f"  {r}")
    print(f"  26 = 2N  [bosonic string!]:        {IDENTITY_F4_26}")
    print(f"  4096 = 2^V:                        {IDENTITY_F4_4096}")
    print()
    print("── E₆ representations (key) ──")
    for r in E6_REPS_KEY:
        print(f"  {r}")
    print(f"  78 = V(V+1)/2  [triangular T_V]:  {IDENTITY_E6_78}")
    print()
    print("── E₇ representations ──")
    for r in E7_REPS_KEY:
        print(f"  {r}")
    print(f"  912 = 16×57; G-D=57 (n_s denom): {IDENTITY_E7_912_NS_DENOMINATOR}")
    print()
    print("── E₈ representation ──")
    print(f"  248 = 2^D(2^q-1):                 {IDENTITY_E8_248}")
    print()
    print("── Cross-module miracles ──")
    print(f"  F₄(26) = 2N = bosonic string:      {IDENTITY_F4_26_EQ_BOSONIC_STRING}")
    print(f"  G₂(64) = (D+1)^D = CC exponent:   {IDENTITY_G2_64_EQ_CC_EXP}")
    print(f"  G₂(1728) = V^3 = j(i):            {IDENTITY_G2_1728_EQ_J_INVARIANT}")
    print(f"  G₂ & F₄ share dim-273:             {IDENTITY_G2_F4_SHARED_273}")
    print("=" * 65)


if __name__ == "__main__":
    print_lie_reps_report()
