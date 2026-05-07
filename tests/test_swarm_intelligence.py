"""Tests for urt.swarm_intelligence — 13-agent icosahedral swarm."""

import pytest
import numpy as np
from math import pi
from urt.swarm_intelligence import (
    formation_positions,
    coverage_solid_angle,
    agent_separation,
    command_radius,
    consensus_time,
    critical_coupling_swarm,
    delta_field_consensus,
    fault_tolerance_analysis,
    urt_swarm_update,
    swarm_sync_fraction,
    earth_coverage_constellation,
    DELTA_STAR,
    N,
    K4_AGENTS,
    A5_AGENTS,
    _ADJ,
    _LAP,
)


def test_formation_shape():
    """Formation returns (13, 3) array."""
    pos = formation_positions()
    assert pos.shape == (N, 3)


def test_central_agent_at_origin():
    """Agent 0 (coordinator) is at origin."""
    pos = formation_positions()
    assert np.allclose(pos[0], [0.0, 0.0, 0.0], atol=1e-10)


def test_shell_agents_on_unit_sphere():
    """Agents 1–12 lie on the unit sphere."""
    pos = formation_positions(scale=1.0)
    norms = np.linalg.norm(pos[1:], axis=1)
    assert np.allclose(norms, 1.0, atol=1e-10)


def test_formation_scale():
    """Scale parameter scales all positions."""
    pos5 = formation_positions(scale=5.0)
    pos1 = formation_positions(scale=1.0)
    assert np.allclose(pos5, 5.0 * pos1, atol=1e-10)


def test_coverage_full_sphere():
    """Full sphere coverage = 4π sr."""
    assert coverage_solid_angle() == pytest.approx(4 * pi, rel=1e-10)


def test_agent_separation_positive():
    """Nearest-neighbour separation is positive."""
    assert agent_separation() > 0


def test_agent_separation_scales():
    """Separation scales with formation radius."""
    d1 = agent_separation(1.0)
    d10 = agent_separation(10.0)
    assert d10 == pytest.approx(10.0 * d1, rel=1e-10)


def test_command_radius_is_delta_star():
    """K₄ command radius = δ★."""
    assert command_radius() == pytest.approx(DELTA_STAR, rel=1e-10)


def test_k4_agents_count():
    """K₄ sector has 4 agents."""
    assert len(K4_AGENTS) == 4


def test_a5_agents_count():
    """A₅ sector has 9 agents."""
    assert len(A5_AGENTS) == 9


def test_total_agents():
    """K₄ + A₅ = N = 13."""
    assert len(K4_AGENTS) + len(A5_AGENTS) == N


def test_adjacency_symmetric():
    """Adjacency matrix is symmetric."""
    assert np.allclose(_ADJ, _ADJ.T)


def test_adjacency_no_self_loops():
    """No self-loops."""
    assert np.all(np.diag(_ADJ) == 0)


def test_laplacian_row_sum_zero():
    """Each Laplacian row sums to zero."""
    row_sums = _LAP.sum(axis=1)
    assert np.allclose(row_sums, 0.0, atol=1e-10)


def test_laplacian_psd():
    """Laplacian is positive semi-definite."""
    eigs = np.linalg.eigvalsh(_LAP)
    assert np.all(eigs >= -1e-10)


def test_consensus_time_positive():
    """Consensus time is positive."""
    assert consensus_time() > 0


def test_consensus_time_fast():
    """Icosahedral topology: T_c = 1/3 ≪ 1."""
    assert consensus_time() < 1.0


def test_critical_coupling_positive():
    """K_c > 0."""
    assert critical_coupling_swarm() > 0


def test_critical_coupling_formula():
    """K_c = 2·δ★·N/λ₂."""
    lam2 = 1.0 / consensus_time()
    expected = 2 * DELTA_STAR * N / lam2
    assert critical_coupling_swarm() == pytest.approx(expected, rel=1e-10)


def test_delta_consensus_keys():
    delta_vals = np.full(N, DELTA_STAR)
    result = delta_field_consensus(delta_vals)
    for key in ["mean_delta", "delta_star", "coherence", "consensus",
                "k4_delta", "a5_delta", "sector_coherent"]:
        assert key in result


def test_delta_consensus_at_delta_star():
    """Perfectly converged swarm: mean ≈ δ★, high coherence."""
    delta_vals = np.full(N, DELTA_STAR)
    result = delta_field_consensus(delta_vals)
    assert result["mean_delta"] == pytest.approx(DELTA_STAR, rel=1e-10)
    assert result["coherence"] == pytest.approx(1.0, abs=1e-10)


def test_fault_tolerance_keys():
    ft = fault_tolerance_analysis()
    for key in ["min_degree", "max_node_failures", "always_connected", "k4_resilience"]:
        assert key in ft


def test_fault_tolerance_connected():
    """Formation always stays connected."""
    ft = fault_tolerance_analysis()
    assert ft["always_connected"] is True


def test_fault_tolerance_positive_failures():
    """Can tolerate at least 1 failure."""
    ft = fault_tolerance_analysis()
    assert ft["max_node_failures"] >= 1


def test_swarm_update_shape():
    """Update preserves array shape."""
    delta = np.full(N, DELTA_STAR)
    updated = urt_swarm_update(delta)
    assert updated.shape == (N,)


def test_swarm_update_bounded():
    """Updated values stay within [0.001, 0.5]."""
    rng = np.random.default_rng(0)
    delta = rng.uniform(0.05, 0.4, N)
    for _ in range(10):
        delta = urt_swarm_update(delta)
    assert np.all(delta >= 0.001)
    assert np.all(delta <= 0.5)


def test_swarm_converges_to_delta_star():
    """After many steps, swarm converges near δ★."""
    rng = np.random.default_rng(7)
    delta = rng.uniform(0.1, 0.25, N)
    for _ in range(2000):
        delta = urt_swarm_update(delta)
    assert abs(delta.mean() - DELTA_STAR) < 0.05


def test_swarm_sync_fraction_range():
    """Sync fraction in [0, 1]."""
    f = swarm_sync_fraction(K=1.0, n_steps=500)
    assert 0.0 <= f <= 1.0


def test_earth_coverage_keys():
    sat = earth_coverage_constellation()
    for key in ["n_satellites", "altitude_km", "coverage_pct", "revisit_time_min"]:
        assert key in sat


def test_earth_coverage_n_satellites():
    """Constellation has 13 satellites."""
    sat = earth_coverage_constellation()
    assert sat["n_satellites"] == N


def test_earth_coverage_positive_pct():
    """Coverage percentage is positive."""
    sat = earth_coverage_constellation()
    assert sat["coverage_pct"] > 0


def test_earth_coverage_altitude():
    """Altitude matches input."""
    sat = earth_coverage_constellation(altitude_km=1000.0)
    assert sat["altitude_km"] == pytest.approx(1000.0, rel=1e-10)
