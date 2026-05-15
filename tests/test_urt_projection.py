"""Tests for the URT iteration → Cathedral observable projection."""
import math
import pytest
import numpy as np

from urt.urt_projection import (
    ETA_LAPLACIAN, ETA_STEP, DYNAMICAL_NORM, MU_PULL,
    laplacian_eigsystem, distinct_eigenvalues, laplacian_trace,
    per_mode_contraction, mixing_time,
    evolve_initial_perturbation, project_state_onto_eigenmodes,
    kernel_mode_amplitude, state_variance,
    sector_eigenvalue_split, sector_traces_sum_to_72,
    empirical_variance_decay_rate,
    delta_star_from_iteration,
    trace_equals_D_factorial_V,
    contraction_factor_at_Fiedler_matches_cathedral,
    urt_projection_audit_passes,
)
from urt.shell_closure import D, q, V, N


# ── Dynamical constants ─────────────────────────────────────────────────

def test_eta_step_equals_8pi_inverse():
    assert abs(ETA_STEP - 1.0 / (8.0 * math.pi)) < 1e-15


def test_eta_laplacian_equals_4pi_inverse():
    assert abs(ETA_LAPLACIAN - 1.0 / (4.0 * math.pi)) < 1e-15


def test_eta_step_equals_half_eta_laplacian():
    """The half-step Euler convention: η = η_L / 2."""
    assert abs(ETA_STEP - ETA_LAPLACIAN / 2.0) < 1e-15


def test_dynamical_norm_equals_2q_pi2():
    assert abs(DYNAMICAL_NORM - 2.0**q * math.pi**2) < 1e-12


# ── Laplacian spectrum ──────────────────────────────────────────────────

def test_laplacian_trace_equals_D_factorial_V():
    """tr(L_{G_13}) = D! · V = 72."""
    assert abs(laplacian_trace() - math.factorial(D) * V) < 1e-9


def test_trace_audit_passes():
    assert trace_equals_D_factorial_V()


def test_distinct_eigenvalues_cathedral():
    """All distinct eigenvalues are Cathedral integers."""
    assert distinct_eigenvalues() == [0, 3, 5, 7, 9, 13]


def test_eigsystem_shape():
    w, V_mat = laplacian_eigsystem()
    assert w.shape == (N,)
    assert V_mat.shape == (N, N)


def test_eigsystem_orthonormal():
    """Laplacian is symmetric → eigenvectors orthonormal."""
    _, V_mat = laplacian_eigsystem()
    assert np.allclose(V_mat.T @ V_mat, np.eye(N))


# ── Per-mode contraction ────────────────────────────────────────────────

def test_per_mode_contraction_kernel_is_one():
    assert per_mode_contraction(0) == 1.0


def test_per_mode_contraction_strict_for_positive_lambda():
    for lam in (3, 5, 7, 9, 13):
        c = per_mode_contraction(lam)
        assert 0 < c < 1, f"c({lam}) = {c} out of range"


def test_contraction_at_Fiedler_matches():
    assert contraction_factor_at_Fiedler_matches_cathedral()


def test_mixing_time_Fiedler():
    """τ(D=3) ≈ 105 steps (Fiedler / slowest)."""
    tau = mixing_time(D)
    assert 100 < tau < 110


def test_mixing_time_max_eigenvalue():
    """τ(N=13) ≈ 24 steps (max / fastest)."""
    tau = mixing_time(N)
    assert 23 < tau < 26


def test_ratio_slowest_to_fastest_equals_N_over_D():
    """τ(D) / τ(N) = N / D = 13/3 — transcendentals cancel."""
    ratio = mixing_time(D) / mixing_time(N)
    assert abs(ratio - N / D) < 1e-12


# ── K_4 ⊕ A_5 sector split ──────────────────────────────────────────────

def test_sector_traces_sum_to_72():
    assert sector_traces_sum_to_72()


def test_K4_trace_is_11():
    """K_4 trace = 0 + 3 + 3 + 5 = 11."""
    s = sector_eigenvalue_split()
    assert abs(s["K_4_trace"] - 11.0) < 1e-9


def test_A5_trace_is_61():
    s = sector_eigenvalue_split()
    assert abs(s["A_5_trace"] - 61.0) < 1e-9


def test_K4_block_has_4_eigenvalues():
    s = sector_eigenvalue_split()
    assert len(s["K_4_eigenvalues"]) == D + 1


def test_A5_block_has_9_eigenvalues():
    s = sector_eigenvalue_split()
    assert len(s["A_5_eigenvalues"]) == math.factorial(D) + D


# ── Iteration projection ────────────────────────────────────────────────

def test_kernel_mode_amplitude_is_state_mean():
    state = np.array([0.1, 0.2, 0.3, 0.4] + [0.15]*9)
    assert abs(kernel_mode_amplitude(state) - state.mean()) < 1e-15


def test_state_variance_nonneg():
    state = evolve_initial_perturbation(seed=0, steps=10)
    assert state_variance(state) >= 0


def test_project_state_returns_13_amplitudes():
    state = evolve_initial_perturbation(seed=0, steps=10)
    amps = project_state_onto_eigenmodes(state)
    assert amps.shape == (N,)


def test_iteration_variance_decreases():
    """Variance after 100 steps should be << initial variance."""
    rng = np.random.default_rng(7)
    x0 = rng.uniform(0.0, 0.5, size=N)
    from urt.cathedral_engine import urt_evolve
    x_final = urt_evolve(x0, steps=100)
    assert x_final.var() < x0.var() / 2.0  # at least halve


# ── Master gate ─────────────────────────────────────────────────────────

def test_urt_projection_audit_passes():
    assert urt_projection_audit_passes()
