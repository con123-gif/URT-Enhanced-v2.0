"""Tests for urt/psychology_cathedral.py — Cathedral psychology constants."""

import pytest
from math import isfinite


# ── Import test ───────────────────────────────────────────────────────────────

def test_imports():
    from urt.psychology_cathedral import (
        N_PERSONALITY_FACTORS_OCEAN, N_PERSONALITY_EQ_Q,
        N_MASLOW_NEEDS, N_MASLOW_EQ_Q,
        N_FREUD_AGENCIES, N_FREUD_EQ_D,
        N_ATTACHMENT_STYLES,
        N_PIAGET_STAGES, N_PIAGET_EQ_D1,
        N_ERIKSON_STAGES, N_ERIKSON_EQ_2D,
        N_EMOTIONS_BASIC_EKMAN, N_EMOTIONS_EQ_V2,
        N_KOHLBERG_STAGES, N_KOHLBERG_EQ_V2,
        N_STM_CHUNKS_MILLER, N_STM_EQ_2D1,
        WEBER_FRACTION_TYPICAL, REACTION_TIME_MS,
        N_BASIC_COLOR_TERMS_BK,
        personality_traits, developmental_stages,
        social_psychology, cognitive_psychology,
        psychology_summary, print_psychology_report,
    )


# ── Personality constants ─────────────────────────────────────────────────────

def test_ocean_eq_q():
    """Big Five OCEAN factors = q = 5  [EXACT]."""
    from urt.psychology_cathedral import N_PERSONALITY_FACTORS_OCEAN, N_PERSONALITY_EQ_Q
    from urt.shell_closure import q
    assert N_PERSONALITY_FACTORS_OCEAN == q
    assert N_PERSONALITY_FACTORS_OCEAN == 5
    assert N_PERSONALITY_EQ_Q is True


def test_maslow_eq_q():
    """Maslow hierarchy = q = 5  [EXACT]."""
    from urt.psychology_cathedral import N_MASLOW_NEEDS, N_MASLOW_EQ_Q
    from urt.shell_closure import q
    assert N_MASLOW_NEEDS == q
    assert N_MASLOW_NEEDS == 5
    assert N_MASLOW_EQ_Q is True


# ── Freudian agencies ─────────────────────────────────────────────────────────

def test_freud_eq_D():
    """Id, Ego, Superego = D = 3  [EXACT]."""
    from urt.psychology_cathedral import N_FREUD_AGENCIES, N_FREUD_EQ_D
    from urt.shell_closure import D
    assert N_FREUD_AGENCIES == D
    assert N_FREUD_AGENCIES == 3
    assert N_FREUD_EQ_D is True


def test_attachment_styles_eq_D():
    """Attachment styles = D = 3 (Hazan-Shaver)  [APPROXIMATE]."""
    from urt.psychology_cathedral import N_ATTACHMENT_STYLES
    from urt.shell_closure import D
    assert N_ATTACHMENT_STYLES == D
    assert N_ATTACHMENT_STYLES == 3


# ── Developmental stages ──────────────────────────────────────────────────────

def test_piaget_eq_D_plus_1():
    """Piaget stages = D+1 = 4  [EXACT]."""
    from urt.psychology_cathedral import N_PIAGET_STAGES, N_PIAGET_EQ_D1
    from urt.shell_closure import D
    assert N_PIAGET_STAGES == D + 1
    assert N_PIAGET_STAGES == 4
    assert N_PIAGET_EQ_D1 is True


def test_erikson_eq_2_pow_D():
    """Erikson stages = 2^D = 8  [EXACT arithmetic]."""
    from urt.psychology_cathedral import N_ERIKSON_STAGES, N_ERIKSON_EQ_2D
    from urt.shell_closure import D
    assert N_ERIKSON_STAGES == 2 ** D
    assert N_ERIKSON_STAGES == 8
    assert N_ERIKSON_EQ_2D is True


# ── Social psychology ─────────────────────────────────────────────────────────

def test_ekman_emotions_eq_V2():
    """Ekman six basic emotions = V//2 = 6  [EXACT]."""
    from urt.psychology_cathedral import N_EMOTIONS_BASIC_EKMAN, N_EMOTIONS_EQ_V2
    from urt.shell_closure import V
    assert N_EMOTIONS_BASIC_EKMAN == V // 2
    assert N_EMOTIONS_BASIC_EKMAN == 6
    assert N_EMOTIONS_EQ_V2 is True


def test_kohlberg_eq_V2():
    """Kohlberg moral stages = V//2 = 6  [EXACT]."""
    from urt.psychology_cathedral import N_KOHLBERG_STAGES, N_KOHLBERG_EQ_V2
    from urt.shell_closure import V
    assert N_KOHLBERG_STAGES == V // 2
    assert N_KOHLBERG_STAGES == 6
    assert N_KOHLBERG_EQ_V2 is True


# ── Cognitive psychology ──────────────────────────────────────────────────────

