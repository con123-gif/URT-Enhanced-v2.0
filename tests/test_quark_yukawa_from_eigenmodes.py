"""Tests for the quark Yukawa eigenmode-overlap derivation."""
from __future__ import annotations

import pytest

from urt.quark_yukawa_from_eigenmodes import (
    quark_eigenmode_assignment,
    eigenvectors_at,
    quark_eigenvectors,
    yukawa_kernel_eigenvalue,
    eigenmode_overlap,
    derive_quark_yukawas,
    quark_yukawa_summary,
    quark_yukawa_audit_passes,
    print_quark_yukawa_report,
)
from urt.shell_closure import D


TOL = 1e-12


class TestAssignment:
    def test_six_quarks(self):
        a = quark_eigenmode_assignment()
        assert len(a) == 6

    def test_three_generations(self):
        a = quark_eigenmode_assignment()
        gens = {q.generation for q in a}
        assert gens == {1, 2, 3}

    def test_three_doublets(self):
        a = quark_eigenmode_assignment()
        doublets = {q.eigenvalue: [] for q in a}
        for q in a:
            doublets[q.eigenvalue].append(q.name)
        assert len(doublets) == 3
        assert all(len(v) == 2 for v in doublets.values())

    def test_doublet_eigenvalues_are_D_q_Dfact_plus_1(self):
        a = quark_eigenmode_assignment()
        eigvals = sorted({q.eigenvalue for q in a})
        assert eigvals == [3, 5, 7]
        # D, q, D!+1 = 3, 5, 7
        assert eigvals == [D, 5, 7]


class TestEigenvectors:
    def test_each_quark_has_a_vector(self):
        v = quark_eigenvectors()
        assert set(v.keys()) == {"u", "d", "s", "c", "b", "t"}

    def test_vectors_are_13_dim(self):
        v = quark_eigenvectors()
        for name, vec in v.items():
            assert vec.shape == (13,)

    def test_doublet_partners_are_different(self):
        v = quark_eigenvectors()
        # u and d both at λ=3 but different basis vectors
        import numpy as np
        assert not np.allclose(v["u"], v["d"])
        assert not np.allclose(v["c"], v["s"])
        assert not np.allclose(v["t"], v["b"])

    def test_eigenvectors_at_returns_correct_count(self):
        # K_4 doublet at λ=3 has 2 modes
        assert eigenvectors_at(3).shape[1] >= 2
        # λ=5 has 6 modes total (1 K_4 + 5 A_5)
        assert eigenvectors_at(5).shape[1] >= 2
        # λ=7 has 2 modes
        assert eigenvectors_at(7).shape[1] == 2


class TestYukawaKernel:
    def test_kernel_values(self):
        from math import pi
        from urt.shell_closure import D, q, N, F, gamma, DELTA_STAR
        delta_cl = D / F
        Delta = delta_cl - DELTA_STAR
        cases = {
            "u": 2 * pi * Delta * DELTA_STAR,
            "d": 2 * Delta,
            "s": 8 * gamma,
            "c": (D + 1) / D * (1 + gamma),
            "b": (D + 1) + delta_cl * D,
            "t": N * N + D * q,
        }
        for name, expected in cases.items():
            assert yukawa_kernel_eigenvalue(name, 0.0) == pytest.approx(expected, rel=TOL)


class TestDerivation:
    def test_overlap_matches_closed_form_to_eps(self):
        rows = derive_quark_yukawas()
        for r in rows:
            assert r.derivation_relerr < TOL, (
                f"{r.name}: overlap {r.overlap} vs closed {r.y_from_closed}"
            )

    def test_all_quark_masses_within_2pct_of_pdg(self):
        s = quark_yukawa_summary()
        assert s["all_within_2pct"], f"max PDG err {s['max_pdg_err']*100:.2f}%"

    def test_six_quarks(self):
        rows = derive_quark_yukawas()
        assert len(rows) == 6
        assert {r.name for r in rows} == {"u", "d", "s", "c", "b", "t"}


class TestAuditGate:
    def test_audit_passes(self):
        assert quark_yukawa_audit_passes()

    def test_max_derivation_err_at_eps(self):
        s = quark_yukawa_summary()
        assert s["max_derivation_err"] < TOL


class TestReport:
    def test_print_runs(self, capsys):
        print_quark_yukawa_report()
        out = capsys.readouterr().out
        assert "Yukawa" in out
        assert "CI gate: True" in out
