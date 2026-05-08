"""Tests for urt/normed_division_algebras_cathedral.py — Normed division algebras Cathedral."""

import pytest
from math import factorial


# ── Import test ───────────────────────────────────────────────────────────────

def test_imports():
    from urt.normed_division_algebras_cathedral import (
        N_NDA, DIM_R, DIM_C, DIM_H, DIM_O,
        IMAG_UNITS_R, IMAG_UNITS_C, IMAG_UNITS_H, IMAG_UNITS_O,
        N_ASSOCIATIVE_RDA,
        CD_DOUBLINGS_TO_C, CD_DOUBLINGS_TO_H, CD_DOUBLINGS_TO_O,
        CROSS_PRODUCT_DIM_1, CROSS_PRODUCT_DIM_2, N_CROSS_PRODUCT_DIMS,
        HOPF_C_TOTAL, HOPF_H_FIBRE, HOPF_H_BASE, HOPF_H_TOTAL,
        HOPF_O_FIBRE, HOPF_O_BASE, HOPF_O_TOTAL,
        ORDER_BINARY_ICOSAHEDRAL, ORDER_BINARY_TETRAHEDRAL,
        N_BINARY_POLYHEDRAL,
        EXT_0_DIM, EXT_1_DIM, EXT_2_DIM, EXT_3_DIM, EXT_TOTAL_DIM,
        ORDER_Q8, N_Q8_SUBGROUPS_ORDER4,
        DIM_SKEW_D,
        VECTOR_FIELDS_S3, VECTOR_FIELDS_S7,
        N_UNIT_QUAT_FINITE_ORDER,
        ALL_NDA_IDENTITIES, ALL_NDA_EXACT,
        nda_summary, print_nda_report,
    )


# ── Number of normed division algebras ───────────────────────────────────────

def test_n_nda_eq_D1():
    """Number of normed division algebras = D+1 = 4 (Hurwitz theorem)."""
    from urt.normed_division_algebras_cathedral import N_NDA
    from urt.shell_closure import D
    assert N_NDA == D + 1
    assert N_NDA == 4


def test_n_nda_identity_flag():
    """IDENTITY_N_NDA flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_N_NDA
    assert IDENTITY_N_NDA is True


# ── Dimensions of each NDA ───────────────────────────────────────────────────

def test_dim_R_eq_D2():
    """dim(R) = 1 = D-2."""
    from urt.normed_division_algebras_cathedral import DIM_R
    from urt.shell_closure import D
    assert DIM_R == D - 2
    assert DIM_R == 1


def test_dim_C_eq_D1():
    """dim(C) = 2 = D-1."""
    from urt.normed_division_algebras_cathedral import DIM_C
    from urt.shell_closure import D
    assert DIM_C == D - 1
    assert DIM_C == 2


def test_dim_H_eq_D1():
    """dim(H) = 4 = D+1."""
    from urt.normed_division_algebras_cathedral import DIM_H
    from urt.shell_closure import D
    assert DIM_H == D + 1
    assert DIM_H == 4


def test_dim_O_eq_2D():
    """dim(O) = 8 = 2^D."""
    from urt.normed_division_algebras_cathedral import DIM_O
    from urt.shell_closure import D
    assert DIM_O == 2**D
    assert DIM_O == 8


def test_dim_doubling_sequence():
    """Dimensions double at each Cayley-Dickson step: 1,2,4,8."""
    from urt.normed_division_algebras_cathedral import DIM_R, DIM_C, DIM_H, DIM_O
    assert DIM_C == 2 * DIM_R
    assert DIM_H == 2 * DIM_C
    assert DIM_O == 2 * DIM_H


# ── Imaginary units ───────────────────────────────────────────────────────────

def test_imag_units_R_zero():
    """R has 0 imaginary units."""
    from urt.normed_division_algebras_cathedral import IMAG_UNITS_R
    assert IMAG_UNITS_R == 0


def test_imag_units_C_eq_D2():
    """C has 1 = D-2 imaginary unit."""
    from urt.normed_division_algebras_cathedral import IMAG_UNITS_C
    from urt.shell_closure import D
    assert IMAG_UNITS_C == D - 2
    assert IMAG_UNITS_C == 1


def test_imag_units_H_eq_D():
    """H has 3 = D imaginary units {i,j,k} — SELF-REFERENTIAL."""
    from urt.normed_division_algebras_cathedral import IMAG_UNITS_H
    from urt.shell_closure import D
    assert IMAG_UNITS_H == D
    assert IMAG_UNITS_H == 3


def test_imag_units_O_eq_Dfactorial_plus_1():
    """O has 7 = D!+1 imaginary units."""
    from urt.normed_division_algebras_cathedral import IMAG_UNITS_O
    from urt.shell_closure import D
    assert IMAG_UNITS_O == factorial(D) + 1
    assert IMAG_UNITS_O == 7


def test_imag_H_identity_flag():
    """IDENTITY_IMAG_H flag is True (self-referential)."""
    from urt.normed_division_algebras_cathedral import IDENTITY_IMAG_H
    assert IDENTITY_IMAG_H is True


def test_imag_O_identity_flag():
    """IDENTITY_IMAG_O flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_IMAG_O
    assert IDENTITY_IMAG_O is True


