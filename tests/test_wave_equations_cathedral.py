"""Tests for urt/wave_equations_cathedral.py — Huygens, Klein-Gordon, Maxwell."""

import pytest
from math import pi, isclose, isfinite


def test_imports():
    from urt.wave_equations_cathedral import (
        D_HUYGENS_HOLDS, GREENS_POWER, UNIT_SPHERE_AREA, GREENS_COEFF,
        N_VECTOR_COMPONENTS, N_ANTISYM_TENSOR_2, CROSS_PRODUCT_UNIQUE,
        M_CATHEDRAL, OMEGA_0_REST, COMPTON_WAVELENGTH, CORRELATION_LENGTH,
        dispersion, group_velocity, phase_velocity,
        greens_function_D3, greens_function_D3_approx,
        spherical_harmonic_count, cathedral_propagator,
        cross_product_uniqueness, solid_angle_and_information,
        wave_summary, print_wave_report,
    )


# ── Huygens ──────────────────────────────────────────────────────────────────

def test_huygens_holds_odd_D():
    """Huygens' principle holds iff D is odd; D=3 is odd."""
    from urt.wave_equations_cathedral import D_HUYGENS_HOLDS
    assert D_HUYGENS_HOLDS is True


def test_greens_power():
    """G ~ r^{2-D} = r^{-1} for D=3."""
    from urt.wave_equations_cathedral import GREENS_POWER
    from urt.shell_closure import D
    assert GREENS_POWER == 2 - D
    assert GREENS_POWER == -1


def test_unit_sphere_area():
    """S_2 = 4π."""
    from urt.wave_equations_cathedral import UNIT_SPHERE_AREA
    assert abs(UNIT_SPHERE_AREA - 4 * pi) < 1e-12


def test_greens_coeff():
    """Green's coefficient = 1/(4π)."""
    from urt.wave_equations_cathedral import GREENS_COEFF
    assert abs(GREENS_COEFF - 1.0 / (4 * pi)) < 1e-12


# ── Cross product ─────────────────────────────────────────────────────────────

def test_cross_product_unique():
    """D(D-1)/2 = D for D=3 → cross product unique."""
    from urt.wave_equations_cathedral import CROSS_PRODUCT_UNIQUE, N_VECTOR_COMPONENTS, N_ANTISYM_TENSOR_2
    from urt.shell_closure import D
    assert N_VECTOR_COMPONENTS == D
    assert N_ANTISYM_TENSOR_2 == D * (D - 1) // 2
    assert N_ANTISYM_TENSOR_2 == D
    assert CROSS_PRODUCT_UNIQUE is True


def test_cross_product_uniqueness_function():
    from urt.wave_equations_cathedral import cross_product_uniqueness
    cp = cross_product_uniqueness()
    assert cp["cross_product_exists"] is True
    assert cp["D"] == 3
    assert cp["vector_components"] == cp["antisym_2tensor_components"]


# ── Klein-Gordon ─────────────────────────────────────────────────────────────

def test_mass_cathedral():
    """Cathedral mass = δ★."""
    from urt.wave_equations_cathedral import M_CATHEDRAL
    from urt.shell_closure import DELTA_STAR
    assert abs(M_CATHEDRAL - DELTA_STAR) < 1e-14


def test_compton_wavelength():
    """Compton wavelength = 1/δ★ = R_AdS."""
    from urt.wave_equations_cathedral import COMPTON_WAVELENGTH, CORRELATION_LENGTH
    from urt.shell_closure import DELTA_STAR
    assert abs(COMPTON_WAVELENGTH - 1.0 / DELTA_STAR) < 1e-12
    assert abs(CORRELATION_LENGTH - COMPTON_WAVELENGTH) < 1e-14


def test_dispersion_at_rest():
    """At k=0: ω = δ★."""
    from urt.wave_equations_cathedral import dispersion, OMEGA_0_REST
    from urt.shell_closure import DELTA_STAR
    assert abs(dispersion(0.0) - DELTA_STAR) < 1e-12
    assert abs(OMEGA_0_REST - DELTA_STAR) < 1e-14


def test_dispersion_k_positive():
    """ω(k) > δ★ for k > 0."""
    from urt.wave_equations_cathedral import dispersion
    from urt.shell_closure import DELTA_STAR
    for k in [0.1, 1.0, 5.0, 10.0]:
        assert dispersion(k) > DELTA_STAR
        assert isfinite(dispersion(k))


