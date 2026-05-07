"""Tests for urt/thermochemistry_cathedral.py — Cathedral thermochemistry."""

import pytest
from math import pi

# ── Module-level constant tests ────────────────────────────────────────────────

def test_n_thermo_potentials():
    from urt.thermochemistry_cathedral import N_THERMO_POTENTIALS
    assert N_THERMO_POTENTIALS == 4

def test_potentials_eq_D1():
    from urt.thermochemistry_cathedral import POTENTIALS_EQ_D1
    assert POTENTIALS_EQ_D1 is True

def test_n_maxwell_relations():
    from urt.thermochemistry_cathedral import N_MAXWELL_RELATIONS
    assert N_MAXWELL_RELATIONS == 4

def test_maxwell_eq_D1():
    from urt.thermochemistry_cathedral import MAXWELL_EQ_D1
    assert MAXWELL_EQ_D1 is True

def test_phase_rule_addend():
    from urt.thermochemistry_cathedral import PHASE_RULE_ADDEND
    assert PHASE_RULE_ADDEND == 2

def test_phase_rule_eq_D1():
    from urt.thermochemistry_cathedral import PHASE_RULE_EQ_D1
    assert PHASE_RULE_EQ_D1 is True

def test_n_standard_vars():
    from urt.thermochemistry_cathedral import N_STANDARD_VARS
    assert N_STANDARD_VARS == 2

def test_critical_delta_mf():
    from urt.thermochemistry_cathedral import CRITICAL_DELTA_MF
    assert CRITICAL_DELTA_MF == 3

def test_critical_delta_eq_D():
    from urt.thermochemistry_cathedral import CRITICAL_DELTA_EQ_D
    assert CRITICAL_DELTA_EQ_D is True

def test_critical_beta_mf():
    from urt.thermochemistry_cathedral import CRITICAL_BETA_MF
    assert abs(CRITICAL_BETA_MF - 0.5) < 1e-10

def test_critical_beta_eq_half():
    from urt.thermochemistry_cathedral import CRITICAL_BETA_EQ_HALF
    assert CRITICAL_BETA_EQ_HALF is True

def test_n_hess_min_species():
    from urt.thermochemistry_cathedral import N_HESS_MIN_SPECIES
    assert N_HESS_MIN_SPECIES == 3

def test_hess_eq_D():
    from urt.thermochemistry_cathedral import HESS_EQ_D
    assert HESS_EQ_D is True

def test_reaction_coord_dim():
    from urt.thermochemistry_cathedral import REACTION_COORD_DIM
    assert REACTION_COORD_DIM == 1

def test_reaction_dim_eq_D2():
    from urt.thermochemistry_cathedral import REACTION_DIM_EQ_D2
    assert REACTION_DIM_EQ_D2 is True

def test_n_eyring_params():
    from urt.thermochemistry_cathedral import N_EYRING_PARAMS
    assert N_EYRING_PARAMS == 2

def test_eyring_eq_D1():
    from urt.thermochemistry_cathedral import EYRING_EQ_D1
    assert EYRING_EQ_D1 is True

def test_n_vant_hoff_vars():
    from urt.thermochemistry_cathedral import N_VANT_HOFF_VARS
    assert N_VANT_HOFF_VARS == 2

def test_vant_hoff_eq_D1():
    from urt.thermochemistry_cathedral import VANT_HOFF_EQ_D1
    assert VANT_HOFF_EQ_D1 is True

def test_n_born_square_corners():
    from urt.thermochemistry_cathedral import N_BORN_SQUARE_CORNERS
    assert N_BORN_SQUARE_CORNERS == 4

def test_born_eq_D1():
    from urt.thermochemistry_cathedral import BORN_EQ_D1
    assert BORN_EQ_D1 is True

def test_n_triple_point_phases():
    from urt.thermochemistry_cathedral import N_TRIPLE_POINT_PHASES
    assert N_TRIPLE_POINT_PHASES == 3

def test_triple_phases_eq_D():
    from urt.thermochemistry_cathedral import TRIPLE_PHASES_EQ_D
    assert TRIPLE_PHASES_EQ_D is True

