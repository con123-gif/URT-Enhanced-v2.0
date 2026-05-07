"""
Cathedral Number Theory — Primes, Mersenne, Fibonacci, Ramanujan

The Cathedral integers {D=3, N=13, q=5, V=12, G=60, γ=1/81} appear
in several remarkable number-theoretic identities:

  M_N = 2^13 − 1 = 8191 is a Mersenne prime                       EXACT
  τ(2) = −24 = −2V  (Ramanujan tau at 2 = −2 × icosahedral vertices) EXACT
  C_D = C_3 = 5 = q  (3rd Catalan number = Cathedral q)              EXACT
  F_7 = 13 = N       (7th Fibonacci number = icosahedral sites)       EXACT
  QR mod 13: exactly (N−1)/2 = 6 quadratic residues                  EXACT
  T_N = 13×14/2 = 91 = 7×13  (triangular number T_13)                EXACT
  |QR_13| = (N-1)/2 = 6  (Euler's criterion, number of QRs mod prime) EXACT

Ramanujan tau connection:
  τ(2) = −24 = −2V  where V=12 = icosahedral vertex count (without hub).
  This is a precise numerical fact; the *reason* it equals −2V is
  numerological — no Cathedral derivation of the Ramanujan tau function
  is claimed.

All connections labelled EXACT are arithmetically verified.
Connections labelled SPECULATIVE or APPROXIMATE require external justification.
"""

from math import gcd, log, sqrt, isqrt
from .shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V, E

# ── Fibonacci sequence F_1 … F_20 ────────────────────────────────────────────
# 1-based indexing: FIBONACCI[k] = F_k
FIBONACCI = [
    0,           # placeholder for 0-index
    1, 1, 2, 3, 5, 8, 13, 21, 34, 55,      # F_1 … F_10
    89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765,  # F_11 … F_20
]

# F_7 = 13 = N  (7th Fibonacci number equals icosahedral shell count)
FIBONACCI_INDEX_N = 7   # 1-based: FIBONACCI[7] = 13 = N

# ── Mersenne prime M_N ────────────────────────────────────────────────────────
# 2^N − 1 where N = 13 gives 8191, which is prime (verified below)
MERSENNE_N = 2**N - 1   # = 8191

def _is_prime(n: int) -> bool:
    """Simple primality test for moderate integers."""
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

MERSENNE_N_IS_PRIME = _is_prime(MERSENNE_N)   # True: 8191 is prime

# ── Ramanujan tau function τ(n) ───────────────────────────────────────────────
# Coefficients of the unique weight-12 cusp form Δ(τ) = q·∏(1−q^n)^24
# First 13 values (exact integers from OEIS A000594):
TAU_RAMANUJAN: dict = {
    1:  1,
    2: -24,
    3:  252,
    4: -1472,
    5:  4830,
    6: -6048,
    7: -16744,
    8:  84480,
    9: -113643,
    10: -115920,
    11:  534612,
    12: -370944,
    13: -577738,
}

# KEY CONNECTION: τ(2) = −24 = −2V  (V = 12 = icosahedral vertex count sans hub)
TAU_2_EQUALS_MINUS_2V = (TAU_RAMANUJAN[2] == -2 * V)   # True: −24 = −2×12

# τ(N) = τ(13) = −577738
TAU_N = TAU_RAMANUJAN[N]   # = −577738

# ── Quadratic residues mod 13 ─────────────────────────────────────────────────
# By Euler's criterion, a prime p has (p−1)/2 quadratic residues (mod p).
# For p = N = 13: (13−1)/2 = 6 quadratic residues.
QR_13 = sorted({(n * n) % N for n in range(1, N)})   # = [1, 3, 4, 9, 10, 12]
QNR_13 = [a for a in range(1, N) if a not in QR_13]  # quadratic non-residues

# Number of QRs = (N−1)/2 = 6  [Euler's criterion, exact for any odd prime]
NUM_QR_13 = len(QR_13)   # = 6 = (N-1)/2

# ── Catalan numbers C_n ───────────────────────────────────────────────────────
# C_n = (2n)! / ((n+1)! × n!)
# C_0=1, C_1=1, C_2=2, C_3=5, C_4=14, C_5=42
# C_D = C_3 = 5 = q  (exact arithmetic!)
def _catalan(n: int) -> int:
    """Return the n-th Catalan number."""
    from math import comb
    return comb(2 * n, n) // (n + 1)

CATALAN_D = _catalan(D)   # = _catalan(3) = 5 = q

# ── Triangular number T_N ─────────────────────────────────────────────────────
T_N = N * (N + 1) // 2   # = 13 × 14 // 2 = 91 = 7 × 13