# ── Frobenius theorem ─────────────────────────────────────────────────────────

def test_frobenius_eq_D():
    """Only D=3 real associative division algebras exist (R, C, H) — SELF-REFERENTIAL."""
    from urt.normed_division_algebras_cathedral import N_ASSOCIATIVE_RDA
    from urt.shell_closure import D
    assert N_ASSOCIATIVE_RDA == D
    assert N_ASSOCIATIVE_RDA == 3


def test_frobenius_identity_flag():
    """IDENTITY_FROBENIUS flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_FROBENIUS
    assert IDENTITY_FROBENIUS is True


# ── Cayley-Dickson doublings ──────────────────────────────────────────────────

def test_cd_doublings_to_C():
    """Cayley-Dickson: 1 = D-2 doubling to reach C."""
    from urt.normed_division_algebras_cathedral import CD_DOUBLINGS_TO_C
    from urt.shell_closure import D
    assert CD_DOUBLINGS_TO_C == D - 2
    assert CD_DOUBLINGS_TO_C == 1


def test_cd_doublings_to_H():
    """Cayley-Dickson: 2 = D-1 doublings to reach H."""
    from urt.normed_division_algebras_cathedral import CD_DOUBLINGS_TO_H
    from urt.shell_closure import D
    assert CD_DOUBLINGS_TO_H == D - 1
    assert CD_DOUBLINGS_TO_H == 2


def test_cd_doublings_to_O():
    """Cayley-Dickson: 3 = D doublings to reach O — SELF-REFERENTIAL."""
    from urt.normed_division_algebras_cathedral import CD_DOUBLINGS_TO_O
    from urt.shell_closure import D
    assert CD_DOUBLINGS_TO_O == D
    assert CD_DOUBLINGS_TO_O == 3


def test_cd_O_identity_flag():
    """IDENTITY_CD_TO_O flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_CD_TO_O
    assert IDENTITY_CD_TO_O is True


# ── Cross product uniqueness ──────────────────────────────────────────────────

def test_cross_product_dim_1():
    """Cross product exists in R^D = R^3."""
    from urt.normed_division_algebras_cathedral import CROSS_PRODUCT_DIM_1
    from urt.shell_closure import D
    assert CROSS_PRODUCT_DIM_1 == D
    assert CROSS_PRODUCT_DIM_1 == 3


def test_cross_product_dim_2():
    """Cross product exists in R^{D!+1} = R^7."""
    from urt.normed_division_algebras_cathedral import CROSS_PRODUCT_DIM_2
    from urt.shell_closure import D
    assert CROSS_PRODUCT_DIM_2 == factorial(D) + 1
    assert CROSS_PRODUCT_DIM_2 == 7


def test_n_cross_product_dims():
    """Only D-1 = 2 dimensions admit a cross product."""
    from urt.normed_division_algebras_cathedral import N_CROSS_PRODUCT_DIMS
    from urt.shell_closure import D
    assert N_CROSS_PRODUCT_DIMS == D - 1
    assert N_CROSS_PRODUCT_DIMS == 2


# ── Hopf fibrations ───────────────────────────────────────────────────────────

def test_hopf_C_total_eq_D():
    """Hopf C-fibration total space = S^D = S^3."""
    from urt.normed_division_algebras_cathedral import HOPF_C_TOTAL
    from urt.shell_closure import D
    assert HOPF_C_TOTAL == D
    assert HOPF_C_TOTAL == 3


