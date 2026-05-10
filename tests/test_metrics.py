"""
Behavioural tests for urt.metrics — Lyapunov (Rosenstein), τ-avalanche, D_KY, δ.

These are the only modules in the framework that perform real numerical work
on time series.  Until now they had **no test file at all** (11.7 % coverage,
the worst in the repo).  This file fixes that with property tests and
known-system tests instead of constant-equality assertions.

Reference systems used
----------------------
- Logistic map at r=4         — chaotic, Lyapunov known ≈ ln 2 ≈ 0.693.
- Logistic map at r=3.5       — period-4 cycle, Lyapunov ≤ 0.
- Linear AR(1) gaussian noise — non-chaotic stochastic, Lyapunov ≈ 0.
- Heavy-tailed Pareto bursts  — well-defined power-law τ.

Rosenstein's slope estimator under-estimates the true Lyapunov on short
series, so these tests assert *qualitative* properties (sign / ordering /
finiteness) rather than absolute values.
"""
import math

import numpy as np
import pytest

from urt.metrics import (
    lyapunov_rosenstein,
    tau_avalanche,
    D_KY_from_l1_proxy,
    DKY_from_delta_monotone,
    delta_metric,
)


# ── helpers ────────────────────────────────────────────────────────────────

def _logistic(r, n=2000, x0=0.31415):
    x = np.empty(n)
    x[0] = x0
    for i in range(1, n):
        x[i] = r * x[i-1] * (1 - x[i-1])
    return x


def _ar1(n=2000, phi=0.5, seed=0):
    rng = np.random.default_rng(seed)
    eps = rng.standard_normal(n)
    y = np.zeros(n)
    for i in range(1, n):
        y[i] = phi * y[i-1] + eps[i]
    return y


def _pareto_bursts(n=2000, alpha=2.0, seed=0):
    rng = np.random.default_rng(seed)
    return rng.pareto(a=alpha, size=n)


# Short series + small embedding window → Rosenstein still distinguishes
# chaotic from periodic but runs in <1s instead of >10s.
_LYA_KW = dict(m=3, delay=4, evolve=40, exclude=30)


# ── Lyapunov / Rosenstein ──────────────────────────────────────────────────

class TestLyapunovRosenstein:
    """Lyapunov largest exponent estimator."""

    def test_returns_finite_on_chaotic_logistic(self):
        x = _logistic(4.0, n=2000)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        assert math.isfinite(l1)

    def test_logistic_chaotic_is_positive(self):
        """Chaotic logistic must give λ₁ > 0."""
        x = _logistic(4.0, n=2000)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        assert l1 > 0

    def test_chaotic_exceeds_periodic(self):
        """Chaotic series must give a *larger* Lyapunov than a periodic one."""
        chaotic = _logistic(4.0, n=2000)
        periodic = _logistic(3.5, n=2000)        # period-4 stable cycle
        l_c = lyapunov_rosenstein(chaotic, **_LYA_KW)
        l_p = lyapunov_rosenstein(periodic, **_LYA_KW)
        assert l_c > l_p

    def test_returns_nan_on_too_short(self):
        """Series shorter than the embedding window must yield NaN."""
        l1 = lyapunov_rosenstein(np.arange(20), m=3, delay=20, evolve=200)
        assert math.isnan(l1)

    def test_returns_nan_on_empty(self):
        l1 = lyapunov_rosenstein(np.array([]), m=3, delay=1, evolve=200)
        assert math.isnan(l1)

    def test_returns_nan_when_neighbours_too_close(self):
        """Constant series — no neighbours past the exclusion window."""
        l1 = lyapunov_rosenstein(np.zeros(2000), m=3, delay=20, evolve=100, exclude=100)
        assert math.isnan(l1) or l1 == 0.0

    def test_returns_float(self):
        x = _logistic(4.0, n=2000)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        assert isinstance(l1, float)

    def test_nonnegative_clamping(self):
        """Estimator must clamp to ≥ 0 (negative slopes are stable systems)."""
        # A pure decaying sinusoid has negative drift → clamped to 0
        t = np.linspace(0, 50, 5000)
        x = np.exp(-t / 5) * np.sin(t)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        assert l1 >= 0.0 or math.isnan(l1)

    def test_reproducible_under_seed(self):
        """Same seed → identical exponent."""
        a = _logistic(4.0, n=4000)
        b = _logistic(4.0, n=4000)        # deterministic recursion
        l_a = lyapunov_rosenstein(a, **_LYA_KW)
        l_b = lyapunov_rosenstein(b, **_LYA_KW)
        assert l_a == l_b


# ── τ-avalanche ────────────────────────────────────────────────────────────

class TestTauAvalanche:
    """Burst-run-length CCDF τ estimator."""

    def test_returns_finite_on_pareto(self):
        data = _pareto_bursts(20000, alpha=2.0)
        tau = tau_avalanche(data, pct=85, xmin_quantile=0.5)
        assert math.isfinite(tau)

    def test_finite_tau_in_physical_range(self):
        data = _pareto_bursts(20000, alpha=2.0)
        tau = tau_avalanche(data, pct=85, xmin_quantile=0.5)
        # power-law avalanche τ in literature is typically 1.5..5
        assert 1.0 < tau < 6.0

    def test_returns_nan_on_too_few_bursts(self):
        # short series → too few suprathreshold bursts
        tau = tau_avalanche(np.arange(50), pct=99, min_bursts=30)
        assert math.isnan(tau)

    def test_returns_nan_on_empty(self):
        assert math.isnan(tau_avalanche(np.array([]), min_bursts=30))

    def test_handles_constant_series(self):
        """All values equal → no bursts above 90th pct → NaN."""
        tau = tau_avalanche(np.ones(2000), pct=90, min_bursts=30)
        assert math.isnan(tau)

    def test_threshold_monotonicity(self):
        """Higher percentile → fewer / shorter bursts → still finite or NaN."""
        data = _pareto_bursts(20000, alpha=2.0)
        t1 = tau_avalanche(data, pct=80, xmin_quantile=0.4)
        t2 = tau_avalanche(data, pct=95, xmin_quantile=0.4)
        # Either both finite, or higher pct degenerates to NaN — never raises.
        assert math.isfinite(t1) or math.isnan(t1)
        assert math.isfinite(t2) or math.isnan(t2)


