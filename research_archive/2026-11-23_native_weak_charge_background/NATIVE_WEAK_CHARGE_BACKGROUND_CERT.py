#!/usr/bin/env python3
"""Native weak-field fixed-charge background-selection certificate.

The unchanged five-Platonic 190/H64/24 action has a U(1) Noether charge.
This certificate asks whether minimizing its quadratic energy at fixed charge
selects a nonzero stress-bearing background.  It uses only native incidence,
Hessian and clock operators; no random state, fit, metric identification or
synthetic response matrix is introduced.
"""
from __future__ import annotations

import json
from pathlib import Path
import runpy
import sys

import numpy as np


SCRIPT_DIR = Path(__file__).resolve().parent
ARCHIVE_RELATIVE = (
    Path("research_archive")
    / "2026-11-07_joint_interacting_native"
    / "cathedral_constructed_joint_dynamics_2026_11_07.py"
)
for candidate in (SCRIPT_DIR, *SCRIPT_DIR.parents):
    if (candidate / ARCHIVE_RELATIVE).is_file():
        ROOT = candidate
        break
else:
    raise FileNotFoundError(f"repository root containing {ARCHIVE_RELATIVE} not found")
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from cathedral_core.full_dynamics import NativeURTFullDynamics
from cathedral_core.native_urt import NativeURTState


ARCHIVE = ROOT / ARCHIVE_RELATIVE
TOL = 1.0e-10


def rank(a: np.ndarray, tol: float = TOL) -> int:
    singular = np.linalg.svd(np.asarray(a), compute_uv=False)
    return int(np.count_nonzero(singular > tol))


