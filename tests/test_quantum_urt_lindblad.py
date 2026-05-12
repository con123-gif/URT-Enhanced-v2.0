"""
Tests for the π-φ-e continuous-time Lindblad lift in urt.quantum_urt.

The natural quantum lift of the classical π-φ-e flow on G_{13} is the
Lindblad master equation

    dρ/dt  =  −i·(φ−1)·e^(−t/τ)·[L_{G_13}, ρ]  +  (1/(4π))·Σ_i λ_i · D[|φ_0⟩⟨φ_i|](ρ)

with τ = 10.  Tests verify, at machine precision:

  1. Each transcendental's Cathedral closed-form coefficient.
  2. Trotter step at  dt = η = 1/(8π)  reduces to the discrete QURT step.
  3. Product η · η_L = 1 / (2^q · π²) = Cathedral dynamical normalisation.
  4. Lindblad evolution preserves trace/Hermiticity/PSD.
  5. Lindblad flow converges to the same fixed point as the discrete QURT.
  6. Single-line audit `quantum_pi_phi_e_audit_passes()` returns True.
"""
from math import pi, sqrt, exp, log
import numpy as np
import pytest

from urt.quantum_urt import (
    # constants
    ETA_LIND, PHI, MU_LIND_0, TAU_LIND, ETA_TIME_STEP, DYN_NORM,
    # operators
    cathedral_lindblad_jump_operators, cathedral_lindblad_rates,
    cathedral_lindblad_hamiltonian, cathedral_pull_strength,
    cathedral_lindblad_rhs,
    cathedral_lindblad_step, cathedral_pi_phi_e_evolve,
    lindblad_step_equals_discrete_qurt,
    pi_phi_e_quantum_flow_summary,
    quantum_pi_phi_e_audit_passes,
    # for comparison
    qurt_step, qurt_fixed_point, trace_distance, purity,
)
from urt.shell_closure import D, q, V, N, E, F, G, _L, gamma


# ── Each transcendental enters via Cathedral closed form ─────────────────

class TestTranscendentalCoefficients:
    def test_pi_in_dissipator_coefficient(self):
        """η_L = 1/(4π) — same as classical, same forcing reason."""
        assert ETA_LIND == pytest.approx(1.0 / (4.0 * pi), abs=1e-15)

    def test_phi_in_pull_coefficient(self):
        """μ_0 = φ − 1 = 1/φ — A_5 self-similarity rate."""
        golden = (1 + sqrt(5)) / 2
        assert MU_LIND_0 == pytest.approx(golden - 1, abs=1e-15)
        assert MU_LIND_0 == pytest.approx(1.0 / golden, abs=1e-15)

    def test_e_in_envelope(self):
        """e^(−t/τ) with τ = 10 = longest mixing time on G_{13}."""
        assert TAU_LIND == 10.0
        # at t=0: μ(0) = μ_0
        assert cathedral_pull_strength(0.0) == pytest.approx(MU_LIND_0, abs=1e-15)
        # at t=τ: μ(τ) = μ_0 / e
        assert cathedral_pull_strength(TAU_LIND) == pytest.approx(
            MU_LIND_0 / exp(1), abs=1e-15
        )

    def test_trotter_step_is_eta(self):
        """Natural Trotter step dt = η = 1/(8π)."""
        assert ETA_TIME_STEP == pytest.approx(1.0 / (8.0 * pi), abs=1e-15)

    def test_product_eta_etaL_equals_inverse_cathedral_dyn_norm(self):
        """η · η_L = 1/(2^q · π²) — Cathedral dynamical normalisation."""
        assert ETA_TIME_STEP * ETA_LIND == pytest.approx(
            1.0 / DYN_NORM, abs=1e-15
        )
        # Cross-check the exponents: η · η_L = 1/(8π · 4π) = 1/(32π²) = 1/(2^5 π²)
        assert 8 * pi * 4 * pi == pytest.approx(2 ** q * pi ** 2, abs=1e-12)


# ── Lindblad operators are correctly built ───────────────────────────────

class TestLindbladOperators:
    def test_jump_operator_count(self):
        """One jump operator per non-zero Laplacian eigenvalue (= 12)."""
        ops = cathedral_lindblad_jump_operators()
        assert len(ops) == N - 1            # 12 excited modes

    def test_jump_operators_amplitude_damping_shape(self):
        """Each jump op = √γ_i · |φ_0⟩⟨φ_i| has rank 1."""
        for L_op in cathedral_lindblad_jump_operators():
            assert np.linalg.matrix_rank(L_op) == 1

    def test_lindblad_rates_match_laplacian_eigenvalues(self):
        """γ_i = λ_i / (4π) — same η_L = 1/(4π) for every mode."""
        rates = cathedral_lindblad_rates()
        w_L = np.sort(np.linalg.eigvalsh(_L))
        assert np.allclose(np.sort(rates), w_L / (4 * pi), atol=1e-12)

    def test_lindblad_hamiltonian_is_laplacian(self):
        H = cathedral_lindblad_hamiltonian()
        assert np.allclose(H, _L, atol=1e-12)
        # Hermitian
        assert np.allclose(H, H.conj().T, atol=1e-12)

    def test_pull_strength_decays_exponentially(self):
        t_vals = [0.0, 5.0, 10.0, 20.0, 50.0]
        for t in t_vals:
            assert cathedral_pull_strength(t) == pytest.approx(
                MU_LIND_0 * exp(-t / TAU_LIND), abs=1e-12
            )


# ── Trotter step ↔ discrete QURT equivalence (the key theorem) ───────────

