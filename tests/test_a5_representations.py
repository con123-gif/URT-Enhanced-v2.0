"""Tests for urt/a5_representations.py — A₅ irreducible representations."""

import pytest
from math import sqrt, isclose


def test_imports():
    from urt.a5_representations import (
        IRREP_DIMS, SUM_SQUARES, N_IRREPS,
        CONJUGACY_CLASSES, CHARACTER_TABLE,
        PHYSICAL_IRREPS, GOLDEN_IN_CHARACTER,
        verify_orthogonality, irrep_dimensions,
        conjugacy_analysis, a5_summary, print_a5_report,
    )


# ── Irrep dimensions ──────────────────────────────────────────────────────────

def test_irrep_dims():
    """dim(irreps) = {1, 3, 3, 4, 5} = {1, D, D, D+1, q}."""
    from urt.a5_representations import IRREP_DIMS
    from urt.shell_closure import D, q
    assert sorted(IRREP_DIMS) == [1, D, D, D + 1, q]
    assert sorted(IRREP_DIMS) == [1, 3, 3, 4, 5]


def test_sum_squares_eq_G():
    """1² + 3² + 3² + 4² + 5² = 60 = |A₅|."""
    from urt.a5_representations import SUM_SQUARES
    from urt.shell_closure import G
    assert SUM_SQUARES == G
    assert SUM_SQUARES == 60


def test_n_irreps_eq_q():
    """Number of irreps = 5 = q."""
    from urt.a5_representations import N_IRREPS
    from urt.shell_closure import q
    assert N_IRREPS == q
    assert N_IRREPS == 5


def test_irrep_dimensions_function():
    from urt.a5_representations import irrep_dimensions
    r = irrep_dimensions()
    assert r["sum_squares_eq_G"] is True
    assert r["n_irreps_eq_q"] is True
    assert r["G"] == 60
    assert r["q"] == 5


# ── Conjugacy classes ─────────────────────────────────────────────────────────

def test_conjugacy_class_sum():
    """Sum of class sizes = 60 = |A₅|."""
    from urt.a5_representations import CONJUGACY_CLASSES
    from urt.shell_closure import G
    assert sum(CONJUGACY_CLASSES.values()) == G


def test_conjugacy_class_count():
    """5 conjugacy classes."""
    from urt.a5_representations import CONJUGACY_CLASSES
    assert len(CONJUGACY_CLASSES) == 5


def test_conjugacy_class_20_eq_F():
    """Class size 20 = F = icosahedral faces."""
    from urt.a5_representations import CONJUGACY_CLASSES
    from urt.shell_closure import F
    assert CONJUGACY_CLASSES["C3"] == F
    assert CONJUGACY_CLASSES["C3"] == 20


def test_conjugacy_class_12_eq_V():
    """Class sizes 12 = V = icosahedral vertices."""
    from urt.a5_representations import CONJUGACY_CLASSES
    from urt.shell_closure import V
    assert CONJUGACY_CLASSES["C5"] == V
    assert CONJUGACY_CLASSES["C5sq"] == V
    assert CONJUGACY_CLASSES["C5"] == 12


def test_conjugacy_class_15():
    """Class size 15 = (D+1)² - 1."""
    from urt.a5_representations import CONJUGACY_CLASSES
    from urt.shell_closure import D
    assert CONJUGACY_CLASSES["C2"] == (D + 1)**2 - 1
    assert CONJUGACY_CLASSES["C2"] == 15


def test_conjugacy_analysis_function():
    from urt.a5_representations import conjugacy_analysis
    r = conjugacy_analysis()
    assert r["sum_eq_G"] is True
    assert r["sizes_from_cathedral"] is True


# ── Character table ───────────────────────────────────────────────────────────

def test_character_table_rows():
    """5 rows in character table."""
    from urt.a5_representations import CHARACTER_TABLE
    assert len(CHARACTER_TABLE) == 5


def test_character_table_trivial():
    """Trivial irrep: all characters = 1."""
    from urt.a5_representations import CHARACTER_TABLE
    chi = CHARACTER_TABLE["trivial_1"]
    assert all(abs(c - 1) < 1e-10 for c in chi)


