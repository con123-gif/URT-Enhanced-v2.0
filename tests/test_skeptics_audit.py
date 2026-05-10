"""Tests for the skeptic's audit / framework tightening module."""
import pytest

from urt.skeptics_audit import (
    PROVENANCE_FORCED,
    PROVENANCE_DERIVED,
    PROVENANCE_FITTED,
    PROVENANCE_OPEN,
    PREDICTION_PROVENANCE,
    CRITIQUES_AND_REPLIES,
    CROSS_MODULE_CONNECTIONS,
    provenance_summary,
    failed_attempts,
    skeptics_audit,
    skeptics_audit_passes,
)


class TestProvenanceTaxonomy:
    def test_four_categories(self):
        """Exactly four provenance categories: FORCED, DERIVED, FITTED, OPEN."""
        s = provenance_summary()
        assert PROVENANCE_FORCED in s
        assert PROVENANCE_DERIVED in s
        assert PROVENANCE_FITTED in s
        assert PROVENANCE_OPEN in s

    def test_each_prediction_has_provenance(self):
        """Every catalogued prediction has a provenance label."""
        for name, entry in PREDICTION_PROVENANCE.items():
            assert "provenance" in entry
            assert entry["provenance"] in (
                PROVENANCE_FORCED, PROVENANCE_DERIVED,
                PROVENANCE_FITTED, PROVENANCE_OPEN,
            )

    def test_each_prediction_has_dependencies(self):
        """Every prediction lists what foundational symbols it uses."""
        for name, entry in PREDICTION_PROVENANCE.items():
            assert "depends_on" in entry
            assert isinstance(entry["depends_on"], list)
            assert len(entry["depends_on"]) >= 1

    def test_forced_predictions_have_zero_free_params(self):
        """FORCED identities have zero free parameters."""
        for name, entry in PREDICTION_PROVENANCE.items():
            if entry["provenance"] == PROVENANCE_FORCED:
                assert entry["free_params"] == 0

    def test_derived_predictions_have_zero_free_params(self):
        """DERIVED identities have zero free parameters."""
        for name, entry in PREDICTION_PROVENANCE.items():
            if entry["provenance"] == PROVENANCE_DERIVED:
                assert entry["free_params"] == 0


class TestProvenanceCounts:
    def test_at_least_5_forced(self):
        """At least 5 FORCED identities (the foundational ones)."""
        s = provenance_summary()
        assert s[PROVENANCE_FORCED] >= 5

    def test_at_least_5_derived(self):
        """At least 5 DERIVED identities."""
        s = provenance_summary()
        assert s[PROVENANCE_DERIVED] >= 5

    def test_at_least_1_fitted_disclosed(self):
        """At least 1 FITTED postdiction is honestly disclosed."""
        s = provenance_summary()
        assert s[PROVENANCE_FITTED] >= 1

    def test_at_least_5_open_predictions(self):
        """At least 5 OPEN falsifiable predictions."""
        s = provenance_summary()
        assert s[PROVENANCE_OPEN] >= 5

    def test_total_at_least_20(self):
        assert len(PREDICTION_PROVENANCE) >= 20


class TestCritiquesAndReplies:
    def test_six_standard_critiques(self):
        """Six standard objections are addressed."""
        assert len(CRITIQUES_AND_REPLIES) >= 6

    def test_each_has_critique_and_reply(self):
        for entry in CRITIQUES_AND_REPLIES:
            assert "critique" in entry
            assert "reply" in entry
            assert len(entry["reply"]) > 50    # substantive replies


class TestCrossModuleConnections:
    def test_at_least_5_cross_cutting_compounds(self):
        """At least 5 compounds appear in 3+ modules each."""
        assert len(CROSS_MODULE_CONNECTIONS) >= 5

    def test_each_compound_in_at_least_3_modules(self):
        """Cross-cutting means appears in 3+ modules."""
        for compound, modules in CROSS_MODULE_CONNECTIONS.items():
            assert len(modules) >= 3, f"{compound}: only {len(modules)} modules"

    def test_4_over_9_appears_in_5_modules(self):
        """The 4/9 ratio is the most cross-cutting compound."""
        assert "4/9 = (D+1)/(D!+D)" in CROSS_MODULE_CONNECTIONS
        assert len(CROSS_MODULE_CONNECTIONS["4/9 = (D+1)/(D!+D)"]) >= 5

    def test_5_over_3_appears_in_5_modules(self):
        """5/3 = q/D triple-coincidence visible across 5 modules."""
        assert "5/3 = q/D" in CROSS_MODULE_CONNECTIONS
        assert len(CROSS_MODULE_CONNECTIONS["5/3 = q/D"]) >= 5


class TestFailedAttempts:
    def test_at_least_5_failed_attempts_disclosed(self):
        """Honest disclosure: at least 5 Cathedral compounds that don't work."""
        assert len(failed_attempts()) >= 5

    def test_each_failure_has_verdict(self):
        """Every failed attempt has a clear verdict (no hand-waving)."""
        for f in failed_attempts():
            assert "verdict" in f
            assert "best_compound" in f
            assert "match" in f


class TestProvenanceConsistency:
    def test_higgs_mass_is_FITTED(self):
        """m_H = q³ is honestly labelled as a postdiction."""
        h = PREDICTION_PROVENANCE.get("m_H (Higgs mass) GeV", {})
        assert h.get("provenance") == PROVENANCE_FITTED

    def test_alpha_inv_is_FORCED(self):
        """1/α = N²−E−(D−1) is forced (foundational identity)."""
        a = PREDICTION_PROVENANCE.get("1/α (fine structure)", {})
        assert a.get("provenance") == PROVENANCE_FORCED

    def test_eta_B_is_DERIVED(self):
        """η_B is derived from γ, Δ, δ★ — all forced — via the 8/9 sector ratio."""
        e = PREDICTION_PROVENANCE.get("η_B (baryon asymmetry)", {})
        assert e.get("provenance") == PROVENANCE_DERIVED

    def test_axion_is_OPEN(self):
        """Axion is an open falsifiable prediction."""
        a = PREDICTION_PROVENANCE.get("axion mass", {})
        assert a.get("provenance") == PROVENANCE_OPEN


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert skeptics_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = skeptics_audit()
        for key in ("provenance_summary", "per_prediction", "critiques",
                    "cross_module", "failed_attempts"):
            assert key in a
