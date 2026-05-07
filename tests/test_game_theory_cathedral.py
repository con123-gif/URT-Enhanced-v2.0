"""Tests for urt/game_theory_cathedral.py — Game theory equilibria and δ★."""

import pytest
from math import isfinite, isclose


# ── Imports ───────────────────────────────────────────────────────────────────

def test_module_imports():
    from urt.game_theory_cathedral import (
        N_RPS_STRATEGIES, RPS_NASH_PROB, RPS_NASH_PROB_EQ_1_OVER_D,
        RPS_IS_ZERO_SUM, RPS_MINIMAX_VALUE,
        T_PD, R_PD, P_PD, S_PD,
        PD_RANKING_OK, PD_SOCIAL_OPT_OK,
        DELTA_MIN_COOP_GRIM, DELTA_MIN_COOP_TFT, COOP_THRESHOLD_D,
        NASH_THEOREM_N_MIN, N_PLAYERS_2,
        SHAPLEY_UNIFORM_N13, POA_ROUTING_BOUND,
        REPLICATOR_MUTATION_RATE, ESS_RPS_PROB,
        COORD_THRESHOLD_ICOS, COORD_THRESHOLD_EQ_1_N,
        rock_paper_scissors, prisoners_dilemma,
        evolutionary_dynamics, shapley_n13,
        game_theory_summary, print_game_theory_report,
    )


# ── Rock-Paper-Scissors ───────────────────────────────────────────────────────

def test_rps_strategies_equals_D():
    """RPS has D = 3 strategies (EXACT)."""
    from urt.game_theory_cathedral import N_RPS_STRATEGIES
    from urt.shell_closure import D
    assert N_RPS_STRATEGIES == D
    assert N_RPS_STRATEGIES == 3


def test_rps_nash_prob_equals_1_over_D():
    """RPS Nash probability = 1/D = 1/3 (EXACT)."""
    from urt.game_theory_cathedral import RPS_NASH_PROB, RPS_NASH_PROB_EQ_1_OVER_D
    from urt.shell_closure import D
    assert abs(RPS_NASH_PROB - 1.0 / D) < 1e-12
    assert abs(RPS_NASH_PROB - 1.0 / 3.0) < 1e-12
    assert RPS_NASH_PROB_EQ_1_OVER_D is True


def test_rps_nash_probs_sum_to_1():
    """3 equal Nash probabilities sum to 1."""
    from urt.game_theory_cathedral import RPS_NASH_PROB, N_RPS_STRATEGIES
    assert abs(N_RPS_STRATEGIES * RPS_NASH_PROB - 1.0) < 1e-12


def test_rps_is_zero_sum():
    """RPS is a zero-sum game."""
    from urt.game_theory_cathedral import RPS_IS_ZERO_SUM, RPS_MINIMAX_VALUE
    assert RPS_IS_ZERO_SUM is True
    assert RPS_MINIMAX_VALUE == 0.0


def test_rps_function():
    from urt.game_theory_cathedral import rock_paper_scissors
    from urt.shell_closure import D
    r = rock_paper_scissors()
    assert r["n_strategies"] == D
    assert r["n_strategies_eq_D"] is True
    assert abs(r["nash_prob"] - 1.0/D) < 1e-6
    assert r["is_zero_sum"] is True
    assert r["minimax_value"] == 0.0
    assert r["unique_nash"] is True
    assert "EXACT" in r["status"]


# ── Prisoner's Dilemma ────────────────────────────────────────────────────────

def test_pd_T_equals_q():
    """PD Temptation T = q = 5."""
    from urt.game_theory_cathedral import T_PD
    from urt.shell_closure import q
    assert T_PD == float(q)
    assert T_PD == 5.0


def test_pd_R_equals_D():
    """PD Reward R = D = 3."""
    from urt.game_theory_cathedral import R_PD
    from urt.shell_closure import D
    assert R_PD == float(D)
    assert R_PD == 3.0


def test_pd_ranking_ok():
    """PD payoffs satisfy T > R > P > S."""
    from urt.game_theory_cathedral import PD_RANKING_OK
    assert PD_RANKING_OK is True


def test_pd_social_optimality():
    """2R > T + S (socially efficient to cooperate)."""
    from urt.game_theory_cathedral import PD_SOCIAL_OPT_OK
    assert PD_SOCIAL_OPT_OK is True


def test_delta_min_coop_grim():
    """δ_min (grim trigger) = (T−R)/(T−P) = 2/4 = 0.5."""
    from urt.game_theory_cathedral import DELTA_MIN_COOP_GRIM, T_PD, R_PD, P_PD
    expected = (T_PD - R_PD) / (T_PD - P_PD)
    assert abs(DELTA_MIN_COOP_GRIM - expected) < 1e-10
    assert abs(DELTA_MIN_COOP_GRIM - 0.5) < 1e-10


def test_coop_threshold_D_formula():
    """Cathedral cooperation threshold = (D−1)/D = 2/3."""
    from urt.game_theory_cathedral import COOP_THRESHOLD_D
    from urt.shell_closure import D
    expected = (D - 1) / float(D)
    assert abs(COOP_THRESHOLD_D - expected) < 1e-10
    assert abs(COOP_THRESHOLD_D - 2.0/3.0) < 1e-10


