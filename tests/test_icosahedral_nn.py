"""Tests for urt/icosahedral_nn.py — IRN: URT × O(N) × icosahedral geometry."""

import pytest
import numpy as np
from math import pi

# ── Graph structure ────────────────────────────────────────────────────────────

def test_n_outer_edges():
    from urt.icosahedral_nn import N_OUTER_EDGES
    assert N_OUTER_EDGES == 30

def test_n_total_edges():
    from urt.icosahedral_nn import N_TOTAL_EDGES
    assert N_TOTAL_EDGES == 42

def test_n_center_edges():
    from urt.icosahedral_nn import N_CENTER_EDGES
    assert N_CENTER_EDGES == 12

def test_outer_degree():
    from urt.icosahedral_nn import OUTER_DEGREE
    from urt.shell_closure import q
    assert OUTER_DEGREE == q == 5

def test_center_degree():
    from urt.icosahedral_nn import CENTER_DEGREE
    from urt.shell_closure import N
    assert CENTER_DEGREE == N - 1 == 12

def test_n_edges_eq_E():
    from urt.icosahedral_nn import N_EDGES_EQ_E
    assert N_EDGES_EQ_E is True

def test_degree_eq_q():
    from urt.icosahedral_nn import DEGREE_EQ_Q
    assert DEGREE_EQ_Q is True

def test_kappa_lt_1():
    from urt.icosahedral_nn import KAPPA_LT_1, KAPPA
    assert KAPPA_LT_1 is True
    assert KAPPA < 1.0

def test_kappa_positive():
    from urt.icosahedral_nn import KAPPA
    assert KAPPA > 0.0

def test_kappa_value():
    from urt.icosahedral_nn import KAPPA
    from urt.control import _ALPHA, _BETA, _THETA
    expected = _BETA * _ALPHA * (1 + _THETA)
    assert abs(KAPPA - expected) < 1e-10

def test_spectral_gap_positive():
    from urt.icosahedral_nn import SPECTRAL_GAP_POSITIVE, ICOS_SPECTRAL_GAP
    assert SPECTRAL_GAP_POSITIVE is True
    assert ICOS_SPECTRAL_GAP > 0

def test_k_kuramoto_crit():
    from urt.icosahedral_nn import K_KURAMOTO_CRIT
    assert K_KURAMOTO_CRIT == 1.278

# ── build_icosahedral_adjacency ────────────────────────────────────────────────

def test_adjacency_length():
    from urt.icosahedral_nn import build_icosahedral_adjacency
    from urt.shell_closure import N
    adj = build_icosahedral_adjacency()
    assert len(adj) == N

def test_adjacency_outer_degree():
    from urt.icosahedral_nn import build_icosahedral_adjacency
    from urt.shell_closure import q
    adj = build_icosahedral_adjacency()
    for i in range(12):  # outer nodes
        assert len(adj[i]) == q + 1  # q outer neighbours + center

def test_adjacency_center_degree():
    from urt.icosahedral_nn import build_icosahedral_adjacency
    adj = build_icosahedral_adjacency()
    assert len(adj[12]) == 12  # center connects to all outer

def test_adjacency_symmetric():
    from urt.icosahedral_nn import build_icosahedral_adjacency
    adj = build_icosahedral_adjacency()
    for u, nbrs in enumerate(adj):
        for v in nbrs:
            assert u in adj[v], f"Asymmetry: {u}→{v} but not {v}→{u}"

def test_adjacency_no_self_loops():
    from urt.icosahedral_nn import build_icosahedral_adjacency
    adj = build_icosahedral_adjacency()
    for i, nbrs in enumerate(adj):
        assert i not in nbrs

# ── icosahedral_laplacian ──────────────────────────────────────────────────────

def test_laplacian_shape():
    from urt.icosahedral_nn import icosahedral_laplacian
    from urt.shell_closure import N
    L = icosahedral_laplacian()
    assert L.shape == (N, N)

def test_laplacian_symmetric():
    from urt.icosahedral_nn import icosahedral_laplacian
    L = icosahedral_laplacian()
    assert np.allclose(L, L.T, atol=1e-12)

def test_laplacian_smallest_eigenvalue_zero():
    from urt.icosahedral_nn import icosahedral_laplacian
    L = icosahedral_laplacian()
    evals = np.linalg.eigvalsh(L)
    assert abs(evals[0]) < 1e-10  # λ₀ = 0 (connected graph)

