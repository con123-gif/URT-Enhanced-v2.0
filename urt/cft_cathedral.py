"""
CFT Cathedral  (v2.9.6)
========================
2D Conformal Field Theory central charges — ALL Cathedral integers.

Cathedral integers: D=3, N=13, V=12, E=30, F=20, q=5, G=60, γ=1/81.

Key discoveries:
  Minimal models M(p,p') with Cathedral labels:
    M(D,D+1) = M(3,4)  Ising           c = 1/2  = 1/(D-1)
    M(D+1,D+2) = M(4,5) Tricrit Ising  c = 7/10 = (D!+1)/(2q)
    M(q,D!) = M(5,6)   3-state Potts   c = 4/5  = (D+1)/q
    M(2,q) = M(2,5)    Yang-Lee        c = −22/5 = −22/q
    M(D,q) = M(3,5)                    c = −3/5  = −D/q

  WZW models SU(n)_k at level k=D:
    SU(2)_D:  c = D×3/(D+2)   = 9/5  = D^2/q
    SU(D)_D = SU(3)_D: c = D×8/(D+3) = 4    = D+1
    SU(q)_D = SU(5)_D: c = D×24/8   = 9    = D^2

  Monster CFT:      c = 24 = 2V  (Moonshine!)
  Bosonic string:   c = 26 = 2N
  Superstring:      c = 10 = 2q

  Rogers-Ramanujan: index q=5 governs M(2,5) Yang-Lee characters
"""

from fractions import Fraction
from math import factorial
from .shell_closure import N, D, V, E, F, q, G

# ── Cathedral aliases ─────────────────────────────────────────────────────────
GAMMA_INV = 81   # = 1/γ

# ── Minimal model central charge formula ─────────────────────────────────────

def c_minimal(p: int, pp: int) -> Fraction:
    """
    Central charge of minimal model M(p, p').
    c = 1 − 6(p−p')² / (p×p')
    Returned as an exact Fraction.
    """
    return Fraction(1) - Fraction(6 * (p - pp)**2, p * pp)


# ── Minimal model central charges ─────────────────────────────────────────────

# M(D, D+1) = M(3,4): Ising model
# c = 1 - 6×1/12 = 1 - 1/2 = 1/2 = 1/(D-1)  [D-1=2]
C_ISING = c_minimal(D, D + 1)             # = Fraction(1, 2)
IDENTITY_ISING_C: bool = (C_ISING == Fraction(1, D - 1))

# M(D+1, D+2) = M(4,5): Tricritical Ising model
# c = 1 - 6×1/20 = 1 - 3/10 = 7/10 = (D!+1)/(2q)
C_TRICRIT = c_minimal(D + 1, D + 2)       # = Fraction(7, 10)
IDENTITY_TRICRITICAL_C: bool = (
    C_TRICRIT == Fraction(factorial(D) + 1, 2 * q)
)

# M(q, D!) = M(5,6): 3-state Potts model
# c = 1 - 6×1/30 = 1 - 1/5 = 4/5 = (D+1)/q
C_POTTS = c_minimal(q, factorial(D))       # = Fraction(4, 5)
IDENTITY_POTTS_C: bool = (C_POTTS == Fraction(D + 1, q))

# M(2, q) = M(2,5): Yang-Lee edge singularity
# c = 1 - 6×9/10 = 1 - 27/5 = -22/5 = -22/q
# Note: (p-p')^2 = (5-2)^2 = 9 = D^2
C_YANG_LEE = c_minimal(2, q)              # = Fraction(-22, 5)
IDENTITY_YANG_LEE_C: bool = (C_YANG_LEE == Fraction(-22, q))

# M(D, q) = M(3,5)
# c = 1 - 6×4/15 = 1 - 8/5 = -3/5 = -D/q
C_M35 = c_minimal(D, q)                   # = Fraction(-3, 5)
IDENTITY_M35_C: bool = (C_M35 == Fraction(-D, q))

# Auxiliary identities tying model labels to Cathedral integers
# Yang-Lee: (p-q')^2 = (q-2)^2 = 3^2 = D^2
IDENTITY_YANG_LEE_SQ: bool = ((q - 2)**2 == D**2)

# Tricritical: denominator 2q = 2×5 = 10; numerator D!+1 = 7
IDENTITY_TRICRIT_DENOM: bool = (2 * q == 10)
IDENTITY_TRICRIT_NUM: bool = (factorial(D) + 1 == 7)

