"""Tests for urt/social_networks_cathedral.py — Social networks and Cathedral integers."""

import pytest
from math import isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.social_networks_cathedral import (
        N_DUNBAR_LAYERS,
        DUNBAR_INNER,
        DUNBAR_SYMPATHY,
        DUNBAR_BAND,
        DUNBAR_NUMBER,
        DUNBAR_NUMBER_APPROX_2G_PHI,
        SMALL_WORLD_K,
        SMALL_WORLD_REWIRE_P,
        N_POWER_LAW_MIN_DEGREE,
        SCALE_FREE_GAMMA,
        TRIADIC_CLOSURE_MIN,
        CLUSTERING_COEFF_COMPLETE,
        N_SIX_DEGREES,
        COMMUNITY_SIZES_DUNBAR,
        ICOS_NETWORK_NODES,
        ICOS_NETWORK_EDGES,
        ICOS_AVG_DEGREE,
        ICOS_AVG_DEGREE_EXACT,
        ZIPF_EXPONENT,
        PARETO_80_20_RATIO,
        PERCOLATION_THRESHOLD_SF,
        R0_THRESHOLD,
        R0_ICOS,
        CASCADE_DEPTH,
        NETWORK_MAX_ENTROPY_BITS,
        dunbar_layers,
        small_world_network,
        scale_free_network,
        social_networks_summary,
        print_social_networks_report,
    )


# ── Dunbar layers ──────────────────────────────────────────────────────────────

def test_dunbar_layers_eq_D_plus_1():
    """Dunbar layers = D+1 = 4  [EXACT]."""
    from urt.social_networks_cathedral import N_DUNBAR_LAYERS
    from urt.shell_closure import D
    assert N_DUNBAR_LAYERS == D + 1
    assert N_DUNBAR_LAYERS == 4


def test_dunbar_inner_eq_q():
    """Innermost Dunbar clique = q = 5  [EXACT]."""
    from urt.social_networks_cathedral import DUNBAR_INNER
    from urt.shell_closure import q
    assert DUNBAR_INNER == q
    assert DUNBAR_INNER == 5


def test_dunbar_sympathy_eq_V_plus_D():
    """Sympathy group = V+D = 15  [APPROXIMATE]."""
    from urt.social_networks_cathedral import DUNBAR_SYMPATHY
    from urt.shell_closure import V, D
    assert DUNBAR_SYMPATHY == V + D
    assert DUNBAR_SYMPATHY == 15


def test_dunbar_band_eq_50():
    """Active network ≈ 50."""
    from urt.social_networks_cathedral import DUNBAR_BAND
    assert DUNBAR_BAND == 50


def test_dunbar_number_eq_150():
    """Dunbar's number = 150."""
    from urt.social_networks_cathedral import DUNBAR_NUMBER
    assert DUNBAR_NUMBER == 150


def test_community_sizes_dunbar():
    """Community sizes are [5, 15, 50, 150]."""
    from urt.social_networks_cathedral import COMMUNITY_SIZES_DUNBAR
    assert COMMUNITY_SIZES_DUNBAR[0] == 5
    assert COMMUNITY_SIZES_DUNBAR[1] == 15
    assert COMMUNITY_SIZES_DUNBAR[2] == 50
    assert COMMUNITY_SIZES_DUNBAR[3] == 150
    assert len(COMMUNITY_SIZES_DUNBAR) == 4


def test_community_sizes_ascending():
    """Dunbar community sizes are ordered."""
    from urt.social_networks_cathedral import COMMUNITY_SIZES_DUNBAR
    for i in range(len(COMMUNITY_SIZES_DUNBAR) - 1):
        assert COMMUNITY_SIZES_DUNBAR[i] < COMMUNITY_SIZES_DUNBAR[i + 1]


# ── Small-world network ───────────────────────────────────────────────────────

def test_small_world_k_eq_V():
    """Small-world degree = V = 12  [EXACT]."""
    from urt.social_networks_cathedral import SMALL_WORLD_K
    from urt.shell_closure import V
    assert SMALL_WORLD_K == V
    assert SMALL_WORLD_K == 12


def test_small_world_rewire_eq_delta():
    """Rewiring probability = δ★."""
    from urt.social_networks_cathedral import SMALL_WORLD_REWIRE_P
    from urt.shell_closure import DELTA_STAR
    assert abs(SMALL_WORLD_REWIRE_P - DELTA_STAR) < 1e-12


def test_six_degrees_eq_V_over_2():
    """Six degrees of separation = V/2 = 6  [EXACT]."""
    from urt.social_networks_cathedral import N_SIX_DEGREES
    from urt.shell_closure import V
    assert N_SIX_DEGREES == V // 2
    assert N_SIX_DEGREES == 6


# ── Scale-free network ────────────────────────────────────────────────────────

def test_scale_free_gamma_eq_D():
    """BA scale-free exponent γ = D = 3  [EXACT]."""
    from urt.social_networks_cathedral import SCALE_FREE_GAMMA
    from urt.shell_closure import D
    assert SCALE_FREE_GAMMA == D
    assert SCALE_FREE_GAMMA == 3


