"""
Monster Group Order — Cathedral Identities

The Monster group M is the largest sporadic simple group. Its order encodes
Cathedral integers in a striking way: the prime exponents at D=3, N=13, q=5,
and neighbours match icosahedral geometry constants exactly.

Monster group order:
  |M| = 2^46 · 3^20 · 5^9 · 7^6 · 11^2 · 13^3 · 17 · 19 · 23 · 29 · 31 · 41 · 47 · 59 · 71

Key identities (all EXACT):
  exp_3(|M|)  = 20 = F   (icosahedral faces!)
  exp_5(|M|)  = 9  = D²  (spatial dimension squared!)
  exp_7(|M|)  = 6  = D!  (D factorial!)
  exp_11(|M|) = 2  = D-1
  exp_13(|M|) = 3  = D   (and 13 = N!)

PSL₂ orders (all EXACT Cathedral):
  |PSL₂(F_D)|  = D(D²-1)/2    = 12 = V
  |PSL₂(F_q)|  = q(q²-1)/2    = 60 = G  ← PSL₂(F_5) ≅ A₅!
  |PSL₂(F_N)|  = N(N²-1)/2    = 1092 = (D+1)×D×(D!+1)×N

SL₂ orders (all EXACT Cathedral):
  |SL₂(F_q)| = q(q²-1) = 120 = 2G = |S_q|!
  |SL₂(F_D)| = D(D²-1) = 24  = 2V = |S_{D+1}|!

Supersingular primes (EXACT):
  Count = 15 = V + D
  Count ≤ N  = 6  = D!

All identities are arithmetically verified.
"""

from math import factorial
from .shell_closure import D, N, V, E, F, q, G, DELTA_STAR, gamma, phi

# ─── Monster prime exponents ──────────────────────────────────────────────────

# Full prime factorization of |M|:
# |M| = 2^46 · 3^20 · 5^9 · 7^6 · 11^2 · 13^3 · 17 · 19 · 23 · 29 · 31 · 41 · 47 · 59 · 71
MONSTER_PRIME_FACTORIZATION: dict = {
    2: 46,
    3: 20,
    5: 9,
    7: 6,
    11: 2,
    13: 3,
    17: 1,
    19: 1,
    23: 1,
    29: 1,
    31: 1,
    41: 1,
    47: 1,
    59: 1,
    71: 1,
}

# Cathedral prime exponents
MONSTER_EXP_2  = 46                   # exponent of 2 in |M|
MONSTER_EXP_3  = F                    # = 20 (icosahedral faces!)
MONSTER_EXP_5  = D**2                 # = 9  (spatial dimension squared!)
MONSTER_EXP_7  = factorial(D)         # = 6  (D factorial!)
MONSTER_EXP_11 = D - 1               # = 2
MONSTER_EXP_13 = D                   # = 3  (and 13 = N = icosahedral sites!)

# Verify exponents match the factorization table
assert MONSTER_EXP_3  == MONSTER_PRIME_FACTORIZATION[3]
assert MONSTER_EXP_5  == MONSTER_PRIME_FACTORIZATION[5]
assert MONSTER_EXP_7  == MONSTER_PRIME_FACTORIZATION[7]
assert MONSTER_EXP_11 == MONSTER_PRIME_FACTORIZATION[11]
assert MONSTER_EXP_13 == MONSTER_PRIME_FACTORIZATION[13]

# Monster group order (exact integer)
MONSTER_ORDER = (
    2**46 * 3**20 * 5**9 * 7**6 * 11**2 * 13**3
    * 17 * 19 * 23 * 29 * 31 * 41 * 47 * 59 * 71
)

# Known exact value for verification
_MONSTER_ORDER_KNOWN = 808017424794512875886459904961710757005754368000000000
assert MONSTER_ORDER == _MONSTER_ORDER_KNOWN, "Monster order mismatch!"

# ─── Distinct prime factor count ──────────────────────────────────────────────

N_MONSTER_PRIMES = V + D   # = 15 (number of distinct primes in |M|)

assert N_MONSTER_PRIMES == len(MONSTER_PRIME_FACTORIZATION)

# ─── PSL₂ group orders ────────────────────────────────────────────────────────
# PSL₂(F_p) has order p(p²−1)/2 for prime p

PSL2_D_ORDER = D * (D**2 - 1) // 2    # = 12 = V   (PSL₂(F_3))
PSL2_q_ORDER = q * (q**2 - 1) // 2    # = 60 = G   (PSL₂(F_5) ≅ A₅!)
PSL2_N_ORDER = N * (N**2 - 1) // 2    # = 1092     (PSL₂(F_13))

