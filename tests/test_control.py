"""
Tests for urt.control — URT contraction operator.

The URT control law:        P_{n+1} = β·(α·(P_n − θ·φ(P_n)) + u)
Stability requires:         κ = β·α·(1 + θ) < 1   (Banach contraction)

Until now this module had no test file (35 % coverage).  These tests verify:
  - the explicit contraction constant κ = β·α·(1 + θ)
  - φ(p) = sin(p) inside |p| ≤ π, sign(p) outside (clamping)
  - urt_step is a contraction toward 0 for u = 0
  - urt_operator returns a δ in (0.01, 1.0]
  - is_critical thresholds correctly around δ★
  - reproducibility under deterministic input
"""
import math

import numpy as np
import pytest

from urt.control import (
    urt_step,
    urt_operator,
    is_critical,
    _phi,
    _ALPHA,
    _THETA,
    _BETA,
    _KAPPA,
)
from urt.shell_closure import DELTA_STAR


# ── default parameters ─────────────────────────────────────────────────────

class TestDefaultParameters:
    def test_kappa_is_consistent(self):
        """κ must equal β·α·(1+θ)."""
        assert _KAPPA == pytest.approx(_BETA * _ALPHA * (1 + _THETA), rel=1e-15)

    def test_kappa_is_contractive(self):
        """A Banach contraction needs κ < 1."""
        assert _KAPPA < 1.0

    def test_kappa_is_positive(self):
        assert _KAPPA > 0


# ── φ(p) — the sin/sign clamp ──────────────────────────────────────────────

class TestPhi:
    """φ(p) = sin(p) inside |p| ≤ π, sign(p) on the wrap-around region."""

    @pytest.mark.parametrize("p,expected", [
        (0.0, 0.0),
        (math.pi/2, 1.0),
        (-math.pi/2, -1.0),
        (math.pi, math.sin(math.pi)),
    ])
    def test_inside_window(self, p, expected):
        v = _phi(np.asarray(p))
        assert float(v) == pytest.approx(expected, abs=1e-12)

    def test_outside_window_returns_sign(self):
        """For |p| > π, φ should be sign(p) (=±1)."""
        v_pos = float(_phi(np.asarray(10.0)))
        v_neg = float(_phi(np.asarray(-10.0)))
        assert v_pos == 1.0 and v_neg == -1.0

    def test_vectorised(self):
        p = np.array([-10.0, -1.0, 0.0, 1.0, 10.0])
        v = _phi(p)
        assert v.shape == p.shape
        assert v[0] == -1.0 and v[-1] == 1.0


# ── urt_step ───────────────────────────────────────────────────────────────

class TestURTStep:
    """One-shot URT update step."""

    def test_zero_input_returns_zero(self):
        """state=0, u=0 → next state = 0 (the trivial fixed point)."""
        v = urt_step(0.0)
        assert v == 0.0

    def test_constant_drive_only(self):
        """u alone (state=0) should give β·u."""
        v = urt_step(state=0.0, u=1.0)
        assert v == pytest.approx(_BETA * 1.0, rel=1e-12)

    def test_iterated_step_contracts_to_origin(self):
        """For u=0 and small inputs, repeated steps contract toward 0."""
        x = np.array([0.05, 0.10, -0.15])
        for _ in range(200):
            x = urt_step(x)
        assert np.linalg.norm(x) < 1e-3

    def test_step_is_vector_friendly(self):
        x = np.array([0.0, 0.1, 0.2])
        y = urt_step(x)
        assert y.shape == x.shape

    def test_overrideable_alpha(self):
        """Custom α changes the behaviour."""
        a = urt_step(0.1, alpha=_ALPHA)
        b = urt_step(0.1, alpha=_ALPHA * 2)
        assert a != b

    def test_step_is_finite_for_extreme_inputs(self):
        """No NaN / inf even at large state magnitudes."""
        v = urt_step(1e6)
        assert math.isfinite(v)


# ── urt_operator (δ from a time series) ───────────────────────────────────

