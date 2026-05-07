"""Tests for urt/network_science_cathedral.py — Cathedral network science."""

import pytest
from math import log

# ── Module-level constant tests ────────────────────────────────────────────────

def test_scale_free_exponent():
    from urt.network_science_cathedral import SCALE_FREE_EXPONENT
    assert SCALE_FREE_EXPONENT == 3

def test_sf_eq_D():
    from urt.network_science_cathedral import SF_EQ_D
    assert SF_EQ_D is True

def test_ba_new_links():
    from urt.network_science_cathedral import BA_NEW_LINKS
    assert BA_NEW_LINKS == 3

def test_ba_eq_D():
    from urt.network_science_cathedral import BA_EQ_D
    assert BA_EQ_D is True

def test_icos_network_nodes():
    from urt.network_science_cathedral import ICOS_NETWORK_NODES
    assert ICOS_NETWORK_NODES == 13

def test_icos_network_edges():
    from urt.network_science_cathedral import ICOS_NETWORK_EDGES
    assert ICOS_NETWORK_EDGES == 30

def test_icos_network_eq_N():
    from urt.network_science_cathedral import ICOS_NETWORK_EQ_N
    assert ICOS_NETWORK_EQ_N is True

def test_betweenness_pairs():
    from urt.network_science_cathedral import BETWEENNESS_PAIRS
    # N=13: 13*12//2 = 78
    assert BETWEENNESS_PAIRS == 78

def test_betweenness_eq_78():
    from urt.network_science_cathedral import BETWEENNESS_EQ_78
    assert BETWEENNESS_EQ_78 is True

def test_icos_clustering():
    from urt.network_science_cathedral import ICOS_CLUSTERING
    # 2*30 / (13*12) = 60/156
    expected = 60.0 / 156.0
    assert abs(ICOS_CLUSTERING - expected) < 1e-10

def test_icos_mean_degree():
    from urt.network_science_cathedral import ICOS_MEAN_DEGREE
    # 2*30/13 = 60/13
    expected = 60.0 / 13.0
    assert abs(ICOS_MEAN_DEGREE - expected) < 1e-10

def test_icos_graph_diameter():
    from urt.network_science_cathedral import ICOS_GRAPH_DIAMETER
    assert ICOS_GRAPH_DIAMETER == 3

def test_diam_eq_D():
    from urt.network_science_cathedral import DIAM_EQ_D
    assert DIAM_EQ_D is True

def test_chromatic_planar():
    from urt.network_science_cathedral import CHROMATIC_PLANAR
    assert CHROMATIC_PLANAR == 4

def test_chromatic_eq_D1():
    from urt.network_science_cathedral import CHROMATIC_EQ_D1
    assert CHROMATIC_EQ_D1 is True

def test_icos_chromatic():
    from urt.network_science_cathedral import ICOS_CHROMATIC
    assert ICOS_CHROMATIC == 4

def test_icos_chromatic_eq_D1():
    from urt.network_science_cathedral import ICOS_CHROMATIC_EQ_D1
    assert ICOS_CHROMATIC_EQ_D1 is True

def test_n_triadic_nodes():
    from urt.network_science_cathedral import N_TRIADIC_NODES
    assert N_TRIADIC_NODES == 3

def test_triad_eq_D():
    from urt.network_science_cathedral import TRIAD_EQ_D
    assert TRIAD_EQ_D is True

def test_ws_mean_degree():
    from urt.network_science_cathedral import WS_MEAN_DEGREE
    assert WS_MEAN_DEGREE == 5

def test_ws_degree_eq_q():
    from urt.network_science_cathedral import WS_DEGREE_EQ_Q
    assert WS_DEGREE_EQ_Q is True

def test_ws_ring_nodes():
    from urt.network_science_cathedral import WS_RING_NODES
    assert WS_RING_NODES == 13

def test_ws_ring_eq_N():
    from urt.network_science_cathedral import WS_RING_EQ_N
    assert WS_RING_EQ_N is True

def test_percolation_threshold_q():
    from urt.network_science_cathedral import PERCOLATION_THRESHOLD_Q
    assert abs(PERCOLATION_THRESHOLD_Q - 0.2) < 1e-10

