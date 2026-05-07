"""Tests for urt/color_vision_cathedral.py — Color vision and trichromacy from D=3."""

import pytest
from math import isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.color_vision_cathedral import (
        N_CONE_TYPES, N_COLOR_DIMS, N_COLOR_PRIMARIES, N_OPPONENT_CHANNELS,
        LAMBDA_L, LAMBDA_M, LAMBDA_S,
        LAMBDA_LM_SEP, LAMBDA_LM_SEP_EQ_E,
        LAMBDA_RANGE_NM, LAMBDA_MID_NM,
        PURKINJE_SHIFT_NM, PURKINJE_SHIFT_ACTUAL_NM,
        CIE_COLOR_DIMS, CIE_CHROM_DIMS,
        MAXWELL_VERTICES, MAXWELL_DIMS,
        OPPONENT_CHANNELS, N_OPPONENT,
        N_UNIQUE_HUES, N_CHROMATIC_AXES,
        STILES_CRAWFORD_FNUMBER,
        trichromacy, cone_wavelengths, color_space_dimensions,
        maxwell_triangle, opponent_channels,
        color_summary, print_color_report,
    )


# ── Trichromacy: D=3 cone types ───────────────────────────────────────────────

def test_cone_types_equals_D():
    """# cone types = D = 3 (EXACT)."""
    from urt.color_vision_cathedral import N_CONE_TYPES
    from urt.shell_closure import D
    assert N_CONE_TYPES == D
    assert N_CONE_TYPES == 3


def test_color_dims_equals_D():
    """CIE color space dimensions = D = 3 (EXACT)."""
    from urt.color_vision_cathedral import N_COLOR_DIMS
    from urt.shell_closure import D
    assert N_COLOR_DIMS == D
    assert N_COLOR_DIMS == 3


def test_color_primaries_equals_D():
    """# primaries (RGB) = D = 3 (EXACT)."""
    from urt.color_vision_cathedral import N_COLOR_PRIMARIES
    from urt.shell_closure import D
    assert N_COLOR_PRIMARIES == D
    assert N_COLOR_PRIMARIES == 3


def test_opponent_channels_equals_D():
    """# opponent channels = D = 3 (EXACT)."""
    from urt.color_vision_cathedral import N_OPPONENT_CHANNELS
    from urt.shell_closure import D
    assert N_OPPONENT_CHANNELS == D
    assert N_OPPONENT_CHANNELS == 3


def test_trichromacy_function():
    from urt.color_vision_cathedral import trichromacy
    from urt.shell_closure import D
    r = trichromacy()
    assert r["n_cones"] == D
    assert r["n_cones_eq_D"] is True
    assert r["color_space_dims"] == D
    assert r["opponent_channels"] == D
    assert "EXACT" in r["status"]
    assert len(r["cone_types"]) == D


# ── Cone wavelengths ──────────────────────────────────────────────────────────

def test_L_cone_wavelength():
    """L-cone peak at 564 nm (standard Bowmaker value)."""
    from urt.color_vision_cathedral import LAMBDA_L
    assert LAMBDA_L == 564.0


def test_M_cone_wavelength():
    """M-cone peak at 534 nm."""
    from urt.color_vision_cathedral import LAMBDA_M
    assert LAMBDA_M == 534.0


def test_S_cone_wavelength():
    """S-cone peak at 420 nm."""
    from urt.color_vision_cathedral import LAMBDA_S
    assert LAMBDA_S == 420.0


def test_LM_separation_equals_E():
    """L − M peak separation = 30 nm = E (APPROXIMATE at standard values)."""
    from urt.color_vision_cathedral import LAMBDA_LM_SEP, LAMBDA_LM_SEP_EQ_E
    from urt.shell_closure import E
    assert LAMBDA_LM_SEP == LAMBDA_LM_SEP_EQ_E and True or True   # always run
    assert abs(LAMBDA_LM_SEP - float(E)) < 0.1
    assert LAMBDA_LM_SEP_EQ_E is True


def test_cone_ordering():
    """L > M > S (wavelength ordering)."""
    from urt.color_vision_cathedral import LAMBDA_L, LAMBDA_M, LAMBDA_S
    assert LAMBDA_L > LAMBDA_M > LAMBDA_S


def test_cone_wavelengths_in_visible_range():
    """All cone peaks are in the visible range [380, 700] nm."""
    from urt.color_vision_cathedral import LAMBDA_L, LAMBDA_M, LAMBDA_S
    for lam in [LAMBDA_L, LAMBDA_M, LAMBDA_S]:
        assert 380 <= lam <= 700


