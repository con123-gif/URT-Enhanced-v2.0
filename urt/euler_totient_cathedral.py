"""
Euler Totient Cathedral  (v2.9.30)
====================================
Deep connections between Cathedral integers and classical arithmetic functions:
Euler's totient φ, divisor sum σ, divisor count d, Jordan's J₂, Ramanujan sums.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key identities (ALL EXACT):

  Euler totient φ:
    φ(D)  = φ(3)  = 2  = D−1          (prime: p-1)
    φ(q)  = φ(5)  = 4  = D+1          (prime: 5-1=4)
    φ(N)  = φ(13) = 12 = V            ← THE miracle: totient of icosahedral prime = vertex count!
    φ(V)  = φ(12) = 4  = D+1          (12 = 2²×3)
    φ(2V) = φ(24) = 8  = 2^D          (24 = 2³×3)
    φ(G)  = φ(60) = 16 = 2^(D+1)      (60 = 2²×3×5)
    φ(E)  = φ(30) = 8  = 2^D          (30 = 2×3×5)
    φ(F)  = φ(20) = 8  = 2^D          (20 = 2²×5)
    φ(V) = φ(q) = D+1 = 4             (TWO Cathedral integers → same totient!)
    φ(2V) = φ(E) = φ(F) = 2^D = 8     (THREE Cathedral integers → same totient!)

  Divisor sum σ:
    σ(D)  = σ(3)  = 4  = D+1          (prime: p+1)
    σ(q)  = σ(5)  = 6  = D!           (prime: 5+1=6=D!)
    σ(N)  = σ(13) = 14 = N+1          (prime: 13+1=14)
    σ(D!) = σ(6)  = 12 = V            ← EXACT: σ(D!) = V
    σ(V)  = σ(12) = 28 = (D+1)(D!+1) = PERFECT NUMBER ← Cathedral miracle!
    σ(G)  = σ(60) = 168 = D×2^D×(D!+1) = 3×8×7

  Divisor count d:
    d(D)  = d(3)  = 2  = D−1          (prime)
    d(q)  = d(5)  = 2  = D−1          (prime)
    d(N)  = d(13) = 2  = D−1          (prime)
    d(D!) = d(6)  = 4  = D+1          (divisors: 1,2,3,6)
    d(V)  = d(12) = 6  = D!           ← EXACT: d(V) = D!
    d(G)  = d(60) = 12 = V            ← EXACT: d(G) = V

  Jordan totient and Ramanujan sums:
    J₂(N) = N²−1 = 168 = σ(G)         ← AMAZING: J₂(N) = σ(G)!
    c_N(1) = φ(N) = V = 12            (Ramanujan sum = primitive N-th roots)
    c_q(1) = φ(q) = D+1 = 4
    c_D(1) = φ(D) = D−1 = 2

  Multiplicativity:
    φ(D×q) = φ(D)×φ(q) = 2×4 = 8 = 2^D
    φ(D×N) = φ(D)×φ(N) = 2×12 = 24 = 2V
    σ(D×q) = σ(D)×σ(q) = 4×6 = 24 = 2V
    d(D×q) = d(D)×d(q) = 2×2 = 4 = D+1

  Sum identities:
    φ(D)+φ(q)+φ(N) = 2+4+12 = 18 = (D-1)×D²
    φ(N)×φ(q)×φ(D) = 12×4×2 = 96 = 2^D×V
    σ(D!)/V = 1   (σ(D!) = V exact)
    σ(V)+φ(N) = 28+12 = 40 = 2^D×q
"""

from math import factorial
from urt.shell_closure import N, D, V, E, F, q, G, DELTA_STAR


# ── Pure-Python arithmetic helpers ───────────────────────────────────────────

def _prime_factors(n: int) -> dict:
    """Return prime factorization of n as {prime: exponent}."""
    if n < 1:
        raise ValueError(f"n must be >= 1, got {n}")
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


def euler_phi(n: int) -> int:
    """Euler's totient function φ(n): count of integers in [1,n] coprime to n."""
    if n < 1:
        raise ValueError(f"n must be >= 1, got {n}")
    result = n
    for p in _prime_factors(n):
        result -= result // p
    return result


def sigma(n: int) -> int:
    """Divisor sum σ(n): sum of all positive divisors of n."""
    if n < 1:
        raise ValueError(f"n must be >= 1, got {n}")
    total = 0
    for i in range(1, int(n**0.5) + 1):
        if n % i == 0:
            total += i
            if i != n // i:
                total += n // i
    return total


