#!/usr/bin/env python3
"""Native mixed-vortex energy/entropy exchange certificate.

Measures the existing KMS occupation entropy and component-energy exchange
under the full canonical 190/H64/24 Hopf/circulation flow.  No dissipation,
fit, random state, metric map or new thermodynamic law is introduced.
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


def occupation_data(dynamics: FiveSolidHopfURTDynamics, z: np.ndarray):
    vertices = z @ dynamics._V.T
    dvertices = None
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
    entropy = np.sum(
        np.log(4.0)
        - p5 * np.log(p5)
        - (1.0 - p5) * np.log1p(-p5)
    )
    return float(entropy), p5, (face, h3, h5)


def occupation_entropy_rate(
    dynamics: FiveSolidHopfURTDynamics, z: np.ndarray, dz: np.ndarray
):
    vertices = z @ dynamics._V.T
    dvertices = dz @ dynamics._V.T
    face = vertices @ dynamics._face_vertex.T
    dface = dvertices @ dynamics._face_vertex.T
    square = face * face
    dsquare = 2.0 * face * dface
    h3 = square @ dynamics.P3
    h5 = square @ dynamics.P5
    dh3 = dsquare @ dynamics.P3
    dh5 = dsquare @ dynamics.P5
    e3 = 0.25 * np.sum(np.abs(h3) ** 2, axis=1)
    e5 = 0.25 * dynamics.Delta**2 * np.sum(np.abs(h5) ** 2, axis=1)
    de3 = 0.5 * np.real(np.sum(np.conj(h3) * dh3, axis=1))
    de5 = (
        0.5
        * dynamics.Delta**2
        * np.real(np.sum(np.conj(h5) * dh5, axis=1))
    )
    w3 = -dynamics.eta * e3
    w5 = 2.0 * np.log(dynamics.Delta) - dynamics.eta * e5
    top = np.maximum(w3, w5)
    a3 = np.exp(w3 - top)
    a5 = np.exp(w5 - top)
    p5 = a5 / (a3 + a5)
    dp5 = -dynamics.eta * p5 * (1.0 - p5) * (de5 - de3)
    rate = np.sum(np.log((1.0 - p5) / p5) * dp5)
    return float(rate), float(np.linalg.norm(dp5))


def mixed_states(dynamics, native):
    surface = next(s for s in dynamics.surfaces if s.name == "icosahedron")
    hopf_surface = next(s for s in dynamics.hopf_surfaces if s.name == "icosahedron")
    o, vertices, edges = surface.offset, surface.V, surface.E
    edge_laplacian = surface.b2 @ surface.b2.T
    values, vectors = np.linalg.eigh(edge_laplacian)
    lowest = float(values[values > TOL][0])
    curl_space = vectors[:, np.abs(values - lowest) < TOL]
    projector = curl_space @ curl_space.T
    vertex_hessian = dynamics.H[o : o + vertices, o : o + vertices].astype(complex)
    vertex_hessian += (
        hopf_surface.Bq.conj().T @ hopf_surface.Bq
        - hopf_surface.B0.T @ hopf_surface.B0
    )
    n = np.arange(dynamics.N)
    clock = np.exp(2j * np.pi * 9 * n / dynamics.N) / np.sqrt(dynamics.N)
    theta = np.full(dynamics.N, dynamics.golden_angle)
    for seed in range(edges):
        edge = projector[:, seed]
        edge /= np.linalg.norm(edge)
        curl = edge @ surface.b2
        stiffness = np.diag((np.abs(curl) ** 2 @ surface.W.T) / dynamics.N)
        _, vertex_vectors = np.linalg.eigh(vertex_hessian + stiffness)
        vertex = vertex_vectors[:, 0]
        spatial = np.zeros(190, dtype=complex)
        spatial[o : o + vertices] = vertex / np.sqrt(2.0)
        spatial[o + vertices : o + vertices + edges] = edge / np.sqrt(2.0)
        z = clock[:, None] * spatial[None, :]
        y = np.zeros((dynamics.N, dynamics.history_dimension), dtype=complex)
        yield seed, NativeURTState(z, theta.copy(), y)


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    entropy_rates = []
    probability_rate_norms = []
    circulation_rates = []
    hopf_rates = []
    history_accelerations = []
    energy_derivative_residuals = []
    charge_derivative_residuals = []
    states = []

    for _, state in mixed_states(dynamics, native):
        dz, dy = dynamics.hamiltonian_rhs(state)
        entropy_rate, probability_rate_norm = occupation_entropy_rate(
            dynamics, state.z, dz
        )
        _, circulation_gradient, _ = dynamics.circulation_energy_gradient(state.z)
        _, hopf_gradient, _ = dynamics.hopf_energy_gradient(state.z)
        _, full_gradient_z, full_gradient_y = dynamics.full_energy_and_gradient(state)
        entropy_rates.append(entropy_rate)
        probability_rate_norms.append(probability_rate_norm)
        circulation_rates.append(float(np.vdot(circulation_gradient, dz).real))
        hopf_rates.append(float(np.vdot(hopf_gradient, dz).real))
        # y(0)=0 and dy/dt=i*source.  The initial second derivative of ||y||^2
        # is therefore 2||dy||^2: genuine H64 activation, not entropy monotonicity.
        history_accelerations.append(float(2.0 * np.vdot(dy, dy).real))
        energy_derivative_residuals.append(
            float(
                np.vdot(full_gradient_z, dz).real
                + np.vdot(full_gradient_y, dy).real
            )
        )
        charge_derivative_residuals.append(
            float(
                2.0 * np.vdot(state.z, dz).real
                + 4.0 * np.vdot(state.y, dy).real
            )
        )
        states.append(state)

    assert max(entropy_rates) < 0.0
    assert min(circulation_rates) < 0.0 < max(circulation_rates)
    assert min(hopf_rates) < 0.0 < max(hopf_rates)
    assert min(history_accelerations) > 0.0
    assert max(abs(value) for value in energy_derivative_residuals) < TOL
    assert max(abs(value) for value in charge_derivative_residuals) < TOL

    # Native canonical trajectory for the first deterministic edge seed.
    state = states[0]
    dt = 0.002
    steps = 400
    entropies = []
    p5_totals = []
    energies = []
    charges = []
    history_norms = []
    circulation_energies = []
    hopf_energies = []
    for step in range(steps + 1):
        entropy, p5, _ = occupation_data(dynamics, state.z)
        energy, _, _ = dynamics.full_energy_and_gradient(state)
        entropies.append(entropy)
        p5_totals.append(float(np.sum(p5)))
        energies.append(energy)
        charges.append(dynamics.noether_charge(state))
        history_norms.append(float(np.linalg.norm(state.y)))
        circulation_energies.append(dynamics.circulation_energy_gradient(state.z)[0])
        hopf_energies.append(dynamics.hopf_energy_gradient(state.z)[0])
        if step < steps:
            state = dynamics.canonical_step(state, dt).state

    entropy_increments = np.diff(entropies)
    energy_drift = float(np.max(np.abs(np.asarray(energies) - energies[0])))
    charge_drift = float(np.max(np.abs(np.asarray(charges) - charges[0])))
    assert np.count_nonzero(entropy_increments > 0.0) > 0
    assert np.count_nonzero(entropy_increments < 0.0) > 0
    assert energy_drift < TOL
    assert charge_drift < TOL

    result = {
        "status": "PASS",
        "instantaneous_30_orientation_audit": {
            "occupation_entropy_rate_range": [min(entropy_rates), max(entropy_rates)],
            "occupation_probability_rate_norm_range": [
                min(probability_rate_norms),
                max(probability_rate_norms),
            ],
            "circulation_energy_rate_range": [
                min(circulation_rates),
                max(circulation_rates),
            ],
            "hopf_energy_rate_range": [min(hopf_rates), max(hopf_rates)],
            "H64_norm_squared_second_derivative_range": [
                min(history_accelerations),
                max(history_accelerations),
            ],
            "maximum_total_energy_derivative_residual": max(
                abs(value) for value in energy_derivative_residuals
            ),
            "maximum_noether_derivative_residual": max(
                abs(value) for value in charge_derivative_residuals
            ),
        },
        "canonical_trajectory_seed_0": {
            "dt": dt,
            "steps": steps,
            "elapsed_time": dt * steps,
            "entropy_initial": entropies[0],
            "entropy_final": entropies[-1],
            "entropy_range": [min(entropies), max(entropies)],
            "positive_entropy_increments": int(np.count_nonzero(entropy_increments > 0.0)),
            "negative_entropy_increments": int(np.count_nonzero(entropy_increments < 0.0)),
            "p5_total_range": [min(p5_totals), max(p5_totals)],
            "history_norm_final": history_norms[-1],
            "history_norm_maximum": max(history_norms),
            "circulation_energy_range": [
                min(circulation_energies),
                max(circulation_energies),
            ],
            "hopf_energy_range": [min(hopf_energies), max(hopf_energies)],
            "total_energy_drift": energy_drift,
            "noether_charge_drift": charge_drift,
        },
        "interpretation": (
            "A mixed native curl/density state genuinely activates H64 and exchanges "
            "Hopf/circulation energy while total energy and Noether charge are conserved. "
            "However the existing KMS occupation entropy is not monotone: its initial "
            "rate is negative for every native orientation and a forward canonical "
            "trajectory contains both positive and negative entropy increments.  It is "
            "therefore a reversible occupation state function, not by itself a derived "
            "entropy-production or horizon-thermodynamics law."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
