"""Tests for urt/chemical_kinetics_cathedral.py — Cathedral chemical kinetics."""

import pytest
from math import pi

# ── Module-level constant tests ────────────────────────────────────────────────

def test_order_unimolecular_value():
    from urt.chemical_kinetics_cathedral import ORDER_UNIMOLECULAR
    assert ORDER_UNIMOLECULAR == 1

def test_order_unimolecular_eq_D2():
    from urt.chemical_kinetics_cathedral import ORDER_UNI_EQ_D2
    assert ORDER_UNI_EQ_D2 is True

def test_order_bimolecular_value():
    from urt.chemical_kinetics_cathedral import ORDER_BIMOLECULAR
    assert ORDER_BIMOLECULAR == 2

def test_order_bimolecular_eq_D1():
    from urt.chemical_kinetics_cathedral import ORDER_BI_EQ_D1
    assert ORDER_BI_EQ_D1 is True

def test_order_termolecular_value():
    from urt.chemical_kinetics_cathedral import ORDER_TERMOLECULAR
    assert ORDER_TERMOLECULAR == 3

def test_order_termolecular_eq_D():
    from urt.chemical_kinetics_cathedral import ORDER_TER_EQ_D
    assert ORDER_TER_EQ_D is True

def test_n_molecularity_types():
    from urt.chemical_kinetics_cathedral import N_MOLECULARITY_TYPES
    assert N_MOLECULARITY_TYPES == 3

def test_n_arrhenius_params():
    from urt.chemical_kinetics_cathedral import N_ARRHENIUS_PARAMS
    assert N_ARRHENIUS_PARAMS == 2

def test_n_arrhenius_eq_D1():
    from urt.chemical_kinetics_cathedral import N_ARR_EQ_D1
    assert N_ARR_EQ_D1 is True

def test_n_mm_rate_constants():
    from urt.chemical_kinetics_cathedral import N_MM_RATE_CONSTANTS
    assert N_MM_RATE_CONSTANTS == 3

def test_n_mm_eq_D():
    from urt.chemical_kinetics_cathedral import N_MM_EQ_D
    assert N_MM_EQ_D is True

def test_n_mm_observable_params():
    from urt.chemical_kinetics_cathedral import N_MM_OBSERVABLE_PARAMS
    assert N_MM_OBSERVABLE_PARAMS == 2

def test_n_catalytic_steps():
    from urt.chemical_kinetics_cathedral import N_CATALYTIC_STEPS
    assert N_CATALYTIC_STEPS == 3

def test_n_catalytic_eq_D():
    from urt.chemical_kinetics_cathedral import N_CAT_EQ_D
    assert N_CAT_EQ_D is True

def test_max_hill_coeff():
    from urt.chemical_kinetics_cathedral import MAX_HILL_COEFF
    assert MAX_HILL_COEFF == 4

def test_hill_eq_D1():
    from urt.chemical_kinetics_cathedral import HILL_EQ_D1
    assert HILL_EQ_D1 is True

def test_hemoglobin_sites():
    from urt.chemical_kinetics_cathedral import N_HEMOGLOBIN_SITES
    assert N_HEMOGLOBIN_SITES == 4

def test_n_lindemann_steps():
    from urt.chemical_kinetics_cathedral import N_LINDEMANN_STEPS
    assert N_LINDEMANN_STEPS == 2

def test_lindemann_eq_D1():
    from urt.chemical_kinetics_cathedral import LINDEMANN_EQ_D1
    assert LINDEMANN_EQ_D1 is True

def test_n_trans_dof():
    from urt.chemical_kinetics_cathedral import N_TRANS_DOF
    assert N_TRANS_DOF == 3

def test_n_rot_dof():
    from urt.chemical_kinetics_cathedral import N_ROT_DOF
    assert N_ROT_DOF == 3

def test_n_ts_modes_removed():
    from urt.chemical_kinetics_cathedral import N_TS_MODES_REMOVED
    assert N_TS_MODES_REMOVED == 6

def test_collision_cross_section_power():
    from urt.chemical_kinetics_cathedral import COLLISION_CROSS_SECTION_POWER
    assert COLLISION_CROSS_SECTION_POWER == 2

def test_diffusion_solid_angle():
    from urt.chemical_kinetics_cathedral import DIFFUSION_SOLID_ANGLE_FACTOR
    assert abs(DIFFUSION_SOLID_ANGLE_FACTOR - 4 * pi) < 1e-12

def test_cathedral_steric_factor():
    from urt.chemical_kinetics_cathedral import CATHEDRAL_STERIC_FACTOR, DELTA_STAR
    assert abs(CATHEDRAL_STERIC_FACTOR - DELTA_STAR) < 1e-12

# ── DELTA_STAR import sanity ───────────────────────────────────────────────────

def test_delta_star_value():
    from urt.chemical_kinetics_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

# ── Function return types and keys ─────────────────────────────────────────────

def test_molecularity_returns_dict():
    from urt.chemical_kinetics_cathedral import molecularity
    r = molecularity()
    assert isinstance(r, dict)