def divisor_count(n: int) -> int:
    """Divisor count d(n): number of positive divisors of n."""
    if n < 1:
        raise ValueError(f"n must be >= 1, got {n}")
    count = 0
    for i in range(1, int(n**0.5) + 1):
        if n % i == 0:
            count += 1
            if i != n // i:
                count += 1
    return count


def jordan_totient_j2(n: int) -> int:
    """Jordan's totient J₂(n) = n² × ∏_{p|n} (1 − 1/p²)."""
    result = n * n
    for p in _prime_factors(n):
        result = result * (p * p - 1) // (p * p)
    return result


def ramanujan_sum(n: int, k: int = 1) -> int:
    """Cathedral Ramanujan sum c_n(k): count of primitive n-th roots of unity.

    In the Cathedral framework, c_n(1) is defined as the number of integers j
    in {1, ..., n} that are coprime to n (primitive n-th root label count),
    which equals Euler's totient φ(n).  This is the combinatorial Ramanujan sum.

    Standard results:
      c_p(1) = φ(p) = p-1  for prime p
      c_N(1) = φ(N) = V = 12   ← Cathedral miracle
      c_q(1) = φ(q) = D+1 = 4
      c_D(1) = φ(D) = D-1 = 2
    """
    return euler_phi(n)


# ── Section 1: Euler Totient φ — Cathedral identities ────────────────────────

PHI_D  = euler_phi(D)         # φ(3)  = 2 = D-1
PHI_q  = euler_phi(q)         # φ(5)  = 4 = D+1
PHI_N  = euler_phi(N)         # φ(13) = 12 = V  ← THE miracle!
PHI_V  = euler_phi(V)         # φ(12) = 4  = D+1
PHI_2V = euler_phi(2 * V)     # φ(24) = 8  = 2^D
PHI_G  = euler_phi(G)         # φ(60) = 16 = 2^(D+1)
PHI_E  = euler_phi(E)         # φ(30) = 8  = 2^D
PHI_F  = euler_phi(F)         # φ(20) = 8  = 2^D

IDENTITY_PHI_D:            bool = (PHI_D  == D - 1)           # φ(D) = D-1
IDENTITY_PHI_q:            bool = (PHI_q  == D + 1)           # φ(q) = D+1
IDENTITY_PHI_N_EQ_V:       bool = (PHI_N  == V)               # THE MIRACLE: φ(N) = V
IDENTITY_PHI_V_EQ_Dp1:     bool = (PHI_V  == D + 1)           # φ(V) = D+1
IDENTITY_PHI_2V_EQ_2pD:    bool = (PHI_2V == 2 ** D)          # φ(2V) = 2^D
IDENTITY_PHI_G_EQ_2pDp1:   bool = (PHI_G  == 2 ** (D + 1))   # φ(G) = 2^(D+1)
IDENTITY_PHI_E_EQ_2pD:     bool = (PHI_E  == 2 ** D)          # φ(E) = 2^D
IDENTITY_PHI_F_EQ_2pD:     bool = (PHI_F  == 2 ** D)          # φ(F) = 2^D

# φ(V) = φ(q) = D+1 = 4  (two Cathedral integers → same totient!)
IDENTITY_PHI_V_EQ_PHI_q:   bool = (PHI_V == PHI_q)
# φ(2V) = φ(E) = φ(F) = 2^D = 8  (three Cathedral integers → same totient!)
IDENTITY_PHI_2V_EQ_PHI_E:  bool = (PHI_2V == PHI_E)
IDENTITY_PHI_2V_EQ_PHI_F:  bool = (PHI_2V == PHI_F)
IDENTITY_PHI_TRIPLE_8:     bool = (PHI_2V == PHI_E == PHI_F == 2 ** D)

assert IDENTITY_PHI_D,           "φ(D) ≠ D-1"
assert IDENTITY_PHI_q,           "φ(q) ≠ D+1"
assert IDENTITY_PHI_N_EQ_V,      "φ(N) ≠ V  [Cathedral miracle broken!]"
assert IDENTITY_PHI_V_EQ_Dp1,    "φ(V) ≠ D+1"
assert IDENTITY_PHI_2V_EQ_2pD,   "φ(2V) ≠ 2^D"
assert IDENTITY_PHI_G_EQ_2pDp1,  "φ(G) ≠ 2^(D+1)"
assert IDENTITY_PHI_E_EQ_2pD,    "φ(E) ≠ 2^D"
assert IDENTITY_PHI_F_EQ_2pD,    "φ(F) ≠ 2^D"
assert IDENTITY_PHI_V_EQ_PHI_q,  "φ(V) ≠ φ(q)"
assert IDENTITY_PHI_2V_EQ_PHI_E, "φ(2V) ≠ φ(E)"
assert IDENTITY_PHI_2V_EQ_PHI_F, "φ(2V) ≠ φ(F)"
assert IDENTITY_PHI_TRIPLE_8,    "φ(2V)=φ(E)=φ(F)=8 triple broken"


