"""Tests for urt.signal_filter — deployable URT δ-classifier."""
import math
import numpy as np
import pytest
from urt.signal_filter import (
    urt_delta,
    classify_signal,
    canonical_signal_audit,
    signal_filter_audit_passes,
    DELTA_STAR,
    DELTA_CL,
    VERDICT_STABLE,
    VERDICT_FRAGILE,
    VERDICT_CHAOTIC,
)


def test_constant_signal_delta_zero():
    d = urt_delta(np.ones(500))
    assert d == 0 or math.isnan(d) or abs(d) < 1e-9


def test_empty_signal_returns_nan():
    assert math.isnan(urt_delta(np.array([])))


def test_single_sample_returns_nan():
    assert math.isnan(urt_delta(np.array([1.0])))


def test_short_signal_returns_nan():
    # Below the minimum needed for τ-proxy (60 samples)
    assert math.isnan(urt_delta(np.arange(10.0)))


def test_classify_signal_returns_thresholds():
    result = classify_signal(np.ones(500))
    assert result["threshold_stable"] == pytest.approx(DELTA_STAR)
    assert result["threshold_fragile"] == DELTA_CL


def test_classify_constant_is_stable():
    result = classify_signal(np.ones(500))
    assert result["verdict"] == VERDICT_STABLE


def test_classify_insufficient_when_empty():
    result = classify_signal(np.array([]))
    assert result["verdict"] == "INSUFFICIENT"


def test_audit_passes():
    assert signal_filter_audit_passes()


def test_canonical_audit_keys():
    a = canonical_signal_audit()
    assert set(a.keys()) == {"constant", "sine", "lorenz"}


def test_delta_bounded_by_proxy_ranges():
    """δ = (D_KY - 1)(τ - 2) with D_KY ∈ [1,5], τ ∈ [1.5, 3.5] ⇒ δ ∈ [-2, 6]."""
    rng = np.random.default_rng(0)
    for seed in range(5):
        x = rng.standard_normal((1000, 3))
        d = urt_delta(x)
        if not math.isnan(d):
            assert -2.0 <= d <= 6.0, (seed, d)


def test_multichannel_2d_input():
    rng = np.random.default_rng(0)
    x = rng.standard_normal((500, 4))
    d = urt_delta(x)
    assert math.isfinite(d)


def test_1d_input_works():
    rng = np.random.default_rng(0)
    x = rng.standard_normal(500)
    d = urt_delta(x)
    assert math.isfinite(d)
