"""Tests for urt/nuclear_structure_cathedral.py — Magic numbers, QCD, shell model."""

import pytest


def test_imports():
    from urt.nuclear_structure_cathedral import (
        N_NUCLEON_SPIN_PROJECTIONS, N_ISOSPIN_STATES,
        MAGIC_NUMBERS, MAGIC_1, MAGIC_2, MAGIC_3,
        Z_LEAD, N_QCD_COLORS, N_QUARK_FLAVORS_GEN1, N_QUARK_FLAVORS_TOTAL,
        ALPHA_Z, ALPHA_A, N_SPIN_ORBIT_PARTNERS, N_GAMOW_TELLER_DJ,
        magic_numbers_analysis, nucleon_quantum_numbers, qcd_structure,
        nuclear_summary, print_nuclear_report,
    )


# ── Nucleon quantum numbers ───────────────────────────────────────────────────

def test_spin_projections_eq_D1():
    """Nucleon spin projections = D-1 = 2."""
    from urt.nuclear_structure_cathedral import N_NUCLEON_SPIN_PROJECTIONS
    from urt.shell_closure import D
    assert N_NUCLEON_SPIN_PROJECTIONS == D - 1
    assert N_NUCLEON_SPIN_PROJECTIONS == 2


def test_isospin_eq_D1():
    """Isospin doublet (p, n) = D-1 = 2 states."""
    from urt.nuclear_structure_cathedral import N_ISOSPIN_STATES
    from urt.shell_closure import D
    assert N_ISOSPIN_STATES == D - 1
    assert N_ISOSPIN_STATES == 2


# ── Magic numbers ─────────────────────────────────────────────────────────────

def test_magic_1_eq_D1():
    """First magic number = D-1 = 2."""
    from urt.nuclear_structure_cathedral import MAGIC_1
    from urt.shell_closure import D
    assert MAGIC_1 == D - 1
    assert MAGIC_1 == 2


def test_magic_2_eq_2D():
    """Second magic number = 2^D = 8."""
    from urt.nuclear_structure_cathedral import MAGIC_2
    from urt.shell_closure import D
    assert MAGIC_2 == 2**D
    assert MAGIC_2 == 8


def test_magic_3_eq_F():
    """Third magic number = F = 20 = icosahedral faces!!!"""
    from urt.nuclear_structure_cathedral import MAGIC_3
    from urt.shell_closure import F
    assert MAGIC_3 == F
    assert MAGIC_3 == 20


def test_magic_numbers_list():
    """Magic numbers list contains {2, 8, 20, 28, 50, 82, 126}."""
    from urt.nuclear_structure_cathedral import MAGIC_NUMBERS
    assert set(MAGIC_NUMBERS) == {2, 8, 20, 28, 50, 82, 126}


def test_lead_z():
    """Lead Z=82 = F*(D+1)+(D-1) = 20*4+2 = 82."""
    from urt.nuclear_structure_cathedral import Z_LEAD
    from urt.shell_closure import F, D
    assert Z_LEAD == F * (D + 1) + (D - 1)
    assert Z_LEAD == 82


# ── QCD ───────────────────────────────────────────────────────────────────────

def test_qcd_colors_eq_D():
    """QCD has D = 3 color charges."""
    from urt.nuclear_structure_cathedral import N_QCD_COLORS
    from urt.shell_closure import D
    assert N_QCD_COLORS == D
    assert N_QCD_COLORS == 3


def test_quark_flavors_gen1_eq_D1():
    """First generation quarks = D-1 = 2 (up, down)."""
    from urt.nuclear_structure_cathedral import N_QUARK_FLAVORS_GEN1
    from urt.shell_closure import D
    assert N_QUARK_FLAVORS_GEN1 == D - 1
    assert N_QUARK_FLAVORS_GEN1 == 2


def test_quark_flavors_total_eq_V2():
    """Total quark flavors = D(D-1) = 6 = V/2."""
    from urt.nuclear_structure_cathedral import N_QUARK_FLAVORS_TOTAL
    from urt.shell_closure import D, V
    assert N_QUARK_FLAVORS_TOTAL == D * (D - 1)
    assert N_QUARK_FLAVORS_TOTAL == V // 2
    assert N_QUARK_FLAVORS_TOTAL == 6


# ── Alpha particle ────────────────────────────────────────────────────────────

def test_alpha_Z_eq_D1():
    """Alpha particle Z = D-1 = 2 protons."""
    from urt.nuclear_structure_cathedral import ALPHA_Z
    from urt.shell_closure import D
    assert ALPHA_Z == D - 1
    assert ALPHA_Z == 2


def test_alpha_A_eq_D1():
    """Alpha particle A = D+1 = 4 nucleons."""
    from urt.nuclear_structure_cathedral import ALPHA_A
    from urt.shell_closure import D
    assert ALPHA_A == D + 1
    assert ALPHA_A == 4


# ── Function tests ────────────────────────────────────────────────────────────

def test_magic_numbers_function():
    from urt.nuclear_structure_cathedral import magic_numbers_analysis
    r = magic_numbers_analysis()
    assert r["magic_3_eq_F"] is True
    assert r["magic_2_eq_2D"] is True
    assert r["magic_1_eq_D1"] is True


def test_nucleon_quantum_numbers_function():
    from urt.nuclear_structure_cathedral import nucleon_quantum_numbers
    r = nucleon_quantum_numbers()
    assert r["spin_proj_eq_D1"] is True
    assert r["alpha_A_eq_D1"] is True


def test_qcd_structure_function():
    from urt.nuclear_structure_cathedral import qcd_structure
    r = qcd_structure()
    assert r["colors_eq_D"] is True
    assert r["total_eq_V2"] is True


def test_nuclear_summary():
    from urt.nuclear_structure_cathedral import nuclear_summary
    r = nuclear_summary()
    assert "magic_numbers" in r
    assert "qcd" in r
    assert len(r["key_results"]) >= 5


def test_print_nuclear_report(capsys):
    from urt.nuclear_structure_cathedral import print_nuclear_report
    print_nuclear_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "20" in out
    assert "Cathedral" in out
    assert len(out) > 200
