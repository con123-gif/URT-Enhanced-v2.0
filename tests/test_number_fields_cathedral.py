"""
Tests for urt/number_fields_cathedral.py — Algebraic Number Theory Cathedral identities.

Verifies that the Cathedral integers D=3, N=13, V=12, q=5, G=60, γ=1/81 appear
naturally throughout algebraic number theory: discriminants, class numbers, unit
groups, Galois groups, cyclotomic fields, ramification, p-adic valuations, Fermat
primes, Sophie Germain primes, genus theory, Minkowski bounds, and Pell equations.
"""

import pytest
from math import factorial, sqrt, pi


# ── Module import ──────────────────────────────────────────────────────────────


def test_module_imports():
    """The number_fields_cathedral module imports without error."""
    import urt.number_fields_cathedral


def test_all_exports_present():
    """All key constants and functions are exported from the module."""
    from urt.number_fields_cathedral import (
        # Discriminants
        DISC_Q_SQRT3, DISC_Q_SQRT5, DISC_Q_SQRT13,
        DISC_CYCLO_3_ABS, DISC_CYCLO_5_ABS,
        DISC_Q_SQRT_NEG3_ABS, DISC_Q_SQRT_NEG1_ABS,
        DISC_GOLDEN_POLY, DISC_X2_PLUS_3_ABS,
        # Class numbers
        H_Q_SQRT_NEG3, H_Q_SQRT_NEG7, H_Q_SQRT_NEG11,
        H_Q_SQRT_NEG13, H_Q_SQRT_NEG5,
        HEEGNER_NUMBERS, N_HEEGNER_NUMBERS, N_HEEGNER_LEQN,
        # Unit groups
        UNITS_Q_SQRT_NEG3, UNITS_Q_SQRT_NEG1, UNITS_GENERIC_IMAGINARY,
        DIRICHLET_RANK_QSQRT5, DIRICHLET_RANK_CYCLO5, NORM_PHI_Q_SQRT5,
        # Galois groups
        GAL_CYCLO_3, GAL_CYCLO_5, GAL_CYCLO_13, GAL_CYCLO_6, GAL_CYCLO_24,
        # Cyclotomic degrees
        DEG_CYCLO_3, DEG_CYCLO_5, DEG_CYCLO_13,
        # Ramification
        RAM_3_CYCLO_3, RAM_5_CYCLO_5, RAM_13_CYCLO_13,
        RAM_5_QSQRT5, RAM_3_QSQRT3,
        # Splitting
        N_MOD_12, Q_MOD_4, D_MOD_4, N_MOD_4, LEGENDRE_3_MOD_5,
        # Norms
        NORM_2_PLUS_I, NORM_1_PLUS_I, NORM_2_PLUS_SQRT_NEG3,
        # p-adic
        VP_D_DD, VP_3_81, VP_N_N2, VP_Q_QD, VP_3_9FACT,
        # Fermat, Sophie Germain
        FERMAT_0, FERMAT_1, FERMAT_2, N_FERMAT_KNOWN,
        SG_D, SG_Q, SG_D_EQ_DFACT_PLUS_1, SG_Q_EQ_2D_PLUS_Q,
        # Genus, Minkowski, Pell
        GENUS_Q_SQRT_NEG13,
        MINKOWSKI_Q_SQRT_NEG3, MINKOWSKI_Q_SQRT_NEG1,
        PELL_3_CHECK, PELL_5_CHECK,
        # Euler totients
        EULER_PHI_V, EULER_PHI_N, EULER_PHI_Q, EULER_PHI_G,
        DEGREE_Q_PHI,
        # Master list
        ALL_NUM_FIELD_IDENTITIES, ALL_NUM_FIELD_EXACT,
        # Functions
        discriminants_analysis, class_numbers_analysis,
        unit_groups_analysis, galois_analysis,
        ramification_analysis, fermat_sophie_analysis,
        summary, print_report,
    )


def test_all_identities_exact():
    """ALL_NUM_FIELD_EXACT is True: every IDENTITY_* boolean passes."""
    from urt.number_fields_cathedral import ALL_NUM_FIELD_EXACT
    assert ALL_NUM_FIELD_EXACT


def test_identity_count():
    """There are at least 30 IDENTITY_* booleans in the master list."""
    from urt.number_fields_cathedral import ALL_NUM_FIELD_IDENTITIES
    assert len(ALL_NUM_FIELD_IDENTITIES) >= 30


# ── Cathedral integer access ───────────────────────────────────────────────────


def test_cathedral_integers():
    """The Cathedral integers are accessible from shell_closure."""
    from urt.shell_closure import D, N, V, E, F, q, G
    assert D == 3
    assert N == 13
    assert V == 12
    assert q == 5
    assert G == 60


# ── DISCRIMINANTS ─────────────────────────────────────────────────────────────


def test_disc_sqrt3_is_V():
    """disc(Q(√3)) = 4×D = 12 = V because 3≡3 mod 4 implies disc=4d."""
    from urt.number_fields_cathedral import DISC_Q_SQRT3, IDENTITY_DISC_SQRT3_IS_V
    from urt.shell_closure import D, V
    assert DISC_Q_SQRT3 == 4 * D
    assert DISC_Q_SQRT3 == V
    assert DISC_Q_SQRT3 == 12
    assert IDENTITY_DISC_SQRT3_IS_V


