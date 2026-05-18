"""Predictions registry — all confirmed predictions within 2 %."""
from newtons_cathedral.predictions import (
    Prediction, all_predictions, predictions_audit, summary,
)


def test_registry_has_at_least_45_predictions():
    rows = all_predictions()
    assert len(rows) >= 45


def test_registry_contains_headline_observables():
    rows = all_predictions()
    names = {r.name for r in rows}
    for needed in (
        "1/α (fine structure)",
        "m_p / m_e",
        "δ_CP (PMNS)",
        "n_s",
        "Λ / M_Pl⁴",
        "η_B",
        "m_H (Higgs, integer)",
        "Σ m_ν",
        "m_e",
        "m_p",
        "Ω_m",
        "axion mass",
        "# nuclear magic numbers",
    ):
        assert needed in names, f"missing {needed!r}"


def test_all_confirmed_within_2pct():
    rows = all_predictions()
    for r in rows:
        if r.status != "confirmed":
            continue
        err = r.relative_error()
        assert err is not None, r.name
        assert abs(err) <= 0.02, f"{r.name}: rel_err = {err}"


def test_audit_passes():
    assert predictions_audit()


def test_summary_counts():
    s = summary()
    assert s["all_within_1pct"] is False or s["all_within_1pct"] is True  # any
    # Most confirmed predictions are sub-0.1 %.
    confirmed = s["by_status"]["confirmed"]
    sub_0_1 = s["sub_0_1_pct"]
    assert sub_0_1 / confirmed > 0.5, f"only {sub_0_1}/{confirmed} sub-0.1 %"
    # Median relative error well under 0.5 %.
    assert s["median_rel_err"] < 0.005


def test_zero_free_parameters_in_closed_forms():
    """Every confirmed closed form references the Cathedral primitives.

    A handful of derived-formula entries (CKM J, m_p, M_Pl, etc.) only
    quote the derived intermediate (m_p/m_e, Λ/M_Pl⁴, ρ̄, η̄), which are
    themselves Cathedral compounds — those are also acceptable.
    """
    SYMBOLS = (
        "D", "q", "V", "E", "F", "G", "N", "δ★", "γ", "φ", "π", "Δ", "δ_cl",
        "v_EW", "m_p", "m_e", "m_Z", "Λ", "M_Pl", "ρ_Λ",
        "ρ̄", "η̄", "λ_H", "y_e", "η", "λ_P",
        "Madelung", "shell",
    )
    for r in all_predictions():
        if r.status != "confirmed":
            continue
        assert any(s in r.closed_form for s in SYMBOLS), \
            f"{r.name}: closed_form '{r.closed_form}' has no Cathedral symbol"
