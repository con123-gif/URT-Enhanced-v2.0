"""Tests for urt/topological_spaces.py — Euler characteristic, Hopf, defects."""

import pytest


def test_imports():
    from urt.topological_spaces import (
        EULER_CHI_ICOSAHEDRON, HAIRY_BALL_CHI_NONZERO,
        HOPF_FIBER_DIM, HOPF_BASE_DIM, HOPF_TOTAL_DIM,
        N_DEFECT_TYPES,
        BETTI_ICOS, EULER_FROM_BETTI, EULER_BETTI_CHECK,
        euler_icosahedron, hopf_fibration, sphere_topology,
        defect_classification, topological_summary, print_topology_report,
    )


def test_euler_icosahedron_eq_D_minus_1():
    from urt.topological_spaces import EULER_CHI_ICOSAHEDRON
    from urt.shell_closure import V, E, F, D
    assert EULER_CHI_ICOSAHEDRON == V - E + F
    assert EULER_CHI_ICOSAHEDRON == 2
    assert EULER_CHI_ICOSAHEDRON == D - 1


def test_euler_nonzero():
    from urt.topological_spaces import HAIRY_BALL_CHI_NONZERO
    assert HAIRY_BALL_CHI_NONZERO is True


def test_euler_from_betti():
    from urt.topological_spaces import EULER_FROM_BETTI, EULER_CHI_ICOSAHEDRON, EULER_BETTI_CHECK
    assert EULER_FROM_BETTI == EULER_CHI_ICOSAHEDRON
    assert EULER_BETTI_CHECK is True


def test_euler_icosahedron_function():
    from urt.topological_spaces import euler_icosahedron
    r = euler_icosahedron()
    assert r["chi"] == 2
    assert r["chi_eq_D_minus_1"] is True


def test_hopf_fiber_dim():
    from urt.topological_spaces import HOPF_FIBER_DIM
    from urt.shell_closure import D
    assert HOPF_FIBER_DIM == D - 2
    assert HOPF_FIBER_DIM == 1


def test_hopf_base_dim():
    from urt.topological_spaces import HOPF_BASE_DIM
    from urt.shell_closure import D
    assert HOPF_BASE_DIM == D - 1
    assert HOPF_BASE_DIM == 2


def test_hopf_total_dim():
    from urt.topological_spaces import HOPF_TOTAL_DIM
    from urt.shell_closure import D
    assert HOPF_TOTAL_DIM == D
    assert HOPF_TOTAL_DIM == 3


def test_hopf_fibration_function():
    from urt.topological_spaces import hopf_fibration
    r = hopf_fibration()
    assert r["fiber_dim"] == 1
    assert r["base_dim"] == 2
    assert r["total_dim"] == 3


def test_n_defect_types():
    from urt.topological_spaces import N_DEFECT_TYPES
    from urt.shell_closure import D
    assert N_DEFECT_TYPES == D - 1
    assert N_DEFECT_TYPES == 2


def test_defect_classification_function():
    from urt.topological_spaces import defect_classification
    r = defect_classification()
    assert len(r) > 0


def test_sphere_topology_function():
    from urt.topological_spaces import sphere_topology
    r = sphere_topology()
    assert len(r) > 0


def test_topological_summary():
    from urt.topological_spaces import topological_summary
    r = topological_summary()
    assert len(r) > 0


def test_print_topology_report(capsys):
    from urt.topological_spaces import print_topology_report
    print_topology_report()
    out = capsys.readouterr().out
    assert len(out) > 100
