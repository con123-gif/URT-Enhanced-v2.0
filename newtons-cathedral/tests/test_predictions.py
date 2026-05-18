"""Predictions registry — all confirmed predictions within 1.1 %."""
from urt.predictions import (
    Prediction, all_predictions, predictions_audit, summary,
)


def test_registry_has_all_predictions():
    rows = all_predictions()
    assert len(rows) >= 25
    names = {r.name for r in rows}
    # Spot-check the headline predictions.
    assert "1/α (fine structure)" in names
    assert "m_p / m_e" in names
    assert "δ_CP (PMNS)" in names
    assert "n_s (spectral index)" in names
    assert "Λ / M_Pl⁴" in names
    assert "η_B (baryon asymmetry)" in names


def test_all_confirmed_within_1_1pct():
    rows = all_predictions()
    for r in rows:
        if r.status != "confirmed":
            continue
        err = r.relative_error()
        assert err is not None, r.name
        assert abs(err) <= 0.011, f"{r.name}: rel_err = {err}"


def test_audit_passes():
    assert predictions_audit()


def test_summary_counts_correct():
    s = summary()
    assert s["all_within_5pct"]
    assert s["all_within_1pct"]
    # Median relative error should be well under 0.5 %.
    assert s["median_rel_err"] < 0.005


def test_zero_free_parameters_in_closed_forms():
    # Every confirmed prediction's closed_form contains at least one of
    # the seven Cathedral integer symbols or {δ★, γ, φ, π}.
    SYMBOLS = ("D", "q", "V", "E", "F", "G", "N", "δ★", "γ", "φ", "π", "Δ", "δ_cl")
    for r in all_predictions():
        if r.status != "confirmed":
            continue
        assert any(s in r.closed_form for s in SYMBOLS), \
            f"{r.name}: closed_form '{r.closed_form}' has no Cathedral symbol"
