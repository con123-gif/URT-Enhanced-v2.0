"""
Tests for urt.quantum_urt — the Cathedral quantum lift of URT.

The QURT iteration is

    ρ_{k+1}  =  E_β ( U ρ_k U† )

with E_β an amplitude-damping-to-ground-state channel built in the
G_{13} Laplacian eigenbasis, per-mode rate p_i = β · λ_i / (2^q π²).

Tests verify, at machine precision where possible:

  1. The Kraus set is CPTP for every β ∈ [0, 1].
  2. Trace preservation, Hermiticity, and positive semi-definiteness
     of the output density operator under one and many iterations.
  3. The closed-form fixed point |φ_0⟩⟨φ_0| is *unique* and reached
     exponentially.
  4. Strict contraction in trace distance with rate ≥ β · D / (2^q π²)
     (Fiedler bound) at every step.
  5. The Cathedral margin closed form δ_max = D^(D+2)/(2^q π²) and
     its decomposition (1 − κ)/γ agree to machine precision.
  6. K_4 ⊕ A_5 sector trace identity:  tr(L|K_4) + tr(L|A_5) = 72.
  7. The Lytollis algebraic form δ = (D_KY − 1)(τ − 2) is preserved
     under the quantum interpretation.
"""
from math import pi, sqrt, factorial
import numpy as np
import pytest

from urt.quantum_urt import (
    # constants
    DYN_NORM, LYTOLLIS_GAMMA, LAMBDA_FIEDLER,
    KAPPA_QURT, MARGIN_QURT, DELTA_QURT_MAX,
    # channel
    cathedral_kraus_operators, is_cptp, apply_channel,
    # iteration
    qurt_step, qurt_evolve,
    # observables
    purity, trace_distance, von_neumann_entropy,
    # fixed point + convergence
    qurt_fixed_point, converges_to_fixed_point,
    empirical_contraction_ratio,
    exponential_convergence_rate,
    # Lytollis margin
    lytollis_delta_quantum, qurt_contraction_margin,
    # sectors
    qurt_sector_decomposition,
    # audit
    quantum_urt_audit, quantum_urt_audit_passes,
)
from urt.shell_closure import D, q, V, N, E, F, G, gamma


# ── Cathedral constants of the QURT module ───────────────────────────────

class TestCathedralConstants:
    def test_dynamical_norm_closed_form(self):
        """2^q · π² is the framework's natural unit of dynamical time."""
        assert DYN_NORM == pytest.approx(2 ** q * pi ** 2)

    def test_lytollis_gamma_is_1_over_81(self):
        assert LYTOLLIS_GAMMA == pytest.approx(1 / 81)
        assert LYTOLLIS_GAMMA == pytest.approx(D ** -(D + 1))

    def test_lambda_fiedler_equals_D(self):
        """The Fiedler eigenvalue of L_{G_13} is exactly D = 3."""
        assert LAMBDA_FIEDLER == D == 3

    def test_kappa_equals_one_minus_margin(self):
        assert KAPPA_QURT + MARGIN_QURT == pytest.approx(1.0)

    def test_margin_closed_form(self):
        """1 − κ = D / (2^q π²) (Fiedler-mode Cathedral closed form)."""
        assert MARGIN_QURT == pytest.approx(D / DYN_NORM)

    def test_delta_max_is_margin_over_gamma(self):
        assert DELTA_QURT_MAX == pytest.approx(MARGIN_QURT / LYTOLLIS_GAMMA)

    def test_delta_max_cathedral_closed_form(self):
        """δ_max = D^(D+2) / (2^q π²) — every factor a Cathedral integer."""
        assert DELTA_QURT_MAX == pytest.approx(D ** (D + 2) / DYN_NORM)


# ── Kraus operators: CPTP for every β ────────────────────────────────────

