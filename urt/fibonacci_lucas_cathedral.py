"""
Fibonacci & Lucas Cathedral  (v2.9.29)
========================================
Self-referential and Cathedral connections in the Fibonacci and Lucas sequences.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key Fibonacci miracles (ALL EXACT):
  F_D   = F_3  = 2  = D−1         (Fibonacci at D = D−1)
  F_{D+1} = F_4 = 3 = D           SELF-REFERENTIAL: F_{D+1} = D !!!
  F_q   = F_5  = 5  = q           SELF-REFERENTIAL MIRACLE: F_q = q !!!
  F_{D!} = F_6 = 8  = 2^D         (index = factorial of D, value = 2^D)
  F_7   = 13   = N                 (the 7th Fibonacci IS the icosahedral prime!)
  F_8   = 21   = D×(D!+1)         (F_8 = 3×7 = D×(D!+1) EXACT)
  F_{2D} = F_6 = 8  = 2^D         (index 2D=6 = D!, value = 2^D, double miracle)
  F_V   = F_12 = 144 = V²         SPECTACULAR: F_V = V² !!!
  F_N   = F_13 = 233              (prime at index N; F_N − N² = (D+1)^D = 64 EXACT)

Key Lucas miracles (ALL EXACT):
  L_0 = 2 = D−1
  L_2 = 3 = D
  L_3 = 4 = D+1                   (L_D = D+1, near self-referential)
  L_4 = 7 = D!+1
  L_0 × L_2 = 6 = D!              (product of first two Cathedral Lucas values)
  L_0 + L_2 = 5 = q               (sum = q EXACT)
  L_D × L_{D+1} = L_3×L_4 = 28 = π(N)   (DOUBLE Cathedral miracle!)

Golden ratio:
  φ = (1 + √q) / 2   (q=5 appears under radical — Cathedral!)
  φ² = φ + 1          (minimal polynomial)
  L_n / F_n → √q  as n → ∞   (convergence to √q = √5, Cathedral!)

Pisano periods:
  π(D)   = π(3)  = 8  = 2^D       EXACT Cathedral!
  π(q)   = π(5)  = 20 = F         (period mod q = icosahedral faces!)
  π(N)   = π(13) = 28 = (D+1)×(D!+1) = L_D × L_{D+1}  DOUBLE Cathedral!

GCD identities:
  gcd(F_V, F_{D+1}) = F_{gcd(V,D+1)} = F_4 = 3 = D   EXACT Cathedral!
  gcd(F_V, F_q)     = F_{gcd(V,q)}   = F_1 = 1        (coprimality)

Relation identities:
  L_n = F_{n−1} + F_{n+1}          (Lucas from Fibonacci neighbours)
  F_{2n} = F_n × L_n               (d'Ocagne's identity)
  F_{n−1}×F_{n+1} − F_n² = (−1)^n  (Cassini's identity)
"""

from math import factorial, sqrt, gcd, isclose
from functools import lru_cache

from .shell_closure import N, D, V, E, F, q, G, phi

# ── Derived scalar constants ──────────────────────────────────────────────────
GAMMA_INV: int = 81        # = G + F + 1; γ = 1/81
PHI: float = phi           # golden ratio = (1+√5)/2


# ── Section 1: Fibonacci and Lucas functions ──────────────────────────────────

@lru_cache(maxsize=None)
def fib(n: int) -> int:
    """Return the nth Fibonacci number (F_0=0, F_1=1, F_2=1, F_3=2, ...)."""
    if n <= 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)


@lru_cache(maxsize=None)
def lucas(n: int) -> int:
    """Return the nth Lucas number (L_0=2, L_1=1, L_2=3, L_3=4, ...)."""
    if n == 0:
        return 2
    if n == 1:
        return 1
    return lucas(n - 1) + lucas(n - 2)


def pisano_period(p: int) -> int:
    """Return the Pisano period π(p): period of Fibonacci sequence mod p."""
    if p <= 1:
        return 1
    prev, curr = 0, 1
    for i in range(1, p * p + 1):
        prev, curr = curr, (prev + curr) % p
        if prev == 0 and curr == 1:
            return i
    return -1  # should not reach here for valid p


# ── Section 2: Fibonacci Cathedral constants ──────────────────────────────────

