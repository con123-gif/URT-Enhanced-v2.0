"""Tests for urt/sports_cathedral.py — Sport, games, and Cathedral integers."""

import pytest
from math import isfinite, log


def test_imports():
    from urt.sports_cathedral import (
        N_OLYMPIC_MEDALS, N_MEDALS_EQ_D,
        N_TRIATHLON_DISCIPLINES, N_TRIATHLON_EQ_D,
        N_CRICKET_STUMPS, N_STUMPS_EQ_D,
        N_DARTS_PER_TURN, N_DARTS_EQ_D,
        PAR_D, PAR_D_EQ_D, PAR_Q,
        N_TENNIS_GAME_LEVELS, N_TENNIS_EQ_D1,
        N_BASKETBALL_QUARTERS, N_QUARTERS_EQ_D1,
        N_RELAY_LEGS, N_RELAY_EQ_D1,
        N_PENALTIES_ROUND, N_PENALTIES_EQ_Q,
        N_OLYMPIC_FAMILIES, N_FAMILIES_EQ_Q,
        N_OFFICIALS_FOOTBALL, N_OFFICIALS_EQ_D1,
        N_TEAM_MIN, N_TEAM_MIN_EQ_D,
        N_TOURNAMENT_TEAMS, N_TOURNAMENT_TEAMS_EQ_N,
        N_TOURNAMENT_MATCHES, N_TOURNAMENT_MATCHES_EQ,
        N_ROUND_ROBIN_ROUNDS, N_RR_ROUNDS_EQ_V,
        ELO_K_DEFAULT, ELO_K_IN_RANGE,
        ELO_INPUTS, ELO_INPUTS_EQ_D1,
        N_VOLLEYBALL_MARGIN, N_VOLLEYBALL_MARGIN_EQ_D1,
        H_MAX_TOURNAMENT_BITS, H_MAX_TOURNAMENT_EQ,
        team_sports, individual_sports,
        sports_summary, print_sports_report,
    )


# ── Olympic medals ─────────────────────────────────────────────────────────────

def test_olympic_medals_eq_D():
    """Olympic medals = D = 3 [EXACT]."""
    from urt.sports_cathedral import N_OLYMPIC_MEDALS, N_MEDALS_EQ_D
    from urt.shell_closure import D
    assert N_OLYMPIC_MEDALS == D
    assert N_OLYMPIC_MEDALS == 3
    assert N_MEDALS_EQ_D is True


def test_olympic_medals_is_int():
    from urt.sports_cathedral import N_OLYMPIC_MEDALS
    assert isinstance(N_OLYMPIC_MEDALS, int)


# ── Triathlon ──────────────────────────────────────────────────────────────────

def test_triathlon_disciplines_eq_D():
    """Triathlon disciplines = D = 3 [EXACT]."""
    from urt.sports_cathedral import N_TRIATHLON_DISCIPLINES, N_TRIATHLON_EQ_D
    from urt.shell_closure import D
    assert N_TRIATHLON_DISCIPLINES == D
    assert N_TRIATHLON_DISCIPLINES == 3
    assert N_TRIATHLON_EQ_D is True


# ── Cricket ───────────────────────────────────────────────────────────────────

def test_cricket_stumps_eq_D():
    """Cricket stumps per wicket = D = 3 [EXACT]."""
    from urt.sports_cathedral import N_CRICKET_STUMPS, N_STUMPS_EQ_D
    from urt.shell_closure import D
    assert N_CRICKET_STUMPS == D
    assert N_CRICKET_STUMPS == 3
    assert N_STUMPS_EQ_D is True


# ── Darts ─────────────────────────────────────────────────────────────────────

def test_darts_per_turn_eq_D():
    """Darts per turn = D = 3 [EXACT]."""
    from urt.sports_cathedral import N_DARTS_PER_TURN, N_DARTS_EQ_D
    from urt.shell_closure import D
    assert N_DARTS_PER_TURN == D
    assert N_DARTS_PER_TURN == 3
    assert N_DARTS_EQ_D is True


