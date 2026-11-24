#!/usr/bin/env python3
"""Native fixed-charge coexact curl and vortex-stiffness certificate.

Uses the unchanged five-Platonic 190/H64/24 Hopf/circulation dynamics.  The
certificate selects the lowest icosahedral coexact edge eigenspace from the
native incidence operator, not from a fitted or surrogate matrix.
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

from cathedral_core.hopf_urt_join import FiveSolidHopfURTDynamics
from cathedral_core.native_urt import NativeURTState


TOL = 2.0e-10


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    surface = next(s for s in dynamics.surfaces if s.name == "icosahedron")
    hopf_surface = next(s for s in dynamics.hopf_surfaces if s.name == "icosahedron")

    # The coexact edge Laplacian is the native b2 b2^T block.  Its lowest
    # positive icosahedral eigenvalue is 3-sqrt(5), with multiplicity three.
    edge_laplacian = surface.b2 @ surface.b2.T
    eigenvalues, eigenvectors = np.linalg.eigh(edge_laplacian)
    positive = eigenvalues[eigenvalues > TOL]
    lowest = float(positive[0])
    eigenspace = eigenvectors[:, np.abs(eigenvalues - lowest) < TOL]
    projector = eigenspace @ eigenspace.T
    multiplicity = int(eigenspace.shape[1])
    assert multiplicity == 3
    assert abs(lowest - (3.0 - np.sqrt(5.0))) < TOL

    clock_index = 9
    n = np.arange(dynamics.N)
    clock = np.exp(2j * np.pi * clock_index * n / dynamics.N) / np.sqrt(dynamics.N)
    ell1 = 2.0 - 2.0 * np.cos(
        dynamics.golden_angle - 2.0 * np.pi * clock_index / dynamics.N
    )
    clock_shift = float(dynamics.r**2 * ell1)
    multiplier = lowest + clock_shift
    theta = np.full(dynamics.N, dynamics.golden_angle)
    history = np.zeros((dynamics.N, dynamics.history_dimension), dtype=complex)

    o, v, e = surface.offset, surface.V, surface.E
    base_geometry = dynamics.H[o : o + v, o : o + v].astype(complex)
    base_hopf = base_geometry + (
        hopf_surface.Bq.conj().T @ hopf_surface.Bq
        - hopf_surface.B0.T @ hopf_surface.B0
    )
    base_geometry_minimum = float(np.linalg.eigvalsh(base_geometry)[0])
    base_hopf_minimum = float(np.linalg.eigvalsh(base_hopf)[0])

    energies = []
    equilibrium_residuals = []
    vertex_gradient_norms = []
    source_norms = []
    curl_norm_squared = []
    circulation_energies = []
    circulation_gradient_norms = []
    hopf_gradient_norms = []
    stiffness_traces = []
    stiffness_norms = []
    geometry_minima = []
    frustrated_minima = []

    # Every oriented native edge seeds the degenerate three-dimensional
    # eigenspace.  This gives a finite native orientation audit rather than a
    # random scan or fitted direction.
    for seed in range(e):
        edge_mode = projector[:, seed]
        edge_mode /= np.linalg.norm(edge_mode)
        embedded = np.zeros(190, dtype=complex)
        embedded[o + v : o + v + e] = edge_mode
        z = clock[:, None] * embedded[None, :]
        state = NativeURTState(z, theta.copy(), history.copy())

        energy, gradient_z, gradient_y = dynamics.full_energy_and_gradient(state)
        circulation_energy, circulation_gradient, _ = dynamics.circulation_energy_gradient(z)
        hopf_energy, hopf_gradient, _ = dynamics.hopf_energy_gradient(z)
        sources = dynamics.sources(z)
        curl = edge_mode @ surface.b2

        equilibrium_residuals.append(float(np.linalg.norm(gradient_z - multiplier * z)))
        energies.append(float(energy))
        vertex_gradient_norms.append(float(np.linalg.norm(gradient_z[:, o : o + v])))
        source_norms.append(max(float(np.linalg.norm(value)) for value in sources))
        curl_norm_squared.append(float(np.vdot(curl, curl).real))
        circulation_energies.append(float(circulation_energy))
        circulation_gradient_norms.append(float(np.linalg.norm(circulation_gradient)))
        hopf_gradient_norms.append(float(np.linalg.norm(hopf_gradient)))
        assert np.linalg.norm(gradient_y) < TOL
        assert abs(hopf_energy) < TOL

        # Around a pure edge-curl background the circulation energy has no
        # linear vertex source, but its vertex Hessian is a positive diagonal
        # stiffness.  Unit charge distributes |edge_mode|^2 uniformly over
        # the 24 clock sites, producing the 1/N factor.
        stiffness = np.diag((np.abs(curl) ** 2 @ surface.W.T) / dynamics.N)
        stiffness_eigenvalues = np.linalg.eigvalsh(stiffness)
        assert stiffness_eigenvalues[0] >= -TOL
        stiffness_traces.append(float(np.trace(stiffness).real))
        stiffness_norms.append(float(stiffness_eigenvalues[-1]))
        geometry_minima.append(float(np.linalg.eigvalsh(base_geometry + stiffness)[0]))
        frustrated_minima.append(float(np.linalg.eigvalsh(base_hopf + stiffness)[0]))

    assert max(equilibrium_residuals) < TOL
    assert max(vertex_gradient_norms) < TOL
    assert max(source_norms) < TOL
    assert max(abs(x - lowest) for x in curl_norm_squared) < TOL
    assert max(abs(x) for x in circulation_energies) < TOL
    assert max(circulation_gradient_norms) < TOL
    assert max(hopf_gradient_norms) < TOL
    assert max(abs(x - multiplier / 2.0) for x in energies) < TOL

    geometry_spread = float(max(geometry_minima) - min(geometry_minima))
    frustrated_spread = float(max(frustrated_minima) - min(frustrated_minima))
    assert geometry_spread < TOL
    assert frustrated_spread > TOL

    result = {
        "status": "PASS",
        "lowest_native_coexact_curl": {
            "solid": "icosahedron",
            "eigenvalue": lowest,
            "exact_value": "3-sqrt(5)",
            "multiplicity": multiplicity,
            "clock_mode": clock_index,
            "clock_shift": clock_shift,
            "relative_equilibrium_multiplier": multiplier,
            "fixed_charge_energy": multiplier / 2.0,
            "curl_norm_squared_range": [min(curl_norm_squared), max(curl_norm_squared)],
            "maximum_relative_equilibrium_residual": max(equilibrium_residuals),
        },
        "no_spontaneous_transfer": {
            "maximum_vertex_gradient_norm": max(vertex_gradient_norms),
            "maximum_hidden_source_norm": max(source_norms),
            "maximum_circulation_energy": max(abs(x) for x in circulation_energies),
            "maximum_circulation_gradient_norm": max(circulation_gradient_norms),
            "maximum_hopf_gradient_norm": max(hopf_gradient_norms),
        },
        "vortex_induced_vertex_stiffness": {
            "native_edge_seeds": e,
            "positive_stiffness_trace_range": [min(stiffness_traces), max(stiffness_traces)],
            "positive_stiffness_operator_norm_range": [min(stiffness_norms), max(stiffness_norms)],
            "geometry_vertex_minimum_before": base_geometry_minimum,
            "geometry_vertex_minimum_after_range": [min(geometry_minima), max(geometry_minima)],
            "geometry_orientation_spread": geometry_spread,
            "hopf_vertex_minimum_before": base_hopf_minimum,
            "hopf_plus_curl_minimum_after_range": [min(frustrated_minima), max(frustrated_minima)],
            "hopf_frustration_orientation_split": frustrated_spread,
        },
        "interpretation": (
            "The lowest native coexact curl is a genuine finite-energy vortex carrier, "
            "but at zero vertex density it is an exact nonlinear relative equilibrium "
            "with no hidden/H64 source and no spontaneous stress transfer.  Its first "
            "physical effect is instead a positive vertex stiffness.  The geometric "
            "stiffness is orientation-degenerate, while the existing projective Hopf "
            "frustration splits the 30 native edge-seeded orientations."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
