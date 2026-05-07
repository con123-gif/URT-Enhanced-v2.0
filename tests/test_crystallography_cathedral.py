"""Tests for urt/crystallography_cathedral.py — Crystal structures and δ★."""

import pytest
from math import isfinite, sqrt, pi


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.crystallography_cathedral import (
        N_BRAVAIS, N_BRAVAIS_EQ_N_PLUS_1,
        N_POINT_GROUPS, TWO_Q, N_POINT_GROUPS_EQ_2Q,
        N_SPACE_GROUPS,
        Z_FCC, Z_HCP, Z_BCC, Z_SC, Z_ICOS,
        Z_BCC_EQ_2D, Z_SC_EQ_2D,
        ETA_FCC, ETA_HCP, ETA_BCC, ETA_SC,
        ETA_FCC_OVER_SC,
        QCRYSTAL_FOLD, QCRYSTAL_FORBIDDEN, FIVE_FOLD_IN_ALLOWED,
        ALLOWED_FOLD_ORDERS,
        ICOS_POINT_GROUP_ORDER, ICOS_CHIRAL_GROUP_ORDER,
        CUBE_BODY_DIAGONAL,
        bravais_lattices, point_groups, coordination_numbers,
        quasicrystal_connection, packing_fractions, space_group_analysis,
        crystallography_summary, print_crystallography_report,
    )


# ── Bravais lattices ──────────────────────────────────────────────────────────

def test_bravais_count_14():
    """14 Bravais lattices in D=3."""
    from urt.crystallography_cathedral import N_BRAVAIS
    assert N_BRAVAIS == 14


def test_bravais_eq_N_plus_1():
    """14 = N + 1 (EXACT)."""
    from urt.crystallography_cathedral import N_BRAVAIS, N_BRAVAIS_EQ_N_PLUS_1
    from urt.shell_closure import N
    assert N_BRAVAIS == N + 1
    assert N_BRAVAIS_EQ_N_PLUS_1 is True


def test_bravais_function_structure():
    from urt.crystallography_cathedral import bravais_lattices
    r = bravais_lattices()
    assert r["n_bravais"] == 14
    assert r["n_bravais_eq_N_plus_1"] is True
    assert "EXACT" in r["status"]


# ── Point groups ──────────────────────────────────────────────────────────────

def test_point_groups_32():
    """32 crystallographic point groups in D=3."""
    from urt.crystallography_cathedral import N_POINT_GROUPS
    assert N_POINT_GROUPS == 32


def test_point_groups_eq_2_to_q():
    """32 = 2^q = 2^5 (EXACT arithmetic)."""
    from urt.crystallography_cathedral import N_POINT_GROUPS, TWO_Q, N_POINT_GROUPS_EQ_2Q
    from urt.shell_closure import q
    assert TWO_Q == 2 ** q
    assert TWO_Q == 32
    assert N_POINT_GROUPS == TWO_Q
    assert N_POINT_GROUPS_EQ_2Q is True


def test_space_groups_230():
    """230 space groups in D=3."""
    from urt.crystallography_cathedral import N_SPACE_GROUPS
    assert N_SPACE_GROUPS == 230


def test_point_groups_function():
    from urt.crystallography_cathedral import point_groups
    r = point_groups()
    assert r["n_point_groups"] == 32
    assert r["n_pg_eq_2q"] is True
    assert r["n_space_groups"] == 230
    assert "EXACT" in r["status"]


# ── Coordination numbers ──────────────────────────────────────────────────────

def test_fcc_coordination_equals_V():
    """FCC coordination z = V = 12 (EXACT)."""
    from urt.crystallography_cathedral import Z_FCC
    from urt.shell_closure import V
    assert Z_FCC == V
    assert Z_FCC == 12


def test_hcp_coordination_equals_V():
    """HCP coordination z = V = 12 (EXACT)."""
    from urt.crystallography_cathedral import Z_HCP
    from urt.shell_closure import V
    assert Z_HCP == V
    assert Z_HCP == 12


def test_icos_coordination_equals_V():
    """Icosahedral coordination z = V = 12 (EXACT)."""
    from urt.crystallography_cathedral import Z_ICOS
    from urt.shell_closure import V
    assert Z_ICOS == V
    assert Z_ICOS == 12


def test_bcc_coordination_equals_2_to_D():
    """BCC coordination z = 2^D = 2^3 = 8 (EXACT arithmetic)."""
    from urt.crystallography_cathedral import Z_BCC, Z_BCC_EQ_2D
    from urt.shell_closure import D
    assert Z_BCC == 2 ** D
    assert Z_BCC == 8
    assert Z_BCC_EQ_2D is True


def test_sc_coordination_equals_2D():
    """Simple cubic coordination z = 2D = 6 (EXACT)."""
    from urt.crystallography_cathedral import Z_SC, Z_SC_EQ_2D
    from urt.shell_closure import D
    assert Z_SC == 2 * D
    assert Z_SC == 6
    assert Z_SC_EQ_2D is True


def test_coordination_function():
    from urt.crystallography_cathedral import coordination_numbers
    from urt.shell_closure import V, D
    r = coordination_numbers()
    assert r["z_fcc"] == V
    assert r["z_hcp"] == V
    assert r["z_icos"] == V
    assert r["z_bcc"] == 2**D
    assert r["z_sc"] == 2*D
    assert r["z_fcc_eq_V"] is True
    assert r["z_bcc_eq_2D"] is True
    assert "EXACT" in r["status"]


