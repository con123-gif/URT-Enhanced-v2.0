"""Tests for urt/information_cathedral.py — Cathedral information theory."""

import pytest
from math import log, log2, pi, isfinite


def test_imports():
    from urt.information_cathedral import (
        H_MAX_BITS, H_MAX_NATS, H_K4_BITS, H_H3_BITS, I_K4_H3_BITS,
        SNR_CATHEDRAL, C_CHANNEL_BITS, CHANNEL_EFFICIENCY,
        H_BIN_GAMMA, R_QEC, G_NEWTON_CAT, AREA_QUANTUM, S_QUANTUM,
        S_QUANTUM_BITS,
    )


def test_h_max():
    from urt.information_cathedral import H_MAX_BITS
    from urt.shell_closure import N
    assert abs(H_MAX_BITS - log2(N)) < 1e-12
    assert abs(H_MAX_BITS - log2(13)) < 1e-12


def test_h_k4():
    from urt.information_cathedral import H_K4_BITS
    from urt.shell_closure import D
    assert abs(H_K4_BITS - log2(D + 1)) < 1e-12
    assert abs(H_K4_BITS - 2.0) < 1e-12


def test_h_h3():
    from urt.information_cathedral import H_H3_BITS
    from urt.shell_closure import N, D
    assert abs(H_H3_BITS - log2(N - D - 1)) < 1e-12
    assert abs(H_H3_BITS - log2(9)) < 1e-12


def test_mutual_information():
    from urt.information_cathedral import I_K4_H3_BITS, H_K4_BITS, H_H3_BITS, H_MAX_BITS
    assert abs(I_K4_H3_BITS - (H_K4_BITS + H_H3_BITS - H_MAX_BITS)) < 1e-12
    assert I_K4_H3_BITS > 0


def test_channel_snr():
    from urt.information_cathedral import SNR_CATHEDRAL
    from urt.shell_closure import DELTA_STAR
    assert abs(SNR_CATHEDRAL - 1.0 / DELTA_STAR) < 1e-12
    assert SNR_CATHEDRAL > 6.0


def test_channel_capacity():
    from urt.information_cathedral import C_CHANNEL_BITS, SNR_CATHEDRAL
    assert abs(C_CHANNEL_BITS - log2(1 + SNR_CATHEDRAL)) < 1e-12
    assert 2.9 < C_CHANNEL_BITS < 3.1


def test_channel_efficiency():
    from urt.information_cathedral import CHANNEL_EFFICIENCY
    assert 0.75 < CHANNEL_EFFICIENCY < 0.85


def test_qec_rate():
    from urt.information_cathedral import R_QEC
    assert 0.89 < R_QEC < 0.92


def test_h_bin_positive():
    from urt.information_cathedral import H_BIN_GAMMA
    assert 0 < H_BIN_GAMMA < 1


def test_g_newton():
    from urt.information_cathedral import G_NEWTON_CAT
    from urt.shell_closure import DELTA_STAR
    assert abs(G_NEWTON_CAT - DELTA_STAR**2) < 1e-14


def test_area_quantum():
    from urt.information_cathedral import AREA_QUANTUM
    from urt.shell_closure import DELTA_STAR
    assert abs(AREA_QUANTUM - 8 * pi * DELTA_STAR**3) < 1e-12
    assert AREA_QUANTUM > 0


def test_holographic_bound():
    from urt.information_cathedral import holographic_bound
    r = holographic_bound(R=1.0)
    assert r["S_max_nats"] > 0
    assert r["S_max_bits"] > 0
    assert isfinite(r["S_max_nats"])
    assert r["n_area_quanta"] > 0


def test_page_time():
    from urt.information_cathedral import page_time
    r = page_time(M_planck=1.0)
    assert r["S_BH"] > 0
    assert r["T_Hawking"] > 0
    assert r["t_Page"] > 0
    assert r["t_scramble"] > 0
    # Page time > scrambling time
    assert r["t_Page"] > r["t_scramble"]


def test_bekenstein_hawking():
    from urt.information_cathedral import bekenstein_hawking
    r = bekenstein_hawking(M=1.0)
    assert r["S_nats"] > 0
    assert r["S_bits"] > r["S_nats"]
    assert r["area"] > 0
    assert abs(r["S_nats"] - 4 * pi) < 1e-8


def test_von_neumann_entropy():
    from urt.information_cathedral import von_neumann_entropy
    r = von_neumann_entropy(beta=1.0)
    assert 0 < r["S_bits"] < r["S_max_bits"]
    assert r["Z"] > 0

    # High T limit: S → H_max
    r_high = von_neumann_entropy(beta=0.001)
    from urt.information_cathedral import H_MAX_BITS
    assert abs(r_high["S_bits"] - H_MAX_BITS) < 0.01

    # Low T limit: S → 0
    r_low = von_neumann_entropy(beta=100.0)
    assert r_low["S_bits"] < 0.01


def test_holevo_bound():
    from urt.information_cathedral import holevo_bound, H_MAX_BITS
    r = holevo_bound()
    assert abs(r["chi_bits"] - H_MAX_BITS) < 1e-12
    assert r["achieves_holevo"] is True
    assert r["N_states"] == 13


def test_shannon_entropy_function():
    from urt.information_cathedral import shannon_entropy
    r = shannon_entropy()
    assert "H_max_bits" in r
    assert "I_K4_H3_bits" in r
    assert r["K4_modes"] == 4
    assert r["H3_modes"] == 9


def test_information_summary():
    from urt.information_cathedral import information_summary
    r = information_summary()
    assert "shannon" in r
    assert "channel" in r
    assert "qec" in r
    assert "bekenstein" in r
    assert "holevo" in r


def test_print_info_report(capsys):
    from urt.information_cathedral import print_info_report
    print_info_report()
    out = capsys.readouterr().out
    assert "log" in out.lower() or "entropy" in out.lower()
    assert len(out) > 100


def test_s_quantum_bits():
    from urt.information_cathedral import S_QUANTUM_BITS
    # Each area quantum carries ~1.338 bits
    assert 1.2 < S_QUANTUM_BITS < 1.5


def test_n_quanta_near_N():
    """BH of M=1 has ~N quanta in its horizon."""
    from urt.information_cathedral import bekenstein_hawking
    from urt.shell_closure import N
    r = bekenstein_hawking(M=1.0)
    # n_quanta should be close to N+1 ≈ 14 for M=1
    assert 10 < r["n_quanta"] < 20