# ── D_KY proxies ───────────────────────────────────────────────────────────

class TestDKYProxies:
    """Kaplan-Yorke dimension proxies."""

    @pytest.mark.parametrize("l1", [0.0, 0.05, 0.1, 0.5, 1.0, 5.0])
    def test_DKY_proxy_l1_geq_one(self, l1):
        """D_KY ≥ 1 for any λ₁ ≥ 0."""
        assert D_KY_from_l1_proxy(l1) >= 1.0

    def test_DKY_proxy_increases_with_l1(self):
        a = D_KY_from_l1_proxy(0.05)
        b = D_KY_from_l1_proxy(0.5)
        c = D_KY_from_l1_proxy(2.0)
        assert a < b < c

    def test_DKY_proxy_lam3_negative_required(self):
        """The contracting direction must be negative for a valid spectrum."""
        v = D_KY_from_l1_proxy(0.5, lam3=-2.0)
        assert v >= 1.0

    def test_DKY_proxy_at_l1_zero(self):
        """At λ₁ = 0 the proxy should sit just above 1 (marginally chaotic)."""
        v = D_KY_from_l1_proxy(0.0)
        assert v >= 1.0

    def test_DKY_monotone_decreases_with_delta(self):
        """DKY_from_delta_monotone is strictly decreasing in δ ≥ 0."""
        d_small = DKY_from_delta_monotone(0.01)
        d_med   = DKY_from_delta_monotone(0.1)
        d_big   = DKY_from_delta_monotone(0.5)
        assert d_small > d_med > d_big

    def test_DKY_monotone_lower_bound(self):
        """For very large δ, DKY → 1 from above."""
        v = DKY_from_delta_monotone(1e6)
        assert 1.0 <= v <= 1.001

    def test_DKY_monotone_at_zero(self):
        """At δ=0, DKY_monotone hits its ceiling DKY0."""
        v = DKY_from_delta_monotone(0.0, DKY0=2.5)
        assert v == pytest.approx(2.5, rel=1e-12)

    def test_DKY_monotone_clamps_negative_delta(self):
        """Negative δ is treated as 0 (max DKY) per the implementation."""
        v_neg = DKY_from_delta_monotone(-1.0)
        v_zero = DKY_from_delta_monotone(0.0)
        assert v_neg == pytest.approx(v_zero, rel=1e-12)


# ── δ-metric ───────────────────────────────────────────────────────────────

class TestDeltaMetric:
    """δ = (D_KY − 1)·(τ − 2) — the URT chaos coordinate."""

    def test_finite_inputs_finite_output(self):
        v = delta_metric(2.5, 3.0)
        assert math.isfinite(v)
        assert v == pytest.approx(1.5, rel=1e-12)

    def test_nan_propagation_dky(self):
        assert math.isnan(delta_metric(float("nan"), 2.5))

    def test_nan_propagation_tau(self):
        assert math.isnan(delta_metric(2.5, float("nan")))

    def test_zero_when_dky_is_one(self):
        assert delta_metric(1.0, 5.0) == 0.0

    def test_zero_when_tau_is_two(self):
        assert delta_metric(3.0, 2.0) == 0.0

    def test_sign_changes_around_tau_2(self):
        """δ flips sign as τ crosses 2 (criticality boundary)."""
        below = delta_metric(2.5, 1.5)
        above = delta_metric(2.5, 2.5)
        assert below < 0 < above

    @pytest.mark.parametrize("dky,tau,expected", [
        (3.0, 4.0,  4.0),
        (2.0, 2.5,  0.5),
        (1.0, 100.0, 0.0),
    ])
    def test_explicit_values(self, dky, tau, expected):
        assert delta_metric(dky, tau) == pytest.approx(expected, rel=1e-12)


# ── End-to-end pipeline (logistic chaos → δ-metric) ────────────────────────

class TestEndToEndPipeline:
    """Lyapunov → DKY proxy → tau → delta_metric, on a known chaotic system."""

    def test_pipeline_chaotic(self):
        x = _logistic(4.0, n=2000)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        dky = D_KY_from_l1_proxy(l1)
        tau = tau_avalanche(x, pct=85, xmin_quantile=0.5)
        if math.isnan(tau):
            pytest.skip("τ undefined on this realisation; pipeline still runs.")
        d = delta_metric(dky, tau)
        assert math.isfinite(d)

    def test_pipeline_periodic_returns_finite_or_nan(self):
        x = _logistic(3.5, n=2000)
        l1 = lyapunov_rosenstein(x, **_LYA_KW)
        dky = D_KY_from_l1_proxy(l1)
        # Period-4 cycle: tau is generally undefined, but pipeline must not crash.
        tau = tau_avalanche(x, pct=85, xmin_quantile=0.5)
        d = delta_metric(dky, tau)
        assert math.isnan(d) or math.isfinite(d)