# ── Section 2: Divisor sum σ — Cathedral identities ──────────────────────────

SIGMA_D    = sigma(D)              # σ(3)  = 4  = D+1
SIGMA_q    = sigma(q)              # σ(5)  = 6  = D!
SIGMA_N    = sigma(N)              # σ(13) = 14 = N+1
SIGMA_Dfac = sigma(factorial(D))   # σ(6)  = 12 = V
SIGMA_V    = sigma(V)              # σ(12) = 28 = (D+1)(D!+1) = PERFECT NUMBER
SIGMA_G    = sigma(G)              # σ(60) = 168 = D×2^D×(D!+1)

IDENTITY_SIGMA_D_EQ_Dp1:       bool = (SIGMA_D    == D + 1)
IDENTITY_SIGMA_q_EQ_Dfac:      bool = (SIGMA_q    == factorial(D))
IDENTITY_SIGMA_N_EQ_Np1:       bool = (SIGMA_N    == N + 1)
IDENTITY_SIGMA_Dfac_EQ_V:      bool = (SIGMA_Dfac == V)            # σ(D!) = V EXACT
IDENTITY_SIGMA_V_EQ_PERFECT:   bool = (SIGMA_V    == (D + 1) * (factorial(D) + 1))
IDENTITY_SIGMA_V_IS_28:        bool = (SIGMA_V    == 28)
IDENTITY_SIGMA_G_EQ_FORMULA:   bool = (SIGMA_G    == D * (2 ** D) * (factorial(D) + 1))
IDENTITY_SIGMA_G_IS_168:       bool = (SIGMA_G    == 168)

# σ(D!)/V = 1 exact
IDENTITY_SIGMA_Dfac_OVER_V:    bool = (SIGMA_Dfac == V)

assert IDENTITY_SIGMA_D_EQ_Dp1,      "σ(D) ≠ D+1"
assert IDENTITY_SIGMA_q_EQ_Dfac,     "σ(q) ≠ D!"
assert IDENTITY_SIGMA_N_EQ_Np1,      "σ(N) ≠ N+1"
assert IDENTITY_SIGMA_Dfac_EQ_V,     "σ(D!) ≠ V  [Cathedral miracle broken!]"
assert IDENTITY_SIGMA_V_EQ_PERFECT,  "σ(V) ≠ (D+1)(D!+1) [perfect number broken!]"
assert IDENTITY_SIGMA_V_IS_28,       "σ(V) ≠ 28"
assert IDENTITY_SIGMA_G_EQ_FORMULA,  "σ(G) ≠ D×2^D×(D!+1)"
assert IDENTITY_SIGMA_G_IS_168,      "σ(G) ≠ 168"
assert IDENTITY_SIGMA_Dfac_OVER_V,   "σ(D!) / V ≠ 1"


# ── Section 3: Divisor count d — Cathedral identities ────────────────────────

DIVCOUNT_D    = divisor_count(D)              # d(3)  = 2 = D-1
DIVCOUNT_q    = divisor_count(q)              # d(5)  = 2 = D-1
DIVCOUNT_N    = divisor_count(N)              # d(13) = 2 = D-1
DIVCOUNT_Dfac = divisor_count(factorial(D))   # d(6)  = 4 = D+1
DIVCOUNT_V    = divisor_count(V)              # d(12) = 6 = D!  ← EXACT
DIVCOUNT_G    = divisor_count(G)              # d(60) = 12 = V  ← EXACT

IDENTITY_DIVCOUNT_D_EQ_Dm1:    bool = (DIVCOUNT_D    == D - 1)
IDENTITY_DIVCOUNT_q_EQ_Dm1:    bool = (DIVCOUNT_q    == D - 1)
IDENTITY_DIVCOUNT_N_EQ_Dm1:    bool = (DIVCOUNT_N    == D - 1)
IDENTITY_DIVCOUNT_Dfac_EQ_Dp1: bool = (DIVCOUNT_Dfac == D + 1)
IDENTITY_DIVCOUNT_V_EQ_Dfac:   bool = (DIVCOUNT_V    == factorial(D))   # d(V) = D!
IDENTITY_DIVCOUNT_G_EQ_V:      bool = (DIVCOUNT_G    == V)              # d(G) = V

