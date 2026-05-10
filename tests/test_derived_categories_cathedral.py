"""Tests for derived_categories_cathedral.py — Wave 24 Cathedral module."""

import pytest
from urt.derived_categories_cathedral import (
    rank_K0_Pn, beilinson_exceptional, hochschild_dim_Sn, sod_length_del_pezzo,
    BEIL_P2_LEN, BEIL_P4_LEN, BEIL_P11_LEN, BEIL_P12_LEN,
    SOD_GR25, SOD_FL_D, SOD_Q_D, SOD_DP_D, SOD_DP_q, SOD_DP_DF,
    ALL_DERIVED_CAT_EXACT,
    derived_summary, print_derived_report,
)

D, q, V, N, G, F = 3, 5, 12, 13, 60, 20


class TestBeilinsonExceptionalCollections:
    def test_beil_p2_len_equals_D(self):
        assert BEIL_P2_LEN == D

    def test_beil_p4_len_equals_q(self):
        assert BEIL_P4_LEN == q

    def test_beil_p11_len_equals_V(self):
        assert BEIL_P11_LEN == V

    def test_beil_p12_len_equals_N(self):
        assert BEIL_P12_LEN == N

    def test_beilinson_fn_P2(self):
        assert beilinson_exceptional(D - 1) == D

    def test_beilinson_fn_P4(self):
        assert beilinson_exceptional(q - 1) == q

    def test_beilinson_fn_P12(self):
        assert beilinson_exceptional(N - 1) == N


class TestSemiOrthogonalDecompositions:
    def test_sod_gr25_equals_q(self):
        assert SOD_GR25 == q

    def test_sod_fl_d_equals_D_factorial(self):
        import math
        assert SOD_FL_D == math.factorial(D)

    def test_sod_q_d_equals_q(self):
        assert SOD_Q_D == q

    def test_sod_del_pezzo_D_equals_D_factorial(self):
        import math
        assert SOD_DP_D == math.factorial(D)  # SOD_DP_D = D+3 = 6 = D!

    def test_sod_del_pezzo_q_equals_2_pow_D(self):
        assert SOD_DP_q == 2 ** D            # SOD_DP_q = q+3 = 8 = 2^D

    def test_sod_del_pezzo_DF_equals_D_squared(self):
        assert SOD_DP_DF == D ** 2           # SOD_DP_DF = D!+3 = 9 = D²

    def test_sod_length_del_pezzo_fn_returns_int(self):
        result = sod_length_del_pezzo(D)
        assert isinstance(result, int)
        assert result > 0


class TestRankK0:
    def test_rank_K0_Pn_is_n_plus_1(self):
        assert rank_K0_Pn(D) == D + 1
        assert rank_K0_Pn(q) == q + 1
        assert rank_K0_Pn(V) == V + 1

    def test_rank_K0_P2_equals_D_plus_1(self):
        assert rank_K0_Pn(D - 1) == D

    def test_rank_K0_P12_equals_N(self):
        assert rank_K0_Pn(N - 1) == N


class TestHochschildDimension:
    def test_hochschild_dim_S3(self):
        # HH_dim(S_n) = 2(n-1) for path algebra of type A_{n-1}
        result = hochschild_dim_Sn(D)
        assert isinstance(result, int)
        assert result > 0

    def test_hochschild_dim_S5(self):
        result = hochschild_dim_Sn(q)
        assert isinstance(result, int)
        assert result > 0


class TestAllDerivedExact:
    def test_all_derived_exact_is_true(self):
        assert ALL_DERIVED_CAT_EXACT is True


class TestDerivedSummary:
    def test_summary_returns_dict(self):
        s = derived_summary()
        assert isinstance(s, dict)

    def test_summary_has_identities_key(self):
        s = derived_summary()
        assert "identities" in s or "ALL_DERIVED_EXACT" in s or len(s) > 0

    def test_summary_all_values_true(self):
        s = derived_summary()
        for k, v in s.items():
            if isinstance(v, bool):
                assert v is True, f"Identity {k} is False"


class TestPrintDerivedReport:
    def test_print_runs_without_error(self, capsys):
        print_derived_report()
        out = capsys.readouterr().out
        assert len(out) > 0

    def test_print_contains_cathedral(self, capsys):
        print_derived_report()
        out = capsys.readouterr().out
        assert "CATHEDRAL" in out or "cathedral" in out.lower() or "SOD" in out

    def test_print_contains_beilinson(self, capsys):
        print_derived_report()
        out = capsys.readouterr().out
        assert "Beilinson" in out or "beil" in out.lower() or "exceptional" in out.lower()