def test_laplacian_spectral_gap_positive():
    from urt.icosahedral_nn import icosahedral_laplacian
    L = icosahedral_laplacian()
    evals = np.linalg.eigvalsh(L)
    assert evals[1] > 0  # λ₂ > 0

def test_laplacian_diagonal_ones():
    from urt.icosahedral_nn import icosahedral_laplacian
    L = icosahedral_laplacian()
    assert np.allclose(np.diag(L), 1.0, atol=1e-10)

# ── IcosahedralMessagePassing ─────────────────────────────────────────────────

def test_mp_output_shape_1d():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import N
    mp = IcosahedralMessagePassing()
    x = np.ones(N)
    out = mp(x)
    assert out.shape == (N,)

def test_mp_output_shape_2d():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import N
    mp = IcosahedralMessagePassing()
    x = np.ones((N, 4))
    out = mp(x)
    assert out.shape == (N, 4)

def test_mp_contracts_toward_delta():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import DELTA_STAR, N
    mp = IcosahedralMessagePassing(n_urt_steps=5)
    x = np.full(N, 0.9)
    out = mp(x)
    # After contraction, values should be closer to δ★
    initial_gap = abs(0.9 - DELTA_STAR)
    final_gap = np.mean(np.abs(out - DELTA_STAR))
    assert final_gap < initial_gap

def test_mp_uniform_input_smooth():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import N
    mp = IcosahedralMessagePassing()
    x = np.ones(N) * 0.5
    out = mp(x)
    # Uniform input should stay uniform after mean aggregation
    assert np.std(out) < 0.05

def test_mp_preserves_node_count():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import N
    mp = IcosahedralMessagePassing()
    rng = np.random.default_rng(0)
    x = rng.normal(size=N)
    out = mp(x)
    assert len(out) == N

def test_mp_finite_output():
    from urt.icosahedral_nn import IcosahedralMessagePassing
    from urt.shell_closure import N
    mp = IcosahedralMessagePassing()
    rng = np.random.default_rng(1)
    x = rng.normal(size=N)
    out = mp(x)
    assert np.all(np.isfinite(out))

# ── RecursiveURTCell ──────────────────────────────────────────────────────────

def test_recursive_output_shape():
    from urt.icosahedral_nn import RecursiveURTCell
    from urt.shell_closure import N
    cell = RecursiveURTCell(depth=3)
    x = np.random.default_rng(0).normal(size=N)
    out = cell(x)
    assert out.shape == x.shape

def test_recursive_contracts():
    from urt.icosahedral_nn import RecursiveURTCell
    from urt.shell_closure import DELTA_STAR, N
    cell = RecursiveURTCell(depth=3)
    x = np.full(N, 0.8)
    out = cell(x)
    gap_in = abs(0.8 - DELTA_STAR)
    gap_out = np.mean(np.abs(out - DELTA_STAR))
    assert gap_out < gap_in

def test_recursive_contraction_factor():
    from urt.icosahedral_nn import RecursiveURTCell, KAPPA
    from urt.shell_closure import D
    cell = RecursiveURTCell(depth=D)
    cf = cell.contraction_factor()
    assert abs(cf - KAPPA ** (D + 1)) < 1e-12

def test_recursive_depth0():
    from urt.icosahedral_nn import RecursiveURTCell, KAPPA
    from urt.shell_closure import DELTA_STAR, N
    cell = RecursiveURTCell(depth=0)
    x = np.full(N, 0.5)
    out = cell(x)
    expected = KAPPA * 0.5 + (1 - KAPPA) * DELTA_STAR
    assert np.allclose(out, expected, atol=1e-12)

def test_recursive_finite_output():
    from urt.icosahedral_nn import RecursiveURTCell
    from urt.shell_closure import N
    cell = RecursiveURTCell(depth=3)
    x = np.random.default_rng(2).normal(size=N)
    out = cell(x)
    assert np.all(np.isfinite(out))

def test_recursive_deeper_closer():
    from urt.icosahedral_nn import RecursiveURTCell
    from urt.shell_closure import DELTA_STAR, N
    x = np.full(N, 0.8)
    gap_d1 = np.mean(np.abs(RecursiveURTCell(depth=1)(x) - DELTA_STAR))
    gap_d3 = np.mean(np.abs(RecursiveURTCell(depth=3)(x) - DELTA_STAR))
    assert gap_d3 <= gap_d1  # deeper → closer to δ★

# ── URTSparseAttention ────────────────────────────────────────────────────────

