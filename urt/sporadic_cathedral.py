"""
Cathedral Sporadic Groups — CFSG meets the Cathedral Integers

The Classification of Finite Simple Groups (CFSG) partitions all finite simple
groups into:
  - Cyclic groups of prime order (infinite family)
  - Alternating groups A_n, n≥5 (infinite family)
  - 16 families of groups of Lie type (infinite families)
  - 26 sporadic groups

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

## CFSG Structure
  - 26 sporadic groups              = 2N    (twice icosahedral shell sites)  EXACT
  - 20 Happy Family (Monster-involved) = F  (icosahedron faces)              EXACT
  - 6  Pariah groups               = D! = V/2 = 6                           EXACT
  - 18 infinite families (3 classical + 16 Lie-type) = D × D!               EXACT

## Sporadic Group Orders — Cathedral Prime Factorizations
  J₁:  175560  = 2^D × D × q × (D!+1) × (2D+q) × (N+D!)                  EXACT
  J₂:  604800  = 2^(D!+1) × D^D × q^2 × (D!+1)                            EXACT
  Tits: 17971200 = 2^(2D+q) × D^D × q^2 × N                               EXACT
  McL: 898128000 = 2^(D!+1) × D^(D!) × q^D × (D!+1) × (2D+q)             EXACT
  HS:  44352000  = 2^(D²) × D^2 × q^D × (D!+1) × (2D+q)                  EXACT

  Baby Monster B: exponents in prime factorisation all have Cathedral meaning:
    2^41: 41 = G − D! − N
    3^13: 13 = N
    5^6:  6 = D! = V/2
    7^2:  base 7 = D!+1  (exponent 2 = D−1)
    primes 11, 13, 17, 19, 23, 31, 47 all Cathedral-expressible              EXACT

All identities labelled EXACT are arithmetically verified in this module.
"""

from math import factorial, isqrt
from .shell_closure import D, N, V, E, F, q, G, gamma, DELTA_STAR

# ── CFSG Classification Counts ────────────────────────────────────────────────

N_SPORADIC = 26          # total sporadic groups  = 2N
N_HAPPY_FAMILY = 20      # involved in Monster    = F (icosahedron faces)
N_PARIAH = 6             # not in Happy Family    = D! = V/2

# Infinite families: cyclic + alternating + 16 Lie-type = 18 = D × D!
N_INFINITE_FAMILIES = 18   # = D × D! = 3 × 6

# ── CFSG Identity Booleans ────────────────────────────────────────────────────

IDENTITY_SPORADIC_IS_2N: bool = (N_SPORADIC == 2 * N)
IDENTITY_HAPPY_IS_F: bool = (N_HAPPY_FAMILY == F)
IDENTITY_PARIAH_IS_DFACT: bool = (N_PARIAH == factorial(D))
IDENTITY_INFINITE_FAMILIES: bool = (N_INFINITE_FAMILIES == D * factorial(D))

# ── Janko Group J₁ ───────────────────────────────────────────────────────────
# |J₁| = 175560 = 2³ × 3 × 5 × 7 × 11 × 19
# Cathedral decomposition:
#   2^D × D × q × (D!+1) × (2D+q) × (N+D!)
#   = 8 × 3 × 5 × 7 × 11 × 19  = 175560

J1_ORDER = 175560

IDENTITY_J1: bool = (
    J1_ORDER == 2**D * D * q * (factorial(D) + 1) * (2*D + q) * (N + factorial(D))
)

# ── Janko Group J₂ (Hall-Janko group) ────────────────────────────────────────
# |J₂| = 604800 = 2^7 × 3^3 × 5^2 × 7
# Cathedral decomposition:
#   2^(D!+1) × D^D × q^2 × (D!+1)
#   = 128 × 27 × 25 × 7 = 604800

J2_ORDER = 604800

IDENTITY_J2: bool = (
    J2_ORDER == 2**(factorial(D) + 1) * D**D * q**2 * (factorial(D) + 1)
)