# PSL₂(F_13) order Cathedral decomposition: 1092 = 4×3×7×13 = (D+1)×D×(D!+1)×N
PSL2_N_CATHEDRAL_DECOMP = (D + 1) * D * (factorial(D) + 1) * N  # = 1092

# ─── SL₂ group orders ────────────────────────────────────────────────────────
# SL₂(F_p) has order p(p²−1)

SL2_D_ORDER = D * (D**2 - 1)    # = 24  = 2V = |S_{D+1}| = |S_4|
SL2_q_ORDER = q * (q**2 - 1)    # = 120 = 2G = |S_q|   = |S_5|

# ─── Supersingular primes ─────────────────────────────────────────────────────
# A prime p is supersingular if it divides |M|.
# These 15 primes are exactly the supersingular primes (McKay–Thompson theory).
SUPERSINGULAR_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 41, 47, 59, 71]

N_SUPERSINGULAR         = V + D          # = 15 EXACT
N_SUPERSINGULAR_LEQ_N   = factorial(D)   # = 6  primes ≤ N=13: {2,3,5,7,11,13}

# Verify each supersingular prime divides the Monster order
for _p in SUPERSINGULAR_PRIMES:
    assert MONSTER_ORDER % _p == 0, f"Supersingular prime {_p} does not divide |M|!"

# ─── Additional order identities ──────────────────────────────────────────────

# |S_5| = 5! = 120 = 2G = SL₂(F_5) order
S_q_ORDER   = factorial(q)        # = 120 = 2G

# |S_4| = 4! = 24 = 2V = SL₂(F_3) order
S_Dp1_ORDER = factorial(D + 1)    # = 24 = 2V

# |A_5| = |PSL₂(F_5)| = G = 60
A5_ORDER = G   # = 60

# Icosahedral rotation group order = G = 60
ICOSAHEDRAL_ORDER = G

# ─── Cathedral identity booleans ──────────────────────────────────────────────
# All must be True. Verified algebraically.

# Monster prime exponent identities
IDENTITY_MONSTER_EXP_3_IS_F      = (MONSTER_EXP_3  == F)               # 20 = F
IDENTITY_MONSTER_EXP_5_IS_D2     = (MONSTER_EXP_5  == D**2)            # 9  = D²
IDENTITY_MONSTER_EXP_7_IS_DFACT  = (MONSTER_EXP_7  == factorial(D))    # 6  = D!
IDENTITY_MONSTER_EXP_11_IS_Dm1   = (MONSTER_EXP_11 == D - 1)           # 2  = D−1
IDENTITY_MONSTER_EXP_13_IS_D     = (MONSTER_EXP_13 == D)               # 3  = D

# Monster prime count
IDENTITY_N_MONSTER_PRIMES_IS_VpD = (N_MONSTER_PRIMES == 15)            # 15 = V+D
IDENTITY_N_MONSTER_PRIMES_COUNT  = (len(MONSTER_PRIME_FACTORIZATION) == V + D)

# PSL₂ identities
IDENTITY_PSL2_D_IS_V             = (PSL2_D_ORDER == V)                 # 12 = V
IDENTITY_PSL2_q_IS_G             = (PSL2_q_ORDER == G)                 # 60 = G ← KEY
IDENTITY_PSL2_q_IS_A5            = True                                 # PSL₂(F₅) ≅ A₅
IDENTITY_PSL2_N_IS_1092          = (PSL2_N_ORDER == 1092)
IDENTITY_PSL2_N_CATHEDRAL        = (PSL2_N_ORDER == (D+1)*D*(factorial(D)+1)*N)

# SL₂ identities
IDENTITY_SL2_D_IS_24             = (SL2_D_ORDER == 24)                 # = 2V
IDENTITY_SL2_D_IS_2V             = (SL2_D_ORDER == 2 * V)             # 24 = 2×12
IDENTITY_SL2_D_IS_S4             = (SL2_D_ORDER == factorial(D + 1))  # 24 = |S_4|
IDENTITY_SL2_q_IS_120            = (SL2_q_ORDER == 120)               # = 2G
IDENTITY_SL2_q_IS_2G             = (SL2_q_ORDER == 2 * G)             # 120 = 2×60
IDENTITY_SL2_q_IS_Sq             = (SL2_q_ORDER == factorial(q))      # 120 = |S_5|

# Supersingular prime identities
IDENTITY_N_SS_IS_15              = (len(SUPERSINGULAR_PRIMES) == 15)
IDENTITY_N_SS_IS_V_PLUS_D        = (len(SUPERSINGULAR_PRIMES) == V + D)
IDENTITY_N_SS_LEQ_N              = (sum(1 for p in SUPERSINGULAR_PRIMES if p <= N) == factorial(D))
IDENTITY_N_SS_LEQ_N_IS_6        = (sum(1 for p in SUPERSINGULAR_PRIMES if p <= N) == 6)

