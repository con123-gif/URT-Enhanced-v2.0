"""Tests for the Cathedral compression / discovery-probability engine."""
import pytest

from urt.cathedral_compression import (
    cathedral_compounds,
    find_matches,
    n_matches_at_tol,
    discovery_density,
    tightness_label,
    assess_identity,
    registry_significance,
    cathedral_compression_audit,
    cathedral_compression_audit_passes,
)


class TestCompoundEnumeration:
    def test_at_least_1000_distinct_compounds(self):
        """At least 1000 distinct Cathedral compounds enumerated."""
        c = cathedral_compounds()
        assert len(c) >= 1000

    def test_137_in_compounds(self):
        """137 = 1/α is one of the values in the vocabulary directly."""
        assert 137.0 in cathedral_compounds()

    def test_1836_in_compounds(self):
        """1836 = m_p/m_e is in the vocabulary."""
        assert 1836.0 in cathedral_compounds()

    def test_125_in_compounds(self):
        """125 = q^D = q³ is in the vocabulary."""
        assert 125.0 in cathedral_compounds()


class TestFindMatches:
    def test_137_has_match(self):
        m = find_matches(137, rel_tol=0.005)
        assert len(m) >= 1
        # First match should be exactly 137
        values = [v for v, _ in m]
        assert 137.0 in values

    def test_60_7_has_axion_match(self):
        """At 60.7, there's at least one Cathedral compound nearby."""
        m = find_matches(60.7, rel_tol=0.01)
        assert len(m) >= 1


class TestNMatchesAndTightness:
    def test_137_tightness(self):
        """1/α = 137 is EXACT at 0.5% tolerance."""
        n = n_matches_at_tol(137, rel_tol=0.005)
        assert tightness_label(n) in ("EXACT", "TIGHT")

    def test_125_tightness(self):
        """m_H = q³ = 125 is EXACT at 0.5% tolerance."""
        n = n_matches_at_tol(125, rel_tol=0.005)
        assert tightness_label(n) == "EXACT"

    def test_tightness_classification(self):
        assert tightness_label(1) == "EXACT"
        assert tightness_label(2) == "TIGHT"
        assert tightness_label(3) == "TIGHT"
        assert tightness_label(7) == "MEDIUM"
        assert tightness_label(20) == "LOOSE"


class TestDiscoveryDensity:
    def test_density_in_unit_interval(self):
        d = discovery_density(125, rel_tol=0.005)
        assert 0.0 <= d <= 1.0

    def test_density_at_137_is_low(self):
        """1/α = 137 should have low discovery density (significant)."""
        d = discovery_density(137, rel_tol=0.005)
        assert d < 0.01    # less than 1 % random-match rate


class TestAssessIdentity:
    def test_returns_complete_dict(self):
        a = assess_identity(125, rel_tol=0.005)
        for key in ("target", "rel_tol", "n_matches", "tightness",
                    "discovery_density", "top_matches"):
            assert key in a


class TestRegistrySignificance:
    def test_at_least_some_predictions_assessed(self):
        rows = registry_significance()
        assert len(rows) >= 5

    def test_each_row_has_tightness(self):
        rows = registry_significance()
        for r in rows:
            assert "tightness" in r
            assert r["tightness"] in ("EXACT", "TIGHT", "MEDIUM", "LOOSE")


class TestCathedralCompressionAudit:
    def test_audit_passes(self):
        assert cathedral_compression_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = cathedral_compression_audit()
        for key in ("n_compounds_enumerated", "n_predictions_assessed",
                    "by_tightness", "average_discovery_density", "rows"):
            assert key in a

    def test_some_exact_or_tight_predictions(self):
        """At least some confirmed predictions are EXACT or TIGHT."""
        a = cathedral_compression_audit()
        assert (a["by_tightness"]["EXACT"] + a["by_tightness"]["TIGHT"]) >= 3

    def test_average_discovery_density_low(self):
        """Average discovery density across confirmed predictions is <10%."""
        a = cathedral_compression_audit()
        assert a["average_discovery_density"] < 0.10