def test_hopf_H_fibre_eq_D():
    """Hopf H-fibration fibre = S^D = S^3."""
    from urt.normed_division_algebras_cathedral import HOPF_H_FIBRE
    from urt.shell_closure import D
    assert HOPF_H_FIBRE == D
    assert HOPF_H_FIBRE == 3


def test_hopf_H_base_eq_D1():
    """Hopf H-fibration base = S^{D+1} = S^4."""
    from urt.normed_division_algebras_cathedral import HOPF_H_BASE
    from urt.shell_closure import D
    assert HOPF_H_BASE == D + 1
    assert HOPF_H_BASE == 4


def test_hopf_H_total_eq_Dfactorial_plus_1():
    """Hopf H-fibration total space = S^{D!+1} = S^7."""
    from urt.normed_division_algebras_cathedral import HOPF_H_TOTAL
    from urt.shell_closure import D
    assert HOPF_H_TOTAL == factorial(D) + 1
    assert HOPF_H_TOTAL == 7


def test_hopf_O_fibre_eq_Dfactorial_plus_1():
    """Hopf O-fibration fibre = S^{D!+1} = S^7."""
    from urt.normed_division_algebras_cathedral import HOPF_O_FIBRE
    from urt.shell_closure import D
    assert HOPF_O_FIBRE == factorial(D) + 1
    assert HOPF_O_FIBRE == 7


def test_hopf_O_base_eq_2D():
    """Hopf O-fibration base = S^{2^D} = S^8."""
    from urt.normed_division_algebras_cathedral import HOPF_O_BASE
    from urt.shell_closure import D
    assert HOPF_O_BASE == 2**D
    assert HOPF_O_BASE == 8


def test_hopf_O_total_eq_V_plus_D():
    """Hopf O-fibration total = S^{V+D} = S^15 — Cathedral!"""
    from urt.normed_division_algebras_cathedral import HOPF_O_TOTAL
    from urt.shell_closure import V, D
    assert HOPF_O_TOTAL == V + D
    assert HOPF_O_TOTAL == 15


def test_hopf_O_total_identity_flag():
    """IDENTITY_HOPF_O_TOTAL flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_HOPF_O_TOTAL
    assert IDENTITY_HOPF_O_TOTAL is True


# ── Binary icosahedral group ──────────────────────────────────────────────────

def test_binary_icosahedral_order_eq_2G():
    """|2I| = 2G = 120."""
    from urt.normed_division_algebras_cathedral import ORDER_BINARY_ICOSAHEDRAL
    from urt.shell_closure import G
    assert ORDER_BINARY_ICOSAHEDRAL == 2 * G
    assert ORDER_BINARY_ICOSAHEDRAL == 120


def test_binary_icosahedral_identity_flag():
    """IDENTITY_BINARY_ICOS flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_BINARY_ICOS
    assert IDENTITY_BINARY_ICOS is True


def test_n_binary_polyhedral_eq_q():
    """Number of binary polyhedral groups = q = 5."""
    from urt.normed_division_algebras_cathedral import N_BINARY_POLYHEDRAL
    from urt.shell_closure import q
    assert N_BINARY_POLYHEDRAL == q
    assert N_BINARY_POLYHEDRAL == 5


def test_binary_tetrahedral_eq_2V():
    """|Binary tetrahedral 2T| = 2V = 24."""
    from urt.normed_division_algebras_cathedral import ORDER_BINARY_TETRAHEDRAL
    from urt.shell_closure import V
    assert ORDER_BINARY_TETRAHEDRAL == 2 * V
    assert ORDER_BINARY_TETRAHEDRAL == 24


# ── Exterior algebra ──────────────────────────────────────────────────────────

def test_ext_0_dim_eq_D2():
    """dim ∧^0 R^D = 1 = D-2."""
    from urt.normed_division_algebras_cathedral import EXT_0_DIM
    from urt.shell_closure import D
    assert EXT_0_DIM == D - 2
    assert EXT_0_DIM == 1


def test_ext_1_dim_eq_D():
    """dim ∧^1 R^D = D = 3."""
    from urt.normed_division_algebras_cathedral import EXT_1_DIM
    from urt.shell_closure import D
    assert EXT_1_DIM == D
    assert EXT_1_DIM == 3