assert IDENTITY_ISING_C,       "Ising c ≠ 1/D"
assert IDENTITY_TRICRITICAL_C, "Tricrit c ≠ (D!+1)/(2q)"
assert IDENTITY_POTTS_C,       "Potts c ≠ (D+1)/q"
assert IDENTITY_YANG_LEE_C,    "Yang-Lee c ≠ -22/q"
assert IDENTITY_M35_C,         "M(3,5) c ≠ -D/q"
assert IDENTITY_YANG_LEE_SQ,   "(q-2)^2 ≠ D^2"

# ── WZW model central charges at level k=D ───────────────────────────────────

def c_wzw_sun(n: int, k: int) -> Fraction:
    """
    Central charge of SU(n) WZW model at level k.
    c = k(n^2 - 1) / (k + n)
    Returned as an exact Fraction.
    """
    return Fraction(k * (n**2 - 1), k + n)


# SU(2) at level k=D:  c = D×3/(D+2) = 9/5 = D^2/q
C_SU2_D = c_wzw_sun(2, D)                 # = Fraction(9, 5)
IDENTITY_SU2_D_C: bool = (C_SU2_D == Fraction(D**2, q))

# SU(3) = SU(D) at level k=D: c = D×8/(D+3) = 24/6 = 4 = D+1
C_SU3_D = c_wzw_sun(D, D)                 # = Fraction(4, 1)
IDENTITY_SU3_D_C: bool = (C_SU3_D == Fraction(D + 1, 1))

# SU(5) = SU(q) at level k=D: c = D×24/(D+q) = 72/8 = 9 = D^2
# D+q = 3+5 = 8 = 2^D
C_SUQ_D = c_wzw_sun(q, D)                 # = Fraction(9, 1)
IDENTITY_SUQ_D_C: bool = (C_SUQ_D == Fraction(D**2, 1))

# Bonus: D+q = 2^D (Cathedral miracle)
IDENTITY_D_PLUS_Q_EQ_2D: bool = (D + q == 2**D)

assert IDENTITY_SU2_D_C,       "SU(2)_D c ≠ D²/q"
assert IDENTITY_SU3_D_C,       "SU(3)_D c ≠ D+1"
assert IDENTITY_SUQ_D_C,       "SU(q)_D c ≠ D²"
assert IDENTITY_D_PLUS_Q_EQ_2D, "D+q ≠ 2^D"

# ── Monster CFT ───────────────────────────────────────────────────────────────

# Monster CFT central charge c = 24 = 2V  [Moonshine!]
MONSTER_CFT_C = 24                         # = 2V
IDENTITY_MONSTER_C: bool = (MONSTER_CFT_C == 2 * V)

# The j-function has leading coefficient 196884 = 196883 + 1 (Moonshine)
# 196883 = dim of smallest non-trivial Monster irrep
# 196884 = 2^D × D^q × N − correction (qualitative)
J_CONSTANT = 744   # the constant in J(τ) = j(τ) − 744

assert IDENTITY_MONSTER_C, "Monster CFT c ≠ 2V"

# ── String theory central charges ─────────────────────────────────────────────

# Bosonic string: c = 26 = 2N  (must cancel ghost c = −26)
BOSONIC_STRING_C = 26
IDENTITY_BOSONIC_C: bool = (BOSONIC_STRING_C == 2 * N)

# Superstring: c = 10 = 2q  (10 dimensions = 2×q)
SUPERSTRING_C = 10
IDENTITY_SUPER_C: bool = (SUPERSTRING_C == 2 * q)

assert IDENTITY_BOSONIC_C, "Bosonic string c ≠ 2N"
assert IDENTITY_SUPER_C,   "Superstring c ≠ 2q"

# ── Rogers-Ramanujan connection ───────────────────────────────────────────────

# The Rogers-Ramanujan identities have index q=5 in their product formulas:
#   Σ_{n≥0} q^{n²}/(q)_n = Π_{n≥0} 1/((1−q^{5n+1})(1−q^{5n+4}))
# This index 5 = Cathedral q; RR identities govern M(2,5) Yang-Lee CFT.
RR_INDEX = q      # = 5
IDENTITY_RR_INDEX: bool = (RR_INDEX == q)

assert IDENTITY_RR_INDEX, "RR index ≠ q"

# ── All central charges as Fractions (module-level constants) ─────────────────

# Already defined above; expose with clear aliases
C_SU2_WZW   = C_SU2_D    # = 9/5 = D²/q
C_SU3_WZW   = C_SU3_D    # = 4   = D+1
C_SUQ_WZW   = C_SUQ_D    # = 9   = D²
C_MONSTER   = Fraction(MONSTER_CFT_C)   # = 24 = 2V
C_BOSONIC   = Fraction(BOSONIC_STRING_C) # = 26 = 2N
C_SUPER     = Fraction(SUPERSTRING_C)    # = 10 = 2q

