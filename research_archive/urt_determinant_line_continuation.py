#!/usr/bin/env python3
"""Determinant-line topology and anomaly-inflow continuation for URT.

This blind certificate tests the next frontier recorded in
Cathedral_Live_State.md: whether the topology of the chiral determinant line
can select the still-free coefficient of chi*Omega_5 or the overlap kernel.

No particle masses, CKM/PMNS entries, or other observational targets enter.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


def complex_payload(value: complex) -> dict[str, float]:
    return {"real": float(np.real(value)), "imag": float(np.imag(value))}


def canonical_history_branch(holonomy: complex) -> np.ndarray:
    """Twelve five-cycles, each with fifth power equal to holonomy."""
    block = np.zeros((5, 5), dtype=complex)
    for row in range(4):
        block[row, row + 1] = 1.0
    block[4, 0] = holonomy
    return np.kron(np.eye(12, dtype=complex), block)


def mobius_unitary(unitary: np.ndarray, parameter: float) -> np.ndarray:
    identity = np.eye(unitary.shape[0], dtype=complex)
    return (unitary - parameter * identity) @ np.linalg.inv(
        identity - parameter * unitary
    )


def chiral_determinant_formula(holonomy: complex, parameter: float) -> complex:
    """det[I-(U-tI)(I-tU)^-1] for twelve five-cycles."""
    return (
        (1.0 + parameter) ** 60
        * (1.0 - holonomy) ** 12
        / (1.0 - parameter**5 * holonomy) ** 12
    )


def phase_winding(values: np.ndarray) -> float:
    ratios = values[1:] / values[:-1]
    return float(np.sum(np.angle(ratios)) / (2.0 * math.pi))


def winding_certificate(parameter: float, samples: int = 8192) -> dict[str, Any]:
    if not -1.0 < parameter < 1.0:
        raise ValueError("parameter must lie in (-1,1)")
    angles = np.linspace(0.0, 2.0 * math.pi, samples + 1)
    local_radius = 0.08
    contour = 1.0 + local_radius * np.exp(1j * angles)
    determinants = np.asarray(
        [chiral_determinant_formula(z, parameter) for z in contour]
    )
    reference = np.asarray([chiral_determinant_formula(z, 0.0) for z in contour])
    nonzero_ratio = determinants / reference

    epsilons = np.logspace(-7, -3, 17)
    log_epsilon = np.log(epsilons)
    log_absolute = np.asarray(
        [
            math.log(abs(chiral_determinant_formula(1.0 + epsilon, parameter)))
            for epsilon in epsilons
        ]
    )
    fitted_order = float(np.polyfit(log_epsilon, log_absolute, 1)[0])

    expected_quotient = (1.0 + parameter) ** 60 / (1.0 - parameter**5) ** 12
    epsilon_probe = 1.0e-7
    quotient_probe = chiral_determinant_formula(
        1.0 + epsilon_probe, parameter
    ) / epsilon_probe**12

    pole = None if parameter == 0.0 else parameter ** -5
    return {
        "parameter": float(parameter),
        "zero_at_z_equals_one_order": 12,
        "fitted_zero_order": fitted_order,
        "small_loop_winding": phase_winding(determinants),
        "relative_factor_winding": phase_winding(nonzero_ratio),
        "relative_factor_minimum_modulus_on_loop": float(
            np.min(np.abs(nonzero_ratio))
        ),
        "zero_quotient_limit_exact": float(expected_quotient),
        "zero_quotient_probe_relative_error": float(
            abs(quotient_probe / expected_quotient - 1.0)
        ),
        "only_pole": pole,
        "pole_outside_closed_unit_disk": bool(
            pole is None or abs(pole) > 1.0
        ),
    }


def direct_matrix_certificate(parameter: float, holonomy: complex) -> dict[str, Any]:
    unitary = canonical_history_branch(holonomy)
    identity = np.eye(60, dtype=complex)
    v = mobius_unitary(unitary, parameter)
    d = identity - v
    sign, logabs = np.linalg.slogdet(d)
    numeric = np.exp(logabs) * sign
    exact = chiral_determinant_formula(holonomy, parameter)
    return {
        "parameter": float(parameter),
        "unitary_fifth_power_residual": float(
            np.linalg.norm(np.linalg.matrix_power(unitary, 5) - holonomy * identity)
        ),
        "Mobius_unitarity_residual": float(np.linalg.norm(v.conj().T @ v - identity)),
        "determinant_formula_relative_error": float(abs(numeric / exact - 1.0)),
    }


def orientation_witness(parameter: float, theta: float) -> dict[str, Any]:
    z = np.exp(1j * theta)
    ratio = chiral_determinant_formula(z, parameter) / chiral_determinant_formula(
        np.conj(z), parameter
    )
    phase_action = float(np.angle(ratio) / 2.0)
    return {
        "parameter": float(parameter),
        "determinant_ratio": complex_payload(ratio),
        "half_phase_action_principal": phase_action,
        "degree_five_coefficient_of_Omega5": float(6.0 * parameter**5),
    }


def measure_counterterm_certificate(lambda_value: float, samples: int = 8192) -> dict[str, Any]:
    angles = np.linspace(0.0, 2.0 * math.pi, samples + 1)
    omega = 2.0 * np.sin(angles)
    counterterm = np.exp(1j * lambda_value * omega)
    return {
        "lambda": float(lambda_value),
        "definition_on_unitary_flux_locus": "C_lambda=exp(i lambda chi Omega_5), Omega_5=2 sin(theta)",
        "minimum_modulus": float(np.min(np.abs(counterterm))),
        "maximum_modulus": float(np.max(np.abs(counterterm))),
        "large_gauge_periodicity_residual": float(abs(counterterm[-1] - counterterm[0])),
        "winding": phase_winding(counterterm),
        "interpretation": (
            "This nowhere-zero periodic factor changes the local orientation phase but "
            "neither the determinant zero divisor nor its winding."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    theta = math.pi / 6.0
    z_hopf = np.exp(1j * theta)
    parameters = [0.0, 0.5, 1.0 / math.sqrt(2.0), -0.5]

    direct = [direct_matrix_certificate(t, z_hopf) for t in parameters]
    topology = [winding_certificate(t) for t in parameters]
    orientation = [orientation_witness(t, theta) for t in parameters]

    # The full KO-6/vectorlike completion pairs the chiral determinant with
    # its conjugate on the unitary holonomy locus, erasing the phase.
    vectorlike_phase_residuals = []
    for parameter in parameters:
        determinant = chiral_determinant_formula(z_hopf, parameter)
        vectorlike = determinant * np.conj(determinant)
        vectorlike_phase_residuals.append(
            {
                "parameter": float(parameter),
                "imaginary_residual": float(abs(np.imag(vectorlike))),
                "is_positive": bool(np.real(vectorlike) > 0.0),
            }
        )

    # The shifted pre-GW determinant det(I-aU_z) changes its disk winding only
    # when its zero crosses |z|=1 at a=1.  This records why a regulator choice
    # is extra data rather than an output of the Hopf point.
    shifted_regulator_divisors = []
    for amplitude in (0.5, 1.0, math.sqrt(2.0)):
        zero = amplitude ** -5
        shifted_regulator_divisors.append(
            {
                "amplitude": amplitude,
                "zero_z": zero,
                "zero_order": 12,
                "location": (
                    "outside unit disk"
                    if zero > 1.0
                    else "on unit circle" if zero == 1.0 else "inside unit disk"
                ),
                "unit_circle_winding_when_nonsingular": (
                    0 if zero > 1.0 else 12 if zero < 1.0 else None
                ),
            }
        )

    out = {
        "certificate": "URT determinant-line topology / anomaly insufficiency",
        "date": "2026-09-03",
        "observational_targets_used": False,
        "holonomy_family": {
            "definition": "U_z^5=z I_60, with twelve five-cycles",
            "Hopf_point": "z=exp(i pi/6)",
            "Omega5_on_unitary_locus": "-i(z-z^(-1))=2 sin(theta)",
        },
        "GW_chiral_determinant": {
            "formula": "F_t(z)=(1+t)^60 (1-z)^12/(1-t^5 z)^12",
            "domain": "-1<t<1",
            "direct_matrix_checks": direct,
            "topology_checks": topology,
            "exact_divisor_statement": (
                "For every -1<t<1, F_t has a zero of order 12 at z=1 and no pole "
                "in the closed unit disk. F_t/F_0=(1+t)^60/(1-t^5 z)^12 is "
                "holomorphic and nowhere zero there."
            ),
            "consequence": (
                "All covariant GW Mobius members define the same determinant-line "
                "zero divisor and local winding, although their Hopf-point phases differ."
            ),
        },
        "orientation_phase_witnesses": orientation,
        "measure_counterterm": measure_counterterm_certificate(0.731),
        "shifted_regulator_topological_transition": shifted_regulator_divisors,
        "A4_overlap_index_stability": {
            "fixed_radius_family": "A_r=iS+rB-1, r>5/8",
            "gap_boundary": "r=5/8, where the 1+4 derivative zero closes the kernel gap",
            "statement": (
                "The interval r>5/8 is connected and gapped away from the one physical "
                "zero, so its overlap index/anomaly class is constant. Topology cannot "
                "select one r inside the interval."
            ),
        },
        "KO6_vectorlike_completion": {
            "phase_residuals": vectorlike_phase_residuals,
            "statement": (
                "On the unitary locus the conjugate KO-6 sectors give |F_t|^2 (and the "
                "four-block determinant a further positive power), so the unreduced "
                "completion has no orientation phase to quantize."
            ),
        },
        "anomaly_insufficiency_theorem": {
            "status": "F/no-go for coefficient selection from determinant-line topology alone",
            "theorem": (
                "The integer zero multiplicity/winding is 12 for every admissible GW "
                "completion, while both the Mobius deformation and exp(i lambda chi "
                "Omega_5) multiply the determinant by nowhere-zero factors. Hence anomaly "
                "or index data determine only the determinant-line topology, not its local "
                "trivialization or the coefficient lambda."
            ),
            "minimal_new_datum": (
                "A specified microscopic UV regulator/bulk with a fixed boundary phase "
                "convention and normalization. Naming anomaly inflow is insufficient: the "
                "bulk action and its quantized level must be derived independently."
            ),
            "phenomenology_gate": "CLOSED: masses and CKM/PMNS remain quarantined.",
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(rendered, end="")
    else:
        args.output.write_text(rendered, encoding="utf-8")


if __name__ == "__main__":
    main()