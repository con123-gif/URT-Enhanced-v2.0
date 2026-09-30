#!/usr/bin/env python3
"""Continuum-symbol closure and lattice obstruction for the URT 13-state shell.

For a translation-invariant one-step scalar propagator with one rest state and
twelve equal-weight unit-speed directions, self-adjointness forces reversal
pairing.  Rotational isotropy of its characteristic symbol through fourth order
then forces the exact second and fourth moment tensors used by the conditional
icosahedral uniqueness theorem.  Matching the complete fourth-order Taylor jet
of an isotropic Gaussian heat kernel further fixes w=1/20, w0=2/5 and c_s^2=1/5.

The calculation also exposes two sharp limits: rotational isotropy alone does
not fix the weights, and an icosahedral stencil is anisotropic at sixth order.
Moreover, a rank-three Bravais lattice cannot have a fivefold lattice
automorphism, so exact site-to-site icosahedral streaming requires an off-lattice,
quasicrystalline, or higher-dimensional construction.

No observational target is used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from fractions import Fraction
from pathlib import Path
from typing import Any

import numpy as np


def icosahedron_vertices() -> np.ndarray:
    phi = (1.0 + math.sqrt(5.0)) / 2.0
    raw: list[tuple[float, float, float]] = []
    for a in (-1.0, 1.0):
        for b in (-phi, phi):
            raw.extend([(0.0, a, b), (a, b, 0.0), (b, 0.0, a)])
    vertices = np.unique(np.asarray(raw), axis=0)
    return vertices / np.linalg.norm(vertices, axis=1)[:, None]


def isotropic_tensors() -> tuple[np.ndarray, np.ndarray]:
    identity = np.eye(3)
    fourth = np.zeros((3, 3, 3, 3))
    for i, j, k, l in itertools.product(range(3), repeat=4):
        fourth[i, j, k, l] = (
            identity[i, j] * identity[k, l]
            + identity[i, k] * identity[j, l]
            + identity[i, l] * identity[j, k]
        )
    return identity, fourth


def high_symmetry_directions(vertices: np.ndarray) -> dict[str, np.ndarray]:
    gram = vertices @ vertices.T
    adjacency = np.isclose(gram, 1.0 / math.sqrt(5.0), atol=1.0e-12)
    np.fill_diagonal(adjacency, False)
    edge = np.argwhere(np.triu(adjacency, 1))[0]
    edge_midpoint = vertices[edge[0]] + vertices[edge[1]]
    edge_midpoint /= np.linalg.norm(edge_midpoint)

    face_center = None
    for i, j, k in itertools.combinations(range(12), 3):
        if adjacency[i, j] and adjacency[i, k] and adjacency[j, k]:
            face_center = vertices[i] + vertices[j] + vertices[k]
            face_center /= np.linalg.norm(face_center)
            break
    if face_center is None:
        raise RuntimeError("icosahedral face not found")
    return {
        "vertex_axis": vertices[0],
        "edge_axis": edge_midpoint,
        "face_axis": face_center,
    }


def moment_audit() -> dict[str, Any]:
    vertices = icosahedron_vertices()
    identity, isotropic_fourth = isotropic_tensors()
    raw_second = np.einsum("ni,nj->ij", vertices, vertices)
    raw_fourth = np.einsum(
        "ni,nj,nk,nl->ijkl", vertices, vertices, vertices, vertices
    )
    moving_weight = 1.0 / 20.0
    directions = high_symmetry_directions(vertices)
    sixth = {}
    expected_exact = {
        "vertex_axis": Fraction(13, 125),
        "edge_axis": Fraction(2, 25),
        "face_axis": Fraction(17, 225),
    }
    maximum_fraction_residual = 0.0
    for name, direction in directions.items():
        value = moving_weight * float(np.sum((vertices @ direction) ** 6))
        exact = expected_exact[name]
        maximum_fraction_residual = max(
            maximum_fraction_residual, abs(value - float(exact))
        )
        sixth[name] = {
            "weighted_sixth_directional_moment": value,
            "exact": str(exact),
        }

    return {
        "raw_second_moment_residual": float(
            np.linalg.norm(raw_second - 4.0 * identity)
        ),
        "raw_fourth_moment_residual": float(
            np.linalg.norm(raw_fourth - (4.0 / 5.0) * isotropic_fourth)
        ),
        "weighted_sixth_directional_moments": sixth,
        "maximum_sixth_fraction_residual": maximum_fraction_residual,
        "sixth_anisotropy_vertex_minus_face_exact": str(
            Fraction(13, 125) - Fraction(17, 225)
        ),
        "gaussian_sixth_directional_target_at_cs2_1_over_5": str(
            Fraction(3, 25)
        ),
    }


def characteristic_audit() -> dict[str, float]:
    vertices = icosahedron_vertices()
    weight = 1.0 / 20.0
    rest = 2.0 / 5.0
    rng = np.random.default_rng(513)
    direction = rng.normal(size=3)
    direction /= np.linalg.norm(direction)
    # The error after subtracting the matched fourth-order Gaussian jet must be
    # O(t^6).  Report error/t^6 for decreasing t as a deterministic check.
    ratios = []
    for t in (0.04, 0.02, 0.01):
        k = t * direction
        symbol = rest + weight * np.sum(np.exp(1.0j * (vertices @ k)))
        gaussian_four_jet = 1.0 - np.dot(k, k) / 10.0 + np.dot(k, k) ** 2 / 200.0
        ratios.append(float(abs(symbol - gaussian_four_jet) / t**6))
    return {
        "symbol_imaginary_residual": float(
            abs(
                (
                    rest
                    + weight
                    * np.sum(np.exp(1.0j * (vertices @ direction)))
                ).imag
            )
        ),
        "fourth_jet_error_over_k6_t_0p04": ratios[0],
        "fourth_jet_error_over_k6_t_0p02": ratios[1],
        "fourth_jet_error_over_k6_t_0p01": ratios[2],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    moments = moment_audit()
    characteristic = characteristic_audit()

    out = {
        "certificate": "URT icosahedral continuum-stencil closure and lattice obstruction",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "propagator": {
            "definition": (
                "(Tf)(x)=w0 f(x)+sum_a w_a f(x+ell n_a), "
                "with twelve distinct unit n_a"
            ),
            "characteristic_symbol": (
                "chi(k)=w0+sum_a w_a exp(i ell n_a dot k)"
            ),
            "normalization": "w0+sum_a w_a=1",
        },
        "self_adjointness_theorem": {
            "adjoint_kernel": "T^* has weight w_{-v} on translation v",
            "consequence": (
                "T=T^* iff w_v=w_{-v}.  With twelve distinct equal positive "
                "moving weights, the support is exactly six antipodal pairs."
            ),
            "status": "E",
        },
        "fourth_order_symbol_theorem": {
            "expansion": (
                "chi(k)=1-(ell^2/2) M2_ij k_i k_j+"
                "(ell^4/24) M4_ijkl k_i k_j k_k k_l+O(|k|^6)"
            ),
            "moments": "Mr=sum_a w_a n_a^{tensor r}",
            "rotational_isotropy": [
                "M2=A delta",
                "M4=B(delta_ij delta_kl+delta_ik delta_jl+delta_il delta_jk)",
            ],
            "unit_speed_trace_for_equal_weight_w": [
                "12w=3A, hence A=4w",
                "12w=15B, hence B=4w/5",
            ],
            "unweighted_consequence": [
                "sum_a n_a n_a^T=4 I3",
                "sum_a n_a^{tensor 4}=(4/5) sym(delta tensor delta)",
            ],
            "geometric_closure": (
                "Together with the antipodal theorem, the exact projective-design "
                "and conference-matrix proof forces the unique regular icosahedron "
                "up to O(3), sign choices and relabeling."
            ),
            "weight_scope": (
                "Rotational isotropy alone leaves any 0<w<=1/12 with w0=1-12w; "
                "it fixes the geometry but not the moving/rest weights."
            ),
            "status": "E conditional on a self-adjoint equal-shell propagator and fourth-order isotropy",
        },
        "gaussian_heat_jet_closure": {
            "target": "exp[-c_s^2 ell^2 |k|^2/2]+O(|k|^6)",
            "coefficient_equations": [
                "c_s^2=4w",
                "c_s^4=4w/5",
                "w0+12w=1",
            ],
            "unique_nontrivial_solution": {
                "moving_weight": "1/20",
                "rest_weight": "2/5",
                "sound_speed_squared": "1/5",
            },
            "premise_precision": (
                "The numerical weights require Gaussian fourth-cumulant matching, "
                "not rotational invariance or pressure isotropy alone."
            ),
            "status": "E conditional on fourth-order Gaussian/Maxwellian matching",
        },
        "sixth_order_boundary": {
            "statement": (
                "The icosahedral shell is isotropic through degree five but not six."
            ),
            "audit": moments,
            "consequence": (
                "The first direction-dependent truncation error occurs at O(|k|^6); "
                "the finite stencil is not an exactly rotation-invariant continuum kernel."
            ),
            "status": "E",
        },
        "characteristic_numerical_audit": characteristic,
        "three_dimensional_lattice_obstruction": {
            "proof": (
                "If a rank-three Bravais lattice admitted a nontrivial order-five "
                "rotation R, a lattice basis would represent R in GL(3,Z), so Tr R "
                "would be an integer.  A real three-dimensional order-five rotation "
                "has eigenvalues 1,zeta5,zeta5^-1 (or their square) and trace phi "
                "or 1-phi, neither an integer."
            ),
            "consequence": (
                "No rank-three Bravais lattice is invariant under full icosahedral "
                "symmetry.  Exact local site-to-site streaming of this shell requires "
                "an off-lattice rule, a quasicrystal/cut-and-project structure, or an "
                "explicit higher-dimensional lift."
            ),
            "A4_scope": (
                "The four-dimensional A4 root lattice can carry order-five symmetry, "
                "but the project has not supplied a local projection/streaming map "
                "whose twelve three-dimensional velocities land exactly on sites."
            ),
            "status": "E for the rank-three obstruction; U for the required bridge",
        },
        "verdict": {
            "regular_icosahedral_geometry": (
                "E conditional on self-adjoint equal-shell propagation and "
                "fourth-order rotational isotropy"
            ),
            "weights_2_over_5_and_1_over_20": (
                "E conditional on the stronger fourth-order Gaussian heat-jet premise"
            ),
            "exact_microscopic_local_streaming": "U",
            "advance": (
                "The former antipodality and moment assumptions are now derived from "
                "a single explicit continuum-stencil requirement.  The irreducible "
                "remaining choices are that requirement itself and its missing local "
                "higher-dimensional/off-lattice realization."
            ),
            "phenomenology_gate": "CLOSED",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()