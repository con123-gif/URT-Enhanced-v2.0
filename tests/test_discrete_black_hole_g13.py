"""Tests for discrete black-hole thermodynamics on G_{13}."""
import math
from math import factorial, log, pi, sqrt

import numpy as np
import pytest

from urt.shell_closure import D, q, V, N, phi, gamma
from urt.cathedral_engine import cathedral_laplacian
from urt.discrete_black_hole_g13 import (
    SPECTRUM,
    laplacian_pseudo_determinant,
    number_of_spanning_trees,
    spanning_tree_factorisation,
    trace_L_power,
    trace_table,
    heat_kernel_trace,
    free_energy,
    internal_energy,
    canonical_entropy,
    heat_kernel_limits,
    quasi_normal_frequencies,
    spectral_zeta,
    spectral_zeta_special_values,
    bekenstein_entropy_high_T,
    surface_gravity_g13,
    hawking_temperature_g13,
    mss_bound_saturation,
    lytollis_gamma_in_urt,
    transcendentals_in_discrete_bh,
    geometric_bh_entropy_unit_edge,
    discrete_black_hole_g13_audit,
    discrete_black_hole_g13_audit_passes,
)


class TestSpectrum:
    def test_spectrum_has_six_distinct_eigenvalues(self):
        assert len(SPECTRUM) == 6
        assert set(SPECTRUM.keys()) == {0, 3, 5, 7, 9, 13}

    def test_multiplicities_match_known(self):
        """Multiplicities {0:1, 3:2, 5:6, 7:2, 9:1, 13:1}."""
        assert SPECTRUM == {0: 1, 3: 2, 5: 6, 7: 2, 9: 1, 13: 1}

    def test_total_multiplicity_is_N(self):
        assert sum(SPECTRUM.values()) == N == 13


class TestMatrixTreeTheorem:
    """Theorem 1: τ(G_{13}) = D⁴·q⁶·(D!+1)² (Kirchhoff)."""

    def test_pseudo_determinant_cathedral_form(self):
        """det'(L) = D⁴ · q⁶ · (D!+1)² · N."""
        expected = D ** 4 * q ** 6 * (factorial(D) + 1) ** 2 * N
        assert laplacian_pseudo_determinant() == expected

    def test_pseudo_determinant_numerical(self):
        """Closed form agrees with direct numerical computation."""
        eigs = np.linalg.eigvalsh(cathedral_laplacian())
        nonzero = eigs[eigs > 1e-10]
        assert abs(float(np.prod(nonzero)) - laplacian_pseudo_determinant()) < 1.0

    def test_spanning_trees_is_62_million(self):
        """τ(G_{13}) = 62,015,625."""
        assert number_of_spanning_trees() == 62_015_625

    def test_spanning_trees_cathedral_form(self):
        """τ = D⁴ · q⁶ · (D!+1)²."""
        expected = D ** 4 * q ** 6 * (factorial(D) + 1) ** 2
        assert number_of_spanning_trees() == expected

    def test_spanning_trees_gamma_form(self):
        """τ = γ⁻¹ · q⁶ · (D!+1)² where γ = 1/D⁴ = 1/81."""
        gamma = 1 / D ** 4
        assert abs(number_of_spanning_trees() - (1 / gamma) * q ** 6 * (factorial(D) + 1) ** 2) < 1

    def test_factorisation_per_eigenvalue(self):
        """Each Cathedral eigenvalue contributes its closed-form factor."""
        sf = spanning_tree_factorisation()
        c = sf["contributions"]
        assert c["lambda_3"]["factor"]  == D ** 2          # 9
        assert c["lambda_5"]["factor"]  == q ** 6          # 15625
        assert c["lambda_7"]["factor"]  == (factorial(D) + 1) ** 2   # 49
        assert c["lambda_9"]["factor"]  == 9
        assert c["lambda_13"]["factor"] == N               # 13

    def test_factorisation_product_equals_det(self):
        sf = spanning_tree_factorisation()
        prod = 1
        for v in sf["contributions"].values():
            prod *= v["factor"]
        assert prod == laplacian_pseudo_determinant()

    def test_kirchhoff_relation(self):
        """τ(G) = det'(L) / N (matrix-tree theorem)."""
        assert number_of_spanning_trees() == laplacian_pseudo_determinant() // N