# ── Gauss sum G(χ) mod 13 ────────────────────────────────────────────────────
# For the Legendre symbol χ=(•/13): G(χ) = Σ_{a=0}^{12} (a/13) exp(2πia/13)
# |G(χ)|² = 13 = N  (Gauss 1801, exact for any odd prime p: |G|² = p)
GAUSS_SUM_MODULUS_SQUARED = N   # |G(χ,13)|² = 13 = N

# ── Functions ─────────────────────────────────────────────────────────────────

def prime_properties() -> dict:
    """
    Properties of N=13 as a prime number.

    Returns
    -------
    dict
        is_prime, prime_index, is_fibonacci_prime, mersenne_prime,
        twin_prime_partner, note.
    """
    # Find index of 13 among primes
    primes_to_50 = [p for p in range(2, 51) if _is_prime(p)]
    prime_index_1based = primes_to_50.index(N) + 1   # 1-based: N=13 is the 6th prime

    return {
        "N":                  N,
        "is_prime":           _is_prime(N),
        "prime_index_1based": prime_index_1based,   # 13 is the 6th prime
        "is_fibonacci_prime": (N == FIBONACCI[FIBONACCI_INDEX_N]),
        "fibonacci_index":    FIBONACCI_INDEX_N,    # F_7 = 13
        "is_twin_prime":      (_is_prime(N - 2) or _is_prime(N + 2)),
        "twin_partner":       11,                   # 11 and 13 are twin primes
        "sum_first_N_primes": sum(p for p in primes_to_50[:N]),
        "note":               "13 is the 6th prime, 7th Fibonacci number, and a twin prime",
    }


def mersenne_check() -> dict:
    """
    Mersenne prime M_N = 2^13 − 1 = 8191.

    The Lucas-Lehmer test confirms 8191 is prime.
    M_13 is the 5th Mersenne prime (M_2, M_3, M_5, M_7, M_13).

    Returns
    -------
    dict
        value, is_prime, mersenne_index, binary_representation, note.
    """
    # Mersenne primes up through M_13
    mersenne_exponents = [2, 3, 5, 7, 13]
    mersenne_index = mersenne_exponents.index(N) + 1   # = 5th Mersenne prime

    return {
        "exponent":           N,
        "value":              MERSENNE_N,
        "is_prime":           MERSENNE_N_IS_PRIME,
        "mersenne_index":     mersenne_index,
        "binary_repr":        bin(MERSENNE_N),       # '0b1111111111111'  (13 ones)
        "binary_ones":        bin(MERSENNE_N).count('1'),   # = N = 13
        "known_mersenne_exp": mersenne_exponents,
        "note":               "2^13 − 1 = 8191; binary has N=13 ones (all-ones 13-bit number)",
    }


def fibonacci_N() -> dict:
    """
    Fibonacci sequence properties at index N=13.

    F_7 = 13 = N  (the 7th Fibonacci number equals the icosahedral site count).
    The Fibonacci sequence is related to φ (which appears in δ★):
      F_n / F_{n-1} → φ as n → ∞.

    Returns
    -------
    dict
        F_N_value, index_of_N, phi_convergence, divisibility_period, note.
    """
    # Pisano period: period of Fibonacci sequence mod N
    # For p prime, π(p) divides p² - 1 or p + 1 depending on Legendre(5,p)
    fib_mod13 = []
    a, b = 0, 1
    for _ in range(100):
        fib_mod13.append(a % N)
        a, b = b, (a + b) % N
    # Find Pisano period
    pisano = 0
    for k in range(1, len(fib_mod13)):
        if fib_mod13[k] == 0 and fib_mod13[k + 1] == 1:
            pisano = k
            break

    # Ratio convergence to phi
    ratio_F14_F13 = FIBONACCI[14] / FIBONACCI[13]  # 377/233

    return {
        "F_7":                   FIBONACCI[7],       # = 13 = N
        "index_of_N_in_fib":     FIBONACCI_INDEX_N,  # = 7
        "N_is_fibonacci_prime":  True,
        "consecutive_pair_8_13": (FIBONACCI[6], FIBONACCI[7]),  # (8, 13) Fibonacci pair
        "phi_approx_ratio":      round(ratio_F14_F13, 8),       # 377/233 ≈ 1.61802575
        "phi_exact":             round(phi, 8),
        "phi_ratio_deviation":   round(abs(ratio_F14_F13 - phi) / phi * 100, 6),
        "pisano_period_mod_13":  pisano,              # period of Fibonacci sequence mod 13
        "fib_13_value":          FIBONACCI[13],       # F_13 = 233
        "note":                  "F_7=13=N; (8,13) are Fibonacci neighbors used in Venus:Earth resonance",
    }


