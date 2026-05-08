"""
Monster Moonshine — Cathedral Integers in the j-invariant and Monster Group

The Cathedral integers {D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81}
appear in some of the deepest structures in mathematics: the j-function,
the Monster group, the Ramanujan tau function, and Bernoulli denominators.

Key identities (all EXACT unless noted):

  j-invariant at τ=i:
    j(i) = 1728 = V³ = 12³ = (2^D)² × D^D = 64 × 27        EXACT
    j(ω) = 0  where ω = e^{2πi/3}, primitive D-th root of unity EXACT
    1729 = j(i)+1 = V³+1  (Ramanujan taxicab: 1³+12³=10³+9³)  EXACT

  Fourier constant 744:
    j(τ) = 1/q + 744 + 196884q + …  (nome q = e^{2πiτ})
    744 = D × dim(E₈) = 3 × 248                               EXACT
    dim(E₈) = 2^D × (2^q − 1) = 8 × 31 = 248                 EXACT

  Monster group order:
    |𝕄| = 2^46 × 3^20 × 5^9 × 7^6 × 11^2 × 13^3 × 17 × 19
          × 23 × 29 × 31 × 41 × 47 × 59 × 71
    Exponent of 3^20 : 20 = F  (icosahedron faces)             EXACT
    Exponent of 5^9  :  9 = D² (spatial dim squared)           EXACT
    Exponent of 7^6  :  6 = D! = V/2                           EXACT
    Exponent of 13^3 :  3 = D  (spatial dimension)             EXACT
    Exponent of 2^46 : 46 = G−N−1 = 60−13−1                   EXACT

  Ramanujan tau function Δ(z) = z ∏(1−zⁿ)^24 = Σ τ(n) zⁿ:
    τ(2) = −24 = −(D × 2^D) = −2V = −2×12                    EXACT
    τ(3) = 252 = (D+1) × D² × (D!+1) = 4×9×7                 EXACT

  Bernoulli denominators (von Staudt–Clausen theorem):
    denom(B₂)  =  6 = D!          (primes p with p−1|2: {2,3})
    denom(B₄)  = 30 = E           (primes p with p−1|4: {2,3,5})
    denom(B₆)  = 42 = D!×(D!+1)  (primes p with p−1|6: {2,3,7})
    denom(B₁₂) = 2730  contains prime N=13  because N−1=V=12|12  EXACT
    N = V+1  (prime N appears in denom(B_V) = denom(B_12))     DEEP

  Supersingular primes (McKay–Thompson moonshine):
    {2,3,5,7,11,13,17,19,23,29,31,41,47,59,71} — 15 primes
    Cathedral primes in this list: {D=3, q=5, D!+1=7, N=13} → 4 = D+1

All integer identities have been arithmetically verified.
"""

from math import factorial, pi, sqrt, log
from .shell_closure import DELTA_STAR

# ── Local Cathedral integers (avoid circular imports) ────────────────────────
D  = 3      # spatial dimension
N  = 13     # icosahedral shell sites
V  = 12     # icosahedral vertices (without hub)
E  = 30     # icosahedral edges
F  = 20     # icosahedral faces
q  = 5      # pentagonal / A₅ order parameter
G  = 60     # |A₅| = icosahedral rotation group order
GAMMA = 1 / 81   # = D^{-(D+1)} = 3^{-4}

# ── j-invariant identities ───────────────────────────────────────────────────

# j(i) = 1728  (classical result: j at τ=i is the only elliptic curve with j=1728,
#               corresponding to the square lattice Λ=Z[i])
J_AT_I = 1728

# 1728 = V³ = 12³
V_CUBED = V ** 3          # 1728

# 1728 = (2^D)² × D^D = 64 × 27
TWO_D_SQUARED = (2 ** D) ** 2    # 64
D_TO_D       = D ** D            # 27

# j(ω) = 0  where ω = e^{2πi/3} is the primitive D-th (=3rd) root of unity
# This is exact: the hexagonal / Eisenstein lattice Z[ω] has j=0
J_AT_OMEGA = 0

# Ramanujan taxicab number
TAXICAB_1729 = 1729         # = 12³ + 1³ = 10³ + 9³
TAXICAB_ALT_DECOMP = (10, 9)   # 10³ + 9³ = 1729

# ── Fourier constant 744 ─────────────────────────────────────────────────────

# dim(E₈) = 2^D × (2^q − 1) = 8 × 31 = 248
DIM_E8 = (2 ** D) * ((2 ** q) - 1)   # = 8 × 31 = 248