class TestSpectralPowerSums:
    """Theorem 2: tr(L^k) closed forms."""

    def test_tr_L_is_DF_V(self):
        """tr(L) = D!·V = 72."""
        assert trace_L_power(1) == factorial(D) * V == 72

    def test_tr_L_squared_decomposition(self):
        """tr(L²) = 2D² + q²·D! + 2·(D!+1)² + D⁴ + N² = 516."""
        expected = (
            2 * D ** 2
            + q ** 2 * factorial(D)
            + 2 * (factorial(D) + 1) ** 2
            + D ** 4
            + N ** 2
        )
        assert trace_L_power(2) == expected == 516

    def test_tr_L_cubed_is_4416(self):
        assert trace_L_power(3) == 4416

    def test_tr_L_fourth_is_43836(self):
        assert trace_L_power(4) == 43836


class TestHeatKernel:
    """Theorem 3: Z(β) = tr(e^{−βL}) = closed-form Cathedral function."""

    def test_Z_at_zero_equals_N(self):
        """Z(0) = tr(I) = N."""
        assert abs(heat_kernel_trace(0.0) - N) < 1e-15

    def test_Z_at_infinity_approaches_one(self):
        """Z(β→∞) → 1 (only ground state survives)."""
        assert abs(heat_kernel_trace(100.0) - 1.0) < 1e-12

    def test_Z_decreasing(self):
        Z_vals = [heat_kernel_trace(b) for b in [0.0, 0.1, 0.5, 1.0, 5.0, 10.0]]
        for i in range(len(Z_vals) - 1):
            assert Z_vals[i] > Z_vals[i + 1]

    def test_Z_explicit_form(self):
        """Z(β) = 1 + 2e^(-3β) + 6e^(-5β) + 2e^(-7β) + e^(-9β) + e^(-13β)."""
        beta = 0.7
        explicit = (
            1
            + 2 * math.exp(-3 * beta)
            + 6 * math.exp(-5 * beta)
            + 2 * math.exp(-7 * beta)
            + math.exp(-9 * beta)
            + math.exp(-13 * beta)
        )
        assert abs(heat_kernel_trace(beta) - explicit) < 1e-15

    def test_entropy_third_law(self):
        """S(β→∞) → 0 (third law of thermodynamics)."""
        assert abs(canonical_entropy(50.0)) < 1e-12

    def test_entropy_high_T_limit(self):
        """S(β→0) → log N = log 13."""
        S_small_beta = canonical_entropy(1e-6)
        assert abs(S_small_beta - math.log(N)) < 1e-3

    def test_internal_energy_decreases_with_beta(self):
        """E(β) decreases as β grows (cooling)."""
        E_vals = [internal_energy(b) for b in [0.01, 0.5, 1.0, 5.0]]
        for i in range(len(E_vals) - 1):
            assert E_vals[i] > E_vals[i + 1]


class TestQuasiNormalModes:
    """Theorem 4: ω_k = √λ_k, with Cathedral ratio ω_max/ω_min."""

    def test_omega_min_is_sqrt_D(self):
        qnm = quasi_normal_frequencies()
        assert abs(qnm["omega_min"] - sqrt(D)) < 1e-15

    def test_omega_max_is_sqrt_N(self):
        qnm = quasi_normal_frequencies()
        assert abs(qnm["omega_max"] - sqrt(N)) < 1e-15

    def test_ratio_is_sqrt_N_over_D(self):
        qnm = quasi_normal_frequencies()
        assert abs(qnm["ratio"] - sqrt(N / D)) < 1e-15
        assert abs(qnm["ratio"] - sqrt(13 / 3)) < 1e-15

    def test_frequencies_are_distinct_squareroots(self):
        qnm = quasi_normal_frequencies()
        assert qnm["frequencies"] == [round(sqrt(lam), 6) for lam in [3, 5, 7, 9, 13]]


class TestSpectralZeta:
    """Theorem 5: ζ_L(0) = V (number of non-zero modes)."""

    def test_zeta_at_0_is_V(self):
        assert abs(spectral_zeta(0) - V) < 1e-12

    def test_zeta_special_values_dict(self):
        sz = spectral_zeta_special_values()
        assert sz["zeta_at_0"]["value"] == V
        assert sz["zeta_at_-1"]["value"] == -trace_L_power(1) == -72
        assert sz["zeta_at_-2"]["value"] == -trace_L_power(2) == -516


