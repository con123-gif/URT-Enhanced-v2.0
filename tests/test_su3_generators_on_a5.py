"""Tests for explicit SU(3) generators on the 8 non-trace A_5 modes."""
from __future__ import annotations

import numpy as np
import pytest

from urt.su3_generators_on_a5 import (
    gell_mann_matrices,
    su3_structure_constants,
    su3_adjoint_generators,
    non_trace_a5_basis,
    cathedral_su3_generators,
    commutator_residuals,
    hermitian_residuals,
    vanishes_on_complement_residuals,
    known_structure_constants,
    known_structure_constants_expected,
    su3_generators_summary,
    su3_generators_audit_passes,
    print_su3_generators_report,
)


TOL = 1e-10


class TestGellMann:
    def test_shape(self):
        L = gell_mann_matrices()
        assert L.shape == (8, 3, 3)

    def test_hermitian(self):
        L = gell_mann_matrices()
        for a in range(8):
            assert np.allclose(L[a], L[a].conj().T, atol=TOL)

    def test_traceless(self):
        L = gell_mann_matrices()
        for a in range(8):
            assert abs(np.trace(L[a])) < TOL

    def test_normalisation(self):
        """tr(λ_a λ_b) = 2 δ_ab."""
        L = gell_mann_matrices()
        for a in range(8):
            for b in range(8):
                expected = 2.0 if a == b else 0.0
                assert abs(np.trace(L[a] @ L[b]) - expected) < TOL


class TestStructureConstants:
    def test_antisymmetry(self):
        """f^abc = -f^bac."""
        f = su3_structure_constants()
        assert np.allclose(f, -f.swapaxes(0, 1), atol=TOL)

    def test_pdg_values(self):
        """Spot-check against PDG."""
        actual = known_structure_constants()
        expected = known_structure_constants_expected()
        for k, v_actual in actual.items():
            assert abs(v_actual - expected[k]) < TOL, (
                f"{k}: actual {v_actual}, expected {expected[k]}"
            )

    def test_f_123_is_one(self):
        f = su3_structure_constants()
        assert abs(f[0, 1, 2] - 1.0) < TOL

    def test_f_458_is_sqrt3_over_2(self):
        f = su3_structure_constants()
        assert abs(f[3, 4, 7] - np.sqrt(3) / 2) < TOL


class TestAdjointGenerators:
    def test_shape(self):
        T = su3_adjoint_generators()
        assert T.shape == (8, 8, 8)

    def test_hermitian(self):
        T = su3_adjoint_generators()
        for a in range(8):
            assert np.allclose(T[a], T[a].conj().T, atol=TOL)

    def test_commutator_closes(self):
        """[T_a, T_b] = i f^abc T_c (in adjoint rep)."""
        T = su3_adjoint_generators()
        f = su3_structure_constants()
        for a in range(8):
            for b in range(8):
                comm = T[a] @ T[b] - T[b] @ T[a]
                expected = 1j * np.einsum('c,cef->ef', f[a, b], T)
                assert np.allclose(comm, expected, atol=TOL)


class TestNonTraceA5Basis:
    def test_shape(self):
        V_8, eigs = non_trace_a5_basis()
        assert V_8.shape == (13, 8)
        assert eigs.shape == (8,)

    def test_excludes_lambda_13(self):
        _, eigs = non_trace_a5_basis()
        rounded = [int(round(e)) for e in eigs]
        assert 13 not in rounded

    def test_eigenvalue_structure(self):
        """5×5, 7×2, 9×1."""
        _, eigs = non_trace_a5_basis()
        rounded = sorted(int(round(e)) for e in eigs)
        assert rounded == [5, 5, 5, 5, 5, 7, 7, 9]


class TestCathedralSU3Generators:
    def test_shape(self):
        T = cathedral_su3_generators()
        assert T.shape == (8, 13, 13)

    def test_hermitian_at_machine_eps(self):
        r = hermitian_residuals()
        assert r["max_hermitian_residual"] < 1e-12

    def test_commutator_at_machine_eps(self):
        r = commutator_residuals()
        assert r["max_commutator_residual"] < 1e-12

    def test_vanishes_on_complement(self):
        """T^Cath_a should annihilate the 5-dim V_8 complement
        (4 K_4 modes + the trace singlet)."""
        r = vanishes_on_complement_residuals()
        assert r["max_complement_residual"] < 1e-12

    def test_su3_algebra_holds_in_cathedral_space(self):
        """The 8 Cathedral generators satisfy [T_a, T_b] = i f^abc T_c."""
        T = cathedral_su3_generators()
        f = su3_structure_constants()
        for a in range(8):
            for b in range(8):
                comm = T[a] @ T[b] - T[b] @ T[a]
                expected = 1j * np.einsum('c,cef->ef', f[a, b], T)
                assert np.allclose(comm, expected, atol=1e-12)


class TestAudit:
    def test_audit_passes(self):
        assert su3_generators_audit_passes()

    def test_summary_keys(self):
        s = su3_generators_summary()
        for k in ("n_generators", "hermitian", "commutator",
                  "vanishes_on_complement", "structure_constants",
                  "structure_constants_ok"):
            assert k in s

    def test_eight_generators(self):
        s = su3_generators_summary()
        assert s["n_generators"] == 8
        assert s["n_generators_is_D2m1"]
        assert s["n_generators_is_su3_dim"]


class TestReport:
    def test_print_runs(self, capsys):
        print_su3_generators_report()
        out = capsys.readouterr().out
        assert "SU(3) generators" in out
        assert "CI gate: True" in out