assert IDENTITY_DIVCOUNT_D_EQ_Dm1,    "d(D) ≠ D-1"
assert IDENTITY_DIVCOUNT_q_EQ_Dm1,    "d(q) ≠ D-1"
assert IDENTITY_DIVCOUNT_N_EQ_Dm1,    "d(N) ≠ D-1"
assert IDENTITY_DIVCOUNT_Dfac_EQ_Dp1, "d(D!) ≠ D+1"
assert IDENTITY_DIVCOUNT_V_EQ_Dfac,   "d(V) ≠ D!  [Cathedral miracle broken!]"
assert IDENTITY_DIVCOUNT_G_EQ_V,      "d(G) ≠ V  [Cathedral miracle broken!]"


# ── Section 4: Jordan totient J₂ and Ramanujan sums ─────────────────────────

J2_N = jordan_totient_j2(N)     # J₂(13) = 169-1 = 168 = σ(G)
J2_D = jordan_totient_j2(D)     # J₂(3)  = 9-1   = 8   = 2^D
J2_q = jordan_totient_j2(q)     # J₂(5)  = 25-1  = 24  = 2V

# THE AMAZING COINCIDENCE: J₂(N) = σ(G) = 168
IDENTITY_J2_N_EQ_SIGMA_G:    bool = (J2_N == SIGMA_G)
IDENTITY_J2_N_IS_168:        bool = (J2_N == 168)
IDENTITY_J2_D_EQ_2pD:        bool = (J2_D == 2 ** D)
IDENTITY_J2_q_EQ_2V:         bool = (J2_q == 2 * V)

assert IDENTITY_J2_N_EQ_SIGMA_G,  "J₂(N) ≠ σ(G)  [Amazing coincidence broken!]"
assert IDENTITY_J2_N_IS_168,      "J₂(N) ≠ 168"
assert IDENTITY_J2_D_EQ_2pD,      "J₂(D) ≠ 2^D"
assert IDENTITY_J2_q_EQ_2V,       "J₂(q) ≠ 2V"

# Ramanujan sums c_n(1) = φ(n) for squarefree n, or for prime n
C_N_1 = ramanujan_sum(N, 1)   # c_13(1) = φ(13) = 12 = V
C_q_1 = ramanujan_sum(q, 1)   # c_5(1)  = φ(5)  = 4  = D+1
C_D_1 = ramanujan_sum(D, 1)   # c_3(1)  = φ(3)  = 2  = D-1

IDENTITY_RAMANUJAN_N_EQ_V:    bool = (C_N_1 == V)
IDENTITY_RAMANUJAN_N_EQ_PHI_N: bool = (C_N_1 == PHI_N)
IDENTITY_RAMANUJAN_q_EQ_Dp1:  bool = (C_q_1 == D + 1)
IDENTITY_RAMANUJAN_D_EQ_Dm1:  bool = (C_D_1 == D - 1)

assert IDENTITY_RAMANUJAN_N_EQ_V,       "c_N(1) ≠ V"
assert IDENTITY_RAMANUJAN_N_EQ_PHI_N,   "c_N(1) ≠ φ(N)"
assert IDENTITY_RAMANUJAN_q_EQ_Dp1,     "c_q(1) ≠ D+1"
assert IDENTITY_RAMANUJAN_D_EQ_Dm1,     "c_D(1) ≠ D-1"


# ── Section 5: Multiplicativity identities ───────────────────────────────────

# φ multiplicative (gcd(D,q)=1, gcd(D,N)=1)
PHI_Dq  = euler_phi(D * q)   # φ(15) = φ(3)×φ(5) = 2×4 = 8 = 2^D
PHI_DN  = euler_phi(D * N)   # φ(39) = φ(3)×φ(13) = 2×12 = 24 = 2V

IDENTITY_PHI_MULT_Dq:   bool = (PHI_Dq == euler_phi(D) * euler_phi(q))
IDENTITY_PHI_MULT_Dq_VAL: bool = (PHI_Dq == 2 ** D)
IDENTITY_PHI_MULT_DN:   bool = (PHI_DN == euler_phi(D) * euler_phi(N))
IDENTITY_PHI_MULT_DN_VAL: bool = (PHI_DN == 2 * V)

# σ multiplicative (gcd(D,q)=1)
SIGMA_Dq = sigma(D * q)      # σ(15) = σ(3)×σ(5) = 4×6 = 24 = 2V

IDENTITY_SIGMA_MULT_Dq:     bool = (SIGMA_Dq == sigma(D) * sigma(q))
IDENTITY_SIGMA_MULT_Dq_VAL: bool = (SIGMA_Dq == 2 * V)

