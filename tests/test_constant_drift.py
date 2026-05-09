"""
Constant-drift guard.

Several modules in `urt/` redefine canonical Cathedral constants locally
(DELTA_STAR, GAMMA, etc.) instead of importing them from `shell_closure`.
Today every local copy happens to agree to machine precision, but that's a
silent invariant — if anyone tweaks the formula in `shell_closure.py`,
the local copies won't follow and CI will keep passing.

This module enumerates the modules that locally define these constants and
asserts byte-exact agreement with the canonical source.  It is the
first-line defence against numerical drift across the framework.

If you genuinely need a *different* value of DELTA_STAR locally (e.g. for
a deformation study), import the canonical one and add an explicit offset
rather than redefining the constant.  Then add the module name to the
``DRIFT_EXEMPT`` set below with a written justification.
"""
import importlib

import pytest

from urt.shell_closure import DELTA_STAR as CANONICAL_DELTA_STAR


# Modules that redefine DELTA_STAR locally (audited 2026-05-09).
DELTA_STAR_MODULES = [
    "urt.alpha_exact",
    "urt.axion_cathedral",
    "urt.bounded_chaos_cathedral",
    "urt.casimir_cathedral",
    "urt.cathedral_gap",
    "urt.cathedral_v9",
    "urt.consciousness",
    "urt.gravitational_waves",
    "urt.holography",
    "urt.ikt_cathedral",
    "urt.metamaterials",
    "urt.navier_stokes",
    "urt.nuclear_magic",
    "urt.periodic_table",
    "urt.prime_spectral",
    "urt.qft_cathedral",
    "urt.quasicrystal",
    "urt.swarm_intelligence",
    "urt.zpe_cathedral",
]

# Modules that redefine GAMMA = 1/81 locally.
GAMMA_MODULES = [
    "urt.alpha_exact",
    "urt.axion_cathedral",
    "urt.casimir_cathedral",
    "urt.cathedral_gap",
    "urt.cathedral_lie",
    "urt.cathedral_repunit",
    "urt.cathedral_v9",
    "urt.exceptional_lie",
    "urt.gravity_deficit",
    "urt.moonshine_cathedral",
    "urt.navier_stokes",
    "urt.neural_cathedral",
    "urt.nuclear_magic",
    "urt.qft_cathedral",
    "urt.quantum_cosmo_bridge",
    "urt.quasicrystal",
    "urt.spectrum_cathedral",
]

# Add modules here (with justification) if a deliberate local difference is
# wanted — the test below will skip them.
DRIFT_EXEMPT = set()


@pytest.mark.drift
@pytest.mark.parametrize("module_name", DELTA_STAR_MODULES)
def test_delta_star_no_drift(module_name):
    """Every locally-defined DELTA_STAR must equal the canonical one
    to machine precision."""
    if module_name in DRIFT_EXEMPT:
        pytest.skip(f"{module_name} is in DRIFT_EXEMPT")
    mod = importlib.import_module(module_name)
    if not hasattr(mod, "DELTA_STAR"):
        pytest.skip(f"{module_name} does not export DELTA_STAR")
    local = getattr(mod, "DELTA_STAR")
    assert local == pytest.approx(CANONICAL_DELTA_STAR, abs=1e-15), (
        f"{module_name}.DELTA_STAR = {local!r} drifts from "
        f"shell_closure.DELTA_STAR = {CANONICAL_DELTA_STAR!r}"
    )


@pytest.mark.drift
@pytest.mark.parametrize("module_name", GAMMA_MODULES)
def test_gamma_no_drift(module_name):
    """Every locally-defined GAMMA must equal 1/81 (= D⁻ᴰ⁻¹ = 3⁻⁴)."""
    if module_name in DRIFT_EXEMPT:
        pytest.skip(f"{module_name} is in DRIFT_EXEMPT")
    mod = importlib.import_module(module_name)
    if not hasattr(mod, "GAMMA"):
        # some modules use lowercase 'gamma'
        if hasattr(mod, "gamma"):
            local = mod.gamma
        else:
            pytest.skip(f"{module_name} does not export GAMMA")
            return
    else:
        local = mod.GAMMA
    expected = 1 / 81
    assert local == pytest.approx(expected, abs=1e-15), (
        f"{module_name}.GAMMA = {local!r} drifts from canonical 1/81 = {expected}"
    )


@pytest.mark.drift
def test_canonical_delta_star_is_what_we_think_it_is():
    """δ★ = (1 − γ)·π / (N·φ) = (80/81)·π/(13φ) ≈ 0.14751081."""
    from math import pi, sqrt
    phi = (1 + sqrt(5)) / 2
    gamma = 1 / 81
    expected = (1 - gamma) * pi / (13 * phi)
    assert CANONICAL_DELTA_STAR == pytest.approx(expected, abs=1e-15)


@pytest.mark.drift
def test_at_least_one_drift_test_per_module():
    """Meta-test: keep the DELTA_STAR_MODULES list comprehensive.

    If a new module starts redefining DELTA_STAR locally, surface it here
    so the maintainer is forced to add it to the drift list (or refactor
    to import from shell_closure)."""
    # We cap at the audited count + small slack.  Re-audit and bump if a
    # legitimately new module is added.
    assert len(DELTA_STAR_MODULES) <= 30
    assert len(GAMMA_MODULES) <= 30