def main() -> None:
    native = runpy.run_path(str(ARCHIVE))
    dynamics = NativeURTFullDynamics(native)

    # Build all exact-edge gauge directions b1^T(e_i-e_last), embedded in the
    # original 190 cochain.  Their dimension is sum_s(V_s-1)=45.
    exact_edge_columns = []
    vertex_indices = []
    face_indices = []
    per_solid = {}
    for name, geometry in native["geom"].items():
        offset = int(geometry["offset"])
        vertices = int(geometry["V"])
        edges = int(geometry["E"])
        faces = int(geometry["F"])
        b1 = np.asarray(geometry["b1"], dtype=float)
        b2 = np.asarray(geometry["b2"], dtype=float)
        assert np.max(np.abs(b1 @ b2)) == 0.0

        differences = np.zeros((vertices, vertices - 1))
        differences[np.arange(vertices - 1), np.arange(vertices - 1)] = 1.0
        differences[-1, :] = -1.0
        local_exact = b1.T @ differences
        assert rank(local_exact) == vertices - 1

        embedded = np.zeros((190, vertices - 1))
        embedded[offset + vertices : offset + vertices + edges, :] = local_exact
        exact_edge_columns.append(embedded)
        vertex_indices.extend(range(offset, offset + vertices))
        face_indices.extend(range(offset + vertices + edges, offset + vertices + edges + faces))
        per_solid[name] = {
            "V_minus_1": vertices - 1,
            "exact_edge_rank": rank(local_exact),
            "curl_operator_norm": float(np.linalg.norm(local_exact.T @ b2, ord=2)),
        }
        assert per_solid[name]["curl_operator_norm"] < TOL

    exact_edge = np.column_stack(exact_edge_columns)
    assert exact_edge.shape == (190, 45)
    assert rank(exact_edge) == 45
    assert np.count_nonzero(exact_edge[np.asarray(vertex_indices), :]) == 0
    assert np.count_nonzero(exact_edge[np.asarray(face_indices), :]) == 0

    # The original potential deliberately omits the edge-exact b1^T b1 block.
    # Hence these are exact flat directions of the actual geometric Hessian.
    hessian_residual = float(np.linalg.norm(dynamics.H @ exact_edge, ord=2))
    assert hessian_residual < TOL
    hessian_spectrum = np.linalg.eigvalsh(dynamics.H)
    hessian_nullity = int(np.count_nonzero(np.abs(hessian_spectrum) < TOL))
    assert hessian_nullity == 47

    # The primitive golden clock chooses a unique discrete charge-one Bloch
    # index, but it cannot choose among the 45 internal gauge directions.
    modes = np.arange(dynamics.N)
    ell1 = 2.0 - 2.0 * np.cos(
        dynamics.golden_angle - 2.0 * np.pi * modes / dynamics.N
    )
    ell2 = 2.0 - 2.0 * np.cos(
        2.0 * dynamics.golden_angle - 2.0 * np.pi * modes / dynamics.N
    )
    clock_mode = int(np.argmin(ell1))
    history_clock_mode = int(np.argmin(ell2))
    geometry_multiplier = float(dynamics.r**2 * ell1[clock_mode])
    history_multiplier = float(
        np.linalg.eigvalsh(dynamics.Hbits)[0]
        + dynamics.r**2 * ell2[history_clock_mode]
    )
    geometry_energy_per_unit_charge = geometry_multiplier / 2.0
    history_energy_per_unit_charge = history_multiplier / 4.0
    assert clock_mode == 9
    assert history_clock_mode == 18
    assert geometry_energy_per_unit_charge < history_energy_per_unit_charge

    # Construct a normalized representative of the selected charge-one clock
    # orbit.  The internal direction is merely the first incidence-defined
    # gauge column; the result is asserted for the whole 45D span above.
    internal = exact_edge[:, 0].astype(complex)
    internal /= np.linalg.norm(internal)
    clock_phase = np.exp(2j * np.pi * clock_mode * modes / dynamics.N)
    z = clock_phase[:, None] * internal[None, :] / np.sqrt(dynamics.N)
    y = np.zeros((dynamics.N, dynamics.history_dimension), dtype=complex)
    state = NativeURTState(z, np.full(dynamics.N, dynamics.golden_angle), y)
    charge = dynamics.noether_charge(state)
    energy, gradient_z, gradient_y = dynamics.full_energy_and_gradient(state)
    relative_equilibrium_residual = float(
        np.linalg.norm(gradient_z - geometry_multiplier * z)
    )
    assert abs(charge - 1.0) < TOL
    assert abs(energy - geometry_energy_per_unit_charge) < TOL
    assert relative_equilibrium_residual < TOL
    assert np.linalg.norm(gradient_y) < TOL

    # Hidden source, icosahedral STF carrier, all-five circulation and Hopf
    # current are inactive.  Hopf magnetic terms act only on vertex fields;
    # the circulation curl annihilates exact edges by b1 b2=0.
    face_field, hidden3, hidden5 = dynamics.sources(z)
    source_norms = {
        "face_field": float(np.linalg.norm(face_field)),
        "hidden_P3": float(np.linalg.norm(hidden3)),
        "hidden_P5": float(np.linalg.norm(hidden5)),
    }
    assert max(source_norms.values()) < TOL

    icosahedron = native["geom"]["icosahedron"]
    io = int(icosahedron["offset"])
    iv = int(icosahedron["V"])
    icosa_vertex_norm = float(np.linalg.norm(z[:, io : io + iv]))
    assert icosa_vertex_norm == 0.0

    # Pure phase evolution leaves every amplitude, source invariant and KMS
    # population unchanged.  It is a relative equilibrium, not dissipative
    # entropy production or a redshift/lapse observable.
    rhs_z, rhs_y = dynamics.hamiltonian_rhs(state)
    phase_orbit_residual = float(
        np.linalg.norm(rhs_z + 1j * geometry_multiplier * z)
    )
    density_rate = float(
        np.max(np.abs(2.0 * np.real(np.conj(z) * rhs_z)))
    )
    assert phase_orbit_residual < TOL
    assert np.linalg.norm(rhs_y) < TOL
    assert density_rate < TOL

    result = {
        "status": "PASS",
        "native_dimensions": {"cochains": 190, "history": 64, "clock": 24},
        "exact_edge_gauge_kernel": {
            "dimension": rank(exact_edge),
            "full_geometric_hessian_nullity": hessian_nullity,
            "hessian_operator_residual": hessian_residual,
            "per_solid": per_solid,
        },
        "fixed_noether_charge_selector": {
            "geometry_clock_mode": clock_mode,
            "history_clock_mode": history_clock_mode,
            "geometry_multiplier": geometry_multiplier,
            "geometry_energy_per_unit_charge": geometry_energy_per_unit_charge,
            "history_energy_per_unit_charge": history_energy_per_unit_charge,
            "selected_internal_dimension_at_least": 45,
        },
        "representative_relative_equilibrium": {
            "charge": charge,
            "energy": energy,
            "gradient_residual": relative_equilibrium_residual,
            "phase_orbit_residual": phase_orbit_residual,
            "maximum_density_rate": density_rate,
            "source_norms": source_norms,
            "icosa_vertex_and_STF_norm": icosa_vertex_norm,
        },
        "interpretation": (
            "The native weak fixed-charge selector chooses clock mode 9 but "
            "not a physical spatial background: at least 45 degenerate exact-"
            "edge gauge relative equilibria remain, all stress-, vortex-, "
            "hidden-source- and entropy-exchange-free."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