def test_percolation_threshold_N():
    from urt.network_science_cathedral import PERCOLATION_THRESHOLD_N
    assert abs(PERCOLATION_THRESHOLD_N - 1.0 / 13.0) < 1e-10

def test_n_min_communities():
    from urt.network_science_cathedral import N_MIN_COMMUNITIES
    assert N_MIN_COMMUNITIES == 3

def test_communities_eq_D():
    from urt.network_science_cathedral import COMMUNITIES_EQ_D
    assert COMMUNITIES_EQ_D is True

def test_n_motif_min_nodes():
    from urt.network_science_cathedral import N_MOTIF_MIN_NODES
    assert N_MOTIF_MIN_NODES == 3

def test_motif_eq_D():
    from urt.network_science_cathedral import MOTIF_EQ_D
    assert MOTIF_EQ_D is True

def test_n_3node_motif_types():
    from urt.network_science_cathedral import N_3NODE_MOTIF_TYPES
    assert N_3NODE_MOTIF_TYPES == 13

def test_motif_types_eq_N():
    from urt.network_science_cathedral import MOTIF_TYPES_EQ_N
    assert MOTIF_TYPES_EQ_N is True

def test_laplacian_dim():
    from urt.network_science_cathedral import LAPLACIAN_DIM
    assert LAPLACIAN_DIM == 13

def test_laplacian_eq_N():
    from urt.network_science_cathedral import LAPLACIAN_EQ_N
    assert LAPLACIAN_EQ_N is True

def test_icos_spectral_gap():
    from urt.network_science_cathedral import ICOS_SPECTRAL_GAP
    assert ICOS_SPECTRAL_GAP == 3

def test_spectral_gap_eq_D():
    from urt.network_science_cathedral import SPECTRAL_GAP_EQ_D
    assert SPECTRAL_GAP_EQ_D is True

def test_er_connectivity_threshold():
    from urt.network_science_cathedral import ER_CONNECTIVITY_THRESHOLD
    expected = log(13) / 13
    assert abs(ER_CONNECTIVITY_THRESHOLD - expected) < 1e-12

def test_dunbar_approx():
    from urt.network_science_cathedral import DUNBAR_CATHEDRAL_APPROX
    assert DUNBAR_CATHEDRAL_APPROX == 13 * 5 * 3  # = 195

def test_delta_star_value():
    from urt.network_science_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

# ── Function tests ─────────────────────────────────────────────────────────────

def test_scale_free_networks_returns_dict():
    from urt.network_science_cathedral import scale_free_networks
    assert isinstance(scale_free_networks(), dict)

def test_scale_free_networks_keys():
    from urt.network_science_cathedral import scale_free_networks
    r = scale_free_networks()
    for key in ["scale_free_exp", "sf_eq_D", "ba_links", "ba_eq_D",
                "icos_nodes", "icos_edges", "icos_clustering", "icos_mean_degree",
                "betweenness_pairs", "betweenness_eq_78"]:
        assert key in r, f"Missing key: {key}"

def test_scale_free_networks_boolean_flags():
    from urt.network_science_cathedral import scale_free_networks
    r = scale_free_networks()
    assert r["sf_eq_D"] is True
    assert r["ba_eq_D"] is True
    assert r["icos_nodes_eq_N"] is True
    assert r["betweenness_eq_78"] is True

def test_scale_free_networks_values():
    from urt.network_science_cathedral import scale_free_networks
    r = scale_free_networks()
    assert r["scale_free_exp"] == 3
    assert r["ba_links"] == 3
    assert r["icos_nodes"] == 13
    assert r["icos_edges"] == 30
    assert r["betweenness_pairs"] == 78
    assert abs(r["icos_clustering"] - 60.0/156.0) < 1e-10

def test_graph_properties_returns_dict():
    from urt.network_science_cathedral import graph_properties
    assert isinstance(graph_properties(), dict)

