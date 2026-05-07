"""Tests for urt.cathedral_v8 — full Standard Model derivation."""

import pytest
from urt.cathedral_v8 import Cathedral


@pytest.fixture(scope="module")
def c():
    return Cathedral()


def test_dimension_forced(c):
    """K(D)=D+D² must force D=3."""
    assert c.D == 3


def test_shell_integers(c):
    """Icosahedral integers must have canonical values."""
    assert c.N == 13
    assert c.V == 12
    assert c.E == 30
    assert c.F == 20
    assert c.G == 60


def test_gamma(c):
    """γ = 1/D⁴ = 1/81."""
    assert abs(c.gamma - 1 / 81) < 1e-15


def test_alpha_inv(c):
    """1/α within 0.001% of 137.035999."""
    assert abs(c.alpha_inv() - 137.035999) / 137.035999 < 1e-5


def test_sin2_theta_W(c):
    """sin²θ_W within 0.5% of 0.23122."""
    assert abs(c.sin2_theta_W() - 0.23122) / 0.23122 < 0.005


def test_alpha_s(c):
    """α_s(M_Z) within 1% of 0.1180."""
    assert abs(c.alpha_s_MZ() - 0.1180) / 0.1180 < 0.01


def test_mp_over_me(c):
    """mp/me within 0.01% of 1836.15267."""
    assert abs(c.m_p_over_m_e() - 1836.15267) / 1836.15267 < 1e-4


def test_cosmological_constant(c):
    """Λ/M_Pl⁴ = (D+1)·γ^64 within 1% of 2.9×10⁻¹²²."""
    lam = c.Lambda_over_MPl4()
    obs = 2.9e-122
    assert abs(lam - obs) / obs < 0.01


def test_omega_m(c):
    """Ω_m within 2% of 0.3111."""
    assert abs(c.Omega_m() - 0.3111) / 0.3111 < 0.02


def test_n_s(c):
    """Spectral index n_s = 1 − 2/N_e within 0.5% of 0.9649."""
    assert abs(c.n_s() - 0.9649) / 0.9649 < 0.005


def test_n_e(c):
    """N_e = G − D = 57."""
    assert c.N_e() == 57


def test_higgs_mass(c):
    """m_H within 2% of 125.25 GeV."""
    assert abs(c.m_H() - 125.25) / 125.25 < 0.02


def test_top_quark(c):
    """m_t within 2% of 172.76 GeV."""
    assert abs(c.m_t() - 172.76) / 172.76 < 0.02


def test_w_mass(c):
    """m_W within 1% of 80.377 GeV."""
    assert abs(c.m_W() - 80.377) / 80.377 < 0.01


def test_z_mass(c):
    """m_Z within 0.5% of 91.188 GeV."""
    assert abs(c.m_Z() - 91.188) / 91.188 < 0.005


def test_eta_B(c):
    """Baryon asymmetry η_B within 5% of 6.1×10⁻¹⁰."""
    assert abs(c.eta_B() - 6.1e-10) / 6.1e-10 < 0.05
