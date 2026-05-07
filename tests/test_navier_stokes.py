"""Tests for urt.navier_stokes — 4⊕9 cascade and BKM regularity."""

import numpy as np
import pytest
from urt.navier_stokes import (
    cascade_downward_fraction,
    cascade_upward_fraction,
    net_cascade_flux,
    kolmogorov_constant,
    bkm_bound,
    regularity_check,
    kolmogorov_spectrum,
    intermittency_exponents,
    cathedral_reynolds_number,
    vorticity_bound,
    lyapunov_ns,
)
from urt import DELTA_STAR


def test_cascade_fractions_positive():
    assert cascade_downward_fraction() > 0
    assert cascade_upward_fraction() > 0


def test_cascade_downward_dominates():
    """Downward flux must exceed upward flux (forward cascade)."""
    assert cascade_downward_fraction() > cascade_upward_fraction()


def test_cascade_fractions_approximate_values():
    """P_down ≈ 72.6%, P_up ≈ 34.2% from (9/13)·(1+4γ) and (4/13)·(1+9γ)."""
    assert abs(cascade_downward_fraction() - 0.726) < 0.01
    assert abs(cascade_upward_fraction() - 0.342) < 0.01


def test_net_flux_positive():
    assert net_cascade_flux() > 0


def test_kolmogorov_constant():
    """C_K must be positive (forward cascade well-defined)."""
    C_K = kolmogorov_constant()
    assert C_K > 0
    assert C_K < 5.0   # reasonable upper bound


def test_bkm_bound_finite():
    """BKM integral bound must be finite for any T."""
    for T in [1.0, 10.0, 100.0, 1e6]:
        bound = bkm_bound(C0=1.0, t_max=T)
        assert np.isfinite(bound)
        assert bound > 0


def test_regularity_holds():
    result = regularity_check(C0=1.0, T=100.0)
    assert result["regularity_holds"]
    assert result["is_finite"]


def test_kolmogorov_spectrum_scaling():
    """E(k) ∝ k^{-5/3}: doubling k reduces E by 2^{5/3}."""
    k = np.array([1.0, 2.0])
    E = kolmogorov_spectrum(k)
    ratio = E[0] / E[1]
    expected = 2 ** (5 / 3)
    assert abs(ratio - expected) / expected < 1e-10


def test_intermittency_exponents_kolmogorov():
    """Without Cathedral correction, ζ_n → n/3."""
    zeta = intermittency_exponents(6)
    for n, z in enumerate(zeta, 1):
        # Cathedral correction ζ_n = n/3 − (n/9)·δ★² grows with n; tolerance 0.02
        assert abs(z - n / 3) < 0.02


def test_intermittency_smaller_than_kolmogorov():
    """Cathedral correction makes ζ_n ≤ n/3 (intermittency correction is negative)."""
    zeta = intermittency_exponents(6)
    for n, z in enumerate(zeta, 1):
        assert z <= n / 3   # correction is 0 at n=0, grows with n


def test_vorticity_bound_decays():
    """‖ω(t)‖ must decay monotonically."""
    t = np.linspace(0, 10, 100)
    omega = [vorticity_bound(ti) for ti in t]
    for i in range(len(omega) - 1):
        assert omega[i] >= omega[i + 1]


def test_lyapunov_minimum_at_delta_star():
    """V(δ★) = 1 (minimum of the Lyapunov function)."""
    V_star = lyapunov_ns(DELTA_STAR)
    assert abs(V_star - 1.0) < 1e-10


def test_lyapunov_increases_away_from_delta_star():
    """V must be > 1 away from δ★."""
    for delta in [0.10, 0.12, 0.16, 0.20]:
        assert lyapunov_ns(delta) > 1.0


def test_reynolds_number():
    result = cathedral_reynolds_number(L=1.0, u_rms=1.0, nu=1e-4)
    assert "Re" in result
    assert result["Re"] == pytest.approx(1e4)
    assert result["turbulent"] is True
