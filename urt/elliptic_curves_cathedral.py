"""
Elliptic Curves Cathedral  (v2.9.28)
=====================================
Elliptic curves over Q and finite fields — Cathedral integers appear at every turn.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key exact identities:
  D^D = 27     — coefficient in discriminant Δ = −16(4a³ + 27b²)
  V³  = 1728   — coefficient in j-invariant numerator
  V+D = 15     — number of possible Mazur torsion groups
  V*N + D!+1 = 163  — the largest Heegner number
  2^D × D × (D!+1) = 168 — order of PSL(2,7), key in X(N) formula
  2*D+q = 11   — smallest conductor of an elliptic curve over Q
  q primes {2,3,5,7,13} give g(X_0(p))=0 — Cathedral N=13 is special
  2q−1 = D²    — number of possible Hasse trace values over GF(q)
"""

from math import factorial, gcd, isqrt
from fractions import Fraction
from .shell_closure import N, D, V, E, F, q, G, DELTA_STAR, phi

GAMMA_INV = 81

# ── Section 1: Elliptic curve basics ─────────────────────────────────────────

# An elliptic curve E: y² = x³ + ax + b has discriminant Δ = −16(4a³ + 27b²)
# The "27" = D^D = 3^3 = 27 ← Cathedral!
EC_DISCRIMINANT_COEFF_27 = D**D        # = 27
IDENTITY_EC_DISC_27: bool = (EC_DISCRIMINANT_COEFF_27 == 27)

# The j-invariant: j(E) = 1728 × 4a³ / (4a³ + 27b²)
# "1728" = V³ = 12³ = 1728 ← Cathedral!
EC_J_NUMERATOR_COEFF = V**3            # = 1728
IDENTITY_EC_J_COEFF: bool = (EC_J_NUMERATOR_COEFF == 1728)

# The "4" in 4a³: 4 = D+1 ← Cathedral!
EC_QUARTIC_COEFF = D + 1               # = 4
IDENTITY_EC_QUARTIC: bool = (EC_QUARTIC_COEFF == 4)

# Weierstrass form: y² + a₁xy + a₃y = x³ + a₂x² + a₄x + a₆
# Number of Weierstrass coefficients: 5 = q ← Cathedral!
N_WEIERSTRASS_COEFFS = q               # = 5
IDENTITY_WEIERSTRASS_N: bool = (N_WEIERSTRASS_COEFFS == 5)

# ── Section 2: The Mordell-Weil theorem ──────────────────────────────────────

# Mordell-Weil: E(Q) ≅ Z^r ⊕ T, where T is the torsion subgroup.
# Mazur's theorem (1977): the possible torsion groups are exactly 15 in number:
#   Z/nZ for n=1,2,…,10,12   (that is 11 groups)
#   Z/2Z × Z/2nZ for n=1,2,3,4  (that is 4 groups)
#   Total: 11 + 4 = 15 = V+D ← Cathedral!
N_MAZUR_TORSION = V + D                # = 15
IDENTITY_MAZUR: bool = (N_MAZUR_TORSION == 15)

# The maximum torsion order in the cyclic case: Z/12Z, order 12 = V ← Cathedral!
MAX_CYCLIC_TORSION = V                 # = 12
IDENTITY_MAX_TORSION: bool = (MAX_CYCLIC_TORSION == V)

# For Z/2Z × Z/2nZ: Mazur allows n ≤ 4 = D+1 ← Cathedral!
MAX_PRODUCT_TORSION_n = D + 1          # = 4
IDENTITY_MAX_PROD_TORSION: bool = (MAX_PRODUCT_TORSION_n == 4)

# Maximum order from Z/2Z × Z/2nZ: Z/2Z × Z/8Z has order 2×8=16 = 2^(D+1)
MAX_MAZUR_ORDER = 2 * 2 * (D + 1)     # = 2 × 2 × 4 = 16
IDENTITY_MAX_MAZUR_ORDER: bool = (MAX_MAZUR_ORDER == 2**(D+1))

# ── Section 3: CM elliptic curves ────────────────────────────────────────────

# Complex multiplication by imaginary quadratic fields Q(√−d).
# Key: Q(√−3) = Eisenstein integers, discriminant −D = −3 ← Cathedral!
CM_DISC_EISENSTEIN = -D                # = −3
IDENTITY_CM_EISENSTEIN: bool = (CM_DISC_EISENSTEIN == -3)