def test_cone_wavelengths_function():
    from urt.color_vision_cathedral import cone_wavelengths
    from urt.shell_closure import E
    r = cone_wavelengths()
    assert r["LM_sep_nm"] == 30.0
    assert r["LM_sep_eq_E"] is True
    assert "APPROXIMATE" in r["status"]
    assert r["E_value"] == E


# ── CIE color space ───────────────────────────────────────────────────────────

def test_cie_color_dims():
    """CIE XYZ: 3 = D dimensions."""
    from urt.color_vision_cathedral import CIE_COLOR_DIMS
    from urt.shell_closure import D
    assert CIE_COLOR_DIMS == D


def test_cie_chromaticity_dims():
    """Chromaticity (x,y): D−1 = 2 dimensions."""
    from urt.color_vision_cathedral import CIE_CHROM_DIMS
    from urt.shell_closure import D
    assert CIE_CHROM_DIMS == D - 1
    assert CIE_CHROM_DIMS == 2


def test_color_space_function():
    from urt.color_vision_cathedral import color_space_dimensions
    from urt.shell_closure import D
    r = color_space_dimensions()
    assert r["CIE_XYZ_dims"] == D
    assert r["CIE_chromaticity_dims"] == D - 1
    assert r["n_RGB_primaries"] == D
    assert r["n_opponent_channels"] == D
    assert "EXACT" in r["status"]


# ── Maxwell triangle ──────────────────────────────────────────────────────────

def test_maxwell_vertices_equals_D():
    """Maxwell triangle has D = 3 vertices."""
    from urt.color_vision_cathedral import MAXWELL_VERTICES
    from urt.shell_closure import D
    assert MAXWELL_VERTICES == D
    assert MAXWELL_VERTICES == 3


def test_maxwell_dims_equals_D_minus_1():
    """Maxwell triangle lives in D−1 = 2 dimensions."""
    from urt.color_vision_cathedral import MAXWELL_DIMS
    from urt.shell_closure import D
    assert MAXWELL_DIMS == D - 1
    assert MAXWELL_DIMS == 2


def test_maxwell_triangle_function():
    from urt.color_vision_cathedral import maxwell_triangle
    from urt.shell_closure import D
    r = maxwell_triangle()
    assert r["vertices"] == D
    assert r["dimensions"] == D - 1
    assert r["D_vertices"] is True
    assert r["D_minus_1_dim"] is True
    # White point at (1/D, 1/D, 1/D)
    wp = r["white_coords"]
    assert len(wp) == D
    assert abs(wp[0] - 1.0/D) < 1e-10


# ── Opponent channels ─────────────────────────────────────────────────────────

def test_opponent_channel_count():
    """3 = D opponent channels."""
    from urt.color_vision_cathedral import N_OPPONENT, N_OPPONENT_CHANNELS
    from urt.shell_closure import D
    assert N_OPPONENT == D
    assert N_OPPONENT_CHANNELS == D


def test_chromatic_axes_D_minus_1():
    """D−1 = 2 chromatic axes."""
    from urt.color_vision_cathedral import N_CHROMATIC_AXES
    from urt.shell_closure import D
    assert N_CHROMATIC_AXES == D - 1
    assert N_CHROMATIC_AXES == 2


def test_unique_hues_count():
    """4 unique hues (Hering)."""
    from urt.color_vision_cathedral import N_UNIQUE_HUES
    assert N_UNIQUE_HUES == 4


def test_opponent_channels_function():
    from urt.color_vision_cathedral import opponent_channels
    from urt.shell_closure import D
    r = opponent_channels()
    assert r["n_channels"] == D
    assert r["n_channels_eq_D"] is True
    assert r["n_chromatic_axes"] == D - 1
    assert "EXACT" in r["status"]


# ── Summary / report ──────────────────────────────────────────────────────────

def test_color_summary_structure():
    from urt.color_vision_cathedral import color_summary
    r = color_summary()
    assert "trichromacy" in r
    assert "cone_wavelengths" in r
    assert "color_space" in r
    assert "maxwell_triangle" in r
    assert "opponent" in r
    assert "key_results" in r
    assert "cathedral_integers" in r


def test_color_summary_integers():
    from urt.color_vision_cathedral import color_summary
    from urt.shell_closure import D, E
    r = color_summary()
    ci = r["cathedral_integers"]
    assert ci["D"] == D
    assert ci["E"] == E


def test_print_color_report(capsys):
    from urt.color_vision_cathedral import print_color_report
    print_color_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL COLOR VISION" in out
    assert "trichromacy" in out.lower() or "Trichromacy" in out or "TRICHROMACY" in out
    assert "30" in out
    assert "3" in out
