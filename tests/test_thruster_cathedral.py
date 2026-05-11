"""
Tests for urt.thruster_cathedral — documented failed candidate.

Pins the failure state so the framework cannot silently regress to
claiming the upload's thrust formula matches the patent.
"""
import math
import pytest
from urt.thruster_cathedral import (
    E_C_THRUSTER,
    ALPHA_BETA,
    KAPPA_THRUST,
    PREFACTOR_PA,
    cathedral_thrust_upload,
    ExodusEED,
    upload_claim_report,
    thruster_claim_holds,
    PATENT_MEASUREMENTS_MN,
)


def test_E_c_closed_form():
    """E_c = π·φ·e × 10⁶ V/m."""
    from math import pi, sqrt, e
    phi = (1 + sqrt(5)) / 2
    assert E_C_THRUSTER == pytest.approx(pi * phi * e * 1e6, rel=1e-14)


def test_alpha_beta_closed_form():
    from math import pi, sqrt, e
    phi = (1 + sqrt(5)) / 2
    assert ALPHA_BETA == pytest.approx(pi / (phi * e ** 2), rel=1e-14)


def test_kappa_thrust_sign():
    """δ★ < δ_cl ⇒ κ < 0."""
    assert KAPPA_THRUST < 0


def test_prefactor_about_1690_Pa():
    """ε₀·E_c² ≈ 1690 Pa."""
    assert 1600 < PREFACTOR_PA < 1800


def test_patent_measurements_dict():
    assert PATENT_MEASUREMENTS_MN == {8.0: 237.0, 15.0: 421.0}


def test_eed_geometry_defaults():
    eed = ExodusEED()
    assert eed.n_blades == 9
    assert eed.V_kV == 25.0
    assert eed.eps_r == 4.0
    assert abs(eed.gap_m - 0.00635) < 1e-6


def test_upload_formula_does_NOT_match_patent():
    """The upload's claim ('7 % match') does not survive end-to-end."""
    rows = upload_claim_report()
    # Both predictions are off by > 50 %
    for row in rows:
        assert row["abs_err_pct"] > 50.0


def test_upload_formula_gives_negative_thrust():
    """The formula returns the wrong sign — pinned regression check."""
    rows = upload_claim_report()
    assert rows[0]["F_pred_mN"] < 0
    assert rows[1]["F_pred_mN"] < 0


def test_thruster_claim_does_not_hold_at_15pct():
    """The 'claim holds' gate returns False at the upload's claimed 15% tolerance."""
    assert not thruster_claim_holds(tol_pct=15.0)


def test_thruster_claim_does_not_hold_at_50pct():
    """Off by >100% — still fails at 50%."""
    assert not thruster_claim_holds(tol_pct=50.0)


def test_thrust_finite_and_real():
    """The formula returns finite real numbers (no NaN, inf)."""
    rows = upload_claim_report()
    for row in rows:
        assert math.isfinite(row["F_pred_mN"])