def ramanujan_tau() -> dict:
    """
    Ramanujan tau function τ(n) — key Cathedral connections.

    τ(2) = −24 = −2V:  the Ramanujan tau at n=2 equals minus twice
    the icosahedral vertex count V=12.  This is arithmetically exact.
    Leech lattice has dimension 24 = 2V as well (string_landscape.py).

    Returns
    -------
    dict
        tau_values, tau_2_equals_minus_2V, tau_N, connections, note.
    """
    # Deligne's theorem: |τ(p)| ≤ 2 p^{11/2} for primes p
    deligne_bound_p2  = 2 * 2 ** (11 / 2)     # ≈ 90.5
    deligne_bound_p13 = 2 * 13 ** (11 / 2)    # ≈ 2.8e6
    deligne_satisfied_p2  = abs(TAU_RAMANUJAN[2]) <= deligne_bound_p2
    deligne_satisfied_p13 = abs(TAU_RAMANUJAN[13]) <= deligne_bound_p13

    return {
        "tau_values":              TAU_RAMANUJAN,
        "tau_2":                   TAU_RAMANUJAN[2],      # −24
        "minus_2V":                -2 * V,                # −24
        "tau_2_equals_minus_2V":   TAU_2_EQUALS_MINUS_2V, # True
        "V_meaning":               f"V = {V} = icosahedral rim vertex count",
        "tau_N":                   TAU_N,                  # −577738
        "leech_dim":               2 * V,                  # 24 = 2V (see string_landscape)
        "deligne_satisfied_p2":    deligne_satisfied_p2,
        "deligne_satisfied_p13":   deligne_satisfied_p13,
        "note": (
            "τ(2)=−24=−2V is arithmetically exact. "
            "Leech lattice dim=24=2V (also in string_landscape.py). "
            "No Cathedral derivation of τ is claimed — numerological coincidence."
        ),
    }


def quadratic_residues_13() -> dict:
    """
    Quadratic residues modulo N=13.

    By Euler's criterion, a prime p has exactly (p−1)/2 quadratic residues.
    For p=13: (13−1)/2 = 6 = N/2 − 0.5, and QR = {1,3,4,9,10,12}.

    The Legendre symbol (a/13) encodes arithmetic structure mod 13.

    Returns
    -------
    dict
        qr_list, num_qr, formula, legendre_table, note.
    """
    legendre = {}
    for a in range(1, N):
        # Legendre symbol: +1 if QR, −1 if QNR
        sym = 1 if a in QR_13 else -1
        legendre[a] = sym

    return {
        "modulus":            N,
        "qr_list":            QR_13,
        "qnr_list":           QNR_13,
        "num_qr":             NUM_QR_13,
        "formula":            f"(N-1)/2 = ({N}-1)/2 = 6",
        "legendre_table":     legendre,
        "sum_qr":             sum(QR_13),           # = 1+3+4+9+10+12 = 39 = 3×13
        "sum_qr_equals_3N":   (sum(QR_13) == 3 * N),
        "note": (
            f"Exactly (N-1)/2 = 6 QRs mod {N}. "
            f"Sum of QRs = 39 = 3N. "
            "Euler's criterion: a is QR mod p iff a^{(p-1)/2} ≡ 1 (mod p)."
        ),
    }


def catalan_connection() -> dict:
    """
    Catalan number C_D = C_3 = 5 = q.

    The 3rd Catalan number equals the Cathedral q (number of A₅ conjugacy
    classes, also the super-string dimension / 2).
    Catalan numbers: C_0=1, C_1=1, C_2=2, C_3=5, C_4=14, C_5=42, …

    Returns
    -------
    dict
        C_D, q_value, match, sequence, note.
    """
    catalan_seq = [_catalan(k) for k in range(8)]

    return {
        "D":            D,
        "C_D":          CATALAN_D,     # = 5
        "q":            q,             # = 5
        "C_D_equals_q": (CATALAN_D == q),   # True: C_3 = 5 = q
        "catalan_seq":  catalan_seq,   # [1,1,2,5,14,42,132,429]
        "q_meanings":   [
            f"q = {q}: conjugacy classes of A₅ (icosahedral rotation group)",
            f"q = {q}: D_super/2 (superstring dimension from string_landscape)",
            f"q = {q}: number of irreps of the icosahedral group",
            f"q = {q}: C_D = C_3 (Catalan number at D=3)",
        ],
        "note": (
            "C_3 = 5 = q is an exact arithmetic identity. "
            "Catalan numbers count triangulations, Dyck paths, etc.; "
            "the reason C_3 = q has no direct Cathedral derivation — labelled coincidence."
        ),
    }


