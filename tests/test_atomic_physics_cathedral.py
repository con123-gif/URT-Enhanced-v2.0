"""Tests for urt/atomic_physics_cathedral.py — Hydrogen atom, orbitals, shells."""

import pytest


def test_imports():
    from urt.atomic_physics_cathedral import (
        N_QUANTUM_NUMBERS, L_P_STATES, L_D_STATES, L_9_STATES, L_FOR_N_STATES,
        SHELL_1_MAX, SHELL_2_MAX, SHELL_3_MAX, SHELL_4_MAX,
        RYDBERG_EV, TOTAL_ORBITALS_TO_N, N_SPIN_PROJECTIONS,
        quantum_numbers, angular_momentum_states, shell_structure,
        rydberg_analysis, atomic_summary, print_atomic_report,
    )


# ── Quantum numbers ───────────────────────────────────────────────────────────

def test_quantum_numbers_eq_D1():
    """(n, l, m, s) = D+1 = 4 quantum numbers."""
    from urt.atomic_physics_cathedral import N_QUANTUM_NUMBERS
    from urt.shell_closure import D
    assert N_QUANTUM_NUMBERS == D + 1
    assert N_QUANTUM_NUMBERS == 4


def test_spin_projections_eq_D1():
    """Spin projections = D-1 = 2."""
    from urt.atomic_physics_cathedral import N_SPIN_PROJECTIONS
    from urt.shell_closure import D
    assert N_SPIN_PROJECTIONS == D - 1
    assert N_SPIN_PROJECTIONS == 2


# ── Angular momentum substates ────────────────────────────────────────────────

def test_p_orbital_states_eq_D():
    """p orbital (l=1): 2l+1 = 3 = D EXACT."""
    from urt.atomic_physics_cathedral import L_P_STATES
    from urt.shell_closure import D
    assert L_P_STATES == D
    assert L_P_STATES == 3


def test_d_orbital_states_eq_q():
    """d orbital (l=2): 2l+1 = 5 = q EXACT."""
    from urt.atomic_physics_cathedral import L_D_STATES
    from urt.shell_closure import q
    assert L_D_STATES == q
    assert L_D_STATES == 5


def test_l4_states_eq_H3():
    """g orbital (l=4): 2l+1 = 9 = N-D-1 = H₃ dimension."""
    from urt.atomic_physics_cathedral import L_9_STATES
    from urt.shell_closure import N, D
    assert L_9_STATES == N - D - 1
    assert L_9_STATES == 9


def test_l_for_N_states():
    """l=6 gives 2l+1 = N = 13 states."""
    from urt.atomic_physics_cathedral import L_FOR_N_STATES
    from urt.shell_closure import N
    assert 2 * L_FOR_N_STATES + 1 == N
    assert L_FOR_N_STATES == 6


# ── Shell populations ─────────────────────────────────────────────────────────

def test_shell_1_eq_D1():
    """n=1 shell: 2 = D-1 electrons."""
    from urt.atomic_physics_cathedral import SHELL_1_MAX
    from urt.shell_closure import D
    assert SHELL_1_MAX == D - 1
    assert SHELL_1_MAX == 2


def test_shell_2_eq_2D():
    """n=2 shell: 8 = 2^D electrons EXACT."""
    from urt.atomic_physics_cathedral import SHELL_2_MAX
    from urt.shell_closure import D
    assert SHELL_2_MAX == 2**D
    assert SHELL_2_MAX == 8


def test_shell_3():
    """n=3 shell: 18 = 2 × (N-D-1)."""
    from urt.atomic_physics_cathedral import SHELL_3_MAX
    from urt.shell_closure import N, D
    assert SHELL_3_MAX == 18
    assert SHELL_3_MAX == 2 * (N - D - 1)


def test_shell_4_eq_2q():
    """n=4 shell: 32 = 2^q electrons EXACT."""
    from urt.atomic_physics_cathedral import SHELL_4_MAX
    from urt.shell_closure import q
    assert SHELL_4_MAX == 2**q
    assert SHELL_4_MAX == 32


# ── Total orbitals ────────────────────────────────────────────────────────────

def test_total_orbitals_to_N_eq_N2():
    """Σ(2l+1) for l=0..N-1 = N² = 169."""
    from urt.atomic_physics_cathedral import TOTAL_ORBITALS_TO_N
    from urt.shell_closure import N
    assert TOTAL_ORBITALS_TO_N == N**2
    assert TOTAL_ORBITALS_TO_N == 169


# ── Rydberg ───────────────────────────────────────────────────────────────────

def test_rydberg_approx_N():
    """E_1 ≈ N = 13 eV (within 5%)."""
    from urt.atomic_physics_cathedral import RYDBERG_EV, _RYDBERG_APPROX_N
    from urt.shell_closure import N
    assert abs(RYDBERG_EV - N) / N < 0.05


# ── Function tests ────────────────────────────────────────────────────────────

def test_quantum_numbers_function():
    from urt.atomic_physics_cathedral import quantum_numbers
    r = quantum_numbers()
    assert r["n_qn_eq_D1"] is True
    assert r["spin_eq_D1"] is True


def test_angular_momentum_function():
    from urt.atomic_physics_cathedral import angular_momentum_states
    r = angular_momentum_states()
    assert r["p_states_eq_D"] is True
    assert r["d_states_eq_q"] is True
    assert r["l4_states_eq_H3"] is True
    assert r["2l1_eq_N"] is True


def test_shell_structure_function():
    from urt.atomic_physics_cathedral import shell_structure
    r = shell_structure()
    assert r["shell_1_eq_D1"] is True
    assert r["shell_2_eq_2D"] is True
    assert r["shell_4_eq_2q"] is True
    assert r["total_eq_N2"] is True


def test_rydberg_analysis_function():
    from urt.atomic_physics_cathedral import rydberg_analysis
    r = rydberg_analysis()
    assert r["deviation_pct"] < 5.0


def test_atomic_summary():
    from urt.atomic_physics_cathedral import atomic_summary
    r = atomic_summary()
    assert "quantum_numbers" in r
    assert "shells" in r
    assert len(r["key_results"]) >= 5


def test_print_atomic_report(capsys):
    from urt.atomic_physics_cathedral import print_atomic_report
    print_atomic_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "D+1" in out or "4 quantum" in out
    assert len(out) > 200