def test_character_table_5dim_identity():
    """5-dim irrep: chi(e) = 5."""
    from urt.a5_representations import CHARACTER_TABLE
    from urt.shell_closure import q
    assert CHARACTER_TABLE["5dim"][0] == q


def test_character_table_4dim_identity():
    """4-dim irrep: chi(e) = D+1 = 4."""
    from urt.a5_representations import CHARACTER_TABLE
    from urt.shell_closure import D
    assert CHARACTER_TABLE["4dim"][0] == D + 1


def test_character_table_3dim_identity():
    """3-dim irreps: chi(e) = D = 3."""
    from urt.a5_representations import CHARACTER_TABLE
    from urt.shell_closure import D
    assert CHARACTER_TABLE["standard_3"][0] == D
    assert CHARACTER_TABLE["dual_3p"][0] == D


def test_golden_ratio_in_3dim():
    """φ appears in 3-dim irrep characters at C₅."""
    from urt.a5_representations import CHARACTER_TABLE
    from urt.shell_closure import phi
    chi3 = CHARACTER_TABLE["standard_3"]
    chi3p = CHARACTER_TABLE["dual_3p"]
    # C5 character = φ in standard_3
    assert abs(chi3[3] - phi) < 1e-10
    # C5 character = 1-φ in dual_3p
    assert abs(chi3p[3] - (1 - phi)) < 1e-10


def test_golden_ratio_consistency():
    """standard_3 and dual_3p are conjugate: sum of C5 chars = 1."""
    from urt.a5_representations import CHARACTER_TABLE
    chi3 = CHARACTER_TABLE["standard_3"]
    chi3p = CHARACTER_TABLE["dual_3p"]
    # phi + (1-phi) = 1
    assert abs(chi3[3] + chi3p[3] - 1.0) < 1e-10
    # (1-phi) + phi = 1
    assert abs(chi3[4] + chi3p[4] - 1.0) < 1e-10


def test_golden_in_character_flag():
    from urt.a5_representations import GOLDEN_IN_CHARACTER
    assert GOLDEN_IN_CHARACTER is True


# ── Orthogonality ─────────────────────────────────────────────────────────────

def test_row_orthonormality():
    """Each row: ||χ||² = 1."""
    from urt.a5_representations import verify_orthogonality
    result = verify_orthogonality()
    assert result["all_normalized"] is True
    for name, norm in result["row_norms"].items():
        assert abs(norm - 1.0) < 1e-8, f"Row {name} norm = {norm} ≠ 1"


def test_sum_squares_check():
    from urt.a5_representations import verify_orthogonality
    result = verify_orthogonality()
    assert result["sum_squares_check"] is True


def test_n_irreps_eq_q_check():
    from urt.a5_representations import verify_orthogonality
    result = verify_orthogonality()
    assert result["n_irreps_eq_q"] is True


# ── Physical irreps ───────────────────────────────────────────────────────────

def test_physical_irrep_dims():
    """Physical irreps have correct dimensions."""
    from urt.a5_representations import PHYSICAL_IRREPS
    from urt.shell_closure import D, q
    assert PHYSICAL_IRREPS["trivial_1"]["dim"] == 1
    assert PHYSICAL_IRREPS["standard_3"]["dim"] == D
    assert PHYSICAL_IRREPS["dual_3p"]["dim"] == D
    assert PHYSICAL_IRREPS["4dim"]["dim"] == D + 1
    assert PHYSICAL_IRREPS["5dim"]["dim"] == q


# ── Summary ───────────────────────────────────────────────────────────────────

def test_a5_summary():
    from urt.a5_representations import a5_summary
    r = a5_summary()
    assert r["group_order"] == 60
    assert r["golden_in_rep"] is True
    assert len(r["key_results"]) >= 3


def test_print_a5_report(capsys):
    from urt.a5_representations import print_a5_report
    print_a5_report()
    out = capsys.readouterr().out
    assert "A₅" in out
    assert "60" in out
    assert len(out) > 200