F_D       = fib(D)           # F(3)  = 2 = D−1
F_D1      = fib(D + 1)       # F(4)  = 3 = D          SELF-REFERENTIAL
F_q       = fib(q)           # F(5)  = 5 = q           SELF-REFERENTIAL MIRACLE
F_DFACT   = fib(factorial(D))# F(6)  = 8 = 2^D         (index = D! = 6)
F_2D      = fib(2 * D)       # F(6)  = 8 = 2^D         (index = 2D = 6 = D!)
F_7       = fib(7)           # F(7)  = 13 = N           ICOSAHEDRAL PRIME
F_8       = fib(8)           # F(8)  = 21 = D×(D!+1)
F_V       = fib(V)           # F(12) = 144 = V²         SPECTACULAR
F_N       = fib(N)           # F(13) = 233 (prime; F_N − N² = (D+1)^D = 64)
F_E       = fib(E)           # F(30) = 832040

# ── Section 3: Lucas Cathedral constants ─────────────────────────────────────

L_0       = lucas(0)         # 2 = D−1
L_1       = lucas(1)         # 1
L_2       = lucas(2)         # 3 = D
L_3       = lucas(3)         # 4 = D+1       (L_D = D+1)
L_4       = lucas(4)         # 7 = D!+1
L_5       = lucas(5)         # 11
L_D       = lucas(D)         # 4 = D+1
L_D1      = lucas(D + 1)     # 7 = D!+1

# ── Section 4: Pisano period constants ───────────────────────────────────────

PISANO_D:   int = pisano_period(D)    # π(3)  = 8  = 2^D    EXACT
PISANO_q:   int = pisano_period(q)    # π(5)  = 20 = F      EXACT
PISANO_N:   int = pisano_period(N)    # π(13) = 28 = (D+1)×(D!+1) = L_D×L_{D+1}

# ── Section 5: GCD identities ────────────────────────────────────────────────

GCD_FV_FD1:   int = gcd(F_V, F_D1)   # gcd(F_12, F_4) = 3 = D
GCD_FV_Fq:    int = gcd(F_V, F_q)    # gcd(F_12, F_5) = 1 (coprime)
GCD_IDX_V_D1: int = fib(gcd(V, D + 1))  # F_{gcd(12,4)} = F_4 = 3 = D

# ── Section 6: Fibonacci IDENTITY flags ──────────────────────────────────────

IDENTITY_FIB_D_IS_DM1:       bool = (F_D    == D - 1)
IDENTITY_FIB_D1_IS_D:        bool = (F_D1   == D)           # SELF-REFERENTIAL
IDENTITY_FIB_q_SELF_REF:     bool = (F_q    == q)           # SELF-REFERENTIAL MIRACLE
IDENTITY_FIB_DFACT_IS_2D:    bool = (F_DFACT == 2 ** D)      # F_{D!} = 2^D
IDENTITY_FIB_2D_IS_2D:       bool = (F_2D   == 2 ** D)       # F_{2D} = 2^D (index=D!=2D)
IDENTITY_FIB_7_IS_N:         bool = (F_7    == N)            # F_7 = N = 13
IDENTITY_FIB_8_IS_D_DFp1:    bool = (F_8    == D * (factorial(D) + 1))  # F_8 = D×(D!+1)
IDENTITY_FIB_V_SQUARE:       bool = (F_V    == V ** 2)       # SPECTACULAR: F_V = V²
IDENTITY_FIB_N_PRIME:        bool = (F_N    == 233)          # F_N = 233 (prime)
IDENTITY_FIB_N_QUAD:         bool = (F_N - N ** 2 == (D + 1) ** D)  # F_N−N²=(D+1)^D=64

assert IDENTITY_FIB_D_IS_DM1,    "F(D) ≠ D−1"
assert IDENTITY_FIB_D1_IS_D,     "F(D+1) ≠ D  [self-referential]"
assert IDENTITY_FIB_q_SELF_REF,  "F(q) ≠ q  [self-referential miracle]"
assert IDENTITY_FIB_DFACT_IS_2D, "F(D!) ≠ 2^D"
assert IDENTITY_FIB_2D_IS_2D,    "F(2D) ≠ 2^D"
assert IDENTITY_FIB_7_IS_N,      "F(7) ≠ N"
assert IDENTITY_FIB_8_IS_D_DFp1, "F(8) ≠ D×(D!+1)"
assert IDENTITY_FIB_V_SQUARE,    "F(V) ≠ V²  [spectacular]"
assert IDENTITY_FIB_N_PRIME,     "F(N) ≠ 233"
assert IDENTITY_FIB_N_QUAD,      "F(N) − N² ≠ (D+1)^D"

