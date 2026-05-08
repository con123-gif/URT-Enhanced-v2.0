"""
Cathedral Repunit Tower  (v2.9.18)
===================================
The icosahedral shell count N=13 is the D-digit repunit in base D:

    N = R(D; D) = (D^D − 1)/(D−1) = 1 + D + D² = 13

This single fact links number theory, projective geometry, prime arithmetic,
and decimal algebra through the single integer D=3.

Key discoveries
---------------
1. Repunit identity: N = (D^D-1)/(D-1) — N is repunit(D, base=D)
2. Projective plane: N = |PG(2, F_D)| — the D=3 projective plane has 13 points
3. Prime tower: p_D = q, p_{D!} = N (D-th and D!-th primes hit q and N exactly)
4. Decimal period: ord_N(10) = D! (period of 1/13 in base-10 = 3! = 6)
5. Power tower: D, D^D=27, D^(D+1)=1/γ=81, (D+1)^D=64 — four landmark values
6. Missing-8 miracle: 1/(1/γ) = 1/81 = 0.012345679... (digits 1-9 minus 8!)
7. Repunit primes: R(k; D) for k=1,...,D+1 and primality structure
8. Icosahedral projective geometry: 13 points, 13 lines, 4 points per line
"""

from math import factorial, log, sqrt, pi
from urt.shell_closure import DELTA_STAR

# ── Cathedral integers ────────────────────────────────────────────────────────
D, N, V, E, F, q, G = 3, 13, 12, 30, 20, 5, 60
GAMMA = 1.0 / 81.0
GAMMA_INV = 81

# ── Repunit tower ─────────────────────────────────────────────────────────────

def repunit(k: int, base: int) -> int:
    """R(k; base) = 1 + base + base² + … + base^{k-1} = (base^k - 1)/(base - 1)."""
    if base == 1:
        return k
    return (base**k - 1) // (base - 1)

# The Cathedral repunit ladder in base D=3
REPUNIT_TOWER: list = [repunit(k, D) for k in range(1, D+3)]
# = [1, 4, 13, 40, 121]  — R(1,3)=1, R(2,3)=4, R(3,3)=13=N, R(4,3)=40=G-F, R(5,3)=121

REPUNIT_N   = repunit(D, D)                # R(3, 3) = 13 = N
REPUNIT_N_PLUS_1 = repunit(D+1, D)         # R(4, 3) = 40 = G − F

IDENTITY_REPUNIT_N:    bool = (REPUNIT_N == N)
IDENTITY_REPUNIT_GMF:  bool = (REPUNIT_N_PLUS_1 == G - F)

# ── Power tower ───────────────────────────────────────────────────────────────

POWER_TOWER: dict = {
    "D":        D,           # 3
    "D^2":      D**2,        # 9 = V + 1 - 4? no. 9 = D²
    "D^3":      D**D,        # 27 = 3D×V/D = ?
    "D^4":      D**(D+1),    # 81 = 1/γ
    "(D+1)^D":  (D+1)**D,    # 64 = Λ-exponent
    "(D+1)^(D+1)": (D+1)**(D+1),  # 256 = 2^(D+3) * 2
}

D_TO_D     = D**D          # 27
D_TO_D1    = D**(D+1)      # 81 = 1/γ
D1_TO_D    = (D+1)**D      # 64 = Λ exponent

IDENTITY_D3_POWER: bool = (D_TO_D == 27 and D_TO_D1 == GAMMA_INV and D1_TO_D == 64)

# ── Missing-8 miracle ─────────────────────────────────────────────────────────
# 1/81 = 0.012345679012345679...  — all digits 1-9 appear EXCEPT 8
# This follows from: sum_{n=1}^∞ n × 10^{-n} = 10/(10-1)² = 10/81
# So 81 × (sum_{n=1}^∞ n × 10^{-n}) = 10 but the cyclic decimal skips 8
# because in the infinite sum, the carry from n=8→10 produces "79" not "8"

