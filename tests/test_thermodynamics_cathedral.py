"""Tests for urt/thermodynamics_cathedral.py — Thermodynamics and Cathedral integers."""

import pytest
from math import isfinite


# ── Imports ───────────────────────────────────────────────────────────────────

def test_imports():
    from urt.thermodynamics_cathedral import (
        N_LAWS_THERMO,
        N_THERMO_POTENTIALS,
        N_INTENSIVE_VARS,
        N_MAXWELL_RELATIONS,
        CLAUSIUS_CLAPEYRON_COEXISTENCE,
        GIBBS_DUHEM_EQNS,
        N_CRITICAL_EXPONENTS_THERMO,
        CARNOT_EFFICIENCY_FACTOR,
        ENTROPY_BOLTZMANN_LOG,
        N_TRIPLE_POINT_PHASES,
        N_THERMODYNAMIC_DEGREES_IDEAL_GAS,
        ADIABATIC_INDEX_MONATOMIC,
        CLUSTER_INTEGRAL_DIM,
        JOULE_THOMSON_COEFF_IDEAL,
        CP_OVER_CV_MONATOMIC,
        VDW_CRITICAL_COMPRESS,
        STEFAN_BOLTZMANN_EXPONENT,
        PHASE_SPACE_DIM_PER_PARTICLE,
        EQUIPARTITION_DOF_MONATOMIC,
        ALPHA_HEAT_CAPACITY,
        BETA_ORDER_PARAM,
        GAMMA_SUSCEPTIBILITY,
        DELTA_EOS,
        thermo_laws,
        thermodynamic_potentials,
        critical_exponents_thermo,
        thermodynamics_summary,
        print_thermodynamics_report,
    )


# ── Laws of thermodynamics ────────────────────────────────────────────────────

def test_n_laws_thermo_eq_D_plus_1():
    """Four laws of thermodynamics = D+1 = 4  [EXACT]."""
    from urt.thermodynamics_cathedral import N_LAWS_THERMO
    from urt.shell_closure import D
    assert N_LAWS_THERMO == D + 1
    assert N_LAWS_THERMO == 4


# ── Thermodynamic potentials ──────────────────────────────────────────────────

def test_n_thermo_potentials_eq_D_plus_1():
    """Four thermodynamic potentials (U, H, F, G) = D+1 = 4  [EXACT]."""
    from urt.thermodynamics_cathedral import N_THERMO_POTENTIALS
    from urt.shell_closure import D
    assert N_THERMO_POTENTIALS == D + 1
    assert N_THERMO_POTENTIALS == 4


# ── Intensive variables ───────────────────────────────────────────────────────

def test_n_intensive_vars_eq_D():
    """Intensive variables (T, P, μ) = D = 3  [EXACT]."""
    from urt.thermodynamics_cathedral import N_INTENSIVE_VARS
    from urt.shell_closure import D
    assert N_INTENSIVE_VARS == D
    assert N_INTENSIVE_VARS == 3


# ── Maxwell relations ─────────────────────────────────────────────────────────

def test_n_maxwell_relations_eq_D_plus_1():
    """Four Maxwell relations = D+1 = 4  [EXACT]."""
    from urt.thermodynamics_cathedral import N_MAXWELL_RELATIONS
    from urt.shell_closure import D
    assert N_MAXWELL_RELATIONS == D + 1
    assert N_MAXWELL_RELATIONS == 4


# ── Coexistence curve ─────────────────────────────────────────────────────────

def test_clausius_clapeyron_coexistence_eq_D_minus_2():
    """Coexistence curve dimension = D-2 = 1  [EXACT]."""
    from urt.thermodynamics_cathedral import CLAUSIUS_CLAPEYRON_COEXISTENCE
    from urt.shell_closure import D
    assert CLAUSIUS_CLAPEYRON_COEXISTENCE == D - 2
    assert CLAUSIUS_CLAPEYRON_COEXISTENCE == 1


def test_gibbs_duhem_eq_D_minus_2():
    """Gibbs-Duhem equations = D-2 = 1  [EXACT]."""
    from urt.thermodynamics_cathedral import GIBBS_DUHEM_EQNS
    from urt.shell_closure import D
    assert GIBBS_DUHEM_EQNS == D - 2
    assert GIBBS_DUHEM_EQNS == 1


# ── Critical exponents ────────────────────────────────────────────────────────

