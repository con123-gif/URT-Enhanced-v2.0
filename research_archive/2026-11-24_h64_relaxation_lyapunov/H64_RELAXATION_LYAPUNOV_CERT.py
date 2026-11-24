#!/usr/bin/env python3
"""Certificate for the native positive H64 relaxation semigroup.

The geometry/source is held fixed.  This tests only the already-declared
``relax_history`` map and does not add a metric, temperature, coupling,
stochastic law, or fitted constant.
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


def occupation_entropy(dynamics: FiveSolidHopfURTDynamics, z: np.ndarray) -> float:
    """Existing eight-state KMS occupation entropy; it depends on z, not y."""
    vertices = z @ dynamics._V.T
    face = vertices @ dynamics._face_vertex.T
    square = face * face
    h3 = square @ dynamics.P3
    h5 = square @ dynamics.P5
    e3 = 0.25 * np.sum(np.abs(h3) ** 2, axis=1)
    e5 = 0.25 * dynamics.Delta**2 * np.sum(np.abs(h5) ** 2, axis=1)
    w3 = -dynamics.eta * e3
    w5 = 2.0 * np.log(dynamics.Delta) - dynamics.eta * e5
    top = np.maximum(w3, w5)
    a3 = np.exp(w3 - top)
    a5 = np.exp(w5 - top)
    p5 = a5 / (a3 + a5)
    return float(
        np.sum(
            np.log(4.0)
            - p5 * np.log(p5)
            - (1.0 - p5) * np.log1p(-p5)
        )
    )


def mixed_states(dynamics: FiveSolidHopfURTDynamics):
    """Thirty deterministic equal-norm icosahedral vertex/curl sources."""
    surface = next(s for s in dynamics.surfaces if s.name == "icosahedron")
    hopf_surface = next(s for s in dynamics.hopf_surfaces if s.name == "icosahedron")
    offset, vertices, edges = surface.offset, surface.V, surface.E
    edge_laplacian = surface.b2 @ surface.b2.T
    values, vectors = np.linalg.eigh(edge_laplacian)
    lowest = float(values[values > TOL][0])
    curl_space = vectors[:, np.abs(values - lowest) < TOL]
    projector = curl_space @ curl_space.T
    vertex_hessian = dynamics.H[
        offset : offset + vertices, offset : offset + vertices
    ].astype(complex)
    vertex_hessian += (
        hopf_surface.Bq.conj().T @ hopf_surface.Bq
        - hopf_surface.B0.T @ hopf_surface.B0
    )
    clock_index = np.arange(dynamics.N)
    clock = (
        np.exp(2j * np.pi * 9 * clock_index / dynamics.N)
        / np.sqrt(dynamics.N)
    )
    theta = np.full(dynamics.N, dynamics.golden_angle)
    for seed in range(edges):
        edge = projector[:, seed]
        edge /= np.linalg.norm(edge)
        curl = edge @ surface.b2
        stiffness = np.diag((np.abs(curl) ** 2 @ surface.W.T) / dynamics.N)
        _, vertex_vectors = np.linalg.eigh(vertex_hessian + stiffness)
        vertex = vertex_vectors[:, 0]
        spatial = np.zeros(190, dtype=complex)
        spatial[offset : offset + vertices] = vertex / np.sqrt(2.0)
        spatial[offset + vertices : offset + vertices + edges] = (
            edge / np.sqrt(2.0)
        )
        z = clock[:, None] * spatial[None, :]
        y = np.zeros((dynamics.N, dynamics.history_dimension), dtype=complex)
        yield seed, NativeURTState(z, theta.copy(), y)


def apply_history_operator(
    dynamics: FiveSolidHopfURTDynamics,
    clock_laplacian: np.ndarray,
    value: np.ndarray,
) -> np.ndarray:
    return value @ dynamics.Hbits.T + dynamics.r**2 * (clock_laplacian @ value)


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    theta = np.full(dynamics.N, dynamics.golden_angle)
    clock_laplacian = dynamics.clock_laplacian(theta, 2)
    history_spectrum = (
        np.linalg.eigvalsh(dynamics.Hbits)[:, None]
        + dynamics.r**2 * np.linalg.eigvalsh(clock_laplacian)[None, :]
    ).ravel()
    lambda_min = float(np.min(history_spectrum))
    lambda_max = float(np.max(history_spectrum))
    assert lambda_min > 0.0

    initial_gaps = []
    initial_dissipations = []
    effective_decay_rates = []
    yopt_norms = []
    seed_zero = None

    for seed, state in mixed_states(dynamics):
        _, _, yopt = dynamics.reduced_energy_and_gradient(state)
        error = state.y - yopt
        applied = apply_history_operator(dynamics, clock_laplacian, error)
        gap = 0.5 * float(np.vdot(error, applied).real)
        dissipation = float(np.vdot(applied, applied).real)
        assert gap > 0.0
        assert dissipation >= 2.0 * lambda_min * gap - TOL
        initial_gaps.append(gap)
        initial_dissipations.append(dissipation)
        effective_decay_rates.append(dissipation / gap)
        yopt_norms.append(float(np.linalg.norm(yopt)))
        if seed == 0:
            seed_zero = (state, yopt, gap)

    assert seed_zero is not None
    state, yopt, gap_zero = seed_zero
    entropy_zero = occupation_entropy(dynamics, state.z)
    times = np.linspace(0.0, 0.2, 101)
    gaps = []
    dissipations = []
    entropy_changes = []
    energy_identity_residuals = []
    bound_excesses = []
    equilibrium_state = NativeURTState(state.z, state.theta, yopt)
    equilibrium_energy = dynamics.full_energy_and_gradient(equilibrium_state)[0]

    for time in times:
        y = dynamics.relax_history(state, state.y, float(time))
        error = y - yopt
        applied = apply_history_operator(dynamics, clock_laplacian, error)
        gap = 0.5 * float(np.vdot(error, applied).real)
        dissipation = float(np.vdot(applied, applied).real)
        energy = dynamics.full_energy_and_gradient(
            NativeURTState(state.z, state.theta, y)
        )[0]
        gaps.append(gap)
        dissipations.append(dissipation)
        entropy_changes.append(occupation_entropy(dynamics, state.z) - entropy_zero)
        energy_identity_residuals.append(abs((energy - equilibrium_energy) - gap))
        bound_excesses.append(
            gap - gap_zero * np.exp(-2.0 * lambda_min * float(time))
        )

    gaps = np.asarray(gaps)
    dissipations = np.asarray(dissipations)
    assert np.max(np.diff(gaps)) <= TOL
    assert np.max(bound_excesses) <= TOL
    assert max(energy_identity_residuals) < TOL
    assert max(abs(value) for value in entropy_changes) < TOL

    # The semigroup's analytic derivative is dF/dt=-||A e||^2.  Compare it
    # with centered finite differences away from the endpoints.
    dt = float(times[1] - times[0])
    numerical_derivative = (gaps[2:] - gaps[:-2]) / (2.0 * dt)
    derivative_relative_residual = np.max(
        np.abs(numerical_derivative + dissipations[1:-1])
        / np.maximum(dissipations[1:-1], 1.0e-300)
    )
    assert derivative_relative_residual < 2.0e-3

    sample_indices = [0, 5, 25, 50, 100]
    result = {
        "status": "PASS",
        "operator": {
            "dimension": int(dynamics.N * dynamics.history_dimension),
            "lambda_min": lambda_min,
            "lambda_max": lambda_max,
            "global_gap_decay_rate_lower_bound": 2.0 * lambda_min,
        },
        "thirty_orientation_audit": {
            "yopt_norm_range": [min(yopt_norms), max(yopt_norms)],
            "initial_energy_gap_range": [min(initial_gaps), max(initial_gaps)],
            "initial_dissipation_range": [
                min(initial_dissipations),
                max(initial_dissipations),
            ],
            "effective_energy_decay_rate_range": [
                min(effective_decay_rates),
                max(effective_decay_rates),
            ],
        },
        "seed_0_trajectory": {
            "samples": [
                {
                    "time": float(times[index]),
                    "energy_gap": float(gaps[index]),
                    "dissipation": float(dissipations[index]),
                    "gap_fraction": float(gaps[index] / gaps[0]),
                }
                for index in sample_indices
            ],
            "maximum_energy_identity_residual": max(energy_identity_residuals),
            "maximum_spectral_bound_excess": max(bound_excesses),
            "maximum_occupation_entropy_change": max(
                abs(value) for value in entropy_changes
            ),
            "centered_derivative_relative_residual": float(
                derivative_relative_residual
            ),
        },
        "interpretation": (
            "At fixed geometry/source, the native H64 relaxation has the exact "
            "quadratic Lyapunov gap F=1/2<e,Ae> with dF/dt=-<e,A^2e>. "
            "The existing KMS occupation entropy is unchanged because it depends "
            "only on z.  This is a positive energy-dissipation certificate, not "
            "a thermodynamic entropy-production or horizon law."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
