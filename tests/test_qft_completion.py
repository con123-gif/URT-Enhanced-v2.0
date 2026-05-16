"""Tests for the four QFT-completion modules:

  - urt.qft_origin_theorem        (Item 3: icosahedral axiom origin)
  - urt.sm_gauge_mapping          (Item 4: SM gauge per K_4 mode)
  - urt.cc_and_yukawa_mechanism   (Items 1 + 2: CC formula + quark masses)
"""
from __future__ import annotations

import pytest
import numpy as np


# ─── Item 3: QFT origin theorem ──────────────────────────────────────────

class TestQFTOriginTheorem:
    def test_all_five_conditions_hold(self):
        from urt.qft_origin_theorem import qft_origin_theorem_holds
        t = qft_origin_theorem_holds()
        assert t.C1_kissing
        assert t.C2_a5_unique
        assert t.C3_spectral_unique
        assert t.C4_flow_forced
        assert t.C5_chaos_selects
        assert t.all_conditions_hold

    def test_audit_passes(self):
        from urt.qft_origin_theorem import qft_origin_audit_passes
        assert qft_origin_audit_passes() is True

    def test_print_does_not_crash(self, capsys):
        from urt.qft_origin_theorem import print_qft_origin_report
        print_qft_origin_report()
        captured = capsys.readouterr()
        assert "vacuum manifold is icosahedral" in captured.out

    def test_C1_admissible_D_is_exactly_1_2_3(self):
        from urt.qft_origin_theorem import condition_1_kissing_number
        c = condition_1_kissing_number()
        assert c["admissible_D"] == [1, 2, 3]
        assert c["unique_non_trivial"] == 3

    def test_C3_unique_winner_is_icosahedron(self):
        from urt.qft_origin_theorem import condition_3_spectral_uniqueness
        c = condition_3_spectral_uniqueness()
        assert c["holds"]
        assert "Icosahedron" in c["winner"]


# ─── Item 4: SM gauge mapping per K_4 mode ───────────────────────────────

class TestSMGaugeMapping:
    def test_audit_passes(self):
        from urt.sm_gauge_mapping import sm_gauge_mapping_audit_passes
        assert sm_gauge_mapping_audit_passes() is True

    def test_graviton_derived(self):
        from urt.sm_gauge_mapping import gauge_assignments
        g = gauge_assignments()
        assert g[0].derivation_status == "DERIVED"
        assert "graviton" in g[0].sm_assignment.lower()
        assert g[0].eigenvalue == pytest.approx(0.0, abs=1e-10)

    def test_EW_doublet_derived(self):
        from urt.sm_gauge_mapping import gauge_assignments
        g = gauge_assignments()
        assert g[1].derivation_status == "DERIVED"
        assert g[2].derivation_status == "DERIVED"
        assert g[1].eigenvalue == pytest.approx(3.0, abs=1e-10)
        assert g[2].eigenvalue == pytest.approx(3.0, abs=1e-10)

    def test_SU3_remains_asserted(self):
        """Honest documentation: λ=5 has multiplicity 6, per-mode choice ambiguous."""
        from urt.sm_gauge_mapping import gauge_assignments
        g = gauge_assignments()
        assert g[3].derivation_status == "ASSERTED"
        assert g[3].multiplicity == 6
        assert g[3].eigenvalue == pytest.approx(5.0, abs=1e-10)

    def test_summary_has_3_derived_1_asserted(self):
        from urt.sm_gauge_mapping import gauge_mapping_summary
        s = gauge_mapping_summary()
        assert s["n_derived"] == 3
        assert s["n_asserted"] == 1
        assert s["fraction_derived"] == 0.75

    def test_print_does_not_crash(self, capsys):
        from urt.sm_gauge_mapping import print_sm_gauge_mapping_report
        print_sm_gauge_mapping_report()
        captured = capsys.readouterr()
        assert "graviton" in captured.out.lower()


# ─── Item 1: CC formula structural exponent ──────────────────────────────

class TestCCMechanism:
    def test_exponent_is_64(self):
        from urt.cc_and_yukawa_mechanism import cc_exponent_structural
        assert cc_exponent_structural() == 64    # (D+1)^D = 4³ = 64

    def test_predicted_value_matches_observed(self):
        """Λ/M_Pl⁴ = D/(D+1)²·γ⁶⁴ matches Planck 2018 to <1 %."""
        from urt.cc_and_yukawa_mechanism import cc_predicted_vs_observed
        cc = cc_predicted_vs_observed()
        assert cc["relative_error"] < 0.01

    def test_predicted_is_specific_value(self):
        """Concretely: predicted ≈ 1.35e-123, observed ≈ 1.35e-123."""
        from urt.cc_and_yukawa_mechanism import (
            cc_formula_predicted, CC_OBSERVED,
        )
        pred = cc_formula_predicted()
        assert 1.0e-123 < pred < 2.0e-123
        assert 1.0e-123 < CC_OBSERVED < 2.0e-123


# ─── Item 2: quark mass closed forms ─────────────────────────────────────

class TestQuarkMasses:
    def test_all_six_quarks_predicted(self):
        from urt.cc_and_yukawa_mechanism import quark_mass_table
        rows = quark_mass_table()
        names = [r.name for r in rows]
        assert names == ["m_u", "m_d", "m_s", "m_c", "m_b", "m_t"]

    def test_all_quarks_match_PDG_within_5pct(self):
        from urt.cc_and_yukawa_mechanism import quark_mass_summary
        qs = quark_mass_summary()
        assert qs["all_within_5pct"]

    def test_max_quark_rel_error_below_1pct(self):
        """All six quark masses match PDG to <1 %."""
        from urt.cc_and_yukawa_mechanism import quark_mass_summary
        qs = quark_mass_summary()
        assert qs["max_rel_err"] < 0.01

    def test_top_quark_specific(self):
        """m_t / m_p = N² + D·q = 169 + 15 = 184."""
        from urt.cc_and_yukawa_mechanism import quark_mass_table
        rows = quark_mass_table()
        m_t_row = [r for r in rows if r.name == "m_t"][0]
        assert "N² + D·q" in m_t_row.closed_form
        # m_t = m_p · 184 = 938.272 MeV · 184 = 172.6 GeV
        assert abs(m_t_row.value_gev - 172.6) < 0.1


# ─── Combined audit ──────────────────────────────────────────────────────

class TestCombinedAudit:
    def test_cc_and_yukawa_audit_passes(self):
        from urt.cc_and_yukawa_mechanism import cc_and_yukawa_audit_passes
        assert cc_and_yukawa_audit_passes() is True

    def test_print_report_does_not_crash(self, capsys):
        from urt.cc_and_yukawa_mechanism import print_cc_and_yukawa_report
        print_cc_and_yukawa_report()
        captured = capsys.readouterr()
        assert "ITEM 1" in captured.out
        assert "ITEM 2" in captured.out