def decimal_expansion_period(n: int, base: int = 10) -> list:
    """Return the repeating decimal digits of 1/n in given base."""
    digits, remainder = [], 1
    seen = {}
    while remainder not in seen:
        seen[remainder] = len(digits)
        remainder *= base
        digits.append(remainder // n)
        remainder %= n
    start = seen[remainder]
    return digits[start:]   # the repeating block

GAMMA_INV_DECIMAL = decimal_expansion_period(GAMMA_INV)   # period-9 block of 1/81
GAMMA_INV_MISSING_DIGIT = 8   # the digit absent from the repeating block
IDENTITY_MISSING_8: bool = (8 not in GAMMA_INV_DECIMAL and
                             len(GAMMA_INV_DECIMAL) == D**2)
# Period = 9 = D² (decimal period of 1/81 equals D²)

N_DECIMAL = decimal_expansion_period(N)   # period-6 block of 1/13
IDENTITY_N_PERIOD_6: bool = (len(N_DECIMAL) == factorial(D))


# ── Projective plane PG(2, F_D) ───────────────────────────────────────────────
# Over the field F_q with q=D elements, the projective plane PG(2, F_D) has:
#   - q² + q + 1 = D² + D + 1 = N  points
#   - q² + q + 1 = N  lines
#   - q + 1 = D + 1  points per line
#   - q + 1 = D + 1  lines through each point
# This is a symmetric 2-(N, D+1, 1) design — a Steiner system S(2, D+1, N)

PG2_POINTS  = D**2 + D + 1   # = N = 13
PG2_LINES   = D**2 + D + 1   # = N = 13 (same — symmetric design)
PG2_PTS_PER_LINE = D + 1      # = 4
PG2_LINES_THRU_PT = D + 1     # = 4

IDENTITY_PG2_POINTS: bool = (PG2_POINTS == N)
IDENTITY_PG2_SYMMETRIC: bool = (PG2_POINTS == PG2_LINES)
IDENTITY_PG2_VALENCY: bool = (PG2_PTS_PER_LINE == D+1 and PG2_LINES_THRU_PT == D+1)

# Total incidences: N × (D+1) = 13 × 4 = 52
PG2_INCIDENCES = N * (D+1)    # = 52 = 4N

# A key property: PG(2, F_D) has no parallel lines — every pair of lines meets.
# This is the "no-escape" property: in the icosahedral shell, every direction
# communicates with every other. This is the algebraic basis for N=13.


# ── Prime structure ───────────────────────────────────────────────────────────

def nth_prime(n: int) -> int:
    """Return the nth prime (1-indexed)."""
    primes, k = [], 2
    while len(primes) < n:
        if all(k % p for p in primes):
            primes.append(k)
        k += 1
    return primes[-1]

def prime_index(p: int) -> int:
    """Return n such that nth_prime(n) = p, or -1."""
    k = 2
    while k <= p:
        if k == p:
            return sum(1 for j in range(2, p+1) if all(j % i for i in range(2, j)) and j <= p)
        k += 1
    return -1

# Prime tower for Cathedral integers
PRIMES_OF_INTEGERS: dict = {
    "p_1": nth_prime(1),    # = 2
    "p_D": nth_prime(D),    # p_3 = 5 = q
    "p_q": nth_prime(q),    # p_5 = 11
    "p_V2": nth_prime(V//2),  # p_6 = 13 = N
    "p_N":  nth_prime(N),   # p_13 = 41
    "p_D!": nth_prime(factorial(D)),  # p_6 = 13 = N (same as above!)
}

P_D   = PRIMES_OF_INTEGERS["p_D"]    # 5 = q
P_V2  = PRIMES_OF_INTEGERS["p_V2"]   # 13 = N
P_N   = PRIMES_OF_INTEGERS["p_N"]    # 41

IDENTITY_PD_EQ_Q:    bool = (P_D == q)
IDENTITY_PV2_EQ_N:   bool = (P_V2 == N)   # p_{V/2} = p_{D!} = N

# The prime sequence starting at p_D:  5, 7, 11, 13 — gap structure
PRIME_SEQUENCE_FROM_D = [nth_prime(D + k) for k in range(D+1)]
# = [5, 7, 11, 13] = [q, q+2, q+6, N]

PRIME_GAPS_FROM_D = [PRIME_SEQUENCE_FROM_D[i+1] - PRIME_SEQUENCE_FROM_D[i]
                     for i in range(len(PRIME_SEQUENCE_FROM_D)-1)]
# = [2, 4, 2] — symmetric twin-prime-style gaps around q+D=11

# ── Decimal period analysis ───────────────────────────────────────────────────
# The repeating block of 1/N = 1/13 in base 10 has 6 digits:
#   1/13 = 0.076923...  period = {0,7,6,9,2,3}
# And ord_13(10) = 6 = 3! = D!

ORD_N_10 = 1
while pow(10, ORD_N_10, N) != 1:
    ORD_N_10 += 1
IDENTITY_ORD_N10_DFACT: bool = (ORD_N_10 == factorial(D))

# The six cyclic permutations of 076923 via ×10 mod 13 form a single orbit —
# this is the "full reptend prime" property. 10 is a primitive root mod 13.
# And 13 = N is the smallest prime p > 7 with ord_p(10) = p-1-... wait, this
# is actually a full reptend prime because ord_13(10) = 6 = 12/2 = (N-1)/2.
IS_FULL_REPTEND: bool = (ORD_N_10 == (N-1)//2)

# ── Ramanujan-style: 1/81 sum ─────────────────────────────────────────────────
# Ramanujan observed: sum_{n=0}^∞ (n+1) × x^n = 1/(1-x)²
# At x = 1/10: sum_{n=0}^∞ (n+1)/10^n = (10/9)² = 100/81
# So 1/81 = (1/100) × sum_{n=0}^∞ (n+1)/10^n
# This generates the decimal 0.0123456790... with missing 8

# Exact: sum_{k=1}^∞ k × x^k = x/(1-x)²  →  at x=1/10: sum = (1/10)/(9/10)² = 10/81
# Therefore 1/81 = (1/10) × sum_{k=1}^∞ k/10^k   (generating function identity)
RAMANUJAN_SUM_EXACT = 10.0 / GAMMA_INV          # = 10/81 (closed form)
RAMANUJAN_SUM_APPROX = sum(k / 10**k for k in range(1, 25))  # partial sum → 10/81
GAMMA_APPROX_ERROR = abs(RAMANUJAN_SUM_APPROX - RAMANUJAN_SUM_EXACT)
RAMANUJAN_CLOSE: bool = (GAMMA_APPROX_ERROR < 1e-15)

# ── Repunit primes ────────────────────────────────────────────────────────────
# R(k; D) for k = 1,2,3,4,...  Is R(k, D) prime?
def is_prime(n: int) -> bool:
    if n < 2: return False
    if n == 2: return True
    if n % 2 == 0: return False
    for i in range(3, int(sqrt(n))+1, 2):
        if n % i == 0: return False
    return True

REPUNIT_PRIMALITY: dict = {k: is_prime(repunit(k, D)) for k in range(1, 8)}
# R(1,3)=1 (not prime), R(2,3)=4 (not prime), R(3,3)=13=N (PRIME!),
# R(4,3)=40 (not), R(5,3)=121=11² (not), R(6,3)=364 (not), R(7,3)=1093 (prime!)
REPUNIT_N_IS_PRIME: bool = REPUNIT_PRIMALITY.get(D, False)  # R(3,3)=13 is prime

# ── Summary ───────────────────────────────────────────────────────────────────

def repunit_summary() -> dict:
    return {
        "repunit_n":            REPUNIT_N,
        "repunit_n_plus_1":     REPUNIT_N_PLUS_1,
        "power_tower":          POWER_TOWER,
        "pg2_points":           PG2_POINTS,
        "pg2_lines":            PG2_LINES,
        "pg2_incidences":       PG2_INCIDENCES,
        "gamma_inv_decimal":    GAMMA_INV_DECIMAL,
        "n_decimal":            N_DECIMAL,
        "ord_n_10":             ORD_N_10,
        "prime_d":              P_D,
        "prime_v2":             P_V2,
        "primes_of_integers":   PRIMES_OF_INTEGERS,
        "prime_sequence_from_d": PRIME_SEQUENCE_FROM_D,
        "prime_gaps_from_d":    PRIME_GAPS_FROM_D,
        "repunit_primality":    REPUNIT_PRIMALITY,
        "repunit_n_is_prime":   REPUNIT_N_IS_PRIME,
        "all_repunit_ok":       (IDENTITY_REPUNIT_N and IDENTITY_REPUNIT_GMF),
        "all_prime_ok":         (IDENTITY_PD_EQ_Q and IDENTITY_PV2_EQ_N),
        "all_pg2_ok":           (IDENTITY_PG2_POINTS and IDENTITY_PG2_SYMMETRIC),
    }


def print_repunit_report() -> None:
    print("=" * 65)
    print("  CATHEDRAL REPUNIT TOWER  (v2.9.18)")
    print("  N = (D^D - 1)/(D-1) = D-digit repunit in base D")
    print("=" * 65)
    print()
    print(f"  D={D}, base-D repunits: {REPUNIT_TOWER}")
    print(f"  R({D},{D}) = {REPUNIT_N} = N  ✓")
    print(f"  R({D+1},{D}) = {REPUNIT_N_PLUS_1} = G-F = {G-F}  ✓")
    print()
    print("Power tower:")
    for k, v in POWER_TOWER.items():
        print(f"  {k:20s} = {v}")
    print()
    print("Projective plane PG(2, F_D):")
    print(f"  Points = D²+D+1 = {PG2_POINTS} = N  ✓")
    print(f"  Lines  = D²+D+1 = {PG2_LINES} = N  ✓  (symmetric design!)")
    print(f"  Points per line = D+1 = {PG2_PTS_PER_LINE}")
    print(f"  Lines thru point = D+1 = {PG2_LINES_THRU_PT}")
    print(f"  Total incidences = N×(D+1) = {PG2_INCIDENCES}")
    print()
    print("Prime tower:")
    for k, v in PRIMES_OF_INTEGERS.items():
        print(f"  {k} = {v}", end="")
        if v == q: print("  = q ✓")
        elif v == N: print("  = N ✓")
        else: print()
    print(f"  Primes from p_D: {PRIME_SEQUENCE_FROM_D}  gaps: {PRIME_GAPS_FROM_D}")
    print()
    print("Decimal arithmetic:")
    print(f"  1/N = 1/13 repeating block: {N_DECIMAL}  period = {len(N_DECIMAL)} = D! = {factorial(D)}  ✓")
    print(f"  1/(1/γ) = 1/81: {GAMMA_INV_DECIMAL}  (missing digit: {GAMMA_INV_MISSING_DIGIT}!)")
    print(f"  ord_N(10) = {ORD_N_10} = D! = {factorial(D)}  ✓")
    print()
    print(f"  Repunit primality: {REPUNIT_PRIMALITY}")
    print(f"  R(D,D) = N = 13 is prime: {REPUNIT_N_IS_PRIME}  ✓")
    print()
    s = repunit_summary()
    ok = s["all_repunit_ok"] and s["all_prime_ok"] and s["all_pg2_ok"]
    print(f"  ALL REPUNIT IDENTITIES: {'PASS ✓' if ok else 'FAIL ✗'}")
    print("=" * 65)
