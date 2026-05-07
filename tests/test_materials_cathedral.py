"""Tests for urt/materials_cathedral.py — Crystal systems, coordination, mechanics."""

import pytest
from math import isfinite, sqrt


# ── Import test ───────────────────────────────────────────────────────────────

def test_imports():
    from urt.materials_cathedral import (
        N_CRYSTAL_SYSTEMS, N_CRYSTAL_SYSTEMS_EQ_2D1, N_CRYSTAL_SYSTEMS_EQ_2D_PLUS_1,
        CRYSTAL_SYSTEM_NAMES,
        N_BRAVAIS_LATTICES,
        COORDINATION_ICOS, COORDINATION_ICOS_EQ_V,
        COORDINATION_TETRAHEDRAL, COORDINATION_TET_EQ_D1,
        COORDINATION_OCTAHEDRAL, COORDINATION_OCT_EQ_2D, COORDINATION_OCT_EQ_V2,
        COORDINATION_BCC,
        N_SLIP_SYSTEMS_FCC, N_SLIP_FCC_EQ_V,
        N_SLIP_PLANES_FCC, N_SLIP_DIRECTIONS_PER_PLANE, SLIP_PRODUCT_EQ_V,
        N_ELASTIC_CONSTANTS_ISOTROPIC, N_ELASTIC_ISO_EQ_D1,
        N_ELASTIC_CONSTANTS_CUBIC, N_ELASTIC_CUBIC_EQ_D,
        N_ELASTIC_CONSTANTS_HEXAGONAL, N_ELASTIC_HEX_EQ_Q,
        N_ELASTIC_CONSTANTS_GENERAL,
        N_FRACTURE_MODES, N_FRACTURE_EQ_D,
        N_DEFECT_TYPES, N_DEFECT_EQ_D, DEFECT_NAMES,
        N_DIFFUSION_MECHANISMS, DIFFUSION_MECHANISM_NAMES,
        CATHEDRAL_CRITICAL_STRAIN, FCC_SC_PACKING_RATIO,
        crystal_systems, coordination_geometry, mechanical_properties,
        materials_summary, print_materials_report,
    )


# ── Crystal systems ───────────────────────────────────────────────────────────

def test_crystal_systems_eq_7():
    """Seven crystal systems = 2D+1 = 7  [EXACT]."""
    from urt.materials_cathedral import (
        N_CRYSTAL_SYSTEMS, N_CRYSTAL_SYSTEMS_EQ_2D1, N_CRYSTAL_SYSTEMS_EQ_2D_PLUS_1,
    )
    from urt.shell_closure import D
    assert N_CRYSTAL_SYSTEMS == 2 * D + 1
    assert N_CRYSTAL_SYSTEMS == 7
    assert N_CRYSTAL_SYSTEMS_EQ_2D1 is True
    assert N_CRYSTAL_SYSTEMS_EQ_2D_PLUS_1 is True


def test_crystal_system_names_count():
    """Crystal system names list has 7 entries."""
    from urt.materials_cathedral import CRYSTAL_SYSTEM_NAMES
    assert len(CRYSTAL_SYSTEM_NAMES) == 7


def test_bravais_lattices_eq_N_plus_1():
    """14 Bravais lattices = N+1 = 14  [EXACT]."""
    from urt.materials_cathedral import N_BRAVAIS_LATTICES
    from urt.shell_closure import N
    assert N_BRAVAIS_LATTICES == N + 1
    assert N_BRAVAIS_LATTICES == 14


# ── Coordination numbers ──────────────────────────────────────────────────────

def test_coordination_icos_eq_V():
    """Icosahedral coordination = V = 12  [EXACT]."""
    from urt.materials_cathedral import COORDINATION_ICOS, COORDINATION_ICOS_EQ_V
    from urt.shell_closure import V
    assert COORDINATION_ICOS == V
    assert COORDINATION_ICOS == 12
    assert COORDINATION_ICOS_EQ_V is True


def test_coordination_tetrahedral_eq_D_plus_1():
    """Tetrahedral coordination = D+1 = 4  [EXACT]."""
    from urt.materials_cathedral import COORDINATION_TETRAHEDRAL, COORDINATION_TET_EQ_D1
    from urt.shell_closure import D
    assert COORDINATION_TETRAHEDRAL == D + 1
    assert COORDINATION_TETRAHEDRAL == 4
    assert COORDINATION_TET_EQ_D1 is True


def test_coordination_octahedral_eq_2D():
    """Octahedral coordination = 2D = 6 = V//2  [EXACT]."""
    from urt.materials_cathedral import (
        COORDINATION_OCTAHEDRAL, COORDINATION_OCT_EQ_2D, COORDINATION_OCT_EQ_V2,
    )
    from urt.shell_closure import D, V
    assert COORDINATION_OCTAHEDRAL == 2 * D
    assert COORDINATION_OCTAHEDRAL == V // 2
    assert COORDINATION_OCTAHEDRAL == 6
    assert COORDINATION_OCT_EQ_2D is True
    assert COORDINATION_OCT_EQ_V2 is True