def test_disc_sqrt5_is_q():
    """disc(Q(√5)) = 5 = q — self-referential: golden field discriminant = q!"""
    from urt.number_fields_cathedral import DISC_Q_SQRT5, IDENTITY_DISC_SQRT5_IS_Q
    from urt.shell_closure import q
    assert DISC_Q_SQRT5 == q
    assert DISC_Q_SQRT5 == 5
    assert IDENTITY_DISC_SQRT5_IS_Q
    # Verify: 5≡1 mod 4 so disc = d = 5 = q
    assert 5 % 4 == 1


def test_disc_sqrt13_is_N():
    """disc(Q(√13)) = 13 = N because 13≡1 mod 4."""
    from urt.number_fields_cathedral import DISC_Q_SQRT13, IDENTITY_DISC_SQRT13_IS_N
    from urt.shell_closure import N
    assert DISC_Q_SQRT13 == N
    assert DISC_Q_SQRT13 == 13
    assert IDENTITY_DISC_SQRT13_IS_N
    assert 13 % 4 == 1


def test_disc_cyclo3_is_D():
    """|disc(Q(ζ₃))| = 3 = D: cyclotomic discriminant for prime p=3."""
    from urt.number_fields_cathedral import DISC_CYCLO_3_ABS, IDENTITY_DISC_CYCLO3_IS_D
    from urt.shell_closure import D
    assert DISC_CYCLO_3_ABS == D
    assert DISC_CYCLO_3_ABS == 3
    assert IDENTITY_DISC_CYCLO3_IS_D


def test_disc_cyclo5_is_qD():
    """|disc(Q(ζ₅))| = 5^3 = 125 = q^D: cyclotomic discriminant for p=q=5."""
    from urt.number_fields_cathedral import DISC_CYCLO_5_ABS, IDENTITY_DISC_CYCLO5_IS_QD
    from urt.shell_closure import D, q
    assert DISC_CYCLO_5_ABS == q ** D
    assert DISC_CYCLO_5_ABS == 125
    assert IDENTITY_DISC_CYCLO5_IS_QD


def test_disc_sqrt_neg3_is_D():
    """|disc(Q(√-3))| = 3 = D because -3≡1 mod 4, so disc=-3."""
    from urt.number_fields_cathedral import DISC_Q_SQRT_NEG3_ABS, IDENTITY_DISC_SQRT_NEG3_IS_D
    from urt.shell_closure import D
    assert DISC_Q_SQRT_NEG3_ABS == D
    assert DISC_Q_SQRT_NEG3_ABS == 3
    assert IDENTITY_DISC_SQRT_NEG3_IS_D
    assert (-3) % 4 == 1  # -3≡1 mod 4 → disc = d = -3


def test_disc_sqrt_neg1_is_D1():
    """|disc(Q(√-1))| = 4 = D+1: Q(i) has discriminant -4."""
    from urt.number_fields_cathedral import DISC_Q_SQRT_NEG1_ABS, IDENTITY_DISC_SQRT_NEG1_IS_D1
    from urt.shell_closure import D
    assert DISC_Q_SQRT_NEG1_ABS == D + 1
    assert DISC_Q_SQRT_NEG1_ABS == 4
    assert IDENTITY_DISC_SQRT_NEG1_IS_D1


def test_disc_golden_poly_is_q():
    """disc(x²-x-1) = 1+4 = 5 = q — golden ratio polynomial discriminant."""
    from urt.number_fields_cathedral import DISC_GOLDEN_POLY, IDENTITY_DISC_GOLDEN_POLY_IS_Q
    from urt.shell_closure import q
    assert DISC_GOLDEN_POLY == q
    assert DISC_GOLDEN_POLY == 5
    assert IDENTITY_DISC_GOLDEN_POLY_IS_Q
    # disc(ax²+bx+c) = b²-4ac = 1+4=5 for x²-x-1


def test_disc_x2_plus_3_is_V():
    """|disc(x²+3)| = 12 = V: discriminant of minimal poly of √-3."""
    from urt.number_fields_cathedral import DISC_X2_PLUS_3_ABS, IDENTITY_DISC_X2_PLUS_3_IS_V
    from urt.shell_closure import V, D
    assert DISC_X2_PLUS_3_ABS == V
    assert DISC_X2_PLUS_3_ABS == 12
    assert DISC_X2_PLUS_3_ABS == 4 * D
    assert IDENTITY_DISC_X2_PLUS_3_IS_V


# ── CLASS NUMBERS ─────────────────────────────────────────────────────────────


def test_h_neg3_is_1():
    """h(Q(√-3)) = 1: D=3 is a Heegner number, so this field has class number 1."""
    from urt.number_fields_cathedral import H_Q_SQRT_NEG3, IDENTITY_H_NEG3_IS_1
    assert H_Q_SQRT_NEG3 == 1
    assert IDENTITY_H_NEG3_IS_1


def test_h_neg7_is_1():
    """h(Q(√-7)) = 1: 7=D!+1 is a Heegner number."""
    from urt.number_fields_cathedral import H_Q_SQRT_NEG7, IDENTITY_H_NEG7_IS_1
    from urt.shell_closure import D
    assert H_Q_SQRT_NEG7 == 1
    assert IDENTITY_H_NEG7_IS_1
    assert 7 == factorial(D) + 1  # Cathedral: 7 = D!+1