def test_molecularity_keys():
    from urt.chemical_kinetics_cathedral import molecularity
    r = molecularity()
    for key in ["order_unimolecular", "uni_eq_D2", "order_bimolecular",
                "bi_eq_D1", "order_termolecular", "ter_eq_D", "n_types", "types_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_molecularity_boolean_flags():
    from urt.chemical_kinetics_cathedral import molecularity
    r = molecularity()
    assert r["uni_eq_D2"] is True
    assert r["bi_eq_D1"] is True
    assert r["ter_eq_D"] is True
    assert r["types_eq_D"] is True

def test_molecularity_order_values():
    from urt.chemical_kinetics_cathedral import molecularity
    r = molecularity()
    assert r["order_unimolecular"] == 1
    assert r["order_bimolecular"] == 2
    assert r["order_termolecular"] == 3
    assert r["n_types"] == 3

def test_enzyme_kinetics_returns_dict():
    from urt.chemical_kinetics_cathedral import enzyme_kinetics
    r = enzyme_kinetics()
    assert isinstance(r, dict)

def test_enzyme_kinetics_keys():
    from urt.chemical_kinetics_cathedral import enzyme_kinetics
    r = enzyme_kinetics()
    for key in ["n_mm_constants", "mm_eq_D", "n_arrhenius", "arr_eq_D1",
                "n_catalytic_steps", "cat_eq_D", "hill_max", "hill_eq_D1"]:
        assert key in r, f"Missing key: {key}"

def test_enzyme_kinetics_boolean_flags():
    from urt.chemical_kinetics_cathedral import enzyme_kinetics
    r = enzyme_kinetics()
    assert r["mm_eq_D"] is True
    assert r["arr_eq_D1"] is True
    assert r["cat_eq_D"] is True
    assert r["hill_eq_D1"] is True

def test_enzyme_kinetics_values():
    from urt.chemical_kinetics_cathedral import enzyme_kinetics
    r = enzyme_kinetics()
    assert r["n_mm_constants"] == 3
    assert r["n_arrhenius"] == 2
    assert r["n_catalytic_steps"] == 3
    assert r["hill_max"] == 4
    assert r["hemoglobin_sites"] == 4

def test_transition_state_returns_dict():
    from urt.chemical_kinetics_cathedral import transition_state
    r = transition_state()
    assert isinstance(r, dict)

def test_transition_state_keys():
    from urt.chemical_kinetics_cathedral import transition_state
    r = transition_state()
    for key in ["n_trans_dof", "n_rot_dof", "n_modes_removed",
                "lindemann_steps", "lindemann_eq_D1"]:
        assert key in r, f"Missing key: {key}"

def test_transition_state_boolean_flags():
    from urt.chemical_kinetics_cathedral import transition_state
    r = transition_state()
    assert r["trans_eq_D"] is True
    assert r["rot_eq_D"] is True
    assert r["modes_eq_2D"] is True
    assert r["lindemann_eq_D1"] is True
    assert r["collision_eq_D1"] is True

def test_transition_state_values():
    from urt.chemical_kinetics_cathedral import transition_state
    r = transition_state()
    assert r["n_trans_dof"] == 3
    assert r["n_rot_dof"] == 3
    assert r["n_modes_removed"] == 6
    assert r["lindemann_steps"] == 2
    assert r["collision_power"] == 2

def test_chemical_kinetics_summary_returns_dict():
    from urt.chemical_kinetics_cathedral import chemical_kinetics_summary
    r = chemical_kinetics_summary()
    assert isinstance(r, dict)

def test_chemical_kinetics_summary_keys():
    from urt.chemical_kinetics_cathedral import chemical_kinetics_summary
    r = chemical_kinetics_summary()
    for key in ["molecularity", "enzyme", "transition_state", "KEY_EXACT_RESULTS",
                "delta_star", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_chemical_kinetics_summary_key_results():
    from urt.chemical_kinetics_cathedral import chemical_kinetics_summary
    r = chemical_kinetics_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_chemical_kinetics_summary_D_N():
    from urt.chemical_kinetics_cathedral import chemical_kinetics_summary
    r = chemical_kinetics_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_print_chemical_kinetics_report_runs(capsys):
    from urt.chemical_kinetics_cathedral import print_chemical_kinetics_report
    print_chemical_kinetics_report()
    captured = capsys.readouterr()
    assert "CHEMICAL KINETICS" in captured.out.upper() or "chemical" in captured.out.lower()

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_n_molecularity_matches_D():
    """N_MOLECULARITY_TYPES = D = 3."""
    from urt.chemical_kinetics_cathedral import N_MOLECULARITY_TYPES
    from urt.shell_closure import D
    assert N_MOLECULARITY_TYPES == D

def test_n_mm_constants_matches_D():
    """N_MM_RATE_CONSTANTS = D = 3."""
    from urt.chemical_kinetics_cathedral import N_MM_RATE_CONSTANTS
    from urt.shell_closure import D
    assert N_MM_RATE_CONSTANTS == D

def test_hemoglobin_sites_matches_D1():
    """N_HEMOGLOBIN_SITES = D+1 = 4."""
    from urt.chemical_kinetics_cathedral import N_HEMOGLOBIN_SITES
    from urt.shell_closure import D
    assert N_HEMOGLOBIN_SITES == D + 1

def test_diffusion_solid_angle_matches_sphere_area():
    """4π = surface area of unit sphere in D=3 — same factor as solid angle."""
    from urt.chemical_kinetics_cathedral import DIFFUSION_SOLID_ANGLE_FACTOR
    assert abs(DIFFUSION_SOLID_ANGLE_FACTOR - 4 * pi) < 1e-12
