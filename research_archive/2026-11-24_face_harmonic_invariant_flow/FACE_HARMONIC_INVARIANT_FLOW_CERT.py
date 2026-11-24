#!/usr/bin/env python3
"""Exact/numeric invariant-flow certificate for the native face harmonic.

The previous gauge-reduced certificate found one all-five constant-face
harmonic.  This certificate tests the full nonlinear canonical
Hopf/circulation/H64 dynamics.  It adds no operator, coupling, fit, random
state or scalar-to-metric identification.
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


def joined_quadratic_hessian(dynamics: FiveSolidHopfURTDynamics) -> np.ndarray:
    hessian = dynamics.H.astype(complex).copy()
    for surface in dynamics.hopf_surfaces:
        o, v = surface.offset, surface.V
        hessian[o : o + v, o : o + v] += (
            surface.Bq.conj().T @ surface.Bq - surface.B0.T @ surface.B0
        )
    return hessian


def constant_face_harmonic(native: dict) -> np.ndarray:
    """Canonical positive representative of the equal-block face harmonic."""
    harmonic = np.zeros(190, dtype=complex)
    for geometry in native["geom"].values():
        o = int(geometry["offset"])
        v = int(geometry["V"])
        e = int(geometry["E"])
        f = int(geometry["F"])
        harmonic[o + v + e : o + v + e + f] = 1.0 / np.sqrt(5.0 * f)
    assert abs(np.vdot(harmonic, harmonic).real - 1.0) < TOL
    return harmonic


def exact_edge_basis(native: dict) -> np.ndarray:
    columns = []
    for geometry in native["geom"].values():
        o = int(geometry["offset"])
        v = int(geometry["V"])
        e = int(geometry["E"])
        b1 = np.asarray(geometry["b1"], dtype=float)
        differences = np.zeros((v, v - 1))
        differences[np.arange(v - 1), np.arange(v - 1)] = 1.0
        differences[-1, :] = -1.0
        embedded = np.zeros((190, v - 1))
        embedded[o + v : o + v + e] = b1.T @ differences
        columns.append(embedded)
    return np.column_stack(columns)


def first_stress_mode(native: dict, hessian: np.ndarray) -> tuple[float, np.ndarray]:
    gauge = exact_edge_basis(native)
    complete_q = np.linalg.qr(gauge, mode="complete")[0]
    q_physical = complete_q[:, gauge.shape[1] :]
    reduced = q_physical.conj().T @ hessian @ q_physical
    eigenvalues, eigenvectors = np.linalg.eigh(reduced)
    positive = int(np.flatnonzero(eigenvalues > TOL)[0])
    mode = q_physical @ eigenvectors[:, positive]
    mode -= constant_face_harmonic(native) * np.vdot(constant_face_harmonic(native), mode)
    mode /= np.linalg.norm(mode)
    return float(eigenvalues[positive]), mode


def rk4_linear(amplitude: np.ndarray, generator: np.ndarray, dt: float) -> np.ndarray:
    def rhs(value: np.ndarray) -> np.ndarray:
        return -1j * (generator @ value)

    k1 = rhs(amplitude)
    k2 = rhs(amplitude + dt * k1 / 2.0)
    k3 = rhs(amplitude + dt * k2 / 2.0)
    k4 = rhs(amplitude + dt * k3)
    return amplitude + dt * (k1 + 2.0 * k2 + 2.0 * k3 + k4) / 6.0


def main() -> None:
    native = runpy.run_path(str(ROOT / ARCHIVE_RELATIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    hessian = joined_quadratic_hessian(dynamics)
    harmonic = constant_face_harmonic(native)
    gap, stress_mode = first_stress_mode(native, hessian)

    # Structural support checks.  Every nonlinear native readout uses vertices
    # and/or edges; the harmonic has faces only.
    hessian_residual = float(np.linalg.norm(hessian @ harmonic))
    source_probe = np.broadcast_to(harmonic, (dynamics.N, 190)).copy()
    source_norms = [float(np.linalg.norm(x)) for x in dynamics.sources(source_probe)]
    circulation_energy, circulation_gradient, _ = dynamics.circulation_energy_gradient(source_probe)
    hopf_energy, hopf_gradient, _ = dynamics.hopf_energy_gradient(source_probe)
    assert hessian_residual < TOL
    assert max(source_norms) < TOL
    assert abs(circulation_energy) < TOL
    assert np.linalg.norm(circulation_gradient) < TOL
    assert abs(hopf_energy) < TOL
    assert np.linalg.norm(hopf_gradient) < TOL

    n = np.arange(dynamics.N)
    clock9 = np.exp(2j * np.pi * 9 * n / dynamics.N) / np.sqrt(dynamics.N)
    clock4 = np.exp(2j * np.pi * 4 * n / dynamics.N) / np.sqrt(dynamics.N)
    amplitude = 0.31 * clock9 + 0.17 * clock4
    stress = 0.23 * clock9[:, None] * stress_mode[None, :]

    # A deterministic nonzero H64 state verifies that history backreaction
    # also cannot see the face harmonic.
    hvals, hvecs = np.linalg.eigh(dynamics.Hbits)
    clock3 = np.exp(2j * np.pi * 3 * n / dynamics.N) / np.sqrt(dynamics.N)
    history = 0.11 * clock3[:, None] * hvecs[:, 0][None, :]
    theta = np.full(dynamics.N, dynamics.golden_angle)
    zero_history = np.zeros_like(history)
    state_other = NativeURTState(stress.copy(), theta.copy(), history.copy())
    state_with = NativeURTState(
        stress + amplitude[:, None] * harmonic[None, :],
        theta.copy(),
        history.copy(),
    )
    state_harmonic = NativeURTState(
        amplitude[:, None] * harmonic[None, :], theta.copy(), zero_history
    )

    energy_other, gradient_other, history_gradient_other = dynamics.full_energy_and_gradient(state_other)
    energy_with, gradient_with, history_gradient_with = dynamics.full_energy_and_gradient(state_with)
    energy_harmonic, _, _ = dynamics.full_energy_and_gradient(state_harmonic)
    l1 = dynamics.clock_laplacian(theta, 1)
    harmonic_generator = dynamics.r**2 * l1
    expected_harmonic_gradient = harmonic_generator @ amplitude
    projected_gradient = gradient_with @ harmonic.conj()
    projection_residual = float(np.linalg.norm(projected_gradient - expected_harmonic_gradient))
    other_gradient_residual = float(
        np.linalg.norm(
            gradient_with
            - expected_harmonic_gradient[:, None] * harmonic[None, :]
            - gradient_other
        )
    )
    history_gradient_residual = float(np.linalg.norm(history_gradient_with - history_gradient_other))
    energy_mixed_residual = float(abs(energy_with - energy_other - energy_harmonic))
    modal_norm_derivative = float(
        2.0
        * np.real(
            np.vdot(amplitude, -1j * projected_gradient)
        )
    )
    assert projection_residual < TOL
    assert other_gradient_residual < TOL
    assert history_gradient_residual < TOL
    assert energy_mixed_residual < TOL
    assert abs(modal_norm_derivative) < TOL

    # Flow-level certificate: the full nonlinear trajectory with the harmonic
    # equals the trajectory without it plus its independently evolved linear
    # clock amplitude.  Thus no energy is transferred into the stress sector.
    dt = 1.0e-3
    steps = 120
    with_flow = state_with
    other_flow = state_other
    amp_flow = amplitude.copy()
    max_stress_trajectory_residual = 0.0
    max_history_trajectory_residual = 0.0
    for _ in range(steps):
        with_flow = dynamics.canonical_step(with_flow, dt).state
        other_flow = dynamics.canonical_step(other_flow, dt).state
        amp_flow = rk4_linear(amp_flow, harmonic_generator, dt)
        residual = (
            with_flow.z
            - amp_flow[:, None] * harmonic[None, :]
            - other_flow.z
        )
        max_stress_trajectory_residual = max(
            max_stress_trajectory_residual, float(np.linalg.norm(residual))
        )
        max_history_trajectory_residual = max(
            max_history_trajectory_residual,
            float(np.linalg.norm(with_flow.y - other_flow.y)),
        )

    initial_modal_norm = float(np.vdot(amplitude, amplitude).real)
    final_modal_norm = float(
        np.vdot(with_flow.z @ harmonic.conj(), with_flow.z @ harmonic.conj()).real
    )
    modal_norm_drift = float(abs(final_modal_norm - initial_modal_norm))
    assert max_stress_trajectory_residual < TOL
    assert max_history_trajectory_residual < TOL
    assert modal_norm_drift < TOL

    result = {
        "status": "PASS",
        "classification": (
            "exact invariant linear face-harmonic sector, not a symplectic Casimir"
        ),
        "structural_annihilation": {
            "joined_hessian_norm": hessian_residual,
            "source_norms_f_h3_h5": source_norms,
            "circulation_energy": circulation_energy,
            "circulation_gradient_norm": float(np.linalg.norm(circulation_gradient)),
            "hopf_energy": hopf_energy,
            "hopf_gradient_norm": float(np.linalg.norm(hopf_gradient)),
        },
        "nonlinear_separation": {
            "first_stress_gap": gap,
            "harmonic_gradient_projection_residual": projection_residual,
            "nonharmonic_gradient_residual": other_gradient_residual,
            "history_gradient_residual": history_gradient_residual,
            "mixed_energy_residual": energy_mixed_residual,
            "harmonic_norm_time_derivative": modal_norm_derivative,
        },
        "rk4_flow_check": {
            "dt": dt,
            "steps": steps,
            "elapsed_time": dt * steps,
            "maximum_stress_trajectory_residual": max_stress_trajectory_residual,
            "maximum_history_trajectory_residual": max_history_trajectory_residual,
            "harmonic_modal_norm_initial": initial_modal_norm,
            "harmonic_modal_norm_final": final_modal_norm,
            "harmonic_modal_norm_drift": modal_norm_drift,
        },
        "interpretation": (
            "The native all-five face harmonic is an exactly decoupled linear "
            "clock sector of the full Hopf/circulation/H64 Hamiltonian.  Its "
            "modal norm is conserved and it cannot transfer energy into the "
            "gapped stress-bearing mode.  Canonical symplectic dynamics has no "
            "nontrivial Casimir here; the obstruction is support-based invariant "
            "sector decoupling."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