def test_h_neg11_is_1():
    """h(Q(√-11)) = 1: 11=2D+q is a Heegner number."""
    from urt.number_fields_cathedral import H_Q_SQRT_NEG11, IDENTITY_H_NEG11_IS_1
    from urt.shell_closure import D, q
    assert H_Q_SQRT_NEG11 == 1
    assert IDENTITY_H_NEG11_IS_1
    assert 11 == 2 * D + q  # Cathedral: 11 = 2D+q


def test_h_neg13_is_D1():
    """h(Q(√-13)) = 2 = D-1: this imaginary quadratic field has class number 2."""
    from urt.number_fields_cathedral import H_Q_SQRT_NEG13, IDENTITY_H_NEG13_IS_D1
    from urt.shell_closure import D
    assert H_Q_SQRT_NEG13 == D - 1
    assert H_Q_SQRT_NEG13 == 2
    assert IDENTITY_H_NEG13_IS_D1


def test_h_neg5_is_D1():
    """h(Q(√-5)) = 2 = D-1: another imaginary quadratic with class number 2."""
    from urt.number_fields_cathedral import H_Q_SQRT_NEG5, IDENTITY_H_NEG5_IS_D1
    from urt.shell_closure import D
    assert H_Q_SQRT_NEG5 == D - 1
    assert H_Q_SQRT_NEG5 == 2
    assert IDENTITY_H_NEG5_IS_D1


def test_n_heegner_is_D2():
    """There are exactly 9 = D² Heegner numbers (Stark–Heegner theorem)."""
    from urt.number_fields_cathedral import (
        HEEGNER_NUMBERS, N_HEEGNER_NUMBERS, IDENTITY_N_HEEGNER_IS_D2
    )
    from urt.shell_closure import D
    assert N_HEEGNER_NUMBERS == D ** 2
    assert N_HEEGNER_NUMBERS == 9
    assert len(HEEGNER_NUMBERS) == 9
    assert IDENTITY_N_HEEGNER_IS_D2
    # The 9 Heegner numbers
    assert HEEGNER_NUMBERS == [1, 2, 3, 7, 11, 19, 43, 67, 163]


def test_heegner_numbers_leqN_is_q():
    """There are exactly q=5 Heegner numbers ≤ N=13: {1, 2, 3, 7, 11}."""
    from urt.number_fields_cathedral import (
        HEEGNER_LEQN, N_HEEGNER_LEQN, IDENTITY_N_HEEGNER_LEQN_IS_Q
    )
    from urt.shell_closure import N, q
    assert len(HEEGNER_LEQN) == q
    assert N_HEEGNER_LEQN == q
    assert N_HEEGNER_LEQN == 5
    assert IDENTITY_N_HEEGNER_LEQN_IS_Q
    assert HEEGNER_LEQN == [1, 2, 3, 7, 11]
    assert all(h <= N for h in HEEGNER_LEQN)


# ── UNIT GROUPS ───────────────────────────────────────────────────────────────


def test_units_neg3_is_Dfact():
    """|O_{Q(√-3)}^×| = D! = 6 = V/2: the Eisenstein integers have 6 units."""
    from urt.number_fields_cathedral import UNITS_Q_SQRT_NEG3, IDENTITY_UNITS_NEG3_IS_DFACT
    from urt.shell_closure import D, V
    assert UNITS_Q_SQRT_NEG3 == factorial(D)
    assert UNITS_Q_SQRT_NEG3 == 6
    assert UNITS_Q_SQRT_NEG3 == V // 2
    assert IDENTITY_UNITS_NEG3_IS_DFACT


def test_units_neg1_is_D1():
    """|O_{Q(i)}^×| = D+1 = 4: Gaussian integers have 4 units {1,i,-1,-i}."""
    from urt.number_fields_cathedral import UNITS_Q_SQRT_NEG1, IDENTITY_UNITS_NEG1_IS_D1
    from urt.shell_closure import D
    assert UNITS_Q_SQRT_NEG1 == D + 1
    assert UNITS_Q_SQRT_NEG1 == 4
    assert IDENTITY_UNITS_NEG1_IS_D1


def test_units_generic_is_D1():
    """Generic imaginary quadratic fields have D-1=2 units (just ±1)."""
    from urt.number_fields_cathedral import UNITS_GENERIC_IMAGINARY, IDENTITY_UNITS_GENERIC_IS_D1
    from urt.shell_closure import D
    assert UNITS_GENERIC_IMAGINARY == D - 1
    assert UNITS_GENERIC_IMAGINARY == 2
    assert IDENTITY_UNITS_GENERIC_IS_D1


def test_norm_phi_is_neg1():
    """The golden ratio φ has norm N(φ) = -1 in Q(√5), confirming it's a unit."""
    from urt.number_fields_cathedral import NORM_PHI_Q_SQRT5, IDENTITY_NORM_PHI_IS_NEG1
    assert NORM_PHI_Q_SQRT5 == -1
    assert IDENTITY_NORM_PHI_IS_NEG1
    # Verify: N(φ) = φ·φ_bar = (1+√5)/2 · (1-√5)/2 = (1-5)/4 = -1
    phi_val = (1 + sqrt(5)) / 2
    phi_bar = (1 - sqrt(5)) / 2
    assert abs(phi_val * phi_bar - (-1)) < 1e-10