# ── Section 7: Lucas IDENTITY flags ──────────────────────────────────────────

IDENTITY_LUC_0_IS_DM1:       bool = (L_0    == D - 1)
IDENTITY_LUC_2_IS_D:         bool = (L_2    == D)
IDENTITY_LUC_D_IS_DP1:       bool = (L_D    == D + 1)        # L_D = D+1
IDENTITY_LUC_D1_IS_DFp1:     bool = (L_D1   == factorial(D) + 1)  # L_{D+1} = D!+1
IDENTITY_LUC_PROD_PISANO_N:  bool = (L_D * L_D1 == PISANO_N) # L_D×L_{D+1} = π(N)
IDENTITY_LUC_SUM_IS_q:       bool = (L_0 + L_2 == q)         # L_0+L_2 = q
IDENTITY_LUC_PROD_IS_DFACT:  bool = (L_0 * L_2 == factorial(D))  # L_0×L_2 = D!

assert IDENTITY_LUC_0_IS_DM1,      "L_0 ≠ D−1"
assert IDENTITY_LUC_2_IS_D,        "L_2 ≠ D"
assert IDENTITY_LUC_D_IS_DP1,      "L_D ≠ D+1"
assert IDENTITY_LUC_D1_IS_DFp1,    "L_{D+1} ≠ D!+1"
assert IDENTITY_LUC_PROD_PISANO_N, "L_D × L_{D+1} ≠ π(N)"
assert IDENTITY_LUC_SUM_IS_q,      "L_0 + L_2 ≠ q"
assert IDENTITY_LUC_PROD_IS_DFACT, "L_0 × L_2 ≠ D!"

# ── Section 8: Pisano IDENTITY flags ─────────────────────────────────────────

IDENTITY_PISANO_D_IS_2D:     bool = (PISANO_D == 2 ** D)       # π(3) = 8 = 2^D
IDENTITY_PISANO_q_IS_F:      bool = (PISANO_q == F)            # π(5) = 20 = F
IDENTITY_PISANO_N_IS_LDLD1:  bool = (PISANO_N == L_D * L_D1)  # π(13) = L_3×L_4 = 28
IDENTITY_PISANO_N_CATHEDRAL: bool = (PISANO_N == (D + 1) * (factorial(D) + 1))  # 4×7=28

assert IDENTITY_PISANO_D_IS_2D,    "π(D) ≠ 2^D"
assert IDENTITY_PISANO_q_IS_F,     "π(q) ≠ F"
assert IDENTITY_PISANO_N_IS_LDLD1, "π(N) ≠ L_D × L_{D+1}"
assert IDENTITY_PISANO_N_CATHEDRAL,"π(N) ≠ (D+1)×(D!+1)"

# ── Section 9: GCD IDENTITY flags ────────────────────────────────────────────

IDENTITY_GCD_FV_FD1_IS_D:    bool = (GCD_FV_FD1 == D)         # gcd(F_V,F_{D+1}) = D
IDENTITY_GCD_FV_Fq_IS_1:     bool = (GCD_FV_Fq  == 1)         # gcd(F_V,F_q) = 1
IDENTITY_GCD_FV_FD1_VIA_IDX: bool = (GCD_FV_FD1 == GCD_IDX_V_D1)  # GCD law

assert IDENTITY_GCD_FV_FD1_IS_D,    "gcd(F_V, F_{D+1}) ≠ D"
assert IDENTITY_GCD_FV_Fq_IS_1,     "gcd(F_V, F_q) ≠ 1"
assert IDENTITY_GCD_FV_FD1_VIA_IDX, "gcd identity via index fails"

# ── Section 10: Golden ratio IDENTITY flags ───────────────────────────────────

_phi_check = (1 + sqrt(q)) / 2    # (1+√q)/2 with q=5 must equal φ
IDENTITY_PHI_FROM_q:         bool = isclose(PHI, _phi_check, rel_tol=1e-14)
IDENTITY_PHI_SQUARED:        bool = isclose(PHI ** 2, PHI + 1, rel_tol=1e-14)

