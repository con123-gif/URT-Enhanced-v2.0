"""Tests for urt/epidemiology_cathedral.py — Disease dynamics and Cathedral integers."""

import pytest
from math import isfinite, log


def test_imports():
    from urt.epidemiology_cathedral import (
        N_SIR_COMPARTMENTS, N_SIR_EQ_D,
        N_SEIR_COMPARTMENTS, N_SEIR_EQ_D1,
        R0_TYPICAL, R0_EQ_Q,
        HERD_IMMUNITY_THRESHOLD_Q, HERD_EQ_4_5,
        N_EPIDEMIC_PARAMS, N_EPIPARAMS_EQ_D1,
        N_PANDEMIC_WAVES, N_WAVES_EQ_V2,
        CATHEDRAL_DECAY_RATE, CATHEDRAL_RECOVERY_DAYS,
        N_CONTACT_NETWORK_DEGREE, N_CONTACT_EQ_Q,
        N_GAMMA_SHAPE, N_GAMMA_EQ_D,
        R_EFF_AT_HERD, R_EFF_EQ_1,
        N_ICOS_CONTACT_NODES, N_ICOS_CONTACT_EDGES,
        ICOS_CONTACT_AVG_DEGREE, VACCINE_EFFICACY_MIN,
        H_SIR_MAX, SUPERSPREADER_FRACTION,
        sir_model, pandemic_dynamics,
        epidemiology_summary, print_epidemiology_report,
    )


# ── SIR compartments ──────────────────────────────────────────────────────────

def test_sir_compartments_eq_D():
    """SIR model has D=3 compartments."""
    from urt.epidemiology_cathedral import N_SIR_COMPARTMENTS, N_SIR_EQ_D
    from urt.shell_closure import D
    assert N_SIR_COMPARTMENTS == D
    assert N_SIR_COMPARTMENTS == 3
    assert N_SIR_EQ_D is True


def test_seir_compartments_eq_D1():
    """SEIR model has D+1=4 compartments."""
    from urt.epidemiology_cathedral import N_SEIR_COMPARTMENTS, N_SEIR_EQ_D1
    from urt.shell_closure import D
    assert N_SEIR_COMPARTMENTS == D + 1
    assert N_SEIR_COMPARTMENTS == 4
    assert N_SEIR_EQ_D1 is True


# ── Reproduction number ───────────────────────────────────────────────────────

def test_r0_typical_eq_q():
    """R₀ typical = q = 5."""
    from urt.epidemiology_cathedral import R0_TYPICAL, R0_EQ_Q
    from urt.shell_closure import q
    assert R0_TYPICAL == q
    assert R0_TYPICAL == 5
    assert R0_EQ_Q is True


def test_herd_immunity_threshold_q():
    """Herd immunity threshold = 1 − 1/q = 0.8."""
    from urt.epidemiology_cathedral import HERD_IMMUNITY_THRESHOLD_Q, HERD_EQ_4_5
    from urt.shell_closure import q
    assert abs(HERD_IMMUNITY_THRESHOLD_Q - (1.0 - 1.0 / q)) < 1e-10
    assert abs(HERD_IMMUNITY_THRESHOLD_Q - 0.8) < 1e-10
    assert HERD_EQ_4_5 is True


def test_r_eff_at_herd():
    """R_eff at herd immunity = R₀ × (1/q) = 1.0."""
    from urt.epidemiology_cathedral import R_EFF_AT_HERD, R_EFF_EQ_1
    assert abs(R_EFF_AT_HERD - 1.0) < 1e-10
    assert R_EFF_EQ_1 is True


# ── Epidemic parameters ───────────────────────────────────────────────────────

def test_epidemic_params_eq_D1():
    """Epidemic parameters = D−1 = 2."""
    from urt.epidemiology_cathedral import N_EPIDEMIC_PARAMS, N_EPIPARAMS_EQ_D1
    from urt.shell_closure import D
    assert N_EPIDEMIC_PARAMS == D - 1
    assert N_EPIDEMIC_PARAMS == 2
    assert N_EPIPARAMS_EQ_D1 is True


# ── Pandemic waves ────────────────────────────────────────────────────────────

def test_pandemic_waves_eq_V2():
    """Pandemic waves ≈ V//2 = 6."""
    from urt.epidemiology_cathedral import N_PANDEMIC_WAVES, N_WAVES_EQ_V2
    from urt.shell_closure import V
    assert N_PANDEMIC_WAVES == V // 2
    assert N_PANDEMIC_WAVES == 6
    assert N_WAVES_EQ_V2 is True


# ── Cathedral decay rate ──────────────────────────────────────────────────────

