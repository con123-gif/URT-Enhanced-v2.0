"""Tests for urt/fluid_cathedral.py — Navier-Stokes, turbulence, kinetic theory."""

import pytest
from math import isfinite


def test_imports():
    from urt.fluid_cathedral import (
        KOLMOGOROV_EXPONENT, KOLMOGOROV_SCALE_EXPONENT,
        DOF_MONATOMIC, DOF_DIATOMIC, DOF_LINEAR_MOLECULE, DOF_POLYATOMIC,
        CV_MONATOMIC_R, CV_DIATOMIC_R, CV_POLYATOMIC_R,
        GAMMA_MONATOMIC, GAMMA_DIATOMIC, GAMMA_MINUS_1_TIMES_D,
        STOKES_COEFF, POISEUILLE_DENOM,
        VORTICITY_CROSS_PRODUCT_D3, NS_D3_IS_MILLENNIUM,
        turbulence_cascade, degrees_of_freedom, adiabatic_exponents,
        stokes_poiseuille, fluid_summary, print_fluid_report,
    )


# ── Kolmogorov ────────────────────────────────────────────────────────────────

def test_kolmogorov_exponent_eq_minus_q_D():
    """Kolmogorov exponent = -q/D = -5/3 EXACT."""
    from urt.fluid_cathedral import KOLMOGOROV_EXPONENT
    from urt.shell_closure import q, D
    assert abs(KOLMOGOROV_EXPONENT - (-float(q) / D)) < 1e-12
    assert abs(KOLMOGOROV_EXPONENT - (-5.0 / 3.0)) < 1e-12


def test_kolmogorov_scale_exponent():
    """Kolmogorov scale ∝ Re^{-D/4} = Re^{-3/4}."""
    from urt.fluid_cathedral import KOLMOGOROV_SCALE_EXPONENT
    from urt.shell_closure import D
    assert abs(KOLMOGOROV_SCALE_EXPONENT - (-float(D) / 4.0)) < 1e-12
    assert abs(KOLMOGOROV_SCALE_EXPONENT - (-0.75)) < 1e-12


# ── Degrees of freedom ────────────────────────────────────────────────────────

def test_dof_monatomic_eq_D():
    """Monatomic DOF = D = 3."""
    from urt.fluid_cathedral import DOF_MONATOMIC
    from urt.shell_closure import D
    assert DOF_MONATOMIC == D
    assert DOF_MONATOMIC == 3


def test_dof_diatomic_eq_q():
    """Diatomic DOF = D+2 = 5 = q."""
    from urt.fluid_cathedral import DOF_DIATOMIC
    from urt.shell_closure import D, q
    assert DOF_DIATOMIC == D + 2
    assert DOF_DIATOMIC == q
    assert DOF_DIATOMIC == 5


def test_dof_linear_molecule_eq_q():
    """Linear molecule DOF = 2D-1 = 5 = q."""
    from urt.fluid_cathedral import DOF_LINEAR_MOLECULE
    from urt.shell_closure import D, q
    assert DOF_LINEAR_MOLECULE == 2 * D - 1
    assert DOF_LINEAR_MOLECULE == q


def test_dof_polyatomic_eq_V2():
    """Polyatomic DOF = 2D = 6 = V/2."""
    from urt.fluid_cathedral import DOF_POLYATOMIC
    from urt.shell_closure import D, V
    assert DOF_POLYATOMIC == 2 * D
    assert DOF_POLYATOMIC == V // 2
    assert DOF_POLYATOMIC == 6


# ── Heat capacities ───────────────────────────────────────────────────────────

def test_cv_monatomic_is_D_over_2():
    """C_v/R = D/2 = 3/2 for monatomic."""
    from urt.fluid_cathedral import CV_MONATOMIC_R
    from urt.shell_closure import D
    assert abs(CV_MONATOMIC_R - float(D) / 2.0) < 1e-12
    assert abs(CV_MONATOMIC_R - 1.5) < 1e-12


def test_cv_polyatomic_eq_D():
    """C_v/R = D = 3 for polyatomic (non-linear)."""
    from urt.fluid_cathedral import CV_POLYATOMIC_R
    from urt.shell_closure import D
    assert abs(CV_POLYATOMIC_R - D) < 1e-12
    assert abs(CV_POLYATOMIC_R - 3.0) < 1e-12