def test_attention_output_shape():
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import N
    attn = URTSparseAttention()
    x = np.random.default_rng(0).normal(size=N)
    out, weights = attn(x)
    assert out.shape == (N,)

def test_attention_weights_length():
    from urt.icosahedral_nn import URTSparseAttention, build_icosahedral_adjacency
    from urt.shell_closure import N
    attn = URTSparseAttention()
    x = np.random.default_rng(0).normal(size=N)
    _, weights = attn(x)
    assert len(weights) == N

def test_attention_weights_sum_to_one():
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import N
    attn = URTSparseAttention()
    x = np.random.default_rng(1).normal(size=N)
    _, weights = attn(x)
    for w in weights:
        assert abs(w.sum() - 1.0) < 1e-10

def test_attention_weights_non_negative():
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import N
    attn = URTSparseAttention()
    x = np.random.default_rng(2).normal(size=N)
    _, weights = attn(x)
    for w in weights:
        assert np.all(w >= 0)

def test_attention_finite_output():
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import N
    attn = URTSparseAttention()
    x = np.random.default_rng(3).normal(size=N)
    out, _ = attn(x)
    assert np.all(np.isfinite(out))

def test_attention_contracts():
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import DELTA_STAR, N
    attn = URTSparseAttention(n_urt_steps=5)
    x = np.full(N, 0.9)
    out, _ = attn(x)
    gap_in = abs(0.9 - DELTA_STAR)
    gap_out = np.mean(np.abs(out - DELTA_STAR))
    assert gap_out < gap_in

def test_attention_sparsity_outer_nodes():
    """Each outer node has exactly q+1=6 weights (self + q neighbours)."""
    from urt.icosahedral_nn import URTSparseAttention, build_icosahedral_adjacency
    from urt.shell_closure import N, q
    attn = URTSparseAttention()
    x = np.random.default_rng(4).normal(size=N)
    _, weights = attn(x)
    adj = build_icosahedral_adjacency()
    for i in range(12):  # outer nodes
        expected_len = 1 + len(adj[i])  # self + neighbours
        assert len(weights[i]) == expected_len

# ── IcosahedralRNN ────────────────────────────────────────────────────────────

def test_rnn_step_output_shape():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    h, r = rnn.step(np.ones(N))
    assert h.shape == (N,)

def test_rnn_synchronisation_order_range():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    rng = np.random.default_rng(0)
    for _ in range(5):
        _, r = rnn.step(rng.normal(size=N))
        assert 0.0 <= r <= 1.0 + 1e-10

def test_rnn_phases_in_0_2pi():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    h, _ = rnn.step(np.zeros(N))
    assert np.all(h >= 0) and np.all(h <= 2 * pi + 1e-10)

def test_rnn_reset():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    rnn.step(np.ones(N))
    rnn.reset()
    assert np.allclose(rnn.theta, 0.0)

def test_rnn_process_sequence():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    rng = np.random.default_rng(5)
    seq = [rng.normal(size=N) for _ in range(10)]
    phases, orders = rnn.process_sequence(seq)
    assert len(phases) == 10
    assert len(orders) == 10

def test_rnn_finite_output():
    from urt.icosahedral_nn import IcosahedralRNN
    from urt.shell_closure import N
    rnn = IcosahedralRNN()
    h, r = rnn.step(np.random.default_rng(6).normal(size=N))
    assert np.all(np.isfinite(h))
    assert np.isfinite(r)

def test_rnn_synchronisation_order_initial():
    from urt.icosahedral_nn import IcosahedralRNN
    rnn = IcosahedralRNN()
    r = rnn.synchronisation_order()
    assert r == 1.0  # all phases = 0 → fully synchronised

# ── IcosahedralRecursiveNet ───────────────────────────────────────────────────

def test_irn_forward_output_shape():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    from urt.shell_closure import D
    net = IcosahedralRecursiveNet(output_dim=D)
    out, delta = net(np.random.default_rng(0).normal(size=20))
    assert out.shape == (D,)

def test_irn_forward_finite():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet()
    out, delta = net(np.random.default_rng(1).normal(size=20))
    assert np.all(np.isfinite(out))
    assert np.isfinite(delta)

def test_irn_forward_delta_positive():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet()
    _, delta = net(np.random.default_rng(2).normal(size=20))
    assert delta > 0

def test_irn_criticality_gap():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet()
    net(np.random.default_rng(3).normal(size=10))
    gap = net.criticality_gap()
    assert gap is not None
    assert gap >= 0

