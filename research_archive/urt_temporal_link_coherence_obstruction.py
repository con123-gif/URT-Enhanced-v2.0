#!/usr/bin/env python3
"""Exact zero-action gap obstruction from incoherent future links.

The reflected Cathedral graph treats the eight future diagonals as independent
compact gauge links.  Its current gauge action contains spatial squares and
each future-diagonal/spatial parallelogram, but no face that compares two
different future-diagonal types.

Set every spatial link to one.  Let the eight future links be constant over
the lattice, with four phases

    alpha_+ = -omega + phi

and four phases

    alpha_- = -omega - phi,

where omega=pi/Nt is the lowest antiperiodic frequency and
cos(phi)=1-M.  Every plaquette in the declared gauge action is exactly the
identity, so this field has zero gauge action at every beta.  Nevertheless,
at spatial momentum zero,

    (1/8) sum_d exp(i(omega+alpha_d)) = cos(phi)=1-M.

The temporal kinetic term vanishes and the scalar part of D_W-M is
1-M-(1-M)=0.  Hence X=D_W-M has an exact four-spinor zero mode and the polar
overlap is undefined.

The missing gauge-invariant loop comparing a + and - future link has holonomy
exp(2 i phi), so the configuration is not flat on the full graph cell
complex.  It is invisible only because the face set is incomplete.

This is an exact counterexample to the present gauge/overlap merger.  It is
not a counterexample to a repaired action with diagonal-coherence faces or
derived, rather than independent, diagonal transporters.  No observational
target is used.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


HERE = Path(__file__).resolve().parent
BOUNDARY_AUDIT = HERE / "urt_interacting_overlap_os_boundary_audit.py"


def load_boundary_module() -> Any:
    spec = importlib.util.spec_from_file_location("urt_boundary_audit", BOUNDARY_AUDIT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {BOUNDARY_AUDIT}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


A = load_boundary_module()


def included_plaquette_phases(phases: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    spatial_fluxes = []
    electric_fluxes = []
    for site_index, site in enumerate(A.SITES):
        for first in range(3):
            for second in range(first + 1, 3):
                site_first = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[first])]
                site_second = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[second])]
                spatial_fluxes.append(
                    phases[site_index, first]
                    + phases[site_first, second]
                    - phases[site_second, first]
                    - phases[site_index, second]
                )
        for temporal in range(3, len(A.DIRECTIONS)):
            site_temporal = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[temporal])]
            for spatial in range(3):
                site_spatial = A.SITE_INDEX[A.shift(site, A.DIRECTIONS[spatial])]
                electric_fluxes.append(
                    phases[site_index, temporal]
                    + phases[site_temporal, spatial]
                    - phases[site_spatial, temporal]
                    - phases[site_index, spatial]
                )
    return np.asarray(spatial_fluxes), np.asarray(electric_fluxes)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    omega = math.pi / A.NT
    phi = math.acos(1.0 - A.M_SELECTED)
    alpha_plus = -omega + phi
    alpha_minus = -omega - phi

    phases = np.zeros((len(A.SITES), len(A.DIRECTIONS)))
    phases[:, 3:7] = alpha_plus
    phases[:, 7:11] = alpha_minus

    shifted_temporal_average = np.mean(
        np.exp(1.0j * (omega + phases[0, 3:]))
    )
    kinetic_coefficient = A.C_SELECTED * shifted_temporal_average.imag
    scalar_coefficient = 1.0 - A.M_SELECTED - shifted_temporal_average.real

    wilson = A.wilson_operator(phases)
    identity = np.eye(wilson.shape[0], dtype=complex)
    x_matrix = wilson - A.M_SELECTED * identity
    singular_values = np.linalg.svd(x_matrix, compute_uv=False)
    xdaggerx_values = np.linalg.eigvalsh(x_matrix.conj().T @ x_matrix)

    # Four explicit constant-spatial antiperiodic plane waves, one for each
    # spin basis vector.
    plane_wave_residuals = []
    for spin in range(4):
        vector = np.zeros(4 * len(A.SITES), dtype=complex)
        for site_index, site in enumerate(A.SITES):
            vector[4 * site_index + spin] = np.exp(1.0j * omega * site[0])
        vector /= np.linalg.norm(vector)
        plane_wave_residuals.append(float(np.linalg.norm(x_matrix @ vector)))

    spatial_fluxes, electric_fluxes = included_plaquette_phases(phases)
    spatial_holonomies = np.exp(1.0j * spatial_fluxes)
    electric_holonomies = np.exp(1.0j * electric_fluxes)
    spatial_action = float(np.sum(1.0 - np.cos(spatial_fluxes)))
    electric_action = float(np.sum(1.0 - np.cos(electric_fluxes)))

    plus_direction = 3
    minus_direction = 7
    missing_loop_phase = alpha_plus - alpha_minus
    missing_loop_holonomy = np.exp(1.0j * missing_loop_phase)
    displacement_difference = [
        A.DIRECTIONS[plus_direction][j] - A.DIRECTIONS[minus_direction][j]
        for j in range(4)
    ]

    out: dict[str, Any] = {
        "certificate": "URT exact temporal-link coherence obstruction",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "selected_kernel": {
            "r": A.R_SELECTED,
            "M": A.M_SELECTED,
            "c_t": A.C_SELECTED,
            "Nt": A.NT,
            "Ns": A.NS,
        },
        "exact_configuration": {
            "spatial_links": "U_i(x)=1",
            "future_links": "four U_d=exp(i alpha_+), four U_d=exp(i alpha_-)",
            "omega": omega,
            "phi": phi,
            "cos_phi": math.cos(phi),
            "target_1_minus_M": 1.0 - A.M_SELECTED,
            "alpha_plus": alpha_plus,
            "alpha_minus": alpha_minus,
            "analytic_identity": (
                "(1/8)sum_d exp(i(omega+alpha_d))="
                "(exp(i phi)+exp(-i phi))/2=cos(phi)=1-M"
            ),
            "temporal_average": {
                "real": float(shifted_temporal_average.real),
                "imaginary": float(shifted_temporal_average.imag),
            },
            "temporal_kinetic_coefficient": float(kinetic_coefficient),
            "X_scalar_coefficient": float(scalar_coefficient),
            "status": "E",
        },
        "zero_action_check": {
            "spatial_plaquette_count": len(spatial_fluxes),
            "electric_plaquette_count": len(electric_fluxes),
            "maximum_spatial_holonomy_deviation": float(
                np.max(np.abs(spatial_holonomies - 1.0))
            ),
            "maximum_electric_holonomy_deviation": float(
                np.max(np.abs(electric_holonomies - 1.0))
            ),
            "spatial_action_sum": spatial_action,
            "electric_action_sum": electric_action,
            "declared_ratio_4_to_1_action_at_beta_1": 4.0 * spatial_action
            + electric_action,
            "conclusion": "accepted with maximal weight by every included plaquette factor",
            "status": "E",
        },
        "direct_matrix_check": {
            "matrix_dimension": wilson.shape[0],
            "minimum_singular_value_X": float(np.min(singular_values)),
            "four_smallest_XdaggerX_eigenvalues": [
                float(value) for value in xdaggerx_values[:4]
            ],
            "fifth_XdaggerX_eigenvalue": float(xdaggerx_values[4]),
            "explicit_plane_wave_residuals": plane_wave_residuals,
            "numerical_zero_multiplicity_below_1e_minus_12": int(
                np.sum(singular_values < 1.0e-12)
            ),
            "status": "N corroboration of the exact mode calculation",
        },
        "missing_coherence_face": {
            "plus_direction": list(A.DIRECTIONS[plus_direction]),
            "minus_direction": list(A.DIRECTIONS[minus_direction]),
            "spatial_displacement_between_endpoints": displacement_difference,
            "loop": (
                "future link d_+, a spatial connector between its endpoint and "
                "the d_- endpoint, then the reverse d_- link"
            ),
            "loop_phase": missing_loop_phase,
            "loop_holonomy": {
                "real": float(missing_loop_holonomy.real),
                "imaginary": float(missing_loop_holonomy.imag),
            },
            "loop_deviation_from_identity": float(abs(missing_loop_holonomy - 1.0)),
            "why_current_action_misses_it": (
                "all declared electric faces compare a fixed future-link type "
                "at spatially translated base points; none compares d_+ with d_-"
            ),
            "status": "E",
        },
        "theorem": {
            "statement": (
                "For every 0<M<2 and c_t arbitrary, the current independent-eight-"
                "link face set admits a constant zero-action compact U(1) field "
                "with X=D_W-M singular, by the displayed construction."
            ),
            "proof_scope": (
                "cos(phi)=1-M is solvable exactly for 0<=M<=2; equal +/- groups "
                "kill the kinetic average; constancy kills every included plaquette"
            ),
            "selected_M_inside_scope": bool(0.0 < A.M_SELECTED < 2.0),
            "status": "E",
        },
        "verdict": {
            "current_gauge_overlap_merger": "F",
            "failure": (
                "the polar overlap is undefined on a zero-action field, so neither "
                "Wilson suppression nor admissibility of the existing faces repairs it"
            ),
            "pure_gauge_reflection_positivity": (
                "not contradicted; the problem is incompleteness of the face set "
                "relative to the eight-link fermion kernel"
            ),
            "required_repair_options": [
                "add positive-character diagonal-coherence faces and redo the gauge frame/OS audit",
                "derive all diagonal transporters from a smaller coherent primitive-link set",
                "or keep the reflection-positive Wilson/domain-wall fermion regulator instead of the polar overlap",
            ],
            "theory_of_nature_status": "not established",
            "status": "E no-go for the current merger",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()