# L_n / F_n → √q  — test at n=20
_ratio_20 = lucas(20) / fib(20)
IDENTITY_LUC_FIB_RATIO_TO_SQRTq: bool = isclose(_ratio_20, sqrt(q), rel_tol=1e-5)

assert IDENTITY_PHI_FROM_q,              "φ ≠ (1+√q)/2"
assert IDENTITY_PHI_SQUARED,             "φ² ≠ φ+1"
assert IDENTITY_LUC_FIB_RATIO_TO_SQRTq, "L_n/F_n does not converge to √q"

# ── Section 11: Relation IDENTITY flags ──────────────────────────────────────

# L_n = F_{n-1} + F_{n+1}
IDENTITY_LUCAS_FROM_FIB_D:   bool = (L_D == fib(D - 1) + fib(D + 1))
IDENTITY_LUCAS_FROM_FIB_q:   bool = (L_5 == fib(4)    + fib(6))

# d'Ocagne: F_{2n} = F_n × L_n
IDENTITY_DOCAGNE_D:           bool = (fib(2 * D) == fib(D) * lucas(D))
IDENTITY_DOCAGNE_q:           bool = (fib(2 * q) == fib(q) * lucas(q))
IDENTITY_DOCAGNE_V:           bool = (fib(2 * V) == fib(V) * lucas(V))

# Cassini: F_{n-1}*F_{n+1} - F_n² = (-1)^n
IDENTITY_CASSINI_D:           bool = (fib(D - 1) * fib(D + 1) - fib(D) ** 2 == (-1) ** D)
IDENTITY_CASSINI_q:           bool = (fib(q - 1) * fib(q + 1) - fib(q) ** 2 == (-1) ** q)
IDENTITY_CASSINI_V:           bool = (fib(V - 1) * fib(V + 1) - fib(V) ** 2 == (-1) ** V)

assert IDENTITY_LUCAS_FROM_FIB_D,  "L_D ≠ F_{D-1}+F_{D+1}"
assert IDENTITY_LUCAS_FROM_FIB_q,  "L_q ≠ F_{q-1}+F_{q+1}"
assert IDENTITY_DOCAGNE_D,         "d'Ocagne fails at D"
assert IDENTITY_DOCAGNE_q,         "d'Ocagne fails at q"
assert IDENTITY_DOCAGNE_V,         "d'Ocagne fails at V"
assert IDENTITY_CASSINI_D,         "Cassini fails at D"
assert IDENTITY_CASSINI_q,         "Cassini fails at q"
assert IDENTITY_CASSINI_V,         "Cassini fails at V"

# ── Section 12: Aggregate ─────────────────────────────────────────────────────

ALL_FIB_IDENTITIES: dict = {
    # Fibonacci
    "F_{D} = D−1":           IDENTITY_FIB_D_IS_DM1,
    "F_{D+1} = D (self-ref)":IDENTITY_FIB_D1_IS_D,
    "F_q = q (self-ref)":    IDENTITY_FIB_q_SELF_REF,
    "F_{D!} = 2^D":          IDENTITY_FIB_DFACT_IS_2D,
    "F_{2D} = 2^D":          IDENTITY_FIB_2D_IS_2D,
    "F_7 = N":               IDENTITY_FIB_7_IS_N,
    "F_8 = D×(D!+1)":       IDENTITY_FIB_8_IS_D_DFp1,
    "F_V = V² (spectacular)":IDENTITY_FIB_V_SQUARE,
    "F_N = 233 (prime)":     IDENTITY_FIB_N_PRIME,
    "F_N − N² = (D+1)^D":   IDENTITY_FIB_N_QUAD,
    # Lucas
    "L_0 = D−1":             IDENTITY_LUC_0_IS_DM1,
    "L_2 = D":               IDENTITY_LUC_2_IS_D,
    "L_D = D+1":             IDENTITY_LUC_D_IS_DP1,
    "L_{D+1} = D!+1":        IDENTITY_LUC_D1_IS_DFp1,
    "L_D×L_{D+1} = π(N)":   IDENTITY_LUC_PROD_PISANO_N,
    "L_0 + L_2 = q":         IDENTITY_LUC_SUM_IS_q,
    "L_0 × L_2 = D!":        IDENTITY_LUC_PROD_IS_DFACT,
    # Pisano
    "π(D) = 2^D":            IDENTITY_PISANO_D_IS_2D,
    "π(q) = F":              IDENTITY_PISANO_q_IS_F,
    "π(N) = L_D×L_{D+1}":   IDENTITY_PISANO_N_IS_LDLD1,
    "π(N) = (D+1)(D!+1)":   IDENTITY_PISANO_N_CATHEDRAL,
    # GCD
    "gcd(F_V,F_{D+1}) = D":  IDENTITY_GCD_FV_FD1_IS_D,
    "gcd(F_V,F_q) = 1":      IDENTITY_GCD_FV_Fq_IS_1,
    "gcd via index law":      IDENTITY_GCD_FV_FD1_VIA_IDX,
    # Golden ratio
    "φ = (1+√q)/2":          IDENTITY_PHI_FROM_q,
    "φ² = φ+1":              IDENTITY_PHI_SQUARED,
    "L_n/F_n → √q":          IDENTITY_LUC_FIB_RATIO_TO_SQRTq,
    # Relations
    "L_D = F_{D-1}+F_{D+1}": IDENTITY_LUCAS_FROM_FIB_D,
    "L_q = F_{q-1}+F_{q+1}": IDENTITY_LUCAS_FROM_FIB_q,
    "d'Ocagne at D":          IDENTITY_DOCAGNE_D,
    "d'Ocagne at q":          IDENTITY_DOCAGNE_q,
    "d'Ocagne at V":          IDENTITY_DOCAGNE_V,
    "Cassini at D":           IDENTITY_CASSINI_D,
    "Cassini at q":           IDENTITY_CASSINI_q,
    "Cassini at V":           IDENTITY_CASSINI_V,
}

