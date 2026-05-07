"""Tests for urt/architecture_cathedral.py — Sacred geometry and Cathedral integers."""

import pytest
from math import isfinite, pi, sqrt, atan, asin


# ── Import test ───────────────────────────────────────────────────────────────

def test_imports():
    from urt.architecture_cathedral import (
        N_PLATONIC_SOLIDS, N_PLATONIC_EQ_Q,
        N_ARCHIMEDEAN_SOLIDS, N_ARCHIMEDEAN_EQ_N,
        N_CATALAN_SOLIDS, N_CATALAN_EQ_N,
        N_KEPLER_POINSOT, N_KEPLER_EQ_D1,
        N_PRIMARY_DIRECTIONS, N_PRIMARY_EQ_D1,
        N_COMPASS_POINTS_8, N_COMPASS_8_EQ_2D,
        N_COMPASS_POINTS_16, N_COMPASS_16_EQ_2_2D,
        N_METATRON_CIRCLES, N_METATRON_EQ_N,
        N_SEED_OF_LIFE_CIRCLES,
        N_DODECAHEDRON_FACES, N_DODECAHEDRON_EQ_V,
        N_ICOSAHEDRON_FACES, N_ICOSAHEDRON_VERTICES, N_ICOSAHEDRON_EDGES,
        GOLDEN_SECTION, GOLDEN_ANGLE_DEG,
        SACRED_ANGLE_PHI_DEG, SACRED_ANGLE_DELTA_DEG,
        PENROSE_ACUTE_ANGLE_DEG, PENROSE_ACUTE_EQ_36,
        PENTAGON_INTERIOR_ANGLE_DEG,
        sacred_geometry, golden_proportions, compass_rose,
        architecture_summary, print_architecture_report,
    )


# ── Platonic solids ───────────────────────────────────────────────────────────

def test_platonic_eq_q():
    """Five Platonic solids = q = 5  [EXACT]."""
    from urt.architecture_cathedral import N_PLATONIC_SOLIDS, N_PLATONIC_EQ_Q
    from urt.shell_closure import q
    assert N_PLATONIC_SOLIDS == q
    assert N_PLATONIC_SOLIDS == 5
    assert N_PLATONIC_EQ_Q is True


# ── Archimedean solids ────────────────────────────────────────────────────────

def test_archimedean_eq_N():
    """13 Archimedean solids = N = 13  [EXACT!!!]."""
    from urt.architecture_cathedral import N_ARCHIMEDEAN_SOLIDS, N_ARCHIMEDEAN_EQ_N
    from urt.shell_closure import N
    assert N_ARCHIMEDEAN_SOLIDS == N
    assert N_ARCHIMEDEAN_SOLIDS == 13
    assert N_ARCHIMEDEAN_EQ_N is True


def test_catalan_eq_N():
    """13 Catalan solids = N = 13  [EXACT]."""
    from urt.architecture_cathedral import N_CATALAN_SOLIDS, N_CATALAN_EQ_N
    from urt.shell_closure import N
    assert N_CATALAN_SOLIDS == N
    assert N_CATALAN_SOLIDS == 13
    assert N_CATALAN_EQ_N is True


def test_kepler_poinsot_eq_D_plus_1():
    """4 Kepler-Poinsot polyhedra = D+1 = 4  [EXACT]."""
    from urt.architecture_cathedral import N_KEPLER_POINSOT, N_KEPLER_EQ_D1
    from urt.shell_closure import D
    assert N_KEPLER_POINSOT == D + 1
    assert N_KEPLER_POINSOT == 4
    assert N_KEPLER_EQ_D1 is True


# ── Compass rose ──────────────────────────────────────────────────────────────

def test_cardinal_directions_eq_D_plus_1():
    """4 cardinal directions = D+1 = 4  [EXACT]."""
    from urt.architecture_cathedral import N_PRIMARY_DIRECTIONS, N_PRIMARY_EQ_D1
    from urt.shell_closure import D
    assert N_PRIMARY_DIRECTIONS == D + 1
    assert N_PRIMARY_DIRECTIONS == 4
    assert N_PRIMARY_EQ_D1 is True


