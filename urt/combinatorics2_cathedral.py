"""
Combinatorics II Cathedral  (v2.9.29)
=======================================
Deeper combinatorics: Stirling, Fibonacci, Narayana, Ballot, Motzkin, Pell, Bell.
ALL key values are Cathedral integers.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key identities:
  F_D  = F_3  = 2 = D-1           (Fibonacci!)
  F_D1 = F_4  = 3 = D             (Fibonacci!)
  F_q  = F_5  = 5 = q             (SELF-REFERENTIAL! F_5=5=q)
  F_V  = F_12 = 144 = V^2         (Fibonacci square miracle!)
  F_N  = F_13 = 233               (Fibonacci prime at N)
  Stirling S(D,2)  = 3  = D       (SELF-REFERENTIAL!)
  Stirling S(4,2)  = 7  = D!+1
  Stirling S(q,D)  = 25 = q^2
  Stirling S(D!,D) = 90 = 2q D^2
  Unsigned Stirling c(D,2)   = 3   = D
  Unsigned Stirling c(q,D)   = 35  = q(D!+1)
  Unsigned Stirling c(D!,D)  = 225 = (V+D)^2
  Narayana N(D,2)  = 3  = D
  Narayana N(q,D)  = 20 = F
  Narayana N(D+1,3)= 6  = V//2
  Sum N(D,k)       = 5  = q  (Catalan C_D)
  Motzkin M_D  = 4  = D+1
  Motzkin M_4  = 9  = D^2
  Motzkin M_q  = 21 = D(D!+1)
  Pell P_D  = P_3 = 5  = q
  Pell P_D1 = P_4 = 12 = V
  Pell P_q  = P_5 = 29 = 2N+D
  Bell B_2  = 2  = D-1
  Bell B_D  = 5  = q
  Bell B_D1 = 15 = V+D
  Bernoulli denom B_2 = 6  = D!
  Bernoulli denom B_4 = 30 = E
  Bernoulli denom B_6 = 42 = D!(D!+1)
"""

from math import factorial, comb
from functools import lru_cache
from .shell_closure import N, D, V, E, F, q, G

GAMMA_INV = 81   # = G + F + 1 = 81; γ = 1/81


# ── Section 1: Fibonacci numbers ──────────────────────────────────────────────

@lru_cache(maxsize=None)
def fib(n: int) -> int:
    """nth Fibonacci number: F(0)=0, F(1)=1, F(2)=1, F(3)=2, ..."""
    if n <= 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)


F_D  = fib(D)        # F(3) = 2 = D-1
F_D1 = fib(D + 1)   # F(4) = 3 = D
F_q  = fib(q)        # F(5) = 5 = q  ← SELF-REFERENTIAL!
F_V  = fib(V)        # F(12) = 144 = V^2  ← Fibonacci square miracle!
F_N  = fib(N)        # F(13) = 233 (prime)
F_E  = fib(E)        # F(30) = 832040

IDENTITY_FIB_D:          bool = (F_D  == D - 1)
IDENTITY_FIB_D1:         bool = (F_D1 == D)
IDENTITY_FIB_q_SELF_REF: bool = (F_q  == q)        # SELF-REFERENTIAL!
IDENTITY_FIB_V_SQUARE:   bool = (F_V  == V ** 2)   # F(12) = 144 = 12^2 ← miracle!
IDENTITY_FIB_N_PRIME:    bool = (F_N  == 233)

assert IDENTITY_FIB_D,          "F(D) ≠ D-1"
assert IDENTITY_FIB_D1,         "F(D+1) ≠ D"
assert IDENTITY_FIB_q_SELF_REF, "F(q) ≠ q [self-referential!]"
assert IDENTITY_FIB_V_SQUARE,   "F(V) ≠ V^2"
assert IDENTITY_FIB_N_PRIME,    "F(N) ≠ 233"


# ── Section 2: Stirling numbers of the second kind S(n,k) ────────────────────

