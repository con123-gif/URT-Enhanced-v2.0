"""Tests for urt/platonic_solids_cathedral.py — all 5 Platonic solid Cathedral identities."""
import pytest
from math import factorial

from urt.platonic_solids_cathedral import (
    TETRA_V, TETRA_E, TETRA_F, TETRA_CHI,
    CUBE_V, CUBE_E, CUBE_F, CUBE_CHI,
    OCTA_V, OCTA_E, OCTA_F, OCTA_CHI,
    DODEC_V, DODEC_E, DODEC_F, DODEC_CHI,
    ICOS_V, ICOS_E, ICOS_F, ICOS_CHI,
    SUM_V_ALL, SUM_E_ALL, SUM_F_ALL,
    SUM_V_EQ_SUM_F,
    IDENTITY_TETRA_V_IS_D_PLUS_1, IDENTITY_TETRA_E_IS_D_FACT,
    IDENTITY_TETRA_F_IS_D_PLUS_1, IDENTITY_TETRA_SELF_DUAL_EXACT,
    IDENTITY_TETRA_CHI_IS_D_M1,
    IDENTITY_CUBE_V_IS_2D, IDENTITY_CUBE_E_IS_V,
    IDENTITY_CUBE_F_IS_D_FACT, IDENTITY_CUBE_CHI_IS_D_M1,
    IDENTITY_OCTA_V_IS_D_FACT, IDENTITY_OCTA_E_IS_V,
    IDENTITY_OCTA_F_IS_2D, IDENTITY_OCTA_CHI_IS_D_M1,
    IDENTITY_DODEC_V_IS_F, IDENTITY_DODEC_E_IS_E,
    IDENTITY_DODEC_F_IS_V, IDENTITY_DODEC_CHI_IS_D_M1,
    IDENTITY_ICOS_V_IS_V, IDENTITY_ICOS_E_IS_E,
    IDENTITY_ICOS_F_IS_F, IDENTITY_ICOS_CHI_IS_D_M1,
    IDENTITY_CUBE_OCTA_DUAL, IDENTITY_DODEC_ICOS_DUAL,
    IDENTITY_SUM_V_IS_2Q_SQ, IDENTITY_SUM_F_IS_2Q_SQ,
    IDENTITY_SUM_E_IS_D_TIMES_E, IDENTITY_SUM_V_EQ_SUM_F,
    IDENTITY_N_PLATONIC_IS_q, IDENTITY_ALL_CHI_IS_D_M1,
    ALL_PLATONIC_IDENTITIES, ALL_PLATONIC_EXACT, N_PLATONIC_IDENTITIES,
    N_PLATONIC_SOLIDS,
    solid_data, platonic_summary, print_platonic_report,
)
from urt.shell_closure import D, N, V, E, F, q, G


# ── Tetrahedron ───────────────────────────────────────────────────────────────

class TestTetrahedron:
    def test_V_is_D_plus_1(self):
        assert IDENTITY_TETRA_V_IS_D_PLUS_1
        assert TETRA_V == D + 1 == 4

    def test_E_is_D_fact(self):
        assert IDENTITY_TETRA_E_IS_D_FACT
        assert TETRA_E == factorial(D) == 6

    def test_F_is_D_plus_1(self):
        assert IDENTITY_TETRA_F_IS_D_PLUS_1
        assert TETRA_F == D + 1 == 4

    def test_self_dual(self):
        """Tetrahedron is self-dual: V = F."""
        assert IDENTITY_TETRA_SELF_DUAL_EXACT
        assert TETRA_V == TETRA_F

    def test_chi_is_D_minus_1(self):
        assert IDENTITY_TETRA_CHI_IS_D_M1
        assert TETRA_CHI == D - 1 == 2

    def test_euler_formula(self):
        assert TETRA_V - TETRA_E + TETRA_F == 2


# ── Cube ──────────────────────────────────────────────────────────────────────