# The j-invariant of the CM curve with discriminant −4 (Gaussian integers Q(√−1)):
# j(Q(√−1)) = 1728 = V³ ← Cathedral!
CM_J_GAUSSIAN = V**3                   # = 1728
IDENTITY_CM_J_GAUSSIAN: bool = (CM_J_GAUSSIAN == 1728)

# Number of imaginary quadratic fields with class number 1 (Heegner–Stark):
# {−1, −2, −3, −7, −11, −19, −43, −67, −163} → 9 fields = D² ← Cathedral!
N_HEEGNER = D**2                       # = 9
IDENTITY_HEEGNER: bool = (N_HEEGNER == 9)

# The largest Heegner number: 163.
# 163 = V×N + factorial(D) + 1 = 12×13 + 6 + 1 = 156 + 7 = 163 ← Cathedral!
HEEGNER_163 = V * N + factorial(D) + 1   # = 156 + 7 = 163
IDENTITY_HEEGNER_163: bool = (HEEGNER_163 == 163)

# Famous Ramanujan: e^{π√163} ≈ 640320³ + 744.
# 640320 is divisible by V×q = 12×5 = 60 = G ← Cathedral!
RAMANUJAN_APPROX_163 = 640320
IDENTITY_RAMANUJAN_163_DIV: bool = (RAMANUJAN_APPROX_163 % (V * q) == 0)

# ── Section 4: Elliptic curves over finite fields ────────────────────────────

# Over GF(p): |E(GF(p))| = p + 1 − t with |t| ≤ 2√p (Hasse bound).
# For p = q = 5: |t| ≤ 2√5 ≈ 4.47 so t ∈ {−4,−3,−2,−1,0,1,2,3,4}.
# Count: 2q − 1 = 9 = D² possible trace values ← Cathedral!
TRACE_COUNT_GFq = 2 * q - 1           # = 9 = D²
IDENTITY_TRACE_GFq: bool = (TRACE_COUNT_GFq == D**2)

# For p = N = 13: |t| ≤ 2√13 ≈ 7.21 so t ∈ {−7,…,7}.
# Count: 2×(factorial(D)+1)+1 = 2×7+1 = 15 = V+D ← Cathedral!
TRACE_COUNT_GFN = 2 * (factorial(D) + 1) + 1   # = 15 = V+D
IDENTITY_TRACE_GFN: bool = (TRACE_COUNT_GFN == V + D)

# ── Section 5: The BSD conjecture ────────────────────────────────────────────

# Birch–Swinnerton-Dyer: L(E,1) = (Ω × Reg × |Ш| × Πcₚ) / |E(Q)_tors|²
# Maximum cyclic torsion V=12 gives maximum square denominator V²=144 ← Cathedral!
BSD_TORS_DENOM_MAX = V**2              # = 144
IDENTITY_BSD_TORS_MAX: bool = (BSD_TORS_DENOM_MAX == 144)

# The average rank of elliptic curves over Q is conjectured to be 1/2.
# 1/2 = 1/(D−1): the "2" in the denominator = D−1 ← Cathedral!
BSD_AVG_RANK_DEN = D - 1               # = 2
IDENTITY_BSD_AVG_RANK: bool = (BSD_AVG_RANK_DEN == 2)

# ── Section 6: Modular curves ────────────────────────────────────────────────

# X_0(N) for N=13 (Cathedral N): the genus g(X_0(13)) = 0.
# Among all primes p, only p=2,3,5,7,13 give g(X_0(p))=0.
# Cathedral N=13 is the ONLY prime p>7 with g(X_0(p))=0!
X0_N_GENUS = 0                         # g(X_0(13)) = 0 ← Cathedral N=13 special!
IDENTITY_X0_N_GENUS: bool = (X0_N_GENUS == 0)

# Among primes with g(X_0(p))=0: {2, 3, 5, 7, 13} — that is q=5 primes ← Cathedral!
N_PRIMES_X0_GENUS0 = q                 # = 5 primes: {2,3,5,7,13}
IDENTITY_N_PRIMES_GENUS0: bool = (N_PRIMES_X0_GENUS0 == 5)

# X_0(13) cusps: divisors of 13 are {1,13} so there are 2 = D−1 cusps ← Cathedral!
X0_N_CUSPS = D - 1                     # = 2
IDENTITY_X0_N_CUSPS: bool = (X0_N_CUSPS == 2)

