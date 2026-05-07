"""Tests for urt/ecology_cathedral.py — Food webs, biodiversity, Cathedral integers."""

import pytest
from math import isfinite


def test_imports():
    from urt.ecology_cathedral import (
        N_TROPHIC_LEVELS, N_TROPHIC_EQ_D1, N_DIVERSITY_LEVELS,
        SPECIES_AREA_EXP, KLEIBER_EXPONENT, KLEIBER_EQ_3_4,
        N_BIOMES_MAJOR, LV_MIN_SPECIES, N_ICOS_WEB_NODES,
        GOLDEN_ANGLE_DEG, GOLDEN_ANGLE_RAD, H_MAX_ICOS,
        trophic_structure, biodiversity, phyllotaxis,
        ecology_summary, print_ecology_report,
    )


# ── Trophic structure ──────────────────────────────────────────────────────────

def test_trophic_levels_eq_D1():
    """Trophic levels = D+1 = 4."""
    from urt.ecology_cathedral import N_TROPHIC_LEVELS, N_TROPHIC_EQ_D1
    from urt.shell_closure import D
    assert N_TROPHIC_LEVELS == D + 1
    assert N_TROPHIC_LEVELS == 4
    assert N_TROPHIC_EQ_D1 is True


def test_lv_min_species_eq_D():
    """Lotka-Volterra minimal species = D = 3."""
    from urt.ecology_cathedral import LV_MIN_SPECIES
    from urt.shell_closure import D
    assert LV_MIN_SPECIES == D
    assert LV_MIN_SPECIES == 3


def test_icos_web_nodes_eq_N():
    """Icosahedral food web nodes = N = 13."""
    from urt.ecology_cathedral import N_ICOS_WEB_NODES
    from urt.shell_closure import N
    assert N_ICOS_WEB_NODES == N
    assert N_ICOS_WEB_NODES == 13


def test_icos_web_edges_eq_E():
    """Icosahedral food web edges = E = 30."""
    from urt.ecology_cathedral import N_ICOS_WEB_EDGES
    from urt.shell_closure import E
    assert N_ICOS_WEB_EDGES == E
    assert N_ICOS_WEB_EDGES == 30


# ── Biodiversity ──────────────────────────────────────────────────────────────

def test_diversity_levels_eq_D():
    """Biodiversity levels (α,β,γ) = D = 3."""
    from urt.ecology_cathedral import N_DIVERSITY_LEVELS, N_DIVERSITY_EQ_D
    from urt.shell_closure import D
    assert N_DIVERSITY_LEVELS == D
    assert N_DIVERSITY_LEVELS == 3
    assert N_DIVERSITY_EQ_D is True


def test_species_area_exponent():
    """Species-area z = 1/(D+1) = 0.25."""
    from urt.ecology_cathedral import SPECIES_AREA_EXP, SPECIES_AREA_EQ_1_D1
    from urt.shell_closure import D
    assert abs(SPECIES_AREA_EXP - 1.0 / (D + 1)) < 1e-10
    assert abs(SPECIES_AREA_EXP - 0.25) < 1e-10
    assert SPECIES_AREA_EQ_1_D1 is True


def test_kleiber_exponent():
    """Kleiber exponent = D/(D+1) = 0.75."""
    from urt.ecology_cathedral import KLEIBER_EXPONENT, KLEIBER_EQ_3_4
    from urt.shell_closure import D
    assert abs(KLEIBER_EXPONENT - float(D) / (D + 1)) < 1e-10
    assert abs(KLEIBER_EXPONENT - 0.75) < 1e-10
    assert KLEIBER_EQ_3_4 is True


def test_biomes_eq_q():
    """Major biomes ≈ q = 5."""
    from urt.ecology_cathedral import N_BIOMES_MAJOR
    from urt.shell_closure import q
    assert N_BIOMES_MAJOR == q
    assert N_BIOMES_MAJOR == 5


# ── Phyllotaxis ────────────────────────────────────────────────────────────────

def test_golden_angle_approx_137():
    """Golden angle ≈ 137.5°."""
    from urt.ecology_cathedral import GOLDEN_ANGLE_DEG
    assert abs(GOLDEN_ANGLE_DEG - 137.508) < 0.01


def test_golden_angle_rad():
    """Golden angle in radians ≈ 2.4 rad."""
    from urt.ecology_cathedral import GOLDEN_ANGLE_RAD
    from math import pi
    assert 2.3 < GOLDEN_ANGLE_RAD < 2.5
    # Verify: θ_g = 2π/φ²
    from urt.shell_closure import phi
    assert abs(GOLDEN_ANGLE_RAD - 2.0 * pi / phi**2) < 1e-10


def test_h_max_icos():
    """H_max for N=13 species = log₂(13) ≈ 3.70 bits."""
    from urt.ecology_cathedral import H_MAX_ICOS
    from math import log
    from urt.shell_closure import N
    assert abs(H_MAX_ICOS - log(N) / log(2)) < 1e-10
    assert 3.5 < H_MAX_ICOS < 4.0


# ── Function tests ─────────────────────────────────────────────────────────────

def test_trophic_structure_function():
    from urt.ecology_cathedral import trophic_structure
    r = trophic_structure()
    assert r["n_trophic_levels"] == 4
    assert r["trophic_eq_D1"] is True
    assert r["lv_min_species"] == 3
    assert r["lv_min_eq_D"] is True
    assert r["icos_nodes"] == 13
    assert r["icos_edges"] == 30


def test_biodiversity_function():
    from urt.ecology_cathedral import biodiversity
    r = biodiversity()
    assert r["n_diversity_levels"] == 3
    assert r["diversity_eq_D"] is True
    assert abs(r["species_area_exp"] - 0.25) < 1e-10
    assert r["species_area_eq_025"] is True
    assert abs(r["kleiber_exp"] - 0.75) < 1e-10
    assert r["kleiber_eq_075"] is True


def test_phyllotaxis_function():
    from urt.ecology_cathedral import phyllotaxis
    r = phyllotaxis()
    assert r["golden_angle_approx_1375"] is True
    assert abs(r["golden_angle_deg"] - 137.508) < 0.01


def test_ecology_summary():
    from urt.ecology_cathedral import ecology_summary
    r = ecology_summary()
    assert "trophic" in r
    assert "biodiversity" in r
    assert "phyllotaxis" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 5


def test_print_ecology_report(capsys):
    from urt.ecology_cathedral import print_ecology_report
    print_ecology_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "137" in out
    assert "EXACT" in out