class TestTrotterEquivalence:
    def test_lindblad_step_equals_discrete_QURT(self):
        """At dt = η, t → ∞ (no coherent drive), the Lindblad Trotter step
        equals the discrete QURT step to machine precision."""
        assert lindblad_step_equals_discrete_qurt(tol=1e-10)

    def test_explicit_equivalence(self):
        """Direct numerical check on a random density operator."""
        rng = np.random.default_rng(0)
        M = (rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N)))
        rho = M @ M.conj().T
        rho /= np.trace(rho)
        # discrete QURT
        rho_qurt = qurt_step(rho, beta=1.0)
        # Lindblad at t → ∞ (no coherent drive)
        rho_lind = cathedral_lindblad_step(rho, t=1e6, dt=ETA_TIME_STEP)
        assert np.linalg.norm(rho_qurt - rho_lind, ord="fro") < 1e-10

    def test_finite_t_differs_from_discrete(self):
        """At t = 0 the coherent drive is active → the Lindblad step
        and the no-unitary QURT step differ."""
        rng = np.random.default_rng(1)
        M = (rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N)))
        rho = M @ M.conj().T
        rho /= np.trace(rho)
        rho_qurt = qurt_step(rho, beta=1.0)
        rho_lind = cathedral_lindblad_step(rho, t=0.0, dt=ETA_TIME_STEP)
        # The coherent rotation at t=0 with μ_0 ≈ 0.618 should be non-trivial
        diff = np.linalg.norm(rho_qurt - rho_lind, ord="fro")
        assert diff > 1e-6


# ── Lindblad evolution preserves CPTP invariants ─────────────────────────

class TestLindbladInvariants:
    def test_trace_preserved(self):
        rng = np.random.default_rng(2)
        M = (rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N)))
        rho = M @ M.conj().T
        rho /= np.trace(rho)
        traj = cathedral_pi_phi_e_evolve(rho, T=20.0, dt=ETA_TIME_STEP)
        for r in traj[::20]:        # check every 20 steps
            assert abs(np.trace(r).real - 1.0) < 1e-9

    def test_hermitian_preserved(self):
        rng = np.random.default_rng(3)
        M = (rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N)))
        rho = M @ M.conj().T
        rho /= np.trace(rho)
        traj = cathedral_pi_phi_e_evolve(rho, T=10.0, dt=ETA_TIME_STEP)
        for r in traj[::20]:
            assert np.linalg.norm(r - r.conj().T, ord="fro") < 1e-9

    def test_psd_preserved(self):
        rng = np.random.default_rng(4)
        M = (rng.normal(size=(N, N)) + 1j * rng.normal(size=(N, N)))
        rho = M @ M.conj().T
        rho /= np.trace(rho)
        traj = cathedral_pi_phi_e_evolve(rho, T=15.0, dt=ETA_TIME_STEP)
        for r in traj[::20]:
            w = np.linalg.eigvalsh(0.5 * (r + r.conj().T))
            assert w.min() > -1e-9


# ── Lindblad converges to the QURT fixed point ───────────────────────────

class TestLindbladConvergence:
    def test_converges_to_fixed_point(self):
        """The Lindblad evolution drives any initial state to
        |φ_0⟩⟨φ_0|, the same fixed point as the discrete QURT."""
        rng = np.random.default_rng(5)
        v = rng.normal(size=N) + 1j * rng.normal(size=N)
        v /= np.linalg.norm(v)
        rho = np.outer(v, v.conj())
        traj = cathedral_pi_phi_e_evolve(rho, T=200.0, dt=ETA_TIME_STEP)
        rho_inf = qurt_fixed_point()
        d = trace_distance(traj[-1], rho_inf)
        assert d < 1e-2

    def test_purity_rises_to_one(self):
        rng = np.random.default_rng(6)
        v = rng.normal(size=N) + 1j * rng.normal(size=N)
        v /= np.linalg.norm(v)
        rho = np.outer(v, v.conj())
        traj = cathedral_pi_phi_e_evolve(rho, T=200.0, dt=ETA_TIME_STEP)
        assert purity(traj[-1]) > 0.99


# ── The single-line π-φ-e audit ──────────────────────────────────────────

def test_quantum_pi_phi_e_audit_passes():
    """All Cathedral closed forms hold; Trotter equivalence holds."""
    assert quantum_pi_phi_e_audit_passes()


def test_summary_returns_expected_structure():
    s = pi_phi_e_quantum_flow_summary()
    for key in (
        "pi_appears_in", "phi_appears_in", "e_appears_in",
        "trotter_step_dt", "uniqueness_theorem",
    ):
        assert key in s
    # And each transcendental's "origin" is documented
    assert "surface measure" in s["pi_appears_in"]["origin"].lower()
    assert "self-similarity" in s["phi_appears_in"]["origin"].lower()
    assert "semigroup" in s["e_appears_in"]["origin"].lower()


# ── Cross-check vs. urt.first_principles (the classical forcing chain) ───

class TestClassicalQuantumForcingMatch:
    def test_pi_coefficient_matches_classical(self):
        """The classical forcing-chain step gives η_L = 1/(4π) — same as
        the quantum Lindbladian's dissipator coefficient."""
        from urt.first_principles import laplacian_coefficient_from_sphere
        eta_L_classical = laplacian_coefficient_from_sphere()
        assert eta_L_classical == pytest.approx(ETA_LIND, abs=1e-12)

    def test_phi_coefficient_matches_classical(self):
        """μ_classical = φ − 1 (urt.cathedral_engine.MU_PULL)."""
        from urt.cathedral_engine import MU_PULL
        assert MU_LIND_0 == pytest.approx(MU_PULL, abs=1e-15)

    def test_tau_matches_classical(self):
        """τ_classical = 10 (urt.cathedral_engine.TAU_RELAX)."""
        from urt.cathedral_engine import TAU_RELAX
        assert TAU_LIND == TAU_RELAX
