"""
Tests for urt/quantum_information_cathedral.py
Cathedral integers in quantum information theory.
"""

import pytest
from math import log, log2, isfinite, isclose


# ── Import smoke test ──────────────────────────────────────────────────────────

def test_imports():
    """All public names import cleanly."""
    from urt.quantum_information_cathedral import (
        N_PAULI_MATRICES, PAULI_EQ_D,
        N_QUBIT_DIM, QUBIT_DIM_EQ_D1,
        BLOCH_SPHERE_DIM, BLOCH_EQ_D1,
        DIM_SU2, SU2_EQ_D,
        N_BELL_STATES, BELL_EQ_D1, N_BELL_STATES_EQ_D1,
        N_GHZ_QUBITS, GHZ_EQ_D,
        N_TELEPORT_CBITS, TELEPORT_EQ_D1,
        SCHMIDT_RANK_QUBIT, SCHMIDT_EQ_D1,
        N_NO_GO_THEOREMS, NO_GO_EQ_D1,
        N_TOFFOLI_QUBITS, TOFFOLI_EQ_D,
        N_UNIVERSAL_GATE_TYPES, UNIVERSAL_EQ_D,
        QEC_DISTANCE, QEC_CORRECTS, QEC_EQ_D,
        QEC_THRESHOLD_APPROX, QEC_THRESHOLD_PERCENT,
        ENTROPY_MAX_MIXED, ENTROPY_EQ_LOG_D1,
        N_SU2_FACTORS_LORENTZ, LORENTZ_EQ_D1,
        N_SPACETIME_DIMS_QI, SPACETIME_EQ_D1_QI,
        qubit_properties, entanglement_properties,
        quantum_info_summary, print_quantum_info_report,
    )


# ── Pauli matrices ─────────────────────────────────────────────────────────────

def test_pauli_matrices_eq_D():
    """Pauli matrices = D = 3  [EXACT: σ_x, σ_y, σ_z]."""
    from urt.quantum_information_cathedral import N_PAULI_MATRICES, PAULI_EQ_D
    from urt.shell_closure import D
    assert N_PAULI_MATRICES == D
    assert N_PAULI_MATRICES == 3
    assert PAULI_EQ_D is True


def test_pauli_matrices_value():
    """N_PAULI_MATRICES is exactly 3."""
    from urt.quantum_information_cathedral import N_PAULI_MATRICES
    assert N_PAULI_MATRICES == 3


# ── Qubit Hilbert space ────────────────────────────────────────────────────────

def test_qubit_dim_eq_D_minus_1():
    """Qubit Hilbert space dim = D-1 = 2  [EXACT: C²]."""
    from urt.quantum_information_cathedral import N_QUBIT_DIM, QUBIT_DIM_EQ_D1
    from urt.shell_closure import D
    assert N_QUBIT_DIM == D - 1
    assert N_QUBIT_DIM == 2
    assert QUBIT_DIM_EQ_D1 is True


def test_qubit_dim_value():
    """N_QUBIT_DIM is exactly 2."""
    from urt.quantum_information_cathedral import N_QUBIT_DIM
    assert N_QUBIT_DIM == 2


# ── Bloch sphere ───────────────────────────────────────────────────────────────

def test_bloch_sphere_dim_eq_D1():
    """Bloch sphere = S^{D-1} = S², dimension D-1 = 2  [EXACT]."""
    from urt.quantum_information_cathedral import BLOCH_SPHERE_DIM, BLOCH_EQ_D1
    from urt.shell_closure import D
    assert BLOCH_SPHERE_DIM == D - 1
    assert BLOCH_SPHERE_DIM == 2
    assert BLOCH_EQ_D1 is True


def test_bloch_sphere_value():
    """BLOCH_SPHERE_DIM is exactly 2."""
    from urt.quantum_information_cathedral import BLOCH_SPHERE_DIM
    assert BLOCH_SPHERE_DIM == 2


# ── SU(2) generators ──────────────────────────────────────────────────────────

def test_su2_generators_eq_D():
    """dim(SU(2)) = D = 3 generators  [EXACT]."""
    from urt.quantum_information_cathedral import DIM_SU2, SU2_EQ_D
    from urt.shell_closure import D
    assert DIM_SU2 == D
    assert DIM_SU2 == 3
    assert SU2_EQ_D is True


def test_su2_equals_pauli():
    """SU(2) generators equals number of Pauli matrices."""
    from urt.quantum_information_cathedral import DIM_SU2, N_PAULI_MATRICES
    assert DIM_SU2 == N_PAULI_MATRICES


# ── Bell states ────────────────────────────────────────────────────────────────

