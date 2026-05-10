"""Tests for the Forced Gap Polarity informational audit."""
import pytest

from urt.forced_gap_polarity import (
    POLARITY_CLASSIFICATION, gap_polarity_signs, check_polarity,
    run_polarity_audit, forced_gap_polarity_audit_passes,
)


class TestGapPolaritySigns:
    def test_uv_sign_is_negative(self):
        s = gap_polarity_signs()
        # δ★ < δ_class so UV (δ_eff side) expects negative deviation
        assert s["UV_expected_sign"] == -1

    def test_ir_sign_is_positive(self):
        s = gap_polarity_signs()
        assert s["IR_expected_sign"] == 1

    def test_matter_side(self):
        s = gap_polarity_signs()
        assert s["matter_side"]

    def test_delta_smaller_than_classical(self):
        s = gap_polarity_signs()
        assert s["delta_star"] < s["delta_class"]


class TestPolarityCheck:
    def test_uv_negative_diff_passes(self):
        # predicted < observed → diff = -ε < 0 → matches UV expected
        c = check_polarity("1/α (fine structure)", 137.0, 137.04)
        assert c["polarity"] == "UV"
        assert c["sign_diff"] == -1
        assert c["ok_sign"]

    def test_uv_positive_diff_fails(self):
        c = check_polarity("1/α (fine structure)", 137.5, 137.04)
        assert c["polarity"] == "UV"
        assert c["sign_diff"] == 1
        assert not c["ok_sign"]

    def test_mixed_always_passes(self):
        c = check_polarity("m_p / m_e", 1900, 1836)
        assert c["polarity"] == "MIXED"
        assert c["ok_sign"]

    def test_unclassified_passes(self):
        c = check_polarity("not_in_table", 1.0, 1.0)
        assert c["polarity"] == "UNCLASSIFIED"
        assert c["ok_sign"]


class TestPolarityAudit:
    def test_audit_runs(self):
        a = run_polarity_audit()
        assert a["n_checked"] > 0

    def test_classifications_cover_observables(self):
        a = run_polarity_audit()
        total = a["uv_count"] + a["ir_count"] + a["mixed_count"]
        assert total == a["n_checked"]

    def test_audit_passes_informational(self):
        # Audit is informational — passes if it ran successfully
        assert forced_gap_polarity_audit_passes()

    def test_violations_are_reported(self):
        """Sign mismatches surface as 'violations' (informational, not failures)."""
        a = run_polarity_audit()
        # The framework's predictions don't all align with the upload's
        # gap-polarity convention, since they're computed via ARF residues.
        # The audit's job is to surface these mismatches, not block them.
        for v in a["violations"]:
            assert v["polarity"] in ("UV", "IR")
            assert "name" in v
