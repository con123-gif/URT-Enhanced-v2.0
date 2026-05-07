"""Tests for urt/particle_physics_cathedral.py — Standard Model Cathedral connections."""

import pytest


def test_imports():
    from urt.particle_physics_cathedral import (
        N_FERMION_GENERATIONS, N_QUARKS_PER_GEN, N_LEPTONS_PER_GEN,
        N_QUARK_FLAVORS, N_LEPTON_FLAVORS,
        N_PHOTONS, N_WEAK_BOSONS, N_GLUONS, N_GAUGE_BOSONS_TOTAL,
        N_HIGGS_DOUBLET_COMPLEX, N_GOLDSTONE_EATEN,
        CKM_SIZE, N_MIXING_ANGLES, N_CP_PHASES,
        fermion_structure, gauge_boson_structure, mixing_matrix_structure,
        particle_physics_summary, print_particle_physics_report,
    )


# ── Fermions ──────────────────────────────────────────────────────────────────

def test_generations_eq_D():
    """Three fermion generations = D = 3."""
    from urt.particle_physics_cathedral import N_FERMION_GENERATIONS
    from urt.shell_closure import D
    assert N_FERMION_GENERATIONS == D
    assert N_FERMION_GENERATIONS == 3


def test_quarks_per_gen_eq_D1():
    """Quarks per generation = D-1 = 2."""
    from urt.particle_physics_cathedral import N_QUARKS_PER_GEN
    from urt.shell_closure import D
    assert N_QUARKS_PER_GEN == D - 1
    assert N_QUARKS_PER_GEN == 2


def test_total_quark_flavors_eq_V2():
    """Total quark flavors = D(D-1) = 6 = V/2."""
    from urt.particle_physics_cathedral import N_QUARK_FLAVORS
    from urt.shell_closure import D, V
    assert N_QUARK_FLAVORS == D * (D - 1)
    assert N_QUARK_FLAVORS == V // 2
    assert N_QUARK_FLAVORS == 6


# ── Gauge bosons ──────────────────────────────────────────────────────────────

def test_weak_bosons_eq_D():
    """Weak bosons (W±, Z) = D = 3."""
    from urt.particle_physics_cathedral import N_WEAK_BOSONS
    from urt.shell_closure import D
    assert N_WEAK_BOSONS == D
    assert N_WEAK_BOSONS == 3


def test_gluons_eq_D2_1():
    """Gluons = D²-1 = 8."""
    from urt.particle_physics_cathedral import N_GLUONS
    from urt.shell_closure import D
    assert N_GLUONS == D**2 - 1
    assert N_GLUONS == 8


def test_total_gauge_eq_V():
    """Total gauge bosons = D(D+1) = 12 = V.  [EXACT!!!]"""
    from urt.particle_physics_cathedral import N_GAUGE_BOSONS_TOTAL
    from urt.shell_closure import D, V
    assert N_GAUGE_BOSONS_TOTAL == D * (D + 1)
    assert N_GAUGE_BOSONS_TOTAL == V
    assert N_GAUGE_BOSONS_TOTAL == 12


def test_gauge_formula():
    """1 + D + (D²-1) = D(D+1)."""
    from urt.particle_physics_cathedral import N_PHOTONS, N_WEAK_BOSONS, N_GLUONS, N_GAUGE_BOSONS_TOTAL
    from urt.shell_closure import D
    assert N_PHOTONS + N_WEAK_BOSONS + N_GLUONS == N_GAUGE_BOSONS_TOTAL
    assert N_GAUGE_BOSONS_TOTAL == D * (D + 1)


# ── Higgs sector ──────────────────────────────────────────────────────────────

def test_higgs_doublet_eq_D1():
    """Higgs SU(2) doublet = D-1 = 2 complex components."""
    from urt.particle_physics_cathedral import N_HIGGS_DOUBLET_COMPLEX
    from urt.shell_closure import D
    assert N_HIGGS_DOUBLET_COMPLEX == D - 1
    assert N_HIGGS_DOUBLET_COMPLEX == 2


def test_goldstone_eaten_eq_D():
    """Goldstone bosons eaten by W±, Z = D = 3."""
    from urt.particle_physics_cathedral import N_GOLDSTONE_EATEN
    from urt.shell_closure import D
    assert N_GOLDSTONE_EATEN == D
    assert N_GOLDSTONE_EATEN == 3


# ── CKM matrix ────────────────────────────────────────────────────────────────

def test_ckm_size_eq_D():
    """CKM is D×D = 3×3 matrix."""
    from urt.particle_physics_cathedral import CKM_SIZE
    from urt.shell_closure import D
    assert CKM_SIZE == D
    assert CKM_SIZE == 3


def test_mixing_angles_eq_D():
    """CKM mixing angles = D(D-1)/2 = 3 = D (self-referential!)."""
    from urt.particle_physics_cathedral import N_MIXING_ANGLES
    from urt.shell_closure import D
    assert N_MIXING_ANGLES == D * (D - 1) // 2
    assert N_MIXING_ANGLES == D
    assert N_MIXING_ANGLES == 3


def test_cp_phases():
    """CKM has (D-1)(D-2)/2 = 1 CP phase."""
    from urt.particle_physics_cathedral import N_CP_PHASES
    from urt.shell_closure import D
    assert N_CP_PHASES == (D - 1) * (D - 2) // 2
    assert N_CP_PHASES == 1


# ── Function tests ────────────────────────────────────────────────────────────

def test_fermion_structure_function():
    from urt.particle_physics_cathedral import fermion_structure
    r = fermion_structure()
    assert r["gen_eq_D"] is True
    assert r["quarks_eq_V2"] is True
    assert r["generations"] == 3


def test_gauge_boson_function():
    from urt.particle_physics_cathedral import gauge_boson_structure
    r = gauge_boson_structure()
    assert r["weak_eq_D"] is True
    assert r["gluons_eq_D2_1"] is True
    assert r["total_eq_V"] is True
    assert r["total_gauge"] == 12


def test_mixing_matrix_function():
    from urt.particle_physics_cathedral import mixing_matrix_structure
    r = mixing_matrix_structure()
    assert r["angles_eq_D"] is True
    assert r["mixing_angles"] == 3


def test_particle_physics_summary():
    from urt.particle_physics_cathedral import particle_physics_summary
    r = particle_physics_summary()
    assert "fermions" in r
    assert "gauge_bosons" in r
    assert "mixing" in r
    assert len(r["key_results"]) >= 6


def test_print_particle_physics_report(capsys):
    from urt.particle_physics_cathedral import print_particle_physics_report
    print_particle_physics_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "12" in out
    assert "Cathedral" in out
    assert len(out) > 300
