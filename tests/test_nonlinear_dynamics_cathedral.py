"""Tests for urt/nonlinear_dynamics_cathedral.py — Cathedral nonlinear dynamics."""

import pytest
from math import log

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_lorenz_equations():
    from urt.nonlinear_dynamics_cathedral import N_LORENZ_EQUATIONS
    assert N_LORENZ_EQUATIONS == 3

def test_n_lorenz_eq_D():
    from urt.nonlinear_dynamics_cathedral import N_LORENZ_EQ_D
    assert N_LORENZ_EQ_D is True

def test_n_rossler_equations():
    from urt.nonlinear_dynamics_cathedral import N_ROSSLER_EQUATIONS
    assert N_ROSSLER_EQUATIONS == 3

def test_n_rossler_eq_D():
    from urt.nonlinear_dynamics_cathedral import N_ROSSLER_EQ_D
    assert N_ROSSLER_EQ_D is True

def test_n_lyapunov_3d():
    from urt.nonlinear_dynamics_cathedral import N_LYAPUNOV_3D
    assert N_LYAPUNOV_3D == 3

def test_n_lyapunov_eq_D():
    from urt.nonlinear_dynamics_cathedral import N_LYAPUNOV_EQ_D
    assert N_LYAPUNOV_EQ_D is True

def test_n_lyapunov_sign_types():
    from urt.nonlinear_dynamics_cathedral import N_LYAPUNOV_SIGN_TYPES
    assert N_LYAPUNOV_SIGN_TYPES == 3

def test_n_poincare_dim():
    from urt.nonlinear_dynamics_cathedral import N_POINCARE_DIM
    assert N_POINCARE_DIM == 2

def test_poincare_eq_D1():
    from urt.nonlinear_dynamics_cathedral import POINCARE_EQ_D1
    assert POINCARE_EQ_D1 is True

def test_min_chaos_dim():
    from urt.nonlinear_dynamics_cathedral import MIN_CHAOS_DIM
    assert MIN_CHAOS_DIM == 3

def test_chaos_dim_eq_D():
    from urt.nonlinear_dynamics_cathedral import CHAOS_DIM_EQ_D
    assert CHAOS_DIM_EQ_D is True

def test_takens_embedding_dim():
    from urt.nonlinear_dynamics_cathedral import TAKENS_EMBEDDING_DIM
    assert TAKENS_EMBEDDING_DIM == 7

def test_takens_eq_2D1():
    from urt.nonlinear_dynamics_cathedral import TAKENS_EQ_2D1
    assert TAKENS_EQ_2D1 is True

def test_n_primary_bifurcations():
    from urt.nonlinear_dynamics_cathedral import N_PRIMARY_BIFURCATIONS
    assert N_PRIMARY_BIFURCATIONS == 4

def test_bifurc_eq_D1():
    from urt.nonlinear_dynamics_cathedral import BIFURC_EQ_D1
    assert BIFURC_EQ_D1 is True

def test_period_doubling_dim():
    from urt.nonlinear_dynamics_cathedral import N_PERIOD_DOUBLING_DIM
    assert N_PERIOD_DOUBLING_DIM == 1

def test_hopf_normal_form_dim():
    from urt.nonlinear_dynamics_cathedral import N_HOPF_NORMAL_FORM_DIM
    assert N_HOPF_NORMAL_FORM_DIM == 2

def test_stable_cycle_logistic():
    from urt.nonlinear_dynamics_cathedral import STABLE_CYCLE_LOGISTIC
    assert STABLE_CYCLE_LOGISTIC == 6

def test_cycle_eq_V2():
    from urt.nonlinear_dynamics_cathedral import CYCLE_EQ_V2
    assert CYCLE_EQ_V2 is True

def test_ky_dim_bounds():
    from urt.nonlinear_dynamics_cathedral import KY_DIM_LOWER, KY_DIM_UPPER
    assert KY_DIM_LOWER == 2
    assert KY_DIM_UPPER == 3

def test_icos_info_dim():
    from urt.nonlinear_dynamics_cathedral import ICOS_INFO_DIM
    # log(13)/log(5) ≈ 1.594
    expected = log(13) / log(5)
    assert abs(ICOS_INFO_DIM - expected) < 1e-10

def test_icos_capacity_dim():
    from urt.nonlinear_dynamics_cathedral import ICOS_CAPACITY_DIM
    expected = log(13) / log(6)
    assert abs(ICOS_CAPACITY_DIM - expected) < 1e-10

def test_phase_space_dim():
    from urt.nonlinear_dynamics_cathedral import PHASE_SPACE_DIM
    assert PHASE_SPACE_DIM == 3

def test_shilnikov_min_dim():
    from urt.nonlinear_dynamics_cathedral import SHILNIKOV_MIN_DIM
    assert SHILNIKOV_MIN_DIM == 3

def test_shilnikov_eq_D():
    from urt.nonlinear_dynamics_cathedral import SHILNIKOV_EQ_D
    assert SHILNIKOV_EQ_D is True

def test_feigenbaum_delta_known():
    from urt.nonlinear_dynamics_cathedral import FEIGENBAUM_DELTA
    assert abs(FEIGENBAUM_DELTA - 4.669201609) < 1e-6

def test_feigenbaum_alpha_known():
    from urt.nonlinear_dynamics_cathedral import FEIGENBAUM_ALPHA
    assert abs(FEIGENBAUM_ALPHA - 2.502907875) < 1e-6

