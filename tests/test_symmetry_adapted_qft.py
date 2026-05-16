"""Tests for `urt.symmetry_adapted_qft`.

Five layers, tested independently:
  1. Chaos → π-φ-e flow → structure formation (Claim A: variance → 0)
  2. Sustained-pull → δ★ selection (Claim B: mean → δ★)
  4. Attractor-selected basis: orthonormal, diagonalizes L, Cathedral spectrum
  5. Per-sector propagators: K_4 has no γ-shift, A_5 has γ-shift on pole

Plus the cubic coupling tensor / sector-block summary and the single CI gate.
"""
from __future__ import annotations

import numpy as np
import pytest

from urt.cathedral_engine import (
    cathedral_laplacian, delta_star, gamma, D, q, V, N, F, G,
)
from urt.symmetry_adapted_qft import (
    K4_DIM, A5_DIM, K4_TRACE_TARGET, A5_TRACE_TARGET, L_TRACE_TARGET,
    chaos_selects_delta_star,
    fluctuation_hessian_at_delta_star,
    attractor_selected_basis, symmetry_adapted_basis,
    K4_basis, A5_basis,
    mode_eigenvalue, mode_sector,
    propagator,
    K4_pole_masses_squared, A5_pole_masses_squared,
    cubic_coupling_tensor, sector_block_norm, selection_rule_summary,
    cathedral_qft_audit, cathedral_qft_audit_passes,
    print_cathedral_qft_report,
)


# ────────────────────────────────────────────────────────────────────────
# Sector-dimension constants
# ────────────────────────────────────────────────────────────────────────

class TestSectorDimensions:

    def test_K4_dim_is_D_plus_1(self):
        assert K4_DIM == D + 1 == 4

    def test_A5_dim_is_D_squared(self):
        assert A5_DIM == D * D == 9

    def test_dimensions_sum_to_N(self):
        assert K4_DIM + A5_DIM == N == 13

    def test_K4_trace_target_is_11(self):
        assert K4_TRACE_TARGET == 11

    def test_A5_trace_target_is_61(self):
        assert A5_TRACE_TARGET == 61

    def test_L_trace_target_is_D_factorial_times_V(self):
        # D! * V = 6 * 12 = 72
        from math import factorial
        assert L_TRACE_TARGET == factorial(D) * V == 72


# ────────────────────────────────────────────────────────────────────────
# Layer 1-3: chaos → π-φ-e flow → δ★ selection
# ────────────────────────────────────────────────────────────────────────

class TestChaosSelection:

    def test_structure_formation_at_canonical_tau(self):
        """Claim A: chaotic initial field collapses to ~zero variance at τ=10."""
        sel = chaos_selects_delta_star(n_trials=8, steps=400, seed=0)
        assert sel["structure_formation_holds"] is True
        # Variance collapses by many orders of magnitude
        assert sel["structure_formation_variance"] < 1e-3

    def test_delta_star_selection_with_sustained_pull(self):
        """Claim B: sustained pull (τ=1000) drags mean to δ★ to ppm."""
        sel = chaos_selects_delta_star(n_trials=8, steps=400, seed=0)
        assert sel["delta_star_selection_holds"] is True
        # Convergence to within 1e-3 of δ★ across all trials
        assert sel["delta_star_selection_max_dev"] < 1e-3

    def test_combined_convergence(self):
        sel = chaos_selects_delta_star(n_trials=8, steps=400, seed=0)
        assert sel["converged"] is True

    def test_delta_star_target_matches_engine(self):
        sel = chaos_selects_delta_star(n_trials=4, steps=200, seed=1)
        assert sel["delta_star_target"] == delta_star

    def test_distinct_seeds_give_consistent_results(self):
        """Both claims hold across independent seeds (selection is deterministic)."""
        for seed in (0, 7, 42):
            sel = chaos_selects_delta_star(n_trials=6, steps=300, seed=seed)
            assert sel["structure_formation_holds"]
            assert sel["delta_star_selection_holds"]


# ────────────────────────────────────────────────────────────────────────
# Layer 4: attractor-selected basis
# ────────────────────────────────────────────────────────────────────────