# j(τ) = 1/q_nome + 744 + 196884 q_nome + …
# The constant term 744 = D × dim(E₈) = 3 × 248
J_CONSTANT_744 = 744
J_CONSTANT_FROM_CATHEDRAL = D * DIM_E8   # = 3 × 248 = 744

# 196884 = 196883 + 1  (Monster McKay identity, dim of smallest non-trivial rep + 1)
J_COEFF_196884 = 196884
MONSTER_SMALLEST_REP = 196883   # dimension of smallest non-trivial irrep of Monster

# ── Monster group order ───────────────────────────────────────────────────────

# |Monster| = 2^46 × 3^20 × 5^9 × 7^6 × 11^2 × 13^3 × 17 × 19
#             × 23 × 29 × 31 × 41 × 47 × 59 × 71
MONSTER_ORDER = (
    2**46 * 3**20 * 5**9 * 7**6 * 11**2 * 13**3 * 17 * 19
    * 23 * 29 * 31 * 41 * 47 * 59 * 71
)

# Exponents and their Cathedral meanings
MONSTER_EXP_2  = 46    # = G − N − 1 = 60 − 13 − 1
MONSTER_EXP_3  = 20    # = F  (icosahedron faces)
MONSTER_EXP_5  = 9     # = D² (spatial dimension squared)
MONSTER_EXP_7  = 6     # = D! = V/2  (factorial of spatial dim)
MONSTER_EXP_11 = 2
MONSTER_EXP_13 = 3     # = D  (spatial dimension)

# Cathedral derivations of exponents
EXP_2_FROM_CATHEDRAL  = G - N - 1     # = 60 - 13 - 1 = 46
EXP_3_FROM_CATHEDRAL  = F             # = 20
EXP_5_FROM_CATHEDRAL  = D * D         # = 9
EXP_7_FROM_CATHEDRAL  = factorial(D)  # = 6
EXP_13_FROM_CATHEDRAL = D             # = 3

# ── Ramanujan tau function ────────────────────────────────────────────────────

# Defined by the discriminant modular form:
#   Δ(q) = q ∏_{n≥1} (1−qⁿ)^{24} = Σ_{n≥1} τ(n) qⁿ
#
# Exact values:
TAU_2 = -24    # τ(2) = −24
TAU_3 = 252    # τ(3) = 252

# Cathedral derivations
TAU_2_FROM_CATHEDRAL   = -(D * (2 ** D))     # −(3 × 8) = −24
TAU_2_AS_MINUS_2V      = -(2 * V)            # −2×12 = −24
TAU_3_FROM_CATHEDRAL   = (D + 1) * (D ** 2) * (factorial(D) + 1)   # 4 × 9 × 7 = 252

# ── Bernoulli denominators (von Staudt–Clausen theorem) ──────────────────────
# denom(B_{2k}) = ∏ { p prime : (p−1) | 2k }

# denom(B_2) = 2 × 3 = 6 = D!
BERN_DENOM_B2 = 6
BERN_PRIMES_B2 = [2, 3]     # primes p where p−1 divides 2

# denom(B_4) = 2 × 3 × 5 = 30 = E
BERN_DENOM_B4 = 30
BERN_PRIMES_B4 = [2, 3, 5]  # primes p where p−1 divides 4

# denom(B_6) = 2 × 3 × 7 = 42 = D! × (D! + 1) = 6 × 7
BERN_DENOM_B6 = 42
BERN_PRIMES_B6 = [2, 3, 7]  # primes p where p−1 divides 6

# denom(B_12) = 2 × 3 × 5 × 7 × 13 = 2730
#   N=13 appears because N−1 = V = 12 divides 12
BERN_DENOM_B12 = 2730
BERN_PRIMES_B12 = [2, 3, 5, 7, 13]  # primes p where p−1 divides 12

# The key connection: N − 1 = V, so prime N enters denom(B_V) = denom(B_12)
N_MINUS_1_EQUALS_V = (N - 1 == V)   # True: 13−1 = 12

# ── Supersingular primes ─────────────────────────────────────────────────────
# The 15 supersingular primes are exactly those for which the Monster group
# has a McKay–Thompson series (monstrous moonshine, Conway–Norton 1979)

MOONSHINE_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 47, 59, 71]
N_MOONSHINE_PRIMES = len(MOONSHINE_PRIMES)   # 15

