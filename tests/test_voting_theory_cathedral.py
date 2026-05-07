"""Tests for urt/voting_theory_cathedral.py — Social choice and Cathedral integers."""

import pytest
from math import isfinite, log, factorial


def test_imports():
    from urt.voting_theory_cathedral import (
        N_ARROW_MIN_VOTERS, N_ARROW_EQ_D,
        N_CONDORCET_MIN, N_CONDORCET_EQ_D,
        N_POLITICAL_AXES, N_AXES_EQ_D,
        N_VOTING_SYSTEMS, N_SYSTEMS_EQ_D,
        N_BORDA_CANDIDATES, N_BORDA_EQ_Q,
        N_PARTY_COALITIONS, N_COALITIONS_EQ_2D,
        N_SOCIAL_CHOICE_CRITERIA, N_CRITERIA_EQ_Q,
        N_LEGISLATURE_SEATS, MAJORITY_SEATS, MAJORITY_EQ_7,
        POWER_INDEX_3PARTY, POWER_EQ_1_D,
        N_GAME_STRATEGIES, N_STRATEGIES_EQ_D,
        N_MAJORITY_NEEDED, N_MAJORITY_EQ_D1,
        N_PREFERENCE_ORDERS, N_PREF_EQ_D_FACT,
        BORDA_TOTAL_SCORE, BORDA_TOTAL_EQ_10,
        N_ICOS_LEGISLATURE_MEMBERS, N_ICOS_COMMITTEE_LINKS,
        ICOS_AVG_COMMITTEE_DEGREE,
        CATHEDRAL_APPROVAL_THRESHOLD, H_VOTING_MAX,
        SUPERMAJORITY_THRESHOLD, SUPERMAJORITY_EQ_2_3,
        arrow_theorem, condorcet_voting,
        voting_theory_summary, print_voting_theory_report,
    )


# ── Arrow's theorem ───────────────────────────────────────────────────────────

def test_arrow_min_voters_eq_D():
    """Arrow's theorem minimum voters = D = 3."""
    from urt.voting_theory_cathedral import N_ARROW_MIN_VOTERS, N_ARROW_EQ_D
    from urt.shell_closure import D
    assert N_ARROW_MIN_VOTERS == D
    assert N_ARROW_MIN_VOTERS == 3
    assert N_ARROW_EQ_D is True


def test_condorcet_min_eq_D():
    """Condorcet paradox minimum candidates = D = 3."""
    from urt.voting_theory_cathedral import N_CONDORCET_MIN, N_CONDORCET_EQ_D
    from urt.shell_closure import D
    assert N_CONDORCET_MIN == D
    assert N_CONDORCET_MIN == 3
    assert N_CONDORCET_EQ_D is True


def test_political_axes_eq_D():
    """Political axes = D = 3."""
    from urt.voting_theory_cathedral import N_POLITICAL_AXES, N_AXES_EQ_D
    from urt.shell_closure import D
    assert N_POLITICAL_AXES == D
    assert N_POLITICAL_AXES == 3
    assert N_AXES_EQ_D is True


def test_voting_systems_eq_D():
    """Electoral system types = D = 3."""
    from urt.voting_theory_cathedral import N_VOTING_SYSTEMS, N_SYSTEMS_EQ_D
    from urt.shell_closure import D
    assert N_VOTING_SYSTEMS == D
    assert N_VOTING_SYSTEMS == 3
    assert N_SYSTEMS_EQ_D is True


# ── Borda count ───────────────────────────────────────────────────────────────

def test_borda_candidates_eq_q():
    """Borda count candidates = q = 5."""
    from urt.voting_theory_cathedral import N_BORDA_CANDIDATES, N_BORDA_EQ_Q
    from urt.shell_closure import q
    assert N_BORDA_CANDIDATES == q
    assert N_BORDA_CANDIDATES == 5
    assert N_BORDA_EQ_Q is True


