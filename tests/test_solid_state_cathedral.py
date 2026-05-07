"""Tests for urt/solid_state_cathedral.py — Band structure, phonons, topology."""

import pytest


def test_imports():
    from urt.solid_state_cathedral import (
        BZ_DIM, N_RECIPROCAL_VECS, SPIN_DEGENERACY, N_BLOCH_QN,
        N_ACOUSTIC_BRANCHES, N_BRANCHES_2ATOM,
        Z_SC_SOLID, Z_BCC_SOLID, Z_FCC_SOLID, Z_DIAMOND, Z_GRAPHENE,
        N_TOPOLOGICAL_INVARIANTS_3D, TOPO_SURFACE_DIM, QUANTUM_HALL_DIM,
        N_ISING_SPIN_STATES, N_HEISENBERG_COMPONENTS, N_XY_COMPONENTS,
        DEBYE_POWER_LAW, N_DEBYE_POLARIZATIONS,
        band_structure, phonon_structure, lattice_coordination,
        magnetic_models, solid_state_summary, print_solid_state_report,
    )


# ── Brillouin zone ────────────────────────────────────────────────────────────

def test_bz_dim_eq_D():
    """BZ dimension = D = 3."""
    from urt.solid_state_cathedral import BZ_DIM
    from urt.shell_closure import D
    assert BZ_DIM == D
    assert BZ_DIM == 3


# ── Electron quantum numbers ──────────────────────────────────────────────────

def test_spin_degeneracy_eq_D1():
    """Spin degeneracy = D-1 = 2."""
    from urt.solid_state_cathedral import SPIN_DEGENERACY
    from urt.shell_closure import D
    assert SPIN_DEGENERACY == D - 1
    assert SPIN_DEGENERACY == 2


def test_bloch_qn_eq_D1():
    """Bloch state has D+1 = 4 quantum numbers."""
    from urt.solid_state_cathedral import N_BLOCH_QN
    from urt.shell_closure import D
    assert N_BLOCH_QN == D + 1
    assert N_BLOCH_QN == 4


# ── Phonons ───────────────────────────────────────────────────────────────────

def test_acoustic_branches_eq_D():
    """Acoustic phonon branches = D = 3."""
    from urt.solid_state_cathedral import N_ACOUSTIC_BRANCHES
    from urt.shell_closure import D
    assert N_ACOUSTIC_BRANCHES == D
    assert N_ACOUSTIC_BRANCHES == 3


def test_branches_2atom_eq_V2():
    """2-atom cell phonon branches = 2D = 6 = V/2."""
    from urt.solid_state_cathedral import N_BRANCHES_2ATOM
    from urt.shell_closure import D, V
    assert N_BRANCHES_2ATOM == 2 * D
    assert N_BRANCHES_2ATOM == V // 2
    assert N_BRANCHES_2ATOM == 6


# ── Coordination numbers ──────────────────────────────────────────────────────

def test_sc_coordination_eq_V2():
    """SC coordination z = 2D = V/2 = 6."""
    from urt.solid_state_cathedral import Z_SC_SOLID
    from urt.shell_closure import D, V
    assert Z_SC_SOLID == 2 * D
    assert Z_SC_SOLID == V // 2
    assert Z_SC_SOLID == 6


def test_bcc_coordination_eq_2D():
    """BCC coordination z = 2^D = 8."""
    from urt.solid_state_cathedral import Z_BCC_SOLID
    from urt.shell_closure import D
    assert Z_BCC_SOLID == 2**D
    assert Z_BCC_SOLID == 8


def test_fcc_coordination_eq_V():
    """FCC coordination z = V = 12."""
    from urt.solid_state_cathedral import Z_FCC_SOLID
    from urt.shell_closure import V
    assert Z_FCC_SOLID == V
    assert Z_FCC_SOLID == 12


def test_diamond_coordination_eq_D1():
    """Diamond (ZB) coordination z = D+1 = 4."""
    from urt.solid_state_cathedral import Z_DIAMOND
    from urt.shell_closure import D
    assert Z_DIAMOND == D + 1
    assert Z_DIAMOND == 4


def test_graphene_coordination_eq_D():
    """Graphene coordination z = D = 3."""
    from urt.solid_state_cathedral import Z_GRAPHENE
    from urt.shell_closure import D
    assert Z_GRAPHENE == D
    assert Z_GRAPHENE == 3


# ── Topological invariants ────────────────────────────────────────────────────

def test_topo_invariants_eq_D1():
    """Topological TI invariants = D+1 = 4."""
    from urt.solid_state_cathedral import N_TOPOLOGICAL_INVARIANTS_3D
    from urt.shell_closure import D
    assert N_TOPOLOGICAL_INVARIANTS_3D == D + 1
    assert N_TOPOLOGICAL_INVARIANTS_3D == 4


def test_qhe_dim_eq_D1():
    """QHE occurs in D-1 = 2 dimensions."""
    from urt.solid_state_cathedral import QUANTUM_HALL_DIM
    from urt.shell_closure import D
    assert QUANTUM_HALL_DIM == D - 1
    assert QUANTUM_HALL_DIM == 2


# ── Debye model ───────────────────────────────────────────────────────────────

def test_debye_power_eq_D():
    """Debye CV ∝ T^D → T^3."""
    from urt.solid_state_cathedral import DEBYE_POWER_LAW
    from urt.shell_closure import D
    assert DEBYE_POWER_LAW == D
    assert DEBYE_POWER_LAW == 3


# ── Magnetic models ───────────────────────────────────────────────────────────

def test_ising_states_eq_D1():
    """Ising spin states = D-1 = 2."""
    from urt.solid_state_cathedral import N_ISING_SPIN_STATES
    from urt.shell_closure import D
    assert N_ISING_SPIN_STATES == D - 1
    assert N_ISING_SPIN_STATES == 2


def test_heisenberg_components_eq_D():
    """Heisenberg spin components = D = 3."""
    from urt.solid_state_cathedral import N_HEISENBERG_COMPONENTS
    from urt.shell_closure import D
    assert N_HEISENBERG_COMPONENTS == D
    assert N_HEISENBERG_COMPONENTS == 3


# ── Function tests ────────────────────────────────────────────────────────────

def test_band_structure_function():
    from urt.solid_state_cathedral import band_structure
    r = band_structure()
    assert r["spin_eq_D1"] is True
    assert r["bloch_eq_D1"] is True
    assert r["topo_eq_D1"] is True


def test_phonon_structure_function():
    from urt.solid_state_cathedral import phonon_structure
    r = phonon_structure()
    assert r["branches_eq_V2"] is True
    assert r["debye_eq_D"] is True


def test_lattice_coordination_function():
    from urt.solid_state_cathedral import lattice_coordination
    r = lattice_coordination()
    assert r["sc_eq_V2"] is True
    assert r["bcc_eq_2D"] is True
    assert r["fcc_eq_V"] is True
    assert r["graphene_eq_D"] is True


def test_magnetic_models_function():
    from urt.solid_state_cathedral import magnetic_models
    r = magnetic_models()
    assert r["ising_eq_D1"] is True
    assert r["heisenberg_eq_D"] is True


def test_solid_state_summary():
    from urt.solid_state_cathedral import solid_state_summary
    r = solid_state_summary()
    assert "bands" in r
    assert "phonons" in r
    assert "coordination" in r
    assert "magnetism" in r
    assert len(r["key_results"]) >= 8


def test_print_solid_state_report(capsys):
    from urt.solid_state_cathedral import print_solid_state_report
    print_solid_state_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "Cathedral" in out
    assert "12" in out
    assert len(out) > 300