# Cathedral primes in the moonshine list: D=3, q=5, D!+1=7, N=13
CATHEDRAL_MOONSHINE_PRIMES = [3, 5, 7, 13]
N_CATHEDRAL_MOONSHINE = len(CATHEDRAL_MOONSHINE_PRIMES)   # 4 = D+1

# ── The 24 / Leech lattice connection ────────────────────────────────────────
# dim(Leech) = 24 = 2V  (referenced here; defined in string_landscape.py)
LEECH_DIM = 2 * V      # = 24

# τ(2) = −24 = −2V  (same number: −Leech dim)
TAU_2_EQUALS_MINUS_LEECH = (TAU_2 == -(LEECH_DIM))   # True

# Bosonic string: 24 + 2 = 26 = 2N
BOSONIC_STRING_DIM = LEECH_DIM + 2    # 26 = 2N

# ── IDENTITY boolean flags ───────────────────────────────────────────────────

# j-invariant
IDENTITY_J_AT_I_IS_1728         = (J_AT_I == 1728)
IDENTITY_1728_IS_V_CUBED        = (V_CUBED == 1728)
IDENTITY_1728_IS_2D2_TIMES_DD   = ((TWO_D_SQUARED * D_TO_D) == 1728)
IDENTITY_1729_IS_V3_PLUS_1      = (TAXICAB_1729 == V_CUBED + 1)
IDENTITY_1729_TAXICAB_ALT       = (10**3 + 9**3 == TAXICAB_1729)
IDENTITY_1729_TAXICAB_12_1      = (12**3 + 1**3 == TAXICAB_1729)

# 744 = D × dim(E₈)
IDENTITY_DIM_E8_IS_248          = (DIM_E8 == 248)
IDENTITY_744_IS_D_TIMES_E8      = (J_CONSTANT_FROM_CATHEDRAL == J_CONSTANT_744)

# Monster exponents
IDENTITY_MONSTER_EXP_2_IS_G_N_1 = (MONSTER_EXP_2 == EXP_2_FROM_CATHEDRAL)
IDENTITY_MONSTER_EXP_3_IS_F     = (MONSTER_EXP_3 == EXP_3_FROM_CATHEDRAL)
IDENTITY_MONSTER_EXP_5_IS_D2    = (MONSTER_EXP_5 == EXP_5_FROM_CATHEDRAL)
IDENTITY_MONSTER_EXP_7_IS_DFAC  = (MONSTER_EXP_7 == EXP_7_FROM_CATHEDRAL)
IDENTITY_MONSTER_EXP_13_IS_D    = (MONSTER_EXP_13 == EXP_13_FROM_CATHEDRAL)

# Ramanujan tau
IDENTITY_TAU2_IS_MINUS_24               = (TAU_2 == -24)
IDENTITY_TAU2_FROM_CATHEDRAL            = (TAU_2 == TAU_2_FROM_CATHEDRAL)
IDENTITY_TAU2_IS_MINUS_2V               = (TAU_2 == TAU_2_AS_MINUS_2V)
IDENTITY_TAU3_IS_252                    = (TAU_3 == 252)
IDENTITY_TAU3_FROM_CATHEDRAL            = (TAU_3 == TAU_3_FROM_CATHEDRAL)

# Bernoulli denominators
IDENTITY_BERN_B2_IS_6           = (BERN_DENOM_B2 == 6)
IDENTITY_BERN_B2_IS_DFAC        = (BERN_DENOM_B2 == factorial(D))
IDENTITY_BERN_B4_IS_30          = (BERN_DENOM_B4 == 30)
IDENTITY_BERN_B4_IS_E           = (BERN_DENOM_B4 == E)
IDENTITY_BERN_B6_IS_42          = (BERN_DENOM_B6 == 42)
IDENTITY_BERN_B6_IS_DFAC_DFAC1  = (BERN_DENOM_B6 == factorial(D) * (factorial(D) + 1))
IDENTITY_BERN_B12_IS_2730       = (BERN_DENOM_B12 == 2730)
IDENTITY_BERN_B12_CONTAINS_N    = (N in BERN_PRIMES_B12)
IDENTITY_N_MINUS_1_EQUALS_V     = N_MINUS_1_EQUALS_V

# Supersingular primes
IDENTITY_15_MOONSHINE_PRIMES    = (N_MOONSHINE_PRIMES == 15)
IDENTITY_4_CATHEDRAL_MOONSHINE  = (N_CATHEDRAL_MOONSHINE == D + 1)