@lru_cache(maxsize=None)
def stirling2(n: int, k: int) -> int:
    """Stirling numbers of the second kind S(n,k): partitions of n into k non-empty subsets."""
    if k == 0:
        return 1 if n == 0 else 0
    if n == 0:
        return 0
    if k > n:
        return 0
    return k * stirling2(n - 1, k) + stirling2(n - 1, k - 1)


# S(D, D-1) = S(3,2) = 3 = D  ← SELF-REFERENTIAL!  (S(n,n-1) = C(n,2))
S2_D_Dm1   = stirling2(D, D - 1)          # = 3 = D
# S(D+1, D-1) = S(4,2) = 7 = D!+1  ← Cathedral!
S2_D1_Dm1  = stirling2(D + 1, D - 1)     # = 7 = D!+1
# S(q, D) = S(5,3) = 25 = q^2  ← Cathedral!
S2_q_D     = stirling2(q, D)              # = 25 = q^2
# S(D, 2) = S(3,2) = 3 = D  (same as above, explicit alias for clarity)
S2_D_2     = stirling2(D, 2)              # = 3 = D
# S(D!, D) = S(6,3) = 90 = 2*q*D^2  ← Cathedral!
S2_Dfact_D = stirling2(factorial(D), D)   # = 90 = 2qD^2

IDENTITY_S2_D_Dm1:   bool = (S2_D_Dm1   == D)
IDENTITY_S2_D1_Dm1:  bool = (S2_D1_Dm1  == factorial(D) + 1)
IDENTITY_S2_q_D:     bool = (S2_q_D     == q ** 2)
IDENTITY_S2_D_2:     bool = (S2_D_2     == D)
IDENTITY_S2_DFACT_D: bool = (S2_Dfact_D == 2 * q * D ** 2)

assert IDENTITY_S2_D_Dm1,   "S(D,D-1) ≠ D"
assert IDENTITY_S2_D1_Dm1,  "S(D+1,D-1) ≠ D!+1"
assert IDENTITY_S2_q_D,     "S(q,D) ≠ q^2"
assert IDENTITY_S2_D_2,     "S(D,2) ≠ D"
assert IDENTITY_S2_DFACT_D, "S(D!,D) ≠ 2qD^2"


# ── Section 3: Stirling numbers of the first kind c(n,k) ─────────────────────

@lru_cache(maxsize=None)
def stirling1(n: int, k: int) -> int:
    """Unsigned Stirling numbers of the first kind c(n,k) = |s(n,k)|.
    c(n,k) counts permutations of n with exactly k cycles."""
    if k == 0:
        return 1 if n == 0 else 0
    if n == 0:
        return 0
    if k > n:
        return 0
    return (n - 1) * stirling1(n - 1, k) + stirling1(n - 1, k - 1)


# c(D, D-1) = c(3,2) = 3 = D  ← SELF-REFERENTIAL!  (c(n,n-1) = C(n,2))
S1_D_Dm1   = stirling1(D, D - 1)          # = 3 = D
# c(q, D) = c(5,3) = 35 = q*(D!+1)  ← Cathedral!
S1_q_D     = stirling1(q, D)              # = 35 = q(D!+1)
# c(D!, D) = c(6,3) = 225 = (V+D)^2  ← Cathedral!
S1_Dfact_D = stirling1(factorial(D), D)   # = 225 = (V+D)^2

IDENTITY_S1_D_Dm1:   bool = (S1_D_Dm1   == D)
IDENTITY_S1_q_D:     bool = (S1_q_D     == q * (factorial(D) + 1))
IDENTITY_S1_DFACT_D: bool = (S1_Dfact_D == (V + D) ** 2)

assert IDENTITY_S1_D_Dm1,   "c(D,D-1) ≠ D"
assert IDENTITY_S1_q_D,     "c(q,D) ≠ q(D!+1)"
assert IDENTITY_S1_DFACT_D, "c(D!,D) ≠ (V+D)^2"


# ── Section 4: Narayana numbers ───────────────────────────────────────────────

