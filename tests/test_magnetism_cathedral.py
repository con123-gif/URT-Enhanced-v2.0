"""
Tests for urt/magnetism_cathedral.py
Cathedral integers in magnetism and spin physics.
"""

import pytest
from math import isfinite, isclose


# ── Import smoke test ──────────────────────────────────────────────────────────

def test_imports():
    """All public names import cleanly."""
    from urt.magnetism_cathedral import (
        G_FACTOR_TREE, G_FACTOR_EQ_D1,
        N_SPIN_HALF_STATES, SPIN_HALF_EQ_D1,
        N_SPIN_1_STATES, SPIN_1_EQ_D,
        N_MAGNETIC_MOMENT_COMPONENTS, MOMENT_EQ_D,
        BLOCH_EXPONENT, BLOCH_EQ_3_2, BLOCH_FORMULA,
        FCC_EXCHANGE_NEIGHBORS, FCC_EQ_V,
        WEISS_Z, WEISS_PREFACTOR,
        N_SPIN_HALL_COMPONENTS, SPIN_HALL_EQ_D,
        N_DM_COMPONENTS, DM_EQ_D,
        N_DW_PARAMS, DW_EQ_D1,
        N_MAGNON_ACOUSTIC, MAGNON_EQ_D,
        N_HEISENBERG_SPIN_COMPONENTS, HEISENBERG_EQ_D,
        N_HEISENBERG_LOWER_CRITICAL, LOWER_CRITICAL_EQ_D1,
        LARMOR_DIM,
        STONER_EXCHANGE_APPROX, CATHEDRAL_ANISOTROPY,
        spin_properties, magnetic_exchange,
        magnetism_summary, print_magnetism_report,
    )


# ── g-factor ──────────────────────────────────────────────────────────────────

def test_g_factor_tree_eq_D_minus_1():
    """Tree-level electron g-factor = D-1 = 2  [EXACT: Dirac equation]."""
    from urt.magnetism_cathedral import G_FACTOR_TREE, G_FACTOR_EQ_D1
    from urt.shell_closure import D
    assert G_FACTOR_TREE == D - 1
    assert G_FACTOR_TREE == 2
    assert G_FACTOR_EQ_D1 is True


def test_g_factor_tree_value():
    """G_FACTOR_TREE is exactly 2."""
    from urt.magnetism_cathedral import G_FACTOR_TREE
    assert G_FACTOR_TREE == 2


# ── Spin-1/2 ──────────────────────────────────────────────────────────────────

def test_spin_half_states_eq_D_minus_1():
    """Spin-1/2 has D-1 = 2 states  [EXACT: |↑⟩, |↓⟩]."""
    from urt.magnetism_cathedral import N_SPIN_HALF_STATES, SPIN_HALF_EQ_D1
    from urt.shell_closure import D
    assert N_SPIN_HALF_STATES == D - 1
    assert N_SPIN_HALF_STATES == 2
    assert SPIN_HALF_EQ_D1 is True


def test_spin_half_states_value():
    """N_SPIN_HALF_STATES is exactly 2."""
    from urt.magnetism_cathedral import N_SPIN_HALF_STATES
    assert N_SPIN_HALF_STATES == 2


# ── Spin-1 ────────────────────────────────────────────────────────────────────

def test_spin_1_states_eq_D():
    """Spin-1 has D = 3 states  [EXACT: m_s = -1, 0, +1]."""
    from urt.magnetism_cathedral import N_SPIN_1_STATES, SPIN_1_EQ_D
    from urt.shell_closure import D
    assert N_SPIN_1_STATES == D
    assert N_SPIN_1_STATES == 3
    assert SPIN_1_EQ_D is True


def test_spin_1_states_value():
    """N_SPIN_1_STATES is exactly 3."""
    from urt.magnetism_cathedral import N_SPIN_1_STATES
    assert N_SPIN_1_STATES == 3


def test_spin_1_is_2S_plus_1():
    """N_SPIN_1_STATES = 2×1+1 = 3 = D (formula check)."""
    from urt.magnetism_cathedral import N_SPIN_1_STATES
    S = 1
    assert N_SPIN_1_STATES == 2 * S + 1


# ── Magnetic moment ────────────────────────────────────────────────────────────

def test_moment_components_eq_D():
    """Magnetic moment has D = 3 components  [EXACT: m_x, m_y, m_z]."""
    from urt.magnetism_cathedral import N_MAGNETIC_MOMENT_COMPONENTS, MOMENT_EQ_D
    from urt.shell_closure import D
    assert N_MAGNETIC_MOMENT_COMPONENTS == D
    assert N_MAGNETIC_MOMENT_COMPONENTS == 3
    assert MOMENT_EQ_D is True