# ── Golf par ──────────────────────────────────────────────────────────────────

def test_par_D_eq_D():
    """Par-3 hole = D = 3 [EXACT]."""
    from urt.sports_cathedral import PAR_D, PAR_D_EQ_D
    from urt.shell_closure import D
    assert PAR_D == D
    assert PAR_D == 3
    assert PAR_D_EQ_D is True


def test_par_Q_eq_q():
    """Par-5 hole = q = 5 [EXACT]."""
    from urt.sports_cathedral import PAR_Q
    from urt.shell_closure import q
    assert PAR_Q == q
    assert PAR_Q == 5


# ── Tennis scoring ─────────────────────────────────────────────────────────────

def test_tennis_game_levels_eq_D1():
    """Tennis game levels = D+1 = 4 [EXACT]."""
    from urt.sports_cathedral import N_TENNIS_GAME_LEVELS, N_TENNIS_EQ_D1
    from urt.shell_closure import D
    assert N_TENNIS_GAME_LEVELS == D + 1
    assert N_TENNIS_GAME_LEVELS == 4
    assert N_TENNIS_EQ_D1 is True


# ── Basketball ─────────────────────────────────────────────────────────────────

def test_basketball_quarters_eq_D1():
    """Basketball quarters = D+1 = 4 [EXACT]."""
    from urt.sports_cathedral import N_BASKETBALL_QUARTERS, N_QUARTERS_EQ_D1
    from urt.shell_closure import D
    assert N_BASKETBALL_QUARTERS == D + 1
    assert N_BASKETBALL_QUARTERS == 4
    assert N_QUARTERS_EQ_D1 is True


# ── Relay ─────────────────────────────────────────────────────────────────────

def test_relay_legs_eq_D1():
    """4×100 m relay legs = D+1 = 4 [EXACT]."""
    from urt.sports_cathedral import N_RELAY_LEGS, N_RELAY_EQ_D1
    from urt.shell_closure import D
    assert N_RELAY_LEGS == D + 1
    assert N_RELAY_LEGS == 4
    assert N_RELAY_EQ_D1 is True


# ── Penalty shootout ───────────────────────────────────────────────────────────

def test_penalties_round_eq_q():
    """Penalty kicks per team = q = 5 [EXACT]."""
    from urt.sports_cathedral import N_PENALTIES_ROUND, N_PENALTIES_EQ_Q
    from urt.shell_closure import q
    assert N_PENALTIES_ROUND == q
    assert N_PENALTIES_ROUND == 5
    assert N_PENALTIES_EQ_Q is True


# ── Olympic families ───────────────────────────────────────────────────────────

def test_olympic_families_eq_q():
    """Olympic sport families ≈ q = 5 [APPROXIMATE]."""
    from urt.sports_cathedral import N_OLYMPIC_FAMILIES, N_FAMILIES_EQ_Q
    from urt.shell_closure import q
    assert N_OLYMPIC_FAMILIES == q
    assert N_OLYMPIC_FAMILIES == 5
    assert N_FAMILIES_EQ_Q is True


# ── Football officials ─────────────────────────────────────────────────────────

def test_officials_football_eq_D1():
    """Football officials ≈ D+1 = 4 [APPROXIMATE]."""
    from urt.sports_cathedral import N_OFFICIALS_FOOTBALL, N_OFFICIALS_EQ_D1
    from urt.shell_closure import D
    assert N_OFFICIALS_FOOTBALL == D + 1
    assert N_OFFICIALS_FOOTBALL == 4
    assert N_OFFICIALS_EQ_D1 is True


# ── Minimum team ──────────────────────────────────────────────────────────────

def test_team_min_eq_D():
    """Minimum non-trivial team = D = 3 [EXACT]."""
    from urt.sports_cathedral import N_TEAM_MIN, N_TEAM_MIN_EQ_D
    from urt.shell_closure import D
    assert N_TEAM_MIN == D
    assert N_TEAM_MIN == 3
    assert N_TEAM_MIN_EQ_D is True