def test_ext_2_dim_eq_D():
    """dim ∧^2 R^D = D(D-1)/2 = D = 3 — SELF-REFERENTIAL."""
    from urt.normed_division_algebras_cathedral import EXT_2_DIM
    from urt.shell_closure import D
    assert EXT_2_DIM == D * (D - 1) // 2
    assert EXT_2_DIM == D
    assert EXT_2_DIM == 3


def test_ext_3_dim_eq_D2():
    """dim ∧^3 R^D = 1 = D-2."""
    from urt.normed_division_algebras_cathedral import EXT_3_DIM
    from urt.shell_closure import D
    assert EXT_3_DIM == D - 2
    assert EXT_3_DIM == 1


def test_ext_1_eq_ext_2():
    """dim ∧^1 = dim ∧^2 = D — unique coincidence in D=3."""
    from urt.normed_division_algebras_cathedral import EXT_1_DIM, EXT_2_DIM
    assert EXT_1_DIM == EXT_2_DIM


def test_ext_total_dim_eq_2D():
    """Total dim ∧*(R^D) = 2^D = 8."""
    from urt.normed_division_algebras_cathedral import EXT_TOTAL_DIM
    from urt.shell_closure import D
    assert EXT_TOTAL_DIM == 2**D
    assert EXT_TOTAL_DIM == 8


def test_ext_sum_equals_2D():
    """1 + D + D + 1 = 2^D: exterior algebra dimension sum."""
    from urt.normed_division_algebras_cathedral import EXT_0_DIM, EXT_1_DIM, EXT_2_DIM, EXT_3_DIM
    from urt.shell_closure import D
    total = EXT_0_DIM + EXT_1_DIM + EXT_2_DIM + EXT_3_DIM
    assert total == 2**D
    assert total == 8


def test_ext_identity_flags():
    """All exterior algebra identity flags are True."""
    from urt.normed_division_algebras_cathedral import (
        IDENTITY_EXT_0, IDENTITY_EXT_1, IDENTITY_EXT_2,
        IDENTITY_EXT_1_EQ_EXT_2, IDENTITY_EXT_TOTAL, IDENTITY_EXT_SUM,
    )
    assert IDENTITY_EXT_0 is True
    assert IDENTITY_EXT_1 is True
    assert IDENTITY_EXT_2 is True
    assert IDENTITY_EXT_1_EQ_EXT_2 is True
    assert IDENTITY_EXT_TOTAL is True
    assert IDENTITY_EXT_SUM is True


# ── Quaternion group Q_8 ──────────────────────────────────────────────────────

def test_Q8_order_eq_2D():
    """|Q_8| = 8 = 2^D."""
    from urt.normed_division_algebras_cathedral import ORDER_Q8
    from urt.shell_closure import D
    assert ORDER_Q8 == 2**D
    assert ORDER_Q8 == 8


def test_Q8_subgroups_of_order_4():
    """Q_8 has D = 3 subgroups of order D+1 = 4."""
    from urt.normed_division_algebras_cathedral import N_Q8_SUBGROUPS_ORDER4
    from urt.shell_closure import D
    assert N_Q8_SUBGROUPS_ORDER4 == D
    assert N_Q8_SUBGROUPS_ORDER4 == 3


def test_unit_quat_finite_order_eq_2D():
    """|{±1,±i,±j,±k}| = 8 = 2^D."""
    from urt.normed_division_algebras_cathedral import N_UNIT_QUAT_FINITE_ORDER
    from urt.shell_closure import D
    assert N_UNIT_QUAT_FINITE_ORDER == 2**D
    assert N_UNIT_QUAT_FINITE_ORDER == 8


# ── Skew-symmetric matrices ───────────────────────────────────────────────────

def test_skew_dim_eq_D():
    """dim(D×D skew) = D(D-1)/2 = D = 3 — SELF-REFERENTIAL."""
    from urt.normed_division_algebras_cathedral import DIM_SKEW_D
    from urt.shell_closure import D
    assert DIM_SKEW_D == D * (D - 1) // 2
    assert DIM_SKEW_D == D
    assert DIM_SKEW_D == 3