def test_bell_states_eq_D_plus_1():
    """Bell states = D+1 = 4  [EXACT: |Φ+⟩,|Φ-⟩,|Ψ+⟩,|Ψ-⟩]."""
    from urt.quantum_information_cathedral import N_BELL_STATES, BELL_EQ_D1, N_BELL_STATES_EQ_D1
    from urt.shell_closure import D
    assert N_BELL_STATES == D + 1
    assert N_BELL_STATES == 4
    assert BELL_EQ_D1 is True
    assert N_BELL_STATES_EQ_D1 is True


def test_bell_states_value():
    """N_BELL_STATES is exactly 4."""
    from urt.quantum_information_cathedral import N_BELL_STATES
    assert N_BELL_STATES == 4


# ── GHZ state ─────────────────────────────────────────────────────────────────

def test_ghz_qubits_eq_D():
    """GHZ state uses D = 3 qubits  [EXACT: (|000⟩+|111⟩)/√2]."""
    from urt.quantum_information_cathedral import N_GHZ_QUBITS, GHZ_EQ_D
    from urt.shell_closure import D
    assert N_GHZ_QUBITS == D
    assert N_GHZ_QUBITS == 3
    assert GHZ_EQ_D is True


# ── Quantum teleportation ──────────────────────────────────────────────────────

def test_teleport_cbits_eq_D_minus_1():
    """Teleportation transmits D-1 = 2 classical bits  [EXACT]."""
    from urt.quantum_information_cathedral import N_TELEPORT_CBITS, TELEPORT_EQ_D1
    from urt.shell_closure import D
    assert N_TELEPORT_CBITS == D - 1
    assert N_TELEPORT_CBITS == 2
    assert TELEPORT_EQ_D1 is True


def test_teleport_cbits_value():
    """N_TELEPORT_CBITS is exactly 2."""
    from urt.quantum_information_cathedral import N_TELEPORT_CBITS
    assert N_TELEPORT_CBITS == 2


# ── Schmidt rank ──────────────────────────────────────────────────────────────

def test_schmidt_rank_eq_D_minus_1():
    """Max Schmidt rank for qubit bipartition = D-1 = 2  [EXACT]."""
    from urt.quantum_information_cathedral import SCHMIDT_RANK_QUBIT, SCHMIDT_EQ_D1
    from urt.shell_closure import D
    assert SCHMIDT_RANK_QUBIT == D - 1
    assert SCHMIDT_RANK_QUBIT == 2
    assert SCHMIDT_EQ_D1 is True


# ── No-go theorems ────────────────────────────────────────────────────────────

def test_no_go_theorems_eq_D_minus_1():
    """No-go theorems = D-1 = 2  [EXACT: no-cloning + no-deleting]."""
    from urt.quantum_information_cathedral import N_NO_GO_THEOREMS, NO_GO_EQ_D1
    from urt.shell_closure import D
    assert N_NO_GO_THEOREMS == D - 1
    assert N_NO_GO_THEOREMS == 2
    assert NO_GO_EQ_D1 is True


def test_no_go_value():
    """N_NO_GO_THEOREMS is exactly 2."""
    from urt.quantum_information_cathedral import N_NO_GO_THEOREMS
    assert N_NO_GO_THEOREMS == 2


# ── Toffoli gate ──────────────────────────────────────────────────────────────

def test_toffoli_qubits_eq_D():
    """Toffoli gate = D = 3 qubits  [EXACT]."""
    from urt.quantum_information_cathedral import N_TOFFOLI_QUBITS, TOFFOLI_EQ_D
    from urt.shell_closure import D
    assert N_TOFFOLI_QUBITS == D
    assert N_TOFFOLI_QUBITS == 3
    assert TOFFOLI_EQ_D is True


# ── Universal gate types ──────────────────────────────────────────────────────

def test_universal_gate_types_eq_D():
    """Universal gate types = D = 3  [APPROXIMATE]."""
    from urt.quantum_information_cathedral import N_UNIVERSAL_GATE_TYPES, UNIVERSAL_EQ_D
    from urt.shell_closure import D
    assert N_UNIVERSAL_GATE_TYPES == D
    assert N_UNIVERSAL_GATE_TYPES == 3
    assert UNIVERSAL_EQ_D is True


# ── Quantum error correction ───────────────────────────────────────────────────

def test_qec_distance_eq_D():
    """QEC distance = D = 3  [EXACT]."""
    from urt.quantum_information_cathedral import QEC_DISTANCE, QEC_EQ_D
    from urt.shell_closure import D
    assert QEC_DISTANCE == D
    assert QEC_DISTANCE == 3
    assert QEC_EQ_D is True