# ── Tournament ─────────────────────────────────────────────────────────────────

def test_tournament_teams_eq_N():
    """Cathedral tournament teams = N = 13 [EXACT]."""
    from urt.sports_cathedral import N_TOURNAMENT_TEAMS, N_TOURNAMENT_TEAMS_EQ_N
    from urt.shell_closure import N
    assert N_TOURNAMENT_TEAMS == N
    assert N_TOURNAMENT_TEAMS == 13
    assert N_TOURNAMENT_TEAMS_EQ_N is True


def test_tournament_matches_eq_78():
    """Round-robin matches for 13 teams = 78 [EXACT]."""
    from urt.sports_cathedral import N_TOURNAMENT_MATCHES, N_TOURNAMENT_MATCHES_EQ
    assert N_TOURNAMENT_MATCHES == 78
    assert N_TOURNAMENT_MATCHES_EQ is True


def test_tournament_matches_formula():
    """N(N-1)/2 = 78 for N=13."""
    from urt.sports_cathedral import N_TOURNAMENT_TEAMS, N_TOURNAMENT_MATCHES
    n = N_TOURNAMENT_TEAMS
    assert n * (n - 1) // 2 == N_TOURNAMENT_MATCHES


# ── Round-robin rounds ─────────────────────────────────────────────────────────

def test_round_robin_rounds_eq_V():
    """Round-robin rounds = N-1 = 12 = V [EXACT]."""
    from urt.sports_cathedral import N_ROUND_ROBIN_ROUNDS, N_RR_ROUNDS_EQ_V
    from urt.shell_closure import V, N
    assert N_ROUND_ROBIN_ROUNDS == N - 1
    assert N_ROUND_ROBIN_ROUNDS == 12
    assert N_ROUND_ROBIN_ROUNDS == V
    assert N_RR_ROUNDS_EQ_V is True


# ── Elo ───────────────────────────────────────────────────────────────────────

def test_elo_k_default():
    """Elo K = q²-D = 22 [APPROXIMATE]."""
    from urt.sports_cathedral import ELO_K_DEFAULT
    from urt.shell_closure import q, D
    assert ELO_K_DEFAULT == q ** 2 - D
    assert ELO_K_DEFAULT == 22


def test_elo_k_in_typical_range():
    """Elo K is in typical range [20, 32] [APPROXIMATE]."""
    from urt.sports_cathedral import ELO_K_IN_RANGE
    assert ELO_K_IN_RANGE is True


def test_elo_inputs_eq_D1():
    """Elo probability function inputs = D-1 = 2 [EXACT]."""
    from urt.sports_cathedral import ELO_INPUTS, ELO_INPUTS_EQ_D1
    from urt.shell_closure import D
    assert ELO_INPUTS == D - 1
    assert ELO_INPUTS == 2
    assert ELO_INPUTS_EQ_D1 is True


# ── Volleyball margin ──────────────────────────────────────────────────────────

def test_volleyball_margin_eq_D1():
    """Volleyball set winning margin = D-1 = 2 [APPROXIMATE]."""
    from urt.sports_cathedral import N_VOLLEYBALL_MARGIN, N_VOLLEYBALL_MARGIN_EQ_D1
    from urt.shell_closure import D
    assert N_VOLLEYBALL_MARGIN == D - 1
    assert N_VOLLEYBALL_MARGIN == 2
    assert N_VOLLEYBALL_MARGIN_EQ_D1 is True


# ── Tournament entropy ─────────────────────────────────────────────────────────

def test_h_max_tournament_bits():
    """Max tournament entropy = log₂(13) [EXACT]."""
    from urt.sports_cathedral import H_MAX_TOURNAMENT_BITS, H_MAX_TOURNAMENT_EQ
    from urt.shell_closure import N
    assert abs(H_MAX_TOURNAMENT_BITS - log(N) / log(2)) < 1e-12
    assert 3.5 < H_MAX_TOURNAMENT_BITS < 4.0
    assert H_MAX_TOURNAMENT_EQ is True


