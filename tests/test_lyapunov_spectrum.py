"""Tests for urt.lyapunov_spectrum — Benettin+QR full Lyapunov spectrum."""
import numpy as np
import pytest
from urt.lyapunov_spectrum import (
    benettin_qr_spectrum,
    kaplan_yorke_dimension,
    lorenz_rhs, lorenz_jac,
    rossler_rhs, rossler_jac,
    lyapunov_audit_passes,
)


def test_kaplan_yorke_trivial_cases():
    """All-zero spectrum, all-positive spectrum, all-negative spectrum."""
    assert kaplan_yorke_dimension(np.array([0.0, 0.0, 0.0])) == 3.0
    assert kaplan_yorke_dimension(np.array([1.0, 1.0])) == 2.0
    assert kaplan_yorke_dimension(np.array([-1.0, -2.0])) == 0.0


def test_lorenz_spectrum_size():
    spec = benettin_qr_spectrum(
        lorenz_rhs(), lorenz_jac(),
        x0=np.array([1.0, 1.0, 1.0]),
        T=40.0, dt=0.01, transient=10.0,
    )
    assert spec.shape == (3,)


def test_lorenz_largest_lyapunov_positive():
    spec = benettin_qr_spectrum(
        lorenz_rhs(), lorenz_jac(),
        x0=np.array([1.0, 1.0, 1.0]),
        T=40.0, dt=0.01, transient=10.0,
    )
    assert spec[0] > 0


def test_lorenz_sum_lyapunov_matches_divergence():
    """Σλ = −(σ + β + 1) = −13.667 for canonical Lorenz."""
    sigma, beta = 10.0, 8.0 / 3.0
    spec = benettin_qr_spectrum(
        lorenz_rhs(), lorenz_jac(),
        x0=np.array([1.0, 1.0, 1.0]),
        T=80.0, dt=0.01, transient=10.0,
    )
    expected = -(sigma + beta + 1)
    assert abs(spec.sum() - expected) < 0.5


def test_lorenz_kaplan_yorke_near_published():
    """D_KY ≈ 2.063 for canonical Lorenz."""
    spec = benettin_qr_spectrum(
        lorenz_rhs(), lorenz_jac(),
        x0=np.array([1.0, 1.0, 1.0]),
        T=80.0, dt=0.01, transient=10.0,
    )
    D_KY = kaplan_yorke_dimension(spec)
    assert 1.95 < D_KY < 2.20


def test_audit_passes():
    assert lyapunov_audit_passes()