def test_dirichlet_ranks():
    """Dirichlet unit rank: Q(√5) and Q(ζ₅) both have rank 1."""
    from urt.number_fields_cathedral import DIRICHLET_RANK_QSQRT5, DIRICHLET_RANK_CYCLO5
    assert DIRICHLET_RANK_QSQRT5 == 1  # real quadratic: r1=2, r2=0, rank=2+0-1=1
    assert DIRICHLET_RANK_CYCLO5 == 1  # totally complex: r1=0, r2=2, rank=0+2-1=1


# ── GALOIS GROUPS ─────────────────────────────────────────────────────────────


def test_gal_cyclo3_is_D1():
    """|Gal(Q(ζ₃)/Q)| = φ(3) = 2 = D-1."""
    from urt.number_fields_cathedral import GAL_CYCLO_3, IDENTITY_GAL_CYCLO3_IS_D1
    from urt.shell_closure import D
    assert GAL_CYCLO_3 == D - 1
    assert GAL_CYCLO_3 == 2
    assert IDENTITY_GAL_CYCLO3_IS_D1


def test_gal_cyclo5_is_D1():
    """|Gal(Q(ζ₅)/Q)| = φ(5) = 4 = D+1 = q-1."""
    from urt.number_fields_cathedral import GAL_CYCLO_5, IDENTITY_GAL_CYCLO5_IS_D1
    from urt.shell_closure import D, q
    assert GAL_CYCLO_5 == D + 1
    assert GAL_CYCLO_5 == q - 1
    assert GAL_CYCLO_5 == 4
    assert IDENTITY_GAL_CYCLO5_IS_D1


def test_gal_cyclo13_is_V():
    """|Gal(Q(ζ₁₃)/Q)| = φ(13) = 12 = V = N-1 — Cathedral identity!"""
    from urt.number_fields_cathedral import GAL_CYCLO_13, IDENTITY_GAL_CYCLO13_IS_V
    from urt.shell_closure import N, V
    assert GAL_CYCLO_13 == V
    assert GAL_CYCLO_13 == N - 1
    assert GAL_CYCLO_13 == 12
    assert IDENTITY_GAL_CYCLO13_IS_V


def test_gal_cyclo24_is_2D():
    """|Gal(Q(ζ₂₄)/Q)| = φ(24) = 8 = 2^D."""
    from urt.number_fields_cathedral import GAL_CYCLO_24, IDENTITY_GAL_CYCLO24_IS_2D
    from urt.shell_closure import D
    assert GAL_CYCLO_24 == 2 ** D
    assert GAL_CYCLO_24 == 8
    assert IDENTITY_GAL_CYCLO24_IS_2D


# ── CYCLOTOMIC POLYNOMIAL DEGREES ─────────────────────────────────────────────


def test_deg_cyclo3_is_D1():
    """deg(Φ₃) = φ(3) = 2 = D-1: Φ₃(x) = x²+x+1."""
    from urt.number_fields_cathedral import DEG_CYCLO_3, IDENTITY_DEG_CYCLO3_IS_D1
    from urt.shell_closure import D
    assert DEG_CYCLO_3 == D - 1
    assert DEG_CYCLO_3 == 2
    assert IDENTITY_DEG_CYCLO3_IS_D1


def test_deg_cyclo5_is_D1():
    """deg(Φ₅) = φ(5) = 4 = D+1: Φ₅(x) = x⁴+x³+x²+x+1."""
    from urt.number_fields_cathedral import DEG_CYCLO_5, IDENTITY_DEG_CYCLO5_IS_D1
    from urt.shell_closure import D
    assert DEG_CYCLO_5 == D + 1
    assert DEG_CYCLO_5 == 4
    assert IDENTITY_DEG_CYCLO5_IS_D1


def test_deg_cyclo13_is_V():
    """deg(Φ₁₃) = φ(13) = 12 = V: degree of Φ₁₃ equals icosahedral vertex count."""
    from urt.number_fields_cathedral import DEG_CYCLO_13, IDENTITY_DEG_CYCLO13_IS_V
    from urt.shell_closure import V
    assert DEG_CYCLO_13 == V
    assert DEG_CYCLO_13 == 12
    assert IDENTITY_DEG_CYCLO13_IS_V


# ── RAMIFICATION ──────────────────────────────────────────────────────────────


def test_ram_3_cyclo3_is_D1():
    """Ramification e(3 in Q(ζ₃)) = φ(3) = 2 = D-1: 3 is totally ramified."""
    from urt.number_fields_cathedral import RAM_3_CYCLO_3, IDENTITY_RAM_3_CYCLO3_IS_D1
    from urt.shell_closure import D
    assert RAM_3_CYCLO_3 == D - 1
    assert RAM_3_CYCLO_3 == 2
    assert IDENTITY_RAM_3_CYCLO3_IS_D1


def test_ram_5_cyclo5_is_D1():
    """Ramification e(5 in Q(ζ₅)) = φ(5) = 4 = D+1: 5 is totally ramified."""
    from urt.number_fields_cathedral import RAM_5_CYCLO_5, IDENTITY_RAM_5_CYCLO5_IS_D1
    from urt.shell_closure import D
    assert RAM_5_CYCLO_5 == D + 1
    assert RAM_5_CYCLO_5 == 4
    assert IDENTITY_RAM_5_CYCLO5_IS_D1


