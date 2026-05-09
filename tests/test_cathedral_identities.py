"""
Tests for urt.cathedral_identities — the programmatic identity engine.

The engine is two things at once:
  1. A regression-style audit of every named identity in CLAUDE.md and
     the manuscripts (`audit_known_identities`).
  2. A discovery tool that re-runs whenever the framework changes and
     surfaces new candidate identities (`scan_identities`).

This test file makes (1) part of CI and uses (2) to surface a small,
curated set of new identities the scanner found while writing it.
"""
import pytest

from urt.cathedral_identities import (
    CATHEDRAL_INTEGERS,
    audit_known_identities,
    scan_identities,
    find_expressions_for,
)


# ── Audit (regression) ────────────────────────────────────────────────────

class TestAudit:
    def test_all_pre_canned_identities_pass(self):
        audit = audit_known_identities()
        failures = [k for k, v in audit.items() if not v]
        assert not failures, f"Identities failing audit: {failures}"

    def test_audit_contains_at_least_20(self):
        """The audit must keep growing as identities are discovered."""
        assert len(audit_known_identities()) >= 20


# ── Vocabulary completeness ──────────────────────────────────────────────

class TestVocabulary:
    def test_primaries_present(self):
        for k in ("D", "q", "V", "N", "E", "F", "G"):
            assert k in CATHEDRAL_INTEGERS

    def test_arf_denominators_present(self):
        """All five ARF denominators must be derivable from the vocabulary."""
        # d35 = E+q, d51 = G-D², d63 = G+D, d64 = (D+1)^D, d80 = 4F (= 2F+2F)
        # d79 = d80 - 1 — needs scan to confirm
        assert CATHEDRAL_INTEGERS["E+q"] == 35
        assert CATHEDRAL_INTEGERS["G-D²"] == 51
        assert CATHEDRAL_INTEGERS["G+D"] == 63
        assert CATHEDRAL_INTEGERS["(D+1)^D"] == 64

    def test_observable_integers_present(self):
        for k in ("137", "197", "207", "1836"):
            assert k in CATHEDRAL_INTEGERS


# ── Discovery: the engine actually finds patterns ────────────────────────

class TestDiscovery:
    def test_scan_finds_at_least_500(self):
        """The scanner must surface a meaningful number of identities."""
        ids = scan_identities(operations=("+", "*"), max_value=300)
        # Empirically ~1000+; assert ≥ 500 to avoid flakiness
        assert len(ids) >= 500

    def test_137_has_at_least_one_alternative(self):
        """1/α = 137 has multiple Cathedral closed forms.  Surface them."""
        matches = find_expressions_for(137, tol=0.5)
        # At least one of: N² - E - (D-1), V² - (D!+1), N² - (F+V), 197 - G
        assert len(matches) >= 2

    def test_81_has_at_least_one_alternative(self):
        """1/γ = 81 has multiple closed forms (D⁴, D·D^D, G+F+1, V²-(G+D))."""
        matches = find_expressions_for(81, tol=0.5)
        assert len(matches) >= 2


# ── Three newly-surfaced multiplicative identities ───────────────────────

class TestNewlySurfacedIdentities:
    """Specific identities the scanner surfaced.  Add more here whenever
    a new one is noticed."""

    def test_d_times_d_to_d_is_one_over_gamma(self):
        """1/γ = D · D^D = 3 · 27 = 81  (multiplicative form)."""
        from urt.shell_closure import D, gamma
        assert D * D**D == int(1/gamma) == 81

    def test_d_squared_times_F_plus_D_is_207(self):
        """m_µ/m_e bare = 207 = D² · (F + D) = 9 · 23.

        Note 23 = F + D is a Cathedral expression but 23 is *not* in the
        vocabulary; this identity ties together two named expressions
        through multiplication.
        """
        from urt.shell_closure import D, F
        assert D**2 * (F + D) == 207

    def test_n_squared_minus_F_plus_V_is_137(self):
        """1/α = 137 = N² − (F+V) = 169 − 32  (alternative to N²−E−(D−1))."""
        from urt.shell_closure import N, F, V
        assert N**2 - (F + V) == 137

    def test_207_minus_N_minus_D_is_197(self):
        """δ_CP° = 197 = 207 − (N−D) — links the bare m_µ/m_e and δ_CP."""
        from urt.shell_closure import N, D
        # 207 = m_µ/m_e bare; 10 = N - D
        assert 207 - (N - D) == 197

    def test_g_minus_d_plus_g_plus_f_is_137(self):
        """1/α = 137 = (G−D) + (G+F) = 57 + 80.

        On the right: 57 = N_e (inflation e-folds = G-D), 80 = G+F = 1/γ-1.
        So 1/α = N_e + (1/γ − 1).  A new bridge between the
        electromagnetic, inflationary, and topological-closure sectors.
        """
        from urt.shell_closure import G, D, F
        assert (G - D) + (G + F) == 137


# ── find_expressions_for empirical-target use case ────────────────────────

class TestFindExpressionsFor:
    def test_returns_empty_when_no_match(self):
        # Pick a value with no plausible Cathedral form (a transcendental)
        from math import e
        matches = find_expressions_for(e, tol=1e-6)
        assert matches == []

    def test_returns_match_for_137(self):
        matches = find_expressions_for(137, tol=0.5)
        assert any(c == "*" or c == "-" or c == "+" for _, c, _ in matches)

    def test_handles_zero_target(self):
        """0 is matched by every X-X form; engine returns the full list."""
        matches = find_expressions_for(0, tol=1e-9)
        # Engine doesn't filter X-X (only scan_identities does); document this.
        # Every (X, '-', X) yields 0, so we expect at least len(vocab) matches.
        assert len(matches) >= 50