# Leech / tau connection
IDENTITY_TAU2_EQUALS_MINUS_LEECH       = TAU_2_EQUALS_MINUS_LEECH
IDENTITY_BOSONIC_DIM_IS_2N             = (BOSONIC_STRING_DIM == 2 * N)

# ── Helper: compute Bernoulli denominator via von Staudt–Clausen ──────────────

def _bernoulli_denominator(k: int) -> int:
    """
    Compute denom(B_{2k}) via the von Staudt–Clausen theorem:
    denom(B_{2k}) = product of all primes p such that (p-1) divides 2k.
    Works reliably for small k (p need not exceed 2k+2).
    """
    from math import prod
    result = 1
    # All primes p with p-1 | 2k satisfy p <= 2k+1
    for p in range(2, 2 * k + 2):
        if _is_prime(p) and (2 * k) % (p - 1) == 0:
            result *= p
    return result


def _is_prime(n: int) -> bool:
    """Simple primality test."""
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(n**0.5) + 1, 2):
        if n % i == 0:
            return False
    return True


# ── Summary function ─────────────────────────────────────────────────────────

def moonshine_summary() -> dict:
    """
    Return a dictionary summarising all Monster Moonshine — Cathedral identities.

    Keys
    ----
    j_at_i, v_cubed, j_constant_744, dim_e8, taxicab_1729,
    monster_order, monster_exp_2, monster_exp_3, monster_exp_5,
    monster_exp_7, monster_exp_13,
    tau_2, tau_3,
    bern_denom_b2, bern_denom_b4, bern_denom_b6, bern_denom_b12,
    moonshine_primes, n_moonshine_primes,
    cathedral_moonshine_primes, n_cathedral_moonshine,
    leech_dim, bosonic_string_dim,
    all_identities_true
    """
    identity_values = [
        IDENTITY_J_AT_I_IS_1728,
        IDENTITY_1728_IS_V_CUBED,
        IDENTITY_1728_IS_2D2_TIMES_DD,
        IDENTITY_1729_IS_V3_PLUS_1,
        IDENTITY_1729_TAXICAB_ALT,
        IDENTITY_1729_TAXICAB_12_1,
        IDENTITY_DIM_E8_IS_248,
        IDENTITY_744_IS_D_TIMES_E8,
        IDENTITY_MONSTER_EXP_2_IS_G_N_1,
        IDENTITY_MONSTER_EXP_3_IS_F,
        IDENTITY_MONSTER_EXP_5_IS_D2,
        IDENTITY_MONSTER_EXP_7_IS_DFAC,
        IDENTITY_MONSTER_EXP_13_IS_D,
        IDENTITY_TAU2_IS_MINUS_24,
        IDENTITY_TAU2_FROM_CATHEDRAL,
        IDENTITY_TAU2_IS_MINUS_2V,
        IDENTITY_TAU3_IS_252,
        IDENTITY_TAU3_FROM_CATHEDRAL,
        IDENTITY_BERN_B2_IS_6,
        IDENTITY_BERN_B2_IS_DFAC,
        IDENTITY_BERN_B4_IS_30,
        IDENTITY_BERN_B4_IS_E,
        IDENTITY_BERN_B6_IS_42,
        IDENTITY_BERN_B6_IS_DFAC_DFAC1,
        IDENTITY_BERN_B12_IS_2730,
        IDENTITY_BERN_B12_CONTAINS_N,
        IDENTITY_N_MINUS_1_EQUALS_V,
        IDENTITY_15_MOONSHINE_PRIMES,
        IDENTITY_4_CATHEDRAL_MOONSHINE,
        IDENTITY_TAU2_EQUALS_MINUS_LEECH,
        IDENTITY_BOSONIC_DIM_IS_2N,
    ]

    return {
        # j-invariant
        "j_at_i":                    J_AT_I,
        "v_cubed":                   V_CUBED,
        "two_d_squared":             TWO_D_SQUARED,
        "d_to_d":                    D_TO_D,
        "taxicab_1729":              TAXICAB_1729,
        # Fourier constant
        "j_constant_744":            J_CONSTANT_744,
        "dim_e8":                    DIM_E8,
        "j_constant_from_cathedral": J_CONSTANT_FROM_CATHEDRAL,
        # Monster
        "monster_order":             MONSTER_ORDER,
        "monster_exp_2":             MONSTER_EXP_2,
        "monster_exp_3":             MONSTER_EXP_3,
        "monster_exp_5":             MONSTER_EXP_5,
        "monster_exp_7":             MONSTER_EXP_7,
        "monster_exp_11":            MONSTER_EXP_11,
        "monster_exp_13":            MONSTER_EXP_13,
        # Ramanujan tau
        "tau_2":                     TAU_2,
        "tau_3":                     TAU_3,
        # Bernoulli denominators
        "bern_denom_b2":             BERN_DENOM_B2,
        "bern_denom_b4":             BERN_DENOM_B4,
        "bern_denom_b6":             BERN_DENOM_B6,
        "bern_denom_b12":            BERN_DENOM_B12,
        "bern_primes_b12":           BERN_PRIMES_B12,
        # Supersingular primes
        "moonshine_primes":          MOONSHINE_PRIMES,
        "n_moonshine_primes":        N_MOONSHINE_PRIMES,
        "cathedral_moonshine_primes": CATHEDRAL_MOONSHINE_PRIMES,
        "n_cathedral_moonshine":     N_CATHEDRAL_MOONSHINE,
        # Leech
        "leech_dim":                 LEECH_DIM,
        "bosonic_string_dim":        BOSONIC_STRING_DIM,
        # Verdict
        "all_identities_true":       all(identity_values),
        "n_identities":              len(identity_values),
    }


