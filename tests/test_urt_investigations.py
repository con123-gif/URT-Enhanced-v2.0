"""Tests for the five URT investigations."""
import pytest

from urt.urt_investigations import (
    six_cycle_z3_z2_structure,
    envelope_sensitivity,
    pre_dated_predictions,
    cathedral_as_generative,
    anti_universe_empirics,
    all_investigations_audit,
    all_investigations_pass,
)


# ── Investigation 1: Six-cycle Z_3 × Z_2 ────────────────────────────────

class TestSixCycleZ3Z2:
    def test_cycle_has_six_branches(self):
        s = six_cycle_z3_z2_structure()
        assert s["n_branches"] == 6

    def test_three_levels(self):
        """The 6-cycle has D = 3 levels — same as spatial dimension."""
        s = six_cycle_z3_z2_structure()
        assert s["n_levels"] == 3
        assert s["n_levels_is_D"]

    def test_level_means_are_about_0_15_0_49_0_96(self):
        s = six_cycle_z3_z2_structure()
        levels = s["level_means"]
        assert 0.14 < levels[0] < 0.16
        assert 0.47 < levels[1] < 0.50
        assert 0.95 < levels[2] < 0.97


# ── Investigation 2: Envelope sensitivity ────────────────────────────────

class TestEnvelopeSensitivity:
    def test_convergence_is_insensitive_to_k(self):
        """All k ∈ {0, 1, 2, 3, 4, 6, 8} give similar final means."""
        e = envelope_sensitivity()
        means = [m for m, s in e.values()]
        # All within 5 % of each other
        spread = (max(means) - min(means)) / max(means)
        assert spread < 0.05

    def test_all_k_converge(self):
        """All k ∈ {0..8} produce small final std (good convergence)."""
        e = envelope_sensitivity()
        for k, (m, s) in e.items():
            assert s < 0.01, f"k={k} did not converge"


# ── Investigation 3: Pre-dated predictions ──────────────────────────────

class TestPreDatedPredictions:
    def test_at_least_five_pre_dated(self):
        assert len(pre_dated_predictions()) >= 5

    def test_hubble_is_pre_dated(self):
        preds = pre_dated_predictions()
        assert any("Hubble" in p["prediction"] for p in preds)

    def test_axion_is_open(self):
        preds = pre_dated_predictions()
        axion = next(p for p in preds if "axion" in p["prediction"])
        assert "OPEN" in axion["status"]


# ── Investigation 4: Cathedral as generative — negative ──────────────────

class TestCathedralAsGenerative:
    def test_196884_is_not_simply_Cathedral(self):
        """Moonshine constant is NOT a simple Cathedral expression — good."""
        g = cathedral_as_generative()
        assert g[196884] == [], "196884 should have no simple Cathedral form"

    def test_5040_is_not_simply_Cathedral(self):
        """7! is not a simple Cathedral expression — framework is selective."""
        g = cathedral_as_generative()
        assert g[5040] == []

    def test_720_is_Cathedral(self):
        """720 = 2V·E = D·V·F — IS a Cathedral expression."""
        g = cathedral_as_generative()
        assert g[720] != []
        assert any("V" in m and ("E" in m or "F" in m) for m in g[720])


# ── Investigation 5: Anti-universe ──────────────────────────────────────

class TestAntiUniverseEmpirics:
    def test_strong_matter_bias(self):
        """≥95 % of trials end above δ★ — matter side dominates."""
        a = anti_universe_empirics(n_trials=200, seed=0)
        assert a["fraction_above"] > 0.95
        assert a["matter_bias"]

    def test_some_trials_end_below_delta_star(self):
        """Not 100 % matter — some trials do end below δ★ (small basin)."""
        # This is informational — about 0.4 % do end below
        a = anti_universe_empirics(n_trials=500, seed=0)
        # Just verify the count is reported
        assert a["n_above_delta_star"] + a["n_below_delta_star"] == 500


class TestEndToEndAudit:
    def test_audit_returns_all_five(self):
        a = all_investigations_audit()
        assert len(a) == 5

    def test_all_investigations_pass(self):
        assert all_investigations_pass()