def test_borda_total_score():
    """Borda total score for q=5 = 0+1+2+3+4 = 10."""
    from urt.voting_theory_cathedral import BORDA_TOTAL_SCORE, BORDA_TOTAL_EQ_10
    assert BORDA_TOTAL_SCORE == 10
    assert BORDA_TOTAL_EQ_10 is True


# ── Coalitions ────────────────────────────────────────────────────────────────

def test_party_coalitions_eq_2D():
    """Party coalitions = 2^D = 8."""
    from urt.voting_theory_cathedral import N_PARTY_COALITIONS, N_COALITIONS_EQ_2D
    from urt.shell_closure import D
    assert N_PARTY_COALITIONS == 2**D
    assert N_PARTY_COALITIONS == 8
    assert N_COALITIONS_EQ_2D is True


def test_social_choice_criteria_eq_q():
    """Social choice criteria ≈ q = 5."""
    from urt.voting_theory_cathedral import N_SOCIAL_CHOICE_CRITERIA, N_CRITERIA_EQ_Q
    from urt.shell_closure import q
    assert N_SOCIAL_CHOICE_CRITERIA == q
    assert N_SOCIAL_CHOICE_CRITERIA == 5
    assert N_CRITERIA_EQ_Q is True


# ── Legislature ───────────────────────────────────────────────────────────────

def test_legislature_seats_eq_N():
    """Legislature seats = N = 13."""
    from urt.voting_theory_cathedral import N_LEGISLATURE_SEATS
    from urt.shell_closure import N
    assert N_LEGISLATURE_SEATS == N
    assert N_LEGISLATURE_SEATS == 13


def test_majority_seats_eq_7():
    """Majority seats = (N+1)//2 = 7."""
    from urt.voting_theory_cathedral import MAJORITY_SEATS, MAJORITY_EQ_7
    from urt.shell_closure import N
    assert MAJORITY_SEATS == (N + 1) // 2
    assert MAJORITY_SEATS == 7
    assert MAJORITY_EQ_7 is True


# ── Game theory ───────────────────────────────────────────────────────────────

def test_power_index_3party():
    """Power index in symmetric 3-party = 1/D = 1/3."""
    from urt.voting_theory_cathedral import POWER_INDEX_3PARTY, POWER_EQ_1_D
    from urt.shell_closure import D
    assert abs(POWER_INDEX_3PARTY - 1.0 / D) < 1e-10
    assert abs(POWER_INDEX_3PARTY - 1.0 / 3.0) < 1e-10
    assert POWER_EQ_1_D is True


def test_game_strategies_eq_D():
    """Game strategies = D = 3."""
    from urt.voting_theory_cathedral import N_GAME_STRATEGIES, N_STRATEGIES_EQ_D
    from urt.shell_closure import D
    assert N_GAME_STRATEGIES == D
    assert N_GAME_STRATEGIES == 3
    assert N_STRATEGIES_EQ_D is True


def test_majority_needed_eq_D1():
    """Majority needed = D−1 = 2."""
    from urt.voting_theory_cathedral import N_MAJORITY_NEEDED, N_MAJORITY_EQ_D1
    from urt.shell_closure import D
    assert N_MAJORITY_NEEDED == D - 1
    assert N_MAJORITY_NEEDED == 2
    assert N_MAJORITY_EQ_D1 is True


# ── Preference orderings ──────────────────────────────────────────────────────

def test_preference_orders_eq_D_factorial():
    """Preference orderings of D candidates = D! = 6."""
    from urt.voting_theory_cathedral import N_PREFERENCE_ORDERS, N_PREF_EQ_D_FACT
    from urt.shell_closure import D
    assert N_PREFERENCE_ORDERS == factorial(D)
    assert N_PREFERENCE_ORDERS == 6
    assert N_PREF_EQ_D_FACT is True


# ── Supermajority ─────────────────────────────────────────────────────────────

def test_supermajority_threshold():
    """Supermajority threshold = (D−1)/D = 2/3."""
    from urt.voting_theory_cathedral import SUPERMAJORITY_THRESHOLD, SUPERMAJORITY_EQ_2_3
    from urt.shell_closure import D
    assert abs(SUPERMAJORITY_THRESHOLD - float(D - 1) / D) < 1e-10
    assert abs(SUPERMAJORITY_THRESHOLD - 2.0 / 3.0) < 1e-10
    assert SUPERMAJORITY_EQ_2_3 is True