class TestCathedralKraus:
    @pytest.mark.parametrize("beta", [0.0, 0.1, 0.25, 0.5, 0.75, 0.99, 1.0])
    def test_cptp(self, beta):
        ops = cathedral_kraus_operators(beta=beta)
        assert is_cptp(ops, tol=1e-12)

    def test_at_beta_zero_is_identity_channel(self):
        ops = cathedral_kraus_operators(beta=0.0)
        # apply to a random density operator
        rng = np.random.default_rng(0)
        v = rng.normal(size=N) + 1j * rng.normal(size=N)
        v /= np.linalg.norm(v)
        rho = np.outer(v, v.conj())
        rho_after = apply_channel(rho, ops)
        assert np.allclose(rho_after, rho, atol=1e-12)

    def test_count_is_at_most_N(self):
        """Kraus rank is bounded by N (1 no-jump + up to N−1 jump ops)."""
        ops = cathedral_kraus_operators(beta=1.0)
        assert 1 <= len(ops) <= N

    def test_invalid_beta_raises(self):
        with pytest.raises(ValueError):
            cathedral_kraus_operators(beta=-0.1)
        with pytest.raises(ValueError):
            cathedral_kraus_operators(beta=1.5)


# ── Density-operator invariants under iteration ─────────────────────────

def random_density(rng, n=N):
    M = (rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n)))
    M = M @ M.conj().T
    return M / np.trace(M)


class TestDensityInvariants:
    def test_trace_preserved_one_step(self):
        rng = np.random.default_rng(1)
        rho = random_density(rng)
        rho_next = qurt_step(rho, beta=1.0)
        assert np.trace(rho_next).real == pytest.approx(1.0, abs=1e-12)

    def test_hermitian_preserved(self):
        rng = np.random.default_rng(2)
        rho = random_density(rng)
        rho_next = qurt_step(rho, beta=1.0)
        assert np.allclose(rho_next, rho_next.conj().T, atol=1e-12)

    def test_positive_semidefinite(self):
        rng = np.random.default_rng(3)
        rho = random_density(rng)
        rho_next = qurt_step(rho, beta=1.0)
        w = np.linalg.eigvalsh(0.5 * (rho_next + rho_next.conj().T))
        # tiny negative round-off is acceptable; real PSD violation is not
        assert w.min() > -1e-12

    def test_invariants_hold_after_long_trajectory(self):
        rng = np.random.default_rng(4)
        rho = random_density(rng)
        traj = qurt_evolve(rho, steps=100, beta=1.0)
        for r in traj:
            assert np.trace(r).real == pytest.approx(1.0, abs=1e-10)
            assert np.allclose(r, r.conj().T, atol=1e-10)


# ── Fixed point and convergence ──────────────────────────────────────────

class TestFixedPoint:
    def test_fixed_point_is_pure_density(self):
        rho_inf = qurt_fixed_point()
        # Tr = 1
        assert np.trace(rho_inf).real == pytest.approx(1.0, abs=1e-12)
        # Tr(ρ²) = 1 (pure state)
        assert purity(rho_inf) == pytest.approx(1.0, abs=1e-12)

    def test_fixed_point_is_invariant_under_channel(self):
        rho_inf = qurt_fixed_point()
        ops = cathedral_kraus_operators(beta=1.0)
        rho_after = apply_channel(rho_inf, ops)
        assert np.allclose(rho_inf, rho_after, atol=1e-12)

    def test_fixed_point_lives_in_K4_sector(self):
        """|φ_0⟩ is the constant null mode — the lowest L_{G_13} eigenvector,
        which is part of the K_4 (coherent) sector."""
        from urt.shell_closure import _L
        rho_inf = qurt_fixed_point()
        # The fixed point is the projector onto a Laplacian eigenvector
        # with eigenvalue 0.  Verify that L · v = 0 · v.
        w, U = np.linalg.eigh(_L)
        v = U[:, 0]
        rho_check = np.outer(v, v.conj())
        # The eigenvectors are sign-ambiguous; compare projectors
        assert np.allclose(rho_check, rho_inf, atol=1e-10)

    def test_convergence_from_random_state(self):
        """Any initial pure state converges to |φ_0⟩⟨φ_0| under E."""
        rng = np.random.default_rng(7)
        v = rng.normal(size=N) + 1j * rng.normal(size=N)
        v /= np.linalg.norm(v)
        rho = np.outer(v, v.conj())
        assert converges_to_fixed_point(rho, steps=5000, beta=1.0, tol=1e-3)


# ── Strict contraction (Lytollis quantum lift) ───────────────────────────