def test_qec_corrects_one_error():
    """Distance-D=3 code corrects ⌊(D-1)/2⌋ = 1 error  [EXACT]."""
    from urt.quantum_information_cathedral import QEC_CORRECTS, QEC_DISTANCE
    from urt.shell_closure import D
    assert QEC_CORRECTS == (D - 1) // 2
    assert QEC_CORRECTS == 1


def test_qec_threshold_approx_gamma():
    """QEC threshold ≈ γ = 1/81  [APPROXIMATE]."""
    from urt.quantum_information_cathedral import QEC_THRESHOLD_APPROX
    from urt.shell_closure import gamma
    assert abs(QEC_THRESHOLD_APPROX - gamma) < 1e-14
    assert abs(QEC_THRESHOLD_APPROX - 1.0 / 81) < 1e-14


def test_qec_threshold_percent():
    """QEC threshold percent ≈ 1.235%."""
    from urt.quantum_information_cathedral import QEC_THRESHOLD_PERCENT
    # γ = 1/81 ≈ 0.01235..., so percent ≈ 1.235
    assert 1.2 < QEC_THRESHOLD_PERCENT < 1.3


# ── Entropy ───────────────────────────────────────────────────────────────────

def test_entropy_max_mixed_eq_log_2():
    """Max-mixed qubit entropy = log(D-1) = log(2)  [EXACT]."""
    from urt.quantum_information_cathedral import ENTROPY_MAX_MIXED, ENTROPY_EQ_LOG_D1
    from urt.shell_closure import D
    assert abs(ENTROPY_MAX_MIXED - log(D - 1)) < 1e-14
    assert abs(ENTROPY_MAX_MIXED - log(2)) < 1e-14
    assert ENTROPY_EQ_LOG_D1 is True


def test_entropy_max_mixed_in_bits():
    """Max-mixed qubit entropy = 1 bit."""
    from urt.quantum_information_cathedral import ENTROPY_MAX_MIXED_BITS
    assert abs(ENTROPY_MAX_MIXED_BITS - 1.0) < 1e-14


def test_entropy_is_positive_finite():
    """Entropy is a positive finite number."""
    from urt.quantum_information_cathedral import ENTROPY_MAX_MIXED
    assert isfinite(ENTROPY_MAX_MIXED)
    assert ENTROPY_MAX_MIXED > 0


# ── Lorentz / spacetime ────────────────────────────────────────────────────────

def test_su2_factors_lorentz_eq_D_minus_1():
    """SU(2) × SU(2) = Lorentz: two SU(2) factors = D-1 = 2  [EXACT]."""
    from urt.quantum_information_cathedral import N_SU2_FACTORS_LORENTZ, LORENTZ_EQ_D1
    from urt.shell_closure import D
    assert N_SU2_FACTORS_LORENTZ == D - 1
    assert N_SU2_FACTORS_LORENTZ == 2
    assert LORENTZ_EQ_D1 is True


def test_spacetime_dims_eq_D_plus_1():
    """Spacetime dimension = D+1 = 4  [EXACT]."""
    from urt.quantum_information_cathedral import N_SPACETIME_DIMS_QI, SPACETIME_EQ_D1_QI
    from urt.shell_closure import D
    assert N_SPACETIME_DIMS_QI == D + 1
    assert N_SPACETIME_DIMS_QI == 4
    assert SPACETIME_EQ_D1_QI is True


# ── Function return types and content ─────────────────────────────────────────

def test_qubit_properties_returns_dict():
    """qubit_properties() returns a dict with expected keys."""
    from urt.quantum_information_cathedral import qubit_properties
    result = qubit_properties()
    assert isinstance(result, dict)
    for key in ("n_qubit_dim", "qubit_dim_eq_D1", "n_pauli", "pauli_eq_D",
                "n_bell", "bell_eq_D1", "bloch_dim", "bloch_eq_D1"):
        assert key in result


def test_qubit_properties_boolean_flags():
    """qubit_properties() boolean flags are all True."""
    from urt.quantum_information_cathedral import qubit_properties
    result = qubit_properties()
    assert result["qubit_dim_eq_D1"] is True
    assert result["pauli_eq_D"] is True
    assert result["bell_eq_D1"] is True
    assert result["bloch_eq_D1"] is True
    assert result["su2_eq_D"] is True
    assert result["entropy_eq_log_D1"] is True