def test_ram_13_cyclo13_is_V():
    """Ramification e(13 in Q(ζ₁₃)) = φ(13) = 12 = V — Cathedral!"""
    from urt.number_fields_cathedral import RAM_13_CYCLO_13, IDENTITY_RAM_13_CYCLO13_IS_V
    from urt.shell_closure import V
    assert RAM_13_CYCLO_13 == V
    assert RAM_13_CYCLO_13 == 12
    assert IDENTITY_RAM_13_CYCLO13_IS_V


def test_ram_sqrt5_is_D1():
    """5 is ramified in Q(√5) with e=2=D-1 since 5=disc divides exactly."""
    from urt.number_fields_cathedral import RAM_5_QSQRT5, IDENTITY_RAM_5_QSQRT5_IS_D1
    from urt.shell_closure import D
    assert RAM_5_QSQRT5 == D - 1
    assert RAM_5_QSQRT5 == 2
    assert IDENTITY_RAM_5_QSQRT5_IS_D1


def test_ram_sqrt3_is_D1():
    """3 is ramified in Q(√3) with e=2=D-1."""
    from urt.number_fields_cathedral import RAM_3_QSQRT3, IDENTITY_RAM_3_QSQRT3_IS_D1
    from urt.shell_closure import D
    assert RAM_3_QSQRT3 == D - 1
    assert RAM_3_QSQRT3 == 2
    assert IDENTITY_RAM_3_QSQRT3_IS_D1


# ── SPLITTING BEHAVIOR ────────────────────────────────────────────────────────


def test_N_splits_cyclo12():
    """N=13 splits completely in Q(ζ₁₂) because 13≡1 mod 12."""
    from urt.number_fields_cathedral import N_MOD_12, IDENTITY_N_SPLITS_CYCLO12
    from urt.shell_closure import N
    assert N_MOD_12 == 1
    assert N % 12 == 1
    assert IDENTITY_N_SPLITS_CYCLO12


def test_q_splits_in_Zi():
    """q=5≡1 mod 4 implies 5 splits in Z[i]: 5=(2+i)(2-i)."""
    from urt.number_fields_cathedral import Q_MOD_4, IDENTITY_Q_SPLITS_ZI
    from urt.shell_closure import q
    assert Q_MOD_4 == 1
    assert q % 4 == 1
    assert IDENTITY_Q_SPLITS_ZI


def test_D_inert_in_Zi():
    """D=3≡3 mod 4 implies 3 is inert in Z[i]: no Gaussian integer has norm 3."""
    from urt.number_fields_cathedral import D_MOD_4, IDENTITY_D_INERT_ZI
    from urt.shell_closure import D
    assert D_MOD_4 == D  # 3 mod 4 = 3 = D
    assert D % 4 == D
    assert IDENTITY_D_INERT_ZI


def test_N_splits_in_Zi():
    """N=13≡1 mod 4 implies 13 splits in Z[i]."""
    from urt.number_fields_cathedral import N_MOD_4, IDENTITY_N_SPLITS_ZI
    from urt.shell_closure import N
    assert N_MOD_4 == 1
    assert N % 4 == 1
    assert IDENTITY_N_SPLITS_ZI