def test_coop_threshold_in_unit_interval():
    """Cooperation threshold is in (0, 1)."""
    from urt.game_theory_cathedral import COOP_THRESHOLD_D, DELTA_MIN_COOP_GRIM
    assert 0 < COOP_THRESHOLD_D < 1
    assert 0 < DELTA_MIN_COOP_GRIM < 1


def test_prisoners_dilemma_function():
    from urt.game_theory_cathedral import prisoners_dilemma
    from urt.shell_closure import q, D
    r = prisoners_dilemma()
    assert r["T_eq_q"] is True
    assert r["R_eq_D"] is True
    assert r["pd_ranking_ok"] is True
    assert r["social_opt_ok"] is True
    assert "APPROXIMATE" in r["status"]


# ── Evolutionary dynamics ─────────────────────────────────────────────────────

def test_ess_rps_equals_1_over_D():
    """ESS for RPS = uniform = 1/D (EXACT)."""
    from urt.game_theory_cathedral import ESS_RPS_PROB
    from urt.shell_closure import D
    assert abs(ESS_RPS_PROB - 1.0/D) < 1e-12


def test_replicator_mutation_rate_is_delta_star():
    """Replicator mutation rate = δ★ (speculative)."""
    from urt.game_theory_cathedral import REPLICATOR_MUTATION_RATE
    from urt.shell_closure import DELTA_STAR
    assert abs(REPLICATOR_MUTATION_RATE - DELTA_STAR) < 1e-12


def test_evolutionary_function():
    from urt.game_theory_cathedral import evolutionary_dynamics
    from urt.shell_closure import D
    r = evolutionary_dynamics()
    assert abs(r["ESS_RPS_prob"] - 1.0/D) < 1e-6
    assert r["n_strategies"] == D
    assert "SPECULATIVE" in r["status"]
    # Interior fixed point should be (1/D, 1/D, 1/D)
    fp = r["interior_fixed_point"]
    assert len(fp) == D
    assert abs(fp[0] - 1.0/D) < 1e-3


# ── Shapley / N=13 game ───────────────────────────────────────────────────────

def test_shapley_uniform_N13():
    """Symmetric Shapley value = 1/N = 1/13."""
    from urt.game_theory_cathedral import SHAPLEY_UNIFORM_N13
    from urt.shell_closure import N
    assert abs(SHAPLEY_UNIFORM_N13 - 1.0/N) < 1e-12


def test_coord_threshold_eq_1_over_N():
    """Icosahedral coordination threshold = 1/N (EXACT: V+1=N)."""
    from urt.game_theory_cathedral import COORD_THRESHOLD_ICOS, COORD_THRESHOLD_EQ_1_N
    from urt.shell_closure import N, V
    assert abs(COORD_THRESHOLD_ICOS - 1.0/N) < 1e-12
    assert COORD_THRESHOLD_EQ_1_N is True
    assert V + 1 == N   # 12 + 1 = 13


def test_shapley_n13_function():
    from urt.game_theory_cathedral import shapley_n13
    from urt.shell_closure import N, V
    r = shapley_n13()
    assert r["n_players"] == N
    assert abs(r["shapley_per_player"] - 1.0/N) < 1e-6
    assert r["V_plus_1_eq_N"] is True
    assert r["V_value"] == V
    assert "EXACT" in r["status"]


# ── Price of Anarchy ──────────────────────────────────────────────────────────

def test_price_of_anarchy_equals_D():
    """PoA ≤ D = 3 for routing games with polynomial latency."""
    from urt.game_theory_cathedral import POA_ROUTING_BOUND
    from urt.shell_closure import D
    assert POA_ROUTING_BOUND == float(D)
    assert POA_ROUTING_BOUND == 3.0


def test_n_players_2():
    """Standard 2-player game count = D−1 = 2."""
    from urt.game_theory_cathedral import N_PLAYERS_2
    from urt.shell_closure import D
    assert N_PLAYERS_2 == D - 1
    assert N_PLAYERS_2 == 2


# ── Summary / report ──────────────────────────────────────────────────────────

def test_game_theory_summary_structure():
    from urt.game_theory_cathedral import game_theory_summary
    r = game_theory_summary()
    assert "rps" in r
    assert "prisoners_dilemma" in r
    assert "evolutionary" in r
    assert "shapley_n13" in r
    assert "key_results" in r
    assert "cathedral_integers" in r


def test_game_theory_summary_integers():
    from urt.game_theory_cathedral import game_theory_summary
    from urt.shell_closure import D, N, q, V
    r = game_theory_summary()
    ci = r["cathedral_integers"]
    assert ci["D"] == D
    assert ci["N"] == N
    assert ci["q"] == q
    assert ci["V"] == V


def test_print_game_theory_report(capsys):
    from urt.game_theory_cathedral import print_game_theory_report
    print_game_theory_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "CATHEDRAL GAME THEORY" in out
    assert "Rock" in out or "RPS" in out
    assert "13" in out
