"""Tests for urt/information_theory_cathedral.py — Information theory Cathedral connections."""

import pytest
from math import log2


def test_imports():
    from urt.information_theory_cathedral import (
        H_MAX_N, H_MAX_Q, BINARY_ALPHABET,
        CATHEDRAL_SNR, C_CATHEDRAL,
        HAMMING_N, HAMMING_K, HAMMING_D, HAMMING_RATE, HAMMING_PARITY_BITS,
        N_QUBIT_DIMS, TOFFOLI_QUBITS, N_PHYS_PER_LOGICAL_ICOS,
        entropy_analysis, hamming_code_analysis, quantum_information_analysis,
        information_theory_summary, print_information_theory_report,
    )


# ── Shannon entropy ───────────────────────────────────────────────────────────

def test_H_max_N():
    """H_max for N=13 equiprobable = log₂(13)."""
    from urt.information_theory_cathedral import H_MAX_N
    from urt.shell_closure import N
    assert abs(H_MAX_N - log2(N)) < 1e-10
    assert 3.5 < H_MAX_N < 4.0


def test_H_max_q():
    """H_max for q=5 outcomes = log₂(5) ≈ 2.32 bits."""
    from urt.information_theory_cathedral import H_MAX_Q
    from urt.shell_closure import q
    assert abs(H_MAX_Q - log2(q)) < 1e-10
    assert 2.2 < H_MAX_Q < 2.5


def test_binary_alphabet_eq_D1():
    """Binary alphabet = D-1 = 2."""
    from urt.information_theory_cathedral import BINARY_ALPHABET
    from urt.shell_closure import D
    assert BINARY_ALPHABET == D - 1
    assert BINARY_ALPHABET == 2


def test_cathedral_snr():
    """Cathedral SNR = 1/δ★ ≈ 6.779."""
    from urt.information_theory_cathedral import CATHEDRAL_SNR
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_SNR - 1.0 / DELTA_STAR) < 1e-8
    assert 6.5 < CATHEDRAL_SNR < 7.0


def test_channel_capacity_positive():
    """Channel capacity C_cathedral > 0."""
    from urt.information_theory_cathedral import C_CATHEDRAL
    assert C_CATHEDRAL > 0
    assert 2.5 < C_CATHEDRAL < 3.5


# ── Hamming code ──────────────────────────────────────────────────────────────

def test_hamming_n_eq_2D_1():
    """Hamming code n = 2^D - 1 = 7."""
    from urt.information_theory_cathedral import HAMMING_N
    from urt.shell_closure import D
    assert HAMMING_N == 2**D - 1
    assert HAMMING_N == 7


def test_hamming_k_eq_D1():
    """Hamming code k = 2^D - 1 - D = 4 = D+1."""
    from urt.information_theory_cathedral import HAMMING_K
    from urt.shell_closure import D
    assert HAMMING_K == 2**D - 1 - D
    assert HAMMING_K == D + 1
    assert HAMMING_K == 4


def test_hamming_d_eq_D():
    """Hamming minimum distance d = D = 3."""
    from urt.information_theory_cathedral import HAMMING_D
    from urt.shell_closure import D
    assert HAMMING_D == D
    assert HAMMING_D == 3


def test_hamming_rate():
    """Hamming code rate = 4/7."""
    from urt.information_theory_cathedral import HAMMING_RATE
    assert abs(HAMMING_RATE - 4.0 / 7.0) < 1e-10


# ── Quantum information ───────────────────────────────────────────────────────

def test_qubit_dims_eq_D1():
    """Qubit has D-1 = 2 dimensions."""
    from urt.information_theory_cathedral import N_QUBIT_DIMS
    from urt.shell_closure import D
    assert N_QUBIT_DIMS == D - 1
    assert N_QUBIT_DIMS == 2


def test_toffoli_qubits_eq_D():
    """Toffoli gate uses D = 3 qubits."""
    from urt.information_theory_cathedral import TOFFOLI_QUBITS
    from urt.shell_closure import D
    assert TOFFOLI_QUBITS == D
    assert TOFFOLI_QUBITS == 3


def test_icos_qec_eq_N():
    """Icosahedral QEC uses N = 13 physical qubits."""
    from urt.information_theory_cathedral import N_PHYS_PER_LOGICAL_ICOS
    from urt.shell_closure import N
    assert N_PHYS_PER_LOGICAL_ICOS == N
    assert N_PHYS_PER_LOGICAL_ICOS == 13


# ── Function tests ────────────────────────────────────────────────────────────

def test_entropy_analysis_function():
    from urt.information_theory_cathedral import entropy_analysis
    r = entropy_analysis()
    assert r["N_bits"] == 13
    assert r["q_symbols"] == 5


def test_hamming_function():
    from urt.information_theory_cathedral import hamming_code_analysis
    r = hamming_code_analysis()
    assert r["hamming_k_eq_D1"] is True
    assert r["hamming_d_eq_D"] is True
    assert r["hamming_n_eq_2D_1"] is True


def test_quantum_function():
    from urt.information_theory_cathedral import quantum_information_analysis
    r = quantum_information_analysis()
    assert r["qubit_eq_D1"] is True
    assert r["toffoli_eq_D"] is True
    assert r["icos_qec_eq_N"] is True


def test_information_theory_summary():
    from urt.information_theory_cathedral import information_theory_summary
    r = information_theory_summary()
    assert "entropy" in r
    assert "hamming" in r
    assert "quantum" in r
    assert len(r["key_results"]) >= 5


def test_print_information_theory_report(capsys):
    from urt.information_theory_cathedral import print_information_theory_report
    print_information_theory_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "7" in out
    assert "Cathedral" in out
    assert len(out) > 200