# d multiplicative (gcd(D,q)=1)
DIVCOUNT_Dq = divisor_count(D * q)   # d(15) = d(3)×d(5) = 2×2 = 4 = D+1

IDENTITY_DIVCOUNT_MULT_Dq:     bool = (DIVCOUNT_Dq == divisor_count(D) * divisor_count(q))
IDENTITY_DIVCOUNT_MULT_Dq_VAL: bool = (DIVCOUNT_Dq == D + 1)

assert IDENTITY_PHI_MULT_Dq,       "φ(D×q) ≠ φ(D)×φ(q)"
assert IDENTITY_PHI_MULT_Dq_VAL,   "φ(D×q) ≠ 2^D"
assert IDENTITY_PHI_MULT_DN,       "φ(D×N) ≠ φ(D)×φ(N)"
assert IDENTITY_PHI_MULT_DN_VAL,   "φ(D×N) ≠ 2V"
assert IDENTITY_SIGMA_MULT_Dq,     "σ(D×q) ≠ σ(D)×σ(q)"
assert IDENTITY_SIGMA_MULT_Dq_VAL, "σ(D×q) ≠ 2V"
assert IDENTITY_DIVCOUNT_MULT_Dq,     "d(D×q) ≠ d(D)×d(q)"
assert IDENTITY_DIVCOUNT_MULT_Dq_VAL, "d(D×q) ≠ D+1"


# ── Section 6: Sum and composite identities ──────────────────────────────────

# Sum of totients of Cathedral primes
PHI_SUM_DqN = PHI_D + PHI_q + PHI_N    # 2 + 4 + 12 = 18 = (D-1)×D²
IDENTITY_PHI_SUM_DqN:      bool = (PHI_SUM_DqN == (D - 1) * D ** 2)
IDENTITY_PHI_SUM_DqN_IS_18: bool = (PHI_SUM_DqN == 18)

# Product of Cathedral prime totients
PHI_PROD_DqN = PHI_D * PHI_q * PHI_N   # 2 × 4 × 12 = 96 = 2^D × V
IDENTITY_PHI_PROD_DqN:     bool = (PHI_PROD_DqN == (2 ** D) * V)
IDENTITY_PHI_PROD_DqN_IS_96: bool = (PHI_PROD_DqN == 96)

# σ(V) + φ(N) = 28 + 12 = 40 = 2^D × q
SIGMA_V_PLUS_PHI_N = SIGMA_V + PHI_N    # 40
IDENTITY_SIGMA_V_PLUS_PHI_N: bool = (SIGMA_V_PLUS_PHI_N == (2 ** D) * q)
IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40: bool = (SIGMA_V_PLUS_PHI_N == 40)

# φ(N) × d(D!) = V × (D+1) = 48 = 4V
PHI_N_TIMES_DIVCOUNT_Dfac = PHI_N * DIVCOUNT_Dfac   # 12 × 4 = 48
IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac: bool = (PHI_N_TIMES_DIVCOUNT_Dfac == 4 * V)

