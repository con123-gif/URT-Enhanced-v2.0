"""Tests for urt/mckay_extended_dynkin_cathedral.py — McKay correspondence Cathedral."""
import pytest
from math import factorial

from urt.mckay_extended_dynkin_cathedral import (
    ORDER_BINARY_CYCLIC_D, ORDER_BINARY_DIHEDRAL_D,
    ORDER_BINARY_TETRAHEDRAL, ORDER_BINARY_OCTAHEDRAL, ORDER_BINARY_ICOSAHEDRAL,
    IDENTITY_BIN_CYCLIC_D_IS_DFACT, IDENTITY_BIN_DIHEDRAL_D_IS_V,
    IDENTITY_BIN_TETRAHEDRAL_IS_2V, IDENTITY_BIN_OCTAHEDRAL_IS_4V,
    IDENTITY_BIN_ICOSAHEDRAL_IS_2G,
    NODES_E6_AFFINE, NODES_E7_AFFINE, NODES_E8_AFFINE,
    IDENTITY_NODES_E6_IS_DFACT1, IDENTITY_NODES_E7_IS_2D,
    IDENTITY_NODES_E8_IS_D_SQ,
    N_IRREPS_T_STAR, N_IRREPS_O_STAR, N_IRREPS_I_STAR,
    IDENTITY_IRREPS_T_IS_DFACT1, IDENTITY_IRREPS_O_IS_2D,
    IDENTITY_IRREPS_I_IS_D_SQ,
    I_STAR_IRREP_DIMS, I_STAR_IRREP_DIM_SUM, I_STAR_MAX_IRREP,
    IDENTITY_I_STAR_N_IRREPS, IDENTITY_I_STAR_MAX_IS_DFACT,
    NODES_A_AFFINE_D, NODES_A_AFFINE_q, NODES_A_AFFINE_V,
    IDENTITY_A_AFF_D_IS_D, IDENTITY_A_AFF_q_IS_q, IDENTITY_A_AFF_V_IS_V,
    NODES_D_AFFINE_DFACT, IDENTITY_D_AFF_DFACT_IS_2D,
    E8_POSITIVE_ROOTS, IDENTITY_E8_POS_ROOTS_IS_2G,
    N_E6_AUTOMORPHISMS, IDENTITY_E6_AUTO_IS_D,
    ADE_PLATONIC_GROUPS,
    ALL_MCKAY_IDENTITIES, ALL_MCKAY_EXACT, N_MCKAY_IDENTITIES,
    mckay_summary, print_mckay_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Binary polyhedral group orders ────────────────────────────────────────────

class TestBinaryPolyhedral:
    def test_binary_cyclic_D_is_Dfact(self):
        """Binary cyclic Z_{2D}: order = 2D = 6 = D!."""
        assert IDENTITY_BIN_CYCLIC_D_IS_DFACT
        assert ORDER_BINARY_CYCLIC_D == factorial(D) == 6

    def test_binary_dihedral_D_is_V(self):
        """Binary dihedral BD_D: order = 4D = 12 = V."""
        assert IDENTITY_BIN_DIHEDRAL_D_IS_V
        assert ORDER_BINARY_DIHEDRAL_D == V == 12

    def test_binary_tetrahedral_is_2V(self):
        """T*: order = 24 = 2V."""
        assert IDENTITY_BIN_TETRAHEDRAL_IS_2V
        assert ORDER_BINARY_TETRAHEDRAL == 2 * V == 24

    def test_binary_octahedral_is_4V(self):
        """O*: order = 48 = 4V."""
        assert IDENTITY_BIN_OCTAHEDRAL_IS_4V
        assert ORDER_BINARY_OCTAHEDRAL == 4 * V == 48

    def test_binary_icosahedral_is_2G(self):
        """I*: order = 120 = 2G = 2|A₅| — CATHEDRAL!"""
        assert IDENTITY_BIN_ICOSAHEDRAL_IS_2G
        assert ORDER_BINARY_ICOSAHEDRAL == 2 * G == 120

    def test_order_sequence(self):
        """Orders double along the McKay chain."""
        assert ORDER_BINARY_TETRAHEDRAL == 2 * ORDER_BINARY_DIHEDRAL_D
        assert ORDER_BINARY_OCTAHEDRAL == 2 * ORDER_BINARY_TETRAHEDRAL


# ── Extended Dynkin node counts ───────────────────────────────────────────────

class TestExtendedDynkinNodes:
    def test_E6_nodes_is_Dfact1(self):
        """Ẽ_6 has D!+1 = 7 nodes."""
        assert IDENTITY_NODES_E6_IS_DFACT1
        assert NODES_E6_AFFINE == factorial(D) + 1 == 7

    def test_E7_nodes_is_2D(self):
        """Ẽ_7 has 2^D = 8 nodes."""
        assert IDENTITY_NODES_E7_IS_2D
        assert NODES_E7_AFFINE == 2**D == 8

    def test_E8_nodes_is_D_sq(self):
        """Ẽ_8 has D² = 9 nodes — SELF-REFERENTIAL!"""
        assert IDENTITY_NODES_E8_IS_D_SQ
        assert NODES_E8_AFFINE == D**2 == 9

    def test_nodes_form_consecutive_integers(self):
        """7, 8, 9 = D!+1, 2^D, D²."""
        assert NODES_E6_AFFINE == 7
        assert NODES_E7_AFFINE == 8
        assert NODES_E8_AFFINE == 9


# ── McKay correspondence: irreps ──────────────────────────────────────────────

class TestMcKayIrreps:
    def test_T_star_irreps_is_Dfact1(self):
        """T* has D!+1 = 7 irreps (= Ẽ_6 nodes)."""
        assert IDENTITY_IRREPS_T_IS_DFACT1
        assert N_IRREPS_T_STAR == factorial(D) + 1 == 7

    def test_O_star_irreps_is_2D(self):
        """O* has 2^D = 8 irreps (= Ẽ_7 nodes)."""
        assert IDENTITY_IRREPS_O_IS_2D
        assert N_IRREPS_O_STAR == 2**D == 8

    def test_I_star_irreps_is_D_sq(self):
        """I* has D² = 9 irreps (= Ẽ_8 nodes) — SELF-REFERENTIAL!"""
        assert IDENTITY_IRREPS_I_IS_D_SQ
        assert N_IRREPS_I_STAR == D**2 == 9

    def test_I_star_irrep_count(self):
        assert IDENTITY_I_STAR_N_IRREPS
        assert len(I_STAR_IRREP_DIMS) == D**2

    def test_I_star_max_irrep_is_Dfact(self):
        """I* largest irrep dimension = D! = 6."""
        assert IDENTITY_I_STAR_MAX_IS_DFACT
        assert I_STAR_MAX_IRREP == factorial(D) == 6

    def test_I_star_irrep_dims_values(self):
        assert sorted(set(I_STAR_IRREP_DIMS)) == [1, 2, 3, 4, 5, 6]

    def test_I_star_contains_all_1_to_q(self):
        """I* irrep dimensions include 1 through q=5."""
        dims = set(I_STAR_IRREP_DIMS)
        for k in range(1, q + 1):
            assert k in dims


# ── Affine A and D diagrams ───────────────────────────────────────────────────

class TestAffineAD:
    def test_A_aff_D_nodes(self):
        assert IDENTITY_A_AFF_D_IS_D
        assert NODES_A_AFFINE_D == D == 3

    def test_A_aff_q_nodes(self):
        """Ã_{q-1} has q=5 nodes — same as pentagon triangulations."""
        assert IDENTITY_A_AFF_q_IS_q
        assert NODES_A_AFFINE_q == q == 5

    def test_A_aff_V_nodes(self):
        assert IDENTITY_A_AFF_V_IS_V
        assert NODES_A_AFFINE_V == V == 12

    def test_D_aff_Dfact_nodes_is_2D(self):
        """D̃_{D!} = D̃_6 has D!+2 = 8 = 2^D nodes."""
        assert IDENTITY_D_AFF_DFACT_IS_2D
        assert NODES_D_AFFINE_DFACT == 2**D == 8


# ── E_8 positive roots ────────────────────────────────────────────────────────

def test_E8_pos_roots_is_2G():
    assert IDENTITY_E8_POS_ROOTS_IS_2G
    assert E8_POSITIVE_ROOTS == 2 * G == 120


# ── E_6 automorphisms ────────────────────────────────────────────────────────

def test_E6_outer_auto_is_D():
    assert IDENTITY_E6_AUTO_IS_D
    assert N_E6_AUTOMORPHISMS == D == 3


# ── ADE Platonic table ────────────────────────────────────────────────────────

def test_ADE_platonic_table_has_E6_E7_E8():
    assert "E6" in ADE_PLATONIC_GROUPS
    assert "E7" in ADE_PLATONIC_GROUPS
    assert "E8" in ADE_PLATONIC_GROUPS

def test_ADE_E8_entry():
    e = ADE_PLATONIC_GROUPS["E8"]
    assert e["group"] == "I*"
    assert e["order"] == 2 * G
    assert e["nodes"] == D**2

def test_ADE_E6_entry():
    e = ADE_PLATONIC_GROUPS["E6"]
    assert e["order"] == 2 * V

def test_ADE_E7_entry():
    e = ADE_PLATONIC_GROUPS["E7"]
    assert e["order"] == 4 * V


# ── All identities ────────────────────────────────────────────────────────────

def test_all_mckay_exact():
    assert ALL_MCKAY_EXACT

def test_n_mckay_identities():
    assert N_MCKAY_IDENTITIES == len(ALL_MCKAY_IDENTITIES)
    assert N_MCKAY_IDENTITIES >= 15


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = mckay_summary()
    assert isinstance(s, dict)

def test_summary_I_star():
    s = mckay_summary()
    assert s["I_star_order"] == 2 * G
    assert s["I_star_is_2G"] is True

def test_summary_E8_nodes():
    s = mckay_summary()
    assert s["E8_nodes"] == D**2
    assert s["E8_nodes_is_D_sq"] is True

def test_summary_all_exact():
    s = mckay_summary()
    assert s["all_mckay_exact"] is True

def test_print_report_runs(capsys):
    print_mckay_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_120(capsys):
    print_mckay_report()
    out = capsys.readouterr().out
    assert "120" in out

def test_print_report_contains_SELF_REF(capsys):
    print_mckay_report()
    out = capsys.readouterr().out
    assert "SELF" in out or "self-ref" in out.lower()

def test_print_report_contains_icosahedral(capsys):
    print_mckay_report()
    out = capsys.readouterr().out
    assert "icosahedral" in out.lower() or "I*" in out or "CATHEDRAL" in out

def test_print_report_contains_E8_nodes(capsys):
    print_mckay_report()
    out = capsys.readouterr().out
    assert "9" in out