def test_n_entropy_contributions():
    from urt.thermochemistry_cathedral import N_ENTROPY_CONTRIBUTIONS
    assert N_ENTROPY_CONTRIBUTIONS == 3

def test_entropy_contrib_eq_D():
    from urt.thermochemistry_cathedral import ENTROPY_CONTRIB_EQ_D
    assert ENTROPY_CONTRIB_EQ_D is True

def test_n_conjugate_pairs():
    from urt.thermochemistry_cathedral import N_CONJUGATE_PAIRS
    assert N_CONJUGATE_PAIRS == 3

def test_conjugate_eq_D():
    from urt.thermochemistry_cathedral import CONJUGATE_EQ_D
    assert CONJUGATE_EQ_D is True

def test_n_gibbs_duhem_terms():
    from urt.thermochemistry_cathedral import N_GIBBS_DUHEM_TERMS
    assert N_GIBBS_DUHEM_TERMS == 3

def test_gibbs_duhem_eq_D():
    from urt.thermochemistry_cathedral import GIBBS_DUHEM_EQ_D
    assert GIBBS_DUHEM_EQ_D is True

def test_n_icos_reaction_species():
    from urt.thermochemistry_cathedral import N_ICOS_REACTION_SPECIES
    assert N_ICOS_REACTION_SPECIES == 13

def test_n_icos_reaction_steps():
    from urt.thermochemistry_cathedral import N_ICOS_REACTION_STEPS
    assert N_ICOS_REACTION_STEPS == 30

def test_cathedral_thermo_rate():
    from urt.thermochemistry_cathedral import CATHEDRAL_THERMO_RATE, DELTA_STAR
    assert abs(CATHEDRAL_THERMO_RATE - DELTA_STAR) < 1e-12

def test_delta_star_value():
    from urt.thermochemistry_cathedral import DELTA_STAR
    assert abs(DELTA_STAR - 0.14751) < 1e-4

# ── Function return tests ──────────────────────────────────────────────────────

def test_thermodynamic_potentials_returns_dict():
    from urt.thermochemistry_cathedral import thermodynamic_potentials
    assert isinstance(thermodynamic_potentials(), dict)