class TestCube:
    def test_V_is_2_to_D(self):
        assert IDENTITY_CUBE_V_IS_2D
        assert CUBE_V == 2**D == 8

    def test_E_is_V(self):
        """Cube edge count = icosahedral vertex count = V."""
        assert IDENTITY_CUBE_E_IS_V
        assert CUBE_E == V == 12

    def test_F_is_D_fact(self):
        assert IDENTITY_CUBE_F_IS_D_FACT
        assert CUBE_F == factorial(D) == 6

    def test_chi(self):
        assert IDENTITY_CUBE_CHI_IS_D_M1
        assert CUBE_CHI == D - 1 == 2

    def test_euler_formula(self):
        assert CUBE_V - CUBE_E + CUBE_F == 2


# ── Octahedron ────────────────────────────────────────────────────────────────

class TestOctahedron:
    def test_V_is_D_fact(self):
        assert IDENTITY_OCTA_V_IS_D_FACT
        assert OCTA_V == factorial(D) == 6

    def test_E_is_V(self):
        assert IDENTITY_OCTA_E_IS_V
        assert OCTA_E == V == 12

    def test_F_is_2_to_D(self):
        assert IDENTITY_OCTA_F_IS_2D
        assert OCTA_F == 2**D == 8

    def test_chi(self):
        assert IDENTITY_OCTA_CHI_IS_D_M1
        assert OCTA_CHI == D - 1 == 2

    def test_euler_formula(self):
        assert OCTA_V - OCTA_E + OCTA_F == 2


# ── Dodecahedron ──────────────────────────────────────────────────────────────

class TestDodecahedron:
    def test_V_is_F(self):
        """Dodecahedron vertices = icosahedral face count F."""
        assert IDENTITY_DODEC_V_IS_F
        assert DODEC_V == F == 20

    def test_E_is_E(self):
        """Dodecahedron edges = Cathedral E = 30."""
        assert IDENTITY_DODEC_E_IS_E
        assert DODEC_E == E == 30

    def test_F_is_V(self):
        """Dodecahedron faces = icosahedral vertex count V."""
        assert IDENTITY_DODEC_F_IS_V
        assert DODEC_F == V == 12

    def test_chi(self):
        assert IDENTITY_DODEC_CHI_IS_D_M1
        assert DODEC_CHI == D - 1 == 2

    def test_euler_formula(self):
        assert DODEC_V - DODEC_E + DODEC_F == 2


# ── Icosahedron ───────────────────────────────────────────────────────────────

class TestIcosahedron:
    def test_V_is_V(self):
        assert IDENTITY_ICOS_V_IS_V
        assert ICOS_V == V == 12

    def test_E_is_E(self):
        assert IDENTITY_ICOS_E_IS_E
        assert ICOS_E == E == 30

    def test_F_is_F(self):
        assert IDENTITY_ICOS_F_IS_F
        assert ICOS_F == F == 20

    def test_chi(self):
        assert IDENTITY_ICOS_CHI_IS_D_M1
        assert ICOS_CHI == D - 1 == 2

    def test_euler_formula(self):
        assert ICOS_V - ICOS_E + ICOS_F == 2

    def test_all_three_VEF_are_cathedral_integers(self):
        """The icosahedron's V, E, F are exactly the Cathedral integers V, E, F."""
        assert ICOS_V == V and ICOS_E == E and ICOS_F == F


# ── Duality ───────────────────────────────────────────────────────────────────

class TestDuality:
    def test_cube_octa_dual(self):
        """Cube and octahedron are dual: V↔F swap, same E."""
        assert IDENTITY_CUBE_OCTA_DUAL
        assert CUBE_V == OCTA_F  # 8 = 8
        assert CUBE_F == OCTA_V  # 6 = 6
        assert CUBE_E == OCTA_E  # 12 = 12

    def test_dodec_icos_dual(self):
        """Dodecahedron and icosahedron are dual: V↔F swap, same E."""
        assert IDENTITY_DODEC_ICOS_DUAL
        assert DODEC_V == ICOS_F  # 20 = 20
        assert DODEC_F == ICOS_V  # 12 = 12
        assert DODEC_E == ICOS_E  # 30 = 30

    def test_tetrahedron_self_dual(self):
        assert TETRA_V == TETRA_F  # 4 = 4


