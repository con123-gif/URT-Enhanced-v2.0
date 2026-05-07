"""Tests for urt/relativity_cathedral.py — Spacetime, Riemann, Lorentz, spinors."""

import pytest
from math import isfinite


def test_imports():
    from urt.relativity_cathedral import (
        N_SPACETIME_DIMS, N_4VECTOR, N_ANTISYM_2TENSOR,
        N_SYMM_2TENSOR, N_LORENTZ_GENERATORS, N_ROTATIONS, N_BOOSTS,
        N_RIEMANN_COMPONENTS, N_RICCI_COMPONENTS, N_WEYL_COMPONENTS,
        N_EINSTEIN_EQNS, N_PHYSICAL_EFE, N_DIRAC_COMPONENTS, N_WEYL_SPINOR_COMPONENTS,
        schwarzschild_radius, hawking_temperature, bh_entropy,
        spacetime_structure, lorentz_group_structure, riemann_tensor_structure,
        spinor_structure, relativity_summary, print_relativity_report,
    )


# ── Spacetime ─────────────────────────────────────────────────────────────────

def test_spacetime_dims_eq_D1():
    """Spacetime = 1+D = D+1 = 4."""
    from urt.relativity_cathedral import N_SPACETIME_DIMS
    from urt.shell_closure import D
    assert N_SPACETIME_DIMS == D + 1
    assert N_SPACETIME_DIMS == 4


def test_4vector_eq_D1():
    """4-vector has D+1 = 4 components."""
    from urt.relativity_cathedral import N_4VECTOR
    from urt.shell_closure import D
    assert N_4VECTOR == D + 1
    assert N_4VECTOR == 4


def test_antisym_2tensor_eq_V2():
    """Antisymmetric 2-tensor has V/2 = 6 components."""
    from urt.relativity_cathedral import N_ANTISYM_2TENSOR
    from urt.shell_closure import V
    assert N_ANTISYM_2TENSOR == V // 2
    assert N_ANTISYM_2TENSOR == 6


def test_symm_2tensor():
    """Symmetric 2-tensor (metric, T_μν) has 10 components."""
    from urt.relativity_cathedral import N_SYMM_2TENSOR
    assert N_SYMM_2TENSOR == 10


# ── Lorentz group ─────────────────────────────────────────────────────────────

def test_lorentz_generators_eq_V2():
    """SO(1,D) has (D+1)D/2 = V/2 = 6 generators."""
    from urt.relativity_cathedral import N_LORENTZ_GENERATORS
    from urt.shell_closure import V
    assert N_LORENTZ_GENERATORS == V // 2
    assert N_LORENTZ_GENERATORS == 6


def test_rotations_eq_D():
    """D = 3 rotation generators."""
    from urt.relativity_cathedral import N_ROTATIONS
    from urt.shell_closure import D
    assert N_ROTATIONS == D
    assert N_ROTATIONS == 3


def test_boosts_eq_D():
    """D = 3 boost generators."""
    from urt.relativity_cathedral import N_BOOSTS
    from urt.shell_closure import D
    assert N_BOOSTS == D
    assert N_BOOSTS == 3


def test_rot_plus_boosts_eq_generators():
    """Rotations + boosts = total generators."""
    from urt.relativity_cathedral import N_ROTATIONS, N_BOOSTS, N_LORENTZ_GENERATORS
    assert N_ROTATIONS + N_BOOSTS == N_LORENTZ_GENERATORS


# ── Riemann tensor ────────────────────────────────────────────────────────────

def test_riemann_eq_F():
    """Riemann independent components = n²(n²-1)/12 = 20 = F EXACT!!!"""
    from urt.relativity_cathedral import N_RIEMANN_COMPONENTS
    from urt.shell_closure import F
    assert N_RIEMANN_COMPONENTS == F
    assert N_RIEMANN_COMPONENTS == 20


def test_riemann_formula():
    """Verify n²(n²-1)/12 for n=4."""
    from urt.relativity_cathedral import N_RIEMANN_COMPONENTS, N_SPACETIME_DIMS
    n = N_SPACETIME_DIMS
    expected = n**2 * (n**2 - 1) // 12
    assert N_RIEMANN_COMPONENTS == expected


def test_weyl_plus_ricci_eq_riemann():
    """Weyl + Ricci = Riemann."""
    from urt.relativity_cathedral import N_RIEMANN_COMPONENTS, N_RICCI_COMPONENTS, N_WEYL_COMPONENTS
    assert N_WEYL_COMPONENTS + N_RICCI_COMPONENTS == N_RIEMANN_COMPONENTS


def test_einstein_equations():
    """10 Einstein field equations."""
    from urt.relativity_cathedral import N_EINSTEIN_EQNS
    assert N_EINSTEIN_EQNS == 10


def test_physical_efe_eq_V2():
    """Physical EFE after Bianchi = V/2 = 6."""
    from urt.relativity_cathedral import N_PHYSICAL_EFE
    from urt.shell_closure import V
    assert N_PHYSICAL_EFE == V // 2
    assert N_PHYSICAL_EFE == 6


# ── Spinors ───────────────────────────────────────────────────────────────────

def test_dirac_components_eq_D1():
    """Dirac spinor has D+1 = 4 components."""
    from urt.relativity_cathedral import N_DIRAC_COMPONENTS
    from urt.shell_closure import D
    assert N_DIRAC_COMPONENTS == D + 1
    assert N_DIRAC_COMPONENTS == 4


def test_weyl_spinor_eq_D1():
    """Weyl spinor has D-1 = 2 components."""
    from urt.relativity_cathedral import N_WEYL_SPINOR_COMPONENTS
    from urt.shell_closure import D
    assert N_WEYL_SPINOR_COMPONENTS == D - 1
    assert N_WEYL_SPINOR_COMPONENTS == 2


# ── Black hole ────────────────────────────────────────────────────────────────

def test_schwarzschild_radius_positive():
    from urt.relativity_cathedral import schwarzschild_radius
    assert schwarzschild_radius(1.0) > 0
    assert isfinite(schwarzschild_radius(1.0))


def test_hawking_temperature_positive():
    from urt.relativity_cathedral import hawking_temperature
    assert hawking_temperature(1.0) > 0
    assert isfinite(hawking_temperature(1.0))


def test_bh_entropy_positive():
    from urt.relativity_cathedral import bh_entropy
    assert bh_entropy(1.0) > 0
    assert isfinite(bh_entropy(1.0))


# ── Function tests ────────────────────────────────────────────────────────────

def test_spacetime_structure_function():
    from urt.relativity_cathedral import spacetime_structure
    r = spacetime_structure()
    assert r["spacetime_eq_D1"] is True
    assert r["antisym_eq_V2"] is True


def test_lorentz_group_function():
    from urt.relativity_cathedral import lorentz_group_structure
    r = lorentz_group_structure()
    assert r["generators_eq_V2"] is True
    assert r["rotations_eq_D"] is True


def test_riemann_tensor_function():
    from urt.relativity_cathedral import riemann_tensor_structure
    r = riemann_tensor_structure()
    assert r["riemann_eq_F"] is True
    assert r["physical_efe_eq_V2"] is True


def test_relativity_summary():
    from urt.relativity_cathedral import relativity_summary
    r = relativity_summary()
    assert "riemann" in r
    assert "lorentz" in r
    assert len(r["key_results"]) >= 4


def test_print_relativity_report(capsys):
    from urt.relativity_cathedral import print_relativity_report
    print_relativity_report()
    out = capsys.readouterr().out
    assert "EXACT" in out
    assert "20" in out
    assert len(out) > 200