def test_compass_8_eq_2_pow_D():
    """8-point compass = 2^D = 8  [EXACT arithmetic]."""
    from urt.architecture_cathedral import N_COMPASS_POINTS_8, N_COMPASS_8_EQ_2D
    from urt.shell_closure import D
    assert N_COMPASS_POINTS_8 == 2 ** D
    assert N_COMPASS_POINTS_8 == 8
    assert N_COMPASS_8_EQ_2D is True


def test_compass_16():
    """16-point compass = 2 × 2^D = 16."""
    from urt.architecture_cathedral import N_COMPASS_POINTS_16, N_COMPASS_16_EQ_2_2D
    assert N_COMPASS_POINTS_16 == 16
    assert N_COMPASS_16_EQ_2_2D is True


# ── Sacred geometry circles ───────────────────────────────────────────────────

def test_metatron_circles_eq_N():
    """Metatron's Cube circles = 1+V = N = 13  [EXACT]."""
    from urt.architecture_cathedral import N_METATRON_CIRCLES, N_METATRON_EQ_N
    from urt.shell_closure import N, V
    assert N_METATRON_CIRCLES == 1 + V
    assert N_METATRON_CIRCLES == N
    assert N_METATRON_EQ_N is True


def test_seed_of_life_circles():
    """Seed of Life = 1 + V//2 = 7."""
    from urt.architecture_cathedral import N_SEED_OF_LIFE_CIRCLES
    from urt.shell_closure import V
    assert N_SEED_OF_LIFE_CIRCLES == 1 + V // 2
    assert N_SEED_OF_LIFE_CIRCLES == 7


# ── Polyhedral faces ──────────────────────────────────────────────────────────

def test_dodecahedron_faces_eq_V():
    """Dodecahedron faces = G//q = V = 12  [EXACT]."""
    from urt.architecture_cathedral import N_DODECAHEDRON_FACES, N_DODECAHEDRON_EQ_V
    from urt.shell_closure import V, G, q
    assert N_DODECAHEDRON_FACES == G // q
    assert N_DODECAHEDRON_FACES == V
    assert N_DODECAHEDRON_FACES == 12
    assert N_DODECAHEDRON_EQ_V is True


def test_icosahedron_faces_eq_F():
    """Icosahedron faces = F = 20  [EXACT]."""
    from urt.architecture_cathedral import N_ICOSAHEDRON_FACES
    from urt.shell_closure import F
    assert N_ICOSAHEDRON_FACES == F
    assert N_ICOSAHEDRON_FACES == 20


def test_icosahedron_vertices_eq_V():
    """Icosahedron vertices = V = 12  [EXACT]."""
    from urt.architecture_cathedral import N_ICOSAHEDRON_VERTICES
    from urt.shell_closure import V
    assert N_ICOSAHEDRON_VERTICES == V
    assert N_ICOSAHEDRON_VERTICES == 12


def test_icosahedron_edges_eq_E():
    """Icosahedron edges = E = 30  [EXACT]."""
    from urt.architecture_cathedral import N_ICOSAHEDRON_EDGES
    from urt.shell_closure import E
    assert N_ICOSAHEDRON_EDGES == E
    assert N_ICOSAHEDRON_EDGES == 30


# ── Golden ratio ──────────────────────────────────────────────────────────────

def test_golden_section_is_phi():
    """Golden section = φ = (1+√5)/2 ≈ 1.618."""
    from urt.architecture_cathedral import GOLDEN_SECTION
    from urt.shell_closure import phi
    assert abs(GOLDEN_SECTION - phi) < 1e-12
    assert abs(GOLDEN_SECTION - (1 + sqrt(5)) / 2) < 1e-12


def test_golden_angle_approx():
    """Golden angle ≈ 137.5°."""
    from urt.architecture_cathedral import GOLDEN_ANGLE_DEG
    assert 137.0 < GOLDEN_ANGLE_DEG < 138.0


def test_sacred_angle_phi_approx():
    """Kepler triangle angle arctan(φ) ≈ 58.28°."""
    from urt.architecture_cathedral import SACRED_ANGLE_PHI_DEG
    from urt.shell_closure import phi
    expected = atan(phi) * 180.0 / pi
    assert abs(SACRED_ANGLE_PHI_DEG - expected) < 1e-10
    assert 58.0 < SACRED_ANGLE_PHI_DEG < 59.0