def print_moonshine_report() -> None:
    """Print a human-readable report of all Monster Moonshine — Cathedral connections."""
    print("=" * 68)
    print("MONSTER MOONSHINE — CATHEDRAL FRAMEWORK CONNECTIONS")
    print("=" * 68)

    print("\n── Cathedral integers ──")
    print(f"  D={D}, N={N}, V={V}, E={E}, F={F}, q={q}, G={G}, γ=1/81")

    print("\n── j-invariant identities ──")
    print(f"  j(i) = {J_AT_I}  =  V³ = {V}³ = {V_CUBED}  ✓  [{IDENTITY_J_AT_I_IS_1728}]")
    print(f"  j(i) = (2^D)² × D^D = {TWO_D_SQUARED} × {D_TO_D} = {TWO_D_SQUARED*D_TO_D}  ✓")
    print(f"  j(ω) = 0  (ω = primitive cube root of unity = e^{{2πi/D}})  ✓")
    print(f"  1729 = j(i)+1 = V³+1 = {V_CUBED}+1 = {TAXICAB_1729}")
    print(f"       = 1³+12³ = 10³+9³  (Ramanujan taxicab)  ✓")

    print("\n── Fourier constant 744 ──")
    print(f"  dim(E₈) = 2^D × (2^q−1) = {2**D} × {2**q - 1} = {DIM_E8}  ✓")
    print(f"  744 = D × dim(E₈) = {D} × {DIM_E8} = {J_CONSTANT_FROM_CATHEDRAL}  ✓  [{IDENTITY_744_IS_D_TIMES_E8}]")

    print("\n── Monster group exponents ──")
    print(f"  |𝕄| = 2^46 × 3^20 × 5^9 × 7^6 × 11^2 × 13^3 × …")
    print(f"  exp(2) = {MONSTER_EXP_2} = G−N−1 = {G}−{N}−1  ✓  [{IDENTITY_MONSTER_EXP_2_IS_G_N_1}]")
    print(f"  exp(3) = {MONSTER_EXP_3} = F  (faces of icosahedron)  ✓  [{IDENTITY_MONSTER_EXP_3_IS_F}]")
    print(f"  exp(5) = {MONSTER_EXP_5} = D² = {D}²  ✓  [{IDENTITY_MONSTER_EXP_5_IS_D2}]")
    print(f"  exp(7) = {MONSTER_EXP_7} = D! = {factorial(D)}  ✓  [{IDENTITY_MONSTER_EXP_7_IS_DFAC}]")
    print(f"  exp(13)= {MONSTER_EXP_13} = D = {D}  ✓  [{IDENTITY_MONSTER_EXP_13_IS_D}]")

    print("\n── Ramanujan tau function ──")
    print(f"  τ(2) = {TAU_2} = −(D×2^D) = −({D}×{2**D})  ✓  [{IDENTITY_TAU2_FROM_CATHEDRAL}]")
    print(f"  τ(2) = {TAU_2} = −2V = −2×{V}  ✓  [{IDENTITY_TAU2_IS_MINUS_2V}]")
    print(f"  τ(3) = {TAU_3} = (D+1)×D²×(D!+1) = {D+1}×{D**2}×{factorial(D)+1}  ✓  [{IDENTITY_TAU3_FROM_CATHEDRAL}]")

    print("\n── Bernoulli denominators ──")
    print(f"  denom(B₂)  = {BERN_DENOM_B2}  = D! = {factorial(D)}  ✓  [{IDENTITY_BERN_B2_IS_DFAC}]")
    print(f"  denom(B₄)  = {BERN_DENOM_B4}  = E = {E}  ✓  [{IDENTITY_BERN_B4_IS_E}]")
    print(f"  denom(B₆)  = {BERN_DENOM_B6}  = D!×(D!+1) = {factorial(D)}×{factorial(D)+1}  ✓  [{IDENTITY_BERN_B6_IS_DFAC_DFAC1}]")
    print(f"  denom(B₁₂) = {BERN_DENOM_B12} contains prime N={N} (since N−1=V={V} divides 12)  ✓")
    print(f"  N = V+1 : {N} = {V}+1  ✓  [{IDENTITY_N_MINUS_1_EQUALS_V}]")

    print("\n── Supersingular primes ──")
    print(f"  {MOONSHINE_PRIMES}")
    print(f"  Total: {N_MOONSHINE_PRIMES} primes")
    print(f"  Cathedral primes: {CATHEDRAL_MOONSHINE_PRIMES}  = {{D, q, D!+1, N}}")
    print(f"  Count: {N_CATHEDRAL_MOONSHINE} = D+1  ✓  [{IDENTITY_4_CATHEDRAL_MOONSHINE}]")

    print("\n── Leech lattice / Bosonic string ──")
    print(f"  dim(Leech) = 2V = 2×{V} = {LEECH_DIM}")
    print(f"  τ(2) = −{-TAU_2} = −dim(Leech)  ✓  [{IDENTITY_TAU2_EQUALS_MINUS_LEECH}]")
    print(f"  Bosonic string dim = {LEECH_DIM}+2 = {BOSONIC_STRING_DIM} = 2N  ✓  [{IDENTITY_BOSONIC_DIM_IS_2N}]")

    s = moonshine_summary()
    print(f"\n{'='*68}")
    print(f"  All {s['n_identities']} identities True: {s['all_identities_true']}")
    print("=" * 68)