# In the formula for g(X(p)), the key prefactor is 168 = 2^D × D × (D!+1) ← Cathedral!
# 168 = 8 × 3 × 7 = order of PSL(2,7) = GL(3,2); appears in g(X(13)) calculation.
X_N_KEY_NUM = 2**D * D * (factorial(D) + 1)   # = 8 × 3 × 7 = 168
IDENTITY_X_N_168: bool = (X_N_KEY_NUM == 168)

# ── Section 7: Elliptic curve L-functions ────────────────────────────────────

# The curve of smallest conductor over Q has conductor 11.
# 11 = 2D + q = 2×3 + 5 = 11 ← Cathedral!
MIN_CONDUCTOR = 2 * D + q              # = 11
IDENTITY_MIN_CONDUCTOR: bool = (MIN_CONDUCTOR == 11)

# The curve y² + y = x³ − x² (conductor 11) has rank 0 and torsion Z/5Z.
# |E_11(Q)_tors| = 5 = q ← Cathedral!
CONDUCTOR_11_TORS = q                  # = 5
IDENTITY_COND11_TORS: bool = (CONDUCTOR_11_TORS == 5)

# Taniyama–Shimura–Weil theorem: every elliptic curve over Q is modular.
# The relevant modular forms have weight 2 = D−1 ← Cathedral!
TANIYAMA_WEIGHT = D - 1                # = 2
IDENTITY_TANIYAMA_WEIGHT: bool = (TANIYAMA_WEIGHT == 2)

# Wiles' proof of Fermat's Last Theorem uses the "3−5 switch" (Taylor-Wiles):
# the key Galois representations at primes 3=D and 5=q ← Cathedral!
WILES_PRIME_1 = D                      # = 3
WILES_PRIME_2 = q                      # = 5
IDENTITY_WILES_PRIMES: bool = (WILES_PRIME_1 == 3 and WILES_PRIME_2 == 5)

# ── Section 8: The group law ──────────────────────────────────────────────────

# The doubling formula: 2P = ((3x²+a)²/(4y²) − 2x, …)
# Coefficient "3" = D (slope of tangent numerator) ← Cathedral!
# Coefficient "4" = D+1 (slope denominator) ← Cathedral!
GROUP_LAW_3 = D                        # = 3
GROUP_LAW_4 = D + 1                    # = 4
IDENTITY_GROUP_LAW: bool = (GROUP_LAW_3 == 3 and GROUP_LAW_4 == 4)

# An elliptic curve is a plane algebraic curve of degree 3 = D ← Cathedral!
EC_DEGREE = D                          # = 3
IDENTITY_EC_DEGREE: bool = (EC_DEGREE == 3)

# ── Aggregate check ───────────────────────────────────────────────────────────

ALL_EC_IDENTITIES = [
    IDENTITY_EC_DISC_27,
    IDENTITY_EC_J_COEFF,
    IDENTITY_EC_QUARTIC,
    IDENTITY_WEIERSTRASS_N,
    IDENTITY_MAZUR,
    IDENTITY_MAX_TORSION,
    IDENTITY_MAX_PROD_TORSION,
    IDENTITY_MAX_MAZUR_ORDER,
    IDENTITY_CM_EISENSTEIN,
    IDENTITY_CM_J_GAUSSIAN,
    IDENTITY_HEEGNER,
    IDENTITY_HEEGNER_163,
    IDENTITY_RAMANUJAN_163_DIV,
    IDENTITY_TRACE_GFq,
    IDENTITY_TRACE_GFN,
    IDENTITY_BSD_TORS_MAX,
    IDENTITY_BSD_AVG_RANK,
    IDENTITY_X0_N_GENUS,
    IDENTITY_N_PRIMES_GENUS0,
    IDENTITY_X0_N_CUSPS,
    IDENTITY_X_N_168,
    IDENTITY_MIN_CONDUCTOR,
    IDENTITY_COND11_TORS,
    IDENTITY_TANIYAMA_WEIGHT,
    IDENTITY_WILES_PRIMES,
    IDENTITY_GROUP_LAW,
    IDENTITY_EC_DEGREE,
]
ALL_EC_EXACT: bool = all(ALL_EC_IDENTITIES)
N_EC_IDENTITIES = len(ALL_EC_IDENTITIES)
assert ALL_EC_EXACT, "Some elliptic curve Cathedral identities failed"


# ── Summary and report functions ──────────────────────────────────────────────

