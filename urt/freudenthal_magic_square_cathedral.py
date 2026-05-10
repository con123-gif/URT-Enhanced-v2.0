"""
urt/freudenthal_magic_square_cathedral.py — Freudenthal-Tits magic square Cathedral.

The 4×4 symmetric magic square M(A,B) built from pairs of normed division algebras
{R, C, H, O} (dims {1, D-1, D+1, 2^D}) encodes ALL Cathedral integers as Lie
algebra dimensions.  Crown jewel: the C-row sums to 137 = N²−E−(D−1) = bare 1/α.
The full 4×4 matrix sum equals 987 = F_{N+D} = F₁₆ (Fibonacci miracle).
"""

from math import factorial, comb
from fractions import Fraction
from urt.shell_closure import D, N, V, E, F, q, G, DELTA_STAR, gamma

# ── Division algebra dimensions (inputs to the magic square) ─────────────────
DIM_R: int = 1           # reals     R
DIM_C: int = 2           # complex   C   = D − 1
DIM_H: int = 4           # quaternions H  = D + 1
DIM_O: int = 8           # octonions  O  = 2^D

N_NDA_MAGIC: int = D + 1  # Hurwitz theorem: exactly 4 normed division algebras

IDENTITY_DIM_C_IS_D_MINUS_1: bool = (DIM_C == D - 1)   # 2 = 2 ✓
IDENTITY_DIM_H_IS_D_PLUS_1:  bool = (DIM_H == D + 1)   # 4 = 4 ✓
IDENTITY_DIM_O_IS_2_TO_D:    bool = (DIM_O == 2**D)    # 8 = 8 ✓
IDENTITY_N_NDA_IS_D_PLUS_1:  bool = (N_NDA_MAGIC == D + 1)  # 4 ✓

# ── Magic square entries M(A,B) — Lie algebra dimensions ─────────────────────
#
#      R    C    H    O
#  R [ 3    8   21   52 ]     A₁  A₂   C₃   F₄
#  C [ 8   16   35   78 ]     A₂  A₂⊕A₂  A₅  E₆
#  H [21   35   66  133 ]     C₃  A₅   D₆   E₇
#  O [52   78  133  248 ]     F₄  E₆   E₇   E₈

M_RR: int = 3    # A₁ = su(2) = so(3)        dim = 3   = D
M_RC: int = 8    # A₂ = su(3)                dim = 8   = 2^D
M_RH: int = 21   # C₃ = sp(6)                dim = 21  = D×(D!+1)
M_RO: int = 52   # F₄                        dim = 52  = 4N

M_CC: int = 16   # A₂⊕A₂                     dim = 16  = N+D = 2^(D+1)
M_CH: int = 35   # A₅ = sl(6)  rank q=5       dim = 35  = E+q  (ARF D35!)
M_CO: int = 78   # E₆          rank D!=6       dim = 78  = D!×N

M_HH: int = 66   # D₆ = so(12) rank D!=6      dim = 66  = C(V,2)
M_HO: int = 133  # E₇          rank D!+1=7     dim = 133 = N²−V×D
M_OO: int = 248  # E₈          rank 2^D=8      dim = 248 = 2^D×(2^q−1)

# ── Cathedral identities for each entry ──────────────────────────────────────
IDENTITY_M_RR_IS_D:              bool = (M_RR == D)
IDENTITY_M_RC_IS_2D:             bool = (M_RC == 2**D)
IDENTITY_M_RH_IS_D_TIMES_D_FACT1: bool = (M_RH == D * (factorial(D) + 1))
IDENTITY_M_RO_IS_4N:             bool = (M_RO == 4 * N)
IDENTITY_M_CC_IS_N_PLUS_D:       bool = (M_CC == N + D)
IDENTITY_M_CC_IS_2_TO_D1:        bool = (M_CC == 2**(D + 1))
IDENTITY_M_CH_IS_E_PLUS_q:       bool = (M_CH == E + q)       # ARF D35!
IDENTITY_M_CO_IS_DFACT_N:        bool = (M_CO == factorial(D) * N)
IDENTITY_M_HH_IS_COMB_V_2:       bool = (M_HH == comb(V, 2))
IDENTITY_M_HO_IS_N_SQ_MINUS_VD:  bool = (M_HO == N**2 - V * D)
IDENTITY_M_OO_IS_2D_2Q_1:        bool = (M_OO == 2**D * (2**q - 1))

# ── Ranks of magic square Lie algebras ───────────────────────────────────────
RANK_RR: int = 1
RANK_RC: int = 2    # = D − 1
RANK_RH: int = 3    # = D
RANK_RO: int = 4    # = D + 1
RANK_CC: int = 4    # = D + 1
RANK_CH: int = 5    # = q
RANK_CO: int = 6    # = D!
RANK_HH: int = 6    # = D!
RANK_HO: int = 7    # = D! + 1
RANK_OO: int = 8    # = 2^D

