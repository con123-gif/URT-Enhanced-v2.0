"""Tests for urt/quantum_optics_cathedral.py — Quantum optics and Cathedral integers."""

import pytest
from math import isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.quantum_optics_cathedral import (
        FOCK_VACUUM_N,
        N_QUBIT_BLOCH_DIMS,
        N_SU2_GENERATORS,
        COHERENT_STATE_POISSON_MEAN,
        N_MODES_SQUEEZED,
        BEAM_SPLITTER_MODES,
        WIGNER_FUNCTION_PHASE_DIM,
        JAYNES_CUMMINGS_COUPLING,
        N_PHOTON_NUMBER_STATES_ICOS,
        LAMB_DICKE_PARAM,
        HONG_OU_MANDEL_DIP,
        SQUEEZING_PARAM,
        RABI_FREQ_NORMALIZED,
        PURCELL_ICOS_MODES,
        MANDEL_Q_COHERENT,
        COHERENT_MEAN_PHOTON_N,
        QUANTUM_EFFICIENCY,
        bloch_sphere,
        jaynes_cummings,
        coherent_state_distribution,
        quantum_optics_summary,
        print_quantum_optics_report,
    )


# ── Fock vacuum ───────────────────────────────────────────────────────────────

def test_fock_vacuum_is_zero():
    from urt.quantum_optics_cathedral import FOCK_VACUUM_N
    assert FOCK_VACUUM_N == 0


# ── Bloch sphere constants ────────────────────────────────────────────────────

def test_bloch_dims_eq_D():
    """Bloch sphere embedding = D = 3  [EXACT]."""
    from urt.quantum_optics_cathedral import N_QUBIT_BLOCH_DIMS
    from urt.shell_closure import D
    assert N_QUBIT_BLOCH_DIMS == D
    assert N_QUBIT_BLOCH_DIMS == 3


def test_su2_generators_eq_D():
    """SU(2) has D=3 generators (Pauli matrices)  [EXACT]."""
    from urt.quantum_optics_cathedral import N_SU2_GENERATORS
    from urt.shell_closure import D
    assert N_SU2_GENERATORS == D
    assert N_SU2_GENERATORS == 3


def test_modes_squeezed_eq_D_minus_1():
    """Two-mode squeezing involves D-1=2 modes  [EXACT]."""
    from urt.quantum_optics_cathedral import N_MODES_SQUEEZED
    from urt.shell_closure import D
    assert N_MODES_SQUEEZED == D - 1
    assert N_MODES_SQUEEZED == 2


def test_beam_splitter_modes_eq_D_minus_1():
    """Beam splitter mixes D-1=2 modes  [EXACT]."""
    from urt.quantum_optics_cathedral import BEAM_SPLITTER_MODES
    from urt.shell_closure import D
    assert BEAM_SPLITTER_MODES == D - 1
    assert BEAM_SPLITTER_MODES == 2


def test_wigner_phase_dim_eq_D_minus_1():
    """Wigner function lives on D-1=2 dimensional phase space  [EXACT]."""
    from urt.quantum_optics_cathedral import WIGNER_FUNCTION_PHASE_DIM
    from urt.shell_closure import D
    assert WIGNER_FUNCTION_PHASE_DIM == D - 1
    assert WIGNER_FUNCTION_PHASE_DIM == 2


# ── Jaynes-Cummings constants ─────────────────────────────────────────────────

def test_jc_coupling_eq_delta_star():
    """JC coupling g = δ★  [Cathedral]."""
    from urt.quantum_optics_cathedral import JAYNES_CUMMINGS_COUPLING
    from urt.shell_closure import DELTA_STAR
    assert abs(JAYNES_CUMMINGS_COUPLING - DELTA_STAR) < 1e-12
    assert JAYNES_CUMMINGS_COUPLING > 0
    assert JAYNES_CUMMINGS_COUPLING < 1


def test_lamb_dicke_eq_delta_star():
    """Lamb-Dicke parameter η = δ★  [Cathedral]."""
    from urt.quantum_optics_cathedral import LAMB_DICKE_PARAM
    from urt.shell_closure import DELTA_STAR
    assert abs(LAMB_DICKE_PARAM - DELTA_STAR) < 1e-12


def test_rabi_freq_is_2_delta():
    """Rabi frequency Ω_R = 2δ★."""
    from urt.quantum_optics_cathedral import RABI_FREQ_NORMALIZED
    from urt.shell_closure import DELTA_STAR
    assert abs(RABI_FREQ_NORMALIZED - 2.0 * DELTA_STAR) < 1e-12


# ── Photon number / icosahedral constants ──────────────────────────────────────

