"""Tests for urt/stat_mech_cathedral.py — Phase transitions, critical exponents."""

import pytest
from math import isfinite


def test_imports():
    from urt.stat_mech_cathedral import (
        D_UPPER_CRITICAL, D_LOWER_CRITICAL, D_IN_CRITICAL_WINDOW,
        EPS_EXPANSION, DELTA_MF, NU_ISING_D3, ETA_ISING_D3,
        BETA_ISING_D3, GAMMA_ISING_D3, ALPHA_ISING_D3,
        HYPERSCALING_CHECK, FISHER_CHECK,
        rg_flow_wilson, critical_exponents_D3, critical_dimensions,
        scaling_relations, stat_mech_summary, print_stat_mech_report,
    )


# ── Critical dimensions ───────────────────────────────────────────────────────

def test_upper_critical_dim_eq_D1():
    """D_uc = D+1 = 4 for Ising universality."""
    from urt.stat_mech_cathedral import D_UPPER_CRITICAL
    from urt.shell_closure import D
    assert D_UPPER_CRITICAL == D + 1
    assert D_UPPER_CRITICAL == 4


def test_lower_critical_dim_eq_D_minus_2():
    """D_lc = D-2 = 1 for Ising."""
    from urt.stat_mech_cathedral import D_LOWER_CRITICAL
    from urt.shell_closure import D
    assert D_LOWER_CRITICAL == D - 2
    assert D_LOWER_CRITICAL == 1


def test_D_in_critical_window():
    """D is between lower and upper critical dims."""
    from urt.stat_mech_cathedral import D_IN_CRITICAL_WINDOW
    assert D_IN_CRITICAL_WINDOW is True


def test_eps_expansion_eq_1():
    """ε = D+1 - D = 1 EXACT."""
    from urt.stat_mech_cathedral import EPS_EXPANSION
    from urt.shell_closure import D
    assert EPS_EXPANSION == D + 1 - D
    assert EPS_EXPANSION == 1


# ── Mean-field exponents ──────────────────────────────────────────────────────

def test_delta_MF_eq_D1():
    """Mean-field δ = D+1 = 4 EXACT."""
    from urt.stat_mech_cathedral import DELTA_MF
    from urt.shell_closure import D
    assert DELTA_MF == D + 1
    assert DELTA_MF == 4


def test_nu_MF():
    """Mean-field ν = 1/2."""
    from urt.stat_mech_cathedral import NU_MF
    assert abs(NU_MF - 0.5) < 1e-12


# ── D=3 Ising exponents ───────────────────────────────────────────────────────

def test_nu_ising_range():
    """ν ≈ 0.630 (between MF=0.5 and exact=0.630)."""
    from urt.stat_mech_cathedral import NU_ISING_D3
    assert 0.5 < NU_ISING_D3 < 0.7


def test_eta_ising_range():
    """η ≈ 0.036 (small anomalous dimension)."""
    from urt.stat_mech_cathedral import ETA_ISING_D3
    assert 0.0 < ETA_ISING_D3 < 0.1


def test_beta_ising_range():
    """β ≈ 0.326 (between 0 and MF=0.5)."""
    from urt.stat_mech_cathedral import BETA_ISING_D3
    assert 0.2 < BETA_ISING_D3 < 0.5


def test_gamma_ising_range():
    """γ ≈ 1.237 > 1 (enhanced susceptibility)."""
    from urt.stat_mech_cathedral import GAMMA_ISING_D3
    assert GAMMA_ISING_D3 > 1.0


def test_alpha_ising_positive():
    """α ≈ 0.110 (positive: weak divergence)."""
    from urt.stat_mech_cathedral import ALPHA_ISING_D3
    assert 0.0 < ALPHA_ISING_D3 < 0.2


# ── Scaling relations ─────────────────────────────────────────────────────────

def test_hyperscaling():
    """2 - α = ν × D."""
    from urt.stat_mech_cathedral import HYPERSCALING_CHECK
    assert HYPERSCALING_CHECK is True


def test_fisher_relation():
    """γ ≈ ν(2-η) [Fisher]."""
    from urt.stat_mech_cathedral import FISHER_CHECK
    assert FISHER_CHECK is True


def test_scaling_relations_function():
    from urt.stat_mech_cathedral import scaling_relations
    r = scaling_relations()
    assert r["rushbrooke_ok"] is True
    assert r["widom_ok"] is True
    assert r["josephson_ok"] is True
    assert abs(r["rushbrooke_sum"] - 2.0) < 0.01


# ── ε-expansion ───────────────────────────────────────────────────────────────

def test_rg_flow_wilson_eps1():
    from urt.stat_mech_cathedral import rg_flow_wilson
    r = rg_flow_wilson(eps=1.0)
    assert r["eps_eq_1"] is True
    assert r["nu_1loop"] > 0.5
    assert r["deviation_pct"] < 10.0  # within 10% of exact


def test_rg_nu_converges():
    """Higher loop ν closer to exact."""
    from urt.stat_mech_cathedral import rg_flow_wilson, NU_ISING_D3
    r = rg_flow_wilson(eps=1.0, n_order=2)
    assert abs(r["nu_used"] - NU_ISING_D3) < abs(r["nu_1loop"] - NU_ISING_D3)


# ── Function tests ────────────────────────────────────────────────────────────

def test_critical_exponents_function():
    from urt.stat_mech_cathedral import critical_exponents_D3
    r = critical_exponents_D3()
    assert r["D"] == 3
    assert r["MF_delta_eq_D1"] is True
    assert r["hyperscaling_ok"] is True


def test_critical_dimensions_function():
    from urt.stat_mech_cathedral import critical_dimensions
    r = critical_dimensions()
    assert r["D_upper_critical"] == 4
    assert r["D_lower_critical"] == 1
    assert r["eps_expansion"] == 1
    assert r["D_in_window"] is True


def test_stat_mech_summary():
    from urt.stat_mech_cathedral import stat_mech_summary
    r = stat_mech_summary()
    assert "critical_dims" in r
    assert "exponents_D3" in r
    assert "scaling_relations" in r
    assert len(r["key_results"]) >= 4


def test_print_stat_mech_report(capsys):
    from urt.stat_mech_cathedral import print_stat_mech_report
    print_stat_mech_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "critical" in out.lower() or "Critical" in out
    assert len(out) > 200