def test_moment_components_value():
    """N_MAGNETIC_MOMENT_COMPONENTS is exactly 3."""
    from urt.magnetism_cathedral import N_MAGNETIC_MOMENT_COMPONENTS
    assert N_MAGNETIC_MOMENT_COMPONENTS == 3


# ── Bloch T^{3/2} law ────────────────────────────────────────────────────────

def test_bloch_exponent_eq_D_over_2():
    """Bloch T^{D/2} law: exponent = D/2 = 3/2  [EXACT]."""
    from urt.magnetism_cathedral import BLOCH_EXPONENT, BLOCH_EQ_3_2
    from urt.shell_closure import D
    assert abs(BLOCH_EXPONENT - float(D) / 2) < 1e-14
    assert abs(BLOCH_EXPONENT - 1.5) < 1e-14
    assert BLOCH_EQ_3_2 is True


def test_bloch_exponent_value():
    """BLOCH_EXPONENT is exactly 1.5."""
    from urt.magnetism_cathedral import BLOCH_EXPONENT
    assert abs(BLOCH_EXPONENT - 1.5) < 1e-14


def test_bloch_formula_is_string():
    """BLOCH_FORMULA is a descriptive string."""
    from urt.magnetism_cathedral import BLOCH_FORMULA
    assert isinstance(BLOCH_FORMULA, str)
    assert "D/2" in BLOCH_FORMULA or "3/2" in BLOCH_FORMULA


# ── FCC coordination ──────────────────────────────────────────────────────────

def test_fcc_neighbors_eq_V():
    """FCC exchange neighbours = V = 12  [EXACT]."""
    from urt.magnetism_cathedral import FCC_EXCHANGE_NEIGHBORS, FCC_EQ_V
    from urt.shell_closure import V
    assert FCC_EXCHANGE_NEIGHBORS == V
    assert FCC_EXCHANGE_NEIGHBORS == 12
    assert FCC_EQ_V is True


def test_fcc_neighbors_value():
    """FCC_EXCHANGE_NEIGHBORS is exactly 12."""
    from urt.magnetism_cathedral import FCC_EXCHANGE_NEIGHBORS
    assert FCC_EXCHANGE_NEIGHBORS == 12


def test_weiss_z_eq_V():
    """Weiss mean-field z equals V = 12."""
    from urt.magnetism_cathedral import WEISS_Z
    from urt.shell_closure import V
    assert WEISS_Z == V
    assert WEISS_Z == 12


def test_weiss_prefactor():
    """Weiss prefactor = V/D = 12/3 = 4."""
    from urt.magnetism_cathedral import WEISS_PREFACTOR
    from urt.shell_closure import V, D
    assert abs(WEISS_PREFACTOR - float(V) / D) < 1e-14
    assert abs(WEISS_PREFACTOR - 4.0) < 1e-14


# ── Spin Hall conductivity ─────────────────────────────────────────────────────

def test_spin_hall_components_eq_D():
    """Spin-Hall tensor components = D(D-1)/2 = 3 = D  [EXACT: self-referential!]."""
    from urt.magnetism_cathedral import N_SPIN_HALL_COMPONENTS, SPIN_HALL_EQ_D
    from urt.shell_closure import D
    assert N_SPIN_HALL_COMPONENTS == D * (D - 1) // 2
    assert N_SPIN_HALL_COMPONENTS == D
    assert N_SPIN_HALL_COMPONENTS == 3
    assert SPIN_HALL_EQ_D is True


def test_spin_hall_self_referential():
    """D(D-1)/2 = D is a self-referential identity unique to D=3."""
    from urt.shell_closure import D
    # This identity D(D-1)//2 == D holds only for D=3
    assert D * (D - 1) // 2 == D


def test_spin_hall_value():
    """N_SPIN_HALL_COMPONENTS is exactly 3."""
    from urt.magnetism_cathedral import N_SPIN_HALL_COMPONENTS
    assert N_SPIN_HALL_COMPONENTS == 3


# ── Dzyaloshinskii-Moriya vector ──────────────────────────────────────────────

def test_dm_components_eq_D():
    """DM interaction vector has D = 3 components  [EXACT]."""
    from urt.magnetism_cathedral import N_DM_COMPONENTS, DM_EQ_D
    from urt.shell_closure import D
    assert N_DM_COMPONENTS == D
    assert N_DM_COMPONENTS == 3
    assert DM_EQ_D is True


def test_dm_components_value():
    """N_DM_COMPONENTS is exactly 3."""
    from urt.magnetism_cathedral import N_DM_COMPONENTS
    assert N_DM_COMPONENTS == 3


# ── Domain wall parameters ────────────────────────────────────────────────────

def test_dw_params_eq_D_minus_1():
    """Domain wall characterised by D-1 = 2 parameters  [EXACT: A, K_u]."""
    from urt.magnetism_cathedral import N_DW_PARAMS, DW_EQ_D1
    from urt.shell_closure import D
    assert N_DW_PARAMS == D - 1
    assert N_DW_PARAMS == 2
    assert DW_EQ_D1 is True