def test_min_degree_eq_D():
    """BA model minimum degree = D = 3."""
    from urt.social_networks_cathedral import N_POWER_LAW_MIN_DEGREE
    from urt.shell_closure import D
    assert N_POWER_LAW_MIN_DEGREE == D


def test_triadic_closure_eq_D():
    """Triadic closure minimum = D = 3  [EXACT]."""
    from urt.social_networks_cathedral import TRIADIC_CLOSURE_MIN
    from urt.shell_closure import D
    assert TRIADIC_CLOSURE_MIN == D
    assert TRIADIC_CLOSURE_MIN == 3


def test_clustering_coeff_complete():
    """Clustering coefficient of complete graph = 1.0."""
    from urt.social_networks_cathedral import CLUSTERING_COEFF_COMPLETE
    assert abs(CLUSTERING_COEFF_COMPLETE - 1.0) < 1e-12


# ── Icosahedral network ───────────────────────────────────────────────────────

def test_icos_nodes_eq_N():
    """Icosahedral network nodes = N = 13  [EXACT]."""
    from urt.social_networks_cathedral import ICOS_NETWORK_NODES
    from urt.shell_closure import N
    assert ICOS_NETWORK_NODES == N
    assert ICOS_NETWORK_NODES == 13


def test_icos_edges_eq_E():
    """Icosahedral network edges = E = 30  [EXACT]."""
    from urt.social_networks_cathedral import ICOS_NETWORK_EDGES
    from urt.shell_closure import E
    assert ICOS_NETWORK_EDGES == E
    assert ICOS_NETWORK_EDGES == 30


def test_icos_avg_degree_integer():
    """Icosahedral average degree (integer part) = 2E//N = 4."""
    from urt.social_networks_cathedral import ICOS_AVG_DEGREE
    from urt.shell_closure import E, N
    assert ICOS_AVG_DEGREE == 2 * E // N
    assert ICOS_AVG_DEGREE == 4


def test_icos_avg_degree_exact():
    """Exact average degree 2E/N = 60/13 ≈ 4.615."""
    from urt.social_networks_cathedral import ICOS_AVG_DEGREE_EXACT
    from urt.shell_closure import E, N
    expected = 2.0 * E / N
    assert abs(ICOS_AVG_DEGREE_EXACT - expected) < 1e-10
    assert 4.0 < ICOS_AVG_DEGREE_EXACT < 5.0


# ── Zipf and Pareto ───────────────────────────────────────────────────────────

def test_zipf_exponent():
    """Zipf exponent = 1.0  [empirical]."""
    from urt.social_networks_cathedral import ZIPF_EXPONENT
    assert abs(ZIPF_EXPONENT - 1.0) < 1e-12


def test_pareto_ratio():
    """Pareto 80/20 ratio = D-1 = 2."""
    from urt.social_networks_cathedral import PARETO_80_20_RATIO
    from urt.shell_closure import D
    assert PARETO_80_20_RATIO == D - 1
    assert PARETO_80_20_RATIO == 2


# ── Percolation and epidemics ─────────────────────────────────────────────────

def test_percolation_threshold():
    """Scale-free percolation threshold = 1/D."""
    from urt.social_networks_cathedral import PERCOLATION_THRESHOLD_SF
    from urt.shell_closure import D
    assert abs(PERCOLATION_THRESHOLD_SF - 1.0 / D) < 1e-12
    assert abs(PERCOLATION_THRESHOLD_SF - 1.0 / 3.0) < 1e-10


def test_r0_threshold():
    """Epidemic R₀ threshold = 1.0."""
    from urt.social_networks_cathedral import R0_THRESHOLD
    assert abs(R0_THRESHOLD - 1.0) < 1e-12


def test_r0_icos():
    """Icosahedral R₀ = V/D = 4.0."""
    from urt.social_networks_cathedral import R0_ICOS
    from urt.shell_closure import V, D
    assert abs(R0_ICOS - float(V) / float(D)) < 1e-12
    assert abs(R0_ICOS - 4.0) < 1e-10


# ── Network entropy ───────────────────────────────────────────────────────────

def test_network_entropy():
    """Max entropy of N=13 network = log₂(13) ≈ 3.7 bits."""
    from urt.social_networks_cathedral import NETWORK_MAX_ENTROPY_BITS
    from math import log
    from urt.shell_closure import N
    expected = log(N) / log(2)
    assert abs(NETWORK_MAX_ENTROPY_BITS - expected) < 1e-10
    assert 3.0 < NETWORK_MAX_ENTROPY_BITS < 4.5


# ── dunbar_layers() function ──────────────────────────────────────────────────

def test_dunbar_layers_returns_dict():
    from urt.social_networks_cathedral import dunbar_layers
    r = dunbar_layers()
    assert isinstance(r, dict)