def test_entanglement_properties_returns_dict():
    """entanglement_properties() returns a dict with expected keys."""
    from urt.quantum_information_cathedral import entanglement_properties
    result = entanglement_properties()
    assert isinstance(result, dict)
    for key in ("n_ghz_qubits", "ghz_eq_D", "n_teleport_bits", "teleport_eq_D1",
                "n_no_go", "no_go_eq_D1", "schmidt_rank", "qec_distance", "qec_eq_D"):
        assert key in result


def test_entanglement_properties_boolean_flags():
    """entanglement_properties() boolean flags are all True."""
    from urt.quantum_information_cathedral import entanglement_properties
    result = entanglement_properties()
    assert result["ghz_eq_D"] is True
    assert result["teleport_eq_D1"] is True
    assert result["no_go_eq_D1"] is True
    assert result["schmidt_eq_D1"] is True
    assert result["toffoli_eq_D"] is True
    assert result["universal_eq_D"] is True
    assert result["qec_eq_D"] is True
    assert result["lorentz_eq_D1"] is True


def test_entanglement_properties_values():
    """entanglement_properties() returns correct numerical values."""
    from urt.quantum_information_cathedral import entanglement_properties
    result = entanglement_properties()
    assert result["n_ghz_qubits"] == 3
    assert result["n_teleport_bits"] == 2
    assert result["n_no_go"] == 2
    assert result["schmidt_rank"] == 2
    assert result["n_toffoli_qubits"] == 3
    assert result["qec_distance"] == 3
    assert result["qec_corrects"] == 1


def test_quantum_info_summary_structure():
    """quantum_info_summary() has 'qubit', 'entanglement', 'KEY_EXACT_RESULTS'."""
    from urt.quantum_information_cathedral import quantum_info_summary
    result = quantum_info_summary()
    assert isinstance(result, dict)
    assert "qubit" in result
    assert "entanglement" in result
    assert "KEY_EXACT_RESULTS" in result


def test_quantum_info_summary_key_results_nonempty():
    """KEY_EXACT_RESULTS list is non-empty."""
    from urt.quantum_information_cathedral import quantum_info_summary
    result = quantum_info_summary()
    kr = result["KEY_EXACT_RESULTS"]
    assert isinstance(kr, list)
    assert len(kr) >= 10


def test_print_quantum_info_report_runs(capsys):
    """print_quantum_info_report() executes without error and produces output."""
    from urt.quantum_information_cathedral import print_quantum_info_report
    print_quantum_info_report()
    captured = capsys.readouterr()
    assert "Cathedral" in captured.out
    assert "D" in captured.out


# ── Consistency between constants ─────────────────────────────────────────────

def test_qubit_dim_plus_one_eq_D():
    """N_QUBIT_DIM + 1 == D (by construction)."""
    from urt.quantum_information_cathedral import N_QUBIT_DIM
    from urt.shell_closure import D
    assert N_QUBIT_DIM + 1 == D


def test_bell_states_eq_qubit_dim_plus_two():
    """N_BELL_STATES == N_QUBIT_DIM + 2 == D+1."""
    from urt.quantum_information_cathedral import N_BELL_STATES, N_QUBIT_DIM
    assert N_BELL_STATES == N_QUBIT_DIM + 2


def test_ghz_eq_toffoli_eq_pauli():
    """GHZ qubits = Toffoli qubits = Pauli matrices = D = 3."""
    from urt.quantum_information_cathedral import (
        N_GHZ_QUBITS, N_TOFFOLI_QUBITS, N_PAULI_MATRICES, DIM_SU2
    )
    assert N_GHZ_QUBITS == N_TOFFOLI_QUBITS == N_PAULI_MATRICES == DIM_SU2 == 3


def test_d_minus_1_consistency():
    """All D-1=2 quantities are equal to each other."""
    from urt.quantum_information_cathedral import (
        N_QUBIT_DIM, BLOCH_SPHERE_DIM, N_TELEPORT_CBITS,
        N_NO_GO_THEOREMS, SCHMIDT_RANK_QUBIT, N_SU2_FACTORS_LORENTZ
    )
    assert (N_QUBIT_DIM == BLOCH_SPHERE_DIM == N_TELEPORT_CBITS
            == N_NO_GO_THEOREMS == SCHMIDT_RANK_QUBIT == N_SU2_FACTORS_LORENTZ == 2)


def test_qec_threshold_is_small():
    """QEC threshold < 2% (physically reasonable)."""
    from urt.quantum_information_cathedral import QEC_THRESHOLD_APPROX
    assert 0 < QEC_THRESHOLD_APPROX < 0.02


def test_delta_star_present():
    """DELTA_STAR is accessible and ≈ 0.14751."""
    from urt.quantum_information_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 0.001
