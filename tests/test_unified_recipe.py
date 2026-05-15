"""Tests for urt.unified_recipe — the 4-template Cathedral classification.

This module is the CI gate for the post-audit honest accounting:
  - the 4 templates are callable
  - the classification is stable (each row has a family)
  - the audit gate (`unified_recipe_audit_passes`) holds at 5% tol
  - the information / DOF numbers stay positive (net > 0)

It does NOT verify that the master template covers every observable
at <1% — that claim is false (see docs/UNIFIED_RECIPE_AUDIT.md).
"""
from __future__ import annotations
import math
import pytest

from urt.unified_recipe import (
    template_INT,
    template_GAMMA_LADDER,
    template_DELTA_STAR_LIN,
    template_TRIG_WRAPPER,
    canonical_classification,
    template_coverage_summary,
    template_fit_quality,
    unified_recipe_audit_passes,
    information_delivered_bits,
    template_DOF_per_observable,
    total_template_budget_bits,
    net_information_bits,
    TemplateMatch,
)


# ── Template callables ────────────────────────────────────────────────────

class TestTemplateCallables:
    def test_INT_returns_integer_as_float(self):
        assert template_INT(137) == 137.0
        assert template_INT(1836) == 1836.0
        assert template_INT(0) == 0.0

    def test_GAMMA_LADDER_basic(self):
        # k=1, coeff=8 → 8/81 ≈ 0.0987
        assert abs(template_GAMMA_LADDER(8.0, 1) - 8.0/81.0) < 1e-12
        # k=64 ladder rung exists
        assert template_GAMMA_LADDER(1.0, 64) > 0.0

    def test_GAMMA_LADDER_rejects_noncanonical(self):
        with pytest.raises(ValueError):
            template_GAMMA_LADDER(1.0, 4)

    def test_DELTA_STAR_LIN_basic(self):
        from urt.shell_closure import DELTA_STAR
        # Test α_s(M_Z) recipe: δ★ · (q-1)/q
        val = template_DELTA_STAR_LIN(4.0/5.0, 1)
        assert abs(val - DELTA_STAR * 4.0/5.0) < 1e-12

    def test_DELTA_STAR_LIN_rejects_high_powers(self):
        with pytest.raises(ValueError):
            template_DELTA_STAR_LIN(1.0, 3)

    def test_TRIG_WRAPPER_basic(self):
        from math import pi, sin
        val = template_TRIG_WRAPPER("sin", pi/20)
        assert abs(val - sin(pi/20)) < 1e-12

    def test_TRIG_WRAPPER_rejects_invalid(self):
        with pytest.raises(ValueError):
            template_TRIG_WRAPPER("tan", 0.5)

    def test_TRIG_WRAPPER_asin_domain(self):
        with pytest.raises(ValueError):
            template_TRIG_WRAPPER("asin", 1.5)


# ── Classification stability ─────────────────────────────────────────────

class TestClassification:
    def test_returns_list_of_matches(self):
        rows = canonical_classification()
        assert len(rows) > 0
        for r in rows:
            assert isinstance(r, TemplateMatch)
            assert r.family in ("INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER")

    def test_coverage_summary_has_all_families(self):
        c = template_coverage_summary()
        for fam in ("INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"):
            assert fam in c
            assert c[fam] > 0

    def test_INT_family_dominates(self):
        c = template_coverage_summary()
        # INT family is the largest — pure Cathedral-integer expressions
        assert c["INT"] >= max(c["GAMMA_LADDER"], c["DELTA_STAR_LIN"], c["TRIG_WRAPPER"])

    def test_at_least_25_observables_classified(self):
        # The v9 ledger has ~35 observables; classification should cover most
        rows = canonical_classification()
        assert len(rows) >= 25


# ── Fit quality / audit gate ─────────────────────────────────────────────

class TestAuditGate:
    def test_audit_passes_at_5pct(self):
        # All classified observables match observation within 5%
        assert unified_recipe_audit_passes(tol=0.05) is True

    def test_audit_fails_at_strict_tolerance(self):
        # The audit honestly reports that some observables (m_π/m_p, ρ̄)
        # exceed 1% — the framework is *near* tight but not perfectly tight
        # under this strict 4-template scheme.
        assert unified_recipe_audit_passes(tol=0.005) is False

    def test_most_INT_observables_under_0_5pct(self):
        # The INT family is exceptionally tight (no transcendentals)
        cls = canonical_classification()
        hits = 0
        total = 0
        for c in cls:
            if c.family != "INT" or c.observed is None:
                continue
            total += 1
            re = abs((c.predicted - c.observed) / c.observed)
            if re < 0.005:
                hits += 1
        # At least 75% of INT rows are under 0.5%
        assert hits / total >= 0.75


# ── Information accounting ───────────────────────────────────────────────

class TestInformationAccounting:
    def test_DOF_table_has_all_families(self):
        dof = template_DOF_per_observable()
        for fam in ("INT", "GAMMA_LADDER", "DELTA_STAR_LIN", "TRIG_WRAPPER"):
            assert fam in dof
            assert dof[fam] > 0.0

    def test_information_delivered_positive(self):
        # Sum of log2(1/|rel_err|) > 0
        info = information_delivered_bits()
        assert info > 0.0

    def test_template_budget_positive(self):
        b = total_template_budget_bits()
        assert b > 0.0

    def test_net_information_is_positive(self):
        """The headline honest claim: under the 4-template scheme,
        the framework delivers MORE bits of information than the
        sum of template-slot freedom budgets.

        If this fails, the framework is overfitting under THIS template.
        If it passes, the framework is "tight" under this template.
        """
        net = net_information_bits()
        assert net > 0.0, f"Net info is {net:.1f} bits — framework is overfitting"

    def test_INT_family_has_lowest_DOF(self):
        # Pure Cathedral-integer expressions have the fewest slot DOFs
        dof = template_DOF_per_observable()
        assert dof["INT"] < dof["GAMMA_LADDER"]
        assert dof["INT"] < dof["TRIG_WRAPPER"]


# ── Smoke tests ────────────────────────────────────────────────────────

class TestSmoke:
    def test_print_unified_recipe_report_runs(self, capsys):
        from urt.unified_recipe import print_unified_recipe_report
        print_unified_recipe_report()
        out = capsys.readouterr().out
        assert "Unified Recipe Audit" in out
        assert "INT" in out
        assert "GAMMA_LADDER" in out
        assert "TIGHT" in out or "LOOSE" in out

    def test_template_fit_quality_returns_3tuples(self):
        rows = template_fit_quality()
        for row in rows:
            assert len(row) == 3
            name, fam, re = row
            assert isinstance(name, str)
            assert isinstance(fam, str)
            assert re is None or isinstance(re, float)


# ── Importable from urt ────────────────────────────────────────────────

class TestPublicExports:
    def test_can_import_from_urt(self):
        # All top-level exports must be importable from `urt`
        from urt import (
            template_INT, template_GAMMA_LADDER,
            template_DELTA_STAR_LIN, template_TRIG_WRAPPER,
            canonical_classification,
            unified_recipe_audit_passes,
            information_delivered_bits,
            total_template_budget_bits,
            net_information_bits,
            print_unified_recipe_report,
            TemplateMatch,
        )
        # smoke check
        assert callable(template_INT)
        assert callable(unified_recipe_audit_passes)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
