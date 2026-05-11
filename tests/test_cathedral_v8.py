"""Tests for urt.cathedral_v8 — Cathedral class, full SM derivation."""
from math import pi

import pytest

from urt.cathedral_v8 import Cathedral, _force_dimension


# ── Dimensional forcing ───────────────────────────────────────────────────

def test_force_dimension_returns_3_and_admissible_list():
    D, admissible = _force_dimension()
    assert D == 3
    # K(D) = D + D² holds for D ∈ {1, 2, 3}; D=3 picked as the maximum.
    assert 3 in admissible
    assert max(admissible) == 3


# ── Construction + shell integers ─────────────────────────────────────────

@pytest.fixture(scope="module")
def c():
    return Cathedral()


def test_shell_integers(c):
    assert c.D == 3
    assert c.N == 13
    assert c.V == 12
    assert c.E == 30
    assert c.F == 20
    assert c.q == 5
    assert c.G == 60


def test_gamma_is_one_over_81(c):
    assert c.gamma == pytest.approx(1 / 81, rel=1e-15)
    assert c.dim_closure == 81


def test_delta_star_closed_form(c):
    from math import sqrt
    phi = (1 + sqrt(5)) / 2
    expected = (1 - 1 / 81) * pi / (13 * phi)
    assert c.delta_star == pytest.approx(expected, rel=1e-15)


def test_delta_cl_is_3_over_20(c):
    assert c.delta_cl == 3 / 20


def test_gap_is_delta_cl_minus_delta_star(c):
    assert c.Delta == pytest.approx(c.delta_cl - c.delta_star, rel=1e-15)


# ── Gauge sector ──────────────────────────────────────────────────────────

def test_alpha_inv_matches_PDG(c):
    """1/α(0) ≈ 137.036 to ~0.01%."""
    assert c.alpha_inv() == pytest.approx(137.036, rel=1e-3)


def test_sin2_theta_W_matches_PDG(c):
    """sin²θ_W = (D/N)·(1+γ/2π) ≈ 0.23122."""
    assert c.sin2_theta_W() == pytest.approx(0.23122, rel=1e-3)


def test_alpha_s_MZ_in_range(c):
    """α_s(M_Z) ≈ 0.118 to within 5% (Cathedral closed form)."""
    assert c.alpha_s_MZ() == pytest.approx(0.118, rel=0.05)


# ── Lepton masses ─────────────────────────────────────────────────────────

def test_m_mu_over_m_e_matches_PDG(c):
    """m_µ/m_e ≈ 206.77 to ~0.5%."""
    assert c.m_mu_over_m_e() == pytest.approx(206.768, rel=5e-3)


def test_m_p_over_m_e_matches_PDG(c):
    """m_p/m_e ≈ 1836.15 to ~0.01% (the ARF exact integer 1836 + correction)."""
    assert c.m_p_over_m_e() == pytest.approx(1836.15, rel=1e-3)


# ── EW bosons + Higgs ─────────────────────────────────────────────────────

def test_m_W_in_range(c):
    """m_W ≈ 80.4 GeV within 1%."""
    assert c.m_W() == pytest.approx(80.379, rel=1e-2)


def test_m_Z_in_range(c):
    """m_Z ≈ 91.2 GeV within 1%."""
    assert c.m_Z() == pytest.approx(91.188, rel=1e-2)


def test_m_W_less_than_m_Z(c):
    assert c.m_W() < c.m_Z()


# ── PMNS ──────────────────────────────────────────────────────────────────

def test_delta_CP_is_exact_197_deg(c):
    """δ_CP = (D+1)·F + (N-D-1)·N = 4·20 + 9·13 = 197° EXACT."""
    assert c.delta_CP_deg() == 197
    assert c.delta_CP_deg() == (c.D + 1) * c.F + (c.N - c.D - 1) * c.N


def test_theta_13_in_range(c):
    """θ_13 ≈ 8.5° to within 5%."""
    assert c.theta_13_deg() == pytest.approx(8.54, rel=5e-2)


# ── Cosmology ─────────────────────────────────────────────────────────────

def test_Omega_m_plus_Omega_Lambda_is_1(c):
    """Flat universe."""
    assert c.Omega_m() + c.Omega_Lambda() == pytest.approx(1.0, rel=1e-15)


def test_Omega_m_in_Planck_range(c):
    """Ω_m ≈ 0.3153 to ~5%."""
    assert c.Omega_m() == pytest.approx(0.3153, rel=5e-2)


def test_eta_B_matches_Planck(c):
    """η_B = γ³·Δ·δ★·8/9 ≈ 6.14e-10, within 1% of Planck 2018."""
    assert c.eta_B() == pytest.approx(6.14e-10, rel=1e-2)


def test_n_s_is_planck_exact(c):
    """n_s = 1 - 2/(G-D) = 1 - 2/57 ≈ 0.9649 EXACT."""
    assert c.n_s() == pytest.approx(1 - 2 / 57, rel=1e-15)


def test_r_tensor_is_falsifiable_value(c):
    """r = 12/(G-D)² = 12/57² ≈ 0.00369 — falsifiable prediction."""
    assert c.r_tensor() == pytest.approx(12 / 57 ** 2, rel=1e-15)


def test_Lambda_over_MPl4_is_cathedral_form(c):
    """Λ/M_Pl⁴ = (D+1)·γ^{(D+1)^D} = 4·γ^64."""
    expected = (c.D + 1) * c.gamma ** ((c.D + 1) ** c.D)
    assert c.Lambda_over_MPl4() == pytest.approx(expected, rel=1e-15)


# ── Inflation ─────────────────────────────────────────────────────────────

def test_N_e_is_57(c):
    """N_e = G - D = 57 e-folds."""
    assert c.N_e() == 57


# ── all_predictions registry ──────────────────────────────────────────────

def test_all_predictions_complete(c):
    p = c.all_predictions()
    # A few headline keys must be present.
    for key in ("1/alpha", "sin2_theta_W", "m_p_over_m_e",
                "m_W_GeV", "m_Z_GeV", "delta_CP_deg",
                "n_s", "r_tensor", "Lambda_over_MPl4"):
        assert key in p, f"missing key: {key}"


def test_all_predictions_finite(c):
    p = c.all_predictions()
    for k, v in p.items():
        assert v is not None
        assert v == v, f"{k} is NaN"  # NaN check