class TestAttractorSelectedBasis:

    def test_basis_shape(self):
        V_mat, eigvals = attractor_selected_basis()
        assert V_mat.shape == (N, N)
        assert eigvals.shape == (N,)

    def test_basis_orthonormal_to_machine_precision(self):
        V_mat, _ = attractor_selected_basis()
        residual = float(np.max(np.abs(V_mat.T @ V_mat - np.eye(N))))
        assert residual < 1e-13

    def test_basis_diagonalizes_laplacian(self):
        V_mat, _ = attractor_selected_basis()
        L = cathedral_laplacian()
        M = V_mat.T @ L @ V_mat
        off_diag = M - np.diag(np.diag(M))
        assert float(np.max(np.abs(off_diag))) < 1e-12

    def test_eigenvalues_are_cathedral_integers(self):
        _, eigvals = attractor_selected_basis()
        rounded = np.round(eigvals)
        assert float(np.max(np.abs(eigvals - rounded))) < 1e-10
        # Cathedral integers in the spectrum: {0, 3, 5, 7, 9, 13}
        distinct = set(rounded.astype(int).tolist())
        assert distinct == {0, 3, 5, 7, 9, 13}

    def test_K4_block_eigenvalues_are_0_3_3_5(self):
        _, eigvals = attractor_selected_basis()
        K4_eigs = sorted(np.round(eigvals[:K4_DIM]).astype(int).tolist())
        assert K4_eigs == [0, 3, 3, 5]

    def test_A5_block_eigenvalues_are_5x5_7x2_9_13(self):
        _, eigvals = attractor_selected_basis()
        A5_eigs = sorted(np.round(eigvals[K4_DIM:]).astype(int).tolist())
        assert A5_eigs == [5, 5, 5, 5, 5, 7, 7, 9, 13]

    def test_K4_trace_is_11(self):
        _, eigvals = attractor_selected_basis()
        assert abs(float(eigvals[:K4_DIM].sum()) - K4_TRACE_TARGET) < 1e-10

    def test_A5_trace_is_61(self):
        _, eigvals = attractor_selected_basis()
        assert abs(float(eigvals[K4_DIM:].sum()) - A5_TRACE_TARGET) < 1e-10

    def test_total_trace_is_D_factorial_times_V(self):
        _, eigvals = attractor_selected_basis()
        assert abs(float(eigvals.sum()) - L_TRACE_TARGET) < 1e-10

    def test_symmetry_adapted_basis_is_alias(self):
        V1, e1 = symmetry_adapted_basis()
        V2, e2 = attractor_selected_basis()
        np.testing.assert_array_equal(V1, V2)
        np.testing.assert_array_equal(e1, e2)

    def test_K4_basis_returns_first_4_columns(self):
        V_mat, _ = attractor_selected_basis()
        np.testing.assert_array_equal(K4_basis(), V_mat[:, :K4_DIM])

    def test_A5_basis_returns_last_9_columns(self):
        V_mat, _ = attractor_selected_basis()
        np.testing.assert_array_equal(A5_basis(), V_mat[:, K4_DIM:])

    def test_mode_sector_classification(self):
        # First K4_DIM modes → K_4
        for k in range(K4_DIM):
            assert mode_sector(k) == "K_4"
        # Remaining A5_DIM modes → A_5
        for k in range(K4_DIM, N):
            assert mode_sector(k) == "A_5"

    def test_mode_eigenvalue_consistency(self):
        _, eigvals = attractor_selected_basis()
        for k in range(N):
            assert mode_eigenvalue(k) == pytest.approx(float(eigvals[k]))


# ────────────────────────────────────────────────────────────────────────
# Fluctuation Hessian at δ★
# ────────────────────────────────────────────────────────────────────────

class TestFluctuationHessian:

    def test_hessian_is_symmetric(self):
        H = fluctuation_hessian_at_delta_star()
        assert float(np.max(np.abs(H - H.T))) < 1e-14

    def test_hessian_eigenbasis_matches_L(self):
        # H = (1+δ★²) I + L shares eigenbasis with L
        H = fluctuation_hessian_at_delta_star()
        L = cathedral_laplacian()
        eH, VH = np.linalg.eigh(H)
        eL, VL = np.linalg.eigh(L)
        # Eigenvalues of H = (1+δ★²) + eigenvalues of L
        expected = eL + (1 + delta_star ** 2)
        np.testing.assert_allclose(eH, expected, atol=1e-12)

    def test_hessian_is_positive_definite(self):
        # All eigenvalues > 0  →  δ★ is a stable minimum of V
        H = fluctuation_hessian_at_delta_star()
        eigs = np.linalg.eigvalsh(H)
        assert eigs.min() > 0


# ────────────────────────────────────────────────────────────────────────
# Layer 5: per-sector Feynman propagators
# ────────────────────────────────────────────────────────────────────────