# ── Adiabatic exponents ───────────────────────────────────────────────────────

def test_gamma_monatomic_eq_q_over_D():
    """γ_monatomic = (D+2)/D = q/D = 5/3 EXACT."""
    from urt.fluid_cathedral import GAMMA_MONATOMIC
    from urt.shell_closure import D, q
    assert abs(GAMMA_MONATOMIC - float(D + 2) / D) < 1e-12
    assert abs(GAMMA_MONATOMIC - float(q) / D) < 1e-12
    assert abs(GAMMA_MONATOMIC - 5.0 / 3.0) < 1e-12


def test_gamma_diatomic():
    """γ_diatomic = 7/5 = 1.4."""
    from urt.fluid_cathedral import GAMMA_DIATOMIC
    assert abs(GAMMA_DIATOMIC - 1.4) < 1e-12


def test_gamma_minus1_times_D():
    """(γ-1) × D = 2 = D-1 EXACT."""
    from urt.fluid_cathedral import GAMMA_MINUS_1_TIMES_D
    from urt.shell_closure import D
    assert abs(GAMMA_MINUS_1_TIMES_D - (D - 1)) < 1e-12
    assert abs(GAMMA_MINUS_1_TIMES_D - 2.0) < 1e-12


# ── Stokes and Poiseuille ─────────────────────────────────────────────────────

def test_stokes_coeff_eq_V2():
    """Stokes drag coeff = V/2 = 6."""
    from urt.fluid_cathedral import STOKES_COEFF
    from urt.shell_closure import V
    assert STOKES_COEFF == V // 2
    assert STOKES_COEFF == 6


def test_poiseuille_denom_eq_D1():
    """Poiseuille denominator = D+1 = 4."""
    from urt.fluid_cathedral import POISEUILLE_DENOM
    from urt.shell_closure import D
    assert POISEUILLE_DENOM == D + 1
    assert POISEUILLE_DENOM == 4


# ── Vorticity and NS ─────────────────────────────────────────────────────────

def test_vorticity_is_D3():
    """Vorticity exists as vector only in D=3."""
    from urt.fluid_cathedral import VORTICITY_CROSS_PRODUCT_D3
    assert VORTICITY_CROSS_PRODUCT_D3 is True


def test_ns_millennium():
    from urt.fluid_cathedral import NS_D3_IS_MILLENNIUM
    assert NS_D3_IS_MILLENNIUM is True


# ── Function tests ────────────────────────────────────────────────────────────

def test_turbulence_cascade_function():
    from urt.fluid_cathedral import turbulence_cascade
    r = turbulence_cascade()
    assert r["kolmogorov_eq_minus_q_D"] is True
    assert r["scale_exp_eq_minus_D4"] is True


def test_degrees_of_freedom_function():
    from urt.fluid_cathedral import degrees_of_freedom
    r = degrees_of_freedom()
    assert r["monatomic_eq_D"] is True
    assert r["diatomic_eq_q"] is True
    assert r["linear_eq_q"] is True
    assert r["polyatomic_eq_V2"] is True
    assert r["cv_poly_eq_D"] is True


def test_adiabatic_exponents_function():
    from urt.fluid_cathedral import adiabatic_exponents
    r = adiabatic_exponents()
    assert r["gamma_eq_q_over_D"] is True
    assert r["gm1_D_eq_D_minus1"] is True


def test_stokes_poiseuille_function():
    from urt.fluid_cathedral import stokes_poiseuille
    r = stokes_poiseuille()
    assert r["stokes_eq_V2"] is True
    assert r["poiseuille_eq_D1"] is True


def test_fluid_summary():
    from urt.fluid_cathedral import fluid_summary
    r = fluid_summary()
    assert "turbulence" in r
    assert "dof" in r
    assert "adiabatic" in r
    assert len(r["key_results"]) >= 5


def test_print_fluid_report(capsys):
    from urt.fluid_cathedral import print_fluid_report
    print_fluid_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "5/3" in out
    assert len(out) > 200