def test_q_inert_in_Qsqrt3():
    """Legendre symbol (3|5) = -1: q=5 is inert in Q(√3)."""
    from urt.number_fields_cathedral import LEGENDRE_3_MOD_5, IDENTITY_Q_INERT_QSQRT3
    from urt.shell_closure import D, q
    assert LEGENDRE_3_MOD_5 == -1
    assert IDENTITY_Q_INERT_QSQRT3
    # Verify via direct computation: 3^((5-1)/2) mod 5 = 3^2 mod 5 = 9 mod 5 = 4 = -1 mod 5
    assert pow(D, (q - 1) // 2, q) == q - 1  # = 4 ≡ -1 mod 5


# ── ALGEBRAIC NORMS ───────────────────────────────────────────────────────────


def test_norm_2_plus_i_is_q():
    """N_{Q(i)/Q}(2+i) = 4+1 = 5 = q — Gaussian norm gives Cathedral q!"""
    from urt.number_fields_cathedral import NORM_2_PLUS_I, IDENTITY_NORM_2I_IS_Q
    from urt.shell_closure import q
    assert NORM_2_PLUS_I == q
    assert NORM_2_PLUS_I == 5
    assert NORM_2_PLUS_I == 4 + 1
    assert IDENTITY_NORM_2I_IS_Q


def test_norm_1_plus_i_is_D1():
    """N_{Q(i)/Q}(1+i) = 1+1 = 2 = D-1: the fundamental prime above 2."""
    from urt.number_fields_cathedral import NORM_1_PLUS_I, IDENTITY_NORM_1I_IS_D1
    from urt.shell_closure import D
    assert NORM_1_PLUS_I == D - 1
    assert NORM_1_PLUS_I == 2
    assert IDENTITY_NORM_1I_IS_D1


def test_norm_2_plus_sqrt_neg3_is_Dfact1():
    """N_{Q(√-3)/Q}(2+√-3) = 4+3 = 7 = D!+1 — norm gives another Cathedral integer."""
    from urt.number_fields_cathedral import (
        NORM_2_PLUS_SQRT_NEG3, IDENTITY_NORM_2SQRT3_IS_DFACT1
    )
    from urt.shell_closure import D
    assert NORM_2_PLUS_SQRT_NEG3 == factorial(D) + 1
    assert NORM_2_PLUS_SQRT_NEG3 == 7
    assert IDENTITY_NORM_2SQRT3_IS_DFACT1


# ── P-ADIC VALUATIONS ─────────────────────────────────────────────────────────


def test_vp_D_DD_is_D():
    """v_D(D^D) = v₃(27) = D = 3: trivially v_p(p^n) = n."""
    from urt.number_fields_cathedral import VP_D_DD, IDENTITY_VP_D_DD_IS_D
    from urt.shell_closure import D
    assert VP_D_DD == D
    assert VP_D_DD == 3
    assert IDENTITY_VP_D_DD_IS_D


def test_vp_3_81_is_D1():
    """v₃(3^(D+1)) = v₃(81) = D+1 = 4: γ=1/81=1/3^(D+1) in denominator."""
    from urt.number_fields_cathedral import VP_3_81, IDENTITY_VP_3_81_IS_D1
    from urt.shell_closure import D
    assert VP_3_81 == D + 1
    assert VP_3_81 == 4
    assert IDENTITY_VP_3_81_IS_D1


def test_vp_N_N2_is_D1():
    """v_N(N²) = v₁₃(169) = 2 = D-1."""
    from urt.number_fields_cathedral import VP_N_N2, IDENTITY_VP_N_N2_IS_D1
    from urt.shell_closure import D
    assert VP_N_N2 == D - 1
    assert VP_N_N2 == 2
    assert IDENTITY_VP_N_N2_IS_D1


def test_vp_q_qD_is_D():
    """v_q(q^D) = v₅(125) = D = 3."""
    from urt.number_fields_cathedral import VP_Q_QD, IDENTITY_VP_Q_QD_IS_D
    from urt.shell_closure import D
    assert VP_Q_QD == D
    assert VP_Q_QD == 3
    assert IDENTITY_VP_Q_QD_IS_D


def test_vp_3_9fact_is_D1():
    """v₃(9!) = D+1 = 4: Legendre formula for v₃(9!) gives D+1."""
    from urt.number_fields_cathedral import VP_3_9FACT, IDENTITY_VP_3_9FACT_IS_D1
    from urt.shell_closure import D
    assert VP_3_9FACT == D + 1
    assert VP_3_9FACT == 4
    assert IDENTITY_VP_3_9FACT_IS_D1
    # Manual verification: floor(9/3)+floor(9/9) = 3+1 = 4 = D+1


# ── FERMAT PRIMES ─────────────────────────────────────────────────────────────


def test_fermat_0_is_D():
    """F₀ = 2^(2^0)+1 = 3 = D: first Fermat prime is the spatial dimension!"""
    from urt.number_fields_cathedral import FERMAT_0, IDENTITY_FERMAT_0_IS_D
    from urt.shell_closure import D
    assert FERMAT_0 == D
    assert FERMAT_0 == 3
    assert IDENTITY_FERMAT_0_IS_D


def test_fermat_1_is_q():
    """F₁ = 2^(2^1)+1 = 5 = q: second Fermat prime is the pentagonal number q!"""
    from urt.number_fields_cathedral import FERMAT_1, IDENTITY_FERMAT_1_IS_Q
    from urt.shell_closure import q
    assert FERMAT_1 == q
    assert FERMAT_1 == 5
    assert IDENTITY_FERMAT_1_IS_Q


def test_fermat_2_value():
    """F₂ = 2^(2^2)+1 = 17."""
    from urt.number_fields_cathedral import FERMAT_2
    assert FERMAT_2 == 17


def test_N_fermat_known_is_q():
    """Only q=5 Fermat primes are known (F₀ through F₄)."""
    from urt.number_fields_cathedral import N_FERMAT_KNOWN, IDENTITY_N_FERMAT_IS_Q
    from urt.shell_closure import q
    assert N_FERMAT_KNOWN == q
    assert N_FERMAT_KNOWN == 5
    assert IDENTITY_N_FERMAT_IS_Q


# ── SOPHIE GERMAIN PRIMES ─────────────────────────────────────────────────────


def test_SG_D_is_prime():
    """2×D+1 = 7 is prime: D=3 is a Sophie Germain prime."""
    from urt.number_fields_cathedral import SG_D, IDENTITY_SG_D_IS_PRIME
    from urt.shell_closure import D
    assert SG_D == 2 * D + 1
    assert SG_D == 7
    assert IDENTITY_SG_D_IS_PRIME


def test_SG_q_is_prime():
    """2×q+1 = 11 is prime: q=5 is a Sophie Germain prime."""
    from urt.number_fields_cathedral import SG_Q, IDENTITY_SG_Q_IS_PRIME
    from urt.shell_closure import q
    assert SG_Q == 2 * q + 1
    assert SG_Q == 11
    assert IDENTITY_SG_Q_IS_PRIME


def test_SG_D_is_Dfact1():
    """SG(D) = 7 = D!+1: Sophie Germain partner of D equals D-factorial plus 1."""
    from urt.number_fields_cathedral import SG_D, IDENTITY_SG_D_IS_DFACT1, SG_D_EQ_DFACT_PLUS_1
    from urt.shell_closure import D
    assert SG_D_EQ_DFACT_PLUS_1 == factorial(D) + 1
    assert SG_D_EQ_DFACT_PLUS_1 == 7
    assert SG_D == 7
    assert IDENTITY_SG_D_IS_DFACT1


def test_SG_q_is_2D_q():
    """SG(q) = 11 = 2D+q: Sophie Germain partner of q is a Cathedral linear combination."""
    from urt.number_fields_cathedral import SG_Q, IDENTITY_SG_Q_IS_2D_Q, SG_Q_EQ_2D_PLUS_Q
    from urt.shell_closure import D, q
    assert SG_Q_EQ_2D_PLUS_Q == 2 * D + q
    assert SG_Q_EQ_2D_PLUS_Q == 11
    assert SG_Q == 11
    assert IDENTITY_SG_Q_IS_2D_Q


# ── GENUS THEORY ──────────────────────────────────────────────────────────────


def test_genus_neg13_is_D1():
    """Genus number of Q(√-13) = 2 = D-1: two ramified primes (2 and 13)."""
    from urt.number_fields_cathedral import GENUS_Q_SQRT_NEG13, IDENTITY_GENUS_NEG13_IS_D1
    from urt.shell_closure import D
    assert GENUS_Q_SQRT_NEG13 == D - 1
    assert GENUS_Q_SQRT_NEG13 == 2
    assert IDENTITY_GENUS_NEG13_IS_D1


# ── MINKOWSKI BOUNDS ──────────────────────────────────────────────────────────


def test_minkowski_neg3_lt_2():
    """Minkowski bound for Q(√-3) < 2, proving class number 1 directly."""
    from urt.number_fields_cathedral import MINKOWSKI_Q_SQRT_NEG3, IDENTITY_MINK_NEG3_LT_2
    assert MINKOWSKI_Q_SQRT_NEG3 < 2
    assert IDENTITY_MINK_NEG3_LT_2
    # Numerically: (2/pi)*sqrt(3) ≈ 1.10
    assert abs(MINKOWSKI_Q_SQRT_NEG3 - (2 / pi) * sqrt(3)) < 1e-10


def test_minkowski_neg1_lt_2():
    """Minkowski bound for Q(i) < 2, proving class number 1 directly."""
    from urt.number_fields_cathedral import MINKOWSKI_Q_SQRT_NEG1, IDENTITY_MINK_NEG1_LT_2
    assert MINKOWSKI_Q_SQRT_NEG1 < 2
    assert IDENTITY_MINK_NEG1_LT_2
    # Numerically: (2/pi)*sqrt(4) = 4/pi ≈ 1.27
    assert abs(MINKOWSKI_Q_SQRT_NEG1 - 4 / pi) < 1e-10


# ── PELL EQUATIONS ────────────────────────────────────────────────────────────


def test_pell_3_holds():
    """x²-3y²=1 with (x,y)=(2,1) is the Pell solution for Q(√3)."""
    from urt.number_fields_cathedral import PELL_3_CHECK, PELL_3_X, PELL_3_Y, IDENTITY_PELL_3_HOLDS
    from urt.shell_closure import D
    assert PELL_3_CHECK == 1
    assert PELL_3_X ** 2 - D * PELL_3_Y ** 2 == 1
    assert IDENTITY_PELL_3_HOLDS


def test_pell_5_holds():
    """x²-5y²=-4 with (x,y)=(1,1): fundamental unit φ of Q(√5)."""
    from urt.number_fields_cathedral import PELL_5_CHECK, PELL_5_X, PELL_5_Y, IDENTITY_PELL_5_HOLDS
    from urt.shell_closure import D, q
    assert PELL_5_CHECK == -(D + 1)
    assert PELL_5_CHECK == -4
    assert PELL_5_X ** 2 - q * PELL_5_Y ** 2 == -(D + 1)
    assert IDENTITY_PELL_5_HOLDS


# ── EULER TOTIENTS ────────────────────────────────────────────────────────────


def test_euler_phi_V_is_D1():
    """φ(V) = φ(12) = 4 = D+1: units in Z/12Z."""
    from urt.number_fields_cathedral import EULER_PHI_V, IDENTITY_EULER_PHI_V_IS_D1
    from urt.shell_closure import D
    assert EULER_PHI_V == D + 1
    assert EULER_PHI_V == 4
    assert IDENTITY_EULER_PHI_V_IS_D1


def test_euler_phi_N_is_V():
    """φ(N) = φ(13) = 12 = V: N is prime so φ(N) = N-1 = V."""
    from urt.number_fields_cathedral import EULER_PHI_N, IDENTITY_EULER_PHI_N_IS_V
    from urt.shell_closure import N, V
    assert EULER_PHI_N == V
    assert EULER_PHI_N == 12
    assert EULER_PHI_N == N - 1
    assert IDENTITY_EULER_PHI_N_IS_V


def test_euler_phi_q_is_D1():
    """φ(q) = φ(5) = 4 = D+1: q is prime so φ(q) = q-1 = D+1."""
    from urt.number_fields_cathedral import EULER_PHI_Q, IDENTITY_EULER_PHI_Q_IS_D1
    from urt.shell_closure import D, q
    assert EULER_PHI_Q == D + 1
    assert EULER_PHI_Q == q - 1
    assert EULER_PHI_Q == 4
    assert IDENTITY_EULER_PHI_Q_IS_D1


def test_euler_phi_G_is_D12():
    """φ(G) = φ(60) = 16 = (D+1)²: Euler totient of |A₅|."""
    from urt.number_fields_cathedral import EULER_PHI_G, IDENTITY_EULER_PHI_G_IS_D12
    from urt.shell_closure import D
    assert EULER_PHI_G == (D + 1) ** 2
    assert EULER_PHI_G == 16
    assert IDENTITY_EULER_PHI_G_IS_D12


def test_degree_Q_phi_is_D1():
    """[Q(φ):Q] = D-1 = 2: golden ratio has degree 2 minimal polynomial."""
    from urt.number_fields_cathedral import DEGREE_Q_PHI, IDENTITY_DEGREE_Q_PHI_IS_D1
    from urt.shell_closure import D
    assert DEGREE_Q_PHI == D - 1
    assert DEGREE_Q_PHI == 2
    assert IDENTITY_DEGREE_Q_PHI_IS_D1


# ── SUMMARY FUNCTIONS ─────────────────────────────────────────────────────────


def test_discriminants_analysis():
    """discriminants_analysis() returns correct dict with expected keys."""
    from urt.number_fields_cathedral import discriminants_analysis
    result = discriminants_analysis()
    assert isinstance(result, dict)
    assert result["disc_Q_sqrt3_is_V"] is True
    assert result["disc_Q_sqrt5_is_q"] is True
    assert result["disc_Q_sqrt13_is_N"] is True
    assert result["disc_cyclo3_is_D"] is True
    assert result["disc_cyclo5_is_qD"] is True


def test_class_numbers_analysis():
    """class_numbers_analysis() returns Heegner data."""
    from urt.number_fields_cathedral import class_numbers_analysis
    result = class_numbers_analysis()
    assert result["h_neg3_is_1"] is True
    assert result["h_neg13_is_D1"] is True
    assert result["N_heegner_is_D2"] is True
    assert result["N_heegner_leqN_is_q"] is True
    assert result["N_heegner"] == 9


def test_unit_groups_analysis():
    """unit_groups_analysis() returns unit group data."""
    from urt.number_fields_cathedral import unit_groups_analysis
    result = unit_groups_analysis()
    assert result["units_neg3_is_Dfact"] is True
    assert result["units_neg1_is_D1"] is True
    assert result["norm_phi_is_neg1"] is True


def test_galois_analysis():
    """galois_analysis() returns Galois group data."""
    from urt.number_fields_cathedral import galois_analysis
    result = galois_analysis()
    assert result["gal_cyclo13_is_V"] is True
    assert result["gal_cyclo5_is_D1"] is True
    assert result["gal_cyclo24_is_2D"] is True


def test_ramification_analysis():
    """ramification_analysis() returns splitting/ramification data."""
    from urt.number_fields_cathedral import ramification_analysis
    result = ramification_analysis()
    assert result["N_splits_cyclo12"] is True
    assert result["q_splits_Zi"] is True
    assert result["D_inert_Zi"] is True
    assert result["q_inert_Qsqrt3"] is True
    assert result["ram_13_cyclo13_is_V"] is True


def test_fermat_sophie_analysis():
    """fermat_sophie_analysis() returns Fermat and Sophie Germain data."""
    from urt.number_fields_cathedral import fermat_sophie_analysis
    result = fermat_sophie_analysis()
    assert result["F0_is_D"] is True
    assert result["F1_is_q"] is True
    assert result["N_fermat_is_q"] is True
    assert result["SG_D_is_prime"] is True
    assert result["SG_q_is_prime"] is True


def test_summary():
    """summary() returns a complete dict with all_exact=True."""
    from urt.number_fields_cathedral import summary
    result = summary()
    assert result["all_exact"] is True
    assert result["n_identities"] >= 30
    assert result["n_false"] == 0
    assert "discriminants" in result
    assert "class_numbers" in result
    assert "unit_groups" in result
    assert "galois_groups" in result
    assert "ramification" in result
    assert "fermat_sophie" in result
    assert "constants" in result
    assert result["constants"]["D"] == 3
    assert result["constants"]["N"] == 13


def test_print_report_runs():
    """print_report() executes without error."""
    from urt.number_fields_cathedral import print_report
    print_report()  # should not raise


# ── Cross-module consistency ───────────────────────────────────────────────────


def test_disc_sqrt3_matches_V():
    """disc(Q(√3)) matches shell_closure V."""
    from urt.number_fields_cathedral import DISC_Q_SQRT3
    from urt.shell_closure import V
    assert DISC_Q_SQRT3 == V


def test_gal_cyclo13_matches_V():
    """|Gal(Q(ζ₁₃)/Q)| matches shell_closure V."""
    from urt.number_fields_cathedral import GAL_CYCLO_13
    from urt.shell_closure import V
    assert GAL_CYCLO_13 == V


def test_disc_sqrt5_self_referential():
    """disc(Q(√5)) = q = 5: the golden-ratio field discriminant IS the pentagonal q."""
    from urt.number_fields_cathedral import DISC_Q_SQRT5
    from urt.shell_closure import q
    # Self-referential: q describes the discriminant of its own Galois extension
    assert DISC_Q_SQRT5 == q
    # Phi is a root of x²-x-1, and disc(x²-x-1) = 1+4 = 5 = q
    phi_val = (1 + sqrt(5)) / 2
    assert abs(phi_val ** 2 - phi_val - 1) < 1e-10
