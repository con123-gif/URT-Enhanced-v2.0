#!/usr/bin/env python3
"""Gauge-reduced all-five Hopf/circulation weak-background certificate.

Uses the repository-native 190/H64/24 action, exact-edge incidence quotient,
and the existing projective Hopf replacement.  The circulation term is
quartic and therefore has zero vacuum Hessian.  No scalar-to-metric map,
fitted coefficient, random state or surrogate matrix is introduced.
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


ARCHIVE = ROOT / ARCHIVE_RELATIVE
TOL = 1.0e-10


def numerical_rank(array: np.ndarray, tol: float = TOL) -> int:
    singular = np.linalg.svd(np.asarray(array), compute_uv=False)
    return int(np.count_nonzero(singular > tol))


def exact_edge_basis(native: dict) -> np.ndarray:
    columns = []
    for geometry in native["geom"].values():
        offset = int(geometry["offset"])
        vertices = int(geometry["V"])
        edges = int(geometry["E"])
        b1 = np.asarray(geometry["b1"], dtype=float)
        differences = np.zeros((vertices, vertices - 1))
        differences[np.arange(vertices - 1), np.arange(vertices - 1)] = 1.0
        differences[-1, :] = -1.0
        embedded = np.zeros((190, vertices - 1))
        embedded[offset + vertices : offset + vertices + edges] = b1.T @ differences
        columns.append(embedded)
    result = np.column_stack(columns)
    assert result.shape == (190, 45)
    assert numerical_rank(result) == 45
    return result


def joined_quadratic_hessian(dynamics: FiveSolidHopfURTDynamics) -> np.ndarray:
    """Vacuum Hessian: original H plus the existing Hopf replacement.

    The native circulation feedback is quartic in z and contributes exactly
    zero to this vacuum Hessian.
    """
    hessian = dynamics.H.astype(complex).copy()
    for surface in dynamics.hopf_surfaces:
        offset, vertices = surface.offset, surface.V
        hessian[offset : offset + vertices, offset : offset + vertices] += (
            surface.Bq.conj().T @ surface.Bq - surface.B0.T @ surface.B0
        )
    return hessian


def stf_projector(points: np.ndarray) -> np.ndarray:
    points = np.asarray(points, dtype=float)
    points = points - points.mean(axis=0, keepdims=True)
    basis = np.column_stack(
        (
            points[:, 0] ** 2 - points[:, 2] ** 2,
            points[:, 1] ** 2 - points[:, 2] ** 2,
            points[:, 0] * points[:, 1],
            points[:, 0] * points[:, 2],
            points[:, 1] * points[:, 2],
        )
    )
    return basis @ np.linalg.inv(basis.T @ basis) @ basis.T


def main() -> None:
    native = runpy.run_path(str(ARCHIVE))
    dynamics = FiveSolidHopfURTDynamics(native)
    gauge = exact_edge_basis(native)

    # A complete QR supplies the orthogonal projector onto the canonical
    # quotient.  Spectra are basis-independent; no physical matrix is fitted.
    complete_q = np.linalg.qr(gauge, mode="complete")[0]
    q_gauge = complete_q[:, :45]
    q_physical = complete_q[:, 45:]
    assert q_physical.shape == (190, 145)
    assert np.linalg.norm(q_gauge.conj().T @ q_physical, ord=2) < TOL

    hessian = joined_quadratic_hessian(dynamics)
    hermitian_residual = float(np.linalg.norm(hessian - hessian.conj().T, ord=2))
    gauge_residual = float(np.linalg.norm(hessian @ q_gauge, ord=2))
    assert hermitian_residual < TOL
    assert gauge_residual < TOL

    reduced = q_physical.conj().T @ hessian @ q_physical
    eigenvalues, eigenvectors = np.linalg.eigh(reduced)
    nullity = int(np.count_nonzero(np.abs(eigenvalues) < TOL))
    negative_count = int(np.count_nonzero(eigenvalues < -TOL))
    first_gap = float(eigenvalues[nullity])
    assert nullity == 1
    assert negative_count == 0
    assert abs(first_gap - 0.3309858237944337) < TOL

    harmonic = q_physical @ eigenvectors[:, 0]
    harmonic *= np.exp(-1j * np.angle(harmonic[np.argmax(np.abs(harmonic))]))
    sector_norms = {"vertices": 0.0, "edges": 0.0, "faces": 0.0}
    face_blocks = {}
    for name, geometry in native["geom"].items():
        offset = int(geometry["offset"])
        vertices = int(geometry["V"])
        edges = int(geometry["E"])
        faces = int(geometry["F"])
        vertex = harmonic[offset : offset + vertices]
        edge = harmonic[offset + vertices : offset + vertices + edges]
        face = harmonic[offset + vertices + edges : offset + vertices + edges + faces]
        sector_norms["vertices"] += float(np.vdot(vertex, vertex).real)
        sector_norms["edges"] += float(np.vdot(edge, edge).real)
        sector_norms["faces"] += float(np.vdot(face, face).real)
        face_blocks[name] = {
            "mean_real": float(face.mean().real),
            "constant_residual": float(np.linalg.norm(face - face.mean())),
            "block_norm": float(np.linalg.norm(face)),
        }
        assert face_blocks[name]["constant_residual"] < TOL
        assert abs(face_blocks[name]["block_norm"] - 1.0 / np.sqrt(5.0)) < TOL
    assert sector_norms["vertices"] < TOL
    assert sector_norms["edges"] < TOL
    assert abs(sector_norms["faces"] - 1.0) < TOL

    # The golden clock still selects m=9.  The face harmonic is an exact
    # relative equilibrium of the full nonlinear Hopf/circulation action,
    # because every nonlinear source reads vertices and/or edge curl.
    clock_indices = np.arange(dynamics.N)
    ell1 = 2.0 - 2.0 * np.cos(
        dynamics.golden_angle - 2.0 * np.pi * clock_indices / dynamics.N
    )
    clock_mode = int(np.argmin(ell1))
    multiplier = float(dynamics.r**2 * ell1[clock_mode])
    clock_phase = np.exp(2j * np.pi * clock_mode * clock_indices / dynamics.N)
    z = clock_phase[:, None] * harmonic[None, :] / np.sqrt(dynamics.N)
    y = np.zeros((dynamics.N, dynamics.history_dimension), dtype=complex)
    state = NativeURTState(z, np.full(dynamics.N, dynamics.golden_angle), y)
    energy, gradient_z, gradient_y = dynamics.full_energy_and_gradient(state)
    equilibrium_residual = float(np.linalg.norm(gradient_z - multiplier * z))
    circulation_energy = float(dynamics.circulation_energy_gradient(z)[0])
    hopf_energy = float(dynamics.hopf_energy_gradient(z)[0])
    source_norms = [float(np.linalg.norm(value)) for value in dynamics.sources(z)]
    current_curl_norms = {
        name: float(np.linalg.norm(pair[1]))
        for name, pair in dynamics.hopf_edge_currents(z).items()
    }
    assert clock_mode == 9
    assert abs(dynamics.noether_charge(state) - 1.0) < TOL
    assert abs(energy - multiplier / 2.0) < TOL
    assert equilibrium_residual < TOL
    assert np.linalg.norm(gradient_y) < TOL
    assert abs(circulation_energy) < TOL
    assert abs(hopf_energy) < TOL
    assert max(source_norms) < TOL
    assert max(current_curl_norms.values()) < TOL

    # Characterize the first stress-bearing excitation without promoting it
    # to the selected ground state.
    excited = q_physical @ eigenvectors[:, nullity]
    vertex_all = np.concatenate(
        [
            excited[int(g["offset"]) : int(g["offset"]) + int(g["V"])]
            for g in native["geom"].values()
        ]
    )
    face_field = dynamics._face_vertex @ vertex_all
    squared = face_field * face_field
    h3 = dynamics.P3 @ squared
    h5 = dynamics.P5 @ squared
    icosahedron = native["geom"]["icosahedron"]
    io = int(icosahedron["offset"])
    iv = int(icosahedron["V"])
    icosa_vertex = excited[io : io + iv]
    projector = stf_projector(np.asarray(icosahedron["points"]))
    icosa_stf_norm = float(np.linalg.norm(projector @ icosa_vertex))
    icosa_vertex_norm = float(np.linalg.norm(icosa_vertex))
    assert np.linalg.norm(vertex_all) > 1.0 - TOL
    assert np.linalg.norm(h3) > TOL
    assert np.linalg.norm(h5) > TOL
    assert icosa_stf_norm > TOL

    result = {
        "status": "PASS",
        "gauge_reduction": {
            "original_dimension": 190,
            "exact_edge_gauge_dimension": 45,
            "reduced_dimension": 145,
            "hermitian_residual": hermitian_residual,
            "gauge_annihilation_residual": gauge_residual,
        },
        "joined_hopf_circulation_vacuum_spectrum": {
            "negative_modes": negative_count,
            "nullity_after_gauge_quotient": nullity,
            "first_positive_gap": first_gap,
            "circulation_vacuum_hessian_rank": 0,
        },
        "remaining_zero_mode": {
            "sector_norm_squared": sector_norms,
            "constant_face_blocks": face_blocks,
            "clock_mode": clock_mode,
            "fixed_charge_energy": energy,
            "relative_equilibrium_residual": equilibrium_residual,
            "circulation_energy": circulation_energy,
            "hopf_energy": hopf_energy,
            "source_norms_f_h3_h5": source_norms,
            "hopf_current_curl_norms": current_curl_norms,
        },
        "first_stress_bearing_excitation": {
            "gap": first_gap,
            "all_five_vertex_norm": float(np.linalg.norm(vertex_all)),
            "face_field_norm": float(np.linalg.norm(face_field)),
            "hidden_P3_norm": float(np.linalg.norm(h3)),
            "hidden_P5_norm": float(np.linalg.norm(h5)),
            "icosa_vertex_norm": icosa_vertex_norm,
            "icosa_STF_norm": icosa_stf_norm,
            "icosa_STF_fraction": icosa_stf_norm / icosa_vertex_norm,
        },
        "interpretation": (
            "Quotienting the 45 exact-edge gauge modes leaves a stable joined "
            "operator, but its selected nonzero fixed-charge state is a pure "
            "all-five constant-face harmonic.  It carries no stress, hidden "
            "source, vortex current or entropy exchange; the first stress-"
            "bearing mode is gapped and therefore is not a massless spin-2 mode."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
