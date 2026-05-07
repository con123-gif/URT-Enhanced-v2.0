"""Tests for urt/string_landscape.py — Exceptional geometry meets Cathedral string theory."""

import pytest
from urt.string_landscape import (
    critical_dimensions,
    exceptional_groups,
    heterotic_string,
    moonshine_connection,
    string_landscape_summary,
    print_string_report,
    D_BOSONIC,
    D_SUPER,
    D_M_THEORY,
    D_LEECH,
    E8_ROOTS,
    E8_RANK,
    E8_DIM,
    E6_27PLET,
    E6_78_ADJ,
    HETEROTIC_DIM,
    HETEROTIC_GAUGE_DIM,
    SO32_DIM,
    BOSONIC_LEECH_GAP,
    J_COEFF_1,
    MONSTER_LOWEST_REP,
)
from urt.shell_closure import DELTA_STAR, N, D, F, G, q, gamma, phi, V


class TestCriticalDimensions:
    def setup_method(self):
        self.cd = critical_dimensions()

    def test_bosonic_is_2N(self):
        """Bosonic string critical dimension = 2N = 2×13 = 26."""
        assert D_BOSONIC == 2 * N
        assert D_BOSONIC == 26

    def test_super_is_2q(self):
        """Superstring critical dimension = 2q = 2×5 = 10."""
        assert D_SUPER == 2 * q
        assert D_SUPER == 10

    def test_leech_is_2V(self):
        """Leech lattice dimension = 2V = 2×12 = 24."""
        assert D_LEECH == 2 * V
        assert D_LEECH == 24

    def test_m_theory_is_11(self):
        """M-theory dimension = 2q + 1 = 11."""
        assert D_M_THEORY == D_SUPER + 1
        assert D_M_THEORY == 11

    def test_bosonic_check_in_dict(self):
        """Dict confirms bosonic=26."""
        assert self.cd["bosonic"] == 26
        assert self.cd["bosonic_check"] is True

    def test_super_check_in_dict(self):
        """Dict confirms super=10."""
        assert self.cd["super"] == 10
        assert self.cd["super_check"] is True

    def test_leech_check_in_dict(self):
        """Dict confirms leech=24."""
        assert self.cd["leech"] == 24
        assert self.cd["leech_check"] is True

    def test_m_theory_check_in_dict(self):
        """Dict confirms M-theory=11."""
        assert self.cd["M_theory"] == 11
        assert self.cd["M_theory_check"] is True

    def test_bosonic_leech_gap(self):
        """26 - 24 = 2 = q - D."""
        assert BOSONIC_LEECH_GAP == 2
        assert BOSONIC_LEECH_GAP == q - D


class TestExceptionalGroups:
    def setup_method(self):
        self.eg = exceptional_groups()

    def test_e8_roots_is_4G(self):
        """E₈ root system = 4G = 4×|A₅| = 4×60 = 240."""
        assert E8_ROOTS == 4 * G
        assert E8_ROOTS == 240

    def test_e8_roots_check_in_dict(self):
        """Dict confirms e8_roots=240."""
        assert self.eg["e8_roots"] == 240
        assert self.eg["e8_roots_check"] is True

    def test_e8_rank(self):
        """E₈ rank = D_super - 2 = 8."""
        assert E8_RANK == D_SUPER - 2
        assert E8_RANK == 8

    def test_e8_dim(self):
        """E₈ dimension = 4G + 8 = 248."""
        assert E8_DIM == E8_ROOTS + E8_RANK
        assert E8_DIM == 248
        assert self.eg["e8_dim_check"] is True

    def test_e6_27plet(self):
        """E₆ 27-plet = (N-D-1)×D = 9×3 = 27."""
        assert E6_27PLET == (N - D - 1) * D
        assert E6_27PLET == 27
        assert self.eg["e6_27_check"] is True

    def test_e6_78_adj(self):
        """E₆ adjoint = G + F - 2 = 60 + 20 - 2 = 78."""
        assert E6_78_ADJ == G + F - 2
        assert E6_78_ADJ == 78
        assert self.eg["e6_78_check"] is True


class TestHeteroticString:
    def setup_method(self):
        self.het = heterotic_string()

    def test_dimension(self):
        """Heterotic string in 10D = 2q."""
        assert HETEROTIC_DIM == 2 * q
        assert HETEROTIC_DIM == 10
        assert self.het["dim_check"] is True

    def test_gauge_dim(self):
        """Gauge group dimension = 2×248 = 496."""
        assert HETEROTIC_GAUGE_DIM == 2 * E8_DIM
        assert HETEROTIC_GAUGE_DIM == 496
        assert self.het["gauge_dim_check"] is True

    def test_so32_equals_e8e8(self):
        """dim(SO(32)) = dim(E₈×E₈) = 496."""
        assert SO32_DIM == HETEROTIC_GAUGE_DIM
        assert SO32_DIM == 496
        assert self.het["so32_equals_e8e8"] is True

    def test_gauge_group_string(self):
        """Gauge group labeled as E₈×E₈."""
        assert "E₈" in self.het["gauge_group"]


class TestMoonshineConnection:
    def setup_method(self):
        self.ms = moonshine_connection()

    def test_bosonic_dim(self):
        """Bosonic dim = 2N = 26 in moonshine dict."""
        assert self.ms["bosonic_dim"] == 26

    def test_leech_dim(self):
        """Leech dim = 2V = 24 in moonshine dict."""
        assert self.ms["leech_dim"] == 24

    def test_mckay_identity(self):
        """196884 = 196883 + 1 (McKay moonshine)."""
        assert J_COEFF_1 == MONSTER_LOWEST_REP + 1
        assert self.ms["mckay_identity"] is True

    def test_compactified_dims(self):
        """Compactified dimensions = 26 - 24 = 2."""
        assert self.ms["compactified_dims"] == 2

    def test_chain_present(self):
        """Chain description present."""
        assert "Leech" in self.ms["chain"] or "leech" in self.ms["chain"].lower()


class TestSummary:
    def setup_method(self):
        self.s = string_landscape_summary()

    def test_keys_present(self):
        """All major keys present."""
        for key in ("critical_dimensions", "exceptional_groups",
                    "heterotic", "moonshine", "delta_star"):
            assert key in self.s

    def test_delta_star_value(self):
        """δ★ in summary matches shell_closure."""
        assert abs(self.s["delta_star"] - DELTA_STAR) < 1e-14


class TestPrintReport:
    def test_print_does_not_raise(self, capsys):
        """print_string_report() runs without error."""
        print_string_report()
        captured = capsys.readouterr()
        assert "26" in captured.out
        assert "10" in captured.out