IDENTITY_RANK_CH_IS_q:    bool = (RANK_CH == q)
IDENTITY_RANK_CO_IS_DFACT: bool = (RANK_CO == factorial(D))
IDENTITY_RANK_HO_IS_DFACT1: bool = (RANK_HO == factorial(D) + 1)
IDENTITY_RANK_OO_IS_2D:    bool = (RANK_OO == 2**D)

# ── Row (= column) sums of the 4×4 symmetric matrix ─────────────────────────
ROW_R_SUM: int = M_RR + M_RC + M_RH + M_RO    # = 84  = D!×(N+1)
ROW_C_SUM: int = M_RC + M_CC + M_CH + M_CO    # = 137 = N²−E−(D−1) ← BARE 1/α!
ROW_H_SUM: int = M_RH + M_CH + M_HH + M_HO   # = 255 = D×q×(N+D+1)
ROW_O_SUM: int = M_RO + M_CO + M_HO + M_OO   # = 511 = 2^(D²)−1

IDENTITY_ROW_R_IS_DFACT_N1:    bool = (ROW_R_SUM == factorial(D) * (N + 1))
IDENTITY_ROW_C_IS_BARE_ALPHA:   bool = (ROW_C_SUM == N**2 - E - (D - 1))   # 137 !!!
IDENTITY_ROW_H_IS_D_q_N1:       bool = (ROW_H_SUM == D * q * (N + D + 1))
IDENTITY_ROW_O_IS_2_D2_MINUS_1: bool = (ROW_O_SUM == 2**(D**2) - 1)

# ── Full 4×4 matrix sum (counts off-diagonal entries twice) ─────────────────
MAGIC_MATRIX_SUM: int = ROW_R_SUM + ROW_C_SUM + ROW_H_SUM + ROW_O_SUM
# = 84 + 137 + 255 + 511 = 987 = F_{N+D} = F_{16} (Fibonacci!)

# Fibonacci sequence — F_{N+D} = F_16 = 987
def _fib(n: int) -> int:
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a

FIB_N_PLUS_D: int = _fib(N + D)    # F_{16} = 987

IDENTITY_MAGIC_SUM_IS_FIB_ND: bool = (MAGIC_MATRIX_SUM == FIB_N_PLUS_D)   # 987 ✓

# ── Unique-entry sum (upper triangle incl. diagonal — 10 entries) ────────────
MAGIC_UNIQUE_SUM: int = (
    M_RR + M_RC + M_RH + M_RO +
    M_CC + M_CH + M_CO +
    M_HH + M_HO +
    M_OO
)
# = 3+8+21+52+16+35+78+66+133+248 = 660
# 660 = |PSL(2,11)| — order of the simple group PSL(2,11)
PSL_2_11_ORDER: int = 660

IDENTITY_UNIQUE_SUM_IS_PSL211: bool = (MAGIC_UNIQUE_SUM == PSL_2_11_ORDER)

# ── Diagonal and off-diagonal sums ───────────────────────────────────────────
MAGIC_DIAGONAL_SUM: int = M_RR + M_CC + M_HH + M_OO    # = 3+16+66+248 = 333
MAGIC_OFF_DIAG_SUM: int = M_RC + M_RH + M_RO + M_CH + M_CO + M_HO  # = 327

IDENTITY_DIAGONAL_SUM: bool = (MAGIC_DIAGONAL_SUM == 333)
# 333 = 3×111 = D×111; note also 333+330 = 663? Hmm. Let's record it.
MAGIC_DIAGONAL_THIRD: bool = (MAGIC_DIAGONAL_SUM == D * 111)

# ── A₅ in the magic square ───────────────────────────────────────────────────
# M(C,H) = A₅ = sl(6): the icosahedral rotation group is A₅=PSL(2,5)!
# A₅ appears at position (C,H) because H has dim D+1=4 imag units and
# C×H gives the algebra of rank q=5 with dim E+q=35=D35 (the ARF denominator).
A5_IN_MAGIC: int = M_CH   # = 35 = E + q
IDENTITY_A5_DIM_IS_E_PLUS_q: bool = (A5_IN_MAGIC == E + q)
IDENTITY_A5_RANK_IS_q:        bool = (RANK_CH == q)