def test_graph_properties_keys():
    from urt.network_science_cathedral import graph_properties
    r = graph_properties()
    for key in ["chromatic_planar", "chromatic_eq_D1", "icos_diam", "diam_eq_D",
                "n_triadic", "triad_eq_D", "n_motif_types", "motif_types_eq_N",
                "spectral_gap", "spectral_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_graph_properties_boolean_flags():
    from urt.network_science_cathedral import graph_properties
    r = graph_properties()
    assert r["chromatic_eq_D1"] is True
    assert r["icos_chromatic_eq_D1"] is True
    assert r["diam_eq_D"] is True
    assert r["triad_eq_D"] is True
    assert r["motif_types_eq_N"] is True
    assert r["spectral_eq_D"] is True
    assert r["laplacian_eq_N"] is True

def test_graph_properties_values():
    from urt.network_science_cathedral import graph_properties
    r = graph_properties()
    assert r["chromatic_planar"] == 4
    assert r["icos_diam"] == 3
    assert r["n_triadic"] == 3
    assert r["n_motif_types"] == 13
    assert r["spectral_gap"] == 3
    assert r["laplacian_dim"] == 13

def test_small_world_returns_dict():
    from urt.network_science_cathedral import small_world
    assert isinstance(small_world(), dict)

def test_small_world_keys():
    from urt.network_science_cathedral import small_world
    r = small_world()
    for key in ["ws_degree", "ws_eq_q", "ws_nodes", "ws_eq_N",
                "n_communities", "communities_eq_D", "percolation_q"]:
        assert key in r, f"Missing key: {key}"

def test_small_world_boolean_flags():
    from urt.network_science_cathedral import small_world
    r = small_world()
    assert r["ws_eq_q"] is True
    assert r["ws_eq_N"] is True
    assert r["communities_eq_D"] is True

def test_small_world_values():
    from urt.network_science_cathedral import small_world
    r = small_world()
    assert r["ws_degree"] == 5
    assert r["ws_nodes"] == 13
    assert r["n_communities"] == 3
    assert abs(r["percolation_q"] - 0.2) < 1e-10

def test_network_science_summary_returns_dict():
    from urt.network_science_cathedral import network_science_summary
    assert isinstance(network_science_summary(), dict)

def test_network_science_summary_keys():
    from urt.network_science_cathedral import network_science_summary
    r = network_science_summary()
    for key in ["scale_free", "graph", "small_world", "KEY_EXACT_RESULTS", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_network_science_summary_D_N():
    from urt.network_science_cathedral import network_science_summary
    r = network_science_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_network_science_summary_key_results():
    from urt.network_science_cathedral import network_science_summary
    r = network_science_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_network_science_report_runs(capsys):
    from urt.network_science_cathedral import print_network_science_report
    print_network_science_report()
    out = capsys.readouterr().out
    assert len(out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_icos_nodes_match_N():
    from urt.network_science_cathedral import ICOS_NETWORK_NODES
    from urt.shell_closure import N
    assert ICOS_NETWORK_NODES == N

def test_icos_edges_match_E():
    from urt.network_science_cathedral import ICOS_NETWORK_EDGES
    from urt.shell_closure import E
    assert ICOS_NETWORK_EDGES == E

def test_chromatic_matches_D1():
    from urt.network_science_cathedral import CHROMATIC_PLANAR
    from urt.shell_closure import D
    assert CHROMATIC_PLANAR == D + 1

def test_diameter_matches_D():
    from urt.network_science_cathedral import ICOS_GRAPH_DIAMETER
    from urt.shell_closure import D
    assert ICOS_GRAPH_DIAMETER == D

def test_spectral_gap_matches_D():
    from urt.network_science_cathedral import ICOS_SPECTRAL_GAP
    from urt.shell_closure import D
    assert ICOS_SPECTRAL_GAP == D

def test_motif_types_match_N():
    """N=13 types of 3-node directed motifs."""
    from urt.network_science_cathedral import N_3NODE_MOTIF_TYPES
    from urt.shell_closure import N
    assert N_3NODE_MOTIF_TYPES == N

def test_betweenness_pairs_formula():
    """BETWEENNESS_PAIRS = N*(N-1)//2 = 78."""
    from urt.network_science_cathedral import BETWEENNESS_PAIRS
    from urt.shell_closure import N
    assert BETWEENNESS_PAIRS == N * (N - 1) // 2