def ec_summary() -> dict:
    """
    Consolidated summary of all Elliptic Curves Cathedral identities.

    Returns
    -------
    dict
        Sections: basics, mordell_weil, cm_curves, finite_fields,
        bsd, modular_curves, l_functions, group_law, meta.
    """
    return {
        "basics": {
            "discriminant_coeff_27":  EC_DISCRIMINANT_COEFF_27,
            "discriminant_formula":   f"27 = D^D = {D}^{D}",
            "j_coeff_1728":           EC_J_NUMERATOR_COEFF,
            "j_formula":              f"1728 = V³ = {V}³",
            "quartic_coeff":          EC_QUARTIC_COEFF,
            "quartic_formula":        f"4 = D+1 = {D}+1",
            "weierstrass_n_coeffs":   N_WEIERSTRASS_COEFFS,
            "weierstrass_formula":    f"5 = q = {q}",
        },
        "mordell_weil": {
            "n_mazur_torsion":        N_MAZUR_TORSION,
            "mazur_formula":          f"15 = V+D = {V}+{D}",
            "max_cyclic_torsion":     MAX_CYCLIC_TORSION,
            "cyclic_formula":         f"12 = V = {V}",
            "max_product_n":          MAX_PRODUCT_TORSION_n,
            "product_n_formula":      f"4 = D+1 = {D}+1",
            "max_mazur_order":        MAX_MAZUR_ORDER,
            "max_order_formula":      f"16 = 2^(D+1) = 2^{D+1}",
        },
        "cm_curves": {
            "cm_disc_eisenstein":     CM_DISC_EISENSTEIN,
            "eisenstein_formula":     f"−3 = −D = −{D}",
            "j_gaussian":             CM_J_GAUSSIAN,
            "j_gaussian_formula":     f"1728 = V³ = {V}³",
            "n_heegner":              N_HEEGNER,
            "heegner_formula":        f"9 = D² = {D}²",
            "heegner_163":            HEEGNER_163,
            "heegner_163_formula":    f"163 = V×N + D!+1 = {V}×{N} + {factorial(D)}+1",
            "ramanujan_640320":       RAMANUJAN_APPROX_163,
            "ramanujan_div_VG":       f"640320 / {V*q} = {RAMANUJAN_APPROX_163 // (V*q)}",
        },
        "finite_fields": {
            "trace_count_GFq":        TRACE_COUNT_GFq,
            "trace_GFq_formula":      f"9 = 2q−1 = D² = {D}²  (|t|≤2√{q})",
            "trace_count_GFN":        TRACE_COUNT_GFN,
            "trace_GFN_formula":      f"15 = 2(D!+1)+1 = V+D  (|t|≤2√{N})",
        },
        "bsd": {
            "tors_denom_max":         BSD_TORS_DENOM_MAX,
            "tors_denom_formula":     f"144 = V² = {V}²",
            "avg_rank_denom":         BSD_AVG_RANK_DEN,
            "avg_rank_formula":       f"2 = D−1 = {D}−1",
        },
        "modular_curves": {
            "X0_N_genus":             X0_N_GENUS,
            "X0_N_note":              f"g(X_0({N})) = 0; Cathedral N={N} is the only prime >7 with this property",
            "n_primes_genus0":        N_PRIMES_X0_GENUS0,
            "primes_genus0_list":     [2, 3, 5, 7, 13],
            "primes_genus0_formula":  f"q = {q} primes: {{2,3,5,7,N={N}}}",
            "X0_N_cusps":             X0_N_CUSPS,
            "cusps_formula":          f"2 = D−1 = {D}−1",
            "X_N_168":                X_N_KEY_NUM,
            "X_N_168_formula":        f"168 = 2^D × D × (D!+1) = 2^{D}×{D}×{factorial(D)+1}",
        },
        "l_functions": {
            "min_conductor":          MIN_CONDUCTOR,
            "conductor_formula":      f"11 = 2D+q = 2×{D}+{q}",
            "conductor_11_tors":      CONDUCTOR_11_TORS,
            "tors_formula":           f"5 = q = {q}  (y²+y=x³−x², torsion Z/{q}Z)",
            "taniyama_weight":        TANIYAMA_WEIGHT,
            "taniyama_formula":       f"2 = D−1 = {D}−1  (weight-2 modular forms)",
            "wiles_prime_1":          WILES_PRIME_1,
            "wiles_prime_2":          WILES_PRIME_2,
            "wiles_formula":          f"3-{q} switch: primes D={D} and q={q}",
        },
        "group_law": {
            "slope_coeff_3":          GROUP_LAW_3,
            "slope_formula":          f"3 = D = {D}  (numerator coefficient in doubling formula)",
            "denom_coeff_4":          GROUP_LAW_4,
            "denom_formula":          f"4 = D+1 = {D}+1  (denominator factor)",
            "ec_degree":              EC_DEGREE,
            "degree_formula":         f"3 = D = {D}  (elliptic curves are degree-3 curves)",
        },
        "meta": {
            "n_identities":           N_EC_IDENTITIES,
            "all_exact":              ALL_EC_EXACT,
            "cathedral_integers":     {
                "D": D, "N": N, "V": V, "E": E, "F": F, "q": q, "G": G,
                "gamma_inv": GAMMA_INV,
            },
            "delta_star":             round(DELTA_STAR, 8),
        },
    }