def test_h_max_tournament_is_finite():
    from urt.sports_cathedral import H_MAX_TOURNAMENT_BITS
    assert isfinite(H_MAX_TOURNAMENT_BITS)


# ── Function: team_sports ──────────────────────────────────────────────────────

def test_team_sports_returns_dict():
    from urt.sports_cathedral import team_sports
    r = team_sports()
    assert isinstance(r, dict)


def test_team_sports_required_keys():
    from urt.sports_cathedral import team_sports
    r = team_sports()
    for key in ["n_team_min", "team_min_eq_D", "n_officials_football", "officials_eq_D1",
                "n_basketball_quarters", "quarters_eq_D1", "n_relay_legs", "relay_eq_D1",
                "n_penalties_round", "penalties_eq_q", "n_olympic_families", "families_eq_q",
                "n_tournament_teams", "tournament_eq_N", "n_tournament_matches",
                "tournament_matches_eq", "n_round_robin_rounds", "rr_rounds_eq_V"]:
        assert key in r, f"Missing key: {key}"


def test_team_sports_values():
    from urt.sports_cathedral import team_sports
    r = team_sports()
    assert r["n_team_min"] == 3
    assert r["team_min_eq_D"] is True
    assert r["n_officials_football"] == 4
    assert r["officials_eq_D1"] is True
    assert r["n_basketball_quarters"] == 4
    assert r["quarters_eq_D1"] is True
    assert r["n_relay_legs"] == 4
    assert r["relay_eq_D1"] is True
    assert r["n_penalties_round"] == 5
    assert r["penalties_eq_q"] is True
    assert r["n_olympic_families"] == 5
    assert r["families_eq_q"] is True
    assert r["n_tournament_teams"] == 13
    assert r["tournament_eq_N"] is True
    assert r["n_tournament_matches"] == 78
    assert r["tournament_matches_eq"] is True
    assert r["n_round_robin_rounds"] == 12
    assert r["rr_rounds_eq_V"] is True


# ── Function: individual_sports ───────────────────────────────────────────────

def test_individual_sports_returns_dict():
    from urt.sports_cathedral import individual_sports
    r = individual_sports()
    assert isinstance(r, dict)


def test_individual_sports_required_keys():
    from urt.sports_cathedral import individual_sports
    r = individual_sports()
    for key in ["n_olympic_medals", "medals_eq_D", "n_triathlon", "triathlon_eq_D",
                "n_cricket_stumps", "stumps_eq_D", "n_darts_per_turn", "darts_eq_D",
                "n_tennis_levels", "tennis_eq_D1", "par_D", "par_D_eq_D", "par_q",
                "elo_k", "elo_k_in_range", "elo_inputs", "elo_inputs_eq_D1",
                "h_max_bits", "h_max_eq", "n_volleyball_margin", "volleyball_margin_eq_D1"]:
        assert key in r, f"Missing key: {key}"


def test_individual_sports_values():
    from urt.sports_cathedral import individual_sports
    r = individual_sports()
    assert r["n_olympic_medals"] == 3
    assert r["medals_eq_D"] is True
    assert r["n_triathlon"] == 3
    assert r["triathlon_eq_D"] is True
    assert r["n_cricket_stumps"] == 3
    assert r["stumps_eq_D"] is True
    assert r["n_darts_per_turn"] == 3
    assert r["darts_eq_D"] is True
    assert r["n_tennis_levels"] == 4
    assert r["tennis_eq_D1"] is True
    assert r["par_D"] == 3
    assert r["par_D_eq_D"] is True
    assert r["par_q"] == 5
    assert r["elo_k"] == 22
    assert r["elo_k_in_range"] is True
    assert r["elo_inputs"] == 2
    assert r["elo_inputs_eq_D1"] is True
    assert r["h_max_eq"] is True
    assert r["n_volleyball_margin"] == 2
    assert r["volleyball_margin_eq_D1"] is True