class TestContraction:
    def test_single_step_strict_contraction(self):
        """‖E(ρ_a) − E(ρ_b)‖_1 < ‖ρ_a − ρ_b‖_1 (strict)."""
        rng = np.random.default_rng(11)
        rho_a = random_density(rng)
        rho_b = random_density(rng)
        ratio = empirical_contraction_ratio(rho_a, rho_b, beta=1.0)
        assert ratio < 1.0

    def test_contraction_bounded_by_fiedler_rate(self):
        """The trace-distance contraction is at most 1 − D/(2^q π²)·β
        (slowest mode = Fiedler).  No state can contract slower than that."""
        rng = np.random.default_rng(13)
        # Construct ρ_a, ρ_b that differ on the Fiedler mode only.
        from urt.shell_closure import _L
        w, U = np.linalg.eigh(_L)
        v0, v1 = U[:, 0], U[:, 1]
        # |+⟩ in Fiedler subspace
        psi_plus = (v0 + v1) / sqrt(2)
        psi_minus = (v0 - v1) / sqrt(2)
        rho_a = np.outer(psi_plus, psi_plus.conj())
        rho_b = np.outer(psi_minus, psi_minus.conj())
        ratio = empirical_contraction_ratio(rho_a, rho_b, beta=1.0)
        # Off-diagonal at (0, Fiedler) decays as √(1 − p_1) per step
        expected = sqrt(1.0 - D / DYN_NORM)
        # Allow small slack (numerical)
        assert ratio <= expected + 1e-9

    def test_beta_zero_is_identity_contraction(self):
        rng = np.random.default_rng(15)
        rho_a, rho_b = random_density(rng), random_density(rng)
        ratio = empirical_contraction_ratio(rho_a, rho_b, beta=0.0)
        assert ratio == pytest.approx(1.0, abs=1e-12)

    def test_trace_distance_decreases_monotonically(self):
        rng = np.random.default_rng(17)
        rho_inf = qurt_fixed_point()
        v = rng.normal(size=N) + 1j * rng.normal(size=N)
        v /= np.linalg.norm(v)
        rho = np.outer(v, v.conj())
        ops = cathedral_kraus_operators(beta=1.0)
        d_prev = trace_distance(rho, rho_inf)
        for _ in range(20):
            rho = apply_channel(rho, ops)
            d = trace_distance(rho, rho_inf)
            assert d <= d_prev + 1e-12      # monotone non-increasing
            d_prev = d


# ── K_4 ⊕ A_5 sector decomposition ───────────────────────────────────────

class TestSectorDecomposition:
    def test_K4_sector_has_4_modes(self):
        s = qurt_sector_decomposition()
        assert len(s["K4_eigenvalues"]) == 4

    def test_A5_sector_has_9_modes(self):
        s = qurt_sector_decomposition()
        assert len(s["A5_eigenvalues"]) == 9

    def test_K4_trace_is_11(self):
        s = qurt_sector_decomposition()
        assert s["tr_K4"] == pytest.approx(11.0, abs=1e-9)

    def test_A5_trace_is_61(self):
        s = qurt_sector_decomposition()
        assert s["tr_A5"] == pytest.approx(61.0, abs=1e-9)

    def test_total_trace_is_Dfac_V(self):
        """tr(L) = D! · V = 6 · 12 = 72."""
        s = qurt_sector_decomposition()
        assert s["tr_total"] == pytest.approx(factorial(D) * V, abs=1e-9)
        assert s["tr_total"] == pytest.approx(72.0, abs=1e-9)

    def test_A5_sector_decoheres_faster_than_K4(self):
        """A_5 modes carry larger Laplacian eigenvalues → faster decoherence."""
        s = qurt_sector_decomposition()
        assert s["A5_to_K4_ratio"] > 1.0


# ── Lytollis-Law-style δ-margin closed forms ─────────────────────────────

class TestLytollisMargin:
    def test_lytollis_delta_formula(self):
        """δ = (D_KY − 1)(τ − 2) algebraically (quantum and classical)."""
        assert lytollis_delta_quantum(2.0, 3.0) == pytest.approx(1.0)
        assert lytollis_delta_quantum(1.07, 3.30) == pytest.approx(
            (1.07 - 1) * (3.30 - 2), abs=1e-12
        )

    def test_margin_closed_form_agrees_with_decomposition(self):
        m = qurt_contraction_margin()
        assert m["agreement"]
        assert m["delta_max"] == pytest.approx(m["delta_max_closed"], abs=1e-12)

    def test_margin_uses_only_Cathedral_integers(self):
        """δ_max = D^(D+2) / (2^q π²) — only {D, q} appear as integers."""
        m = qurt_contraction_margin()
        # Reconstruct from D, q, pi
        rebuilt = D ** (D + 2) / ((2 ** q) * pi ** 2)
        assert m["delta_max_closed"] == pytest.approx(rebuilt, abs=1e-15)