def test_coordination_bcc_eq_2_pow_D():
    """BCC coordination = 2^D = 8  [EXACT]."""
    from urt.materials_cathedral import COORDINATION_BCC
    from urt.shell_closure import D
    assert COORDINATION_BCC == 2 ** D
    assert COORDINATION_BCC == 8


# ── Slip systems ──────────────────────────────────────────────────────────────

def test_fcc_slip_systems_eq_V():
    """FCC slip systems = V = 12  [EXACT]."""
    from urt.materials_cathedral import N_SLIP_SYSTEMS_FCC, N_SLIP_FCC_EQ_V
    from urt.shell_closure import V
    assert N_SLIP_SYSTEMS_FCC == V
    assert N_SLIP_SYSTEMS_FCC == 12
    assert N_SLIP_FCC_EQ_V is True


def test_fcc_slip_planes_eq_D_plus_1():
    """FCC slip planes {111} = D+1 = 4  [EXACT]."""
    from urt.materials_cathedral import N_SLIP_PLANES_FCC
    from urt.shell_closure import D
    assert N_SLIP_PLANES_FCC == D + 1
    assert N_SLIP_PLANES_FCC == 4


def test_fcc_slip_directions_eq_D():
    """FCC slip directions per plane = D = 3  [EXACT]."""
    from urt.materials_cathedral import N_SLIP_DIRECTIONS_PER_PLANE
    from urt.shell_closure import D
    assert N_SLIP_DIRECTIONS_PER_PLANE == D
    assert N_SLIP_DIRECTIONS_PER_PLANE == 3


def test_slip_product_eq_V():
    """planes × directions = V = 12  [EXACT]."""
    from urt.materials_cathedral import (
        N_SLIP_PLANES_FCC, N_SLIP_DIRECTIONS_PER_PLANE, SLIP_PRODUCT_EQ_V,
    )
    from urt.shell_closure import V
    assert N_SLIP_PLANES_FCC * N_SLIP_DIRECTIONS_PER_PLANE == V
    assert SLIP_PRODUCT_EQ_V is True


# ── Elastic constants ─────────────────────────────────────────────────────────

def test_elastic_constants_isotropic_eq_D_minus_1():
    """Isotropic elastic constants = D-1 = 2  [EXACT]."""
    from urt.materials_cathedral import (
        N_ELASTIC_CONSTANTS_ISOTROPIC, N_ELASTIC_ISO_EQ_D1,
    )
    from urt.shell_closure import D
    assert N_ELASTIC_CONSTANTS_ISOTROPIC == D - 1
    assert N_ELASTIC_CONSTANTS_ISOTROPIC == 2
    assert N_ELASTIC_ISO_EQ_D1 is True


def test_elastic_constants_cubic_eq_D():
    """Cubic elastic constants = D = 3  [EXACT]."""
    from urt.materials_cathedral import N_ELASTIC_CONSTANTS_CUBIC, N_ELASTIC_CUBIC_EQ_D
    from urt.shell_closure import D
    assert N_ELASTIC_CONSTANTS_CUBIC == D
    assert N_ELASTIC_CONSTANTS_CUBIC == 3
    assert N_ELASTIC_CUBIC_EQ_D is True


def test_elastic_constants_hexagonal_eq_q():
    """Hexagonal elastic constants = q = 5  [EXACT]."""
    from urt.materials_cathedral import (
        N_ELASTIC_CONSTANTS_HEXAGONAL, N_ELASTIC_HEX_EQ_Q,
    )
    from urt.shell_closure import q
    assert N_ELASTIC_CONSTANTS_HEXAGONAL == q
    assert N_ELASTIC_CONSTANTS_HEXAGONAL == 5
    assert N_ELASTIC_HEX_EQ_Q is True


def test_elastic_constants_general():
    """General elastic constants = 21."""
    from urt.materials_cathedral import N_ELASTIC_CONSTANTS_GENERAL
    assert N_ELASTIC_CONSTANTS_GENERAL == 21
    assert isinstance(N_ELASTIC_CONSTANTS_GENERAL, int)


# ── Fracture and defects ──────────────────────────────────────────────────────

def test_fracture_modes_eq_D():
    """Three fracture modes = D = 3  [EXACT]."""
    from urt.materials_cathedral import N_FRACTURE_MODES, N_FRACTURE_EQ_D
    from urt.shell_closure import D
    assert N_FRACTURE_MODES == D
    assert N_FRACTURE_MODES == 3
    assert N_FRACTURE_EQ_D is True