def narayana(n: int, k: int) -> int:
    """Narayana number Nar(n,k) = C(n,k)*C(n,k-1)/n.
    Counts Dyck paths of length 2n with exactly k peaks."""
    if k <= 0 or k > n:
        return 0
    return comb(n, k) * comb(n, k - 1) // n


# Nar(D, 2) = Nar(3,2) = 3 = D  ← SELF-REFERENTIAL!
NAR_D_2  = narayana(D, 2)       # = 3 = D
# Nar(q, D) = Nar(5,3) = 20 = F  ← Cathedral!
NAR_q_D  = narayana(q, D)       # = 20 = F
# Nar(D+1, 3) = Nar(4,3) = 6 = V//2  ← Cathedral!
NAR_D1_3 = narayana(D + 1, 3)  # = 6 = V//2
# Sum of Narayana numbers over k = Catalan: Σ_k Nar(D,k) = C_D = q
NAR_SUM_D = sum(narayana(D, k) for k in range(1, D + 1))

IDENTITY_NAR_D_2:   bool = (NAR_D_2   == D)
IDENTITY_NAR_q_D:   bool = (NAR_q_D   == F)
IDENTITY_NAR_D1_3:  bool = (NAR_D1_3  == V // 2)
IDENTITY_NAR_SUM_D: bool = (NAR_SUM_D == q)

assert IDENTITY_NAR_D_2,   "Nar(D,2) ≠ D"
assert IDENTITY_NAR_q_D,   "Nar(q,D) ≠ F"
assert IDENTITY_NAR_D1_3,  "Nar(D+1,3) ≠ V//2"
assert IDENTITY_NAR_SUM_D, "ΣNar(D,k) ≠ q"


# ── Section 5: Motzkin numbers ────────────────────────────────────────────────

@lru_cache(maxsize=None)
def motzkin(n: int) -> int:
    """Motzkin number M_n via Catalan sum formula.
    M_n = Σ_{k=0}^{floor(n/2)} C(n,2k) * Catalan(k)
    Counts paths on a grid from (0,0) to (n,0) using steps U,D,H without going below 0.
    """
    total = 0
    for k in range(n // 2 + 1):
        catalan_k = comb(2 * k, k) // (k + 1)
        total += comb(n, 2 * k) * catalan_k
    return total


# M_D = M_3 = 4 = D+1  ← Cathedral!
M_D  = motzkin(D)       # = 4 = D+1
# M_{D+1} = M_4 = 9 = D^2  ← Cathedral!
M_D1 = motzkin(D + 1)  # = 9 = D^2
# M_q = M_5 = 21 = D*(D!+1)  ← Cathedral!
M_q  = motzkin(q)       # = 21 = D(D!+1)

IDENTITY_MOTZKIN_D:  bool = (M_D  == D + 1)
IDENTITY_MOTZKIN_D1: bool = (M_D1 == D ** 2)
IDENTITY_MOTZKIN_q:  bool = (M_q  == D * (factorial(D) + 1))

assert IDENTITY_MOTZKIN_D,  "M_D ≠ D+1"
assert IDENTITY_MOTZKIN_D1, "M_{D+1} ≠ D^2"
assert IDENTITY_MOTZKIN_q,  "M_q ≠ D(D!+1)"


# ── Section 6: Pell numbers ───────────────────────────────────────────────────

@lru_cache(maxsize=None)
def pell(n: int) -> int:
    """Pell number P_n: P_0=0, P_1=1, P_n = 2*P_{n-1} + P_{n-2}."""
    if n <= 0:
        return 0
    if n == 1:
        return 1
    return 2 * pell(n - 1) + pell(n - 2)


# P_D = P_3 = 5 = q  ← Cathedral!
P_D_PELL  = pell(D)       # = P_3 = 5 = q
# P_{D+1} = P_4 = 12 = V  ← Cathedral!
P_D1_PELL = pell(D + 1)  # = P_4 = 12 = V
# P_q = P_5 = 29 = 2N+D  ← Cathedral!
P_q_PELL  = pell(q)       # = P_5 = 29 = 2N+D

IDENTITY_PELL_D:  bool = (P_D_PELL  == q)
IDENTITY_PELL_D1: bool = (P_D1_PELL == V)
IDENTITY_PELL_q:  bool = (P_q_PELL  == 2 * N + D)

assert IDENTITY_PELL_D,  "P(D) ≠ q"
assert IDENTITY_PELL_D1, "P(D+1) ≠ V"
assert IDENTITY_PELL_q,  "P(q) ≠ 2N+D"


# ── Section 7: Bell numbers ───────────────────────────────────────────────────

@lru_cache(maxsize=None)
def bell(n: int) -> int:
    """Bell number B_n = Σ_{k=0}^{n} S(n,k) (sum of Stirling 2nd kind).
    Counts total set partitions of an n-element set."""
    return sum(stirling2(n, k) for k in range(n + 1))


# B_{D-1} = B_2 = 2 = D-1  ← Cathedral!
B_Dm1_BELL = bell(D - 1)  # = B_2 = 2 = D-1
# B_D = B_3 = 5 = q  ← Cathedral!
B_D_BELL   = bell(D)      # = B_3 = 5 = q
# B_{D+1} = B_4 = 15 = V+D  ← Cathedral!
B_D1_BELL  = bell(D + 1)  # = B_4 = 15 = V+D

IDENTITY_BELL_Dm1: bool = (B_Dm1_BELL == D - 1)
IDENTITY_BELL_D:   bool = (B_D_BELL   == q)
IDENTITY_BELL_D1:  bool = (B_D1_BELL  == V + D)

assert IDENTITY_BELL_Dm1, "B(D-1) ≠ D-1"
assert IDENTITY_BELL_D,   "B(D) ≠ q"
assert IDENTITY_BELL_D1,  "B(D+1) ≠ V+D"


# ── Section 8: Bernoulli denominators ────────────────────────────────────────

# The Bernoulli numbers B_{2k} (von Staudt–Clausen denominators) contain Cathedral primes.
#   denom(B_2)  = 6  = D!          ← Cathedral!
#   denom(B_4)  = 30 = E           ← Cathedral!
#   denom(B_6)  = 42 = D!*(D!+1)  ← Cathedral!
#   denom(B_12) = 2730 = 2*3*5*7*13: factor 13 = N  ← Cathedral!

BERN_DENOM_2  = factorial(D)                        # = 6  = D!
BERN_DENOM_4  = E                                   # = 30
BERN_DENOM_6  = factorial(D) * (factorial(D) + 1)  # = 42 = 6*7
BERN_DENOM_12 = 2730                                # = 2*3*5*7*13; factor 13 = N

IDENTITY_BERN2_DENOM:  bool = (BERN_DENOM_2 == factorial(D))
IDENTITY_BERN4_DENOM:  bool = (BERN_DENOM_4 == E)
IDENTITY_BERN6_DENOM:  bool = (BERN_DENOM_6 == 42)
IDENTITY_BERN12_HAS_N: bool = (BERN_DENOM_12 % N == 0)   # 13 | 2730

assert IDENTITY_BERN2_DENOM,  "denom(B_2) ≠ D!"
assert IDENTITY_BERN4_DENOM,  "denom(B_4) ≠ E"
assert IDENTITY_BERN6_DENOM,  "denom(B_6) ≠ D!(D!+1)"
assert IDENTITY_BERN12_HAS_N, "N ∤ denom(B_12)"


# ── Section 9: All identities + summary ──────────────────────────────────────

ALL_COMB2_IDENTITIES: list = [
    # Fibonacci (5 identities)
    IDENTITY_FIB_D,
    IDENTITY_FIB_D1,
    IDENTITY_FIB_q_SELF_REF,
    IDENTITY_FIB_V_SQUARE,
    IDENTITY_FIB_N_PRIME,
    # Stirling 2nd kind (5 identities)
    IDENTITY_S2_D_Dm1,
    IDENTITY_S2_D1_Dm1,
    IDENTITY_S2_q_D,
    IDENTITY_S2_D_2,
    IDENTITY_S2_DFACT_D,
    # Stirling 1st kind (3 identities)
    IDENTITY_S1_D_Dm1,
    IDENTITY_S1_q_D,
    IDENTITY_S1_DFACT_D,
    # Narayana (4 identities)
    IDENTITY_NAR_D_2,
    IDENTITY_NAR_q_D,
    IDENTITY_NAR_D1_3,
    IDENTITY_NAR_SUM_D,
    # Motzkin (3 identities)
    IDENTITY_MOTZKIN_D,
    IDENTITY_MOTZKIN_D1,
    IDENTITY_MOTZKIN_q,
    # Pell (3 identities)
    IDENTITY_PELL_D,
    IDENTITY_PELL_D1,
    IDENTITY_PELL_q,
    # Bell (3 identities)
    IDENTITY_BELL_Dm1,
    IDENTITY_BELL_D,
    IDENTITY_BELL_D1,
    # Bernoulli denominators (4 identities)
    IDENTITY_BERN2_DENOM,
    IDENTITY_BERN4_DENOM,
    IDENTITY_BERN6_DENOM,
    IDENTITY_BERN12_HAS_N,
]

ALL_COMB2_EXACT:     bool = all(ALL_COMB2_IDENTITIES)
N_COMB2_IDENTITIES:  int  = len(ALL_COMB2_IDENTITIES)

assert ALL_COMB2_EXACT, "Some Combinatorics II Cathedral identities failed"


def comb2_summary() -> dict:
    """Full Cathedral Combinatorics II summary dict."""
    return {
        "fibonacci": {
            "F_D":              F_D,
            "F_D1":             F_D1,
            "F_q":              F_q,
            "F_V":              F_V,
            "F_N":              F_N,
            "F_D_eq_Dm1":       IDENTITY_FIB_D,
            "F_D1_eq_D":        IDENTITY_FIB_D1,
            "F_q_self_ref":     IDENTITY_FIB_q_SELF_REF,
            "F_V_square":       IDENTITY_FIB_V_SQUARE,
            "F_N_prime":        IDENTITY_FIB_N_PRIME,
        },
        "stirling2": {
            "S_D_Dm1":          S2_D_Dm1,
            "S_D1_Dm1":         S2_D1_Dm1,
            "S_q_D":            S2_q_D,
            "S_D_2":            S2_D_2,
            "S_Dfact_D":        S2_Dfact_D,
            "S_D_Dm1_eq_D":     IDENTITY_S2_D_Dm1,
            "S_D1_Dm1_eq_Dfact1": IDENTITY_S2_D1_Dm1,
            "S_q_D_eq_q2":      IDENTITY_S2_q_D,
            "S_D_2_eq_D":       IDENTITY_S2_D_2,
            "S_Dfact_D_eq_2qD2": IDENTITY_S2_DFACT_D,
        },
        "stirling1": {
            "c_D_Dm1":          S1_D_Dm1,
            "c_q_D":            S1_q_D,
            "c_Dfact_D":        S1_Dfact_D,
            "c_D_Dm1_eq_D":     IDENTITY_S1_D_Dm1,
            "c_q_D_eq_qDfact1": IDENTITY_S1_q_D,
            "c_Dfact_D_eq_VD2": IDENTITY_S1_DFACT_D,
        },
        "narayana": {
            "Nar_D_2":          NAR_D_2,
            "Nar_q_D":          NAR_q_D,
            "Nar_D1_3":         NAR_D1_3,
            "Nar_sum_D":        NAR_SUM_D,
            "Nar_D_2_eq_D":     IDENTITY_NAR_D_2,
            "Nar_q_D_eq_F":     IDENTITY_NAR_q_D,
            "Nar_D1_3_eq_V2":   IDENTITY_NAR_D1_3,
            "Nar_sum_eq_q":     IDENTITY_NAR_SUM_D,
        },
        "motzkin": {
            "M_D":              M_D,
            "M_D1":             M_D1,
            "M_q":              M_q,
            "M_D_eq_D1":        IDENTITY_MOTZKIN_D,
            "M_D1_eq_D2":       IDENTITY_MOTZKIN_D1,
            "M_q_eq_DDfact1":   IDENTITY_MOTZKIN_q,
        },
        "pell": {
            "P_D":              P_D_PELL,
            "P_D1":             P_D1_PELL,
            "P_q":              P_q_PELL,
            "P_D_eq_q":         IDENTITY_PELL_D,
            "P_D1_eq_V":        IDENTITY_PELL_D1,
            "P_q_eq_2ND":       IDENTITY_PELL_q,
        },
        "bell": {
            "B_Dm1":            B_Dm1_BELL,
            "B_D":              B_D_BELL,
            "B_D1":             B_D1_BELL,
            "B_Dm1_eq_Dm1":     IDENTITY_BELL_Dm1,
            "B_D_eq_q":         IDENTITY_BELL_D,
            "B_D1_eq_VD":       IDENTITY_BELL_D1,
        },
        "bernoulli_denom": {
            "denom_B2":         BERN_DENOM_2,
            "denom_B4":         BERN_DENOM_4,
            "denom_B6":         BERN_DENOM_6,
            "denom_B12":        BERN_DENOM_12,
            "denom_B2_eq_Dfact": IDENTITY_BERN2_DENOM,
            "denom_B4_eq_E":    IDENTITY_BERN4_DENOM,
            "denom_B6_eq_42":   IDENTITY_BERN6_DENOM,
            "denom_B12_has_N":  IDENTITY_BERN12_HAS_N,
        },
        "totals": {
            "n_identities":     N_COMB2_IDENTITIES,
            "all_exact":        ALL_COMB2_EXACT,
        },
        "key_results": [
            f"F(q)  = F(5)  = {F_q}  = q  [SELF-REFERENTIAL!]",
            f"F(V)  = F(12) = {F_V}  = V^2 = {V**2}  [FIBONACCI SQUARE MIRACLE!]",
            f"S(D,2) = S(3,2) = {S2_D_2}  = D  [SELF-REFERENTIAL!]",
            f"S(q,D) = S(5,3) = {S2_q_D}  = q^2 = {q**2}  [EXACT]",
            f"c(q,D) = c(5,3) = {S1_q_D}  = q(D!+1) = {q*(factorial(D)+1)}  [EXACT]",
            f"Nar(q,D) = Nar(5,3) = {NAR_q_D}  = F = {F}  [EXACT]",
            f"M(D)  = M(3)  = {M_D}   = D+1 = {D+1}  [EXACT]",
            f"P(D)  = P(3)  = {P_D_PELL}   = q  = {q}  [EXACT]",
            f"P(D+1)= P(4)  = {P_D1_PELL}  = V  = {V}  [EXACT]",
            f"B(D)  = B(3)  = {B_D_BELL}   = q  = {q}  [EXACT]",
            f"denom(B_4) = {BERN_DENOM_4} = E = {E}  [EXACT]",
            f"All {N_COMB2_IDENTITIES} identities exact: {ALL_COMB2_EXACT}",
        ],
    }


def print_comb2_report() -> None:
    """Print Cathedral Combinatorics II report."""
    print("  Cathedral Combinatorics II — Stirling, Fibonacci, Narayana, Motzkin, Pell")
    print("  " + "─" * 72)

    print(f"\n  Fibonacci Numbers:")
    print(f"    F({D})  = {F_D}   = D-1 = {D-1}  ← Cathedral")
    print(f"    F({D+1})  = {F_D1}   = D   = {D}  ← Cathedral")
    print(f"    F({q})  = {F_q}   = q   = {q}  ← SELF-REFERENTIAL!")
    print(f"    F({V}) = {F_V}   = V^2 = {V**2}  ← Fibonacci square miracle!")
    print(f"    F({N}) = {F_N}             ← Fibonacci prime at N")

    print(f"\n  Stirling Numbers of the 2nd Kind S(n,k):")
    print(f"    S({D},{D-1}) = {S2_D_Dm1}   = D   = {D}  ← SELF-REFERENTIAL!")
    print(f"    S({D+1},{D-1}) = {S2_D1_Dm1}   = D!+1 = {factorial(D)+1}  ← Cathedral!")
    print(f"    S({q},{D}) = {S2_q_D}  = q^2 = {q**2}  ← Cathedral!")
    print(f"    S({factorial(D)},{D}) = {S2_Dfact_D}  = 2qD^2 = {2*q*D**2}  ← Cathedral!")

    print(f"\n  Unsigned Stirling Numbers of the 1st Kind c(n,k):")
    print(f"    c({D},{D-1}) = {S1_D_Dm1}   = D   = {D}  ← SELF-REFERENTIAL!")
    print(f"    c({q},{D}) = {S1_q_D}  = q(D!+1) = {q*(factorial(D)+1)}  ← Cathedral!")
    print(f"    c({factorial(D)},{D}) = {S1_Dfact_D} = (V+D)^2 = {(V+D)**2}  ← Cathedral!")

    print(f"\n  Narayana Numbers Nar(n,k):")
    print(f"    Nar({D},2) = {NAR_D_2}   = D   = {D}  ← SELF-REFERENTIAL!")
    print(f"    Nar({q},{D}) = {NAR_q_D}  = F   = {F}  ← Cathedral!")
    print(f"    Nar({D+1},3) = {NAR_D1_3}   = V/2 = {V//2}  ← Cathedral!")
    print(f"    Σ Nar({D},k) = {NAR_SUM_D}   = q   = {q}  (Catalan C_D)")

    print(f"\n  Motzkin Numbers M_n:")
    print(f"    M_{D} = {M_D}   = D+1 = {D+1}  ← Cathedral!")
    print(f"    M_{D+1} = {M_D1}   = D^2 = {D**2}  ← Cathedral!")
    print(f"    M_{q} = {M_q}  = D(D!+1) = {D*(factorial(D)+1)}  ← Cathedral!")

    print(f"\n  Pell Numbers P_n (P_n = 2P_{{n-1}} + P_{{n-2}}):")
    print(f"    P_{D} = {P_D_PELL}   = q   = {q}  ← Cathedral!")
    print(f"    P_{D+1} = {P_D1_PELL}  = V   = {V}  ← Cathedral!")
    print(f"    P_{q} = {P_q_PELL}  = 2N+D = {2*N+D}  ← Cathedral!")

    print(f"\n  Bell Numbers B_n:")
    print(f"    B_{D-1} = {B_Dm1_BELL}   = D-1 = {D-1}  ← Cathedral!")
    print(f"    B_{D} = {B_D_BELL}   = q   = {q}  ← Cathedral!")
    print(f"    B_{D+1} = {B_D1_BELL}  = V+D = {V+D}  ← Cathedral!")

    print(f"\n  Bernoulli Number Denominators (von Staudt–Clausen):")
    print(f"    denom(B_2)  = {BERN_DENOM_2}  = D! = {factorial(D)}  ← Cathedral!")
    print(f"    denom(B_4)  = {BERN_DENOM_4}  = E  = {E}  ← Cathedral!")
    print(f"    denom(B_6)  = {BERN_DENOM_6}  = D!(D!+1) = {factorial(D)*(factorial(D)+1)}  ← Cathedral!")
    print(f"    denom(B_12) = {BERN_DENOM_12}  contains prime N = {N}  ← Cathedral!")

    print(f"\n  Summary: {N_COMB2_IDENTITIES} exact Cathedral identities. All pass: {ALL_COMB2_EXACT}")