def test_dispersion_relation():
    """ω² = k² + δ★²."""
    from urt.wave_equations_cathedral import dispersion
    from urt.shell_closure import DELTA_STAR
    import math
    for k in [0.5, 1.0, 2.0]:
        omega = dispersion(k)
        assert abs(omega**2 - k**2 - DELTA_STAR**2) < 1e-12


def test_group_velocity_lt_c():
    """v_g = k/ω < 1 (sub-luminal)."""
    from urt.wave_equations_cathedral import group_velocity
    for k in [0.1, 1.0, 5.0]:
        vg = group_velocity(k)
        assert 0 < vg < 1.0


def test_phase_velocity_gt_c():
    """v_p = ω/k > 1 (super-luminal phase velocity)."""
    from urt.wave_equations_cathedral import phase_velocity
    for k in [0.1, 1.0, 5.0]:
        vp = phase_velocity(k)
        assert vp > 1.0


# ── Green's functions ─────────────────────────────────────────────────────────

def test_greens_on_lightcone():
    """G(r, t=r) = 1/(4πr) on the light cone."""
    from urt.wave_equations_cathedral import greens_function_D3
    r = 1.0
    g = greens_function_D3(r, r)
    assert abs(g - 1.0 / (4 * pi * r)) < 1e-10


def test_greens_off_lightcone():
    """G(r, t≠r) = 0 off the light cone."""
    from urt.wave_equations_cathedral import greens_function_D3
    assert greens_function_D3(1.0, 2.0) == 0.0
    assert greens_function_D3(1.0, 0.5) == 0.0


def test_greens_approx_normalized():
    """Gaussian-smeared Green's function is positive and finite."""
    from urt.wave_equations_cathedral import greens_function_D3_approx
    for r in [0.5, 1.0, 2.0]:
        g = greens_function_D3_approx(r, r, epsilon=0.05)
        assert g > 0
        assert isfinite(g)


# ── Spherical harmonics ───────────────────────────────────────────────────────

def test_spherical_harmonic_total_N2():
    """Σ_{l=0}^{N-1}(2l+1) = N² = 169."""
    from urt.wave_equations_cathedral import spherical_harmonic_count
    from urt.shell_closure import N
    sp = spherical_harmonic_count(N - 1)
    assert sp["total_modes"] == N * N
    assert sp["total_eq_N2"] is True
    assert sp["N_sq"] == 169


def test_spherical_harmonic_per_l():
    """2l+1 modes per l."""
    from urt.wave_equations_cathedral import spherical_harmonic_count
    sp = spherical_harmonic_count(5)
    for l in range(6):
        assert sp["modes_per_l"][l] == 2 * l + 1


# ── Cathedral propagator ──────────────────────────────────────────────────────

def test_propagator_type():
    """Feynman propagator returns complex."""
    from urt.wave_equations_cathedral import cathedral_propagator
    p = cathedral_propagator(1.0)
    assert isinstance(p, complex)


def test_propagator_far_from_pole():
    """Away from the pole the propagator is small."""
    from urt.wave_equations_cathedral import cathedral_propagator
    from urt.shell_closure import DELTA_STAR
    p = cathedral_propagator(100 * DELTA_STAR)
    assert abs(p) < 1.0


# ── Solid angle ───────────────────────────────────────────────────────────────

def test_solid_angle_4pi():
    """Ω_3 = 4π steradians."""
    from urt.wave_equations_cathedral import solid_angle_and_information
    sa = solid_angle_and_information()
    assert abs(sa["solid_angle"] - 4 * pi) < 1e-12


def test_greens_coeff_from_solid_angle():
    """Green's coefficient = 1/Ω_3 = 1/(4π)."""
    from urt.wave_equations_cathedral import solid_angle_and_information
    sa = solid_angle_and_information()
    assert abs(sa["greens_coeff"] - 1.0 / (4 * pi)) < 1e-12


# ── Summary ───────────────────────────────────────────────────────────────────

def test_wave_summary():
    from urt.wave_equations_cathedral import wave_summary
    r = wave_summary()
    assert r["huygens"]["holds_odd_only"] is True
    assert r["cross_product"]["cross_product_exists"] is True
    assert r["spherical_harmonics"]["total_eq_N2"] is True
    assert r["D"] == 3


def test_print_wave_report(capsys):
    from urt.wave_equations_cathedral import print_wave_report
    print_wave_report()
    out = capsys.readouterr().out
    assert "Huygens" in out
    assert "D=3" in out
    assert len(out) > 200