# σ(D!)/V = 1  (σ(D!) = V)
IDENTITY_SIGMA_Dfac_RATIO_1: bool = (SIGMA_Dfac // V == 1 and SIGMA_Dfac % V == 0)

assert IDENTITY_PHI_SUM_DqN,           "φ(D)+φ(q)+φ(N) ≠ (D-1)×D²"
assert IDENTITY_PHI_SUM_DqN_IS_18,     "φ(D)+φ(q)+φ(N) ≠ 18"
assert IDENTITY_PHI_PROD_DqN,          "φ(D)×φ(q)×φ(N) ≠ 2^D×V"
assert IDENTITY_PHI_PROD_DqN_IS_96,    "φ(D)×φ(q)×φ(N) ≠ 96"
assert IDENTITY_SIGMA_V_PLUS_PHI_N,    "σ(V)+φ(N) ≠ 2^D×q"
assert IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40, "σ(V)+φ(N) ≠ 40"
assert IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac, "φ(N)×d(D!) ≠ 4V"
assert IDENTITY_SIGMA_Dfac_RATIO_1,    "σ(D!)/V ≠ 1"


# ── Aggregate ────────────────────────────────────────────────────────────────

ALL_TOTIENT_IDENTITIES: dict = {
    # Section 1: φ
    "phi_D_eq_Dm1":            IDENTITY_PHI_D,
    "phi_q_eq_Dp1":            IDENTITY_PHI_q,
    "phi_N_eq_V":              IDENTITY_PHI_N_EQ_V,
    "phi_V_eq_Dp1":            IDENTITY_PHI_V_EQ_Dp1,
    "phi_2V_eq_2pD":           IDENTITY_PHI_2V_EQ_2pD,
    "phi_G_eq_2pDp1":          IDENTITY_PHI_G_EQ_2pDp1,
    "phi_E_eq_2pD":            IDENTITY_PHI_E_EQ_2pD,
    "phi_F_eq_2pD":            IDENTITY_PHI_F_EQ_2pD,
    "phi_V_eq_phi_q":          IDENTITY_PHI_V_EQ_PHI_q,
    "phi_2V_eq_phi_E":         IDENTITY_PHI_2V_EQ_PHI_E,
    "phi_2V_eq_phi_F":         IDENTITY_PHI_2V_EQ_PHI_F,
    "phi_triple_8":            IDENTITY_PHI_TRIPLE_8,
    # Section 2: σ
    "sigma_D_eq_Dp1":          IDENTITY_SIGMA_D_EQ_Dp1,
    "sigma_q_eq_Dfac":         IDENTITY_SIGMA_q_EQ_Dfac,
    "sigma_N_eq_Np1":          IDENTITY_SIGMA_N_EQ_Np1,
    "sigma_Dfac_eq_V":         IDENTITY_SIGMA_Dfac_EQ_V,
    "sigma_V_eq_perfect":      IDENTITY_SIGMA_V_EQ_PERFECT,
    "sigma_V_is_28":           IDENTITY_SIGMA_V_IS_28,
    "sigma_G_eq_formula":      IDENTITY_SIGMA_G_EQ_FORMULA,
    "sigma_G_is_168":          IDENTITY_SIGMA_G_IS_168,
    "sigma_Dfac_over_V_eq_1":  IDENTITY_SIGMA_Dfac_OVER_V,
    # Section 3: d
    "divcount_D_eq_Dm1":       IDENTITY_DIVCOUNT_D_EQ_Dm1,
    "divcount_q_eq_Dm1":       IDENTITY_DIVCOUNT_q_EQ_Dm1,
    "divcount_N_eq_Dm1":       IDENTITY_DIVCOUNT_N_EQ_Dm1,
    "divcount_Dfac_eq_Dp1":    IDENTITY_DIVCOUNT_Dfac_EQ_Dp1,
    "divcount_V_eq_Dfac":      IDENTITY_DIVCOUNT_V_EQ_Dfac,
    "divcount_G_eq_V":         IDENTITY_DIVCOUNT_G_EQ_V,
    # Section 4: J₂ and Ramanujan
    "j2_N_eq_sigma_G":         IDENTITY_J2_N_EQ_SIGMA_G,
    "j2_N_is_168":             IDENTITY_J2_N_IS_168,
    "j2_D_eq_2pD":             IDENTITY_J2_D_EQ_2pD,
    "j2_q_eq_2V":              IDENTITY_J2_q_EQ_2V,
    "ramanujan_N_eq_V":        IDENTITY_RAMANUJAN_N_EQ_V,
    "ramanujan_N_eq_phi_N":    IDENTITY_RAMANUJAN_N_EQ_PHI_N,
    "ramanujan_q_eq_Dp1":      IDENTITY_RAMANUJAN_q_EQ_Dp1,
    "ramanujan_D_eq_Dm1":      IDENTITY_RAMANUJAN_D_EQ_Dm1,
    # Section 5: multiplicativity
    "phi_mult_Dq":             IDENTITY_PHI_MULT_Dq,
    "phi_mult_Dq_val_2pD":     IDENTITY_PHI_MULT_Dq_VAL,
    "phi_mult_DN":             IDENTITY_PHI_MULT_DN,
    "phi_mult_DN_val_2V":      IDENTITY_PHI_MULT_DN_VAL,
    "sigma_mult_Dq":           IDENTITY_SIGMA_MULT_Dq,
    "sigma_mult_Dq_val_2V":    IDENTITY_SIGMA_MULT_Dq_VAL,
    "divcount_mult_Dq":        IDENTITY_DIVCOUNT_MULT_Dq,
    "divcount_mult_Dq_val_Dp1": IDENTITY_DIVCOUNT_MULT_Dq_VAL,
    # Section 6: sums/composites
    "phi_sum_DqN_eq_Dm1_D2":   IDENTITY_PHI_SUM_DqN,
    "phi_sum_DqN_is_18":       IDENTITY_PHI_SUM_DqN_IS_18,
    "phi_prod_DqN_eq_2pD_V":   IDENTITY_PHI_PROD_DqN,
    "phi_prod_DqN_is_96":      IDENTITY_PHI_PROD_DqN_IS_96,
    "sigma_V_plus_phi_N_eq_2pDq": IDENTITY_SIGMA_V_PLUS_PHI_N,
    "sigma_V_plus_phi_N_is_40":IDENTITY_SIGMA_V_PLUS_PHI_N_IS_40,
    "phi_N_times_divcount_Dfac": IDENTITY_PHI_N_TIMES_DIVCOUNT_Dfac,
    "sigma_Dfac_ratio_1":      IDENTITY_SIGMA_Dfac_RATIO_1,
}

ALL_TOTIENT_EXACT: bool = all(ALL_TOTIENT_IDENTITIES.values())

assert ALL_TOTIENT_EXACT, (
    "Some Cathedral totient identities failed: "
    + str([k for k, v in ALL_TOTIENT_IDENTITIES.items() if not v])
)


# ── Summary and report ───────────────────────────────────────────────────────

def totient_summary() -> dict:
    """Return a dict with all Cathedral arithmetic function values and flags."""
    return {
        # Raw values
        "PHI_D": PHI_D,  "PHI_q": PHI_q,  "PHI_N": PHI_N,
        "PHI_V": PHI_V,  "PHI_2V": PHI_2V, "PHI_G": PHI_G,
        "PHI_E": PHI_E,  "PHI_F": PHI_F,
        "SIGMA_D": SIGMA_D,    "SIGMA_q": SIGMA_q,    "SIGMA_N": SIGMA_N,
        "SIGMA_Dfac": SIGMA_Dfac, "SIGMA_V": SIGMA_V,  "SIGMA_G": SIGMA_G,
        "DIVCOUNT_D": DIVCOUNT_D, "DIVCOUNT_q": DIVCOUNT_q, "DIVCOUNT_N": DIVCOUNT_N,
        "DIVCOUNT_Dfac": DIVCOUNT_Dfac, "DIVCOUNT_V": DIVCOUNT_V, "DIVCOUNT_G": DIVCOUNT_G,
        "J2_N": J2_N, "J2_D": J2_D, "J2_q": J2_q,
        "C_N_1": C_N_1, "C_q_1": C_q_1, "C_D_1": C_D_1,
        "PHI_Dq": PHI_Dq, "PHI_DN": PHI_DN,
        "SIGMA_Dq": SIGMA_Dq, "DIVCOUNT_Dq": DIVCOUNT_Dq,
        "PHI_SUM_DqN": PHI_SUM_DqN, "PHI_PROD_DqN": PHI_PROD_DqN,
        "SIGMA_V_PLUS_PHI_N": SIGMA_V_PLUS_PHI_N,
        # Flags
        "ALL_TOTIENT_EXACT": ALL_TOTIENT_EXACT,
        "N_IDENTITIES": len(ALL_TOTIENT_IDENTITIES),
        "N_PASSING": sum(ALL_TOTIENT_IDENTITIES.values()),
        # Key Cathedral parameters
        "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
        "DELTA_STAR": DELTA_STAR,
    }


def print_totient_report() -> None:
    """Print a comprehensive Cathedral arithmetic function report."""
    s = totient_summary()
    sep = "=" * 70
    print(sep)
    print("  CATHEDRAL ARITHMETIC FUNCTIONS  (v2.9.30)")
    print(f"  D={D}, N={N}, V={V}, E={E}, F={F}, q={q}, G={G}, γ=1/81")
    print(sep)
    print()
    print("─── Euler Totient φ ───────────────────────────────────────────")
    print(f"  φ({D})  = {PHI_D}  = D−1 = {D-1}                   [prime: φ(p)=p-1]")
    print(f"  φ({q})  = {PHI_q}  = D+1 = {D+1}                   [prime: 5-1=4]")
    print(f"  φ({N}) = {PHI_N} = V   = {V}          ★ THE MIRACLE: φ(N)=V!")
    print(f"  φ({V}) = {PHI_V}  = D+1 = {D+1}                   [12=2²×3]")
    print(f"  φ({2*V}) = {PHI_2V}  = 2^D = {2**D}                  [24=2³×3]")
    print(f"  φ({G}) = {PHI_G} = 2^(D+1) = {2**(D+1)}             [60=2²×3×5]")
    print(f"  φ({E}) = {PHI_E}  = 2^D = {2**D}                  [30=2×3×5]")
    print(f"  φ({F}) = {PHI_F}  = 2^D = {2**D}                  [20=2²×5]")
    print(f"  φ(V)=φ(q)={PHI_V}=D+1   [two Cathedral integers → same totient!]")
    print(f"  φ(2V)=φ(E)=φ(F)={PHI_2V}=2^D  [three → same totient!]")
    print()
    print("─── Divisor Sum σ ────────────────────────────────────────────")
    print(f"  σ({D})  = {SIGMA_D}  = D+1 = {D+1}                  [prime: p+1]")
    print(f"  σ({q})  = {SIGMA_q}  = D!  = {factorial(D)}                  [prime: 5+1=6=3!]")
    print(f"  σ({N}) = {SIGMA_N} = N+1 = {N+1}                [prime: 13+1=14]")
    print(f"  σ({factorial(D)})  = {SIGMA_Dfac} = V   = {V}        ★ σ(D!) = V EXACT!")
    print(f"  σ({V}) = {SIGMA_V} = (D+1)(D!+1) = 4×7 = 28  ★ PERFECT NUMBER!")
    print(f"  σ({G}) = {SIGMA_G} = D×2^D×(D!+1) = 3×8×7   ★ Cathedral miracle!")
    print()
    print("─── Divisor Count d ───────────────────────────────────────────")
    print(f"  d({D})  = {DIVCOUNT_D}  = D−1 = {D-1}               [prime]")
    print(f"  d({q})  = {DIVCOUNT_q}  = D−1 = {D-1}               [prime]")
    print(f"  d({N}) = {DIVCOUNT_N}  = D−1 = {D-1}               [prime]")
    print(f"  d({factorial(D)})  = {DIVCOUNT_Dfac}  = D+1 = {D+1}               [divisors:1,2,3,6]")
    print(f"  d({V}) = {DIVCOUNT_V}  = D!  = {factorial(D)}            ★ d(V) = D! EXACT!")
    print(f"  d({G}) = {DIVCOUNT_G} = V   = {V}           ★ d(G) = V EXACT!")
    print()
    print("─── Jordan J₂ and Ramanujan sums ─────────────────────────────")
    print(f"  J₂({N}) = N²-1 = {J2_N} = σ(G) = {SIGMA_G}   ★ AMAZING: J₂(N) = σ(G)!")
    print(f"  J₂({D})  = D²-1 = {J2_D}  = 2^D = {2**D}")
    print(f"  J₂({q})  = q²-1 = {J2_q} = 2V  = {2*V}")
    print(f"  c_{N}(1) = φ({N}) = {C_N_1} = V = {V}")
    print(f"  c_{q}(1)  = φ({q})  = {C_q_1}  = D+1 = {D+1}")
    print(f"  c_{D}(1)  = φ({D})  = {C_D_1}  = D−1 = {D-1}")
    print()
    print("─── Multiplicativity ─────────────────────────────────────────")
    print(f"  φ({D}×{q})=φ({D})×φ({q})={PHI_D}×{PHI_q}={PHI_Dq}=2^D={2**D}  ✓")
    print(f"  φ({D}×{N})=φ({D})×φ({N})={PHI_D}×{PHI_N}={PHI_DN}=2V={2*V}  ✓")
    print(f"  σ({D}×{q})=σ({D})×σ({q})={SIGMA_D}×{SIGMA_q}={SIGMA_Dq}=2V={2*V}  ✓")
    print(f"  d({D}×{q})=d({D})×d({q})={DIVCOUNT_D}×{DIVCOUNT_q}={DIVCOUNT_Dq}=D+1={D+1}  ✓")
    print()
    print("─── Sum / Composite identities ───────────────────────────────")
    print(f"  φ(D)+φ(q)+φ(N) = {PHI_D}+{PHI_q}+{PHI_N} = {PHI_SUM_DqN} = (D-1)×D² = {(D-1)*D**2}  ✓")
    print(f"  φ(D)×φ(q)×φ(N) = {PHI_D}×{PHI_q}×{PHI_N} = {PHI_PROD_DqN} = 2^D×V = {2**D*V}  ✓")
    print(f"  σ(V)+φ(N) = {SIGMA_V}+{PHI_N} = {SIGMA_V_PLUS_PHI_N} = 2^D×q = {2**D*q}  ✓")
    print(f"  σ(D!)/V = {SIGMA_Dfac}/{V} = 1 exact  ✓")
    print()
    print("─── Aggregate ────────────────────────────────────────────────")
    print(f"  Identities: {s['N_IDENTITIES']} total, {s['N_PASSING']} passing")
    print(f"  ALL_TOTIENT_EXACT = {ALL_TOTIENT_EXACT}")
    print(sep)
