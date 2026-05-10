"""
Tests for urt.neural_cathedral — Cathedral neural architecture.

Until now this module had no test file (24 % coverage).  These tests
exercise the actual computational paths:

  - embed_to_shell: dimension handling, normalisation
  - cathedral_step: contraction toward δ★
  - CathedralLayer: forward pass, K₄ output shape, history tracking
  - CathedralNet: multi-layer composition, criticality predicate
  - GrokDetector: state machine for δ-crossing detection
"""
import math

import numpy as np
import pytest

from urt.shell_closure import DELTA_STAR, N
from urt.neural_cathedral import (
    embed_to_shell,
    project_K4_coherent,
    project_A5_exhaust,
    cathedral_step,
    CathedralLayer,
    CathedralNet,
    GrokDetector,
    ALPHA_URT,
    BETA_URT,
)


# ── embed_to_shell ─────────────────────────────────────────────────────────

class TestEmbedToShell:
    def test_shape_is_13(self):
        v = embed_to_shell(np.arange(20))
        assert v.shape == (N,)

    def test_short_input_padded(self):
        v = embed_to_shell(np.array([1.0, 2.0]))
        assert v.shape == (N,)

    def test_long_input_truncated(self):
        v = embed_to_shell(np.arange(100, dtype=float))
        assert v.shape == (N,)

    def test_unit_norm(self):
        v = embed_to_shell(np.arange(20, dtype=float))
        assert np.linalg.norm(v) == pytest.approx(1.0, rel=1e-12)

    def test_zero_input_returns_zero(self):
        """Zero input: norm-divide is skipped, vector remains zero."""
        v = embed_to_shell(np.zeros(5))
        assert np.all(v == 0)

    def test_handles_lists(self):
        v = embed_to_shell([1, 2, 3, 4, 5])
        assert v.shape == (N,)


# ── K4 / A5 projectors ────────────────────────────────────────────────────

class TestSpectralProjections:
    def test_K4_size(self):
        C = np.arange(N, dtype=complex)
        out = project_K4_coherent(C)
        assert out.shape == (4,)

    def test_A5_size(self):
        C = np.arange(N, dtype=complex)
        out = project_A5_exhaust(C)
        assert out.shape == (9,)

    def test_K4_plus_A5_covers_shell(self):
        """K₄ (4) + A₅ (9) = 13 = N."""
        C = np.arange(N, dtype=complex)
        assert project_K4_coherent(C).size + project_A5_exhaust(C).size == N


# ── cathedral_step ─────────────────────────────────────────────────────────

class TestCathedralStep:
    def test_returns_pair(self):
        x = embed_to_shell(np.arange(N, dtype=float))
        new, delta = cathedral_step(x)
        assert new.shape == (N,)
        assert math.isfinite(delta)

    def test_delta_is_finite_and_positive(self):
        x = embed_to_shell(np.arange(N, dtype=float))
        _, delta = cathedral_step(x)
        assert delta > 0

    def test_step_preserves_shape(self):
        x = embed_to_shell(np.random.default_rng(0).normal(size=N))
        new, _ = cathedral_step(x)
        assert new.shape == x.shape

    def test_step_does_not_explode(self):
        x = embed_to_shell(np.random.default_rng(0).normal(size=N))
        for _ in range(20):
            x, _ = cathedral_step(x)
            assert np.all(np.isfinite(x))


# ── CathedralLayer ─────────────────────────────────────────────────────────

class TestCathedralLayer:
    def test_forward_returns_pair(self):
        layer = CathedralLayer(n_urt_steps=3)
        out, delta = layer(np.arange(20, dtype=float))
        assert out.shape == (4,)
        assert math.isfinite(delta)

    def test_history_recorded(self):
        layer = CathedralLayer(n_urt_steps=5)
        _ = layer.forward(np.arange(20, dtype=float))
        assert len(layer.delta_history) == 5

    def test_complex_output_K4(self):
        """K₄ output must be complex-typed."""
        layer = CathedralLayer(n_urt_steps=2)
        out, _ = layer(np.arange(20, dtype=float))
        assert np.iscomplexobj(out)

    def test_callable_alias(self):
        """layer(x) ≡ layer.forward(x)."""
        layer1 = CathedralLayer(n_urt_steps=3)
        layer2 = CathedralLayer(n_urt_steps=3)
        x = np.arange(20, dtype=float)
        a, da = layer1(x)
        b, db = layer2.forward(x)
        assert np.allclose(a, b) and da == db