# ── Exponential convergence ──────────────────────────────────────────────

class TestConvergence:
    def test_half_life_finite(self):
        c = exponential_convergence_rate(beta=1.0)
        assert 0 < c["half_life_steps"] < 1000

    def test_zero_beta_no_decay(self):
        c = exponential_convergence_rate(beta=0.0)
        assert c["half_life_steps"] == float("inf")

    def test_decay_rate_matches_Fiedler(self):
        c = exponential_convergence_rate(beta=1.0)
        assert c["per_step_decay_rate"] == pytest.approx(D / DYN_NORM, abs=1e-12)


# ── Quantum observables make sense ───────────────────────────────────────

class TestQuantumObservables:
    def test_purity_pure_state(self):
        rho_inf = qurt_fixed_point()
        assert purity(rho_inf) == pytest.approx(1.0, abs=1e-12)

    def test_purity_max_mixed(self):
        rho = np.eye(N, dtype=complex) / N
        assert purity(rho) == pytest.approx(1 / N, abs=1e-12)

    def test_trace_distance_zero(self):
        rho_inf = qurt_fixed_point()
        assert trace_distance(rho_inf, rho_inf) == pytest.approx(0.0, abs=1e-12)

    def test_trace_distance_orthogonal_pure_states_is_one(self):
        from urt.shell_closure import _L
        w, U = np.linalg.eigh(_L)
        rho_a = np.outer(U[:, 0], U[:, 0].conj())
        rho_b = np.outer(U[:, 1], U[:, 1].conj())
        assert trace_distance(rho_a, rho_b) == pytest.approx(1.0, abs=1e-9)

    def test_entropy_pure_state_zero(self):
        rho_inf = qurt_fixed_point()
        assert von_neumann_entropy(rho_inf) == pytest.approx(0.0, abs=1e-12)

    def test_entropy_max_mixed_is_log_N(self):
        rho = np.eye(N, dtype=complex) / N
        assert von_neumann_entropy(rho) == pytest.approx(np.log(N), abs=1e-9)

    def test_purity_rises_to_one_under_QURT(self):
        """Approach to the pure fixed-point ⇒ long-run purity → 1.

        Purity is *not* monotone step-by-step (initial off-diagonal
        decay can temporarily increase mixedness), but it must rise
        toward 1 across a long trajectory.  Tested on N²-scale steps.
        """
        rng = np.random.default_rng(19)
        rho = random_density(rng)
        ops = cathedral_kraus_operators(beta=1.0)
        p0 = purity(rho)
        for _ in range(2000):
            rho = apply_channel(rho, ops)
        p_final = purity(rho)
        assert p_final > 0.99
        assert p_final > p0


# ── End-to-end audit ─────────────────────────────────────────────────────

def test_quantum_urt_audit_passes():
    assert quantum_urt_audit_passes()


def test_quantum_urt_audit_returns_dict_with_expected_keys():
    a = quantum_urt_audit()
    for key in (
        "cathedral_margin", "sector_split", "convergence",
        "cptp_all_betas", "converges_to_fixed",
        "contraction_ratio", "contraction_strict",
        "framework_role",
    ):
        assert key in a


# ── Sanity tying the module to the rest of the framework ─────────────────

class TestFrameworkIntegration:
    def test_cathedral_dynamical_norm_matches_chaos_and_flow(self):
        """The 2^q·π² normalisation is shared with urt.chaos_and_flow."""
        from urt.chaos_and_flow import DYNAMICAL_NORMALISATION
        assert DYN_NORM == pytest.approx(DYNAMICAL_NORMALISATION, abs=1e-15)

    def test_lytollis_gamma_matches_shell_closure(self):
        assert LYTOLLIS_GAMMA == gamma

    def test_lytollis_formula_matches_classical(self):
        """The quantum δ formula is algebraically identical to the
        classical Lytollis formula in urt.lytollis_bounded_chaos."""
        from urt.lytollis_bounded_chaos import lytollis_delta
        for D_KY, tau in [(1.07, 3.30), (2.05, 2.60), (2.30, 2.20)]:
            assert lytollis_delta_quantum(D_KY, tau) == pytest.approx(
                lytollis_delta(D_KY, tau), abs=1e-15
            )