def test_n_critical_exponents_eq_D_plus_1():
    """Four classical critical exponents (α, β, γ, δ) = D+1 = 4  [EXACT]."""
    from urt.thermodynamics_cathedral import N_CRITICAL_EXPONENTS_THERMO
    from urt.shell_closure import D
    assert N_CRITICAL_EXPONENTS_THERMO == D + 1
    assert N_CRITICAL_EXPONENTS_THERMO == 4


def test_mean_field_exponents():
    """Classical mean-field critical exponents."""
    from urt.thermodynamics_cathedral import (
        ALPHA_HEAT_CAPACITY, BETA_ORDER_PARAM,
        GAMMA_SUSCEPTIBILITY, DELTA_EOS
    )
    assert abs(ALPHA_HEAT_CAPACITY - 0.0) < 1e-12
    assert abs(BETA_ORDER_PARAM - 0.5) < 1e-12
    assert abs(GAMMA_SUSCEPTIBILITY - 1.0) < 1e-12


def test_delta_eos_eq_D():
    """Mean-field equation-of-state exponent δ_eos = D = 3."""
    from urt.thermodynamics_cathedral import DELTA_EOS
    from urt.shell_closure import D
    assert abs(DELTA_EOS - float(D)) < 1e-12
    assert abs(DELTA_EOS - 3.0) < 1e-10


# ── Carnot and Boltzmann ──────────────────────────────────────────────────────

def test_carnot_factor():
    """Carnot efficiency factor = 1.0 (dimensionless)."""
    from urt.thermodynamics_cathedral import CARNOT_EFFICIENCY_FACTOR
    assert abs(CARNOT_EFFICIENCY_FACTOR - 1.0) < 1e-12


def test_entropy_boltzmann():
    """Boltzmann entropy factor = 1.0 (natural units)."""
    from urt.thermodynamics_cathedral import ENTROPY_BOLTZMANN_LOG
    assert abs(ENTROPY_BOLTZMANN_LOG - 1.0) < 1e-12


# ── Triple point ──────────────────────────────────────────────────────────────

def test_triple_point_phases_eq_D():
    """Triple point: D=3 phases coexist  [EXACT]."""
    from urt.thermodynamics_cathedral import N_TRIPLE_POINT_PHASES
    from urt.shell_closure import D
    assert N_TRIPLE_POINT_PHASES == D
    assert N_TRIPLE_POINT_PHASES == 3


# ── Ideal gas DOF ─────────────────────────────────────────────────────────────

def test_ideal_gas_dof_eq_D():
    """Monatomic ideal gas has D=3 translational DOF  [EXACT]."""
    from urt.thermodynamics_cathedral import N_THERMODYNAMIC_DEGREES_IDEAL_GAS
    from urt.shell_closure import D
    assert N_THERMODYNAMIC_DEGREES_IDEAL_GAS == D
    assert N_THERMODYNAMIC_DEGREES_IDEAL_GAS == 3


# ── Adiabatic index ───────────────────────────────────────────────────────────

def test_adiabatic_index_formula():
    """γ_adia = (D+2)/D = q/D = 5/3  [EXACT]."""
    from urt.thermodynamics_cathedral import ADIABATIC_INDEX_MONATOMIC
    from urt.shell_closure import D, q
    expected_formula = float(D + 2) / D
    expected_qD = float(q) / D
    assert abs(ADIABATIC_INDEX_MONATOMIC - expected_formula) < 1e-12
    assert abs(ADIABATIC_INDEX_MONATOMIC - expected_qD) < 1e-12
    assert abs(ADIABATIC_INDEX_MONATOMIC - 5.0 / 3.0) < 1e-10


def test_adiabatic_index_gt_1():
    """Adiabatic index must be > 1."""
    from urt.thermodynamics_cathedral import ADIABATIC_INDEX_MONATOMIC
    assert ADIABATIC_INDEX_MONATOMIC > 1.0


def test_cp_over_cv_eq_adiabatic():
    """CP/CV = adiabatic index for monatomic gas."""
    from urt.thermodynamics_cathedral import CP_OVER_CV_MONATOMIC, ADIABATIC_INDEX_MONATOMIC
    assert abs(CP_OVER_CV_MONATOMIC - ADIABATIC_INDEX_MONATOMIC) < 1e-12


# ── Cluster integral ──────────────────────────────────────────────────────────