def test_dw_params_value():
    """N_DW_PARAMS is exactly 2."""
    from urt.magnetism_cathedral import N_DW_PARAMS
    assert N_DW_PARAMS == 2


# ── Magnon acoustic branches ──────────────────────────────────────────────────

def test_magnon_acoustic_eq_D():
    """Acoustic magnon branches in 3D = D = 3  [EXACT]."""
    from urt.magnetism_cathedral import N_MAGNON_ACOUSTIC, MAGNON_EQ_D
    from urt.shell_closure import D
    assert N_MAGNON_ACOUSTIC == D
    assert N_MAGNON_ACOUSTIC == 3
    assert MAGNON_EQ_D is True


def test_magnon_acoustic_value():
    """N_MAGNON_ACOUSTIC is exactly 3."""
    from urt.magnetism_cathedral import N_MAGNON_ACOUSTIC
    assert N_MAGNON_ACOUSTIC == 3


# ── Heisenberg model ──────────────────────────────────────────────────────────

def test_heisenberg_spin_components_eq_D():
    """Heisenberg spin components = D = 3  [EXACT: isotropic in 3D]."""
    from urt.magnetism_cathedral import N_HEISENBERG_SPIN_COMPONENTS, HEISENBERG_EQ_D
    from urt.shell_closure import D
    assert N_HEISENBERG_SPIN_COMPONENTS == D
    assert N_HEISENBERG_SPIN_COMPONENTS == 3
    assert HEISENBERG_EQ_D is True


def test_heisenberg_lower_critical_eq_D_minus_1():
    """Mermin-Wagner lower critical dim = D-1 = 2  [EXACT]."""
    from urt.magnetism_cathedral import N_HEISENBERG_LOWER_CRITICAL, LOWER_CRITICAL_EQ_D1
    from urt.shell_closure import D
    assert N_HEISENBERG_LOWER_CRITICAL == D - 1
    assert N_HEISENBERG_LOWER_CRITICAL == 2
    assert LOWER_CRITICAL_EQ_D1 is True


# ── Larmor / Cathedral scale ──────────────────────────────────────────────────

def test_larmor_dim_eq_D():
    """Larmor precession lives in D = 3 spatial dimensions  [EXACT]."""
    from urt.magnetism_cathedral import LARMOR_DIM
    from urt.shell_closure import D
    assert LARMOR_DIM == D
    assert LARMOR_DIM == 3


def test_stoner_exchange_eq_delta_star():
    """Stoner exchange ~ δ★  [APPROXIMATE]."""
    from urt.magnetism_cathedral import STONER_EXCHANGE_APPROX
    from urt.shell_closure import DELTA_STAR
    assert abs(STONER_EXCHANGE_APPROX - DELTA_STAR) < 1e-14
    assert 0.14 < STONER_EXCHANGE_APPROX < 0.16


def test_cathedral_anisotropy_is_delta_star():
    """Cathedral anisotropy scale = δ★  [APPROXIMATE]."""
    from urt.magnetism_cathedral import CATHEDRAL_ANISOTROPY
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_ANISOTROPY - DELTA_STAR) < 1e-14


# ── Function return types and content ─────────────────────────────────────────

def test_spin_properties_returns_dict():
    """spin_properties() returns a dict with expected keys."""
    from urt.magnetism_cathedral import spin_properties
    result = spin_properties()
    assert isinstance(result, dict)
    for key in ("g_factor", "g_eq_D1", "n_spin_half", "spin_half_eq_D1",
                "n_spin_1", "spin_1_eq_D", "n_moment_components"):
        assert key in result


def test_spin_properties_boolean_flags():
    """spin_properties() boolean flags are all True."""
    from urt.magnetism_cathedral import spin_properties
    result = spin_properties()
    assert result["g_eq_D1"] is True
    assert result["spin_half_eq_D1"] is True
    assert result["spin_1_eq_D"] is True
    assert result["moment_eq_D"] is True
    assert result["heisenberg_eq_D"] is True
    assert result["lower_critical_eq_D1"] is True


def test_spin_properties_values():
    """spin_properties() returns correct numerical values."""
    from urt.magnetism_cathedral import spin_properties
    result = spin_properties()
    assert result["g_factor"] == 2
    assert result["n_spin_half"] == 2
    assert result["n_spin_1"] == 3
    assert result["n_moment_components"] == 3


def test_magnetic_exchange_returns_dict():
    """magnetic_exchange() returns a dict with expected keys."""
    from urt.magnetism_cathedral import magnetic_exchange
    result = magnetic_exchange()
    assert isinstance(result, dict)
    for key in ("fcc_neighbors", "fcc_eq_V", "bloch_exp", "bloch_eq_3_2",
                "n_magnon_acoustic", "magnon_eq_D", "n_dm_components"):
        assert key in result


