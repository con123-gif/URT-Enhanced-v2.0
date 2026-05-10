"""Tests for the Cathedral × Lytollis synthesis module."""
from math import factorial, pi

from urt.shell_closure import D, q, V, N, gamma
from urt.cathedral_lytollis_synthesis import (
    gamma_unification,
    D3_uniqueness_conditions,
    sector_ratio_uniqueness_table,
    alpha_cross_validation,
    lambda_cross_validation,
    CKM_cross_validation,
    comparative_predictions,
    cathedral_lytollis_synthesis_audit,
    cathedral_lytollis_synthesis_audit_passes,
)


class TestGammaUnification:
    def test_gamma_is_one_over_81(self):
        """γ_URT = γ_Lytollis = 1/81."""
        g = gamma_unification()
        assert g["equals_one_over_81"]
        assert g["value"] == 1 / 81

    def test_closed_form_is_D_to_neg_Dp1(self):
        """γ = D^(−(D+1))."""
        g = gamma_unification()
        assert g["value"] == 1 / D ** (D + 1)


class TestD3Uniqueness:
    def test_q_admitted(self):
        """D=3 admits q = D+2 = 5 fold rotational symmetry."""
        u = D3_uniqueness_conditions()
        assert u["a_admits_q_fold"]
        assert q == D + 2

    def test_q_forbidden(self):
        """q = 5 is forbidden by crystallographic restriction."""
        u = D3_uniqueness_conditions()
        assert u["b_forbids_q_fold"]

    def test_A5_nonsolvable(self):
        """A_(D+2) = A_5 is non-solvable."""
        u = D3_uniqueness_conditions()
        assert u["c_A5_non_solvable"]

    def test_icosahedral_closure(self):
        """D² + D + 1 = N — the icosahedral closure."""
        u = D3_uniqueness_conditions()
        assert u["d_icosahedral_closure"]
        assert D * D + D + 1 == N

    def test_lytollis_kappa_positive(self):
        """The Lytollis κ-margin is finite and positive at λ=N."""
        u = D3_uniqueness_conditions()
        assert u["e_lytollis_kappa_positive"]
        assert (1 - N / (2 ** q * pi ** 2)) > 0

    def test_all_at_D3(self):
        u = D3_uniqueness_conditions()
        assert u["all_conditions_at_D_3"]


class TestSectorRatioTable:
    def test_includes_D_2_through_6(self):
        """Table covers D = 2..6."""
        t = sector_ratio_uniqueness_table()
        assert [row[0] for row in t] == [2, 3, 4, 5, 6]

    def test_D_3_value_is_4_over_9(self):
        """At D=3 the ratio is 4/9 ≈ 0.4444."""
        t = sector_ratio_uniqueness_table()
        d3_row = next(r for r in t if r[0] == 3)
        assert d3_row[1] == "4/9"
        assert abs(d3_row[2] - 4/9) < 1e-15

    def test_D_4_collapses(self):
        """At D=4 the ratio falls below 0.20."""
        t = sector_ratio_uniqueness_table()
        d4_row = next(r for r in t if r[0] == 4)
        assert d4_row[2] < 0.20


class TestAlphaCrossValidation:
    def test_low_E_inv_is_137(self):
        """Cathedral 1/α_bare = N²−E−(D−1) = 137."""
        a = alpha_cross_validation()
        assert a["low_E_inv"] == 137

    def test_high_E_inv_is_127_955(self):
        """Lytollis 1/α(M_Z) = 127.955."""
        a = alpha_cross_validation()
        assert a["high_E_inv"] == 127.955

    def test_low_E_relative_error_below_0_1_pct(self):
        a = alpha_cross_validation()
        assert a["low_E_relative_error"] < 0.001

    def test_high_E_relative_error_below_0_1_pct(self):
        a = alpha_cross_validation()
        assert a["high_E_relative_error"] < 0.001

    def test_unification_via_RGE(self):
        a = alpha_cross_validation()
        assert "RGE" in a["unified_via"]
        assert a["agreement_within_0_1_pct"]


class TestLambdaCrossValidation:
    def test_lytollis_120_RG_steps(self):
        """Lambda flows over 120 RG steps from Planck to Hubble."""
        l = lambda_cross_validation()
        assert l["lytollis_RG_steps"] == 120

    def test_cathedral_value_is_tiny(self):
        """Cathedral Λ/M_Pl⁴ ≈ 10⁻¹²² — extremely small."""
        l = lambda_cross_validation()
        assert l["cathedral_value"] < 1e-100


class TestCKMCrossValidation:
    def test_delta_CP_is_197(self):
        """Cathedral δ_CP = (D+1)F + (N−D−1)N = 197°."""
        ck = CKM_cross_validation()
        assert ck["delta_CP_cathedral_deg"] == 197
        assert ck["exact_match"]

    def test_PDG_consistent(self):
        ck = CKM_cross_validation()
        assert ck["both_PDG_consistent"]


class TestComparativePredictions:
    def test_at_least_5_observables(self):
        """At least 5 observables are cross-validated."""
        c = comparative_predictions()
        assert len(c) >= 5

    def test_each_has_complete_fields(self):
        """Each comparative entry has cathedral, lytollis, observed, agreement."""
        for row in comparative_predictions():
            for key in ("observable", "cathedral", "lytollis",
                        "observed", "agreement"):
                assert key in row


class TestEndToEndAudit:
    def test_audit_passes(self):
        assert cathedral_lytollis_synthesis_audit_passes()

    def test_audit_returns_complete_dict(self):
        a = cathedral_lytollis_synthesis_audit()
        for key in ("gamma_unification", "D3_uniqueness",
                    "sector_ratio_uniqueness", "alpha_cross",
                    "lambda_cross", "CKM_cross", "comparative"):
            assert key in a