def test_skew_identity_flag():
    """IDENTITY_SKEW_D flag is True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_SKEW_D
    assert IDENTITY_SKEW_D is True


# ── Parallelizable spheres ────────────────────────────────────────────────────

def test_S3_vector_fields_eq_D():
    """S^3 has D=3 independent tangent vector fields (parallelizable)."""
    from urt.normed_division_algebras_cathedral import VECTOR_FIELDS_S3
    from urt.shell_closure import D
    assert VECTOR_FIELDS_S3 == D
    assert VECTOR_FIELDS_S3 == 3


def test_S7_vector_fields_eq_Dfactorial_plus_1():
    """S^7 has D!+1=7 independent tangent vector fields (parallelizable)."""
    from urt.normed_division_algebras_cathedral import VECTOR_FIELDS_S7
    from urt.shell_closure import D
    assert VECTOR_FIELDS_S7 == factorial(D) + 1
    assert VECTOR_FIELDS_S7 == 7


def test_parallel_identity_flags():
    """Parallelizable sphere identity flags are True."""
    from urt.normed_division_algebras_cathedral import IDENTITY_PARALLEL_S3, IDENTITY_PARALLEL_S7
    assert IDENTITY_PARALLEL_S3 is True
    assert IDENTITY_PARALLEL_S7 is True


# ── ALL_NDA_EXACT completeness ────────────────────────────────────────────────

def test_all_nda_exact_flag():
    """ALL_NDA_EXACT is True — all identities pass."""
    from urt.normed_division_algebras_cathedral import ALL_NDA_EXACT
    assert ALL_NDA_EXACT is True


def test_all_nda_identities_dict():
    """ALL_NDA_IDENTITIES has at least 30 entries, all True."""
    from urt.normed_division_algebras_cathedral import ALL_NDA_IDENTITIES
    assert len(ALL_NDA_IDENTITIES) >= 30
    for key, val in ALL_NDA_IDENTITIES.items():
        assert val is True, f"Identity '{key}' is not True"


def test_all_identities_are_true():
    """Every boolean in ALL_NDA_IDENTITIES is True (no False)."""
    from urt.normed_division_algebras_cathedral import ALL_NDA_IDENTITIES
    false_keys = [k for k, v in ALL_NDA_IDENTITIES.items() if not v]
    assert false_keys == [], f"Failed identities: {false_keys}"


# ── Summary function ──────────────────────────────────────────────────────────

def test_nda_summary_keys():
    """nda_summary() returns dict with required keys."""
    from urt.normed_division_algebras_cathedral import nda_summary
    s = nda_summary()
    assert "n_nda" in s
    assert "dim_H" in s
    assert "dim_O" in s
    assert "imag_units_H" in s
    assert "imag_units_O" in s
    assert "n_associative_rda" in s
    assert "cd_doublings_to_O" in s
    assert "cross_product_dim_1" in s
    assert "cross_product_dim_2" in s
    assert "hopf_O_total" in s
    assert "order_binary_icosahedral" in s
    assert "ext_total_dim" in s
    assert "order_Q8" in s
    assert "vector_fields_S3" in s
    assert "vector_fields_S7" in s
    assert "all_nda_exact" in s
    assert "n_identities" in s


def test_nda_summary_values():
    """nda_summary() returns correct Cathedral values."""
    from urt.normed_division_algebras_cathedral import nda_summary
    from urt.shell_closure import D, V, G, q
    s = nda_summary()
    assert s["n_nda"] == D + 1 == 4
    assert s["dim_H"] == D + 1 == 4
    assert s["dim_O"] == 2**D == 8
    assert s["imag_units_H"] == D == 3
    assert s["imag_units_O"] == factorial(D) + 1 == 7
    assert s["n_associative_rda"] == D == 3
    assert s["cd_doublings_to_O"] == D == 3
    assert s["hopf_O_total"] == V + D == 15
    assert s["order_binary_icosahedral"] == 2 * G == 120
    assert s["n_binary_polyhedral"] == q == 5
    assert s["ext_total_dim"] == 2**D == 8
    assert s["order_Q8"] == 2**D == 8
    assert s["vector_fields_S3"] == D == 3
    assert s["vector_fields_S7"] == factorial(D) + 1 == 7
    assert s["all_nda_exact"] is True


def test_nda_summary_identities_all_true():
    """nda_summary()['identities'] contains all-True dict."""
    from urt.normed_division_algebras_cathedral import nda_summary
    s = nda_summary()
    assert s["all_nda_exact"] is True
    assert s["n_identities"] >= 30
    for k, v in s["identities"].items():
        assert v is True, f"Identity '{k}' failed in nda_summary"


# ── Print report ──────────────────────────────────────────────────────────────

def test_print_nda_report(capsys):
    """print_nda_report() produces >300 chars with Cathedral keywords."""
    from urt.normed_division_algebras_cathedral import print_nda_report
    print_nda_report()
    out = capsys.readouterr().out
    assert len(out) > 300
    assert "EXACT" in out
    assert "Cathedral" in out
    assert "SELF-REFERENTIAL" in out


def test_print_nda_report_mentions_D_values(capsys):
    """Print report mentions key Cathedral values D=3, 2G=120, 2^D=8."""
    from urt.normed_division_algebras_cathedral import print_nda_report
    print_nda_report()
    out = capsys.readouterr().out
    assert "120" in out    # 2G
    assert "8" in out      # 2^D
    assert "D+1" in out
    assert "2^D" in out


def test_print_nda_report_mentions_hopf(capsys):
    """Print report mentions Hopf fibrations."""
    from urt.normed_division_algebras_cathedral import print_nda_report
    print_nda_report()
    out = capsys.readouterr().out
    assert "Hopf" in out
    assert "15" in out     # S^15 = S^{V+D}


def test_print_nda_report_mentions_exterior(capsys):
    """Print report discusses exterior algebra."""
    from urt.normed_division_algebras_cathedral import print_nda_report
    print_nda_report()
    out = capsys.readouterr().out
    assert "Exterior" in out or "exterior" in out


# ── Cross-checks with other Cathedral integers ────────────────────────────────

def test_dim_H_matches_irrep_D():
    """dim(H) = D+1 matches the Cathedral irrep dimension."""
    from urt.normed_division_algebras_cathedral import DIM_H
    from urt.shell_closure import D
    assert DIM_H == D + 1


def test_Q8_order_matches_O_dim():
    """|Q_8| = 8 = dim(O)."""
    from urt.normed_division_algebras_cathedral import ORDER_Q8, DIM_O
    assert ORDER_Q8 == DIM_O


def test_S7_fields_matches_imag_O():
    """Vector fields on S^7 = D!+1 = imaginary units of O."""
    from urt.normed_division_algebras_cathedral import VECTOR_FIELDS_S7, IMAG_UNITS_O
    assert VECTOR_FIELDS_S7 == IMAG_UNITS_O


def test_cross_product_dim2_matches_imag_O():
    """R^{D!+1} cross product dim = D!+1 = imaginary units of O."""
    from urt.normed_division_algebras_cathedral import CROSS_PRODUCT_DIM_2, IMAG_UNITS_O
    assert CROSS_PRODUCT_DIM_2 == IMAG_UNITS_O


def test_hopf_H_total_matches_imag_O():
    """Hopf H total space dimension = D!+1 = imaginary units of O."""
    from urt.normed_division_algebras_cathedral import HOPF_H_TOTAL, IMAG_UNITS_O
    assert HOPF_H_TOTAL == IMAG_UNITS_O


def test_frobenius_count_eq_imag_H():
    """Frobenius count (D) = imaginary units of H (D) — both self-referential."""
    from urt.normed_division_algebras_cathedral import N_ASSOCIATIVE_RDA, IMAG_UNITS_H
    assert N_ASSOCIATIVE_RDA == IMAG_UNITS_H


def test_cd_doublings_O_eq_imag_H():
    """Cayley-Dickson doublings to O = D = imaginary units of H."""
    from urt.normed_division_algebras_cathedral import CD_DOUBLINGS_TO_O, IMAG_UNITS_H
    assert CD_DOUBLINGS_TO_O == IMAG_UNITS_H


def test_ext_total_eq_dim_O():
    """Total exterior algebra dim = 2^D = dim(O)."""
    from urt.normed_division_algebras_cathedral import EXT_TOTAL_DIM, DIM_O
    assert EXT_TOTAL_DIM == DIM_O


def test_binary_tetrahedral_eq_SD1_order():
    """|Binary tetrahedral| = 2V = 24 = (D+1)!."""
    from urt.normed_division_algebras_cathedral import ORDER_BINARY_TETRAHEDRAL
    from urt.shell_closure import D
    assert ORDER_BINARY_TETRAHEDRAL == factorial(D + 1)
    assert ORDER_BINARY_TETRAHEDRAL == 24


def test_delta_star_present_in_summary():
    """nda_summary() includes delta_star value."""
    from urt.normed_division_algebras_cathedral import nda_summary, DELTA_STAR
    s = nda_summary()
    assert "delta_star" in s
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12