class TestBekensteinEntropy:
    """Theorem 6: high-T entropy bound S_max = log N."""

    def test_S_max_is_log_N(self):
        be = bekenstein_entropy_high_T()
        assert abs(be["S_max"] - math.log(N)) < 1e-15

    def test_per_site_entropy(self):
        be = bekenstein_entropy_high_T()
        assert abs(be["per_site"] - math.log(N) / N) < 1e-15


class TestSurfaceGravityAndHawking:
    """Theorem 7: surface gravity κ = √D, T_H = √D/(2π), MSS bound saturated."""

    def test_surface_gravity_is_sqrt_D(self):
        sg = surface_gravity_g13()
        assert abs(sg["kappa"] - sqrt(D)) < 1e-15

    def test_hawking_temperature(self):
        th = hawking_temperature_g13()
        assert abs(th["T_H"] - sqrt(D) / (2 * pi)) < 1e-15

    def test_mss_bound_saturated(self):
        """2π·T_H = √D = κ — saturated."""
        m = mss_bound_saturation()
        assert m["saturated"]
        assert abs(m["mss_upper_bound"] - sqrt(D)) < 1e-15
        assert abs(m["mss_upper_bound"] - m["kappa_g13"]) < 1e-15


class TestLytollisCathedralClosure:
    """Theorem 8: γ_URT = γ_Lytollis = 1/81 = D^{−(D+1)}."""

    def test_gamma_identical(self):
        l = lytollis_gamma_in_urt()
        assert l["identical"]
        assert abs(l["gamma_URT"] - 1 / 81) < 1e-15
        assert abs(l["gamma_Lytollis"] - 1 / 81) < 1e-15

    def test_gamma_is_D_to_minus_Dp1(self):
        l = lytollis_gamma_in_urt()
        assert abs(l["gamma_URT"] - D ** -(D + 1)) < 1e-15

    def test_decomposition_is_H_plus_gamma_psi(self):
        l = lytollis_gamma_in_urt()
        assert "H + γΨ" in l["decomposition"]


class TestThreeTranscendentals:
    """Theorem 10: π, φ, e all close on G_{13}."""

    def test_all_three_have_appearances(self):
        t = transcendentals_in_discrete_bh()
        assert len(t["pi_appears_in"]) >= 3
        assert len(t["phi_appears_in"]) >= 2
        assert len(t["e_appears_in"]) >= 3

    def test_S_BH_closed_form_agrees(self):
        """S_BH = q·√D · (Nφ)² / (4·(1−γ)²·π²)."""
        t = transcendentals_in_discrete_bh()
        assert t["agrees"]


class TestGeometricBHEntropy:
    """Theorem 9: S_BH for unit-edge icosahedron has a clean Cathedral form."""

    def test_area_is_q_sqrt_D(self):
        """A(unit-edge icosahedron) = 5√3 = q·√D."""
        bh = geometric_bh_entropy_unit_edge()
        assert abs(bh["A_ico"] - q * sqrt(D)) < 1e-12
        assert abs(bh["A_ico"] - 5 * sqrt(3)) < 1e-15

    def test_S_BH_closed_form(self):
        """S_BH = q · √D · (N · φ)² / (4 · (1 − γ)² · π²)."""
        bh = geometric_bh_entropy_unit_edge()
        expected = q * sqrt(D) * (N * phi) ** 2 / (4 * (1 - gamma) ** 2 * pi ** 2)
        assert abs(bh["S_BH"] - expected) < 1e-12

    def test_S_BH_is_about_99_5(self):
        bh = geometric_bh_entropy_unit_edge()
        assert 99.0 < bh["S_BH"] < 100.0


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert discrete_black_hole_g13_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = discrete_black_hole_g13_audit()
        for key in (
            "spectrum_with_multiplicities",
            "spanning_trees",
            "trace_powers",
            "qnm",
            "zeta_specials",
            "bh_entropy",
            "heat_kernel_limits",
            "surface_gravity",
            "hawking_temperature",
            "mss_bound",
            "lytollis_gamma",
            "transcendentals",
            "bh_entropy_geometric",
        ):
            assert key in a