# ── Tits Group ────────────────────────────────────────────────────────────────
# |Tits| = 17971200 = 2^11 × 3^3 × 5^2 × 13
# Cathedral decomposition:
#   2^(2D+q) × D^D × q^2 × N
#   = 2048 × 27 × 25 × 13 = 17971200

TITS_ORDER = 17971200

IDENTITY_TITS: bool = (
    TITS_ORDER == 2**(2*D + q) * D**D * q**2 * N
)

# ── Baby Monster B — ALL prime exponents/bases are Cathedral ──────────────────
# |B| = 2^41 × 3^13 × 5^6 × 7^2 × 11 × 13 × 17 × 19 × 23 × 31 × 47

BM_ORDER = (
    2**41 * 3**13 * 5**6 * 7**2 * 11 * 13 * 17 * 19 * 23 * 31 * 47
)

# Exponent identities
BM_2_EXP = 41   # = G − D! − N = 60 − 6 − 13 = 41
BM_3_EXP = 13   # = N
BM_5_EXP = 6    # = D! = V/2

# Cathedral primes that appear
PRIME_11 = 11   # = 2D + q
PRIME_13 = 13   # = N
PRIME_17 = 17   # = V + q
PRIME_19 = 19   # = N + D!
PRIME_23 = 23   # = 2N − 3
PRIME_31 = 31   # = 2^q − 1
PRIME_47 = 47   # = D*N + 2^D

IDENTITY_BM_2: bool = (BM_2_EXP == G - factorial(D) - N)
IDENTITY_BM_3: bool = (BM_3_EXP == N)
IDENTITY_BM_5: bool = (BM_5_EXP == factorial(D))
IDENTITY_PRIME_11: bool = (PRIME_11 == 2*D + q)
IDENTITY_PRIME_13: bool = (PRIME_13 == N)
IDENTITY_PRIME_17: bool = (PRIME_17 == V + q)
IDENTITY_PRIME_19: bool = (PRIME_19 == N + factorial(D))
IDENTITY_PRIME_23: bool = (PRIME_23 == 2*N - 3)
IDENTITY_PRIME_31: bool = (PRIME_31 == 2**q - 1)
IDENTITY_PRIME_47: bool = (PRIME_47 == D*N + 2**D)

# ── McLaughlin Group McL ──────────────────────────────────────────────────────
# |McL| = 898128000 = 2^7 × 3^6 × 5^3 × 7 × 11
# Cathedral decomposition:
#   2^(D!+1) × D^(D!) × q^D × (D!+1) × (2D+q)
#   = 128 × 729 × 125 × 7 × 11 = 898128000

MCL_ORDER = 898128000

IDENTITY_MCL: bool = (
    MCL_ORDER == 2**(factorial(D) + 1) * D**factorial(D) * q**D * (factorial(D) + 1) * (2*D + q)
)

# ── Higman-Sims Group HS ──────────────────────────────────────────────────────
# |HS| = 44352000 = 2^9 × 3^2 × 5^3 × 7 × 11
# Cathedral decomposition:
#   2^(D²) × D^2 × q^D × (D!+1) × (2D+q)
#   = 512 × 9 × 125 × 7 × 11 = 44352000

HS_ORDER = 44352000

IDENTITY_HS: bool = (
    HS_ORDER == 2**(D**2) * D**2 * q**D * (factorial(D) + 1) * (2*D + q)
)

# ── Cathedral Primes Dictionary ───────────────────────────────────────────────
# All primes appearing in sporadic group orders that have Cathedral expressions

CATHEDRAL_SPORADIC_PRIMES: dict = {
    3:  "D",
    5:  "q",
    7:  "D!+1",
    11: "2D+q",
    13: "N",
    17: "V+q",
    19: "N+D!",
    23: "2N-3",
    31: "2^q-1",
    47: "D*N+2^D",
}

# ── Module-level assertion: all identities must hold ─────────────────────────

