"""Tests for urt/climate_cathedral.py — Lorenz, Milankovitch, Kolmogorov."""

import pytest
from math import isclose, isfinite


def test_imports():
    from urt.climate_cathedral import (
        LORENZ_SIGMA, LORENZ_RHO, LORENZ_BETA, RHO_CRIT,
        LORENZ_DKY, LORENZ_LAMBDA1, LORENZ_PREDICTABILITY,
        KOLMOGOROV_EXPONENT, KOLMOGOROV_SCALING,
        ECCENTRICITY_KYR, OBLIQUITY_KYR, PRECESSION_KYR,
        N_MILANKOVITCH, ECS_CELSIUS, TCR_CELSIUS, CLIMATE_FEEDBACK,
        lorenz_attractor, milankovitch, turbulence_summary,
        climate_sensitivity_summary, climate_summary, print_climate_report,
        kolmogorov_scaling_exponents, milankovitch_forcing,
    )


# ── Kolmogorov ────────────────────────────────────────────────────────────────

def test_kolmogorov_exponent():
    """E(k) ∝ k^{-5/3}: -q/D = -5/3 EXACTLY"""
    from urt.climate_cathedral import KOLMOGOROV_EXPONENT
    from urt.shell_closure import q, D
    assert abs(KOLMOGOROV_EXPONENT - (-q / D)) < 1e-14
    assert abs(KOLMOGOROV_EXPONENT - (-5.0 / 3.0)) < 1e-14


def test_kolmogorov_exact():
    from urt.climate_cathedral import turbulence_summary
    r = turbulence_summary()
    assert r["kolmogorov_exact"] is True


def test_kolmogorov_scaling():
    """Reynolds scaling: η/L ~ Re^{-D/4} = Re^{-3/4}"""
    from urt.climate_cathedral import KOLMOGOROV_SCALING
    from urt.shell_closure import D
    assert abs(KOLMOGOROV_SCALING - (-D / 4.0)) < 1e-12


def test_ks_zeta3_exact_one():
    """K41: ζ_3 = 1 exactly"""
    from urt.climate_cathedral import kolmogorov_scaling_exponents
    ks = kolmogorov_scaling_exponents(6)
    assert abs(ks["K41_exponents"][3] - 1.0) < 1e-12
    # She-Leveque also: ζ_3 = 1 exactly
    assert abs(ks["SL94_exponents"][3] - 1.0) < 1e-12


# ── Lorenz ────────────────────────────────────────────────────────────────────

def test_lorenz_parameters():
    from urt.climate_cathedral import LORENZ_SIGMA, LORENZ_RHO, LORENZ_BETA
    assert LORENZ_SIGMA == 10.0
    assert LORENZ_RHO == 28.0
    assert abs(LORENZ_BETA - 8.0 / 3.0) < 1e-14


def test_rho_crit():
    from urt.climate_cathedral import RHO_CRIT
    assert 24.0 < RHO_CRIT < 26.0   # known ≈ 24.74


def test_lorenz_dky():
    """Lorenz attractor dimension ≈ 2.062"""
    from urt.climate_cathedral import LORENZ_DKY
    assert 2.0 < LORENZ_DKY < 2.15


def test_lorenz_lambda1_positive():
    from urt.climate_cathedral import LORENZ_LAMBDA1
    assert LORENZ_LAMBDA1 > 0
    assert 0.8 < LORENZ_LAMBDA1 < 1.0


def test_lorenz_predictability():
    from urt.climate_cathedral import LORENZ_PREDICTABILITY
    assert LORENZ_PREDICTABILITY > 20
    assert isfinite(LORENZ_PREDICTABILITY)


def test_lorenz_attractor_function():
    from urt.climate_cathedral import lorenz_attractor
    from urt.shell_closure import D
    r = lorenz_attractor()
    assert r["phase_space_dim"] == D
    assert r["D_KY_near_D"] is True


# ── Milankovitch ──────────────────────────────────────────────────────────────

def test_n_milankovitch_eq_q():
    from urt.climate_cathedral import N_MILANKOVITCH
    from urt.shell_closure import q
    assert N_MILANKOVITCH == q
    assert N_MILANKOVITCH == 5


def test_milankovitch_periods():
    from urt.climate_cathedral import ECCENTRICITY_KYR, OBLIQUITY_KYR, PRECESSION_KYR
    assert ECCENTRICITY_KYR == 100.0
    assert OBLIQUITY_KYR == 41.0
    assert PRECESSION_KYR == 23.0


def test_milankovitch_function():
    from urt.climate_cathedral import milankovitch
    r = milankovitch()
    assert r["n_cycles_eq_q"] is True
    assert "forcing_curve_kyr0_200" in r


def test_milankovitch_forcing_bounded():
    from urt.climate_cathedral import milankovitch_forcing
    for t in [0, 25, 50, 100, 200]:
        f = milankovitch_forcing(float(t))
        assert -1.5 < f < 1.5
        assert isfinite(f)


# ── Climate sensitivity ──────────────────────────────────────────────────────

def test_ecs_range():
    from urt.climate_cathedral import ECS_CELSIUS
    assert 2.0 < ECS_CELSIUS < 5.0   # IPCC range


def test_feedback_amplification():
    from urt.climate_cathedral import climate_sensitivity_summary
    r = climate_sensitivity_summary()
    # Feedback should amplify (~4× based on no-feedback vs ECS)
    assert r["feedback_amplification"] > 2.0


def test_feedback_ratio():
    """(D-1)/(D+1) = 2/4 = 0.5"""
    from urt.climate_cathedral import FEEDBACK_RATIO
    from urt.shell_closure import D
    assert abs(FEEDBACK_RATIO - (D - 1) / (D + 1)) < 1e-12
    assert abs(FEEDBACK_RATIO - 0.5) < 1e-12


# ── Summary ──────────────────────────────────────────────────────────────────

def test_climate_summary():
    from urt.climate_cathedral import climate_summary
    r = climate_summary()
    assert "lorenz" in r
    assert "milankovitch" in r
    assert "turbulence" in r
    assert "sensitivity" in r
    assert r["KEY_RESULT"] is not None


def test_print_climate_report(capsys):
    from urt.climate_cathedral import print_climate_report
    print_climate_report()
    out = capsys.readouterr().out
    assert "Kolmogorov" in out
    assert "-5/3" in out
    assert len(out) > 200
