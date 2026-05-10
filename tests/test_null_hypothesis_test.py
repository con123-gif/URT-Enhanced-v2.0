"""Tests for the null-hypothesis test (Cathedral vs random vocabularies)."""
from urt.null_hypothesis_test import (
    PDG_TARGETS,
    CATHEDRAL_PRIMARIES,
    HONEST_FINDING,
    cathedral_primary_vocabulary,
    random_primary_vocabulary,
    enumerate_compounds,
    n_matches_in_vocab,
    vocabulary_score,
    null_hypothesis_distribution,
    null_hypothesis_audit,
    null_hypothesis_audit_passes,
)


class TestVocabularies:
    def test_cathedral_has_seven_primaries(self):
        """The Cathedral primary set is exactly {D, q, V, N, E, F, G}."""
        assert len(CATHEDRAL_PRIMARIES) == 7
        assert set(CATHEDRAL_PRIMARIES.keys()) == {"D", "q", "V", "N", "E", "F", "G"}

    def test_cathedral_vocabulary_has_11_symbols(self):
        """Cathedral primaries + 4 transcendentals = 11 symbols."""
        assert len(cathedral_primary_vocabulary()) == 11

    def test_random_vocabulary_reproducible(self):
        """Same seed gives same random vocabulary."""
        v1 = random_primary_vocabulary(seed=42)
        v2 = random_primary_vocabulary(seed=42)
        assert v1 == v2

    def test_random_vocabulary_includes_transcendentals(self):
        v = random_primary_vocabulary(seed=42)
        assert "π" in v
        assert "φ" in v
        assert "e" in v
        assert "γ" in v


class TestEnumeration:
    def test_cathedral_enumeration_is_substantial(self):
        """Cathedral primary depth-2 compounds: hundreds of distinct values."""
        c = enumerate_compounds(cathedral_primary_vocabulary())
        assert len(c) > 200

    def test_n_matches_zero_for_far_target(self):
        """A target far from any compound returns 0 matches."""
        c = enumerate_compounds(cathedral_primary_vocabulary())
        n = n_matches_in_vocab(1e9, c, rel_tol=0.001)
        assert n == 0


class TestPDGTargets:
    def test_at_least_15_targets(self):
        """The PDG target set has at least 15 well-measured observables."""
        assert len(PDG_TARGETS) >= 15

    def test_each_target_is_pair(self):
        for entry in PDG_TARGETS:
            assert len(entry) == 2
            assert isinstance(entry[0], str)
            assert isinstance(entry[1], (int, float))


class TestVocabularyScore:
    def test_returns_complete_dict(self):
        s = vocabulary_score(cathedral_primary_vocabulary())
        for key in ("n_compounds", "n_exact", "n_tight", "n_medium",
                    "n_loose", "n_miss", "n_targets", "score", "rows"):
            assert key in s

    def test_score_equals_exact_plus_tight(self):
        s = vocabulary_score(cathedral_primary_vocabulary())
        assert s["score"] == s["n_exact"] + s["n_tight"]

    def test_total_rows_equals_n_targets(self):
        s = vocabulary_score(cathedral_primary_vocabulary())
        assert len(s["rows"]) == s["n_targets"]


class TestNullHypothesisDistribution:
    def test_K_trials_executed(self):
        a = null_hypothesis_distribution(K=20)
        assert a["K_trials"] == 20

    def test_p_values_in_unit_interval(self):
        a = null_hypothesis_distribution(K=20)
        assert 0.0 <= a["p_value_exact"] <= 1.0
        assert 0.0 <= a["p_value_tight"] <= 1.0

    def test_random_mean_is_finite(self):
        a = null_hypothesis_distribution(K=20)
        assert a["random_mean_exact"] >= 0
        assert a["random_mean_tight"] >= 0


class TestAuditPassesIsAboutMachineryNotResult:
    def test_audit_passes_regardless_of_finding(self):
        """The audit passes iff the test ran cleanly — NOT iff Cathedral won."""
        assert null_hypothesis_audit_passes()

    def test_honest_finding_string_exists(self):
        """A non-empty HONEST_FINDING string documents the result.
        Updated v2.9.73: now contains the retraction critique."""
        assert len(HONEST_FINDING) > 200
        # The v2.9.73 retraction wording
        assert "RETRACTED" in HONEST_FINDING
        assert "category error" in HONEST_FINDING.lower()


class TestEndToEndAudit:
    def test_audit_returns_complete_dict(self):
        a = null_hypothesis_audit()
        for key in ("K_trials", "n_targets", "rel_tol",
                    "cathedral_exact", "cathedral_tight",
                    "random_mean_exact", "random_mean_tight",
                    "p_value_exact", "p_value_tight"):
            assert key in a
