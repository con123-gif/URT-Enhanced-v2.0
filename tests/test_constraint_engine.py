"""Tests for urt.constraint_engine — multi-scale Newton + frozen ladder."""
import numpy as np
import pytest
from urt.constraint_engine import (
    ConstraintState,
    cathedral_targets,
    newton_solve,
    mass_ladder_consistency,
    constraint_engine_audit_passes,
    DELTA_STAR,
    GAMMA,
    TOL_UV, TOL_MID, TOL_IR,
    B_LADDER, A_LADDER, C_MASS_LADDER, R_MASS_LADDER,
)


def test_tolerances_descend():
    """UV > MID > IR — looser tolerances at higher energies."""
    assert TOL_UV > TOL_MID > TOL_IR > 0


def test_tolerances_are_cathedral_powers():
    assert TOL_UV == pytest.approx(GAMMA ** 2)
    assert TOL_IR == pytest.approx(GAMMA ** 4)


def test_cathedral_targets_three_scales():
    for scale in ("UV", "MID", "IR"):
        t = cathedral_targets(scale)
        assert set(t.keys()) == {"delta", "k_norm", "k_prod", "D_KY"}


def test_unknown_scale_raises():
    with pytest.raises(ValueError):
        cathedral_targets("FOO")


def test_newton_converges_at_each_scale():
    seed = ConstraintState(
        delta=DELTA_STAR * 0.95,
        k_norm=DELTA_STAR ** 2 * 0.9,
        k_prod=GAMMA * 0.8,
        D_KY=1.0,
    )
    for scale in ("UV", "MID", "IR"):
        final, iters, rn = newton_solve(seed, scale)
        assert iters < 50, (scale, iters)
        assert rn < {"UV": TOL_UV, "MID": TOL_MID, "IR": TOL_IR}[scale]


def test_mass_ladder_C_mass_matches_arf():
    """C_mass from ladder agrees with ARF closed form to 10 ppm."""
    m = mass_ladder_consistency()
    assert m["C_mass_residual"] < 1e-5


def test_mass_ladder_constants_are_in_range():
    m = mass_ladder_consistency()
    assert m["B"] == pytest.approx(-11/6)
    assert 8.0 < m["A"] < 10.0
    assert 4.0 < m["C_mass_ladder"] < 5.0
    assert -3.0 < m["R_mass_pole"] < -2.0


def test_audit_passes():
    assert constraint_engine_audit_passes()
