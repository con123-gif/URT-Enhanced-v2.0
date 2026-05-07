"""Tests for urt/robotics_cathedral.py — Control theory, robot kinematics, Cathedral integers."""

import pytest
from math import isfinite


def test_imports():
    from urt.robotics_cathedral import (
        N_RIGID_BODY_DOF, N_RIGID_BODY_DOF_EQ_V2, N_DH_PARAMS, N_DH_PARAMS_EQ_D1,
        N_EULER_ANGLES, N_QUATERNION_COMPONENTS, N_ROBOT_ARM_DOF,
        N_SWARM_ICOS, N_SWARM_SHELL, N_PID_TERMS, N_PID_EQ_D,
        N_STEWART_LEGS, N_STEWART_EQ_V2, NYQUIST_FACTOR, ROLLOFF_DB_DEC_3RD,
        ROLLOFF_EQ_G, CATHEDRAL_DAMPING_RATIO, FORMATION_CONNECTIVITY,
        rigid_body_dof, swarm_formation, control_structures,
        robotics_summary, print_robotics_report,
    )


# ── Rigid body DOF ─────────────────────────────────────────────────────────────

def test_rigid_body_dof_eq_2D():
    """Rigid body DOF = 2D = 6 = V//2."""
    from urt.robotics_cathedral import N_RIGID_BODY_DOF, N_RIGID_BODY_DOF_EQ_V2
    from urt.shell_closure import D, V
    assert N_RIGID_BODY_DOF == 2 * D
    assert N_RIGID_BODY_DOF == V // 2
    assert N_RIGID_BODY_DOF == 6
    assert N_RIGID_BODY_DOF_EQ_V2 is True


def test_dh_params_eq_D1():
    """DH parameters per joint = D+1 = 4."""
    from urt.robotics_cathedral import N_DH_PARAMS, N_DH_PARAMS_EQ_D1
    from urt.shell_closure import D
    assert N_DH_PARAMS == D + 1
    assert N_DH_PARAMS == 4
    assert N_DH_PARAMS_EQ_D1 is True


def test_euler_angles_eq_D():
    """Euler angles = D = 3."""
    from urt.robotics_cathedral import N_EULER_ANGLES
    from urt.shell_closure import D
    assert N_EULER_ANGLES == D
    assert N_EULER_ANGLES == 3


def test_quaternion_components_eq_D1():
    """Quaternion components = D+1 = 4."""
    from urt.robotics_cathedral import N_QUATERNION_COMPONENTS
    from urt.shell_closure import D
    assert N_QUATERNION_COMPONENTS == D + 1
    assert N_QUATERNION_COMPONENTS == 4


# ── Icosahedral swarm ──────────────────────────────────────────────────────────

def test_swarm_size_eq_N():
    """Icosahedral swarm = N = 13 drones."""
    from urt.robotics_cathedral import N_SWARM_ICOS
    from urt.shell_closure import N
    assert N_SWARM_ICOS == N
    assert N_SWARM_ICOS == 13


def test_swarm_shell_eq_V():
    """Swarm shell = V = 12 outer drones."""
    from urt.robotics_cathedral import N_SWARM_SHELL
    from urt.shell_closure import V
    assert N_SWARM_SHELL == V
    assert N_SWARM_SHELL == 12


def test_formation_connectivity_eq_q():
    """Formation connectivity = q = 5."""
    from urt.robotics_cathedral import FORMATION_CONNECTIVITY
    from urt.shell_closure import q
    assert FORMATION_CONNECTIVITY == q
    assert FORMATION_CONNECTIVITY == 5


# ── Control theory ─────────────────────────────────────────────────────────────

def test_pid_terms_eq_D():
    """PID controller has D = 3 terms."""
    from urt.robotics_cathedral import N_PID_TERMS, N_PID_EQ_D
    from urt.shell_closure import D
    assert N_PID_TERMS == D
    assert N_PID_TERMS == 3
    assert N_PID_EQ_D is True


def test_stewart_legs_eq_V2():
    """Stewart platform has V//2 = 6 legs."""
    from urt.robotics_cathedral import N_STEWART_LEGS, N_STEWART_EQ_V2
    from urt.shell_closure import V
    assert N_STEWART_LEGS == V // 2
    assert N_STEWART_LEGS == 6
    assert N_STEWART_EQ_V2 is True


def test_nyquist_factor_eq_D1():
    """Nyquist factor = D-1 = 2."""
    from urt.robotics_cathedral import NYQUIST_FACTOR
    from urt.shell_closure import D
    assert NYQUIST_FACTOR == D - 1
    assert NYQUIST_FACTOR == 2


def test_rolloff_eq_G():
    """3rd-order rolloff = D×20 = 60 = G."""
    from urt.robotics_cathedral import ROLLOFF_DB_DEC_3RD, ROLLOFF_EQ_G
    from urt.shell_closure import D, G
    assert ROLLOFF_DB_DEC_3RD == D * 20
    assert ROLLOFF_DB_DEC_3RD == G
    assert ROLLOFF_DB_DEC_3RD == 60
    assert ROLLOFF_EQ_G is True


def test_cathedral_damping_ratio():
    """Cathedral damping = δ★ ≈ 0.148."""
    from urt.robotics_cathedral import CATHEDRAL_DAMPING_RATIO
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_DAMPING_RATIO - DELTA_STAR) < 1e-10
    assert 0.14 < CATHEDRAL_DAMPING_RATIO < 0.16


# ── Function tests ──────────────────────────────────────────────────────────────

def test_rigid_body_dof_function():
    from urt.robotics_cathedral import rigid_body_dof
    r = rigid_body_dof()
    assert r["n_dof"] == 6
    assert r["n_dof_eq_V2"] is True
    assert r["n_dh_params"] == 4
    assert r["n_dh_eq_D1"] is True
    assert r["n_euler_angles"] == 3
    assert r["n_euler_eq_D"] is True


def test_swarm_formation_function():
    from urt.robotics_cathedral import swarm_formation
    r = swarm_formation()
    assert r["n_drones"] == 13
    assert r["n_drones_eq_N"] is True
    assert r["n_shell"] == 12
    assert r["n_shell_eq_V"] is True
    assert r["connectivity"] == 5
    assert r["connectivity_eq_q"] is True


def test_control_structures_function():
    from urt.robotics_cathedral import control_structures
    r = control_structures()
    assert r["n_pid_terms"] == 3
    assert r["pid_eq_D"] is True
    assert r["n_stewart_legs"] == 6
    assert r["stewart_eq_V2"] is True
    assert r["rolloff_db_dec"] == 60
    assert r["rolloff_eq_G"] is True


def test_robotics_summary():
    from urt.robotics_cathedral import robotics_summary
    r = robotics_summary()
    assert "rigid_body" in r
    assert "swarm" in r
    assert "control" in r
    assert len(r["KEY_EXACT_RESULTS"]) >= 5


def test_print_robotics_report(capsys):
    from urt.robotics_cathedral import print_robotics_report
    print_robotics_report()
    out = capsys.readouterr().out
    assert len(out) > 100
    assert "13" in out
    assert "EXACT" in out
