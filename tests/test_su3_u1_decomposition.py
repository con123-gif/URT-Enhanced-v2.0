"""Tests for the A_5 → U(3) = SU(3) × U(1) refinement."""
from __future__ import annotations

import numpy as np
import pytest

from urt.su3_u1_decomposition import (
    a5_trace_singlet,
    a5_gluon_octet,
    u3_decomposition_identity,
    refined_13_mode_identification,
    su3_u1_decomposition_summary,
    su3_u1_decomposition_audit_passes,
    print_su3_u1_decomposition_report,
)
from urt.shell_closure import D, V as V_SHELL, N as N_SHELL


class TestU3DecompositionIdentity:
    """The structural identity D² = (D²−1) + 1 = su(3)_adj + u(1)."""

    def test_a5_dim_is_D_squared(self):
        u3 = u3_decomposition_identity()
        assert u3["a5_dim"] == D * D
        assert u3["a5_dim"] == 9

    def test_su3_adjoint_is_D_squared_minus_one(self):
        u3 = u3_decomposition_identity()
        assert u3["su3_adjoint"] == D * D - 1
        assert u3["su3_adjoint"] == 8

    def test_u1_dim_is_one(self):
        u3 = u3_decomposition_identity()
        assert u3["u1_dim"] == 1

    def test_u3_decomposition_matches(self):
        u3 = u3_decomposition_identity()
        assert u3["matches_u3"]
        assert u3["a5_dim"] == u3["su3_adjoint"] + u3["u1_dim"]


class TestA5TraceSinglet:
    """The unique λ=13 mode as U(1) photon candidate."""

    def test_eigenvalue_is_N(self):
        tr = a5_trace_singlet()
        assert tr["eigenvalue_is_N"]
        assert int(round(tr["eigenvalue"])) == N_SHELL

    def test_shell_components_uniform(self):
        """The λ=13 mode has identical amplitude on all 12 shell vertices."""
        tr = a5_trace_singlet()
        assert tr["shell_uniform"]
        assert tr["shell_std"] < 1e-10

    def test_central_amplitude_dominant(self):
        """Central node carries large amplitude vs shell."""
        tr = a5_trace_singlet()
        assert abs(tr["central_amplitude"]) > abs(tr["shell_mean"])
        # Center vs shell: |central| ≈ √(12/13) ≈ 0.96
        assert abs(tr["central_amplitude"]) == pytest.approx(
            np.sqrt(V_SHELL / N_SHELL), rel=1e-6
        )

    def test_central_and_shell_orthogonal_to_constant(self):
        """The trace singlet is orthogonal to the constant mode."""
        tr = a5_trace_singlet()
        # Sum of components = central + 12 · shell = 0 (orthogonal to (1,1,...,1))
        total = tr["central_amplitude"] + V_SHELL * tr["shell_mean"]
        assert abs(total) < 1e-10

    def test_is_trace_singlet(self):
        assert a5_trace_singlet()["is_trace_singlet"]


class TestA5GluonOctet:
    """The 8 non-trace A_5 modes as SU(3) gluon candidates."""

    def test_count_is_eight(self):
        gl = a5_gluon_octet()
        assert gl["count"] == 8

    def test_count_is_su3_adjoint(self):
        assert a5_gluon_octet()["count_is_su3_adj"]

    def test_count_is_D_squared_minus_one(self):
        gl = a5_gluon_octet()
        assert gl["count_is_D2_minus_1"]
        assert gl["count"] == D * D - 1

    def test_eigenvalue_multiplicities(self):
        """5×5, 7×2, 9×1 = 8 modes."""
        eigs = sorted(round(e) for e in a5_gluon_octet()["eigenvalues"])
        assert eigs == [5, 5, 5, 5, 5, 7, 7, 9]

    def test_excludes_lambda_13(self):
        """Gluon octet does NOT include the λ=13 trace singlet."""
        eigs = a5_gluon_octet()["eigenvalues"]
        assert 13 not in [round(e) for e in eigs]


class TestRefined13ModeIdentification:
    """The full refined 13-mode SM gauge assignment."""

    def test_count_is_N(self):
        assert len(refined_13_mode_identification()) == N_SHELL

    def test_one_graviton(self):
        modes = refined_13_mode_identification()
        gravitons = [m for m in modes if m.sm_particle == "graviton"]
        assert len(gravitons) == 1
        assert gravitons[0].eigenvalue == 0
        assert gravitons[0].sector == "K_4"
        assert gravitons[0].status == "DERIVED"

    def test_three_ew_bosons(self):
        modes = refined_13_mode_identification()
        ew = [m for m in modes if m.sm_particle in ("W⁺", "W⁻", "Z")]
        assert len(ew) == 3
        assert all(m.sector == "K_4" for m in ew)
        assert all(m.status == "DERIVED" for m in ew)

    def test_one_photon_in_A5(self):
        modes = refined_13_mode_identification()
        photons = [m for m in modes if "photon" in m.sm_particle]
        assert len(photons) == 1
        assert photons[0].sector == "A_5"
        assert photons[0].eigenvalue == 13
        assert photons[0].status == "REFINED"

    def test_eight_gluons_in_A5(self):
        modes = refined_13_mode_identification()
        gluons = [m for m in modes if "gluon" in m.sm_particle]
        assert len(gluons) == 8
        assert all(g.sector == "A_5" for g in gluons)
        assert all(g.status == "REFINED" for g in gluons)

    def test_sm_total(self):
        """1 graviton + 3 EW + 1 photon + 8 gluons = 13 = N."""
        modes = refined_13_mode_identification()
        assert len(modes) == N_SHELL
        # The 12 = V SM gauge bosons (excluding graviton)
        non_graviton = [m for m in modes if m.sm_particle != "graviton"]
        assert len(non_graviton) == V_SHELL

    def test_k4_a5_split(self):
        modes = refined_13_mode_identification()
        k4 = [m for m in modes if m.sector == "K_4"]
        a5 = [m for m in modes if m.sector == "A_5"]
        assert len(k4) == 4
        assert len(a5) == 9
        assert len(k4) == D + 1
        assert len(a5) == D * D


class TestAuditGate:
    def test_audit_passes(self):
        assert su3_u1_decomposition_audit_passes()

    def test_summary_has_expected_keys(self):
        s = su3_u1_decomposition_summary()
        for key in (
            "u3_identity", "a5_trace_singlet", "a5_gluon_octet",
            "mode_count", "derived_count", "refined_count",
        ):
            assert key in s

    def test_mode_count_is_N(self):
        s = su3_u1_decomposition_summary()
        assert s["mode_count"] == N_SHELL

    def test_derived_count_is_four(self):
        """graviton + W± + Z = 4 DERIVED modes."""
        s = su3_u1_decomposition_summary()
        assert s["derived_count"] == 4

    def test_refined_count_is_nine(self):
        """photon + 8 gluons = 9 REFINED modes."""
        s = su3_u1_decomposition_summary()
        assert s["refined_count"] == 9


class TestPrintReport:
    def test_print_runs_without_error(self, capsys):
        print_su3_u1_decomposition_report()
        captured = capsys.readouterr()
        assert "A_5 sector → U(3)" in captured.out
        assert "8 gluons + 1 photon" in captured.out
        assert "audit passes" not in captured.out.lower() or "CI gate" in captured.out