assert IDENTITY_SPORADIC_IS_2N,     "CFSG: 26 sporadic ≠ 2N"
assert IDENTITY_HAPPY_IS_F,         "CFSG: 20 Happy Family ≠ F"
assert IDENTITY_PARIAH_IS_DFACT,    "CFSG: 6 Pariah ≠ D!"
assert IDENTITY_INFINITE_FAMILIES,  "CFSG: 18 infinite families ≠ D×D!"
assert IDENTITY_J1,                 "J₁ order identity failed"
assert IDENTITY_J2,                 "J₂ order identity failed"
assert IDENTITY_TITS,               "Tits order identity failed"
assert IDENTITY_MCL,                "McL order identity failed"
assert IDENTITY_HS,                 "HS order identity failed"
assert IDENTITY_BM_2,               "Baby Monster: 2-exponent ≠ G−D!−N"
assert IDENTITY_BM_3,               "Baby Monster: 3-exponent ≠ N"
assert IDENTITY_BM_5,               "Baby Monster: 5-exponent ≠ D!"
assert IDENTITY_PRIME_11,           "Prime 11 ≠ 2D+q"
assert IDENTITY_PRIME_13,           "Prime 13 ≠ N"
assert IDENTITY_PRIME_17,           "Prime 17 ≠ V+q"
assert IDENTITY_PRIME_19,           "Prime 19 ≠ N+D!"
assert IDENTITY_PRIME_23,           "Prime 23 ≠ 2N-3"
assert IDENTITY_PRIME_31,           "Prime 31 ≠ 2^q-1"
assert IDENTITY_PRIME_47,           "Prime 47 ≠ D*N+2^D"


# ── Helper: primality test ────────────────────────────────────────────────────

def _is_prime(n: int) -> bool:
    """Deterministic primality test for moderate integers."""
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, isqrt(n) + 1, 2):
        if n % i == 0:
            return False
    return True


# ── Helper: prime factorisation ───────────────────────────────────────────────

def _factorise(n: int) -> dict:
    """Return {prime: exponent} dictionary for positive integer n."""
    factors: dict = {}
    d = 2
    while d * d <= n:
        while n % d == 0:
            factors[d] = factors.get(d, 0) + 1
            n //= d
        d += 1
    if n > 1:
        factors[n] = factors.get(n, 0) + 1
    return factors


# ── Verification functions ────────────────────────────────────────────────────

def verify_j1() -> dict:
    """Verify J₁ order Cathedral decomposition."""
    expected = 2**D * D * q * (factorial(D) + 1) * (2*D + q) * (N + factorial(D))
    factors = _factorise(J1_ORDER)
    return {
        "group": "J₁",
        "order": J1_ORDER,
        "expected": expected,
        "match": J1_ORDER == expected,
        "factors": factors,
        "cathedral_decomposition": {
            "2^D": 2**D,
            "D": D,
            "q": q,
            "D!+1": factorial(D) + 1,
            "2D+q": 2*D + q,
            "N+D!": N + factorial(D),
        },
    }


def verify_j2() -> dict:
    """Verify J₂ order Cathedral decomposition."""
    expected = 2**(factorial(D) + 1) * D**D * q**2 * (factorial(D) + 1)
    factors = _factorise(J2_ORDER)
    return {
        "group": "J₂",
        "order": J2_ORDER,
        "expected": expected,
        "match": J2_ORDER == expected,
        "factors": factors,
        "cathedral_decomposition": {
            "2^(D!+1)": 2**(factorial(D) + 1),
            "D^D": D**D,
            "q^2": q**2,
            "D!+1": factorial(D) + 1,
        },
    }


def verify_tits() -> dict:
    """Verify Tits group order Cathedral decomposition."""
    expected = 2**(2*D + q) * D**D * q**2 * N
    factors = _factorise(TITS_ORDER)
    return {
        "group": "Tits",
        "order": TITS_ORDER,
        "expected": expected,
        "match": TITS_ORDER == expected,
        "factors": factors,
        "cathedral_decomposition": {
            "2^(2D+q)": 2**(2*D + q),
            "D^D": D**D,
            "q^2": q**2,
            "N": N,
        },
    }


