"""Tests for urt/topological_qc.py — Fibonacci anyons and A₅ topological QC."""

import pytest
from math import pi, sqrt, isfinite
from cmath import phase as cphase
from urt.topological_qc import (
    fibonacci_anyon,
    f_matrix,
    r_matrix,
    icosahedral_qec,
    braiding_gate,
    topological_qc_summary,
    print_tqc_report,
    D_FIBONACCI,
    F_MATRIX_11,
    F_MATRIX_12,
    F_MATRIX_21,
    F_MATRIX_22,
    R_PHASE_1,
    R_PHASE_TAU,
    P_TH_ICOSAHEDRAL,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi


class TestFibonacciAnyon:
    def setup_method(self):
        self.fa = fibonacci_anyon()

    def test_quantum_dim_equals_golden_ratio(self):
        """d = φ = (1+√5)/2."""
        assert abs(D_FIBONACCI - phi) < 1e-14

    def test_quantum_dim_golden_ratio_value(self):
        """φ ≈ 1.6180339887..."""
        assert abs(D_FIBONACCI - 1.6180339887498948) < 1e-12

    def test_fusion_rule_string(self):
        """Fusion rule τ⊗τ = 1⊕τ present in output."""
        assert "τ ⊗ τ = 1 ⊕ τ" in self.fa["fusion_rule"]

    def test_pentagon_equation_satisfied(self):
        """Pentagon equation is satisfied: F_12² + F_22² = 1."""
        assert self.fa["pentagon_check"] is True

    def test_pentagon_numerical_check(self):
        """(1/√φ)² + (-1/φ)² = 1/φ + 1/φ² = 1."""
        lhs = F_MATRIX_12**2 + F_MATRIX_22**2
        assert abs(lhs - 1.0) < 1e-12

    def test_golden_identity(self):
        """φ² = φ + 1."""
        assert self.fa["golden_identity"] is True
        assert abs(phi**2 - phi - 1) < 1e-14

    def test_a5_order_is_G(self):
        """|A₅| = G = 60."""
        assert self.fa["A5_order"] == G
        assert self.fa["A5_order"] == 60

    def test_q_fold_symmetry(self):
        """5-fold symmetry q=5."""
        assert self.fa["q_fold_symmetry"] == q
        assert self.fa["q_fold_symmetry"] == 5

    def test_a5_connection_string(self):
        """A5 connection note is informative."""
        assert "A₅" in self.fa["A5_connection"]
        assert "φ" in self.fa["A5_connection"]


class TestFMatrix:
    def setup_method(self):
        self.fm = f_matrix()

    def test_shape_2x2(self):
        """F-matrix is 2×2."""
        assert len(self.fm) == 2
        assert len(self.fm[0]) == 2
        assert len(self.fm[1]) == 2

    def test_matrix_11_is_phi_inverse(self):
        """F[0][0] = 1/φ."""
        assert abs(self.fm[0][0] - 1/phi) < 1e-14

    def test_matrix_22_is_negative_phi_inverse(self):
        """F[1][1] = -1/φ."""
        assert abs(self.fm[1][1] - (-1/phi)) < 1e-14

    def test_off_diagonal_equal(self):
        """F[0][1] = F[1][0] (symmetric)."""
        assert abs(self.fm[0][1] - self.fm[1][0]) < 1e-14

    def test_off_diagonal_is_phi_neg_half(self):
        """F[0][1] = 1/√φ."""
        assert abs(self.fm[0][1] - 1/sqrt(phi)) < 1e-14

    def test_orthogonality(self):
        """F-matrix is orthogonal: F·F^T = I."""
        a, b = self.fm[0][0], self.fm[0][1]
        c, d = self.fm[1][0], self.fm[1][1]
        # Row norms:
        assert abs(a**2 + b**2 - 1.0) < 1e-12
        assert abs(c**2 + d**2 - 1.0) < 1e-12
        # Row orthogonality:
        assert abs(a*c + b*d) < 1e-12

    def test_fibonacci_relation(self):
        """Pentagon: (F_12)² + (F_22)² = 1/φ + 1/φ² = 1."""
        assert abs(self.fm[0][1]**2 + self.fm[1][1]**2 - 1.0) < 1e-12


class TestRMatrix:
    def setup_method(self):
        self.rm = r_matrix()

    def test_phases_involve_q5(self):
        """R-matrix phases are multiples of 2π/q = 2π/5."""
        two_pi_q = 2 * pi / q
        # phase_1 = -4π/5 = -2×(2π/5)
        assert abs(R_PHASE_1 - (-2 * two_pi_q)) < 1e-12
        # phase_tau = 3π/5 = (3/2)×(2π/5)
        assert abs(R_PHASE_TAU - (1.5 * two_pi_q)) < 1e-12

    def test_r1_is_unit_complex(self):
        """R^1_τ has unit modulus."""
        assert abs(abs(self.rm["r1_complex"]) - 1.0) < 1e-12

    def test_r_tau_is_unit_complex(self):
        """R^τ_τ has unit modulus."""
        assert abs(abs(self.rm["r_tau_complex"]) - 1.0) < 1e-12

    def test_q_used(self):
        """q=5 used in R-matrix."""
        assert self.rm["q_used"] == 5

    def test_two_pi_over_q(self):
        """2π/5 is correct."""
        assert abs(self.rm["two_pi_over_q"] - 2*pi/5) < 1e-14

    def test_phases_are_radians(self):
        """Phases are in radians (not degrees)."""
        assert -2*pi < R_PHASE_1 < 0
        assert 0 < R_PHASE_TAU < 2*pi


class TestQEC:
    def setup_method(self):
        self.qec = icosahedral_qec()

    def test_threshold_equals_gamma(self):
        """QEC threshold = γ = 1/81."""
        assert abs(P_TH_ICOSAHEDRAL - gamma) < 1e-15
        assert abs(P_TH_ICOSAHEDRAL - 1/81) < 1e-14

    def test_threshold_in_percent(self):
        """Threshold ≈ 1.23% (in range 1-2%)."""
        pct = self.qec["threshold_pct"]
        assert 0.5 < pct < 3.0

    def test_is_near_surface_code_threshold(self):
        """Within 2× of surface code threshold ~1.1%."""
        ratio = self.qec["ratio_to_surface_code"]
        assert 0.5 < ratio < 2.0

    def test_spectral_gap_is_D(self):
        """Spectral gap λ₂ = D = 3."""
        assert self.qec["spectral_gap"] == D
        assert self.qec["spectral_gap"] == 3

    def test_why_gamma_present(self):
        """Explanation of γ threshold present."""
        assert "γ" in self.qec["why_gamma"] or "gamma" in self.qec["why_gamma"].lower()


class TestBraiding:
    def setup_method(self):
        self.bg = braiding_gate()

    def test_universal_computation(self):
        """Fibonacci braiding is universal."""
        assert self.bg["is_universal"] is True

    def test_unitary_shape(self):
        """Braiding gate is 2×2."""
        u = self.bg["unitary"]
        assert len(u) == 2
        assert len(u[0]) == 2

    def test_diagonal_unit_modulus(self):
        """Diagonal entries have unit modulus."""
        assert abs(abs(self.bg["b11"]) - 1.0) < 1e-12
        assert abs(abs(self.bg["b22"]) - 1.0) < 1e-12

    def test_is_unitary(self):
        """Braiding gate is unitary."""
        assert self.bg["is_unitary"] is True

    def test_phases_q5_related(self):
        """Phases 4π/5 and -3π/5 are multiples of 2π/5."""
        two_pi_5 = 2 * pi / 5
        assert abs(self.bg["phase_b11_rad"] - 2 * two_pi_5) < 1e-12
        assert abs(abs(self.bg["phase_b22_rad"]) - 1.5 * two_pi_5) < 1e-12

    def test_freedman_reference(self):
        """References Freedman et al. universality."""
        assert "Freedman" in self.bg["universality_ref"]


class TestTQCSummary:
    def setup_method(self):
        self.s = topological_qc_summary()

    def test_keys_present(self):
        """All major keys present."""
        for key in ("fibonacci_anyon", "f_matrix", "r_matrix", "qec",
                    "braiding_gate", "golden_ratio", "gamma_threshold"):
            assert key in self.s

    def test_golden_ratio_value(self):
        """Golden ratio in summary equals φ."""
        assert abs(self.s["golden_ratio"] - phi) < 1e-14

    def test_gamma_threshold(self):
        """γ threshold in summary = 1/81."""
        assert abs(self.s["gamma_threshold"] - gamma) < 1e-15

    def test_a5_group_order(self):
        """|A₅| = 60 in summary."""
        assert self.s["a5_group_order"] == 60


class TestPrintReport:
    def test_print_does_not_raise(self, capsys):
        """print_tqc_report() runs without error."""
        print_tqc_report()
        captured = capsys.readouterr()
        assert "Fibonacci" in captured.out or "φ" in captured.out
