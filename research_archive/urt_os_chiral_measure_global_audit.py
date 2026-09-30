#!/usr/bin/env python3
"""What vacuum OS reflection does and does not fix in the chiral measure.

The previous local history counterterm O5=chi*Omega5 is reflection-even.
Because OS reflection is anti-linear, exp(i lambda O5) satisfies OS reality for
all configurations only at lambda=0.  This removes that particular continuous
phase.

It does not trivialize the full chiral determinant line.  Four-dimensional
topological charge Q is reflection-odd, so exp(i theta Q) obeys

    Phi(theta A)=conj(Phi(A))

for every real theta.  When Q splits into reflected half-space charges, the
phase itself factors as Theta(F_theta) F_theta and preserves OS positivity.
Thus anomaly cancellation plus vacuum OS positivity still leaves a periodic
theta circle (at least the parent/SU(3) topological angle).  A separate CP or
microscopic regulator condition is needed, and CP alone leaves 0 versus pi.

No observational target is used.
"""

from __future__ import annotations

import argparse
import cmath
import importlib.util
import json
import math
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parent
ANOMALY_PATH = ROOT / "urt_anomaly_inflow_no_go.py"


def load_anomaly_module():
    spec = importlib.util.spec_from_file_location("urt_anomaly", ANOMALY_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ANOMALY_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def os_topological_sector_witness(theta: float) -> dict[str, Any]:
    """Exact finite-sum analogue of half-space OS factorization.

    The positive and negative halves carry q_+,q_- in {-2,...,2}, and the
    reflection-odd total charge is Q=q_+-q_-.  With a reflection-symmetric
    product weight, the theta-deformed OS form is an absolute square.
    """
    charges = np.arange(-2, 3, dtype=int)
    weights = np.exp(-0.61 * charges.astype(float) ** 2)
    weights /= np.sum(weights)
    test = np.asarray(
        [
            0.37 + 0.11j,
            -0.23 + 0.61j,
            1.00 - 0.17j,
            0.41 + 0.29j,
            -0.19 - 0.32j,
        ],
        dtype=complex,
    )

    direct = 0.0j
    for i, q_plus in enumerate(charges):
        for j, q_minus in enumerate(charges):
            total_charge = int(q_plus - q_minus)
            phase = cmath.exp(1.0j * theta * total_charge)
            direct += (
                weights[i]
                * weights[j]
                * np.conjugate(test[j])
                * test[i]
                * phase
            )

    half_amplitude = sum(
        weights[i] * test[i] * cmath.exp(1.0j * theta * int(charge))
        for i, charge in enumerate(charges)
    )
    square = abs(half_amplitude) ** 2

    # Phi(reflected)=conj(Phi) is checked on all finite sector pairs.
    reality_residual = 0.0
    for q_plus in charges:
        for q_minus in charges:
            charge = int(q_plus - q_minus)
            phi = cmath.exp(1.0j * theta * charge)
            reflected_phi = cmath.exp(-1.0j * theta * charge)
            reality_residual = max(
                reality_residual, abs(reflected_phi - np.conjugate(phi))
            )

    return {
        "theta": theta,
        "direct_OS_form_real": float(direct.real),
        "direct_OS_form_imaginary_abs": float(abs(direct.imag)),
        "absolute_square": float(square),
        "factorization_residual": float(abs(direct - square)),
        "OS_reality_residual": reality_residual,
        "nonnegative": bool(square >= 0.0),
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    anomaly = load_anomaly_module()
    local_anomaly = anomaly.local_anomalies()
    if not local_anomaly["all_local_coefficients_zero"]:
        raise RuntimeError("local anomaly cancellation failed")
    if not local_anomaly["Witten_anomaly_cancelled"]:
        raise RuntimeError("SU(2) mod-two anomaly cancellation failed")

    theta_rows = [
        os_topological_sector_witness(theta)
        for theta in (0.0, 0.19, 0.73, math.pi / 2.0, math.pi, 5.91)
    ]
    maximum_factorization_residual = max(
        row["factorization_residual"] for row in theta_rows
    )
    maximum_reality_residual = max(
        row["OS_reality_residual"] for row in theta_rows
    )
    minimum_os_form = min(row["absolute_square"] for row in theta_rows)

    # CP sends Q to -Q without OS's compensating anti-linearity.  Requiring
    # exp(i theta Q)=exp(-i theta Q) for all integer Q gives theta=0 or pi mod 2pi.
    cp_rows = []
    for theta in (0.0, 0.19, math.pi, 4.2, 2.0 * math.pi):
        maximum_residual = max(
            abs(
                cmath.exp(1.0j * theta * charge)
                - cmath.exp(-1.0j * theta * charge)
            )
            for charge in range(-3, 4)
        )
        cp_rows.append(
            {
                "theta": theta,
                "maximum_CP_residual_Q_minus3_to_3": maximum_residual,
                "CP_invariant_on_integer_sectors": maximum_residual < 1.0e-12,
            }
        )

    out = {
        "certificate": "URT global OS/chiral-measure phase audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "anomaly_prerequisites": {
            "carrier": "one left-handed 16=1+10+5bar generation, repeated three times",
            "gauge_group": "(SU(3)xSU(2)xU(1))/Z6",
            "local_anomaly_audit": local_anomaly,
            "global_input": (
                "Omega_5^Spin(BG)=0 for the Z6-quotient Standard Model group"
            ),
            "meaning": (
                "Gauge anomalies do not obstruct a measure, but cancellation "
                "does not canonically choose its phase."
            ),
            "status": "E arithmetic; E from cited spin-bordism computation",
        },
        "reflection_even_history_phase": {
            "functional": "Phi_lambda=exp(i lambda chi Omega5)",
            "parity": "(chi Omega5)[theta A]=+(chi Omega5)[A]",
            "OS_reality": "Phi_lambda[theta A]=conj(Phi_lambda[A])",
            "continuous_configuration_consequence": "lambda=0",
            "advance": (
                "Vacuum OS anti-linearity supplies the missing non-homogeneous "
                "equation for this specific local history counterterm."
            ),
            "status": "E conditional on vacuum OS reflection",
        },
        "reflection_odd_topological_phase": {
            "functional": "Phi_theta[A]=exp(i theta Q[A])",
            "charge": "Q=(1/8 pi^2) integral tr(F wedge F), integer on normalized nonabelian sectors",
            "parity": "Q[theta A]=-Q[A]",
            "OS_reality_identity": (
                "Phi_theta[theta A]=exp(-i theta Q[A])=conj(Phi_theta[A]) "
                "for every real theta"
            ),
            "half_space_factorization": (
                "if Q=Q_++Q_- and Q_+(theta A_-)=-Q_-(A_-), then "
                "Phi_theta=F_theta Theta(F_theta), F_theta=exp(i theta Q_+)"
            ),
            "finite_sector_witnesses": theta_rows,
            "maximum_factorization_residual": maximum_factorization_residual,
            "maximum_OS_reality_residual": maximum_reality_residual,
            "minimum_sampled_OS_form": minimum_os_form,
            "parameter_space": "theta in R/(2 pi Z)",
            "status": "E",
        },
        "CP_boundary": {
            "linear_CP_condition": "exp(i theta Q)=exp(-i theta Q) for every integer Q",
            "solutions": "theta=0 or pi modulo 2 pi",
            "rows": cp_rows,
            "conclusion": (
                "Even adding exact CP does not select between the two fixed points. "
                "A positivity, vacuum-selection or microscopic-regulator rule is "
                "still required to choose zero rather than pi."
            ),
            "status": "E",
        },
        "lattice_measure_scope": {
            "Ginsparg_Wilson_fact": (
                "Changing a chiral basis changes the finite-lattice Weyl measure "
                "by a gauge-field-dependent phase."
            ),
            "known_constructive_scope": (
                "Anomaly-free U(1) chiral theories have a nonperturbative local, "
                "smooth, gauge-invariant measure construction; the general "
                "four-dimensional nonabelian reconstruction is not supplied by "
                "the current Cathedral certificates."
            ),
            "primary_references": [
                {
                    "authors": "Martin Luscher",
                    "title": "Abelian chiral gauge theories on the lattice with exact gauge invariance",
                    "arXiv": "hep-lat/9811032",
                },
                {
                    "authors": "Martin Luscher",
                    "title": "Weyl fermions on the lattice and the non-abelian gauge anomaly",
                    "arXiv": "hep-lat/9904009",
                },
                {
                    "authors": "Joe Davighi, Ben Gripaios, Nakarin Lohitsiri",
                    "title": "Global anomalies in the Standard Model(s) and Beyond",
                    "arXiv": "1910.11277",
                },
            ],
            "status": "E literature boundary",
        },
        "verdict": {
            "OS_selects_history_lambda_zero": "E conditional",
            "local_and_global_gauge_anomalies_cancel": "E",
            "OS_selects_topological_theta": "F",
            "CP_selects_unique_theta": "F",
            "globally_unique_chiral_measure": "U",
            "advance": (
                "OS closes the previously exhibited reflection-even lambda orbit, "
                "but an explicit reflection-odd topological theta circle remains "
                "OS-positive. The determinant ambiguity has been reduced and "
                "reclassified, not eliminated."
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