# ── Icosahedral legislature ───────────────────────────────────────────────────

def test_icos_legislature_members_eq_N():
    """Icosahedral legislature members = N = 13."""
    from urt.voting_theory_cathedral import N_ICOS_LEGISLATURE_MEMBERS
    from urt.shell_closure import N
    assert N_ICOS_LEGISLATURE_MEMBERS == N
    assert N_ICOS_LEGISLATURE_MEMBERS == 13


def test_icos_committee_links_eq_E():
    """Icosahedral committee links = E = 30."""
    from urt.voting_theory_cathedral import N_ICOS_COMMITTEE_LINKS
    from urt.shell_closure import E
    assert N_ICOS_COMMITTEE_LINKS == E
    assert N_ICOS_COMMITTEE_LINKS == 30


def test_icos_avg_committee_degree():
    """Icosahedral average committee degree = 2E/N ≈ 4.615."""
    from urt.voting_theory_cathedral import ICOS_AVG_COMMITTEE_DEGREE
    from urt.shell_closure import E, N
    assert abs(ICOS_AVG_COMMITTEE_DEGREE - 2.0 * E / N) < 1e-10
    assert 4.0 < ICOS_AVG_COMMITTEE_DEGREE < 5.0


# ── Cathedral threshold and entropy ──────────────────────────────────────────

def test_cathedral_approval_threshold():
    """Cathedral approval threshold = δ★."""
    from urt.voting_theory_cathedral import CATHEDRAL_APPROVAL_THRESHOLD
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_APPROVAL_THRESHOLD - DELTA_STAR) < 1e-12


def test_h_voting_max():
    """Max voting entropy = log₂(N) ≈ 3.70 bits."""
    from urt.voting_theory_cathedral import H_VOTING_MAX
    from urt.shell_closure import N
    assert abs(H_VOTING_MAX - log(N) / log(2)) < 1e-10
    assert 3.5 < H_VOTING_MAX < 4.0


# ── Functions: arrow_theorem ──────────────────────────────────────────────────

def test_arrow_theorem_returns_dict():
    from urt.voting_theory_cathedral import arrow_theorem
    r = arrow_theorem()
    assert isinstance(r, dict)


def test_arrow_theorem_keys():
    from urt.voting_theory_cathedral import arrow_theorem
    r = arrow_theorem()
    required = {
        "n_arrow_min_voters", "arrow_eq_D",
        "n_condorcet_min", "condorcet_eq_D",
        "n_social_choice_criteria", "criteria_eq_q",
        "n_preference_orders", "pref_eq_D_fact",
        "supermajority_threshold", "supermajority_eq_2_3",
    }
    for k in required:
        assert k in r, f"Missing key: {k}"


def test_arrow_theorem_values():
    from urt.voting_theory_cathedral import arrow_theorem
    r = arrow_theorem()
    assert r["n_arrow_min_voters"] == 3
    assert r["arrow_eq_D"] is True
    assert r["n_condorcet_min"] == 3
    assert r["condorcet_eq_D"] is True
    assert r["n_social_choice_criteria"] == 5
    assert r["criteria_eq_q"] is True
    assert r["n_preference_orders"] == 6
    assert r["pref_eq_D_fact"] is True
    assert abs(r["supermajority_threshold"] - 2.0 / 3.0) < 1e-10
    assert r["supermajority_eq_2_3"] is True


# ── Functions: condorcet_voting ───────────────────────────────────────────────

def test_condorcet_voting_returns_dict():
    from urt.voting_theory_cathedral import condorcet_voting
    r = condorcet_voting()
    assert isinstance(r, dict)


