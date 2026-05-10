"""Tests for the music-geometry Cathedral module."""
from fractions import Fraction
from math import factorial, log2

from urt.shell_closure import D, q, V, N, E, F, G
from urt.music_geometry_cathedral import (
    cathedral_intervals,
    all_consonant_intervals_are_cathedral_ratios,
    first_D_factorial_harmonics,
    pythagorean_comma_as_frustration,
    equal_temperament_resolution,
    perfect_imperfect_interval_split,
    diatonic_pentatonic_chromatic_split,
    music_geometry_audit,
    music_geometry_audit_passes,
)


class TestJustIntonationIntervals:
    def test_perfect_5th_is_D_over_D_minus_1(self):
        """3/2 = D/(D−1)."""
        from urt.shell_closure import D
        i = cathedral_intervals()["perfect_5th"]
        assert i["ratio"] == Fraction(D, D - 1)
        assert i["ratio"] == Fraction(3, 2)

    def test_perfect_4th_is_D_plus_1_over_D(self):
        """4/3 = (D+1)/D."""
        from urt.shell_closure import D
        i = cathedral_intervals()["perfect_4th"]
        assert i["ratio"] == Fraction(D + 1, D)

    def test_major_3rd_is_q_over_D_plus_1(self):
        """5/4 = q/(D+1)."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["major_3rd"]
        assert i["ratio"] == Fraction(q, D + 1)

    def test_major_6th_is_q_over_D(self):
        """5/3 = q/D — same Cathedral ratio as Kolmogorov γ."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["major_6th"]
        assert i["ratio"] == Fraction(q, D)

    def test_minor_3rd_is_D_factorial_over_q(self):
        """6/5 = D!/q."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["minor_3rd"]
        assert i["ratio"] == Fraction(factorial(D), q)

    def test_minor_6th_is_2_to_D_over_q(self):
        """8/5 = 2^D/q."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["minor_6th"]
        assert i["ratio"] == Fraction(2 ** D, q)

    def test_major_7th_is_Dq_over_2_to_D(self):
        """15/8 = D·q/2^D."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["major_7th"]
        assert i["ratio"] == Fraction(D * q, 2 ** D)

    def test_minor_2nd_is_2_Dp1_over_Dq(self):
        """16/15 = 2^(D+1)/(D·q)."""
        from urt.shell_closure import D, q
        i = cathedral_intervals()["minor_2nd"]
        assert i["ratio"] == Fraction(2 ** (D + 1), D * q)

    def test_all_intervals_have_cathedral_form(self):
        """Every consonant + dissonant interval has a Cathedral expression."""
        assert all_consonant_intervals_are_cathedral_ratios()


class TestFirstDFactorialHarmonics:
    def test_six_consonant_harmonics(self):
        """First D! = 6 harmonics generate exactly the consonances."""
        from urt.shell_closure import D
        h = first_D_factorial_harmonics()
        assert h["n_consonant_harmonics"] == factorial(D) == 6

    def test_first_dissonance_at_seven(self):
        """The 7th harmonic (= D!+1) is the first dissonant overtone."""
        from urt.shell_closure import D
        h = first_D_factorial_harmonics()
        assert h["first_dissonance_at"] == factorial(D) + 1 == 7


class TestPythagoreanComma:
    def test_comma_is_above_unity(self):
        """V perfect 5ths exceed D!+1 octaves — comma > 1."""
        pc = pythagorean_comma_as_frustration()
        assert pc["is_above_unity"]

    def test_comma_value(self):
        """PC ≈ 1.01364 (≈ 23.46 cents)."""
        pc = pythagorean_comma_as_frustration()
        assert 1.013 < pc["comma_value"] < 1.014
        assert 23.0 < pc["comma_cents"] < 24.0

    def test_comma_is_531441_over_524288(self):
        """The exact rational PC = 531441/524288."""
        pc = pythagorean_comma_as_frustration()
        assert pc["comma_fraction"] == Fraction(531441, 524288)

    def test_closed_form_uses_D_minus_1(self):
        """PC = (D/(D−1))^V / 2^(D!+1)."""
        from urt.shell_closure import D
        pc = pythagorean_comma_as_frustration()
        expected = (Fraction(D, D - 1) ** V) / (2 ** (factorial(D) + 1))
        assert pc["comma_fraction"] == expected


class TestEqualTemperament:
    def test_V_fold_root(self):
        """ET divides octave into V equal steps."""
        et = equal_temperament_resolution()
        assert abs(et["Vth_root_of_2"] - 2 ** (1/V)) < 1e-15

    def test_ET_5th_close_to_just(self):
        """ET 5th is within 2 cents of the just 5th."""
        et = equal_temperament_resolution()
        assert abs(et["detune_cents"]) < 2.5

    def test_just_5th_is_3_over_2(self):
        et = equal_temperament_resolution()
        assert et["just_5th_ratio"] == 1.5


class TestIntervalSplit:
    def test_4_perfect_intervals(self):
        """4 perfect intervals = |K_4|."""
        from urt.shell_closure import D
        s = perfect_imperfect_interval_split()
        assert s["n_perfect"] == D + 1 == 4
        assert s["n_perfect_eq_K4"]

    def test_9_imperfect_intervals(self):
        """9 imperfect intervals = |A_5 exhaust| = D!+D."""
        from urt.shell_closure import D
        s = perfect_imperfect_interval_split()
        assert s["n_imperfect"] == factorial(D) + D == 9
        assert s["n_imperfect_eq_A5"]

    def test_total_is_N(self):
        """4 + 9 = 13 = N."""
        s = perfect_imperfect_interval_split()
        assert s["total"] == N
        assert s["total_eq_N"]

    def test_ratio_is_4_over_9(self):
        """Perfect/imperfect = 4/9 = K_4/A_5 sector ratio."""
        s = perfect_imperfect_interval_split()
        assert s["is_4_over_9"]


class TestScaleSplit:
    def test_diatonic_plus_pentatonic_is_chromatic(self):
        """(D!+1) + q = V."""
        from urt.shell_closure import D, q
        sp = diatonic_pentatonic_chromatic_split()
        assert sp["diatonic_notes"] + sp["pentatonic_notes"] == V
        assert sp["sum_check"]

    def test_diatonic_is_7(self):
        sp = diatonic_pentatonic_chromatic_split()
        assert sp["diatonic_notes"] == 7

    def test_pentatonic_is_q(self):
        from urt.shell_closure import q
        sp = diatonic_pentatonic_chromatic_split()
        assert sp["pentatonic_notes"] == q == 5

    def test_chromatic_is_V(self):
        sp = diatonic_pentatonic_chromatic_split()
        assert sp["chromatic_notes"] == V == 12


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert music_geometry_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = music_geometry_audit()
        assert "intervals" in a
        assert "harmonics" in a
        assert "pythagorean_comma" in a
        assert "equal_temperament" in a
        assert "interval_split" in a
        assert "scale_split" in a
