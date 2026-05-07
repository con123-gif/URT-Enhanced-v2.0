"""Tests for urt/electromagnetism_cathedral.py — Maxwell equations and EM Cathedral."""

import pytest
from math import isfinite


def test_imports():
    from urt.electromagnetism_cathedral import (
        N_MAXWELL_EQUATIONS, N_EM_FIELD_COMPONENTS, N_EM_TENSOR_COMPONENTS,
        N_PHOTON_POLARIZATIONS, RADIATION_POWER_LAW, LORENTZ_CROSS_PRODUCT_D3,
        EM_DUALITY_DIMENSION, EM_COMPONENTS_EQ_V2,
        C_LIGHT_MS, EPSILON_0, MU_0, Z0_IMPEDANCE, ALPHA_QED, ALPHA_APPROX,
        coulomb_law, radiation_field_scaling,
        maxwell_equations, em_field_tensor, photon_properties,
        em_summary, print_em_report,
    )


# ── Maxwell equations ─────────────────────────────────────────────────────────

def test_maxwell_equations_eq_D1():
    """Maxwell equations = D+1 = 4."""
    from urt.electromagnetism_cathedral import N_MAXWELL_EQUATIONS
    from urt.shell_closure import D
    assert N_MAXWELL_EQUATIONS == D + 1
    assert N_MAXWELL_EQUATIONS == 4


def test_em_field_components_eq_2D():
    """EM field components (E+B) = 2D = 6 = V/2."""
    from urt.electromagnetism_cathedral import N_EM_FIELD_COMPONENTS
    from urt.shell_closure import D, V
    assert N_EM_FIELD_COMPONENTS == 2 * D
    assert N_EM_FIELD_COMPONENTS == V // 2
    assert N_EM_FIELD_COMPONENTS == 6


def test_em_tensor_components_eq_V2():
    """Antisymmetric EM tensor F_μν has V/2 = 6 independent components."""
    from urt.electromagnetism_cathedral import N_EM_TENSOR_COMPONENTS
    from urt.shell_closure import V
    assert N_EM_TENSOR_COMPONENTS == V // 2
    assert N_EM_TENSOR_COMPONENTS == 6


def test_photon_polarizations_eq_D1():
    """Transverse photon polarizations = D-1 = 2."""
    from urt.electromagnetism_cathedral import N_PHOTON_POLARIZATIONS
    from urt.shell_closure import D
    assert N_PHOTON_POLARIZATIONS == D - 1
    assert N_PHOTON_POLARIZATIONS == 2


def test_radiation_power_law_eq_D1():
    """Inverse-square law: power = D-1 = 2."""
    from urt.electromagnetism_cathedral import RADIATION_POWER_LAW
    from urt.shell_closure import D
    assert RADIATION_POWER_LAW == D - 1
    assert RADIATION_POWER_LAW == 2


def test_em_duality_dimension_eq_D1():
    """EM self-duality in D+1 = 4 dimensions."""
    from urt.electromagnetism_cathedral import EM_DUALITY_DIMENSION
    from urt.shell_closure import D
    assert EM_DUALITY_DIMENSION == D + 1
    assert EM_DUALITY_DIMENSION == 4


def test_em_components_eq_V2_flag():
    """EM_COMPONENTS_EQ_V2 flag is True."""
    from urt.electromagnetism_cathedral import EM_COMPONENTS_EQ_V2
    assert EM_COMPONENTS_EQ_V2 is True


# ── Physical constants ────────────────────────────────────────────────────────

def test_speed_of_light():
    """c = 299,792,458 m/s exactly."""
    from urt.electromagnetism_cathedral import C_LIGHT_MS
    assert C_LIGHT_MS == 299_792_458


def test_impedance_of_free_space():
    """Z0 ≈ 376.73 Ω."""
    from urt.electromagnetism_cathedral import Z0_IMPEDANCE
    assert 370 < Z0_IMPEDANCE < 380


def test_fine_structure_constant():
    """α ≈ 1/137."""
    from urt.electromagnetism_cathedral import ALPHA_QED
    assert abs(ALPHA_QED - 1.0 / 137.035999) < 1e-8


# ── Coulomb law ───────────────────────────────────────────────────────────────

def test_coulomb_inverse_square():
    """Coulomb force scales as 1/r²."""
    from urt.electromagnetism_cathedral import coulomb_law
    f1 = coulomb_law(1.0)
    f2 = coulomb_law(2.0)
    assert abs(f1 / f2 - 4.0) < 1e-10


def test_radiation_field_scaling():
    """Radiation field scales as 1/r^(D-1) = 1/r²."""
    from urt.electromagnetism_cathedral import radiation_field_scaling
    r1 = radiation_field_scaling(1.0)
    r2 = radiation_field_scaling(2.0)
    assert r1 > r2 > 0


# ── Function tests ────────────────────────────────────────────────────────────

def test_maxwell_equations_function():
    from urt.electromagnetism_cathedral import maxwell_equations
    r = maxwell_equations()
    assert r["n_equations_eq_D1"] is True
    assert r["n_equations"] == 4


def test_em_field_tensor_function():
    from urt.electromagnetism_cathedral import em_field_tensor
    r = em_field_tensor()
    assert r["eq_V2"] is True or r["total_eq_V2"] is True
    assert r["n_independent"] == 6


def test_photon_properties_function():
    from urt.electromagnetism_cathedral import photon_properties
    r = photon_properties()
    assert r["pol_eq_D_minus_1"] is True
    assert r["polarizations"] == 2


def test_em_summary():
    from urt.electromagnetism_cathedral import em_summary
    r = em_summary()
    assert "maxwell" in r
    assert "tensor" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 3


def test_print_em_report(capsys):
    from urt.electromagnetism_cathedral import print_em_report
    print_em_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "4" in out
    assert len(out) > 100