def test_photon_states_eq_N():
    """Icosahedral Fock truncation = N = 13."""
    from urt.quantum_optics_cathedral import N_PHOTON_NUMBER_STATES_ICOS
    from urt.shell_closure import N
    assert N_PHOTON_NUMBER_STATES_ICOS == N
    assert N_PHOTON_NUMBER_STATES_ICOS == 13


def test_coherent_mean_eq_N():
    """Coherent state mean photon number = N = 13."""
    from urt.quantum_optics_cathedral import COHERENT_MEAN_PHOTON_N
    from urt.shell_closure import N
    assert abs(COHERENT_MEAN_PHOTON_N - float(N)) < 1e-12
    assert abs(COHERENT_MEAN_PHOTON_N - 13.0) < 1e-12


def test_coherent_poisson_mean_eq_N():
    """Coherent state Poisson mean = N = 13."""
    from urt.quantum_optics_cathedral import COHERENT_STATE_POISSON_MEAN
    from urt.shell_closure import N
    assert COHERENT_STATE_POISSON_MEAN == N


def test_purcell_modes_eq_N():
    """Purcell cavity modes = N = 13."""
    from urt.quantum_optics_cathedral import PURCELL_ICOS_MODES
    from urt.shell_closure import N
    assert PURCELL_ICOS_MODES == N


# ── Hong-Ou-Mandel ────────────────────────────────────────────────────────────

def test_hom_dip_is_one():
    """Perfect HOM dip = 1.0 (indistinguishable photons)."""
    from urt.quantum_optics_cathedral import HONG_OU_MANDEL_DIP
    assert abs(HONG_OU_MANDEL_DIP - 1.0) < 1e-12


# ── Mandel Q ──────────────────────────────────────────────────────────────────

def test_mandel_Q_coherent_zero():
    """Mandel Q = 0 for coherent state (Poissonian)."""
    from urt.quantum_optics_cathedral import MANDEL_Q_COHERENT
    assert abs(MANDEL_Q_COHERENT) < 1e-12


# ── Quantum efficiency ────────────────────────────────────────────────────────

def test_quantum_efficiency():
    """Detector efficiency = 1 - δ★."""
    from urt.quantum_optics_cathedral import QUANTUM_EFFICIENCY
    from urt.shell_closure import DELTA_STAR
    assert abs(QUANTUM_EFFICIENCY - (1.0 - DELTA_STAR)) < 1e-12
    assert 0.8 < QUANTUM_EFFICIENCY < 1.0


# ── Squeezing parameter ───────────────────────────────────────────────────────

def test_squeezing_param_eq_delta():
    """Squeezing parameter r = δ★."""
    from urt.quantum_optics_cathedral import SQUEEZING_PARAM
    from urt.shell_closure import DELTA_STAR
    assert abs(SQUEEZING_PARAM - DELTA_STAR) < 1e-12


# ── bloch_sphere() function ───────────────────────────────────────────────────

def test_bloch_sphere_returns_dict():
    from urt.quantum_optics_cathedral import bloch_sphere
    r = bloch_sphere()
    assert isinstance(r, dict)


def test_bloch_sphere_bloch_dims():
    from urt.quantum_optics_cathedral import bloch_sphere
    from urt.shell_closure import D
    r = bloch_sphere()
    assert r["bloch_dims"] == D
    assert r["bloch_dims"] == 3


def test_bloch_sphere_dims_eq_D_flag():
    from urt.quantum_optics_cathedral import bloch_sphere
    r = bloch_sphere()
    assert r["bloch_dims_eq_D"] is True


def test_bloch_sphere_su2_eq_D_flag():
    from urt.quantum_optics_cathedral import bloch_sphere
    r = bloch_sphere()
    assert r["su2_eq_D"] is True


def test_bloch_sphere_modes_squeezed():
    from urt.quantum_optics_cathedral import bloch_sphere
    from urt.shell_closure import D
    r = bloch_sphere()
    assert r["modes_squeezed"] == D - 1
    assert r["modes_squeezed"] == 2


def test_bloch_sphere_modes_squeezed_flag():
    from urt.quantum_optics_cathedral import bloch_sphere
    r = bloch_sphere()
    assert r["modes_squeezed_eq_D1"] is True


def test_bloch_sphere_wigner_dim():
    from urt.quantum_optics_cathedral import bloch_sphere
    from urt.shell_closure import D
    r = bloch_sphere()
    assert r["wigner_phase_dim"] == D - 1


def test_bloch_sphere_beam_splitter():
    from urt.quantum_optics_cathedral import bloch_sphere
    from urt.shell_closure import D
    r = bloch_sphere()
    assert r["beam_splitter_modes"] == D - 1


# ── jaynes_cummings() function ────────────────────────────────────────────────

def test_jc_returns_dict():
    from urt.quantum_optics_cathedral import jaynes_cummings
    r = jaynes_cummings()
    assert isinstance(r, dict)