# ── Summary sums ──────────────────────────────────────────────────────────────

class TestSumIdentities:
    def test_sum_V_is_2q_squared(self):
        """ΣV = 4+8+6+20+12 = 50 = 2q²."""
        assert IDENTITY_SUM_V_IS_2Q_SQ
        assert SUM_V_ALL == 2 * q**2 == 50

    def test_sum_F_is_2q_squared(self):
        """ΣF = 4+6+8+12+20 = 50 = 2q²."""
        assert IDENTITY_SUM_F_IS_2Q_SQ
        assert SUM_F_ALL == 2 * q**2 == 50

    def test_sum_E_is_D_times_E(self):
        """ΣE = 6+12+12+30+30 = 90 = D×E."""
        assert IDENTITY_SUM_E_IS_D_TIMES_E
        assert SUM_E_ALL == D * E == 90

    def test_sum_V_equals_sum_F(self):
        """Total vertices across all Platonic solids = total faces."""
        assert IDENTITY_SUM_V_EQ_SUM_F
        assert SUM_V_ALL == SUM_F_ALL

    def test_sum_values(self):
        assert SUM_V_ALL == 50
        assert SUM_E_ALL == 90
        assert SUM_F_ALL == 50


# ── Global identities ─────────────────────────────────────────────────────────

class TestGlobal:
    def test_n_platonic_is_q(self):
        assert IDENTITY_N_PLATONIC_IS_q
        assert N_PLATONIC_SOLIDS == q == 5

    def test_all_chi_is_D_minus_1(self):
        assert IDENTITY_ALL_CHI_IS_D_M1

    def test_all_platonic_exact(self):
        assert ALL_PLATONIC_EXACT

    def test_n_identities(self):
        assert N_PLATONIC_IDENTITIES == len(ALL_PLATONIC_IDENTITIES)
        assert N_PLATONIC_IDENTITIES >= 25


# ── Helper functions ──────────────────────────────────────────────────────────

class TestHelpers:
    def test_solid_data_icosahedron(self):
        d = solid_data("icosahedron")
        assert d["V"] == V
        assert d["E"] == E
        assert d["F"] == F
        assert d["chi"] == D - 1

    def test_solid_data_cube(self):
        d = solid_data("cube")
        assert d["V"] == 2**D
        assert d["E"] == V
        assert d["F"] == factorial(D)

    def test_solid_data_tetrahedron(self):
        d = solid_data("tetrahedron")
        assert d["V"] == D + 1
        assert d["E"] == factorial(D)
        assert d["F"] == D + 1


# ── Summary / report ──────────────────────────────────────────────────────────

def test_summary_is_dict():
    s = platonic_summary()
    assert isinstance(s, dict)

def test_summary_values():
    s = platonic_summary()
    assert s["n_platonic"] == q
    assert s["icos_VEF"] == (V, E, F)
    assert s["sum_V_all"] == 50
    assert s["sum_E_all"] == 90
    assert s["all_platonic_exact"] is True

def test_print_report_runs(capsys):
    print_platonic_report()
    out = capsys.readouterr().out
    assert len(out) > 300

def test_print_report_contains_key_values(capsys):
    print_platonic_report()
    out = capsys.readouterr().out
    assert "50" in out
    assert "90" in out
    assert "CATHEDRAL" in out

def test_print_report_contains_cathedral_solid(capsys):
    print_platonic_report()
    out = capsys.readouterr().out
    assert "Icosahedron" in out or "icosahedron" in out

def test_print_report_contains_duality(capsys):
    print_platonic_report()
    out = capsys.readouterr().out
    assert "dual" in out.lower() or "Dual" in out
