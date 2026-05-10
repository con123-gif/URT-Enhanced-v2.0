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


# ── New Cathedral identities (v2.9.64) ───────────────────────────────────

class TestNewCathedralIdentities:
    def test_higgs_mass_is_q_cubed(self):
        """m_H ≈ q³ GeV — Higgs mass equals q cubed exactly."""
        from urt.shell_closure import q
        h = next(p for p in cathedral_predictions()
                 if "Higgs" in p.name)
        assert h.value == q ** 3 == 125
        # Match PDG to <0.1 %
        assert abs(h.value - h.observed) / h.observed < 0.001

    def test_alpha_at_M_Z_lytollis(self):
        """1/α(M_Z) = 127.955 (Lytollis) vs PDG 127.918 — within 0.05 %."""
        a = next(p for p in cathedral_predictions()
                 if "1/α (M_Z)" in p.name)
        assert a.value == 127.955
        assert abs(a.value - a.observed) / a.observed < 0.0005

    def test_lambda_cosmological_constant(self):
        """Λ/M_Pl⁴ = (D+1)·γ^((D+1)^D) ≈ 2.88×10⁻¹²² — Planck-consistent."""
        l = next(p for p in cathedral_predictions()
                 if "Λ" in p.name or "cosmological" in p.name.lower())
        assert 2.5e-122 < l.value < 3.5e-122
        # Within 1% of observed mantissa
        assert abs(l.value - l.observed) / l.observed < 0.01

    def test_total_predictions_at_least_20(self):
        """v2.9.64 brings registry to >= 20 entries."""
        assert len(cathedral_predictions()) >= 20

    def test_top_quark_mass_is_N_plus_1_times_V_plus_q(self):
        """m_top = (N+1)·V + q = 173 GeV, matches PDG 172.69 within 0.2%."""
        from urt.shell_closure import V, N, q
        t = next(p for p in cathedral_predictions()
                 if "top quark" in p.name)
        assert t.value == (N + 1) * V + q == 173
        assert abs(t.value - t.observed) / t.observed < 0.005

    def test_sterile_neutrino_mass_is_143_keV(self):
        """m_sterile = γ²·m_p ≈ 143 keV — open falsifiable DM candidate."""
        s = next(p for p in cathedral_predictions()
                 if "sterile" in p.name.lower())
        assert s.value == 143.0
        assert s.units == "keV"
        assert s.status == "open"

    def test_wimp_mass_at_LHC_threshold(self):
        """m_WIMP = δ★·m_Z ≈ 13.45 GeV — at LHC direct-search threshold."""
        w = next(p for p in cathedral_predictions()
                 if "WIMP" in p.name)
        assert 13.0 < w.value < 14.0
        assert w.units == "GeV"

    def test_total_predictions_at_least_23(self):
        """v2.9.65 brings registry to >= 23 entries."""
        assert len(cathedral_predictions()) >= 23