def test_condorcet_voting_keys():
    from urt.voting_theory_cathedral import condorcet_voting
    r = condorcet_voting()
    required = {
        "n_borda_candidates", "borda_eq_q",
        "borda_total_score", "borda_total_eq_10",
        "n_party_coalitions", "coalitions_eq_2D",
        "n_majority_needed", "majority_eq_D1",
        "power_index_3party", "power_eq_1_D",
        "n_game_strategies", "strategies_eq_D",
        "n_legislature_seats", "majority_seats", "majority_eq_7",
        "icos_members", "icos_links",
    }
    for k in required:
        assert k in r, f"Missing key: {k}"


def test_condorcet_voting_values():
    from urt.voting_theory_cathedral import condorcet_voting
    r = condorcet_voting()
    assert r["n_borda_candidates"] == 5
    assert r["borda_eq_q"] is True
    assert r["borda_total_score"] == 10
    assert r["borda_total_eq_10"] is True
    assert r["n_party_coalitions"] == 8
    assert r["coalitions_eq_2D"] is True
    assert r["n_majority_needed"] == 2
    assert r["majority_eq_D1"] is True
    assert abs(r["power_index_3party"] - 1.0 / 3.0) < 1e-10
    assert r["power_eq_1_D"] is True
    assert r["n_game_strategies"] == 3
    assert r["strategies_eq_D"] is True
    assert r["n_legislature_seats"] == 13
    assert r["majority_seats"] == 7
    assert r["majority_eq_7"] is True
    assert r["icos_members"] == 13
    assert r["icos_links"] == 30


# ── Functions: voting_theory_summary ─────────────────────────────────────────

def test_voting_theory_summary_returns_dict():
    from urt.voting_theory_cathedral import voting_theory_summary
    r = voting_theory_summary()
    assert isinstance(r, dict)


def test_voting_theory_summary_keys():
    from urt.voting_theory_cathedral import voting_theory_summary
    r = voting_theory_summary()
    assert "arrow_theorem" in r
    assert "condorcet_voting" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r


def test_voting_theory_summary_key_exact_results():
    from urt.voting_theory_cathedral import voting_theory_summary
    r = voting_theory_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5
    text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in text or "APPROXIMATE" in text


def test_voting_theory_summary_D_N():
    from urt.voting_theory_cathedral import voting_theory_summary
    from urt.shell_closure import D, N, DELTA_STAR
    r = voting_theory_summary()
    assert r["D"] == D
    assert r["N"] == N
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-12


# ── print function ────────────────────────────────────────────────────────────

def test_print_voting_theory_report(capsys):
    from urt.voting_theory_cathedral import print_voting_theory_report
    print_voting_theory_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "APPROXIMATE" in out
    assert "3" in out


# ── Cross-module consistency ──────────────────────────────────────────────────

def test_condorcet_matches_shell_D():
    """N_CONDORCET_MIN matches D from shell_closure."""
    from urt.voting_theory_cathedral import N_CONDORCET_MIN
    from urt.shell_closure import D
    assert N_CONDORCET_MIN == D


def test_borda_candidates_matches_q():
    """N_BORDA_CANDIDATES matches q from shell_closure."""
    from urt.voting_theory_cathedral import N_BORDA_CANDIDATES
    from urt.shell_closure import q
    assert N_BORDA_CANDIDATES == q


def test_coalitions_matches_shell_D():
    """N_PARTY_COALITIONS = 2^D from shell_closure."""
    from urt.voting_theory_cathedral import N_PARTY_COALITIONS
    from urt.shell_closure import D
    assert N_PARTY_COALITIONS == 2**D


def test_legislature_seats_matches_shell_N():
    """N_LEGISLATURE_SEATS matches N from shell_closure."""
    from urt.voting_theory_cathedral import N_LEGISLATURE_SEATS
    from urt.shell_closure import N
    assert N_LEGISLATURE_SEATS == N


def test_approval_threshold_matches_delta_star():
    """CATHEDRAL_APPROVAL_THRESHOLD matches DELTA_STAR from shell_closure."""
    from urt.voting_theory_cathedral import CATHEDRAL_APPROVAL_THRESHOLD
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_APPROVAL_THRESHOLD - DELTA_STAR) < 1e-12