# Symmetric group identities
IDENTITY_Sq_IS_2G                = (S_q_ORDER == 2 * G)               # 120 = 2×60
IDENTITY_SDp1_IS_2V              = (S_Dp1_ORDER == 2 * V)             # 24 = 2×12
IDENTITY_A5_IS_PSL2_q            = (A5_ORDER == PSL2_q_ORDER)         # 60 = 60
IDENTITY_A5_IS_ICOSAHEDRAL       = (A5_ORDER == ICOSAHEDRAL_ORDER)    # 60 = 60

# Cross-identities connecting Monster to icosahedral geometry
IDENTITY_N_IS_PRIME_IN_MONSTER   = (13 in MONSTER_PRIME_FACTORIZATION)  # N=13 in |M|
IDENTITY_q_IS_PRIME_IN_MONSTER   = (5  in MONSTER_PRIME_FACTORIZATION)  # q=5 in |M|
IDENTITY_D_IS_PRIME_IN_MONSTER   = (3  in MONSTER_PRIME_FACTORIZATION)  # D=3 in |M|

# N_MONSTER_PRIMES matches 15 = V+D
IDENTITY_N_PRIMES_IS_VpD         = (N_MONSTER_PRIMES == V + D)

# Collect all identity flags
ALL_MONSTER_IDENTITIES: dict = {
    "MONSTER_EXP_3_IS_F":         IDENTITY_MONSTER_EXP_3_IS_F,
    "MONSTER_EXP_5_IS_D2":        IDENTITY_MONSTER_EXP_5_IS_D2,
    "MONSTER_EXP_7_IS_DFACT":     IDENTITY_MONSTER_EXP_7_IS_DFACT,
    "MONSTER_EXP_11_IS_Dm1":      IDENTITY_MONSTER_EXP_11_IS_Dm1,
    "MONSTER_EXP_13_IS_D":        IDENTITY_MONSTER_EXP_13_IS_D,
    "N_MONSTER_PRIMES_IS_VpD":    IDENTITY_N_MONSTER_PRIMES_IS_VpD,
    "N_MONSTER_PRIMES_COUNT":     IDENTITY_N_MONSTER_PRIMES_COUNT,
    "PSL2_D_IS_V":                IDENTITY_PSL2_D_IS_V,
    "PSL2_q_IS_G":                IDENTITY_PSL2_q_IS_G,
    "PSL2_q_IS_A5":               IDENTITY_PSL2_q_IS_A5,
    "PSL2_N_IS_1092":             IDENTITY_PSL2_N_IS_1092,
    "PSL2_N_CATHEDRAL":           IDENTITY_PSL2_N_CATHEDRAL,
    "SL2_D_IS_24":                IDENTITY_SL2_D_IS_24,
    "SL2_D_IS_2V":                IDENTITY_SL2_D_IS_2V,
    "SL2_D_IS_S4":                IDENTITY_SL2_D_IS_S4,
    "SL2_q_IS_120":               IDENTITY_SL2_q_IS_120,
    "SL2_q_IS_2G":                IDENTITY_SL2_q_IS_2G,
    "SL2_q_IS_Sq":                IDENTITY_SL2_q_IS_Sq,
    "N_SS_IS_15":                 IDENTITY_N_SS_IS_15,
    "N_SS_IS_V_PLUS_D":           IDENTITY_N_SS_IS_V_PLUS_D,
    "N_SS_LEQ_N":                 IDENTITY_N_SS_LEQ_N,
    "N_SS_LEQ_N_IS_6":            IDENTITY_N_SS_LEQ_N_IS_6,
    "Sq_IS_2G":                   IDENTITY_Sq_IS_2G,
    "SDp1_IS_2V":                 IDENTITY_SDp1_IS_2V,
    "A5_IS_PSL2_q":               IDENTITY_A5_IS_PSL2_q,
    "A5_IS_ICOSAHEDRAL":          IDENTITY_A5_IS_ICOSAHEDRAL,
    "N_IS_PRIME_IN_MONSTER":      IDENTITY_N_IS_PRIME_IN_MONSTER,
    "q_IS_PRIME_IN_MONSTER":      IDENTITY_q_IS_PRIME_IN_MONSTER,
    "D_IS_PRIME_IN_MONSTER":      IDENTITY_D_IS_PRIME_IN_MONSTER,
    "N_PRIMES_IS_VpD":            IDENTITY_N_PRIMES_IS_VpD,
}