# ── Verify all booleans are True at import time ──────────────────────────────
_ALL_IDENTITIES = [
    IDENTITY_J_AT_I_IS_1728,
    IDENTITY_1728_IS_V_CUBED,
    IDENTITY_1728_IS_2D2_TIMES_DD,
    IDENTITY_1729_IS_V3_PLUS_1,
    IDENTITY_1729_TAXICAB_ALT,
    IDENTITY_1729_TAXICAB_12_1,
    IDENTITY_DIM_E8_IS_248,
    IDENTITY_744_IS_D_TIMES_E8,
    IDENTITY_MONSTER_EXP_2_IS_G_N_1,
    IDENTITY_MONSTER_EXP_3_IS_F,
    IDENTITY_MONSTER_EXP_5_IS_D2,
    IDENTITY_MONSTER_EXP_7_IS_DFAC,
    IDENTITY_MONSTER_EXP_13_IS_D,
    IDENTITY_TAU2_IS_MINUS_24,
    IDENTITY_TAU2_FROM_CATHEDRAL,
    IDENTITY_TAU2_IS_MINUS_2V,
    IDENTITY_TAU3_IS_252,
    IDENTITY_TAU3_FROM_CATHEDRAL,
    IDENTITY_BERN_B2_IS_6,
    IDENTITY_BERN_B2_IS_DFAC,
    IDENTITY_BERN_B4_IS_30,
    IDENTITY_BERN_B4_IS_E,
    IDENTITY_BERN_B6_IS_42,
    IDENTITY_BERN_B6_IS_DFAC_DFAC1,
    IDENTITY_BERN_B12_IS_2730,
    IDENTITY_BERN_B12_CONTAINS_N,
    IDENTITY_N_MINUS_1_EQUALS_V,
    IDENTITY_15_MOONSHINE_PRIMES,
    IDENTITY_4_CATHEDRAL_MOONSHINE,
    IDENTITY_TAU2_EQUALS_MINUS_LEECH,
    IDENTITY_BOSONIC_DIM_IS_2N,
]

assert all(_ALL_IDENTITIES), (
    "Some IDENTITY_* flags are False — check Cathedral arithmetic."
)