# ── E₈ connection ─────────────────────────────────────────────────────────────
# M(O,O) = E₈ dim 248 = 2^D × (2^q − 1) already known; rank = 2^D = 8
E8_DIM_MAGIC:  int = M_OO   # = 248
E8_RANK_MAGIC: int = RANK_OO  # = 8 = 2^D
IDENTITY_E8_RANK_IS_2D: bool = (E8_RANK_MAGIC == 2**D)

# ── Summary bookkeeping ───────────────────────────────────────────────────────
ALL_MAGIC_IDENTITIES: dict = {
    "dim_C_is_D-1":       IDENTITY_DIM_C_IS_D_MINUS_1,
    "dim_H_is_D+1":       IDENTITY_DIM_H_IS_D_PLUS_1,
    "dim_O_is_2^D":       IDENTITY_DIM_O_IS_2_TO_D,
    "N_NDA_is_D+1":       IDENTITY_N_NDA_IS_D_PLUS_1,
    "M(R,R)=D":           IDENTITY_M_RR_IS_D,
    "M(R,C)=2^D":         IDENTITY_M_RC_IS_2D,
    "M(R,H)=D*(D!+1)":    IDENTITY_M_RH_IS_D_TIMES_D_FACT1,
    "M(R,O)=4N":          IDENTITY_M_RO_IS_4N,
    "M(C,C)=N+D":         IDENTITY_M_CC_IS_N_PLUS_D,
    "M(C,C)=2^(D+1)":     IDENTITY_M_CC_IS_2_TO_D1,
    "M(C,H)=E+q (D35)":   IDENTITY_M_CH_IS_E_PLUS_q,
    "M(C,O)=D!*N":        IDENTITY_M_CO_IS_DFACT_N,
    "M(H,H)=C(V,2)":      IDENTITY_M_HH_IS_COMB_V_2,
    "M(H,O)=N^2-V*D":     IDENTITY_M_HO_IS_N_SQ_MINUS_VD,
    "M(O,O)=2^D*(2^q-1)": IDENTITY_M_OO_IS_2D_2Q_1,
    "rank(C,H)=q":         IDENTITY_RANK_CH_IS_q,
    "rank(C,O)=D!":        IDENTITY_RANK_CO_IS_DFACT,
    "rank(H,O)=D!+1":      IDENTITY_RANK_HO_IS_DFACT1,
    "rank(O,O)=2^D":       IDENTITY_RANK_OO_IS_2D,
    "row_R=D!*(N+1)":      IDENTITY_ROW_R_IS_DFACT_N1,
    "row_C=137=1/alpha":   IDENTITY_ROW_C_IS_BARE_ALPHA,     # THE MIRACLE
    "row_H=D*q*(N+D+1)":   IDENTITY_ROW_H_IS_D_q_N1,
    "row_O=2^(D^2)-1":     IDENTITY_ROW_O_IS_2_D2_MINUS_1,
    "matrix_sum=F(N+D)":   IDENTITY_MAGIC_SUM_IS_FIB_ND,    # 987=F_16
    "unique_sum=|PSL(2,11)|": IDENTITY_UNIQUE_SUM_IS_PSL211,
    "A5_dim=E+q":          IDENTITY_A5_DIM_IS_E_PLUS_q,
    "A5_rank=q":           IDENTITY_A5_RANK_IS_q,
    "E8_rank=2^D":         IDENTITY_E8_RANK_IS_2D,
}

ALL_MAGIC_EXACT: bool = all(ALL_MAGIC_IDENTITIES.values())
N_MAGIC_IDENTITIES: int = len(ALL_MAGIC_IDENTITIES)

assert ALL_MAGIC_EXACT, f"Freudenthal magic square identities failed: {[k for k,v in ALL_MAGIC_IDENTITIES.items() if not v]}"


def magic_square_matrix() -> list[list[int]]:
    """Return the 4×4 Freudenthal magic square as nested lists."""
    return [
        [M_RR, M_RC, M_RH, M_RO],
        [M_RC, M_CC, M_CH, M_CO],
        [M_RH, M_CH, M_HH, M_HO],
        [M_RO, M_CO, M_HO, M_OO],
    ]


def magic_summary() -> dict:
    return {
        "division_algebra_dims": [DIM_R, DIM_C, DIM_H, DIM_O],
        "row_sums":  [ROW_R_SUM, ROW_C_SUM, ROW_H_SUM, ROW_O_SUM],
        "row_C_sum": ROW_C_SUM,
        "row_C_is_137": IDENTITY_ROW_C_IS_BARE_ALPHA,
        "matrix_total": MAGIC_MATRIX_SUM,
        "matrix_total_is_F16": IDENTITY_MAGIC_SUM_IS_FIB_ND,
        "unique_sum": MAGIC_UNIQUE_SUM,
        "all_magic_exact": ALL_MAGIC_EXACT,
        "n_identities": N_MAGIC_IDENTITIES,
    }


