#!/usr/bin/env python3
"""Certificate for the native hidden-source -> 13-cell stress interface.

This test uses the unchanged five-Platonic 190-cochain / H64 / 24-clock
construction.  It does not identify a scalar with a metric and introduces no
fit constants.  It asks the narrower question whether the original hidden
P3+P5 source has a direct canonical readout through the native icosahedral
face-to-vertex incidence C^T into the 1+3+5+3 decomposition of the 12 vertex
cells (with the clock scalar giving the thirteenth cell).
"""
from __future__ import annotations

import json
import os
from pathlib import Path
import runpy
import sys

import numpy as np
import sympy as sp


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
ARCHIVE = ROOT / ARCHIVE_RELATIVE
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from cathedral_core.native_urt import NativeURTEngine  # noqa: E402
TOL = 1.0e-10


def numerical_rank(a: np.ndarray, tol: float = TOL) -> int:
    """Absolute-tolerance rank, appropriate for exact-zero certificates."""
    singular = np.linalg.svd(np.asarray(a, dtype=float), compute_uv=False)
    return int(np.count_nonzero(singular > tol))


def orthogonal_projector(columns: np.ndarray) -> np.ndarray:
    q, r = np.linalg.qr(np.asarray(columns, dtype=float))
    rank = int(np.count_nonzero(np.abs(np.diag(r)) > TOL))
    return q[:, :rank] @ q[:, :rank].T