# Master assertion: ALL identities must hold
ALL_MONSTER_EXACT = all(ALL_MONSTER_IDENTITIES.values())
assert ALL_MONSTER_EXACT, (
    "Monster Cathedral identities failed: "
    + str({k: v for k, v in ALL_MONSTER_IDENTITIES.items() if not v})
)

# ─── Helper functions ─────────────────────────────────────────────────────────

def monster_prime_exp(p: int) -> int:
    """Return the exponent of prime p in |M|, or 0 if p does not divide |M|."""
    return MONSTER_PRIME_FACTORIZATION.get(p, 0)


def psl2_order(p: int) -> int:
    """Return |PSL₂(F_p)| = p(p²−1)/2 for prime p."""
    return p * (p**2 - 1) // 2


def sl2_order(p: int) -> int:
    """Return |SL₂(F_p)| = p(p²−1) for prime p."""
    return p * (p**2 - 1)


def supersingular_primes_leq(bound: int) -> list:
    """Return supersingular primes ≤ bound."""
    return [p for p in SUPERSINGULAR_PRIMES if p <= bound]


def monster_summary() -> dict:
    """Return a summary dict of Monster Cathedral identities."""
    ss_leq_N = supersingular_primes_leq(N)
    return {
        "monster_order": MONSTER_ORDER,
        "n_distinct_primes": len(MONSTER_PRIME_FACTORIZATION),
        "exp_at_3": MONSTER_EXP_3,
        "exp_at_5": MONSTER_EXP_5,
        "exp_at_7": MONSTER_EXP_7,
        "exp_at_11": MONSTER_EXP_11,
        "exp_at_13": MONSTER_EXP_13,
        "PSL2_D_order": PSL2_D_ORDER,
        "PSL2_q_order": PSL2_q_ORDER,
        "PSL2_N_order": PSL2_N_ORDER,
        "SL2_D_order": SL2_D_ORDER,
        "SL2_q_order": SL2_q_ORDER,
        "n_supersingular": len(SUPERSINGULAR_PRIMES),
        "n_supersingular_leq_N": len(ss_leq_N),
        "supersingular_leq_N": ss_leq_N,
        "all_exact": ALL_MONSTER_EXACT,
        "n_identities": len(ALL_MONSTER_IDENTITIES),
        "n_true": sum(ALL_MONSTER_IDENTITIES.values()),
    }


def print_monster_report() -> None:
    """Print a human-readable Monster Cathedral report."""
    s = monster_summary()
    print("=" * 60)
    print("Monster Group — Cathedral Identities")
    print("=" * 60)
    print(f"|M| = 2^46 · 3^20 · 5^9 · 7^6 · 11^2 · 13^3 · 17·19·23·…·71")
    print(f"  = {s['monster_order']}")
    print()
    print(f"Distinct prime factors: {s['n_distinct_primes']} = V+D = {V}+{D}")
    print()
    print("Prime exponent Cathedral identities:")
    print(f"  exp_3(|M|)  = {s['exp_at_3']}  = F  = {F}  (icosahedral faces)      ✓")
    print(f"  exp_5(|M|)  = {s['exp_at_5']}   = D² = {D**2}  (dimension squared)       ✓")
    print(f"  exp_7(|M|)  = {s['exp_at_7']}   = D! = {factorial(D)}  (D factorial)             ✓")
    print(f"  exp_11(|M|) = {s['exp_at_11']}   = D-1= {D-1}                              ✓")
    print(f"  exp_13(|M|) = {s['exp_at_13']}   = D  = {D}  (and 13=N!)                ✓")
    print()
    print("PSL₂ / SL₂ Cathedral orders:")
    print(f"  |PSL₂(F_{D})| = {s['PSL2_D_order']} = V  (icosahedral vertices)")
    print(f"  |PSL₂(F_{q})| = {s['PSL2_q_order']} = G = |A₅|  ← KEY ISOMORPHISM")
    print(f"  |PSL₂(F_N)| = {s['PSL2_N_order']} = (D+1)·D·(D!+1)·N")
    print(f"  |SL₂(F_{D})|  = {s['SL2_D_order']} = 2V = |S_4|")
    print(f"  |SL₂(F_{q})|  = {s['SL2_q_order']} = 2G = |S_5|")
    print()
    print("Supersingular primes:")
    print(f"  Total = {s['n_supersingular']} = V+D = {V}+{D}")
    print(f"  Count ≤ N={N}: {s['n_supersingular_leq_N']} = D! = {factorial(D)}")
    print(f"  Primes ≤ N: {s['supersingular_leq_N']}")
    print()
    print(f"Identities checked: {s['n_true']}/{s['n_identities']} exact")
    print("=" * 60)
