"""Tests for the failed-attempts study module."""
from urt.failed_attempts_study import (
    FAILURE_ANALYSIS,
    by_category,
    by_severity,
    cross_cutting_patterns,
    recommendations,
    failed_attempts_study_audit,
    failed_attempts_study_audit_passes,
)


class TestFailureAnalysis:
    def test_six_failures_catalogued(self):
        """All 6 disclosed failures have detailed entries."""
        assert len(FAILURE_ANALYSIS) == 6

    def test_each_has_required_fields(self):
        """Every entry has the standard analysis fields (incl. v2.9.74 resolution)."""
        required = ("id", "name", "category", "severity", "resolution",
                    "best_attempt", "observed", "rel_error",
                    "what_we_know", "interpretation", "actionable")
        for f in FAILURE_ANALYSIS:
            for k in required:
                assert k in f, f"failure {f.get('id')} missing {k}"

    def test_ids_are_1_through_6(self):
        ids = sorted(f["id"] for f in FAILURE_ANALYSIS)
        assert ids == [1, 2, 3, 4, 5, 6]

    def test_null_test_is_retracted(self):
        """The null-hypothesis test is now flagged as a category error."""
        null = next(f for f in FAILURE_ANALYSIS if f["id"] == 6)
        assert null["severity"] == "RETRACTED"
        assert "category error" in null["category"].lower() or \
               "category error" in null["interpretation"].lower() or \
               "RETRACTED" in null["actionable"]


class TestCrossCuttingPatterns:
    def test_returns_complete_dict(self):
        p = cross_cutting_patterns()
        for k in ("by_category", "by_severity", "common_thread",
                  "what_survives", "what_changes"):
            assert k in p

    def test_acknowledges_null_test_retraction(self):
        """The cross-cutting patterns acknowledge the null test was retracted."""
        p = cross_cutting_patterns()
        full_text = (p["common_thread"] + p["what_survives"]
                     + p["what_changes"]).lower()
        assert "retracted" in full_text or "category" in full_text

    def test_what_survives_emphasises_iron_proof(self):
        p = cross_cutting_patterns()
        assert "Iron Proof" in p["what_survives"]


class TestRecommendations:
    def test_at_least_5_recommendations(self):
        assert len(recommendations()) >= 5

    def test_no_recommendation_for_more_random_tests(self):
        """Don't recommend rerunning a flawed test design."""
        recs = " ".join(recommendations()).lower()
        assert "depth-3 null test" not in recs


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert failed_attempts_study_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = failed_attempts_study_audit()
        for key in ("n_failures", "by_category", "by_severity",
                    "patterns", "recommendations", "detailed_analysis"):
            assert key in a

    def test_six_failures_in_audit(self):
        a = failed_attempts_study_audit()
        assert a["n_failures"] == 6