# ── Function: sports_summary ──────────────────────────────────────────────────

def test_sports_summary_returns_dict():
    from urt.sports_cathedral import sports_summary
    r = sports_summary()
    assert isinstance(r, dict)


def test_sports_summary_required_keys():
    from urt.sports_cathedral import sports_summary
    r = sports_summary()
    assert "team_sports" in r
    assert "individual_sports" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r


def test_sports_summary_key_exact_results_count():
    from urt.sports_cathedral import sports_summary
    r = sports_summary()
    assert len(r["KEY_EXACT_RESULTS"]) >= 8


def test_sports_summary_key_exact_results_type():
    from urt.sports_cathedral import sports_summary
    r = sports_summary()
    assert all(isinstance(s, str) for s in r["KEY_EXACT_RESULTS"])


def test_sports_summary_scalar_fields():
    from urt.sports_cathedral import sports_summary
    from urt.shell_closure import DELTA_STAR, N, D
    r = sports_summary()
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-12
    assert r["N"] == N
    assert r["D"] == D


def test_sports_summary_sub_dicts_are_dicts():
    from urt.sports_cathedral import sports_summary
    r = sports_summary()
    assert isinstance(r["team_sports"], dict)
    assert isinstance(r["individual_sports"], dict)


# ── Cross-module consistency ───────────────────────────────────────────────────

def test_medals_stumps_darts_triathlon_all_D():
    """Medals, stumps, darts, triathlon are all D=3."""
    from urt.sports_cathedral import (
        N_OLYMPIC_MEDALS, N_CRICKET_STUMPS,
        N_DARTS_PER_TURN, N_TRIATHLON_DISCIPLINES
    )
    assert N_OLYMPIC_MEDALS == N_CRICKET_STUMPS == N_DARTS_PER_TURN == N_TRIATHLON_DISCIPLINES == 3


def test_quarters_relay_tennis_officials_all_D1():
    """Quarters, relay legs, tennis levels, officials are all D+1=4."""
    from urt.sports_cathedral import (
        N_BASKETBALL_QUARTERS, N_RELAY_LEGS,
        N_TENNIS_GAME_LEVELS, N_OFFICIALS_FOOTBALL
    )
    assert N_BASKETBALL_QUARTERS == N_RELAY_LEGS == N_TENNIS_GAME_LEVELS == N_OFFICIALS_FOOTBALL == 4


def test_penalties_families_both_q():
    """Penalties per team and Olympic families are both q=5."""
    from urt.sports_cathedral import N_PENALTIES_ROUND, N_OLYMPIC_FAMILIES
    assert N_PENALTIES_ROUND == N_OLYMPIC_FAMILIES == 5


def test_elo_volleyball_margin_both_D1():
    """Elo inputs and volleyball margin are both D-1=2."""
    from urt.sports_cathedral import ELO_INPUTS, N_VOLLEYBALL_MARGIN
    assert ELO_INPUTS == N_VOLLEYBALL_MARGIN == 2


def test_h_max_tournament_matches_h_max_icos():
    """Tournament entropy matches ecological H_MAX for N=13."""
    from urt.sports_cathedral import H_MAX_TOURNAMENT_BITS
    assert abs(H_MAX_TOURNAMENT_BITS - log(13) / log(2)) < 1e-12


# ── Print function ─────────────────────────────────────────────────────────────

def test_print_sports_report(capsys):
    from urt.sports_cathedral import print_sports_report
    print_sports_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "D" in out


def test_print_sports_report_contains_tournaments(capsys):
    from urt.sports_cathedral import print_sports_report
    print_sports_report()
    out = capsys.readouterr().out
    assert "78" in out or "tournament" in out.lower() or "Tournament" in out


def test_print_sports_report_contains_medals(capsys):
    from urt.sports_cathedral import print_sports_report
    print_sports_report()
    out = capsys.readouterr().out
    assert "medal" in out.lower() or "gold" in out.lower() or "Olympic" in out
