"""Tests for urt/linguistics_cathedral.py — Linguistic universals and Cathedral integers."""

import pytest
from math import factorial


def test_imports():
    from urt.linguistics_cathedral import (
        N_FORMANTS, N_VOWELS_TYPICAL, N_WORD_ORDERS, WORD_ORDERS_EQ_V2,
        N_PIE_LARYNGEALS, N_ONSET_MAX_CONSONANTS, PHONEME_MODE,
        WORD_ORDER_FREQUENCIES, FIVE_VOWEL_LANGUAGES, N_PRIMARY_CARDINAL_VOWELS,
        vowel_system, word_order, phoneme_inventory, pie_reconstruction,
        syllable_structure, linguistics_summary, print_linguistics_report,
    )


# ── Vowel system ──────────────────────────────────────────────────────────────

def test_formants_eq_D():
    """Vowels are characterized by D = 3 formants (F1, F2, F3)."""
    from urt.linguistics_cathedral import N_FORMANTS
    from urt.shell_closure import D
    assert N_FORMANTS == D
    assert N_FORMANTS == 3


def test_typical_vowels_eq_q():
    """Most languages have q = 5 vowel phonemes."""
    from urt.linguistics_cathedral import N_VOWELS_TYPICAL
    from urt.shell_closure import q
    assert N_VOWELS_TYPICAL == q
    assert N_VOWELS_TYPICAL == 5


def test_word_orders_eq_factorial_D():
    """6 possible word orders = factorial(D) = D! = 6."""
    from urt.linguistics_cathedral import N_WORD_ORDERS
    from urt.shell_closure import D
    assert N_WORD_ORDERS == factorial(D)
    assert N_WORD_ORDERS == 6


def test_word_orders_eq_V2():
    """6 word orders = V/2 = 6."""
    from urt.linguistics_cathedral import N_WORD_ORDERS, WORD_ORDERS_EQ_V2
    from urt.shell_closure import V
    assert N_WORD_ORDERS == V // 2
    assert WORD_ORDERS_EQ_V2 is True


# ── Proto-Indo-European ───────────────────────────────────────────────────────

def test_pie_laryngeals_eq_D():
    """PIE had D = 3 laryngeal consonants."""
    from urt.linguistics_cathedral import N_PIE_LARYNGEALS
    from urt.shell_closure import D
    assert N_PIE_LARYNGEALS == D
    assert N_PIE_LARYNGEALS == 3


# ── Phoneme inventory ─────────────────────────────────────────────────────────

def test_phoneme_mode_eq_F():
    """Typical phoneme inventory mode ≈ F = 20."""
    from urt.linguistics_cathedral import PHONEME_MODE
    from urt.shell_closure import F
    assert PHONEME_MODE == F
    assert PHONEME_MODE == 20


def test_primary_cardinal_vowels_eq_q():
    """Primary cardinal vowels = q = 5."""
    from urt.linguistics_cathedral import N_PRIMARY_CARDINAL_VOWELS
    from urt.shell_closure import q
    assert N_PRIMARY_CARDINAL_VOWELS == q
    assert N_PRIMARY_CARDINAL_VOWELS == 5


# ── Word order ────────────────────────────────────────────────────────────────

def test_word_order_frequencies_all_6():
    """All 6 word orders are present."""
    from urt.linguistics_cathedral import WORD_ORDER_FREQUENCIES
    assert len(WORD_ORDER_FREQUENCIES) == 6


def test_five_vowel_languages_exist():
    """Five-vowel language list is non-empty."""
    from urt.linguistics_cathedral import FIVE_VOWEL_LANGUAGES
    assert len(FIVE_VOWEL_LANGUAGES) >= 3


# ── Function tests ────────────────────────────────────────────────────────────

def test_vowel_system_function():
    from urt.linguistics_cathedral import vowel_system
    r = vowel_system()
    assert r["formants_eq_D"] is True
    assert r["eq_q"] is True
    assert r["formants"] == 3
    assert r["typical_vowels"] == 5


def test_word_order_function():
    from urt.linguistics_cathedral import word_order
    r = word_order()
    assert r["n_orders_eq_V2"] is True
    assert r["n_orders"] == 6


def test_phoneme_inventory_function():
    from urt.linguistics_cathedral import phoneme_inventory
    r = phoneme_inventory()
    assert r["mode"] == 20
    assert r["mode_eq_F"] is True


def test_pie_reconstruction_function():
    from urt.linguistics_cathedral import pie_reconstruction
    r = pie_reconstruction()
    assert r["eq_D"] is True
    assert r["laryngeals"] == 3


def test_linguistics_summary():
    from urt.linguistics_cathedral import linguistics_summary
    r = linguistics_summary()
    assert "vowels" in r
    assert "word_order" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 3


def test_print_linguistics_report(capsys):
    from urt.linguistics_cathedral import print_linguistics_report
    print_linguistics_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "3" in out
    assert "5" in out