def test_miller_stm_eq_2D_plus_1():
    """Miller STM ≈ 2D+1 = 7  [APPROXIMATE]."""
    from urt.psychology_cathedral import N_STM_CHUNKS_MILLER, N_STM_EQ_2D1
    from urt.shell_closure import D
    assert N_STM_CHUNKS_MILLER == 2 * D + 1
    assert N_STM_CHUNKS_MILLER == 7
    assert N_STM_EQ_2D1 is True


def test_weber_fraction_is_delta_star():
    """Weber fraction = δ★  [CATHEDRAL APPROXIMATE]."""
    from urt.psychology_cathedral import WEBER_FRACTION_TYPICAL
    from urt.shell_closure import DELTA_STAR
    assert abs(WEBER_FRACTION_TYPICAL - DELTA_STAR) < 1e-12
    assert 0.05 < WEBER_FRACTION_TYPICAL < 0.25


def test_reaction_time_positive():
    """Reaction time > 0 and finite."""
    from urt.psychology_cathedral import REACTION_TIME_MS
    assert REACTION_TIME_MS > 0
    assert isfinite(REACTION_TIME_MS)
    # Cathedral: N*1000/G = 13000/60 ≈ 216.7 ms
    assert 100 < REACTION_TIME_MS < 400


# ── Function tests ────────────────────────────────────────────────────────────

def test_personality_traits_function():
    from urt.psychology_cathedral import personality_traits
    r = personality_traits()
    assert r["n_traits"] == 5
    assert r["n_traits_eq_q"] is True
    assert r["n_maslow"] == 5
    assert r["n_maslow_eq_q"] is True
    assert len(r["ocean_factors"]) == 5
    assert len(r["maslow_levels"]) == 5
    assert "EXACT" in r["status_ocean"]


def test_developmental_stages_function():
    from urt.psychology_cathedral import developmental_stages
    r = developmental_stages()
    assert r["n_piaget"] == 4
    assert r["n_piaget_eq_D1"] is True
    assert r["n_erikson"] == 8
    assert r["n_erikson_eq_2D"] is True
    assert r["n_maslow"] == 5
    assert r["n_maslow_eq_q"] is True
    assert len(r["stages_piaget"]) == 4
    assert len(r["stages_erikson"]) == 8
    assert "EXACT" in r["status_piaget"]
    assert "EXACT" in r["status_erikson"]


def test_social_psychology_function():
    from urt.psychology_cathedral import social_psychology
    r = social_psychology()
    assert r["n_emotions"] == 6
    assert r["n_emotions_eq_V2"] is True
    assert r["n_freud"] == 3
    assert r["n_freud_eq_D"] is True
    assert r["n_kohlberg"] == 6
    assert r["n_kohlberg_eq_V2"] is True
    assert len(r["emotions_list"]) == 6
    assert len(r["freud_agencies"]) == 3
    assert "EXACT" in r["status_emotions"]


def test_cognitive_psychology_function():
    from urt.psychology_cathedral import cognitive_psychology
    r = cognitive_psychology()
    assert r["stm_miller"] == 7
    assert r["stm_eq_2D1"] is True
    assert abs(r["weber_fraction"] - r["delta_star"]) < 1e-12
    assert r["weber_eq_delta"] is True
    assert r["reaction_time_ms"] > 0


def test_psychology_summary_keys():
    from urt.psychology_cathedral import psychology_summary
    s = psychology_summary()
    assert "personality" in s
    assert "development" in s
    assert "social" in s
    assert "cognitive" in s
    assert "key_results" in s
    assert len(s["key_results"]) >= 8
    assert s["D"] == 3
    assert s["q"] == 5
    assert s["V"] == 12


def test_print_psychology_report(capsys):
    from urt.psychology_cathedral import print_psychology_report
    print_psychology_report()
    captured = capsys.readouterr()
    assert "EXACT" in captured.out
    assert "q = 5" in captured.out
    assert "D = 3" in captured.out or "D=3" in captured.out


# ── Cross-consistency ─────────────────────────────────────────────────────────

def test_social_and_personality_share_q():
    """Maslow (personality) and OCEAN both = q = 5."""
    from urt.psychology_cathedral import N_MASLOW_NEEDS, N_PERSONALITY_FACTORS_OCEAN
    assert N_MASLOW_NEEDS == N_PERSONALITY_FACTORS_OCEAN


def test_developmental_erikson_twice_piaget_minus_1():
    """Erikson = 8 = 2 × Piaget = 2 × 4 = 2^D."""
    from urt.psychology_cathedral import N_ERIKSON_STAGES, N_PIAGET_STAGES
    assert N_ERIKSON_STAGES == 2 * N_PIAGET_STAGES


def test_emotions_eq_kohlberg():
    """Ekman emotions = Kohlberg stages = V//2 = 6."""
    from urt.psychology_cathedral import N_EMOTIONS_BASIC_EKMAN, N_KOHLBERG_STAGES
    assert N_EMOTIONS_BASIC_EKMAN == N_KOHLBERG_STAGES


def test_basic_color_terms_positive():
    from urt.psychology_cathedral import N_BASIC_COLOR_TERMS_BK
    assert N_BASIC_COLOR_TERMS_BK > 0
    assert isinstance(N_BASIC_COLOR_TERMS_BK, int)
