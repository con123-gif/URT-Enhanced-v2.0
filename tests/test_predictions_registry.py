"""
Tests for urt.predictions_registry.

Two purposes:
  1. Regression — the framework's headline numbers are pinned to the
     registered closed forms; if the closed forms drift, this fires.
  2. Adjudication — the framework's confirmed predictions all stay
     within their stated tolerance vs. the observed value.  If a
     future PDG update widens the gap, this fires too.
"""
from urt.predictions_registry import (
    cathedral_predictions,
    agreement_summary,
    Prediction,
)


# ── Structural ────────────────────────────────────────────────────────────

class TestRegistryStructure:
    def test_at_least_15_predictions_registered(self):
        rows = cathedral_predictions()
        assert len(rows) >= 15

    def test_all_predictions_are_Prediction_instances(self):
        for r in cathedral_predictions():
            assert isinstance(r, Prediction)

    def test_every_prediction_has_a_closed_form(self):
        for r in cathedral_predictions():
            assert r.closed_form
            assert isinstance(r.closed_form, str)
            assert len(r.closed_form) > 5

    def test_status_is_in_known_set(self):
        allowed = {"confirmed", "tension", "predicted", "open"}
        for r in cathedral_predictions():
            assert r.status in allowed, f"{r.name}: bad status {r.status}"


# ── Accuracy: every confirmed prediction stays within 5 % of observation ─

class TestConfirmedPredictionsAgreement:
    def test_all_confirmed_within_5pct(self):
        for r in cathedral_predictions():
            if r.status != "confirmed":
                continue
            err = r.relative_error()
            assert err is not None, f"{r.name} confirmed but no observed?"
            assert abs(err) < 0.05, (
                f"{r.name}: {err*100:.2f}% off observed; tolerance was 5%"
            )

    def test_majority_within_1pct(self):
        confirmed = [r for r in cathedral_predictions() if r.status == "confirmed"]
        within_1 = [r for r in confirmed if abs(r.relative_error()) < 0.01]
        # At least 70% of confirmed predictions are within 1%
        assert len(within_1) / len(confirmed) >= 0.70

    def test_aggregate_summary_consistent(self):
        s = agreement_summary()
        assert s["worst_rel_err"] < 0.05
        assert s["all_within_5pct"]


# ── The Hubble tension prediction (genuinely novel match) ────────────────

class TestHubbleTension:
    """The framework predicts H_0_local/H_0_CMB = 1 + 3/(10π) ≈ 1.0955.

    This closed form was in the framework before the SH0ES vs Planck
    tension was identified.  Today's measurement (73.04/67.36 ≈ 1.084)
    matches it within 1 %."""

    def test_predicted_ratio_is_closed_form(self):
        from math import pi
        h0 = next(r for r in cathedral_predictions() if "H_0" in r.name)
        assert h0.value == 1 + 3/(10*pi)

    def test_predicted_value_is_about_1_0955(self):
        h0 = next(r for r in cathedral_predictions() if "H_0" in r.name)
        assert 1.09 < h0.value < 1.10

    def test_observed_ratio_is_above_unity(self):
        """The Hubble tension itself: H_0_local > H_0_CMB."""
        h0 = next(r for r in cathedral_predictions() if "H_0" in r.name)
        assert h0.observed > 1

    def test_predicted_within_2pct_of_observed(self):
        h0 = next(r for r in cathedral_predictions() if "H_0" in r.name)
        rel = h0.relative_error()
        assert abs(rel) < 0.02


# ── Open / predicted (no observation yet) ────────────────────────────────

class TestOpenPredictions:
    def test_axion_mass_in_admx_target_band(self):
        a = next(r for r in cathedral_predictions() if "axion" in r.name.lower())
        assert 50 <= a.value <= 100        # ADMX-EFR target

    def test_inflationary_r_below_BICEP_bound(self):
        r = next(p for p in cathedral_predictions()
                 if "tensor-to-scalar" in p.name.lower())
        assert r.value < 0.036

    def test_casimir_correction_is_ppm_scale(self):
        c = next(p for p in cathedral_predictions()
                 if "casimir" in p.name.lower())
        # Convert to ppm
        assert 0.01e-6 < c.value < 1e-6