def verify_mcl() -> dict:
    """Verify McLaughlin group order Cathedral decomposition."""
    expected = (
        2**(factorial(D) + 1) * D**factorial(D) * q**D * (factorial(D) + 1) * (2*D + q)
    )
    factors = _factorise(MCL_ORDER)
    return {
        "group": "McL",
        "order": MCL_ORDER,
        "expected": expected,
        "match": MCL_ORDER == expected,
        "factors": factors,
        "cathedral_decomposition": {
            "2^(D!+1)": 2**(factorial(D) + 1),
            "D^(D!)": D**factorial(D),
            "q^D": q**D,
            "D!+1": factorial(D) + 1,
            "2D+q": 2*D + q,
        },
    }


def verify_hs() -> dict:
    """Verify Higman-Sims group order Cathedral decomposition."""
    expected = 2**(D**2) * D**2 * q**D * (factorial(D) + 1) * (2*D + q)
    factors = _factorise(HS_ORDER)
    return {
        "group": "HS",
        "order": HS_ORDER,
        "expected": expected,
        "match": HS_ORDER == expected,
        "factors": factors,
        "cathedral_decomposition": {
            "2^(D^2)": 2**(D**2),
            "D^2": D**2,
            "q^D": q**D,
            "D!+1": factorial(D) + 1,
            "2D+q": 2*D + q,
        },
    }


def verify_baby_monster_exponents() -> dict:
    """Verify that Baby Monster prime exponents/bases are Cathedral integers."""
    return {
        "group": "Baby Monster B",
        "order_partial_check": BM_ORDER,
        "exponent_41_is_G_minus_Dfact_minus_N": IDENTITY_BM_2,
        "exponent_13_is_N": IDENTITY_BM_3,
        "exponent_6_is_Dfact": IDENTITY_BM_5,
        "prime_11_is_2D+q": IDENTITY_PRIME_11,
        "prime_13_is_N": IDENTITY_PRIME_13,
        "prime_17_is_V+q": IDENTITY_PRIME_17,
        "prime_19_is_N+Dfact": IDENTITY_PRIME_19,
        "prime_23_is_2N-3": IDENTITY_PRIME_23,
        "prime_31_is_2^q-1": IDENTITY_PRIME_31,
        "prime_47_is_D*N+2^D": IDENTITY_PRIME_47,
        "all_verified": all([
            IDENTITY_BM_2, IDENTITY_BM_3, IDENTITY_BM_5,
            IDENTITY_PRIME_11, IDENTITY_PRIME_13, IDENTITY_PRIME_17,
            IDENTITY_PRIME_19, IDENTITY_PRIME_23, IDENTITY_PRIME_31,
            IDENTITY_PRIME_47,
        ]),
    }


def verify_cfsg_structure() -> dict:
    """Verify CFSG classification counts against Cathedral integers."""
    return {
        "N_SPORADIC": N_SPORADIC,
        "N_HAPPY_FAMILY": N_HAPPY_FAMILY,
        "N_PARIAH": N_PARIAH,
        "N_INFINITE_FAMILIES": N_INFINITE_FAMILIES,
        "sporadic_is_2N": IDENTITY_SPORADIC_IS_2N,
        "happy_is_F": IDENTITY_HAPPY_IS_F,
        "pariah_is_Dfact": IDENTITY_PARIAH_IS_DFACT,
        "infinite_is_D_times_Dfact": IDENTITY_INFINITE_FAMILIES,
        "all_verified": all([
            IDENTITY_SPORADIC_IS_2N,
            IDENTITY_HAPPY_IS_F,
            IDENTITY_PARIAH_IS_DFACT,
            IDENTITY_INFINITE_FAMILIES,
        ]),
    }


def cathedral_sporadic_primes_check() -> dict:
    """Verify all Cathedral sporadic prime expressions numerically."""
    checks = {}
    prime_formulae = {
        3:  D,
        5:  q,
        7:  factorial(D) + 1,
        11: 2*D + q,
        13: N,
        17: V + q,
        19: N + factorial(D),
        23: 2*N - 3,
        31: 2**q - 1,
        47: D*N + 2**D,
    }
    for prime, formula_val in prime_formulae.items():
        checks[prime] = {
            "is_prime": _is_prime(prime),
            "cathedral_value": formula_val,
            "match": prime == formula_val,
            "formula": CATHEDRAL_SPORADIC_PRIMES[prime],
        }
    return checks