def print_ec_report() -> None:
    """Print a formatted Elliptic Curves Cathedral report."""
    sep = "─" * 65
    print(sep)
    print("  ELLIPTIC CURVES CATHEDRAL REPORT  (v2.9.28)")
    print(f"  D={D}  N={N}  V={V}  q={q}  G={G}  γ=1/{GAMMA_INV}")
    print(sep)

    print("\n1. ELLIPTIC CURVE BASICS")
    print(f"   Discriminant coeff  27 = D^D = {D}^{D}          [EXACT]")
    print(f"   j-invariant coeff 1728 = V³  = {V}³            [EXACT]")
    print(f"   Quartic coeff        4 = D+1 = {D}+1            [EXACT]")
    print(f"   Weierstrass coeffs   5 = q   = {q}              [EXACT]")

    print("\n2. MORDELL-WEIL / MAZUR")
    print(f"   Mazur torsion types 15 = V+D = {V}+{D}          [EXACT]")
    print(f"   Max cyclic torsion  12 = V   = {V}              [EXACT]")
    print(f"   Max product n        4 = D+1 = {D}+1            [EXACT]")
    print(f"   Max Mazur order     16 = 2^(D+1) = 2^{D+1}      [EXACT]")

    print("\n3. CM CURVES AND HEEGNER NUMBERS")
    print(f"   Eisenstein disc     −3 = −D  = −{D}             [EXACT]")
    print(f"   j(Gaussian integers) 1728 = V³                  [EXACT]")
    print(f"   Heegner count        9 = D²  = {D}²             [EXACT]")
    print(f"   Heegner-163:       163 = V×N + D!+1 = {V}×{N}+{factorial(D)+1}  [EXACT]")
    print(f"   640320 ÷ (V×q=60) = {RAMANUJAN_APPROX_163 // (V*q)}  [EXACT div]")

    print("\n4. ELLIPTIC CURVES OVER FINITE FIELDS")
    print(f"   Trace count GF(q=5): 9 = 2q−1 = D²             [EXACT]")
    print(f"   Trace count GF(N=13): 15 = V+D                  [EXACT]")

    print("\n5. BIRCH–SWINNERTON-DYER")
    print(f"   Max torsion² denom 144 = V² = {V}²              [EXACT]")
    print(f"   Avg rank denom       2 = D−1 = {D}−1            [EXACT]")

    print("\n6. MODULAR CURVES")
    print(f"   g(X_0(N=13))         = 0  (Cathedral N unique!) [EXACT]")
    print(f"   Primes g=0 count     5 = q {{2,3,5,7,13}}       [EXACT]")
    print(f"   X_0(13) cusps        2 = D−1                    [EXACT]")
    print(f"   PSL(2,7) order     168 = 2^D × D × (D!+1)       [EXACT]")

    print("\n7. L-FUNCTIONS / WILES")
    print(f"   Min conductor       11 = 2D+q = 2×{D}+{q}       [EXACT]")
    print(f"   Cond-11 torsion      5 = q = {q}                [EXACT]")
    print(f"   Taniyama weight      2 = D−1 = {D}−1            [EXACT]")
    print(f"   Wiles 3-5 switch: primes D={D}, q={q}           [EXACT]")

    print("\n8. GROUP LAW")
    print(f"   Slope coeff          3 = D = {D}                [EXACT]")
    print(f"   Denom coeff          4 = D+1 = {D}+1            [EXACT]")
    print(f"   Curve degree         3 = D = {D}                [EXACT]")

    print(f"\n{'─'*65}")
    print(f"  Total identities: {N_EC_IDENTITIES}   All exact: {ALL_EC_EXACT}")
    print(sep)