def main() -> None:
    # The archived native constructor opens auxiliary paths relative to the\n    # repository root. CI executes research checks from their script folder.\n    # Preserve the archive unchanged and restore cwd after construction.\n    old_cwd = Path.cwd()\n    try:\n        os.chdir(ROOT)\n        native = runpy.run_path(str(ARCHIVE))\n    finally:\n        os.chdir(old_cwd)
    engine = NativeURTEngine(native)

    # Reconstruct the hidden projectors exactly from the native integer
    # incidence and face Laplacian.  This avoids treating rounded floating
    # arrays as an exact proof.
    c_exact = sp.Matrix(np.rint(engine.C).astype(int).tolist())
    l_exact = sp.Matrix(np.rint(np.asarray(native["Lface"])).astype(int).tolist())
    eye20 = sp.eye(20)
    p_hidden_exact = eye20 - c_exact * (c_exact.T * c_exact).inv() * c_exact.T
    p3_exact = p_hidden_exact * (5 * eye20 - l_exact) / 2
    p5_exact = p_hidden_exact * (l_exact - 3 * eye20) / 2

    assert p_hidden_exact.rank() == 8
    assert p3_exact.rank() == 4
    assert p5_exact.rank() == 4
    assert c_exact.T * p3_exact == sp.zeros(12, 20)
    assert c_exact.T * p5_exact == sp.zeros(12, 20)

    p3_float = np.asarray(p3_exact, dtype=float)
    p5_float = np.asarray(p5_exact, dtype=float)
    p3_error = float(np.linalg.norm(engine.P3 - p3_float, ord=2))
    p5_error = float(np.linalg.norm(engine.P5 - p5_float, ord=2))
    assert max(p3_error, p5_error) < TOL

    # The actual all-five vertex map used by NativeURTEngine.sources().
    face_vertex = engine.C @ engine.Q
    assert face_vertex.shape == (20, 50)
    assert numerical_rank(face_vertex) == 8

    # Span every symmetric quadratic vertex monomial.  The nonlinear source
    # really occupies all four P3 and all four P5 directions.
    source3_columns = []
    source5_columns = []
    for a in range(50):
        for b in range(a, 50):
            face_product = face_vertex[:, a] * face_vertex[:, b]
            source3_columns.append(engine.P3 @ face_product)
            source5_columns.append(engine.P5 @ face_product)
    source3_span = np.column_stack(source3_columns)
    source5_span = np.column_stack(source5_columns)
    hidden_span = np.vstack((source3_span, source5_span))
    assert numerical_rank(source3_span) == 4
    assert numerical_rank(source5_span) == 4
    assert numerical_rank(hidden_span) == 8

    # Direct native face-to-vertex adjoint.  Delta is the existing native
    # coefficient, not a fitted portal.  Exact annihilation follows separately
    # for each hidden irrep, so it is independent of Delta.
    stress_span = engine.C.T @ (source3_span + engine.Delta * source5_span)
    stress_norm = float(np.linalg.norm(stress_span, ord=2))
    stress_rank = numerical_rank(stress_span)
    assert stress_rank == 0
    assert stress_norm < TOL

    # Resolve the 12 icosahedral vertices into the original shell channels:
    # scalar 1, coordinate vector 3, symmetric-traceless quadratic 5, residual
    # 3.  This is a representation audit, not a metric identification.
    points = np.asarray(native["geom"]["icosahedron"]["points"], dtype=float)
    points = points - points.mean(axis=0, keepdims=True)
    scalar = np.ones((12, 1))
    stf = np.column_stack(
        (
            points[:, 0] ** 2 - points[:, 2] ** 2,
            points[:, 1] ** 2 - points[:, 2] ** 2,
            points[:, 0] * points[:, 1],
            points[:, 0] * points[:, 2],
            points[:, 1] * points[:, 2],
        )
    )
    p_scalar = orthogonal_projector(scalar)
    p_vector = orthogonal_projector(points)
    p_stf = orthogonal_projector(stf)
    p_residual = np.eye(12) - p_scalar - p_vector - p_stf
    shell_projectors = {
        "scalar_1": p_scalar,
        "vector_3": p_vector,
        "stf_5": p_stf,
        "residual_3": p_residual,
    }
    shell_ranks = {}
    shell_norms = {}
    for name, projector in shell_projectors.items():
        projected = projector @ stress_span
        shell_ranks[name] = numerical_rank(projected)
        shell_norms[name] = float(np.linalg.norm(projected, ord=2))
        assert shell_ranks[name] == 0

    # The positive source occupation is quartic in a vertex amplitude because
    # f is linear and h3/h5 are quadratic.  Find a deterministic native vertex
    # direction with maximal coefficient and verify t^4 homogeneity.
    quartic_coefficients = []
    for basis in range(50):
        f = face_vertex[:, basis]
        h = f * f
        h3 = h @ engine.P3
        h5 = h @ engine.P5
        coefficient = 0.25 * (
            np.vdot(h3, h3).real + engine.Delta**2 * np.vdot(h5, h5).real
        )
        quartic_coefficients.append(float(coefficient))
    selected_basis = int(np.argmax(quartic_coefficients))
    coefficient = quartic_coefficients[selected_basis]
    assert coefficient > TOL
    scaling_residuals = {}
    f0 = face_vertex[:, selected_basis]
    for amplitude in (0.5, 1.0, 2.0):
        h = (amplitude * f0) ** 2
        h3 = h @ engine.P3
        h5 = h @ engine.P5
        energy = 0.25 * (
            np.vdot(h3, h3).real + engine.Delta**2 * np.vdot(h5, h5).real
        )
        expected = coefficient * amplitude**4
        scaling_residuals[str(amplitude)] = float(abs(energy - expected))
        assert abs(energy - expected) < TOL

    result = {
        "status": "PASS",
        "native_dimensions": {
            "cochains": 190,
            "history": 64,
            "clock": 24,
            "vertices_all_five": 50,
            "icosa_faces": 20,
            "icosa_vertices": 12,
        },
        "exact_hidden_projectors": {
            "rank_hidden": int(p_hidden_exact.rank()),
            "rank_P3": int(p3_exact.rank()),
            "rank_P5": int(p5_exact.rank()),
            "C_transpose_P3_exact_zero": True,
            "C_transpose_P5_exact_zero": True,
            "repository_P3_operator_error": p3_error,
            "repository_P5_operator_error": p5_error,
        },
        "quadratic_hidden_source": {
            "symmetric_vertex_monomials": int(source3_span.shape[1]),
            "rank_P3_image": numerical_rank(source3_span),
            "rank_P5_image": numerical_rank(source5_span),
            "rank_joint_image": numerical_rank(hidden_span),
        },
        "direct_13_cell_readout": {
            "rank": stress_rank,
            "operator_norm": stress_norm,
            "shell_ranks": shell_ranks,
            "shell_norms": shell_norms,
        },
        "source_energy_onset": {
            "order_in_vertex_amplitude": 4,
            "selected_native_vertex_basis": selected_basis,
            "quartic_coefficient": coefficient,
            "scaling_residuals": scaling_residuals,
            "quadratic_hessian_contribution_at_zero": 0,
        },
        "interpretation": (
            "The original hidden source is nontrivial, but the direct native "
            "C^T interface into every 1+3+5+3 vertex/stress channel vanishes. "
            "Its source energy begins at quartic order, so it supplies no "
            "linear weak-field spin-2 response about z=0."
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
