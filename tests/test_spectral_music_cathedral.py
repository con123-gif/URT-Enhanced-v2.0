"""Tests for the spectrum ↔ music bridge module."""
from fractions import Fraction
from math import factorial

from urt.shell_closure import D, q, V, N, E, F, G
from urt.spectral_music_cathedral import (
    cathedral_spectrum,
    nonzero_spectrum,
    spectrum_ratios_as_intervals,
    m6_triple_coincidence,
    spectrum_mod_V_intervals,
    consonance_count_mod_V,
    spectral_music_audit,
    spectral_music_audit_passes,
)


class TestSpectrum:
    def test_full_spectrum(self):
        """Full Laplacian spectrum is {0, 3, 5, 7, 9, 13}."""
        assert cathedral_spectrum() == [0, 3, 5, 7, 9, 13]

    def test_nonzero_spectrum(self):
        """Non-zero eigenvalues are {3, 5, 7, 9, 13} — all Cathedral."""
        assert nonzero_spectrum() == [3, 5, 7, 9, 13]

    def test_eigenvalues_are_cathedral_integers(self):
        """3 = D, 5 = q, 7 = D!+1, 9 = D², 13 = N."""
        spec = nonzero_spectrum()
        assert spec[0] == D
        assert spec[1] == q
        assert spec[2] == factorial(D) + 1
        assert spec[3] == D * D
        assert spec[4] == N


class TestRatiosAsIntervals:
    def test_M6_appears(self):
        """5/3 = q/D = major 6th appears as a spectrum ratio."""
        r = spectrum_ratios_as_intervals()
        assert r["M6_q_over_D"]
        names = [e["interval_name"] for e in r["matches"]]
        assert "M6_just" in names

    def test_octave_plus_P5(self):
        """9/3 = 3 = octave + P5 appears."""
        r = spectrum_ratios_as_intervals()
        names = [e["interval_name"] for e in r["matches"]]
        assert "octave_plus_P5" in names

    def test_5_limit_minor_7th(self):
        """9/5 = 5-limit minor 7th appears."""
        r = spectrum_ratios_as_intervals()
        names = [e["interval_name"] for e in r["matches"]]
        assert "5_limit_m7" in names

    def test_septimal_tritone(self):
        """7/5 = septimal tritone appears."""
        r = spectrum_ratios_as_intervals()
        names = [e["interval_name"] for e in r["matches"]]
        assert "septimal_tritone" in names

    def test_septimal_m3(self):
        """9/7 = septimal minor 3rd appears."""
        r = spectrum_ratios_as_intervals()
        names = [e["interval_name"] for e in r["matches"]]
        assert "septimal_m3" in names


class TestM6Coincidence:
    def test_5_over_3_equals_q_over_D(self):
        """The major 6th 5/3 IS the Cathedral expression q/D."""
        m = m6_triple_coincidence()
        assert m["is_5_over_3"]
        assert m["value"] == Fraction(q, D)
        assert m["value"] == Fraction(5, 3)


class TestModVIntervals:
    def test_lambda_3_is_minor_3rd(self):
        rows = spectrum_mod_V_intervals()
        row = next(r for r in rows if r["lambda"] == 3)
        assert row["semitones"] == 3
        assert row["interval"] == "m3"
        assert row["consonant"]

    def test_lambda_5_is_perfect_4th(self):
        rows = spectrum_mod_V_intervals()
        row = next(r for r in rows if r["lambda"] == 5)
        assert row["semitones"] == 5
        assert row["interval"] == "P4"
        assert row["consonant"]

    def test_lambda_7_is_perfect_5th(self):
        rows = spectrum_mod_V_intervals()
        row = next(r for r in rows if r["lambda"] == 7)
        assert row["semitones"] == 7
        assert row["interval"] == "P5"
        assert row["consonant"]

    def test_lambda_9_is_major_6th(self):
        rows = spectrum_mod_V_intervals()
        row = next(r for r in rows if r["lambda"] == 9)
        assert row["semitones"] == 9
        assert row["interval"] == "M6"
        assert row["consonant"]

    def test_lambda_N_is_minor_2nd_dissonance(self):
        """λ = N = 13 mod V = 1 → minor 2nd, the only dissonance."""
        rows = spectrum_mod_V_intervals()
        row = next(r for r in rows if r["lambda"] == N)
        assert row["semitones"] == 1
        assert row["interval"] == "m2"
        assert not row["consonant"]


class TestConsonanceCount:
    def test_4_consonant_intervals(self):
        """4 of 5 non-zero eigenvalues map to consonant intervals."""
        c = consonance_count_mod_V()
        assert c["n_consonant"] == 4

    def test_1_dissonant_interval(self):
        """Exactly 1 dissonant interval — the maximum eigenvalue."""
        c = consonance_count_mod_V()
        assert c["n_dissonant"] == 1

    def test_dissonance_is_at_lambda_N(self):
        """The single dissonance comes from λ = N (A_5 exhaust)."""
        c = consonance_count_mod_V()
        assert c["dissonant_eigenvalues"] == [N]
        assert c["dissonance_at_N"]

    def test_consonance_ratio_is_4_over_5(self):
        c = consonance_count_mod_V()
        assert c["fraction_consonant"] == 4 / 5


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert spectral_music_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = spectral_music_audit()
        assert "spectrum" in a
        assert "ratios" in a
        assert "m6_coincidence" in a
        assert "mod_V_intervals" in a
        assert "consonance_count" in a
