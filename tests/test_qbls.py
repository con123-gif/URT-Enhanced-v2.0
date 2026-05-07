"""Tests for urt.qbls — Quantum Bounded Ladder of Scales."""

import pytest
from urt.qbls import (
    rung_spacing,
    scale_quantity,
    rung_of,
    physical_ladder,
    simulate_meta_universes,
    DELTA_RUNG,
    LAMBDA_S,
    cosmological_constant_rungs,
)


def test_delta_rung_value():
    """δ_rung = log₁₀(ℓ_universe/ℓ_Pl) ≈ 61.32."""
    assert abs(DELTA_RUNG - 61.32) < 0.05


def test_lambda_s():
    """Λ_s = 10^δ_rung must be ≈ 2.09×10^61."""
    assert 1e61 < LAMBDA_S < 1e62


def test_scale_quantity_identity():
    """scale_quantity(Q, 0) = Q."""
    Q = 1.616e-35
    assert abs(scale_quantity(Q, 0) - Q) < 1e-50


def test_rung_of_planck():
    """Planck length relative to itself must be rung 0."""
    l_Pl = 1.616e-35
    assert abs(rung_of(l_Pl, l_Pl)) < 1e-10


def test_rung_of_universe():
    """Observable universe must be at rung ≈ 1.0 relative to Planck."""
    l_Pl = 1.616e-35
    l_uni = 8.8e26
    n = rung_of(l_uni, l_Pl)
    assert abs(n - 1.0) < 0.05


def test_physical_ladder_contains_all():
    """physical_ladder() must contain all 9 canonical scales."""
    ladder = physical_ladder()
    expected = [
        "Planck length", "Proton Compton", "Atomic radius", "Virus",
        "Human", "Earth", "Solar system", "Milky Way", "Observable universe"
    ]
    for label in expected:
        assert label in ladder


def test_physical_ladder_ordering():
    """Scale rungs must increase monotonically from Planck to universe."""
    ladder = physical_ladder()
    rungs = [ladder[k][0] for k in [
        "Planck length", "Proton Compton", "Human", "Observable universe"
    ]]
    for i in range(len(rungs) - 1):
        assert rungs[i] < rungs[i + 1]


def test_cc_gap_is_two_rungs():
    """120-order cosmological constant gap ≈ 2 rungs."""
    cc = cosmological_constant_rungs()
    assert cc["nearest_integer"] == 2


def test_simulate_meta_universes_count():
    results = simulate_meta_universes(n_universes=5)
    assert len(results) == 5


def test_meta_universe_rung_invariants():
    """α and sin²θ_W must be identical across all meta-universes."""
    results = simulate_meta_universes(n_universes=5)
    alphas = [u["alpha"] for u in results]
    sin2w = [u["sin2_theta_W"] for u in results]
    assert all(a == alphas[0] for a in alphas)
    assert all(s == sin2w[0] for s in sin2w)


def test_meta_universe_scales():
    """l_Planck must scale up by Λ_s each rung."""
    results = simulate_meta_universes(n_universes=3)
    l0 = results[0]["l_Planck_m"]
    l1 = results[1]["l_Planck_m"]
    ratio = l1 / l0
    assert abs(ratio - LAMBDA_S) / LAMBDA_S < 1e-6