def test_cluster_integral_dim_eq_D_minus_1():
    """Second virial cluster integral dim = D-1 = 2  [EXACT]."""
    from urt.thermodynamics_cathedral import CLUSTER_INTEGRAL_DIM
    from urt.shell_closure import D
    assert CLUSTER_INTEGRAL_DIM == D - 1
    assert CLUSTER_INTEGRAL_DIM == 2


# ── Joule-Thomson ─────────────────────────────────────────────────────────────

def test_joule_thomson_ideal_zero():
    """Ideal gas JT coefficient = 0."""
    from urt.thermodynamics_cathedral import JOULE_THOMSON_COEFF_IDEAL
    assert abs(JOULE_THOMSON_COEFF_IDEAL) < 1e-12


# ── Van der Waals ─────────────────────────────────────────────────────────────

def test_vdw_critical_compress():
    """vdW critical compressibility Z_c = D/(D+q) = 3/8 = 0.375."""
    from urt.thermodynamics_cathedral import VDW_CRITICAL_COMPRESS
    from urt.shell_closure import D, q
    expected = float(D) / (D + q)
    assert abs(VDW_CRITICAL_COMPRESS - expected) < 1e-12
    assert abs(VDW_CRITICAL_COMPRESS - 3.0 / 8.0) < 1e-10


# ── Stefan-Boltzmann ──────────────────────────────────────────────────────────

def test_stefan_boltzmann_exponent():
    """Stefan-Boltzmann: E ~ T^{D+1} = T^4  [EXACT]."""
    from urt.thermodynamics_cathedral import STEFAN_BOLTZMANN_EXPONENT
    from urt.shell_closure import D
    assert STEFAN_BOLTZMANN_EXPONENT == D + 1
    assert STEFAN_BOLTZMANN_EXPONENT == 4


# ── Phase space ───────────────────────────────────────────────────────────────

def test_phase_space_dim():
    """Phase space dim per particle = 2D = 6  [EXACT]."""
    from urt.thermodynamics_cathedral import PHASE_SPACE_DIM_PER_PARTICLE
    from urt.shell_closure import D
    assert PHASE_SPACE_DIM_PER_PARTICLE == 2 * D
    assert PHASE_SPACE_DIM_PER_PARTICLE == 6


# ── Equipartition ─────────────────────────────────────────────────────────────

def test_equipartition_dof():
    """Equipartition DOF for monatomic = D = 3  [EXACT]."""
    from urt.thermodynamics_cathedral import EQUIPARTITION_DOF_MONATOMIC
    from urt.shell_closure import D
    assert EQUIPARTITION_DOF_MONATOMIC == D
    assert EQUIPARTITION_DOF_MONATOMIC == 3


# ── thermo_laws() function ────────────────────────────────────────────────────

def test_thermo_laws_returns_dict():
    from urt.thermodynamics_cathedral import thermo_laws
    r = thermo_laws()
    assert isinstance(r, dict)


def test_thermo_laws_n_laws():
    from urt.thermodynamics_cathedral import thermo_laws
    from urt.shell_closure import D
    r = thermo_laws()
    assert r["n_laws"] == D + 1
    assert r["laws_eq_D1"] is True


def test_thermo_laws_n_potentials():
    from urt.thermodynamics_cathedral import thermo_laws
    from urt.shell_closure import D
    r = thermo_laws()
    assert r["n_potentials"] == D + 1
    assert r["potentials_eq_D1"] is True


def test_thermo_laws_n_intensive():
    from urt.thermodynamics_cathedral import thermo_laws
    from urt.shell_closure import D
    r = thermo_laws()
    assert r["n_intensive"] == D
    assert r["intensive_eq_D"] is True


def test_thermo_laws_maxwell():
    from urt.thermodynamics_cathedral import thermo_laws
    from urt.shell_closure import D
    r = thermo_laws()
    assert r["n_maxwell"] == D + 1
    assert r["maxwell_eq_D1"] is True


def test_thermo_laws_coexistence():
    from urt.thermodynamics_cathedral import thermo_laws
    from urt.shell_closure import D
    r = thermo_laws()
    assert r["coexistence_dim"] == D - 2
    assert r["coexistence_eq_D2"] is True


# ── thermodynamic_potentials() function ──────────────────────────────────────

def test_potentials_returns_dict():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    r = thermodynamic_potentials()
    assert isinstance(r, dict)