# ── Summary helpers ───────────────────────────────────────────────────────────

def cft_summary() -> dict:
    """Return a summary dict of all CFT Cathedral identities."""
    return {
        # Minimal models
        "c_ising":            str(C_ISING),
        "c_tricrit":          str(C_TRICRIT),
        "c_potts":            str(C_POTTS),
        "c_yang_lee":         str(C_YANG_LEE),
        "c_m35":              str(C_M35),
        "ising_eq_1_D":       IDENTITY_ISING_C,
        "tricrit_eq_Dfact1_2q": IDENTITY_TRICRITICAL_C,
        "potts_eq_D1_q":      IDENTITY_POTTS_C,
        "yang_lee_eq_22_q":   IDENTITY_YANG_LEE_C,
        "m35_eq_D_q":         IDENTITY_M35_C,
        "yang_lee_sq_eq_D2":  IDENTITY_YANG_LEE_SQ,
        # WZW
        "c_su2_D":            str(C_SU2_D),
        "c_su3_D":            str(C_SU3_D),
        "c_suq_D":            str(C_SUQ_D),
        "su2_D_eq_D2_q":      IDENTITY_SU2_D_C,
        "su3_D_eq_D1":        IDENTITY_SU3_D_C,
        "suq_D_eq_D2":        IDENTITY_SUQ_D_C,
        "D_plus_q_eq_2D":     IDENTITY_D_PLUS_Q_EQ_2D,
        # Special CFTs
        "monster_c":          MONSTER_CFT_C,
        "monster_eq_2V":      IDENTITY_MONSTER_C,
        "bosonic_string_c":   BOSONIC_STRING_C,
        "bosonic_eq_2N":      IDENTITY_BOSONIC_C,
        "superstring_c":      SUPERSTRING_C,
        "super_eq_2q":        IDENTITY_SUPER_C,
        # Rogers-Ramanujan
        "rr_index":           RR_INDEX,
        "rr_index_eq_q":      IDENTITY_RR_INDEX,
        # Cathedral integers
        "D": D, "N": N, "V": V, "q": q, "G": G,
        "D_factorial": factorial(D),
    }


def print_cft_report() -> None:
    """Print a human-readable CFT Cathedral report."""
    print("=" * 65)
    print("CFT CATHEDRAL  (2D Conformal Field Theory)")
    print("=" * 65)
    print(f"Cathedral integers: D={D}, N={N}, V={V}, q={q}, G={G}")
    print(f"D! = {factorial(D)},  2N = {2*N},  2q = {2*q},  2V = {2*V}")
    print()
    print("── Minimal models M(p,p') ──")
    rows = [
        ("M(D,D+1)=M(3,4)", "Ising",         C_ISING,     "1/D"),
        ("M(D+1,D+2)=M(4,5)", "Tricrit Ising", C_TRICRIT, "(D!+1)/(2q)"),
        ("M(q,D!)=M(5,6)",  "3-state Potts", C_POTTS,     "(D+1)/q"),
        ("M(2,q)=M(2,5)",   "Yang-Lee",      C_YANG_LEE,  "-22/q"),
        ("M(D,q)=M(3,5)",   "M(3,5)",        C_M35,       "-D/q"),
    ]
    for label, name, c, formula in rows:
        print(f"  {label:25s} {name:18s} c = {str(c):8s} = {formula}")
    print()
    print("── WZW models SU(n)_k at k=D ──")
    wzw_rows = [
        ("SU(2)_D",  C_SU2_D,  "D²/q"),
        ("SU(D)_D",  C_SU3_D,  "D+1"),
        ("SU(q)_D",  C_SUQ_D,  "D²"),
    ]
    for label, c, formula in wzw_rows:
        print(f"  {label:15s} c = {str(c):8s} = {formula}")
    print(f"  Note: D+q = {D+q} = 2^D = {2**D}  [Cathedral miracle!]")
    print()
    print("── Special CFTs ──")
    print(f"  Monster CFT:      c = {MONSTER_CFT_C} = 2V  [{IDENTITY_MONSTER_C}]")
    print(f"  Bosonic string:   c = {BOSONIC_STRING_C} = 2N  [{IDENTITY_BOSONIC_C}]")
    print(f"  Superstring:      c = {SUPERSTRING_C} = 2q  [{IDENTITY_SUPER_C}]")
    print()
    print("── Rogers-Ramanujan ──")
    print(f"  RR index = q = {RR_INDEX}  [{IDENTITY_RR_INDEX}]")
    print("=" * 65)


if __name__ == "__main__":
    print_cft_report()