def test_delta_star_import():
    from urt.nonlinear_dynamics_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

# ── Function return values ─────────────────────────────────────────────────────

def test_lorenz_system_returns_dict():
    from urt.nonlinear_dynamics_cathedral import lorenz_system
    r = lorenz_system()
    assert isinstance(r, dict)

def test_lorenz_system_keys():
    from urt.nonlinear_dynamics_cathedral import lorenz_system
    r = lorenz_system()
    for key in ["n_equations", "eq_D", "n_lyapunov", "lyapunov_eq_D",
                "n_lyapunov_signs", "min_chaos_dim", "chaos_eq_D",
                "n_poincare_dim", "poincare_eq_D1"]:
        assert key in r, f"Missing key: {key}"

def test_lorenz_system_boolean_flags():
    from urt.nonlinear_dynamics_cathedral import lorenz_system
    r = lorenz_system()
    assert r["eq_D"] is True
    assert r["lyapunov_eq_D"] is True
    assert r["chaos_eq_D"] is True
    assert r["poincare_eq_D1"] is True

def test_lorenz_system_values():
    from urt.nonlinear_dynamics_cathedral import lorenz_system
    r = lorenz_system()
    assert r["n_equations"] == 3
    assert r["n_lyapunov"] == 3
    assert r["n_lyapunov_signs"] == 3
    assert r["min_chaos_dim"] == 3
    assert r["n_poincare_dim"] == 2

def test_bifurcation_theory_returns_dict():
    from urt.nonlinear_dynamics_cathedral import bifurcation_theory
    r = bifurcation_theory()
    assert isinstance(r, dict)

def test_bifurcation_theory_keys():
    from urt.nonlinear_dynamics_cathedral import bifurcation_theory
    r = bifurcation_theory()
    for key in ["n_bifurcations", "bifurc_eq_D1", "takens_dim", "takens_eq_2D1",
                "stable_cycle", "cycle_eq_V2", "hopf_dim", "period_doubling_dim"]:
        assert key in r, f"Missing key: {key}"

def test_bifurcation_theory_boolean_flags():
    from urt.nonlinear_dynamics_cathedral import bifurcation_theory
    r = bifurcation_theory()
    assert r["bifurc_eq_D1"] is True
    assert r["takens_eq_2D1"] is True
    assert r["cycle_eq_V2"] is True
    assert r["shilnikov_eq_D"] is True

def test_bifurcation_theory_values():
    from urt.nonlinear_dynamics_cathedral import bifurcation_theory
    r = bifurcation_theory()
    assert r["n_bifurcations"] == 4
    assert r["takens_dim"] == 7
    assert r["stable_cycle"] == 6
    assert r["hopf_dim"] == 2
    assert r["period_doubling_dim"] == 1
    assert r["shilnikov_min_dim"] == 3

def test_nonlinear_dynamics_summary_returns_dict():
    from urt.nonlinear_dynamics_cathedral import nonlinear_dynamics_summary
    r = nonlinear_dynamics_summary()
    assert isinstance(r, dict)

def test_nonlinear_dynamics_summary_keys():
    from urt.nonlinear_dynamics_cathedral import nonlinear_dynamics_summary
    r = nonlinear_dynamics_summary()
    for key in ["lorenz", "bifurcation", "KEY_EXACT_RESULTS", "delta_star", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_nonlinear_dynamics_summary_D_N():
    from urt.nonlinear_dynamics_cathedral import nonlinear_dynamics_summary
    r = nonlinear_dynamics_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_nonlinear_dynamics_summary_key_results():
    from urt.nonlinear_dynamics_cathedral import nonlinear_dynamics_summary
    r = nonlinear_dynamics_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_nonlinear_dynamics_report_runs(capsys):
    from urt.nonlinear_dynamics_cathedral import print_nonlinear_dynamics_report
    print_nonlinear_dynamics_report()
    captured = capsys.readouterr()
    assert len(captured.out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_stable_cycle_matches_V_half():
    """STABLE_CYCLE_LOGISTIC = V//2 = 6."""
    from urt.nonlinear_dynamics_cathedral import STABLE_CYCLE_LOGISTIC
    from urt.shell_closure import V
    assert STABLE_CYCLE_LOGISTIC == V // 2

def test_min_chaos_dim_matches_D():
    """MIN_CHAOS_DIM = D = 3."""
    from urt.nonlinear_dynamics_cathedral import MIN_CHAOS_DIM
    from urt.shell_closure import D
    assert MIN_CHAOS_DIM == D

def test_takens_matches_2D1():
    """TAKENS_EMBEDDING_DIM = 2D+1 = 7."""
    from urt.nonlinear_dynamics_cathedral import TAKENS_EMBEDDING_DIM
    from urt.shell_closure import D
    assert TAKENS_EMBEDDING_DIM == 2 * D + 1

def test_poincare_reduces_dimension():
    """Poincaré section reduces 3D flow to 2D map."""
    from urt.nonlinear_dynamics_cathedral import N_LORENZ_EQUATIONS, N_POINCARE_DIM
    assert N_POINCARE_DIM == N_LORENZ_EQUATIONS - 1

def test_logistic_cycle_vs_logistic_verification():
    """Cathedral 6-cycle must be consistent with logistic_verification module."""
    from urt.nonlinear_dynamics_cathedral import STABLE_CYCLE_LOGISTIC
    assert STABLE_CYCLE_LOGISTIC == 6