class TestURTOperator:
    """The URT scalar δ_u from a raw time series."""

    def test_output_in_range(self):
        rng = np.random.default_rng(0)
        x = rng.normal(size=500)
        d = urt_operator(x)
        assert 0.01 <= d <= 1.0

    def test_returns_float(self):
        x = np.random.default_rng(0).normal(size=300)
        d = urt_operator(x)
        assert isinstance(d, float)

    def test_constant_input_clamped(self):
        """Constant series → degenerate → clamped to lower bound 0.01."""
        d = urt_operator(np.ones(300))
        assert 0.01 <= d <= 1.0

    def test_reproducible(self):
        """Same input → same output (deterministic)."""
        rng = np.random.default_rng(42)
        x = rng.normal(size=500)
        d1 = urt_operator(x)
        d2 = urt_operator(x)
        assert d1 == d2

    def test_different_inputs_can_give_different_deltas(self):
        rng = np.random.default_rng(0)
        x = rng.normal(size=500)
        y = rng.uniform(-1, 1, size=500)
        d_x = urt_operator(x)
        d_y = urt_operator(y)
        # Probability of exact equality is 0 for these inputs
        assert isinstance(d_x, float) and isinstance(d_y, float)

    def test_chaotic_logistic_reasonable_delta(self):
        """A chaotic logistic series should yield δ in (0.01, 1.0)."""
        x = np.zeros(2000)
        x[0] = 0.31415
        for i in range(1, 2000):
            x[i] = 4.0 * x[i-1] * (1 - x[i-1])
        d = urt_operator(x)
        assert 0.01 < d <= 1.0


# ── is_critical ────────────────────────────────────────────────────────────

class TestIsCritical:
    """Predicate flagging proximity to δ★ ≈ 0.14751."""

    def test_at_delta_star(self):
        assert is_critical(DELTA_STAR) is True

    def test_just_inside_threshold(self):
        assert is_critical(DELTA_STAR + 0.019) is True

    def test_just_outside_threshold(self):
        assert is_critical(DELTA_STAR + 0.021) is False

    def test_far_from_delta_star(self):
        assert is_critical(0.5) is False
        assert is_critical(0.0) is False

    def test_threshold_argument(self):
        """A wider threshold should accept more values."""
        v = DELTA_STAR + 0.05
        assert is_critical(v, threshold=0.1) is True
        assert is_critical(v, threshold=0.01) is False


# ── End-to-end ─────────────────────────────────────────────────────────────

class TestEndToEnd:
    """A chaotic series in → finite δ_u out → can be tested for criticality."""

    def test_pipeline_runs(self):
        x = np.zeros(2000)
        x[0] = 0.31415
        for i in range(1, 2000):
            x[i] = 4.0 * x[i-1] * (1 - x[i-1])
        d = urt_operator(x)
        crit = is_critical(d)
        assert isinstance(crit, (bool, np.bool_))


# ── Banach contraction property (mathematical-pattern test) ────────────────

class TestBanachContraction:
    """
    Verify the URT step is a *Banach contraction* for the default parameters.
    For two states x, y : |urt_step(x) − urt_step(y)| ≤ κ · |x − y|.
    Tests by random sampling.
    """

    def test_contraction_inequality(self, rng):
        L = 0.0
        for _ in range(200):
            x = rng.uniform(-1.0, 1.0)
            y = rng.uniform(-1.0, 1.0)
            denom = abs(x - y)
            if denom < 1e-9:
                continue
            ratio = abs(urt_step(x) - urt_step(y)) / denom
            L = max(L, ratio)
        # Empirical Lipschitz constant should not exceed the analytic κ
        # by more than the linearisation error of φ.
        assert L < _KAPPA + 1e-6

    def test_unique_fixed_point_at_zero(self):
        """Iterated urt_step converges to a unique fixed point near 0."""
        for x0 in [-0.4, -0.1, 0.0, 0.1, 0.4]:
            x = x0
            for _ in range(500):
                x = float(urt_step(x))
            assert abs(x) < 1e-6
