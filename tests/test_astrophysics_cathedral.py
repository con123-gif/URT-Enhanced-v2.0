"""Tests for urt/astrophysics_cathedral.py — Stars, galaxies, Cathedral integers."""

import pytest
from math import isfinite


def test_imports():
    from urt.astrophysics_cathedral import (
        N_FUNDAMENTAL_FORCES, N_STELLAR_STRUCTURE_EQ, N_GALAXY_BRANCHES,
        RS_FACTOR, MASS_LUM_POWER, JEANS_POWER, KEPLER3_POWER,
        VIRIAL_FACTOR, N_H_SERIES, N_STELLAR_PHASES, SPACETIME_DIM,
        CHANDRA_POWER, N_COMPACT_GROUP_ICOS,
        stellar_structure, galactic_structure,
        astrophysics_summary, print_astrophysics_report,
    )


# ── Fundamental forces ────────────────────────────────────────────────────────

def test_fundamental_forces_eq_D1():
    """Fundamental forces = D+1 = 4."""
    from urt.astrophysics_cathedral import N_FUNDAMENTAL_FORCES, N_FORCES_EQ_D1
    from urt.shell_closure import D
    assert N_FUNDAMENTAL_FORCES == D + 1
    assert N_FUNDAMENTAL_FORCES == 4
    assert N_FORCES_EQ_D1 is True


def test_spacetime_dim_eq_D1():
    """Spacetime dimensions = D+1 = 4."""
    from urt.astrophysics_cathedral import SPACETIME_DIM, SPACETIME_EQ_D1
    from urt.shell_closure import D
    assert SPACETIME_DIM == D + 1
    assert SPACETIME_DIM == 4
    assert SPACETIME_EQ_D1 is True


# ── Stellar structure ─────────────────────────────────────────────────────────

def test_stellar_structure_eq_q():
    """Stellar structure equations = q = 5."""
    from urt.astrophysics_cathedral import N_STELLAR_STRUCTURE_EQ, N_STELLAR_EQ_Q
    from urt.shell_closure import q
    assert N_STELLAR_STRUCTURE_EQ == q
    assert N_STELLAR_STRUCTURE_EQ == 5
    assert N_STELLAR_EQ_Q is True


def test_stellar_phases_eq_D1():
    """Stellar evolution phases = D+1 = 4."""
    from urt.astrophysics_cathedral import N_STELLAR_PHASES, N_PHASES_EQ_D1
    from urt.shell_closure import D
    assert N_STELLAR_PHASES == D + 1
    assert N_STELLAR_PHASES == 4
    assert N_PHASES_EQ_D1 is True


def test_mass_luminosity_eq_D():
    """Mass-luminosity power law = D = 3."""
    from urt.astrophysics_cathedral import MASS_LUM_POWER, MASS_LUM_EQ_D
    from urt.shell_closure import D
    assert MASS_LUM_POWER == D
    assert MASS_LUM_POWER == 3
    assert MASS_LUM_EQ_D is True


def test_jeans_power():
    """Jeans mass power = D/2 = 1.5."""
    from urt.astrophysics_cathedral import JEANS_POWER, JEANS_EQ_3_2
    from urt.shell_closure import D
    assert abs(JEANS_POWER - float(D) / 2) < 1e-10
    assert abs(JEANS_POWER - 1.5) < 1e-10
    assert JEANS_EQ_3_2 is True


def test_chandrasekhar_power():
    """Chandrasekhar power = D/2 = 1.5."""
    from urt.astrophysics_cathedral import CHANDRA_POWER, CHANDRA_EQ_3_2
    assert abs(CHANDRA_POWER - 1.5) < 1e-10
    assert CHANDRA_EQ_3_2 is True


def test_h_series_eq_q():
    """Hydrogen spectral series = q = 5."""
    from urt.astrophysics_cathedral import N_H_SERIES, N_H_EQ_Q
    from urt.shell_closure import q
    assert N_H_SERIES == q
    assert N_H_SERIES == 5
    assert N_H_EQ_Q is True


# ── Galactic structure ────────────────────────────────────────────────────────

def test_galaxy_branches_eq_D():
    """Galaxy Hubble branches = D = 3."""
    from urt.astrophysics_cathedral import N_GALAXY_BRANCHES, N_GALAXY_EQ_D
    from urt.shell_closure import D
    assert N_GALAXY_BRANCHES == D
    assert N_GALAXY_BRANCHES == 3
    assert N_GALAXY_EQ_D is True


def test_schwarzschild_factor_eq_D1():
    """Schwarzschild r_s = (D-1)=2 GM/c²."""
    from urt.astrophysics_cathedral import RS_FACTOR, RS_EQ_D1
    from urt.shell_closure import D
    assert RS_FACTOR == D - 1
    assert RS_FACTOR == 2
    assert RS_EQ_D1 is True


def test_kepler3_power_eq_D():
    """Kepler T² ∝ r^D exponent = D = 3."""
    from urt.astrophysics_cathedral import KEPLER3_POWER, KEPLER3_EQ_D
    from urt.shell_closure import D
    assert KEPLER3_POWER == D
    assert KEPLER3_POWER == 3
    assert KEPLER3_EQ_D is True


def test_virial_factor_eq_D1():
    """Virial theorem factor = D-1 = 2."""
    from urt.astrophysics_cathedral import VIRIAL_FACTOR, VIRIAL_EQ_D1
    from urt.shell_closure import D
    assert VIRIAL_FACTOR == D - 1
    assert VIRIAL_FACTOR == 2
    assert VIRIAL_EQ_D1 is True


def test_compact_group_icos_eq_N():
    """Icosahedral compact galaxy group = N = 13."""
    from urt.astrophysics_cathedral import N_COMPACT_GROUP_ICOS, N_COMPACT_EQ_N
    from urt.shell_closure import N
    assert N_COMPACT_GROUP_ICOS == N
    assert N_COMPACT_GROUP_ICOS == 13
    assert N_COMPACT_EQ_N is True


# ── Function tests ────────────────────────────────────────────────────────────

def test_stellar_structure_function():
    from urt.astrophysics_cathedral import stellar_structure
    r = stellar_structure()
    assert r["n_structure_eq"] == 5
    assert r["eq_q"] is True
    assert r["n_phases"] == 4
    assert r["phases_eq_D1"] is True
    assert r["jeans_eq_3_2"] is True
    assert r["chandra_eq_3_2"] is True


def test_galactic_structure_function():
    from urt.astrophysics_cathedral import galactic_structure
    r = galactic_structure()
    assert r["n_galaxy_branches"] == 3
    assert r["eq_D"] is True
    assert r["spacetime_dim"] == 4
    assert r["spacetime_eq_D1"] is True
    assert r["kepler3_eq_D"] is True
    assert r["rs_eq_D1"] is True


def test_astrophysics_summary():
    from urt.astrophysics_cathedral import astrophysics_summary
    r = astrophysics_summary()
    assert "stellar" in r
    assert "galactic" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 5


def test_print_astrophysics_report(capsys):
    from urt.astrophysics_cathedral import print_astrophysics_report
    print_astrophysics_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "4" in out