def test_sacred_angle_delta():
    """Cathedral angle = arcsin(δ★) ≈ 8.49°."""
    from urt.architecture_cathedral import SACRED_ANGLE_DELTA_DEG
    from urt.shell_closure import DELTA_STAR
    expected = asin(DELTA_STAR) * 180.0 / pi
    assert abs(SACRED_ANGLE_DELTA_DEG - expected) < 1e-10
    assert 8.0 < SACRED_ANGLE_DELTA_DEG < 9.0


def test_penrose_acute_angle_eq_36():
    """Penrose acute angle = 360°/(2q) = 36°  [EXACT]."""
    from urt.architecture_cathedral import PENROSE_ACUTE_ANGLE_DEG, PENROSE_ACUTE_EQ_36
    assert abs(PENROSE_ACUTE_ANGLE_DEG - 36.0) < 1e-10
    assert PENROSE_ACUTE_EQ_36 is True


def test_pentagon_interior_angle():
    """Pentagon interior angle = (q-2)×180/q = 108°."""
    from urt.architecture_cathedral import PENTAGON_INTERIOR_ANGLE_DEG
    from urt.shell_closure import q
    expected = (q - 2) * 180.0 / q
    assert abs(PENTAGON_INTERIOR_ANGLE_DEG - expected) < 1e-10
    assert abs(PENTAGON_INTERIOR_ANGLE_DEG - 108.0) < 1e-10


# ── Function tests ────────────────────────────────────────────────────────────

def test_sacred_geometry_function():
    from urt.architecture_cathedral import sacred_geometry
    r = sacred_geometry()
    assert r["n_platonic"] == 5
    assert r["n_platonic_eq_q"] is True
    assert r["n_archimedean"] == 13
    assert r["n_archimedean_eq_N"] is True
    assert r["n_catalan"] == 13
    assert r["n_catalan_eq_N"] is True
    assert r["n_kepler_poinsot"] == 4
    assert r["n_kepler_eq_D1"] is True
    assert r["n_metatron"] == 13
    assert r["n_metatron_eq_N"] is True
    assert r["n_dodecahedron_faces"] == 12
    assert r["n_dodecahedron_eq_V"] is True
    assert "EXACT" in r["status_archimedean"]


def test_golden_proportions_function():
    from urt.architecture_cathedral import golden_proportions
    from urt.shell_closure import phi
    r = golden_proportions()
    assert abs(r["phi"] - phi) < 1e-12
    assert r["phi_present"] is True
    assert r["penrose_eq_36"] is True
    assert 137.0 < r["golden_angle_deg"] < 138.0


def test_compass_rose_function():
    from urt.architecture_cathedral import compass_rose
    r = compass_rose()
    assert r["n_primary"] == 4
    assert r["n_primary_eq_D1"] is True
    assert r["n_8pt"] == 8
    assert r["n_8pt_eq_2D"] is True
    assert r["n_16pt"] == 16
    assert "EXACT" in r["status_primary"]


def test_architecture_summary_keys():
    from urt.architecture_cathedral import architecture_summary
    s = architecture_summary()
    assert "geometry" in s
    assert "golden" in s
    assert "compass" in s
    assert "key_results" in s
    assert len(s["key_results"]) >= 8
    assert s["N"] == 13
    assert s["q"] == 5
    assert s["V"] == 12


def test_print_architecture_report(capsys):
    from urt.architecture_cathedral import print_architecture_report
    print_architecture_report()
    captured = capsys.readouterr()
    assert "EXACT" in captured.out
    assert "13" in captured.out


# ── Cross-consistency ─────────────────────────────────────────────────────────

def test_archimedean_eq_catalan():
    """Archimedean count = Catalan count = N = 13."""
    from urt.architecture_cathedral import N_ARCHIMEDEAN_SOLIDS, N_CATALAN_SOLIDS
    assert N_ARCHIMEDEAN_SOLIDS == N_CATALAN_SOLIDS


def test_platonic_eq_q_value():
    """Platonic = q = 5 is exactly five."""
    from urt.architecture_cathedral import N_PLATONIC_SOLIDS
    assert N_PLATONIC_SOLIDS == 5


def test_metatron_eq_archimedean():
    """Metatron circles = Archimedean solids = N = 13."""
    from urt.architecture_cathedral import N_METATRON_CIRCLES, N_ARCHIMEDEAN_SOLIDS
    assert N_METATRON_CIRCLES == N_ARCHIMEDEAN_SOLIDS