def test_cathedral_decay_rate():
    """Cathedral decay rate = δ★."""
    from urt.epidemiology_cathedral import CATHEDRAL_DECAY_RATE, CATHEDRAL_RECOVERY_DAYS
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_DECAY_RATE - DELTA_STAR) < 1e-12
    assert abs(CATHEDRAL_RECOVERY_DAYS - 1.0 / DELTA_STAR) < 1e-10
    assert 6.0 < CATHEDRAL_RECOVERY_DAYS < 8.0  # ≈ 6.78 days


# ── Contact network ───────────────────────────────────────────────────────────

def test_contact_network_degree_eq_q():
    """Contact network degree = q = 5."""
    from urt.epidemiology_cathedral import N_CONTACT_NETWORK_DEGREE, N_CONTACT_EQ_Q
    from urt.shell_closure import q
    assert N_CONTACT_NETWORK_DEGREE == q
    assert N_CONTACT_NETWORK_DEGREE == 5
    assert N_CONTACT_EQ_Q is True


def test_gamma_shape_eq_D():
    """Incubation period Gamma shape = D = 3."""
    from urt.epidemiology_cathedral import N_GAMMA_SHAPE, N_GAMMA_EQ_D
    from urt.shell_closure import D
    assert N_GAMMA_SHAPE == D
    assert N_GAMMA_SHAPE == 3
    assert N_GAMMA_EQ_D is True


# ── Icosahedral contact web ───────────────────────────────────────────────────

def test_icos_contact_nodes_eq_N():
    """Icosahedral contact network nodes = N = 13."""
    from urt.epidemiology_cathedral import N_ICOS_CONTACT_NODES
    from urt.shell_closure import N
    assert N_ICOS_CONTACT_NODES == N
    assert N_ICOS_CONTACT_NODES == 13


def test_icos_contact_edges_eq_E():
    """Icosahedral contact network edges = E = 30."""
    from urt.epidemiology_cathedral import N_ICOS_CONTACT_EDGES
    from urt.shell_closure import E
    assert N_ICOS_CONTACT_EDGES == E
    assert N_ICOS_CONTACT_EDGES == 30


def test_icos_contact_avg_degree():
    """Icosahedral average degree = 2E/N ≈ 4.615."""
    from urt.epidemiology_cathedral import ICOS_CONTACT_AVG_DEGREE
    from urt.shell_closure import E, N
    assert abs(ICOS_CONTACT_AVG_DEGREE - 2.0 * E / N) < 1e-10
    assert 4.0 < ICOS_CONTACT_AVG_DEGREE < 5.0


# ── Vaccine efficacy & entropy ────────────────────────────────────────────────

def test_vaccine_efficacy_min():
    """Vaccine efficacy min = 1 − 1/q = 0.8."""
    from urt.epidemiology_cathedral import VACCINE_EFFICACY_MIN
    from urt.shell_closure import q
    assert abs(VACCINE_EFFICACY_MIN - (1.0 - 1.0 / q)) < 1e-10
    assert abs(VACCINE_EFFICACY_MIN - 0.8) < 1e-10


def test_h_sir_max():
    """Max Shannon entropy of SIR = log₂(D) ≈ 1.585 bits."""
    from urt.epidemiology_cathedral import H_SIR_MAX
    from urt.shell_closure import D
    assert abs(H_SIR_MAX - log(D) / log(2)) < 1e-10
    assert 1.5 < H_SIR_MAX < 1.7


def test_superspreader_fraction():
    """Superspreader fraction = δ★."""
    from urt.epidemiology_cathedral import SUPERSPREADER_FRACTION
    from urt.shell_closure import DELTA_STAR
    assert abs(SUPERSPREADER_FRACTION - DELTA_STAR) < 1e-12


# ── Functions: sir_model ──────────────────────────────────────────────────────

def test_sir_model_returns_dict():
    from urt.epidemiology_cathedral import sir_model
    r = sir_model()
    assert isinstance(r, dict)


def test_sir_model_keys():
    from urt.epidemiology_cathedral import sir_model
    r = sir_model()
    required = {
        "n_sir", "sir_eq_D", "n_seir", "seir_eq_D1",
        "n_epidemic_params", "epiparams_eq_D1",
        "r0_typical", "r0_eq_q",
        "herd_immunity_threshold", "herd_eq_4_5",
        "r_eff_at_herd", "r_eff_eq_1",
        "cathedral_decay_rate", "cathedral_recovery_days",
    }
    for k in required:
        assert k in r, f"Missing key: {k}"


def test_sir_model_values():
    from urt.epidemiology_cathedral import sir_model
    r = sir_model()
    assert r["n_sir"] == 3
    assert r["sir_eq_D"] is True
    assert r["n_seir"] == 4
    assert r["seir_eq_D1"] is True
    assert r["r0_typical"] == 5
    assert r["r0_eq_q"] is True
    assert abs(r["herd_immunity_threshold"] - 0.8) < 1e-10
    assert r["herd_eq_4_5"] is True
    assert abs(r["r_eff_at_herd"] - 1.0) < 1e-10
    assert r["r_eff_eq_1"] is True
    assert r["n_epidemic_params"] == 2
    assert r["epiparams_eq_D1"] is True