# ── Quasicrystals ─────────────────────────────────────────────────────────────

def test_quasicrystal_fold_eq_q():
    """Quasicrystal forbidden fold = q = 5."""
    from urt.crystallography_cathedral import QCRYSTAL_FOLD
    from urt.shell_closure import q
    assert QCRYSTAL_FOLD == q
    assert QCRYSTAL_FOLD == 5


def test_five_fold_forbidden():
    """5-fold is NOT in the allowed crystallographic orders."""
    from urt.crystallography_cathedral import FIVE_FOLD_IN_ALLOWED, ALLOWED_FOLD_ORDERS
    assert FIVE_FOLD_IN_ALLOWED is False
    assert 5 not in ALLOWED_FOLD_ORDERS


def test_allowed_fold_orders():
    """Allowed fold orders are 1, 2, 3, 4, 6."""
    from urt.crystallography_cathedral import ALLOWED_FOLD_ORDERS
    assert set(ALLOWED_FOLD_ORDERS) == {1, 2, 3, 4, 6}


def test_quasicrystal_function():
    from urt.crystallography_cathedral import quasicrystal_connection
    from urt.shell_closure import q, phi
    r = quasicrystal_connection()
    assert r["forbidden_fold"] == q
    assert r["five_fold_in_allowed"] is False
    assert r["phi_in_diffraction"] is True
    assert abs(r["phi_value"] - phi) < 1e-6
    assert "EXACT" in r["status"]


# ── Packing fractions ─────────────────────────────────────────────────────────

def test_fcc_packing_fraction():
    """FCC packing = π/(3√2) ≈ 0.7405."""
    from urt.crystallography_cathedral import ETA_FCC
    expected = pi / (3.0 * sqrt(2))
    assert abs(ETA_FCC - expected) < 1e-10
    assert 0.74 < ETA_FCC < 0.75


def test_bcc_packing_fraction():
    """BCC packing = π√3/8 ≈ 0.6802."""
    from urt.crystallography_cathedral import ETA_BCC
    expected = pi * sqrt(3) / 8.0
    assert abs(ETA_BCC - expected) < 1e-10
    assert 0.67 < ETA_BCC < 0.69


def test_sc_packing_fraction():
    """SC packing = π/6 ≈ 0.5236."""
    from urt.crystallography_cathedral import ETA_SC
    expected = pi / 6.0
    assert abs(ETA_SC - expected) < 1e-10
    assert 0.52 < ETA_SC < 0.53


def test_packing_order():
    """FCC > BCC > SC (expected packing hierarchy)."""
    from urt.crystallography_cathedral import ETA_FCC, ETA_BCC, ETA_SC
    assert ETA_FCC > ETA_BCC > ETA_SC


def test_fcc_over_sc_equals_sqrt2():
    """η_FCC / η_SC = √2 (EXACT ratio)."""
    from urt.crystallography_cathedral import ETA_FCC_OVER_SC
    assert abs(ETA_FCC_OVER_SC - sqrt(2)) < 1e-10


def test_packing_function():
    from urt.crystallography_cathedral import packing_fractions
    r = packing_fractions()
    assert r["eta_fcc_over_sc_eq_sqrt2"] is True
    assert "Hales" in r["optimal_structure"]
    assert "δ★" in r["note"] or "direct" in r["note"]


# ── Icosahedral symmetry group ────────────────────────────────────────────────

def test_icos_chiral_group_order():
    """Chiral icosahedral group I = A₅ has order G = 60."""
    from urt.crystallography_cathedral import ICOS_CHIRAL_GROUP_ORDER
    from urt.shell_closure import G
    assert ICOS_CHIRAL_GROUP_ORDER == G
    assert ICOS_CHIRAL_GROUP_ORDER == 60


def test_ih_group_order():
    """Ih group has order 2G = 120."""
    from urt.crystallography_cathedral import ICOS_POINT_GROUP_ORDER
    from urt.shell_closure import G
    assert ICOS_POINT_GROUP_ORDER == 2 * G
    assert ICOS_POINT_GROUP_ORDER == 120


def test_cube_body_diagonal():
    """Cube body diagonal = √D = √3."""
    from urt.crystallography_cathedral import CUBE_BODY_DIAGONAL
    from urt.shell_closure import D
    assert abs(CUBE_BODY_DIAGONAL - sqrt(D)) < 1e-10


# ── Summary / report ──────────────────────────────────────────────────────────

def test_crystallography_summary_structure():
    from urt.crystallography_cathedral import crystallography_summary
    r = crystallography_summary()
    assert "bravais" in r
    assert "point_groups" in r
    assert "coordination" in r
    assert "quasicrystal" in r
    assert "packing" in r
    assert "space_groups" in r
    assert "key_results" in r
    assert "cathedral_integers" in r


def test_crystallography_summary_integers():
    from urt.crystallography_cathedral import crystallography_summary
    from urt.shell_closure import D, N, V, q, G
    r = crystallography_summary()
    ci = r["cathedral_integers"]
    assert ci["D"] == D
    assert ci["N"] == N
    assert ci["V"] == V
    assert ci["q"] == q
    assert ci["G"] == G


def test_print_crystallography_report(capsys):
    from urt.crystallography_cathedral import print_crystallography_report
    print_crystallography_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL CRYSTALLOGRAPHY" in out
    assert "Bravais" in out or "bravais" in out.lower()
    assert "14" in out
    assert "32" in out