def test_defect_types_eq_D():
    """Three defect types = D = 3  [EXACT]."""
    from urt.materials_cathedral import N_DEFECT_TYPES, N_DEFECT_EQ_D, DEFECT_NAMES
    from urt.shell_closure import D
    assert N_DEFECT_TYPES == D
    assert N_DEFECT_TYPES == 3
    assert N_DEFECT_EQ_D is True
    assert len(DEFECT_NAMES) == D


def test_diffusion_mechanisms_eq_D():
    """Diffusion mechanisms = D = 3  [APPROXIMATE]."""
    from urt.materials_cathedral import N_DIFFUSION_MECHANISMS, DIFFUSION_MECHANISM_NAMES
    from urt.shell_closure import D
    assert N_DIFFUSION_MECHANISMS == D
    assert len(DIFFUSION_MECHANISM_NAMES) == D


# ── Cathedral constants ───────────────────────────────────────────────────────

def test_cathedral_critical_strain_is_delta_star():
    """Cathedral critical strain = δ★."""
    from urt.materials_cathedral import CATHEDRAL_CRITICAL_STRAIN
    from urt.shell_closure import DELTA_STAR
    assert abs(CATHEDRAL_CRITICAL_STRAIN - DELTA_STAR) < 1e-12


def test_fcc_sc_packing_ratio():
    """FCC/SC packing ratio = √2."""
    from urt.materials_cathedral import FCC_SC_PACKING_RATIO
    assert abs(FCC_SC_PACKING_RATIO - sqrt(2)) < 1e-12


# ── Function tests ────────────────────────────────────────────────────────────

def test_crystal_systems_function():
    from urt.materials_cathedral import crystal_systems
    r = crystal_systems()
    assert r["n_systems"] == 7
    assert r["n_systems_eq_2D1"] is True
    assert r["n_systems_eq_2D_plus_1"] is True
    assert r["n_bravais"] == 14
    assert len(r["system_names"]) == 7
    assert "EXACT" in r["status"]


def test_coordination_geometry_function():
    from urt.materials_cathedral import coordination_geometry
    r = coordination_geometry()
    assert r["tetrahedral"] == 4
    assert r["tet_eq_D1"] is True
    assert r["octahedral"] == 6
    assert r["oct_eq_2D"] is True
    assert r["oct_eq_V2"] is True
    assert r["icos"] == 12
    assert r["icos_eq_V"] is True
    assert r["bcc"] == 8
    assert "EXACT" in r["status_tet"]
    assert "EXACT" in r["status_oct"]
    assert "EXACT" in r["status_icos"]


def test_mechanical_properties_function():
    from urt.materials_cathedral import mechanical_properties
    r = mechanical_properties()
    assert r["n_fracture_modes"] == 3
    assert r["n_fracture_eq_D"] is True
    assert r["n_slip_fcc"] == 12
    assert r["n_slip_eq_V"] is True
    assert r["n_elastic_cubic"] == 3
    assert r["n_elastic_cubic_eq_D"] is True
    assert r["n_defects"] == 3
    assert r["n_defects_eq_D"] is True
    assert r["slip_product_eq_V"] is True
    assert "EXACT" in r["status_fracture"]
    assert "EXACT" in r["status_slip"]


def test_materials_summary_keys():
    from urt.materials_cathedral import materials_summary
    s = materials_summary()
    assert "crystal" in s
    assert "coordination" in s
    assert "mechanical" in s
    assert "key_results" in s
    assert len(s["key_results"]) >= 8
    assert s["D"] == 3
    assert s["q"] == 5
    assert s["V"] == 12


def test_print_materials_report(capsys):
    from urt.materials_cathedral import print_materials_report
    print_materials_report()
    captured = capsys.readouterr()
    assert "EXACT" in captured.out
    assert "12" in captured.out


# ── Cross-consistency ─────────────────────────────────────────────────────────

def test_fracture_eq_defect_eq_D():
    """Fracture modes = defect types = D = 3."""
    from urt.materials_cathedral import N_FRACTURE_MODES, N_DEFECT_TYPES
    assert N_FRACTURE_MODES == N_DEFECT_TYPES


def test_octahedral_eq_icos_half():
    """Octahedral coord = icosahedral coord / 2 = 6."""
    from urt.materials_cathedral import COORDINATION_OCTAHEDRAL, COORDINATION_ICOS
    assert COORDINATION_OCTAHEDRAL * 2 == COORDINATION_ICOS


def test_tetrahedral_times_3_eq_icos():
    """Tetrahedral coord × 3 = icosahedral coord: 4×3=12."""
    from urt.materials_cathedral import COORDINATION_TETRAHEDRAL, COORDINATION_ICOS
    assert COORDINATION_TETRAHEDRAL * 3 == COORDINATION_ICOS


def test_slip_product_eq_icos():
    """FCC slip systems = icosahedral coord = V = 12."""
    from urt.materials_cathedral import N_SLIP_SYSTEMS_FCC, COORDINATION_ICOS
    assert N_SLIP_SYSTEMS_FCC == COORDINATION_ICOS
