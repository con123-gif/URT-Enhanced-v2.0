"""Tests for urt/music_cathedral.py — 12-TET, harmony, Cathedral integers."""

import pytest
from math import log2, isclose, isfinite


def test_imports():
    from urt.music_cathedral import (
        SEMITONES_PER_OCTAVE, SEMITONE_RATIO,
        PERFECT_5TH_JUST, PERFECT_5TH_ET, PERFECT_5TH_DEVIATION,
        CENTS_PER_OCTAVE, PYTHAGOREAN_COMMA,
        TRIAD_NOTES, MINOR_3RD_SEMITONES, MAJOR_3RD_SEMITONES,
        SEVENTH_CHORD_NOTES, TRITONE_SEMITONES, PENTATONIC_NOTES,
        N_KEYS_CIRCLE, CIRCLE_STEPS,
        harmonic_series, equal_temperament, chord_structure,
        golden_ratio_music, cathedral_musical_numbers, music_summary,
        print_music_report,
    )


# ── 12-TET constants ──────────────────────────────────────────────────────────

def test_semitones_per_octave_eq_V():
    """12 semitones per octave = V = 12 EXACT."""
    from urt.music_cathedral import SEMITONES_PER_OCTAVE
    from urt.shell_closure import V
    assert SEMITONES_PER_OCTAVE == V
    assert SEMITONES_PER_OCTAVE == 12


def test_semitone_ratio():
    """Semitone ratio = 2^{1/12}."""
    from urt.music_cathedral import SEMITONE_RATIO, SEMITONES_PER_OCTAVE
    import math
    assert abs(SEMITONE_RATIO - 2.0 ** (1.0 / SEMITONES_PER_OCTAVE)) < 1e-12
    assert 1.05 < SEMITONE_RATIO < 1.06


def test_cents_per_octave():
    """1200 cents per octave = 100 × V = 1200."""
    from urt.music_cathedral import CENTS_PER_OCTAVE
    from urt.shell_closure import V
    assert CENTS_PER_OCTAVE == 100 * V
    assert CENTS_PER_OCTAVE == 1200


def test_circle_of_fifths_eq_V():
    """Circle of fifths has V = 12 keys."""
    from urt.music_cathedral import N_KEYS_CIRCLE, CIRCLE_STEPS
    from urt.shell_closure import V
    assert N_KEYS_CIRCLE == V
    assert CIRCLE_STEPS == V


def test_tritone_eq_V_over_2():
    """Tritone = V/2 = 6 semitones."""
    from urt.music_cathedral import TRITONE_SEMITONES
    from urt.shell_closure import V
    assert TRITONE_SEMITONES == V // 2
    assert TRITONE_SEMITONES == 6


# ── Perfect fifth ─────────────────────────────────────────────────────────────

def test_perfect_5th_just():
    """Perfect 5th = D/(D-1) = 3/2 EXACT."""
    from urt.music_cathedral import PERFECT_5TH_JUST
    from urt.shell_closure import D
    assert abs(PERFECT_5TH_JUST - float(D) / (D - 1)) < 1e-14
    assert abs(PERFECT_5TH_JUST - 1.5) < 1e-14


def test_perfect_5th_ET_close_to_just():
    """ET perfect 5th ≈ just (< 0.2% deviation)."""
    from urt.music_cathedral import PERFECT_5TH_DEVIATION
    assert PERFECT_5TH_DEVIATION < 0.002


def test_pythagorean_comma_near_unity():
    """Pythagorean comma ≈ 1 (nearly 1.0136)."""
    from urt.music_cathedral import PYTHAGOREAN_COMMA
    assert 1.0 < PYTHAGOREAN_COMMA < 1.02


def test_pythagorean_comma_formula():
    """(3/2)^12 / 2^7."""
    from urt.music_cathedral import PYTHAGOREAN_COMMA, PERFECT_5TH_JUST
    from urt.shell_closure import V
    expected = PERFECT_5TH_JUST ** V / 2**7
    assert abs(PYTHAGOREAN_COMMA - expected) < 1e-12


# ── Chord structure ───────────────────────────────────────────────────────────

def test_triad_notes_eq_D():
    """Triad has D = 3 notes."""
    from urt.music_cathedral import TRIAD_NOTES
    from urt.shell_closure import D
    assert TRIAD_NOTES == D
    assert TRIAD_NOTES == 3


def test_minor_3rd_eq_D():
    """Minor 3rd = D = 3 semitones."""
    from urt.music_cathedral import MINOR_3RD_SEMITONES
    from urt.shell_closure import D
    assert MINOR_3RD_SEMITONES == D
    assert MINOR_3RD_SEMITONES == 3


def test_major_3rd_eq_D1():
    """Major 3rd = D+1 = 4 semitones."""
    from urt.music_cathedral import MAJOR_3RD_SEMITONES
    from urt.shell_closure import D
    assert MAJOR_3RD_SEMITONES == D + 1
    assert MAJOR_3RD_SEMITONES == 4


def test_seventh_chord_eq_D1():
    """7th chord has D+1 = 4 notes."""
    from urt.music_cathedral import SEVENTH_CHORD_NOTES
    from urt.shell_closure import D
    assert SEVENTH_CHORD_NOTES == D + 1
    assert SEVENTH_CHORD_NOTES == 4


def test_pentatonic_eq_q():
    """Pentatonic scale has q = 5 notes."""
    from urt.music_cathedral import PENTATONIC_NOTES
    from urt.shell_closure import q
    assert PENTATONIC_NOTES == q
    assert PENTATONIC_NOTES == 5


# ── Function tests ────────────────────────────────────────────────────────────

def test_equal_temperament_function():
    from urt.music_cathedral import equal_temperament
    r = equal_temperament()
    assert r["semitones_eq_V"] is True
    assert r["circle_steps_eq_V"] is True
    assert r["tritone_eq_V_over_2"] is True
    assert abs(r["perfect_5th_just"] - 1.5) < 1e-12


def test_chord_structure_function():
    from urt.music_cathedral import chord_structure
    r = chord_structure()
    assert r["triad_eq_D"] is True
    assert r["pentatonic_eq_q"] is True
    assert r["minor_3rd_eq_D"] is True
    assert r["major_3rd_eq_D1"] is True
    assert r["seventh_eq_D1"] is True


def test_harmonic_series_function():
    from urt.music_cathedral import harmonic_series
    from urt.shell_closure import N
    r = harmonic_series(N)
    assert r["n_harmonics"] == N
    assert r["n_harmonics_eq_N"] is True
    assert r["harmonics"][0] == 1
    assert len(r["harmonics"]) == N


def test_golden_ratio_music_function():
    from urt.music_cathedral import golden_ratio_music
    r = golden_ratio_music()
    assert r["N_in_fibonacci"] is True
    assert 8.0 < r["golden_semitones"] < 9.0


def test_cathedral_numbers_function():
    from urt.music_cathedral import cathedral_musical_numbers
    r = cathedral_musical_numbers()
    assert "V=12" in r
    assert "D=3" in r
    assert "q=5" in r


def test_music_summary():
    from urt.music_cathedral import music_summary
    r = music_summary()
    assert "temperament" in r
    assert "chords" in r
    assert len(r["key_results"]) >= 5


def test_print_music_report(capsys):
    from urt.music_cathedral import print_music_report
    print_music_report()
    out = capsys.readouterr().out
    assert "12" in out
    assert "EXACT" in out
    assert len(out) > 200