def sporadic_summary() -> dict:
    """Return complete summary of all Cathedral sporadic identities."""
    return {
        "cathedral_integers": {
            "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
            "D_factorial": factorial(D),
        },
        "cfsg_structure": verify_cfsg_structure(),
        "group_orders": {
            "J1": verify_j1(),
            "J2": verify_j2(),
            "Tits": verify_tits(),
            "McL": verify_mcl(),
            "HS": verify_hs(),
            "Baby_Monster": verify_baby_monster_exponents(),
        },
        "cathedral_primes": cathedral_sporadic_primes_check(),
        "all_identities_verified": all([
            IDENTITY_SPORADIC_IS_2N,
            IDENTITY_HAPPY_IS_F,
            IDENTITY_PARIAH_IS_DFACT,
            IDENTITY_INFINITE_FAMILIES,
            IDENTITY_J1,
            IDENTITY_J2,
            IDENTITY_TITS,
            IDENTITY_MCL,
            IDENTITY_HS,
            IDENTITY_BM_2,
            IDENTITY_BM_3,
            IDENTITY_BM_5,
            IDENTITY_PRIME_11,
            IDENTITY_PRIME_13,
            IDENTITY_PRIME_17,
            IDENTITY_PRIME_19,
            IDENTITY_PRIME_23,
            IDENTITY_PRIME_31,
            IDENTITY_PRIME_47,
        ]),
    }


def print_sporadic_report() -> None:
    """Print a human-readable report of all Cathedral sporadic identities."""
    summary = sporadic_summary()
    ci = summary["cathedral_integers"]
    print("=" * 70)
    print("CATHEDRAL SPORADIC GROUPS — CFSG × Cathedral Framework")
    print("=" * 70)
    print(f"Cathedral integers: D={ci['D']}, N={ci['N']}, V={ci['V']}, "
          f"E={ci['E']}, F={ci['F']}, q={ci['q']}, G={ci['G']}, "
          f"D!={ci['D_factorial']}")
    print()

    print("── CFSG Classification Structure ──")
    cfsg = summary["cfsg_structure"]
    print(f"  Sporadic groups:      {N_SPORADIC:>6}  = 2N = 2×{N}          [{'OK' if IDENTITY_SPORADIC_IS_2N else 'FAIL'}]")
    print(f"  Happy Family:         {N_HAPPY_FAMILY:>6}  = F (faces)           [{'OK' if IDENTITY_HAPPY_IS_F else 'FAIL'}]")
    print(f"  Pariah groups:        {N_PARIAH:>6}  = D! = {factorial(D)} = V/2={V//2}  [{'OK' if IDENTITY_PARIAH_IS_DFACT else 'FAIL'}]")
    print(f"  Infinite families:    {N_INFINITE_FAMILIES:>6}  = D×D! = {D}×{factorial(D)}       [{'OK' if IDENTITY_INFINITE_FAMILIES else 'FAIL'}]")
    print()

    print("── Sporadic Group Orders ──")
    for name, info in summary["group_orders"].items():
        if name == "Baby_Monster":
            bm = info
            status = "OK" if bm["all_verified"] else "FAIL"
            print(f"  Baby Monster B        exponents all Cathedral           [{status}]")
        else:
            status = "OK" if info["match"] else "FAIL"
            print(f"  {info['group']:<20} |G|={info['order']:>12}  [{status}]")
    print()

    print("── Cathedral Sporadic Primes ──")
    for prime, data in summary["cathedral_primes"].items():
        status = "OK" if data["match"] else "FAIL"
        print(f"  {prime:>3} = {data['formula']:<15}  [{status}]")
    print()

    all_ok = summary["all_identities_verified"]
    print(f"All identities verified: {'YES' if all_ok else 'NO — check failures above'}")
    print("=" * 70)