def test_jc_coupling_value():
    from urt.quantum_optics_cathedral import jaynes_cummings
    from urt.shell_closure import DELTA_STAR
    r = jaynes_cummings()
    assert abs(r["coupling"] - DELTA_STAR) < 1e-12


def test_jc_coupling_flag():
    from urt.quantum_optics_cathedral import jaynes_cummings
    r = jaynes_cummings()
    assert r["coupling_eq_delta"] is True


def test_jc_modes():
    from urt.quantum_optics_cathedral import jaynes_cummings
    from urt.shell_closure import D
    r = jaynes_cummings()
    assert r["modes"] == D - 1
    assert r["modes"] == 2


def test_jc_fock_eq_N():
    from urt.quantum_optics_cathedral import jaynes_cummings
    from urt.shell_closure import N
    r = jaynes_cummings()
    assert r["fock_truncation"] == N
    assert r["fock_eq_N"] is True


def test_jc_photon_mean():
    from urt.quantum_optics_cathedral import jaynes_cummings
    from urt.shell_closure import N
    r = jaynes_cummings()
    assert abs(r["photon_mean"] - float(N)) < 1e-12


def test_jc_hom_dip():
    from urt.quantum_optics_cathedral import jaynes_cummings
    r = jaynes_cummings()
    assert abs(r["hom_dip"] - 1.0) < 1e-12


def test_jc_lamb_dicke_flag():
    from urt.quantum_optics_cathedral import jaynes_cummings
    r = jaynes_cummings()
    assert r["lamb_dicke_eq_delta"] is True


# ── coherent_state_distribution() ────────────────────────────────────────────

def test_coherent_dist_default_length():
    from urt.quantum_optics_cathedral import coherent_state_distribution
    from urt.shell_closure import N
    probs = coherent_state_distribution()
    assert len(probs) == N + 1  # 0 to N inclusive


def test_coherent_dist_sum_approx_one():
    """Sum of Poisson distribution over 0..N ≈ 1 for large N (partial)."""
    from urt.quantum_optics_cathedral import coherent_state_distribution
    probs = coherent_state_distribution(n_max=100)
    assert abs(sum(probs) - 1.0) < 1e-6


def test_coherent_dist_all_positive():
    from urt.quantum_optics_cathedral import coherent_state_distribution
    probs = coherent_state_distribution()
    assert all(p >= 0 for p in probs)


def test_coherent_dist_custom_n_max():
    from urt.quantum_optics_cathedral import coherent_state_distribution
    probs = coherent_state_distribution(n_max=5)
    assert len(probs) == 6


# ── quantum_optics_summary() ──────────────────────────────────────────────────

def test_summary_returns_dict():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    s = quantum_optics_summary()
    assert isinstance(s, dict)


def test_summary_has_bloch_key():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    s = quantum_optics_summary()
    assert "bloch" in s


def test_summary_has_jc_key():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    s = quantum_optics_summary()
    assert "jc" in s


def test_summary_has_key_results():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    s = quantum_optics_summary()
    assert "key_results" in s
    assert isinstance(s["key_results"], list)
    assert len(s["key_results"]) >= 5


def test_summary_key_results_contain_EXACT():
    """Key results should mention EXACT for D=3 connections."""
    from urt.quantum_optics_cathedral import quantum_optics_summary
    s = quantum_optics_summary()
    exact_count = sum(1 for r in s["key_results"] if "EXACT" in r)
    assert exact_count >= 3


def test_summary_delta_star_value():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    from urt.shell_closure import DELTA_STAR
    s = quantum_optics_summary()
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12


def test_summary_N_value():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    from urt.shell_closure import N
    s = quantum_optics_summary()
    assert s["N"] == N


def test_summary_D_value():
    from urt.quantum_optics_cathedral import quantum_optics_summary
    from urt.shell_closure import D
    s = quantum_optics_summary()
    assert s["D"] == D


# ── print_quantum_optics_report() ────────────────────────────────────────────

def test_print_report_runs(capsys):
    from urt.quantum_optics_cathedral import print_quantum_optics_report
    print_quantum_optics_report()
    captured = capsys.readouterr()
    assert "QUANTUM OPTICS" in captured.out
    assert "EXACT" in captured.out
    assert "δ★" in captured.out


def test_print_report_contains_bloch(capsys):
    from urt.quantum_optics_cathedral import print_quantum_optics_report
    print_quantum_optics_report()
    captured = capsys.readouterr()
    assert "Bloch" in captured.out or "bloch" in captured.out.lower()


def test_print_report_contains_jc(capsys):
    from urt.quantum_optics_cathedral import print_quantum_optics_report
    print_quantum_optics_report()
    captured = capsys.readouterr()
    assert "Jaynes" in captured.out or "JC" in captured.out or "coupling" in captured.out.lower()