def number_theory_summary() -> dict:
    """
    Consolidated summary of Cathedral integer appearances in number theory.

    Returns
    -------
    dict
        All sub-results plus a key-results table.
    """
    return {
        "prime_properties":       prime_properties(),
        "mersenne_check":         mersenne_check(),
        "fibonacci_N":            fibonacci_N(),
        "ramanujan_tau":          ramanujan_tau(),
        "quadratic_residues_13":  quadratic_residues_13(),
        "catalan_connection":     catalan_connection(),
        "cathedral_integers": {
            "D": D, "N": N, "q": q, "V": V, "G": G,
            "gamma": gamma, "delta_star": round(DELTA_STAR, 8),
        },
        "key_results": {
            "tau_2_eq_minus_2V":    f"τ(2) = −24 = −2V  (V={V})  [EXACT]",
            "catalan_C3_eq_q":      f"C_3 = 5 = q  [EXACT]",
            "mersenne_M_N":         f"2^{N}−1 = {MERSENNE_N} is prime  [EXACT]",
            "fibonacci_F7_eq_N":    f"F_7 = 13 = N  [EXACT]",
            "num_QR_mod_13":        f"|QR mod 13| = 6 = (N-1)/2  [EXACT]",
            "sum_QR_eq_3N":         f"sum(QR mod 13) = 39 = 3N  [EXACT]",
        },
    }


def print_number_theory_report() -> None:
    """Print a formatted Cathedral number theory report."""
    sep = "─" * 64
    print(sep)
    print("  CATHEDRAL NUMBER THEORY REPORT")
    print(f"  N={N}, D={D}, q={q}, V={V}, G={G}, γ=1/{int(round(1/gamma))}")
    print(sep)

    # Mersenne
    print(f"\n1. MERSENNE PRIME  M_N = 2^N − 1")
    print(f"   2^{N} − 1 = {MERSENNE_N}  (prime: {MERSENNE_N_IS_PRIME})  [EXACT]")
    print(f"   Binary: {N} ones = {'1'*N}  (all-1s in N bits)")

    # Fibonacci
    fib = fibonacci_N()
    print(f"\n2. FIBONACCI  F_7 = {FIBONACCI[7]} = N  [EXACT]")
    print(f"   Consecutive pair: F_6={FIBONACCI[6]}, F_7={FIBONACCI[7]} = (8, N)")
    print(f"   Venus:Earth near-resonance 13:8 uses these Fibonacci numbers")
    print(f"   Pisano period π(N=13) = {fib['pisano_period_mod_13']}")
    print(f"   φ ≈ F_14/F_13 = {fib['phi_approx_ratio']}  (deviation {fib['phi_ratio_deviation']:.4f}%)")

    # Ramanujan tau
    print(f"\n3. RAMANUJAN TAU  τ(2) = {TAU_RAMANUJAN[2]} = −2V = −2×{V}  [EXACT]")
    print(f"   Leech lattice dim = 2V = {2*V}  (see string_landscape.py)")
    print(f"   τ(N) = τ(13) = {TAU_N}")
    print(f"   Deligne bound |τ(p)| ≤ 2p^{{11/2}} satisfied at p=2 and p=13")

    # Quadratic residues
    qr = quadratic_residues_13()
    print(f"\n4. QUADRATIC RESIDUES mod N=13  (Euler's criterion)")
    print(f"   QR = {QR_13}   ({NUM_QR_13} residues = (N-1)/2)  [EXACT]")
    print(f"   Sum(QR) = {sum(QR_13)} = 3N = 3×{N}  [EXACT]")

    # Catalan
    print(f"\n5. CATALAN NUMBER  C_D = C_3 = {CATALAN_D} = q  [EXACT]")
    cat = catalan_connection()
    print(f"   Sequence: {cat['catalan_seq']}")
    print(f"   q = {q} = icosahedral group irreps = superstring dim/2 = C_3")

    # Triangular
    print(f"\n6. TRIANGULAR NUMBER  T_N = N(N+1)/2 = {T_N} = 7 × N")
    print(f"   T_{N} = {T_N}  (not a particularly clean Cathedral formula)")

    print(f"\n{'KEY RESULTS':^64}")
    print(f"  All six results above are EXACT arithmetic identities.")
    print(f"  None are derived from Cathedral theory — they are coincidences")
    print(f"  that suggest deep connections worthy of further investigation.")
    print(sep)
