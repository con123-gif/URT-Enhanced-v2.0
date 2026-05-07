"""Tests for urt/crystallography_2d_cathedral.py — 2D Bravais, wallpaper groups, Penrose."""

import pytest


def test_imports():
    from urt.crystallography_2d_cathedral import (
        N_BRAVAIS_2D, N_POINT_GROUPS_2D, N_WALLPAPER_GROUPS,
        HEXAGONAL_COORD, SQUARE_COORD, HONEYCOMB_COORD, GRAPHENE_SUBLATTICES,
        PENROSE_FOLD, N_ALLOWED_ROT_2D, PHI_IN_PENROSE,
        bravais_2d, point_groups_2d, lattice_structures_2d,
        penrose_tiling, crystallography_2d_summary, print_crystallography_2d_report,
    )


def test_bravais_2d_eq_q():
    """2D Bravais lattices = q = 5."""
    from urt.crystallography_2d_cathedral import N_BRAVAIS_2D
    from urt.shell_closure import q
    assert N_BRAVAIS_2D == q
    assert N_BRAVAIS_2D == 5


def test_point_groups_2d_eq_N_D():
    """2D crystallographic point groups = N-D = 10."""
    from urt.crystallography_2d_cathedral import N_POINT_GROUPS_2D
    from urt.shell_closure import N, D
    assert N_POINT_GROUPS_2D == N - D
    assert N_POINT_GROUPS_2D == 10


def test_hexagonal_coord_eq_V2():
    """Hexagonal coordination = V/2 = 6."""
    from urt.crystallography_2d_cathedral import HEXAGONAL_COORD
    from urt.shell_closure import V
    assert HEXAGONAL_COORD == V // 2
    assert HEXAGONAL_COORD == 6


def test_honeycomb_coord_eq_D():
    """Honeycomb (graphene) coordination = D = 3."""
    from urt.crystallography_2d_cathedral import HONEYCOMB_COORD
    from urt.shell_closure import D
    assert HONEYCOMB_COORD == D
    assert HONEYCOMB_COORD == 3


def test_graphene_sublattices_eq_D1():
    """Graphene has D-1 = 2 sublattices."""
    from urt.crystallography_2d_cathedral import GRAPHENE_SUBLATTICES
    from urt.shell_closure import D
    assert GRAPHENE_SUBLATTICES == D - 1
    assert GRAPHENE_SUBLATTICES == 2


def test_penrose_fold_eq_q():
    """Penrose tiling 5-fold = q = 5."""
    from urt.crystallography_2d_cathedral import PENROSE_FOLD
    from urt.shell_closure import q
    assert PENROSE_FOLD == q
    assert PENROSE_FOLD == 5


def test_phi_in_penrose():
    """Penrose tiling uses φ."""
    from urt.crystallography_2d_cathedral import PHI_IN_PENROSE
    from urt.shell_closure import phi
    assert abs(PHI_IN_PENROSE - phi) < 1e-8


def test_bravais_2d_function():
    from urt.crystallography_2d_cathedral import bravais_2d
    r = bravais_2d()
    assert r["n_bravais_eq_q"] is True
    assert r["n_bravais"] == 5


def test_point_groups_2d_function():
    from urt.crystallography_2d_cathedral import point_groups_2d
    r = point_groups_2d()
    assert r["n_pg_eq_N_D"] is True
    assert r["n_pg"] == 10


def test_lattice_structures_function():
    from urt.crystallography_2d_cathedral import lattice_structures_2d
    r = lattice_structures_2d()
    assert r["honeycomb_eq_D"] is True
    assert r["hexagonal_eq_V2"] is True


def test_penrose_tiling_function():
    from urt.crystallography_2d_cathedral import penrose_tiling
    r = penrose_tiling()
    assert r["fold_eq_q"] is True
    assert r["fold"] == 5


def test_crystallography_2d_summary():
    from urt.crystallography_2d_cathedral import crystallography_2d_summary
    r = crystallography_2d_summary()
    assert "bravais" in r
    assert "lattices" in r
    assert "penrose" in r
    assert len(r["key_results"]) >= 4


def test_print_crystallography_2d_report(capsys):
    from urt.crystallography_2d_cathedral import print_crystallography_2d_report
    print_crystallography_2d_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "5" in out
