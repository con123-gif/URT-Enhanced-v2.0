#!/usr/bin/env python3
"""Oriented domain-wall candidate and history-boundary audit for URT.

This target-blind certificate continues the microscopic fermion gate after the
finite-history, determinant-line, Haar and polar no-go results.  It does not
adopt a new physical axiom.  Instead it tests the strongest standard candidate:
use a Wilson--domain-wall regulator for the A4 root symbol and try to identify
the already-defined recursive history direction with the wall direction.

The calculation has four parts:

1. prove that the 60-state history carrier consists of twelve closed
   pentagons and has no nontrivial local A5-invariant boundary projector;
2. cut one edge per pentagon and verify that this creates open chains only by
   breaking A5 covariance and erasing the fifth Wilson trace;
3. add an independent wall coordinate and verify the surface-mode, overlap
   and finite-transfer formulas for the A4 root kernel; and
4. test whether the new construction fixes its Wilson coefficient, transfer
   scale, wall extent, boundary mass or determinant-line phase.

No masses, CKM/PMNS entries or other observational targets are used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parent
CHIRAL_PATH = ROOT / "urt_chiral_dirac_continuation.py"


def load_chiral_module():
    spec = importlib.util.spec_from_file_location("urt_chiral_current", CHIRAL_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {CHIRAL_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


chiral = load_chiral_module()
wilson = chiral.wilson


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def monomial_permutation(matrix: np.ndarray) -> tuple[np.ndarray, float]:
    """Return the column-to-row permutation and a monomial support residual."""
    support = np.abs(matrix) > 1.0e-10
    target = np.argmax(np.abs(matrix), axis=0)
    residual = max(
        float(np.linalg.norm(np.sum(support, axis=0) - 1)),
        float(np.linalg.norm(np.sum(support, axis=1) - 1)),
        float(np.max(np.abs(np.max(np.abs(matrix), axis=0) - 1.0))),
    )
    return target, residual


def permutation_cycles(permutation: np.ndarray) -> list[list[int]]:
    seen: set[int] = set()
    cycles: list[list[int]] = []
    for source in range(len(permutation)):
        if source in seen:
            continue
        cycle: list[int] = []
        current = source
        while current not in seen:
            seen.add(current)
            cycle.append(current)
            current = int(permutation[current])
        cycles.append(cycle)
    return cycles


def history_boundary_certificate() -> dict[str, Any]:
    geometry = wilson.hopf.build_geometry_no_networkx()
    history = wilson.build_dual_history(geometry)
    _, face_spinors, links = wilson.dual_hopf_certificate(geometry, history)
    left, right, _ = wilson.history_transfer(history, links)
    actions = [
        wilson.twisted_state_action(geometry, history, face_spinors, permutation)
        for permutation in (history["edge_half_turn"], history["face_rotation"])
    ]

    left_permutation, left_monomial_residual = monomial_permutation(left)
    cycles = permutation_cycles(left_permutation)
    n = left.shape[0]

    # A diagonal/local boundary projector commutes with each monomial A5 action
    # exactly when its diagonal is constant along all generator edges.  The
    # constraint matrix below is the incidence matrix of that orbit graph.
    constraint_rows = []
    action_monomial_residuals = []
    for action in actions:
        target, residual = monomial_permutation(action)
        action_monomial_residuals.append(residual)
        for source, destination in enumerate(target):
            row = np.zeros(n)
            row[int(destination)] += 1.0
            row[source] -= 1.0
            constraint_rows.append(row)
    constraint = np.asarray(constraint_rows)
    constraint_singular_values = np.linalg.svd(constraint, compute_uv=False)
    constraint_rank = int(np.sum(constraint_singular_values > 1.0e-10))

    # A representative local cut removes the final edge in each five-cycle.
    # It has one boundary site per pentagon, as a domain-wall interpretation
    # would require, but is not invariant under the transitive A5 action.
    boundary_diagonal = np.zeros(n)
    open_left = left.copy()
    for cycle in cycles:
        boundary_diagonal[cycle[0]] = 1.0
        source = cycle[-1]
        destination = cycle[0]
        if int(left_permutation[source]) != destination:
            raise RuntimeError("cycle ordering is inconsistent with the monomial")
        open_left[destination, source] = 0.0
    boundary_projector = np.diag(boundary_diagonal)

    closed_left_fifth = np.linalg.matrix_power(left, 5)
    closed_right_fifth = np.linalg.matrix_power(right, 5)
    open_left_fifth = np.linalg.matrix_power(open_left, 5)
    omega5_closed = (
        np.trace(closed_right_fifth) - np.trace(closed_left_fifth)
    ) / (n * 1.0j)

    return {
        "history_dimension": n,
        "closed_branch_cycle_count": len(cycles),
        "closed_branch_cycle_lengths": sorted(len(cycle) for cycle in cycles),
        "left_monomial_residual": left_monomial_residual,
        "A5_action_monomial_residuals": action_monomial_residuals,
        "closed_branch_A5_commutator_residuals": [
            float(np.linalg.norm(left @ action - action @ left))
            for action in actions
        ],
        "closed_left_fifth_trace": complex_payload(np.trace(closed_left_fifth)),
        "closed_right_fifth_trace": complex_payload(np.trace(closed_right_fifth)),
        "closed_normalized_Omega5": complex_payload(omega5_closed),
        "local_boundary_constraints": {
            "constraint_rank": constraint_rank,
            "constraint_nullity": n - constraint_rank,
            "smallest_singular_value": float(constraint_singular_values[-1]),
            "next_singular_value": float(constraint_singular_values[-2]),
            "interpretation": (
                "The two A5 generators act transitively on the 60 history states. "
                "A commuting diagonal projector is constant, so its rank is 0 or 60; "
                "there is no local A5-invariant rank-12 choice of one wall site per pentagon."
            ),
        },
        "representative_one_cut_per_cycle": {
            "boundary_projector_rank": int(round(np.trace(boundary_projector).real)),
            "boundary_projector_A5_commutator_residuals": [
                float(np.linalg.norm(boundary_projector @ action - action @ boundary_projector))
                for action in actions
            ],
            "open_shift_A5_commutator_residuals": [
                float(np.linalg.norm(open_left @ action - action @ open_left))
                for action in actions
            ],
            "open_shift_fifth_power_residual": float(np.linalg.norm(open_left_fifth)),
            "open_shift_fifth_trace": complex_payload(np.trace(open_left_fifth)),
            "interpretation": (
                "Cutting one edge in each pentagon produces twelve open five-site chains, "
                "but kills every degree-five closed walk and breaks the local A5 symmetry."
            ),
        },
        "exact_dilemma": (
            "The existing history coordinate cannot simultaneously be a domain-wall slab "
            "and retain the ordered Wilson invariant: periodic pentagons preserve Omega5 "
            "but have no wall, while local cuts create walls only by breaking A5 and setting "
            "the fifth trace to zero."
        ),
    }


def a4_kernel(
    momentum4: np.ndarray,
    wilson_coefficient: float,
    wall_height: float,
    basis: np.ndarray,
    roots5: np.ndarray,
    gammas: list[np.ndarray],
) -> tuple[np.ndarray, np.ndarray, np.ndarray, float]:
    derivative, scalar = chiral.a4_symbol_components(momentum4, basis, roots5)
    slash = sum(derivative[index] * gammas[index] for index in range(4))
    identity = np.eye(4, dtype=complex)
    kernel = (
        1.0j * slash
        + (wilson_coefficient * scalar - wall_height) * identity
    )
    return kernel, derivative, slash, scalar


def matrix_sign_hermitian(matrix: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    values, vectors = np.linalg.eigh((matrix + matrix.conj().T) / 2.0)
    if np.min(np.abs(values)) < 1.0e-12:
        raise RuntimeError("matrix-sign witness is gapless")
    sign = vectors @ np.diag(np.sign(values)) @ vectors.conj().T
    return sign, values


def overlap_from_kernel(
    kernel: np.ndarray, gamma5: np.ndarray
) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    hermitian = gamma5 @ kernel
    sign, values = matrix_sign_hermitian(hermitian)
    overlap = np.eye(kernel.shape[0], dtype=complex) + gamma5 @ sign
    return overlap, sign, values


def finite_wall_sign(
    hermitian: np.ndarray, transfer_scale: float, extent: int
) -> tuple[np.ndarray, float, float]:
    identity = np.eye(hermitian.shape[0], dtype=complex)
    transfer = (identity - transfer_scale * hermitian) @ np.linalg.inv(
        identity + transfer_scale * hermitian
    )
    transfer_power = np.linalg.matrix_power(transfer, extent)
    epsilon = (identity - transfer_power) @ np.linalg.inv(
        identity + transfer_power
    )

    values, vectors = np.linalg.eigh(hermitian)
    if np.max(np.abs(transfer_scale * values)) >= 1.0:
        raise RuntimeError("transfer witness lies outside the artanh chamber")
    analytic = vectors @ np.diag(
        np.tanh(extent * np.arctanh(transfer_scale * values))
    ) @ vectors.conj().T
    formula_residual = float(np.linalg.norm(epsilon - analytic))
    sign, _ = matrix_sign_hermitian(hermitian)
    sign_error = float(np.linalg.norm(epsilon - sign))
    return epsilon, formula_residual, sign_error


def open_wall_matrix(
    wall_height: float,
    extent: int,
    gamma5: np.ndarray,
    boundary_mass: float = 0.0,
) -> np.ndarray:
    """Free p=0 Shamir-type slab with explicit open-boundary link mass.

    At p=0 its diagonal is q I with q=1-M.  A negative-chirality
    surface mode at the first wall has profile q^s; its mirror lives at the
    far wall.  boundary_mass couples the two walls (boundary_mass=1 is the
    conventional heavy/PV boundary condition).
    """
    identity = np.eye(gamma5.shape[0], dtype=complex)
    projector_plus = (identity + gamma5) / 2.0
    projector_minus = (identity - gamma5) / 2.0
    spin = gamma5.shape[0]
    wall = np.zeros((spin * extent, spin * extent), dtype=complex)
    diagonal = (1.0 - wall_height) * identity
    for layer in range(extent):
        row = slice(spin * layer, spin * (layer + 1))
        wall[row, row] = diagonal
        if layer + 1 < extent:
            forward = slice(spin * (layer + 1), spin * (layer + 2))
            wall[row, forward] = -projector_minus
        if layer > 0:
            backward = slice(spin * (layer - 1), spin * layer)
            wall[row, backward] = -projector_plus
    if boundary_mass != 0.0:
        first = slice(0, spin)
        last = slice(spin * (extent - 1), spin * extent)
        wall[first, last] += boundary_mass * projector_plus
        wall[last, first] += boundary_mass * projector_minus
    return wall


def normalized_surface_mode(
    wall_height: float,
    extent: int,
    chirality: int,
    gamma5: np.ndarray,
) -> np.ndarray:
    q = 1.0 - wall_height
    eigenvalues, eigenvectors = np.linalg.eigh(gamma5)
    indices = np.where(np.abs(eigenvalues - chirality) < 1.0e-10)[0]
    spinor = eigenvectors[:, indices[0]]
    if chirality == -1:
        profile = [q**layer for layer in range(extent)]
    else:
        profile = [q ** (extent - 1 - layer) for layer in range(extent)]
    mode = np.concatenate([coefficient * spinor for coefficient in profile])
    return mode / np.linalg.norm(mode)


def wall_and_overlap_certificate() -> dict[str, Any]:
    basis, roots5 = chiral.a4_root_data()
    gammas, gamma5 = chiral.euclidean_gamma_matrices()
    identity = np.eye(4, dtype=complex)
    test_momentum = np.asarray([0.37, -0.21, 0.43, -0.18])
    epsilon = 1.0e-6
    wall_height = 1.0
    wilson_witnesses = []

    # The A5 generators may be represented by a 3-cycle and a double
    # transposition of the five ambient coordinates.  The root symbol is
    # equivariant under the induced orthogonal action on V4.
    reference_derivative, reference_scalar = chiral.a4_symbol_components(
        test_momentum, basis, roots5
    )
    momentum5 = basis @ test_momentum
    root_covariance_residuals = []
    for permutation in ((1, 2, 0, 3, 4), (1, 0, 3, 2, 4)):
        permutation_matrix = np.eye(5)[list(permutation)]
        transformed_momentum4 = basis.T @ (permutation_matrix @ momentum5)
        transformed_derivative, transformed_scalar = chiral.a4_symbol_components(
            transformed_momentum4, basis, roots5
        )
        induced = basis.T @ permutation_matrix @ basis
        root_covariance_residuals.append(
            max(
                float(
                    np.linalg.norm(
                        transformed_derivative - induced @ reference_derivative
                    )
                ),
                abs(transformed_scalar - reference_scalar),
            )
        )

    for wilson_coefficient in (0.75, 1.0, 2.0):
        kernel, _, _, scalar = a4_kernel(
            test_momentum,
            wilson_coefficient,
            wall_height,
            basis,
            roots5,
            gammas,
        )
        hermitian = gamma5 @ kernel
        overlap, sign, eigenvalues = overlap_from_kernel(kernel, gamma5)
        gw_residual = float(
            np.linalg.norm(
                gamma5 @ overlap
                + overlap @ gamma5
                - overlap @ gamma5 @ overlap
            )
        )
        polar_denominator = math.sqrt(
            float(np.trace(kernel.conj().T @ kernel).real / 4.0)
        )
        polar_residual = float(
            np.linalg.norm(gamma5 @ sign - kernel / polar_denominator)
        )

        principal_residual = 0.0
        for axis in range(4):
            displacement = np.zeros(4)
            displacement[axis] = epsilon
            plus_kernel, *_ = a4_kernel(
                displacement,
                wilson_coefficient,
                wall_height,
                basis,
                roots5,
                gammas,
            )
            minus_kernel, *_ = a4_kernel(
                -displacement,
                wilson_coefficient,
                wall_height,
                basis,
                roots5,
                gammas,
            )
            # Here A^dagger A is scalar, so use the closed polar formula for
            # the finite difference and reserve eigensystem noise for the
            # independent sign/polar comparison above.
            plus_denominator = math.sqrt(
                float(np.trace(plus_kernel.conj().T @ plus_kernel).real / 4.0)
            )
            minus_denominator = math.sqrt(
                float(np.trace(minus_kernel.conj().T @ minus_kernel).real / 4.0)
            )
            plus_overlap = identity + plus_kernel / plus_denominator
            minus_overlap = identity + minus_kernel / minus_denominator
            derivative = (plus_overlap - minus_overlap) / (2.0 * epsilon)
            principal_residual = max(
                principal_residual,
                float(np.linalg.norm(derivative - 1.0j * gammas[axis])),
            )

        transfer_witnesses = []
        finite_operators: dict[tuple[float, int], np.ndarray] = {}
        for transfer_scale in (0.15, 0.30):
            for extent in (8, 12):
                finite_sign, formula_residual, sign_error = finite_wall_sign(
                    hermitian, transfer_scale, extent
                )
                finite_overlap = identity + gamma5 @ finite_sign
                finite_operators[(transfer_scale, extent)] = finite_overlap
                finite_gw_residual = float(
                    np.linalg.norm(
                        gamma5 @ finite_overlap
                        + finite_overlap @ gamma5
                        - finite_overlap @ gamma5 @ finite_overlap
                    )
                )
                transfer_witnesses.append(
                    {
                        "transfer_scale": transfer_scale,
                        "wall_extent": extent,
                        "transfer_formula_residual": formula_residual,
                        "sign_approximation_error": sign_error,
                        "finite_extent_GW_residual": finite_gw_residual,
                    }
                )

        wilson_witnesses.append(
            {
                "Wilson_coefficient": wilson_coefficient,
                "wall_height": wall_height,
                "minimum_nonphysical_critical_scalar": 1.6 * wilson_coefficient
                - wall_height,
                "test_momentum_Wilson_scalar": scalar,
                "Hermitian_kernel_residual": float(
                    np.linalg.norm(hermitian - hermitian.conj().T)
                ),
                "Hermitian_kernel_eigenvalues": [float(value) for value in eigenvalues],
                "overlap_GW_residual": gw_residual,
                "polar_sign_formula_residual": polar_residual,
                "continuum_principal_symbol_residual": principal_residual,
                "finite_transfer_witnesses": transfer_witnesses,
                "same_extent_scale_dependence": {
                    str(extent): float(
                        np.linalg.norm(
                            finite_operators[(0.15, extent)]
                            - finite_operators[(0.30, extent)]
                        )
                    )
                    for extent in (8, 12)
                },
            }
        )

    # Free wall profiles.  All sampled heights are inside the r=1 A4
    # single-orbit chamber 0<M<8/5 as well as the wall interval 0<M<2.
    wall_extent = 8
    surface_witnesses = []
    for sampled_height in (0.5, 0.8, 1.0, 1.2, 1.5):
        open_wall = open_wall_matrix(sampled_height, wall_extent, gamma5)
        minus_mode = normalized_surface_mode(
            sampled_height, wall_extent, -1, gamma5
        )
        plus_mode = normalized_surface_mode(
            sampled_height, wall_extent, +1, gamma5
        )
        singular_values = np.linalg.svd(open_wall, compute_uv=False)
        q = abs(1.0 - sampled_height)
        normalization = math.sqrt(sum(q ** (2 * layer) for layer in range(wall_extent)))
        expected_tail = q**wall_extent / normalization
        surface_witnesses.append(
            {
                "wall_height": sampled_height,
                "absolute_tail_ratio": q,
                "left_wall_mode_residual": float(np.linalg.norm(open_wall @ minus_mode)),
                "right_wall_mode_residual": float(np.linalg.norm(open_wall @ plus_mode)),
                "expected_truncation_tail": expected_tail,
                "smallest_singular_value": float(singular_values[-1]),
                "near_surface_mode_multiplicity": int(
                    np.sum(singular_values < max(1.0e-12, 2.0 * expected_tail))
                ),
            }
        )

    boundary_mass_witnesses = []
    layer_reflection = np.fliplr(np.eye(wall_extent))
    reflection_gamma5 = np.kron(layer_reflection, gamma5)
    for boundary_mass in (0.0, 0.1, 1.0):
        wall = open_wall_matrix(
            wall_height, wall_extent, gamma5, boundary_mass=boundary_mass
        )
        singular_values = np.linalg.svd(wall, compute_uv=False)
        boundary_mass_witnesses.append(
            {
                "boundary_mass": boundary_mass,
                "zero_mode_count": int(np.sum(singular_values < 1.0e-12)),
                "smallest_singular_values": [
                    float(value) for value in singular_values[-4:]
                ],
                "reflection_gamma5_hermiticity_residual": float(
                    np.linalg.norm(
                        reflection_gamma5 @ wall @ reflection_gamma5
                        - wall.conj().T
                    )
                ),
            }
        )

    return {
        "candidate_kernel": (
            "A_{r,M}(p)=i S(p)+[r B(p)-M]I, "
            "H_{r,M}=gamma5 A_{r,M}"
        ),
        "exact_A4_single_orbit_chamber": (
            "r>0 and 0<M<8r/5; the first nonphysical A4 derivative zero has B=8/5"
        ),
        "combined_surface_and_A4_chamber": (
            "r>0 and 0<M<min(2,8r/5); the wall profile also requires |1-M|<1"
        ),
        "fixed_standard_normalization_slice": (
            "M=1 fixes the standard GW radius and i gamma.p coefficient; "
            "every r>5/8 remains admissible"
        ),
        "infinite_wall_overlap": (
            "D_infinity=I+gamma5 sign(H_{r,M})="
            "I+A_{r,M}/sqrt(A_{r,M}^dagger A_{r,M})"
        ),
        "finite_wall_transfer": (
            "T_a=(I-a5 H)(I+a5 H)^(-1), "
            "epsilon_L=(I-T_a^L)(I+T_a^L)^(-1)="
            "tanh[L artanh(a5 H)]"
        ),
        "A5_root_symbol_covariance_residuals": root_covariance_residuals,
        "Wilson_parameter_witnesses": wilson_witnesses,
        "surface_mode_theorem": {
            "profile": "psi_s proportional to (1-M)^s",
            "half_line_normalizability": "|1-M|<1, equivalently 0<M<2",
            "finite_slab_statement": (
                "An open finite slab has a rank-2 Weyl sector on each wall. "
                "At M=1 both are exactly supported on their boundary layers, "
                "so the 4-dimensional zero space is explicit. A single boundary "
                "sector requires a half-line/orbifold or another boundary prescription."
            ),
            "wall_extent": wall_extent,
            "witnesses": surface_witnesses,
            "boundary_link_mass_witnesses_at_M_equals_1": boundary_mass_witnesses,
        },
        "parameter_conclusion": (
            "The augmented wall realizes chiral surface modes and tends to the exact "
            "overlap operator, but it does not select r, the finite transfer scale a5, "
            "the extent L, or the boundary link mass."
        ),
    }


def determinant_phase_certificate() -> dict[str, Any]:
    theta = np.linspace(-math.pi, math.pi, 4097)
    omega = 2.0 * np.sin(theta)
    witnesses = []
    for coefficient in (0.0, 0.731, 1.123):
        counterterm = np.exp(1.0j * coefficient * omega)
        phase_steps = np.angle(counterterm[1:] / counterterm[:-1])
        witnesses.append(
            {
                "lambda": coefficient,
                "minimum_modulus": float(np.min(np.abs(counterterm))),
                "maximum_modulus": float(np.max(np.abs(counterterm))),
                "periodicity_residual": float(abs(counterterm[0] - counterterm[-1])),
                "winding": float(np.sum(phase_steps) / (2.0 * math.pi)),
            }
        )
    return {
        "inherited_determinant_line_winding": 12,
        "allowed_boundary_counterterm": "exp(i lambda chi Omega5), lambda real",
        "counterterm_witnesses": witnesses,
        "conclusion": (
            "A domain-wall/PV quotient can reproduce the index/anomaly class, but the "
            "periodic nowhere-zero boundary factor has zero winding for every lambda. "
            "Without an independently normalized bulk level and boundary phase convention, "
            "inflow does not select lambda."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    history_boundary = history_boundary_certificate()
    wall_overlap = wall_and_overlap_certificate()
    determinant_phase = determinant_phase_certificate()

    out = {
        "certificate": "URT oriented domain-wall / recursive-history boundary audit",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "premise_status": (
            "CANDIDATE ONLY: standard domain-wall/overlap machinery is tested as "
            "explicitly new input; it is not derived from or adopted as a URT axiom."
        ),
        "method_provenance_not_URT_premises": [
            {
                "work": "D. B. Kaplan, A Method for Simulating Chiral Fermions on the Lattice",
                "url": "https://arxiv.org/abs/hep-lat/9206013",
            },
            {
                "work": "V. Furman and Y. Shamir, Axial Symmetries in Lattice QCD with Kaplan Fermions",
                "url": "https://arxiv.org/abs/hep-lat/9405004",
            },
            {
                "work": "H. Neuberger, Exactly massless quarks on the lattice",
                "url": "https://arxiv.org/abs/hep-lat/9707022",
            },
        ],
        "existing_history_boundary_obstruction": history_boundary,
        "augmented_wall_candidate": wall_overlap,
        "determinant_phase": determinant_phase,
        "uniqueness_gate": {
            "one_chiral_boundary_sector": (
                "FAIL on the existing periodic history carrier; CONDITIONAL on adding "
                "a half-line/orbifold boundary prescription"
            ),
            "A5_covariance_and_orientation": (
                "FAIL for a local cut: the cut breaks A5 and erases Omega5"
            ),
            "doubler_free_A4_limit": (
                "PASS for the open chamber 0<M<8r/5, but the chamber is continuous"
            ),
            "unique_kernel_normalization": (
                "FAIL: after M=1 fixes the conventional radius/principal symbol, r>5/8 remains"
            ),
            "unique_wall_transfer": "FAIL: a5 and finite wall extent remain",
            "unique_boundary_condition": "FAIL: the boundary link mass remains",
            "gauge_covariance": (
                "CONDITIONAL: covariant link insertion is compatible with every member, "
                "but the recoverable premises contain no microscopic gauge-link bulk action "
                "or coupling that selects one member"
            ),
            "KO6_reality": (
                "PASS for the reflection/gamma5-hermitian vectorlike slab; CONDITIONAL "
                "for isolating one chiral boundary determinant and its measure phase"
            ),
            "unique_measure_phase": "FAIL: lambda remains a real zero-winding counterterm",
            "verdict": (
                "F/no-go for selecting the microscopic action by merely naming a "
                "domain-wall or anomaly-inflow regulator."
            ),
            "minimum_next_premise": (
                "An independently stated new bulk action must add a wall coordinate or "
                "nonlocal boundary projector, derive r/a5/extent/boundary mass, and fix "
                "the determinant phase. Otherwise the flavour gate remains closed."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    serialized = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized)


if __name__ == "__main__":
    main()