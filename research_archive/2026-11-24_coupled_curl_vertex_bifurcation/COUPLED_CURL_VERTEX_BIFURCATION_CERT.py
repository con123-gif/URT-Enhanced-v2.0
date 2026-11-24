#!/usr/bin/env python3
"""Fixed-charge vertex/curl bifurcation certificate using native operators.

Tests whether a stress-bearing mixed branch bifurcates from the lowest
icosahedral coexact curl.  Uses the unchanged five-Platonic 190/H64/24
Hopf/circulation action.  No fit, random start, surrogate or metric map.
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


def fixed_total_charge_energy(
    dynamics: FiveSolidHopfURTDynamics,
    theta: np.ndarray,
    clock: np.ndarray,
    direction: np.ndarray,
) -> tuple[float, float, float]:
    """Minimize H64 at fixed z, then rescale so Q_z+2 Q_y=1.

    The native hidden source is quadratic in z, hence y_opt(s z)=s^2 y_opt(z).
    The stable quadratic solution avoids cancellation for small history norm.
    """
    z0 = clock[:, None] * direction[None, :]
    state0 = NativeURTState(z0, theta)
    _, _, y0 = dynamics.reduced_energy_and_gradient(state0)
    history_norm = float(np.vdot(y0, y0).real)
    scale_squared = 2.0 / (1.0 + np.sqrt(1.0 + 8.0 * history_norm))
    scale = np.sqrt(scale_squared)
    z = scale * z0
    reduced, _, y = dynamics.reduced_energy_and_gradient(NativeURTState(z, theta))
    energy = (
        reduced
        + dynamics.hopf_energy_gradient(z)[0]
        + dynamics.circulation_energy_gradient(z)[0]
    )
    charge = float(np.vdot(z, z).real + 2.0 * np.vdot(y, y).real)
    return float(energy), charge, float(np.linalg.norm(y))


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    surface = next(s for s in dynamics.surfaces if s.name == "icosahedron")
    hopf_surface = next(s for s in dynamics.hopf_surfaces if s.name == "icosahedron")
    o, vertices, edges = surface.offset, surface.V, surface.E

    edge_laplacian = surface.b2 @ surface.b2.T
    edge_values, edge_vectors = np.linalg.eigh(edge_laplacian)
    curl_value = float(edge_values[edge_values > TOL][0])
    curl_space = edge_vectors[:, np.abs(edge_values - curl_value) < TOL]
    curl_projector = curl_space @ curl_space.T
    assert curl_space.shape[1] == 3
    assert abs(curl_value - (3.0 - np.sqrt(5.0))) < TOL

    vertex_hessian = dynamics.H[o : o + vertices, o : o + vertices].astype(complex)
    vertex_hessian += (
        hopf_surface.Bq.conj().T @ hopf_surface.Bq
        - hopf_surface.B0.T @ hopf_surface.B0
    )

    n = np.arange(dynamics.N)
    clock_mode = 9
    clock = np.exp(2j * np.pi * clock_mode * n / dynamics.N) / np.sqrt(dynamics.N)
    theta = np.full(dynamics.N, dynamics.golden_angle)
    clock_shift = float(
        dynamics.r**2
        * (
            2.0
            - 2.0
            * np.cos(
                dynamics.golden_angle - 2.0 * np.pi * clock_mode / dynamics.N
            )
        )
    )
    multiplier = curl_value + clock_shift
    pure_curl_energy = multiplier / 2.0

    angles = np.linspace(0.0, np.pi / 2.0, 65)
    constrained_vertex_margins = []
    scan_minima = []
    scan_minimum_indices = []
    first_nonzero_excesses = []
    maximum_charge_residual = 0.0
    maximum_history_norm = 0.0

    for seed in range(edges):
        curl = curl_projector[:, seed]
        curl /= np.linalg.norm(curl)
        face_curl = curl @ surface.b2
        stiffness = np.diag(
            (np.abs(face_curl) ** 2 @ surface.W.T) / dynamics.N
        )
        constrained = vertex_hessian + stiffness - curl_value * np.eye(vertices)
        values, vectors = np.linalg.eigh(constrained)
        constrained_vertex_margins.append(float(values[0]))
        vertex = vectors[:, 0]

        embedded_curl = np.zeros(190, dtype=complex)
        embedded_vertex = np.zeros(190, dtype=complex)
        embedded_curl[o + vertices : o + vertices + edges] = curl
        embedded_vertex[o : o + vertices] = vertex

        path_energies = []
        for angle in angles:
            direction = (
                np.cos(angle) * embedded_curl
                + np.sin(angle) * embedded_vertex
            )
            energy, charge, history_norm = fixed_total_charge_energy(
                dynamics, theta, clock, direction
            )
            path_energies.append(energy)
            maximum_charge_residual = max(maximum_charge_residual, abs(charge - 1.0))
            maximum_history_norm = max(maximum_history_norm, history_norm)
        scan_minima.append(float(min(path_energies)))
        scan_minimum_indices.append(int(np.argmin(path_energies)))
        first_nonzero_excesses.append(float(path_energies[1] - path_energies[0]))

    assert min(constrained_vertex_margins) > TOL
    assert set(scan_minimum_indices) == {0}
    assert min(first_nonzero_excesses) > 0.0
    assert maximum_charge_residual < TOL
    assert max(abs(value - pure_curl_energy) for value in scan_minima) < TOL

    # Full-space directions are lower, but are exactly decoupled from the pure
    # curl at linear order.  Record their constrained curvatures honestly.
    face_harmonic_margin = -curl_value
    history_values = np.linalg.eigvalsh(dynamics.Hbits)
    history_clock = 2.0 - 2.0 * np.cos(
        2.0 * dynamics.golden_angle - 2.0 * np.pi * n / dynamics.N
    )
    history_operator = history_values[:, None] + dynamics.r**2 * history_clock[None, :]
    history_flat_index = int(np.argmin(history_operator))
    history_index, history_clock_mode = np.unravel_index(
        history_flat_index, history_operator.shape
    )
    history_minimum = float(history_operator[history_index, history_clock_mode])
    history_constrained_margin = history_minimum - 2.0 * multiplier
    assert face_harmonic_margin < 0.0
    assert history_constrained_margin < 0.0

    result = {
        "status": "PASS",
        "pure_curl_stationary_point": {
            "curl_eigenvalue": curl_value,
            "clock_mode": clock_mode,
            "clock_shift": clock_shift,
            "charge_multiplier": multiplier,
            "unit_charge_energy": pure_curl_energy,
        },
        "coupled_vertex_curl_bifurcation": {
            "constrained_vertex_margin_range": [
                min(constrained_vertex_margins),
                max(constrained_vertex_margins),
            ],
            "native_edge_seeds": edges,
            "angles_per_seed": int(len(angles)),
            "minimum_angle_index_set": sorted(set(scan_minimum_indices)),
            "minimum_scanned_energy_range": [min(scan_minima), max(scan_minima)],
            "first_nonzero_angle": float(angles[1]),
            "first_nonzero_energy_excess_range": [
                min(first_nonzero_excesses),
                max(first_nonzero_excesses),
            ],
            "maximum_total_charge_residual": maximum_charge_residual,
            "maximum_relaxed_history_norm_on_paths": maximum_history_norm,
        },
        "full_space_saddle_directions": {
            "constant_face_constrained_margin": face_harmonic_margin,
            "minimum_history_operator": history_minimum,
            "minimum_history_clock_mode": int(history_clock_mode),
            "history_constrained_margin": history_constrained_margin,
        },
        "interpretation": (
            "No continuous stress-bearing vertex/curl branch bifurcates from "
            "the lowest pure curl: every coupled constrained vertex margin is "
            "strictly positive, and every deterministic least-stiff path has "
            "its fixed-total-charge minimum at zero vertex amplitude.  The "
            "pure curl is nevertheless a saddle in the full state space because "
            "lower face and H64 charge carriers exist; those sectors are exactly "
            "uncoupled from the zero-density curl at linear order, so they do not "
            "provide spontaneous vortex-to-stress transfer."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