N_FIB_IDENTITIES:  int  = len(ALL_FIB_IDENTITIES)
ALL_FIB_EXACT:     bool = all(ALL_FIB_IDENTITIES.values())

assert ALL_FIB_EXACT, f"Some Fibonacci-Lucas identities failed: " + \
    str([k for k, v in ALL_FIB_IDENTITIES.items() if not v])


# ── Section 13: Summary and report ───────────────────────────────────────────

def fibonacci_lucas_summary() -> dict:
    """Return a structured summary dict of all Fibonacci-Lucas Cathedral identities."""
    return {
        "module": "fibonacci_lucas_cathedral",
        "version": "2.9.29",
        # Fibonacci values
        "F_D":     F_D,        # 2 = D−1
        "F_D1":    F_D1,       # 3 = D     (self-referential)
        "F_q":     F_q,        # 5 = q     (self-referential miracle)
        "F_DFACT": F_DFACT,    # 8 = 2^D
        "F_2D":    F_2D,       # 8 = 2^D
        "F_7":     F_7,        # 13 = N
        "F_8":     F_8,        # 21 = D×(D!+1)
        "F_V":     F_V,        # 144 = V²  (spectacular)
        "F_N":     F_N,        # 233 (prime)
        # Lucas values
        "L_0":     L_0,        # 2 = D−1
        "L_2":     L_2,        # 3 = D
        "L_D":     L_D,        # 4 = D+1
        "L_D1":    L_D1,       # 7 = D!+1
        # Pisano periods
        "pisano_D": PISANO_D,  # 8 = 2^D
        "pisano_q": PISANO_q,  # 20 = F
        "pisano_N": PISANO_N,  # 28 = (D+1)×(D!+1)
        # GCD
        "gcd_FV_FD1": GCD_FV_FD1,   # 3 = D
        "gcd_FV_Fq":  GCD_FV_Fq,    # 1
        # Golden ratio
        "phi":      PHI,
        "phi_sq":   PHI ** 2,
        "sqrt_q":   sqrt(q),
        # Aggregate
        "n_identities": N_FIB_IDENTITIES,
        "all_exact":    ALL_FIB_EXACT,
        "identities":   ALL_FIB_IDENTITIES,
    }


