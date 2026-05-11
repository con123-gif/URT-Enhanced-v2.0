"""Tests for urt.plasma_pde — Hasegawa-Wakatani solver with URT controller."""
import numpy as np
import pytest
from urt.plasma_pde import (
    KAPPA_HW, ALPHA_HW, NU_HW,
    compute_delta_HW,
    hw_evolve,
    plasma_pde_audit_passes,
    DELTA_STAR,
)


def test_constants_positive():
    assert KAPPA_HW > 0
    assert ALPHA_HW > 0
    assert NU_HW > 0


def test_compute_delta_HW_on_zero_field_returns_zero():
    """δ_HW = 1 - 0/0 → returns 0 by the safe-divide branch."""
    n   = np.zeros((8, 8))
    phi = np.zeros((8, 8))
    assert compute_delta_HW(phi, n) == 0.0


def test_evolve_returns_expected_keys():
    out = hw_evolve(Nx=16, Ny=16, n_steps=20, dt=0.001, seed=0)
    assert set(out.keys()) == {"phi_final", "n_final",
                                "delta_history", "energy_history"}


def test_evolve_finite_on_short_run():
    out = hw_evolve(Nx=16, Ny=16, n_steps=20, dt=0.001, seed=0)
    assert np.all(np.isfinite(out["phi_final"]))
    assert np.all(np.isfinite(out["n_final"]))
    assert np.all(np.isfinite(out["delta_history"]))
    assert np.all(np.isfinite(out["energy_history"]))


def test_history_correct_length():
    out = hw_evolve(Nx=8, Ny=8, n_steps=30, dt=0.001, seed=0)
    assert out["delta_history"].size == 30
    assert out["energy_history"].size == 30


def test_controller_changes_outcome():
    out_c = hw_evolve(Nx=16, Ny=16, n_steps=50, dt=0.001,
                      urt_control=True, seed=0)
    out_u = hw_evolve(Nx=16, Ny=16, n_steps=50, dt=0.001,
                      urt_control=False, seed=0)
    assert abs(out_c["delta_history"][-1] - out_u["delta_history"][-1]) > 0


def test_audit_passes():
    assert plasma_pde_audit_passes()
