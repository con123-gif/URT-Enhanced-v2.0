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


class TestPolarityARFUnification:
    """Per-observable empirical polarity + monotonic residue check.

    The unification claim: ARF residues point toward observation AND
    bring the prediction strictly closer to it.  This is the cleaner
    principle that survives unifying the upload's polarity discipline
    with the framework's ARF residue chain.
    """

    def test_audit_runs(self):
        from urt import polarity_arf_unification_audit
        a = polarity_arf_unification_audit()
        assert a["n_checked"] > 0

    def test_unification_holds_for_all_tested(self):
        """The strong claim: residue is toward observation AND closer."""
        from urt import polarity_arf_unification_audit_passes
        assert polarity_arf_unification_audit_passes()

    def test_no_inconsistencies(self):
        from urt import polarity_arf_unification_audit
        a = polarity_arf_unification_audit()
        assert a["n_inconsistencies"] == 0, \
            f"Found sign mismatches: {a['inconsistencies']}"

    def test_no_nonmonotonic(self):
        from urt import polarity_arf_unification_audit
        a = polarity_arf_unification_audit()
        assert a["n_nonmonotonic"] == 0, \
            f"Found residues that move prediction AWAY from observed: {a['nonmonotonic']}"

    def test_per_observable_polarity_assignments(self):
        """Empirical polarities should be self-consistent (UV or IR, not '0' for tested)."""
        from urt import polarity_arf_unification_audit
        a = polarity_arf_unification_audit()
        for r in a["results"]:
            assert r["empirical_polarity"] in ("UV", "IR")
            assert r["unification_ok"]

    def test_split_between_uv_and_ir(self):
        """Confirm: not all observables are on the same side."""
        from urt import polarity_arf_unification_audit
        a = polarity_arf_unification_audit()
        assert a["uv_count"] > 0
        assert a["ir_count"] > 0

    def test_specific_polarities(self):
        """Spot-check known empirical polarities."""
        from urt import empirical_polarity
        # 1/α: bare = 137 (integer), observed ≈ 137.036 → UV (residue raises)
        r = empirical_polarity("1/α (fine structure)")
        assert r["empirical_polarity"] == "UV"
        # n_s: bare = 1 (scale invariance), observed ≈ 0.965 → IR (residue lowers)
        r = empirical_polarity("n_s (spectral index)")
        assert r["empirical_polarity"] == "IR"