def print_fibonacci_lucas_report() -> None:
    """Print a multi-line Cathedral report for Fibonacci and Lucas sequences."""
    s = fibonacci_lucas_summary()
    lines = [
        "=" * 70,
        "  FIBONACCI & LUCAS CATHEDRAL  (v2.9.29)",
        "  Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60",
        "=" * 70,
        "",
        "── Fibonacci self-referential miracles ─────────────────────────────",
        f"  F_{{D}}   = F_3  = {F_D:<4d}  = D−1 = {D-1}",
        f"  F_{{D+1}} = F_4  = {F_D1:<4d}  = D   = {D}   *** SELF-REFERENTIAL: F_{{D+1}} = D ***",
        f"  F_{{q}}   = F_5  = {F_q:<4d}  = q   = {q}   *** SELF-REFERENTIAL MIRACLE: F_q = q ***",
        f"  F_{{D!}}  = F_6  = {F_DFACT:<4d}  = 2^D = {2**D}  (index = D! = {factorial(D)})",
        f"  F_7        = {F_7:<4d}  = N   = {N}  (7th Fibonacci = icosahedral prime!)",
        f"  F_8        = {F_8:<4d}  = D×(D!+1) = {D}×{factorial(D)+1} = {D*(factorial(D)+1)}",
        f"  F_{{V}}   = F_12 = {F_V:<4d}  = V²  = {V}² = {V**2}  *** SPECTACULAR: F_V = V² ***",
        f"  F_{{N}}   = F_13 = {F_N:<4d}  (prime; F_N−N² = {F_N - N**2} = (D+1)^D = {(D+1)**D})",
        "",
        "── Lucas Cathedral identities ───────────────────────────────────────",
        f"  L_0 = {L_0}  = D−1 = {D-1}",
        f"  L_2 = {L_2}  = D   = {D}",
        f"  L_D = L_3 = {L_D}  = D+1 = {D+1}",
        f"  L_{{D+1}} = L_4 = {L_D1}  = D!+1 = {factorial(D)+1}",
        f"  L_0 + L_2 = {L_0}+{L_2} = {L_0+L_2} = q = {q}",
        f"  L_0 × L_2 = {L_0}×{L_2} = {L_0*L_2} = D! = {factorial(D)}",
        f"  L_D × L_{{D+1}} = {L_D}×{L_D1} = {L_D*L_D1} = π(N) = {PISANO_N}",
        "",
        "── Golden ratio ─────────────────────────────────────────────────────",
        f"  φ = (1+√q)/2 = (1+√{q})/2 = {PHI:.10f}  (Cathedral: q={q} appears under radical)",
        f"  φ² = φ+1 = {PHI**2:.10f}  (minimal polynomial x²−x−1=0)",
        f"  L_n/F_n → √q = √{q} = {sqrt(q):.10f}  as n→∞",
        "",
        "── Pisano periods ───────────────────────────────────────────────────",
        f"  π(D)  = π({D})  = {PISANO_D}  = 2^D = {2**D}     EXACT Cathedral!",
        f"  π(q)  = π({q})  = {PISANO_q}  = F   = {F}     (period mod q = icosahedral faces)",
        f"  π(N)  = π({N}) = {PISANO_N}  = (D+1)×(D!+1) = {D+1}×{factorial(D)+1} = {(D+1)*(factorial(D)+1)}",
        f"         = L_D × L_{{D+1}} = {L_D}×{L_D1} = {L_D*L_D1}  DOUBLE Cathedral!",
        "",
        "── GCD identities ───────────────────────────────────────────────────",
        f"  gcd(F_V, F_{{D+1}}) = gcd({F_V},{F_D1}) = {GCD_FV_FD1} = D = {D}  EXACT Cathedral!",
        f"  gcd(F_V, F_q)     = gcd({F_V},{F_q}) = {GCD_FV_Fq} = coprime",
        "",
        "── Relation identities ──────────────────────────────────────────────",
        f"  L_n = F_{{n-1}}+F_{{n+1}}  [L_{D}={L_D}={fib(D-1)}+{fib(D+1)}={fib(D-1)+fib(D+1)} ✓]",
        f"  F_{{2n}} = F_n×L_n  [F_{{2D}}=F_{2*D}={fib(2*D)}={fib(D)}×{lucas(D)}={fib(D)*lucas(D)} ✓]",
        f"  Cassini: F_{{n-1}}F_{{n+1}}−F_n² = (−1)^n  [n={V}: {fib(V-1)*fib(V+1)-fib(V)**2} = {(-1)**V} ✓]",
        "",
        "── Aggregate ────────────────────────────────────────────────────────",
        f"  Total identities: {N_FIB_IDENTITIES}   All exact: {ALL_FIB_EXACT}",
        "=" * 70,
    ]
    print("\n".join(lines))
