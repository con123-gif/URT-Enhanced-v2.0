"""Tests for urt.invariant_theory_cathedral — classical invariant theory hits."""
import math

from urt.invariant_theory_cathedral import (
    ALL_INV_THEORY_EXACT,
    ALL_INV_THEORY_IDENTITIES,
    N_INV_THEORY_IDENTITIES,
    N_INV_BINARY_QUINTIC,
    N_INV_BINARY_SEXTIC,
    DEG_DISC_CUBIC,
    DEG_DISC_QUINTIC,
    SYT_SHAPE_DD,
    DIM_SYM_D_C_D,
    WEYL_A_Dm1_DEG_PRODUCT,
    WEYL_A_D_DEG_PRODUCT,
    WEYL_B_D_DEG_PRODUCT,
    WEYL_G2_DEG_PRODUCT,
    N_REFL_S_D,
    N_REFL_S_Dp1,
    N_REFL_W_B_D,
    DISC_DEG_FORM_D,
    DISC_DEG_FORM_Q,
    VERONESE_TARGET_DIM,
    VERONESE_AMBIENT_P_DIM,
    GIT_CY_N_POINTS,
    GIT_MODULI_DIM,
    MOLIEN_S_D_DENOM,
    MOLIEN_POLE_ORDER,
    invariant_theory_summary,
)
from urt.shell_closure import D, V, F, q


def test_master_flag_passes():
    """ALL_INV_THEORY_EXACT must be True."""
    assert ALL_INV_THEORY_EXACT


def test_every_identity_holds():
    """Each registered identity must hold individually."""
    failed = [k for k, v in ALL_INV_THEORY_IDENTITIES.items() if not v]
    assert failed == []


def test_identity_count():
    assert N_INV_THEORY_IDENTITIES == len(ALL_INV_THEORY_IDENTITIES)
    assert N_INV_THEORY_IDENTITIES >= 30


def test_binary_quintic_invariants_equal_q():
    """5 basic invariants of binary quintic = q SELF-REF."""
    assert N_INV_BINARY_QUINTIC == q == 5


def test_binary_sextic_invariants_equal_DFact():
    assert N_INV_BINARY_SEXTIC == math.factorial(D) == 6


def test_disc_cubic_degree_equals_D():
    """deg Disc(cubic) = 3 = D SELF-REF."""
    assert DEG_DISC_CUBIC == D == 3


def test_disc_quintic_degree_equals_F():
    """deg Disc(quintic) = q(q-1) = F = 20."""
    assert DEG_DISC_QUINTIC == F == q * (q - 1) == 20


def test_syt_shape_DD_is_catalan_q():
    """SYT(D,D) count = Catalan(D) = q = 5 SELF-REF."""
    catalan_D = math.comb(2 * D, D) // (D + 1)
    assert SYT_SHAPE_DD == catalan_D == q


def test_sym_D_dim_is_2q():
    assert DIM_SYM_D_C_D == 2 * q == 10


def test_weyl_A_Dm1_product_is_DFact():
    """S_D = W(A_{D-1}) degree product = D! = 6."""
    assert WEYL_A_Dm1_DEG_PRODUCT == math.factorial(D) == 6


def test_weyl_A_D_product_is_2V():
    """S_{D+1} = W(A_D) degree product = 2V = 24."""
    assert WEYL_A_D_DEG_PRODUCT == 2 * V == 24


def test_weyl_B_D_product_is_2_to_D_times_DFact():
    """W(B_D) degree product = 2^D · D! = 48."""
    assert WEYL_B_D_DEG_PRODUCT == 2 ** D * math.factorial(D) == 48


def test_weyl_G2_product_is_V():
    """W(G_2) degree product = V = 12."""
    assert WEYL_G2_DEG_PRODUCT == V == 12


def test_reflections_S_D_is_D():
    """C(D,2) reflections in S_D = D SELF-REF."""
    assert N_REFL_S_D == math.comb(D, 2) == D == 3


def test_reflections_S_Dp1_is_DFact():
    assert N_REFL_S_Dp1 == math.comb(D + 1, 2) == math.factorial(D) == 6


def test_reflections_W_B_D_is_D_squared():
    assert N_REFL_W_B_D == D ** 2 == 9


def test_disc_degree_D_form_is_Dp1():
    assert DISC_DEG_FORM_D == 2 * (D - 1) == D + 1 == 4


def test_disc_degree_q_form_is_F():
    assert DISC_DEG_FORM_Q == q * (q - 1) == F == 20


def test_veronese_target_dim_is_2q():
    assert VERONESE_TARGET_DIM == 2 * q == 10


def test_veronese_ambient_dim_is_D_squared():
    """Ambient P^{D²-1} so ambient P-dim = D² - 1."""
    assert VERONESE_AMBIENT_P_DIM == D ** 2 == 9


def test_git_calabi_yau_n_is_Dp1():
    assert GIT_CY_N_POINTS == D + 1 == 4


def test_git_moduli_dim_self_referential():
    """dim moduli of D!-points = D! - D = D SELF-REF."""
    assert GIT_MODULI_DIM == math.factorial(D) - D == D == 3


def test_molien_denominator_is_DFact():
    assert MOLIEN_S_D_DENOM == math.factorial(D) == 6


def test_molien_pole_order_is_D():
    assert MOLIEN_POLE_ORDER == D == 3


def test_summary_structure():
    s = invariant_theory_summary()
    assert s["module"] == "invariant_theory_cathedral"
    assert s["ALL_INV_THEORY_EXACT"] is True
    assert s["total_identities"] == N_INV_THEORY_IDENTITIES
    for key in ("binary_forms", "symmetric_functions", "weyl_degrees",
                "reflections", "veronese", "git"):
        assert key in s