def print_magic_report() -> None:
    mat = magic_square_matrix()
    labels = ["R  (dim 1)", "C  (dim 2=D-1)", "H  (dim 4=D+1)", "O  (dim 8=2^D)"]
    algs   = ["A₁", "A₂⊕A₂", "D₆", "E₈"]
    row_algs = [
        ["A₁=su(2)", "A₂=su(3)", "C₃=sp(6)", "F₄"],
        ["A₂=su(3)", "A₂⊕A₂",   "A₅=sl(6)", "E₆"],
        ["C₃=sp(6)", "A₅=sl(6)", "D₆=so(12)","E₇"],
        ["F₄",       "E₆",       "E₇",        "E₈"],
    ]

    print("═" * 72)
    print("  FREUDENTHAL-TITS MAGIC SQUARE — CATHEDRAL STRUCTURE (v2.9.37)")
    print("  M(A,B) = Lie algebra from normed division algebras A, B")
    print("═" * 72)
    print()
    print(f"  Division algebra dims:  dim(R)=1  dim(C)={DIM_C}=D-1  dim(H)={DIM_H}=D+1  dim(O)={DIM_O}=2^D")
    print(f"  Hurwitz theorem: exactly N_NDA = D+1 = {N_NDA_MAGIC} normed division algebras")
    print()
    print("  The 4×4 magic square (Lie algebra dimensions):")
    print(f"  {'':>18}  {'R':>4}  {'C':>4}  {'H':>4}  {'O':>4}  │  Sum")
    print("  " + "─" * 56)
    row_labels = ["R (reals)", "C (complex)", "H (quat.)", "O (octon.)"]
    for i, (row, rl) in enumerate(zip(mat, row_labels)):
        row_sum = sum(row)
        print(f"  {rl:<18}  {row[0]:>4}  {row[1]:>4}  {row[2]:>4}  {row[3]:>4}  │  {row_sum}", end="")
        notes = {84: " = D!×(N+1)", 137: " = N²−E−(D−1) = 137 = BARE 1/α  !!!", 255: " = D×q×(N+D+1)", 511: " = 2^(D²)−1"}
        print(notes.get(row_sum, ""))
    print("  " + "─" * 56)
    print(f"  {'Total (full 4×4)':>18}  {'84':>4}  {'137':>4}  {'255':>4}  {'511':>4}  │  {MAGIC_MATRIX_SUM} = F_{{{N+D}}} = F_{{16}} (Fibonacci!)")
    print()
    print("  ┌─────────────────────────────────────────────────────────────────┐")
    print("  │  CROWN JEWEL: C-row sum = 8+16+35+78 = 137 = bare 1/α EXACT   │")
    print(f"  │  FIBONACCI:  total 4×4 matrix sum = 987 = F_{{N+D}} = F_{{16}}     │")
    print("  └─────────────────────────────────────────────────────────────────┘")
    print()
    print("  Individual entry Cathedral identities:")
    entries = [
        ("M(R,R)", M_RR, "A₁",   f"= D = {D}"),
        ("M(R,C)", M_RC, "A₂",   f"= 2^D = {2**D}"),
        ("M(R,H)", M_RH, "C₃",   f"= D×(D!+1) = {D*(factorial(D)+1)}"),
        ("M(R,O)", M_RO, "F₄",   f"= 4N = {4*N}"),
        ("M(C,C)", M_CC, "A₂⊕A₂",f"= N+D = 2^(D+1) = {N+D}"),
        ("M(C,H)", M_CH, "A₅",   f"= E+q = ARF-D35 = {E+q}  (rank q={q})"),
        ("M(C,O)", M_CO, "E₆",   f"= D!×N = {factorial(D)*N}  (rank D!={factorial(D)})"),
        ("M(H,H)", M_HH, "D₆",   f"= C(V,2) = {comb(V,2)}  (rank D!={factorial(D)})"),
        ("M(H,O)", M_HO, "E₇",   f"= N²−V×D = {N**2-V*D}  (rank D!+1={factorial(D)+1})"),
        ("M(O,O)", M_OO, "E₈",   f"= 2^D×(2^q−1) = {2**D*(2**q-1)}  (rank 2^D={2**D})"),
    ]
    for name, val, alg, desc in entries:
        print(f"    {name} = {val:>3}  [{alg:<7}]  {desc}")
    print()
    print(f"  Unique-entry sum (10 entries): {MAGIC_UNIQUE_SUM} = |PSL(2,11)|")
    print(f"  All {N_MAGIC_IDENTITIES} identities verified: {ALL_MAGIC_EXACT}")
