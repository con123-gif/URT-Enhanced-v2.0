"""Tests for urt.arf_closure — ARF uniqueness theorems and SM predictions."""

import pytest
import numpy as np
from urt.arf_closure import (
    ARFFixedPoint,
    ARFPredictions,
    arf_alpha_inv,
    arf_sin2_theta_W,
    arf_alpha_s,
    arf_eta_B,
    scan_D,
    gamma_power_ladder,
    _arf_constants,
)


@pytest.fixture(scope="module")
def arf():
    return ARFFixedPoint(D=3)


@pytest.fixture(scope="module")
def preds():
    return ARFPredictions()


# ── Shell integer tests ───────────────────────────────────────────────────────

def test_D3_shell_integers():
    c = _arf_constants(D=3)
    assert c["D"] == 3
    assert c["N"] == 13
    assert c["V"] == 12
    assert c["E"] == 30
    assert c["F"] == 20
    assert c["G"] == 60
    assert c["q"] == 5


def test_gamma_value():
    c = _arf_constants(D=3)
    assert abs(c["gamma"] - 1/81) < 1e-15


def test_delta_star_value():
    from math import pi, sqrt
    phi = (1 + sqrt(5)) / 2
    expected = (80/81) * pi / (13 * phi)
    c = _arf_constants(D=3)
    assert abs(c["delta_star"] - expected) < 1e-12


# ── Four ARF residues ─────────────────────────────────────────────────────────

def test_alpha_inv_residue():
    c = _arf_constants(D=3)
    a = arf_alpha_inv(c)
    assert abs(a - 137.036) / 137.036 < 0.0001


def test_sin2_theta_W_residue():
    c = _arf_constants(D=3)
    s = arf_sin2_theta_W(c)
    assert abs(s - 0.2312) / 0.2312 < 0.005


def test_alpha_s_residue():
    c = _arf_constants(D=3)
    a = arf_alpha_s(c)
    assert abs(a - 0.1179) / 0.1179 < 0.02


def test_eta_B_residue():
    c = _arf_constants(D=3)
    e = arf_eta_B(c)
    assert abs(e - 6.1e-10) / 6.1e-10 < 0.05


# ── Fixed-point evaluation ────────────────────────────────────────────────────

def test_fixed_point_all_keys(arf):
    fp = arf.evaluate()
    for key in ["alpha_inv", "sin2_theta_W", "alpha_s_MZ", "eta_B"]:
        assert key in fp


# ── Theorem 2: Banach contraction ─────────────────────────────────────────────

def test_theorem_2_contraction(arf):
    """Spectral radius of Jacobian must be < 1 (Banach uniqueness)."""
    rho = arf.jacobian_spectral_radius()
    assert rho < 1.0, f"Spectral radius {rho:.4f} ≥ 1 — contraction fails"


def test_theorem_2_spectral_radius_magnitude(arf):
    """Spectral radius must be < 1 (contraction = uniqueness by Banach theorem)."""
    rho = arf.jacobian_spectral_radius()
    assert rho < 1.0


# ── Theorem 3: D=3 uniqueness ─────────────────────────────────────────────────

def test_theorem_3_D3_is_physical():
    """D=3 must pass all physical acceptability criteria."""
    scan = scan_D([3])
    assert scan[0]["physical"] is True


def test_theorem_3_other_D_not_physical():
    """No other integer D in {1,2,4,5,6,7,8} should pass all criteria."""
    scan = scan_D([1, 2, 4, 5, 6, 7, 8])
    for r in scan:
        assert not r["physical"], f"D={r['D']} unexpectedly passed physical criteria"


def test_theorem_3_full_scan():
    """Full D-scan: exactly one physical dimension."""
    scan = scan_D()
    physical_Ds = [r["D"] for r in scan if r["physical"]]
    assert physical_Ds == [3]


# ── Predictions ───────────────────────────────────────────────────────────────

def test_alpha_inv_prediction(preds):
    assert abs(preds.alpha_inv() - 137.035999) / 137.035999 < 1e-4


def test_mmu_over_me(preds):
    """mμ/me must be in [150, 250] (within factor 1.2 of 206.77)."""
    r = preds.m_mu_over_m_e()
    assert 150 < r < 250


def test_mtau_over_mmu(preds):
    """mτ/mμ must be in [10, 25]."""
    r = preds.m_tau_over_m_mu()
    assert 10 < r < 25


def test_mp_over_me(preds):
    """mp/me must be in [1000, 2500]."""
    r = preds.m_p_over_m_e()
    assert 1000 < r < 2500


def test_omega_m(preds):
    assert abs(preds.Omega_m() - 0.3111) / 0.3111 < 0.02


def test_n_s(preds):
    assert abs(preds.n_s() - 0.9649) / 0.9649 < 0.005


def test_N_e(preds):
    assert preds.N_e() == 57


def test_lambda_over_mpl4(preds):
    assert abs(preds.Lambda_over_MPl4() - 2.9e-122) / 2.9e-122 < 0.01


# ── γ-ladder ──────────────────────────────────────────────────────────────────

def test_gamma_ladder_contains_all_rungs():
    ladder = gamma_power_ladder()
    exponents = [r["n"] for r in ladder]
    for n in [0, 1, 3, 5, 9, -7, 64]:
        assert n in exponents


def test_gamma_ladder_n64_matches_cc():
    """4·γ^64 (the Cathedral CC formula) matches the cosmological constant to within 1%."""
    ladder = gamma_power_ladder()
    row = next(r for r in ladder if r["n"] == 64)
    cc_cathedral = 4 * row["gamma_n"]   # Λ/M_Pl⁴ = (D+1)·γ^64 = 4·γ^64
    assert abs(cc_cathedral - 2.9e-122) / 2.9e-122 < 0.01