def test_potentials_n_potentials():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    from urt.shell_closure import D
    r = thermodynamic_potentials()
    assert r["n_potentials"] == D + 1
    assert r["potentials_eq_D1"] is True


def test_potentials_stefan():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    from urt.shell_closure import D
    r = thermodynamic_potentials()
    assert r["stefan_exp"] == D + 1
    assert r["stefan_eq_D1"] is True


def test_potentials_phase_space():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    from urt.shell_closure import D
    r = thermodynamic_potentials()
    assert r["phase_space_dim"] == 2 * D
    assert r["phase_space_eq_2D"] is True


def test_potentials_equipartition():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    from urt.shell_closure import D
    r = thermodynamic_potentials()
    assert r["equipartition"] == D
    assert r["equipartition_eq_D"] is True


def test_potentials_cp_cv():
    from urt.thermodynamics_cathedral import thermodynamic_potentials
    r = thermodynamic_potentials()
    assert abs(r["cp_over_cv"] - 5.0 / 3.0) < 1e-10


# ── critical_exponents_thermo() function ─────────────────────────────────────

def test_critical_exponents_returns_dict():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    r = critical_exponents_thermo()
    assert isinstance(r, dict)


def test_critical_exponents_n():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    from urt.shell_closure import D
    r = critical_exponents_thermo()
    assert r["n_exponents"] == D + 1
    assert r["exponents_eq_D1"] is True


def test_critical_exponents_values():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    r = critical_exponents_thermo()
    assert abs(r["alpha"] - 0.0) < 1e-12
    assert abs(r["beta"] - 0.5) < 1e-12
    assert abs(r["gamma_susc"] - 1.0) < 1e-12


def test_critical_delta_eq_D():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    from urt.shell_closure import D
    r = critical_exponents_thermo()
    assert abs(r["delta_eos"] - float(D)) < 1e-12
    assert r["delta_eq_D"] is True


def test_critical_triple_point():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    from urt.shell_closure import D
    r = critical_exponents_thermo()
    assert r["triple_phases"] == D
    assert r["triple_eq_D"] is True


def test_critical_adiabatic():
    from urt.thermodynamics_cathedral import critical_exponents_thermo
    from urt.shell_closure import D, q
    r = critical_exponents_thermo()
    assert abs(r["adiabatic_index"] - float(q) / D) < 1e-12
    assert r["adia_eq_qD"] is True


# ── thermodynamics_summary() function ────────────────────────────────────────

def test_summary_returns_dict():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    assert isinstance(s, dict)


def test_summary_has_laws_key():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    assert "laws" in s


def test_summary_has_potentials_key():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    assert "potentials" in s


def test_summary_has_critical_key():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    assert "critical" in s


def test_summary_has_key_results():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    assert "key_results" in s
    assert isinstance(s["key_results"], list)
    assert len(s["key_results"]) >= 6


def test_summary_key_results_contain_EXACT():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    s = thermodynamics_summary()
    exact_count = sum(1 for r in s["key_results"] if "EXACT" in r)
    assert exact_count >= 4


def test_summary_delta_star():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    from urt.shell_closure import DELTA_STAR
    s = thermodynamics_summary()
    assert abs(s["delta_star"] - DELTA_STAR) < 1e-12


def test_summary_N_and_D():
    from urt.thermodynamics_cathedral import thermodynamics_summary
    from urt.shell_closure import N, D
    s = thermodynamics_summary()
    assert s["N"] == N
    assert s["D"] == D


# ── print_thermodynamics_report() ────────────────────────────────────────────

def test_print_report_runs(capsys):
    from urt.thermodynamics_cathedral import print_thermodynamics_report
    print_thermodynamics_report()
    captured = capsys.readouterr()
    assert "THERMODYNAMICS" in captured.out or "Thermodynamics" in captured.out
    assert "EXACT" in captured.out


def test_print_report_contains_laws(capsys):
    from urt.thermodynamics_cathedral import print_thermodynamics_report
    print_thermodynamics_report()
    captured = capsys.readouterr()
    assert "law" in captured.out.lower() or "Laws" in captured.out


def test_print_report_contains_adiabatic(capsys):
    from urt.thermodynamics_cathedral import print_thermodynamics_report
    print_thermodynamics_report()
    captured = capsys.readouterr()
    assert "adiabatic" in captured.out.lower() or "γ" in captured.out or "5/3" in captured.out