def test_thermodynamic_potentials_keys():
    from urt.thermochemistry_cathedral import thermodynamic_potentials
    r = thermodynamic_potentials()
    for key in ["n_potentials", "potentials_eq_D1", "n_maxwell", "maxwell_eq_D1",
                "phase_rule_addend", "phase_rule_eq_D1", "n_born_corners", "born_eq_D1",
                "n_conjugate_pairs", "conjugate_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_thermodynamic_potentials_boolean_flags():
    from urt.thermochemistry_cathedral import thermodynamic_potentials
    r = thermodynamic_potentials()
    assert r["potentials_eq_D1"] is True
    assert r["maxwell_eq_D1"] is True
    assert r["phase_rule_eq_D1"] is True
    assert r["born_eq_D1"] is True
    assert r["conjugate_eq_D"] is True
    assert r["gibbs_duhem_eq_D"] is True

def test_thermodynamic_potentials_values():
    from urt.thermochemistry_cathedral import thermodynamic_potentials
    r = thermodynamic_potentials()
    assert r["n_potentials"] == 4
    assert r["n_maxwell"] == 4
    assert r["phase_rule_addend"] == 2
    assert r["n_born_corners"] == 4
    assert r["n_conjugate_pairs"] == 3
    assert r["n_gibbs_duhem"] == 3

def test_phase_equilibria_returns_dict():
    from urt.thermochemistry_cathedral import phase_equilibria
    assert isinstance(phase_equilibria(), dict)

def test_phase_equilibria_keys():
    from urt.thermochemistry_cathedral import phase_equilibria
    r = phase_equilibria()
    for key in ["n_triple_phases", "triple_eq_D", "critical_delta_mf",
                "critical_eq_D", "n_hess_species", "hess_eq_D"]:
        assert key in r, f"Missing key: {key}"

def test_phase_equilibria_boolean_flags():
    from urt.thermochemistry_cathedral import phase_equilibria
    r = phase_equilibria()
    assert r["triple_eq_D"] is True
    assert r["critical_eq_D"] is True
    assert r["critical_beta_half"] is True
    assert r["hess_eq_D"] is True
    assert r["entropy_eq_D"] is True

def test_phase_equilibria_values():
    from urt.thermochemistry_cathedral import phase_equilibria
    r = phase_equilibria()
    assert r["n_triple_phases"] == 3
    assert r["critical_delta_mf"] == 3
    assert abs(r["critical_beta_mf"] - 0.5) < 1e-10
    assert r["n_hess_species"] == 3
    assert r["n_entropy_contrib"] == 3

def test_reaction_kinetics_thermo_returns_dict():
    from urt.thermochemistry_cathedral import reaction_kinetics_thermo
    assert isinstance(reaction_kinetics_thermo(), dict)

def test_reaction_kinetics_thermo_keys():
    from urt.thermochemistry_cathedral import reaction_kinetics_thermo
    r = reaction_kinetics_thermo()
    for key in ["n_eyring_params", "eyring_eq_D1", "reaction_coord_dim",
                "reaction_dim_eq_D2", "n_vant_hoff_vars", "vant_hoff_eq_D1"]:
        assert key in r, f"Missing key: {key}"

def test_reaction_kinetics_thermo_boolean_flags():
    from urt.thermochemistry_cathedral import reaction_kinetics_thermo
    r = reaction_kinetics_thermo()
    assert r["eyring_eq_D1"] is True
    assert r["reaction_dim_eq_D2"] is True
    assert r["vant_hoff_eq_D1"] is True

def test_reaction_kinetics_thermo_values():
    from urt.thermochemistry_cathedral import reaction_kinetics_thermo
    r = reaction_kinetics_thermo()
    assert r["n_eyring_params"] == 2
    assert r["reaction_coord_dim"] == 1
    assert r["n_vant_hoff_vars"] == 2
    assert r["n_icos_species"] == 13
    assert r["n_icos_steps"] == 30

def test_thermochemistry_summary_returns_dict():
    from urt.thermochemistry_cathedral import thermochemistry_summary
    assert isinstance(thermochemistry_summary(), dict)

def test_thermochemistry_summary_keys():
    from urt.thermochemistry_cathedral import thermochemistry_summary
    r = thermochemistry_summary()
    for key in ["potentials", "phase", "kinetics", "KEY_EXACT_RESULTS", "D", "N"]:
        assert key in r, f"Missing key: {key}"

def test_thermochemistry_summary_D_N():
    from urt.thermochemistry_cathedral import thermochemistry_summary
    r = thermochemistry_summary()
    assert r["D"] == 3
    assert r["N"] == 13

def test_thermochemistry_summary_key_results():
    from urt.thermochemistry_cathedral import thermochemistry_summary
    r = thermochemistry_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5

def test_print_thermochemistry_report_runs(capsys):
    from urt.thermochemistry_cathedral import print_thermochemistry_report
    print_thermochemistry_report()
    out = capsys.readouterr().out
    assert len(out) > 100

# ── Cross-module consistency ───────────────────────────────────────────────────

def test_potentials_match_D1():
    from urt.thermochemistry_cathedral import N_THERMO_POTENTIALS
    from urt.shell_closure import D
    assert N_THERMO_POTENTIALS == D + 1

def test_maxwell_match_D1():
    from urt.thermochemistry_cathedral import N_MAXWELL_RELATIONS
    from urt.shell_closure import D
    assert N_MAXWELL_RELATIONS == D + 1

def test_triple_phases_match_D():
    from urt.thermochemistry_cathedral import N_TRIPLE_POINT_PHASES
    from urt.shell_closure import D
    assert N_TRIPLE_POINT_PHASES == D

def test_conjugate_pairs_match_D():
    from urt.thermochemistry_cathedral import N_CONJUGATE_PAIRS
    from urt.shell_closure import D
    assert N_CONJUGATE_PAIRS == D

def test_potentials_eq_maxwell():
    """N_THERMO_POTENTIALS = N_MAXWELL_RELATIONS = D+1."""
    from urt.thermochemistry_cathedral import N_THERMO_POTENTIALS, N_MAXWELL_RELATIONS
    assert N_THERMO_POTENTIALS == N_MAXWELL_RELATIONS