def test_dunbar_layers_inner_eq_q():
    from urt.social_networks_cathedral import dunbar_layers
    from urt.shell_closure import q
    r = dunbar_layers()
    assert r["inner"] == q
    assert r["inner_eq_q"] is True


def test_dunbar_layers_layers_eq_D1():
    from urt.social_networks_cathedral import dunbar_layers
    from urt.shell_closure import D
    r = dunbar_layers()
    assert r["layers"] == D + 1
    assert r["layers_eq_D1"] is True


def test_dunbar_layers_sympathy():
    from urt.social_networks_cathedral import dunbar_layers
    r = dunbar_layers()
    assert r["sympathy"] == 15
    assert r["sympathy_eq_VpD"] is True


def test_dunbar_layers_band():
    from urt.social_networks_cathedral import dunbar_layers
    r = dunbar_layers()
    assert r["band"] == 50
    assert r["band_eq_50"] is True


def test_dunbar_layers_community_sizes():
    from urt.social_networks_cathedral import dunbar_layers
    r = dunbar_layers()
    assert r["community_sizes"] == [5, 15, 50, 150]


# ── small_world_network() function ───────────────────────────────────────────

def test_small_world_returns_dict():
    from urt.social_networks_cathedral import small_world_network
    r = small_world_network()
    assert isinstance(r, dict)


def test_small_world_degree_eq_V():
    from urt.social_networks_cathedral import small_world_network
    from urt.shell_closure import V
    r = small_world_network()
    assert r["degree"] == V
    assert r["degree_eq_V"] is True


def test_small_world_six_deg_eq_V2():
    from urt.social_networks_cathedral import small_world_network
    from urt.shell_closure import V
    r = small_world_network()
    assert r["six_degrees"] == V // 2
    assert r["six_deg_eq_V2"] is True


def test_small_world_icos_nodes():
    from urt.social_networks_cathedral import small_world_network
    from urt.shell_closure import N
    r = small_world_network()
    assert r["icos_nodes"] == N


def test_small_world_icos_edges():
    from urt.social_networks_cathedral import small_world_network
    from urt.shell_closure import E
    r = small_world_network()
    assert r["icos_edges"] == E


# ── scale_free_network() function ────────────────────────────────────────────

def test_scale_free_returns_dict():
    from urt.social_networks_cathedral import scale_free_network
    r = scale_free_network()
    assert isinstance(r, dict)


def test_scale_free_gamma_eq_D_flag():
    from urt.social_networks_cathedral import scale_free_network
    from urt.shell_closure import D
    r = scale_free_network()
    assert r["gamma"] == D
    assert r["gamma_eq_D"] is True


def test_scale_free_triadic_eq_D():
    from urt.social_networks_cathedral import scale_free_network
    from urt.shell_closure import D
    r = scale_free_network()
    assert r["triadic_min"] == D
    assert r["triadic_eq_D"] is True


def test_scale_free_zipf():
    from urt.social_networks_cathedral import scale_free_network
    r = scale_free_network()
    assert abs(r["zipf_exp"] - 1.0) < 1e-12


# ── social_networks_summary() function ───────────────────────────────────────

def test_summary_returns_dict():
    from urt.social_networks_cathedral import social_networks_summary
    s = social_networks_summary()
    assert isinstance(s, dict)


def test_summary_has_dunbar_key():
    from urt.social_networks_cathedral import social_networks_summary
    s = social_networks_summary()
    assert "dunbar" in s


def test_summary_has_networks_key():
    from urt.social_networks_cathedral import social_networks_summary
    s = social_networks_summary()
    assert "networks" in s


def test_summary_has_key_results():
    from urt.social_networks_cathedral import social_networks_summary
    s = social_networks_summary()
    assert "key_results" in s
    assert isinstance(s["key_results"], list)
    assert len(s["key_results"]) >= 5


def test_summary_key_results_contain_EXACT():
    from urt.social_networks_cathedral import social_networks_summary
    s = social_networks_summary()
    exact_count = sum(1 for r in s["key_results"] if "EXACT" in r)
    assert exact_count >= 3


def test_summary_delta_star():
    from urt.social_networks_cathedral import social_networks_summary
    from urt.shell_closure import DELTA_STAR
    s = social_networks_summary()
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12


# ── print_social_networks_report() ───────────────────────────────────────────

def test_print_report_runs(capsys):
    from urt.social_networks_cathedral import print_social_networks_report
    print_social_networks_report()
    captured = capsys.readouterr()
    assert "SOCIAL" in captured.out or "social" in captured.out.lower()
    assert "EXACT" in captured.out


def test_print_report_contains_dunbar(capsys):
    from urt.social_networks_cathedral import print_social_networks_report
    print_social_networks_report()
    captured = capsys.readouterr()
    assert "Dunbar" in captured.out or "dunbar" in captured.out.lower()


def test_print_report_contains_six_degrees(capsys):
    from urt.social_networks_cathedral import print_social_networks_report
    print_social_networks_report()
    captured = capsys.readouterr()
    assert "6" in captured.out or "six" in captured.out.lower() or "degrees" in captured.out.lower()
