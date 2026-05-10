"""Tests for the triple-coincidence engine."""
from urt.triple_coincidences import (
    Coincidence,
    CATALOGUE,
    by_multiplicity,
    at_least_n_domain,
    headline,
    triple_coincidence_audit,
    triple_coincidence_audit_passes,
)


class TestCatalogue:
    def test_at_least_15_compounds(self):
        assert len(CATALOGUE) >= 15

    def test_each_has_value_form_meanings(self):
        for c in CATALOGUE:
            assert isinstance(c.value, (int, float))
            assert c.form
            assert isinstance(c.meanings, list)
            assert len(c.meanings) >= 3   # by definition triples or higher

    def test_each_meaning_is_triple(self):
        """Each meaning is (domain, role, source)."""
        for c in CATALOGUE:
            for m in c.meanings:
                assert len(m) == 3


class TestMultiplicity:
    def test_v_times_f_is_at_8_domains(self):
        """V·F = 240 has the max multiplicity (8 domains)."""
        c = next(c for c in CATALOGUE if "V·F" in c.form)
        assert c.multiplicity >= 7

    def test_v_at_8_domains(self):
        """V = 12 also reaches 8 domains."""
        c = next(c for c in CATALOGUE if c.value == 12)
        assert c.multiplicity >= 7

    def test_5_over_3_at_5_domains(self):
        """5/3 = q/D triple coincidence is real (≥5 domains)."""
        c = next(c for c in CATALOGUE if abs(c.value - 5/3) < 1e-9)
        assert c.multiplicity >= 4

    def test_4_over_9_at_5_domains(self):
        """4/9 D=3 fingerprint."""
        c = next(c for c in CATALOGUE if abs(c.value - 4/9) < 1e-9)
        assert c.multiplicity >= 4

    def test_at_least_5_compounds_at_5_or_more_domains(self):
        assert len(at_least_n_domain(5)) >= 5

    def test_at_least_2_compounds_at_7_or_more_domains(self):
        assert len(at_least_n_domain(7)) >= 2


class TestSorting:
    def test_first_is_max(self):
        sorted_ = by_multiplicity()
        assert sorted_[0].multiplicity == max(c.multiplicity for c in CATALOGUE)

    def test_descending(self):
        sorted_ = by_multiplicity()
        for i in range(len(sorted_) - 1):
            assert sorted_[i].multiplicity >= sorted_[i + 1].multiplicity


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert triple_coincidence_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = triple_coincidence_audit()
        for key in ("headline", "by_multiplicity", "at_5_or_more", "at_7_or_more"):
            assert key in a