# ── Functions: pandemic_dynamics ──────────────────────────────────────────────

def test_pandemic_dynamics_returns_dict():
    from urt.epidemiology_cathedral import pandemic_dynamics
    r = pandemic_dynamics()
    assert isinstance(r, dict)


def test_pandemic_dynamics_keys():
    from urt.epidemiology_cathedral import pandemic_dynamics
    r = pandemic_dynamics()
    required = {
        "n_pandemic_waves", "waves_eq_V2",
        "n_contact_degree", "contact_eq_q",
        "n_gamma_shape", "gamma_eq_D",
        "icos_contact_nodes", "icos_contact_edges", "icos_avg_degree",
        "superspreader_fraction", "h_sir_max",
        "vaccine_efficacy_min",
    }
    for k in required:
        assert k in r, f"Missing key: {k}"


def test_pandemic_dynamics_values():
    from urt.epidemiology_cathedral import pandemic_dynamics
    r = pandemic_dynamics()
    assert r["n_pandemic_waves"] == 6
    assert r["waves_eq_V2"] is True
    assert r["n_contact_degree"] == 5
    assert r["contact_eq_q"] is True
    assert r["n_gamma_shape"] == 3
    assert r["gamma_eq_D"] is True
    assert r["icos_contact_nodes"] == 13
    assert r["icos_contact_edges"] == 30


# ── Functions: epidemiology_summary ──────────────────────────────────────────

def test_epidemiology_summary_returns_dict():
    from urt.epidemiology_cathedral import epidemiology_summary
    r = epidemiology_summary()
    assert isinstance(r, dict)


def test_epidemiology_summary_keys():
    from urt.epidemiology_cathedral import epidemiology_summary
    r = epidemiology_summary()
    assert "sir_model" in r
    assert "pandemic_dynamics" in r
    assert "KEY_EXACT_RESULTS" in r
    assert "delta_star" in r
    assert "N" in r
    assert "D" in r


def test_epidemiology_summary_key_exact_results():
    from urt.epidemiology_cathedral import epidemiology_summary
    r = epidemiology_summary()
    assert isinstance(r["KEY_EXACT_RESULTS"], list)
    assert len(r["KEY_EXACT_RESULTS"]) >= 5
    # At least some entries contain EXACT or APPROXIMATE
    text = " ".join(r["KEY_EXACT_RESULTS"])
    assert "EXACT" in text or "APPROXIMATE" in text


def test_epidemiology_summary_D_N():
    from urt.epidemiology_cathedral import epidemiology_summary
    from urt.shell_closure import D, N, DELTA_STAR
    r = epidemiology_summary()
    assert r["D"] == D
    assert r["N"] == N
    assert abs(r["delta_star"] - DELTA_STAR) < 1e-12


# ── print function ────────────────────────────────────────────────────────────

def test_print_epidemiology_report(capsys):
    from urt.epidemiology_cathedral import print_epidemiology_report
    print_epidemiology_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "EXACT" in out
    assert "APPROXIMATE" in out
    # check Cathedral integers appear
    assert "3" in out
    assert "δ★" in out or "0.147" in out


# ── Cross-module consistency ──────────────────────────────────────────────────

def test_sir_compartments_matches_shell_D():
    """N_SIR_COMPARTMENTS matches D from shell_closure."""
    from urt.epidemiology_cathedral import N_SIR_COMPARTMENTS
    from urt.shell_closure import D
    assert N_SIR_COMPARTMENTS == D


def test_pandemic_waves_matches_V():
    """N_PANDEMIC_WAVES = V//2 from shell_closure."""
    from urt.epidemiology_cathedral import N_PANDEMIC_WAVES
    from urt.shell_closure import V
    assert N_PANDEMIC_WAVES == V // 2


def test_r0_matches_q():
    """R0_TYPICAL matches q from shell_closure."""
    from urt.epidemiology_cathedral import R0_TYPICAL
    from urt.shell_closure import q
    assert R0_TYPICAL == q


def test_contact_degree_matches_q():
    """N_CONTACT_NETWORK_DEGREE matches q from shell_closure."""
    from urt.epidemiology_cathedral import N_CONTACT_NETWORK_DEGREE
    from urt.shell_closure import q
    assert N_CONTACT_NETWORK_DEGREE == q


def test_decay_rate_matches_delta_star():
    """CATHEDRAL_DECAY_RATE matches DELTA_STAR from shell_closure."""
    from urt.epidemiology_cathedral import CATHEDRAL_DECAY_RATE
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_DECAY_RATE - DELTA_STAR) < 1e-12
