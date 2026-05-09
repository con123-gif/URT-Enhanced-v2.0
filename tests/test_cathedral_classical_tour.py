"""Tests for the Cathedral Classical Tour — sixth-wave connections."""
from math import factorial
import pytest

from urt.cathedral_classical_tour import (
    polyhedron_counts,
    heegner_number_count,
    magic_square_constants,
    dyson_beta_classes,
    algebraic_integer_units,
    mersenne_primes_at_cathedral_exponents,
    mathieu_structure_constants,
    all_classical_tour_audit,
    all_classical_tour_verify,
)


class TestPolyhedronCounts:
    def test_n_archimedean_is_N(self):
        from urt.shell_closure import N
        assert polyhedron_counts()["n_archimedean"] == N == 13

    def test_n_catalan_is_N(self):
        from urt.shell_closure import N
        assert polyhedron_counts()["n_catalan_solids"] == N

    def test_n_platonic_is_q(self):
        from urt.shell_closure import q
        assert polyhedron_counts()["n_platonic"] == q

    def test_n_kepler_poinsot_is_Dp1(self):
        from urt.shell_closure import D
        assert polyhedron_counts()["n_kepler_poinsot"] == D + 1

    def test_n_uniform_is_qq_D(self):
        from urt.shell_closure import q, D
        assert polyhedron_counts()["n_uniform"] == q * q * D == 75

    def test_n_johnson_is_DfV_plus_F(self):
        from urt.shell_closure import D, V, F
        assert polyhedron_counts()["n_johnson"] == factorial(D) * V + F == 92


class TestHeegnerCount:
    def test_count_is_DD(self):
        from urt.shell_closure import D
        assert heegner_number_count()["n_heegner"] == D * D == 9

    def test_smallest_is_1(self):
        assert heegner_number_count()["smallest_in_set"] == 1

    def test_largest_is_163(self):
        assert heegner_number_count()["largest_in_set"] == 163

    def test_D_is_in_heegner_set(self):
        from urt.shell_closure import D
        assert D in heegner_number_count()["heegner_set"]


class TestMagicSquareConstants:
    def test_3x3_constant_is_Dq(self):
        from urt.shell_closure import D, q
        assert magic_square_constants()["magic_3x3"] == D * q == 15

    def test_5x5_constant_is_G_plus_q(self):
        from urt.shell_closure import G, q
        assert magic_square_constants()["magic_5x5"] == G + q == 65


class TestDysonBetaClasses:
    def test_beta_GUE_is_Dm1(self):
        from urt.shell_closure import D
        assert dyson_beta_classes()["beta_GUE"] == D - 1

    def test_beta_GSE_is_Dp1(self):
        from urt.shell_closure import D
        assert dyson_beta_classes()["beta_GSE"] == D + 1


class TestAlgebraicIntegerUnits:
    def test_Zi_units_is_Dp1(self):
        """Gaussian integers Z[i] have D+1 units: ±1, ±i."""
        from urt.shell_closure import D
        assert algebraic_integer_units()["n_units_Z_i"] == D + 1

    def test_Zomega_units_is_D_factorial(self):
        """Eisenstein integers Z[ω] have D! units (sixth roots of unity)."""
        from urt.shell_closure import D
        assert algebraic_integer_units()["n_units_Z_omega"] == factorial(D)

    def test_Z_units_is_Dm1(self):
        """The integers Z have D-1 units: ±1."""
        from urt.shell_closure import D
        assert algebraic_integer_units()["n_units_Z"] == D - 1


class TestMersennePrimes:
    def test_M_D_is_prime(self):
        from urt.shell_closure import D
        m_D = 2 ** D - 1
        assert m_D == 7
        # 7 is prime
        assert all(7 % p != 0 for p in [2, 3, 5])

    def test_M_q_is_prime(self):
        from urt.shell_closure import q
        m_q = 2 ** q - 1
        assert m_q == 31
        assert all(31 % p != 0 for p in [2, 3, 5])

    def test_M_N_is_prime(self):
        from urt.shell_closure import N
        m_N = 2 ** N - 1
        assert m_N == 8191
        assert all(8191 % p != 0 for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
                                            41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89])


class TestMathieuStructure:
    def test_M12_acts_on_V(self):
        from urt.shell_closure import V
        assert mathieu_structure_constants()["M12_acts_on"] == V

    def test_M24_acts_on_2V(self):
        from urt.shell_closure import V
        assert mathieu_structure_constants()["M24_acts_on"] == 2 * V

    def test_M12_transitivity_is_q(self):
        from urt.shell_closure import q
        assert mathieu_structure_constants()["M12_transitivity"] == q


class TestEndToEndAudit:
    def test_audit_returns_seven_clusters(self):
        a = all_classical_tour_audit()
        assert len(a) == 7

    def test_all_classical_tour_verify(self):
        assert all_classical_tour_verify()