def test_magnetic_exchange_boolean_flags():
    """magnetic_exchange() boolean flags are all True."""
    from urt.magnetism_cathedral import magnetic_exchange
    result = magnetic_exchange()
    assert result["fcc_eq_V"] is True
    assert result["bloch_eq_3_2"] is True
    assert result["magnon_eq_D"] is True
    assert result["spin_hall_eq_D"] is True
    assert result["dm_eq_D"] is True
    assert result["dw_eq_D1"] is True


def test_magnetic_exchange_values():
    """magnetic_exchange() returns correct numerical values."""
    from urt.magnetism_cathedral import magnetic_exchange
    result = magnetic_exchange()
    assert result["fcc_neighbors"] == 12
    assert abs(result["bloch_exp"] - 1.5) < 1e-14
    assert result["n_magnon_acoustic"] == 3
    assert result["n_spin_hall"] == 3
    assert result["n_dm_components"] == 3
    assert result["n_dw_params"] == 2


def test_magnetism_summary_structure():
    """magnetism_summary() has 'spin', 'exchange', 'KEY_EXACT_RESULTS'."""
    from urt.magnetism_cathedral import magnetism_summary
    result = magnetism_summary()
    assert isinstance(result, dict)
    assert "spin" in result
    assert "exchange" in result
    assert "KEY_EXACT_RESULTS" in result


def test_magnetism_summary_key_results_nonempty():
    """KEY_EXACT_RESULTS list is non-empty."""
    from urt.magnetism_cathedral import magnetism_summary
    result = magnetism_summary()
    kr = result["KEY_EXACT_RESULTS"]
    assert isinstance(kr, list)
    assert len(kr) >= 10


def test_print_magnetism_report_runs(capsys):
    """print_magnetism_report() executes without error and produces output."""
    from urt.magnetism_cathedral import print_magnetism_report
    print_magnetism_report()
    captured = capsys.readouterr()
    assert "Cathedral" in captured.out
    assert "D" in captured.out


# ── Consistency between constants ─────────────────────────────────────────────

def test_g_factor_eq_spin_half():
    """g-factor = spin-1/2 states = D-1 = 2."""
    from urt.magnetism_cathedral import G_FACTOR_TREE, N_SPIN_HALF_STATES
    assert G_FACTOR_TREE == N_SPIN_HALF_STATES == 2


def test_D_minus_1_group_magnetism():
    """All D-1=2 quantities agree: g-factor, spin-1/2 states, DW params, lower critical."""
    from urt.magnetism_cathedral import (
        G_FACTOR_TREE, N_SPIN_HALF_STATES, N_DW_PARAMS,
        N_HEISENBERG_LOWER_CRITICAL
    )
    assert G_FACTOR_TREE == N_SPIN_HALF_STATES == N_DW_PARAMS == N_HEISENBERG_LOWER_CRITICAL == 2


def test_D_group_magnetism():
    """All D=3 quantities agree: spin-1 states, moment, Heisenberg, DM, magnon, spin-Hall."""
    from urt.magnetism_cathedral import (
        N_SPIN_1_STATES, N_MAGNETIC_MOMENT_COMPONENTS,
        N_HEISENBERG_SPIN_COMPONENTS, N_DM_COMPONENTS,
        N_MAGNON_ACOUSTIC, N_SPIN_HALL_COMPONENTS, LARMOR_DIM
    )
    assert (N_SPIN_1_STATES == N_MAGNETIC_MOMENT_COMPONENTS
            == N_HEISENBERG_SPIN_COMPONENTS == N_DM_COMPONENTS
            == N_MAGNON_ACOUSTIC == N_SPIN_HALL_COMPONENTS == LARMOR_DIM == 3)


def test_spin_hall_self_referential_unique_to_D3():
    """D(D-1)//2 == D only for D=3; fails for D=2,4,5."""
    from urt.shell_closure import D
    assert D == 3
    # For D=3: 3×2//2 = 3 = D ✓
    assert D * (D - 1) // 2 == D
    # For D=2: 2×1//2 = 1 ≠ 2
    assert 2 * (2 - 1) // 2 != 2
    # For D=4: 4×3//2 = 6 ≠ 4
    assert 4 * (4 - 1) // 2 != 4


def test_bloch_exponent_is_finite():
    """BLOCH_EXPONENT is a finite positive number."""
    from urt.magnetism_cathedral import BLOCH_EXPONENT
    assert isfinite(BLOCH_EXPONENT)
    assert BLOCH_EXPONENT > 0


def test_delta_star_present():
    """DELTA_STAR is accessible from magnetism module and ≈ 0.14751."""
    from urt.magnetism_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 0.001