class TestPropagators:

    def test_K4_propagator_has_no_gamma_shift(self):
        """K_4 modes have m² = λ, no exhaust suppression."""
        p2 = 50.0
        # k=0: λ=0 (gapless mode); k=1: λ=3 (Fiedler)
        for k in range(K4_DIM):
            lam = mode_eigenvalue(k)
            D_k = propagator(p2, k=k)
            expected = 1j / (p2 - lam)
            assert abs(D_k - expected) < 1e-12

    def test_A5_propagator_has_gamma_shift(self):
        """A_5 modes have m² = λ + γ (γ = 1/81 exhaust suppression)."""
        p2 = 50.0
        for k in range(K4_DIM, N):
            lam = mode_eigenvalue(k)
            D_k = propagator(p2, k=k)
            expected = 1j / (p2 - lam - gamma)
            assert abs(D_k - expected) < 1e-12

    def test_K4_pole_masses_match_eigenvalues(self):
        masses = K4_pole_masses_squared()
        _, eigvals = attractor_selected_basis()
        np.testing.assert_allclose(masses, eigvals[:K4_DIM])

    def test_A5_pole_masses_are_eigenvalues_plus_gamma(self):
        masses = A5_pole_masses_squared()
        _, eigvals = attractor_selected_basis()
        np.testing.assert_allclose(masses, eigvals[K4_DIM:] + gamma)

    def test_propagator_pole_at_k_squared_equals_mass_squared(self):
        # For K_4 mode k=2 (λ=3), pole at p² = 3
        # Propagator diverges (we don't include iε for this test)
        # Test: |D(p² close to mass²)| > |D(p² far from mass²)|
        lam = mode_eigenvalue(2)         # K_4 Fiedler eigenvalue
        D_near = abs(propagator(lam + 0.01, k=2))
        D_far  = abs(propagator(lam + 100.0, k=2))
        assert D_near > 100 * D_far

    def test_propagator_K4_vs_A5_at_overlapping_eigenvalue(self):
        """K_4 and A_5 both have a λ=5 mode; they differ by γ on the pole."""
        # K_4 mode 3 has λ=5; A_5 mode 4 has λ=5
        assert mode_eigenvalue(3) == pytest.approx(5.0, abs=1e-10)
        assert mode_eigenvalue(4) == pytest.approx(5.0, abs=1e-10)
        p2 = 7.0
        D_K4 = propagator(p2, k=3)        # pole at p²=5
        D_A5 = propagator(p2, k=4)        # pole at p²=5+γ
        # Both finite away from poles; they differ by exactly γ in the denom
        denom_K4 = p2 - 5.0
        denom_A5 = p2 - 5.0 - gamma
        assert abs(D_K4 - 1j / denom_K4) < 1e-12
        assert abs(D_A5 - 1j / denom_A5) < 1e-12


# ────────────────────────────────────────────────────────────────────────
# Cubic coupling tensor and sector blocks
# ────────────────────────────────────────────────────────────────────────

class TestCubicCouplings:

    def test_cubic_tensor_shape(self):
        W = cubic_coupling_tensor()
        assert W.shape == (N, N, N)

    def test_cubic_tensor_is_symmetric_in_indices(self):
        W = cubic_coupling_tensor()
        # W is symmetric under any index permutation
        np.testing.assert_allclose(W, W.transpose(1, 0, 2), atol=1e-12)
        np.testing.assert_allclose(W, W.transpose(0, 2, 1), atol=1e-12)
        np.testing.assert_allclose(W, W.transpose(2, 1, 0), atol=1e-12)

    def test_sector_block_norm_partitions_W(self):
        """Sum of all 8 sector-block squared norms = ||W||_F²."""
        W = cubic_coupling_tensor()
        total_sq = 0.0
        for s0 in ("K_4", "A_5"):
            for s1 in ("K_4", "A_5"):
                for s2 in ("K_4", "A_5"):
                    total_sq += sector_block_norm(W, (s0, s1, s2)) ** 2
        assert total_sq == pytest.approx(float(np.linalg.norm(W) ** 2), rel=1e-10)

    def test_selection_rule_summary_returns_8_blocks(self):
        sel = selection_rule_summary()
        assert len(sel["block_norms"]) == 8

    def test_selection_rule_summary_pure_blocks_have_weight(self):
        """Pure (K_4)³ and (A_5)³ blocks carry non-trivial weight."""
        sel = selection_rule_summary()
        assert sel["block_norms"]["K_4-K_4-K_4"] > 0
        assert sel["block_norms"]["A_5-A_5-A_5"] > 0

    def test_selection_rule_summary_mixed_blocks_nonzero(self):
        """Honest finding: H_3 ⋊ K_4 is semidirect → mixed blocks NOT zero.

        This documents that the v6.0 paper's "zero cross-block coupling"
        claim was overstated.  What actually holds is that pure and mixed
        blocks are comparable in weight, with a specific structure.
        """
        sel = selection_rule_summary()
        assert sel["block_norms"]["K_4-K_4-A_5"] > 0
        assert sel["block_norms"]["K_4-A_5-A_5"] > 0

    def test_pure_fraction_in_unit_interval(self):
        sel = selection_rule_summary()
        assert 0.0 < sel["pure_fraction"] < 1.0


# ────────────────────────────────────────────────────────────────────────
# CI gate
# ────────────────────────────────────────────────────────────────────────

class TestAuditGate:

    def test_audit_returns_dataclass(self):
        a = cathedral_qft_audit()
        # All boolean flags must be set
        assert isinstance(a.structure_formation_holds, bool)
        assert isinstance(a.delta_star_selection_holds, bool)
        assert isinstance(a.K4_trace_correct, bool)
        assert isinstance(a.A5_trace_correct, bool)
        assert isinstance(a.L_trace_equals_D_factorial_V, bool)

    def test_audit_passes(self):
        """Top-level CI gate: full chain chaos → δ★ → basis → QFT verifies."""
        assert cathedral_qft_audit_passes() is True

    def test_print_report_does_not_crash(self, capsys):
        print_cathedral_qft_report()
        captured = capsys.readouterr()
        assert "CATHEDRAL QFT" in captured.out
        assert "Audit passes: True" in captured.out