# ── CathedralNet ──────────────────────────────────────────────────────────

class TestCathedralNet:
    def test_forward_shape(self):
        net = CathedralNet(n_layers=2, n_urt_steps=2, output_dim=2)
        out, delta = net(np.arange(20, dtype=float))
        assert out.shape == (2,)
        assert math.isfinite(delta)

    def test_output_dim_clamped_to_4(self):
        net = CathedralNet(n_layers=1, n_urt_steps=1, output_dim=10)
        assert net.output_dim == 4

    def test_delta_trace_length(self):
        net = CathedralNet(n_layers=3, n_urt_steps=1, output_dim=1)
        _ = net(np.arange(15, dtype=float))
        assert len(net.delta_trace) == 3

    def test_criticality_gap_after_forward(self):
        net = CathedralNet(n_layers=2, n_urt_steps=2, output_dim=1)
        _ = net(np.arange(15, dtype=float))
        gap = net.criticality_gap()
        assert gap is not None and gap >= 0

    def test_criticality_gap_before_forward_returns_none(self):
        net = CathedralNet(n_layers=2)
        assert net.criticality_gap() is None

    def test_is_critical_predicate(self):
        net = CathedralNet(n_layers=2, n_urt_steps=2, output_dim=1)
        _ = net(np.arange(15, dtype=float))
        assert isinstance(net.is_critical(tol=1.0), (bool, np.bool_))


# ── GrokDetector ──────────────────────────────────────────────────────────

class TestGrokDetector:
    def test_initial_state(self):
        d = GrokDetector()
        assert d.grokked is False
        assert d.grok_step is None
        assert d.history == []

    def test_first_update_returns_dict_with_keys(self):
        d = GrokDetector()
        ev = d.update(0.2)
        assert set(ev.keys()) == {"delta", "gap", "crossed", "grokked", "step"}

    def test_first_update_no_crossing(self):
        d = GrokDetector()
        ev = d.update(0.2)
        assert ev["crossed"] is False     # need ≥2 points to detect crossing

    def test_crossing_detected(self):
        d = GrokDetector(window=100, threshold=1e-9)
        d.update(DELTA_STAR + 0.05)
        ev = d.update(DELTA_STAR - 0.05)
        assert ev["crossed"] is True

    def test_no_crossing_on_same_side(self):
        d = GrokDetector(window=100, threshold=1e-9)
        d.update(DELTA_STAR + 0.05)
        ev = d.update(DELTA_STAR + 0.04)
        assert ev["crossed"] is False

    def test_grokking_after_window_near_critical(self):
        """After `window` consecutive samples within threshold, grokked=True."""
        d = GrokDetector(window=5, threshold=0.001)
        ev = None
        for _ in range(10):
            ev = d.update(DELTA_STAR + 1e-5)
        assert d.grokked is True
        assert ev["grokked"] is True
        assert d.grok_step is not None

    def test_no_grokking_far_from_critical(self):
        d = GrokDetector(window=5, threshold=0.001)
        for _ in range(10):
            d.update(DELTA_STAR + 0.1)
        assert d.grokked is False

    def test_convergence_rate_returns_negative_when_converging(self):
        d = GrokDetector()
        # geometric decay toward δ★
        for k in range(30):
            d.update(DELTA_STAR + 0.1 * 0.7 ** k)
        rate = d.convergence_rate()
        assert rate is not None and rate < 0

    def test_convergence_rate_none_when_short(self):
        d = GrokDetector()
        d.update(DELTA_STAR)
        d.update(DELTA_STAR)
        assert d.convergence_rate() is None


# ── URT hyper-parameter sanity ────────────────────────────────────────────

class TestURTHyperparams:
    def test_alpha_urt_finite_positive(self):
        assert math.isfinite(ALPHA_URT) and ALPHA_URT > 0

    def test_beta_urt_finite_positive(self):
        assert math.isfinite(BETA_URT) and BETA_URT > 0