def test_irn_is_critical_method_exists():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet()
    net(np.ones(13))
    result = net.is_critical()
    assert isinstance(result, bool)

def test_irn_short_input():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet(output_dim=1)
    out, _ = net(np.array([1.0, 2.0, 3.0]))
    assert out.shape == (1,)

def test_irn_long_input():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet(output_dim=2)
    out, _ = net(np.random.default_rng(4).normal(size=100))
    assert out.shape == (2,)

def test_irn_reset_trace():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    net = IcosahedralRecursiveNet()
    net(np.ones(13))
    net.reset_trace()
    assert net.criticality_gap() is None

def test_irn_default_output_dim():
    from urt.icosahedral_nn import IcosahedralRecursiveNet
    from urt.shell_closure import D
    net = IcosahedralRecursiveNet()
    out, _ = net(np.ones(13))
    assert len(out) == D

# ── irn_forward ───────────────────────────────────────────────────────────────

def test_irn_forward_fn():
    from urt.icosahedral_nn import irn_forward
    from urt.shell_closure import D
    out, delta = irn_forward(np.random.default_rng(7).normal(size=20))
    assert out.shape == (D,)
    assert np.isfinite(delta)

# ── irn_summary ───────────────────────────────────────────────────────────────

def test_irn_summary_returns_dict():
    from urt.icosahedral_nn import irn_summary
    assert isinstance(irn_summary(), dict)

def test_irn_summary_keys():
    from urt.icosahedral_nn import irn_summary
    s = irn_summary()
    for key in ["N_nodes", "N_outer_edges", "N_total_edges", "outer_degree",
                "kappa", "kappa_lt_1", "delta_star", "K_kuramoto_critical",
                "spectral_gap", "spectral_gap_positive", "n_edges_eq_E",
                "degree_eq_q", "recursive_contraction", "KEY_EXACT_RESULTS"]:
        assert key in s, f"Missing key: {key}"

def test_irn_summary_values():
    from urt.icosahedral_nn import irn_summary
    from urt.shell_closure import N, D, q
    s = irn_summary()
    assert s["N_nodes"] == N
    assert s["N_outer_edges"] == 30
    assert s["N_total_edges"] == 42
    assert s["outer_degree"] == q
    assert s["kappa_lt_1"] is True
    assert s["n_edges_eq_E"] is True
    assert s["degree_eq_q"] is True
    assert s["spectral_gap_positive"] is True

def test_irn_summary_key_results():
    from urt.icosahedral_nn import irn_summary
    s = irn_summary()
    assert isinstance(s["KEY_EXACT_RESULTS"], list)
    assert len(s["KEY_EXACT_RESULTS"]) >= 5

def test_print_irn_report_runs(capsys):
    from urt.icosahedral_nn import print_irn_report
    print_irn_report()
    out = capsys.readouterr().out
    assert len(out) > 200
    assert "O(N" in out
    assert "κ" in out or "kappa" in out.lower()

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_outer_degree_matches_shell():
    from urt.icosahedral_nn import OUTER_DEGREE
    from urt.shell_closure import q
    assert OUTER_DEGREE == q

def test_outer_edges_matches_shell():
    from urt.icosahedral_nn import N_OUTER_EDGES
    from urt.shell_closure import E as E_ICOS
    assert N_OUTER_EDGES == E_ICOS

def test_kappa_matches_control():
    from urt.icosahedral_nn import KAPPA
    from urt.control import _KAPPA
    assert abs(KAPPA - _KAPPA) < 1e-12

def test_delta_star_matches_shell():
    from urt.icosahedral_nn import irn_summary
    from urt.shell_closure import DELTA_STAR
    s = irn_summary()
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12

def test_n_nodes_matches_shell():
    from urt.icosahedral_nn import irn_summary
    from urt.shell_closure import N
    s = irn_summary()
    assert s["N_nodes"] == N

def test_recursive_contraction_consistent():
    from urt.icosahedral_nn import RecursiveURTCell, KAPPA
    from urt.shell_closure import D
    cell = RecursiveURTCell(depth=D)
    assert abs(cell.contraction_factor() - KAPPA ** (D + 1)) < 1e-12
    assert cell.contraction_factor() < 1.0

def test_irn_uses_delta_star_temperature():
    """URTSparseAttention temperature defaults to δ★."""
    from urt.icosahedral_nn import URTSparseAttention
    from urt.shell_closure import DELTA_STAR
    attn = URTSparseAttention()
    assert abs(attn.temperature - DELTA_STAR) < 1e-12
