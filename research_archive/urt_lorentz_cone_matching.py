#!/usr/bin/env python3
"""Common-cone audit for the reflected lattice gauge and fermion actions.

One lattice layer has an unfixed physical temporal length tau relative to a
unit spatial edge.  The embedded A4 Euclidean metric gives tau=sqrt(5)/2,
whereas the first free-kernel certificate implicitly used tau=1.

For temporal fermion coefficient c_t, a unit continuum cone requires
c_t*tau=1.  Wilson reflection positivity requires |c_t|<=r_t; with r_t=1 this
only implies tau>=1.  The gauge plaquette frame at general tau fixes

    a_spatial/b_electric = 8 tau^2-4.

Thus OS positivity and leading Lorentz isotropy leave tau continuous.  The A4
metric branch gives c_t=2/sqrt(5) and a:b=6:1; the layer-unit branch gives
c_t=1 and a:b=4:1.  This script constructs the corrected A4-metric kernel,
checks its Wilson OS cone and overlap/GW gap, and records that the published
free-overlap reflection proof must be re-established for c_t != r_t.

No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import differential_evolution


def gamma_matrices() -> tuple[list[np.ndarray], np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1.0j], [1.0j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    gamma0 = np.kron(sigma1, identity2)
    gamma1 = np.kron(sigma2, sigma1)
    gamma2 = np.kron(sigma2, sigma2)
    gamma3 = np.kron(sigma2, sigma3)
    gamma5 = np.kron(sigma3, identity2)
    return [gamma0, gamma1, gamma2, gamma3], gamma5


def incidence(momentum: np.ndarray) -> float:
    return float(np.prod(np.cos(momentum / 2.0)))


def components(
    omega: float,
    momentum: np.ndarray,
    wilson_r: float,
    temporal_kinetic: float,
) -> tuple[np.ndarray, float]:
    c_value = incidence(momentum)
    kinetic = np.concatenate(
        ([temporal_kinetic * c_value * math.sin(omega)], np.sin(momentum))
    )
    scalar = (
        wilson_r * float(np.sum(1.0 - np.cos(momentum)))
        + 1.0
        - c_value * math.cos(omega)
    )
    return kinetic, scalar


def overlap_matrix(
    omega: float,
    momentum: np.ndarray,
    wilson_r: float,
    temporal_kinetic: float,
    gammas: list[np.ndarray],
) -> tuple[np.ndarray, float]:
    kinetic, scalar = components(
        omega, momentum, wilson_r, temporal_kinetic
    )
    x_scalar = scalar - 1.0
    norm_squared = float(np.dot(kinetic, kinetic) + x_scalar**2)
    x_matrix = x_scalar * np.eye(4, dtype=complex)
    for gamma, coefficient in zip(gammas, kinetic):
        x_matrix += 1.0j * coefficient * gamma
    overlap = 0.5 * (
        np.eye(4, dtype=complex) + x_matrix / math.sqrt(norm_squared)
    )
    return overlap, norm_squared


def branch(tau: float) -> dict[str, Any]:
    temporal_kinetic = 1.0 / tau
    gauge_ratio = 8.0 * tau**2 - 4.0
    os_minimum = 0.5 * (1.0 - abs(temporal_kinetic))
    return {
        "tau": tau,
        "temporal_kinetic_c_t": temporal_kinetic,
        "continuum_speed_c_t_times_tau": temporal_kinetic * tau,
        "gauge_spatial_to_electric_weight_ratio": gauge_ratio,
        "minimum_temporal_OS_hop_eigenvalue": os_minimum,
        "Wilson_OS_allowed": os_minimum >= -1.0e-15,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    roots = np.roots([240.0, -392.0, -28.0, 185.0])
    wilson_r = next(
        float(root.real)
        for root in roots
        if abs(root.imag) < 1.0e-12 and 7.0 / 6.0 < root.real < 6.0 / 5.0
    )
    tau_a4 = math.sqrt(5.0) / 2.0
    temporal_a4 = 2.0 / math.sqrt(5.0)
    a4_branch = branch(tau_a4)
    layer_branch = branch(1.0)

    gammas, gamma5 = gamma_matrices()
    identity4 = np.eye(4, dtype=complex)
    projector_eigenvalues = []
    hop_plus = 0.5 * (identity4 + temporal_a4 * gammas[0])
    hop_minus = 0.5 * (identity4 - temporal_a4 * gammas[0])
    projector_eigenvalues.extend(np.linalg.eigvalsh(hop_plus).tolist())
    projector_eigenvalues.extend(np.linalg.eigvalsh(hop_minus).tolist())

    def kernel_square(point: np.ndarray) -> float:
        _, norm_squared = overlap_matrix(
            float(point[0]),
            np.asarray(point[1:]),
            wilson_r,
            temporal_a4,
            gammas,
        )
        return norm_squared

    optimization_rows = []
    best_gap = math.inf
    best_point: list[float] | None = None
    for seed in range(12):
        result = differential_evolution(
            kernel_square,
            [(-math.pi, math.pi)] * 4,
            seed=20260904 + seed,
            popsize=14,
            tol=1.0e-12,
            polish=True,
            workers=1,
        )
        optimization_rows.append(
            {"seed": seed, "minimum": float(result.fun), "point": result.x.tolist()}
        )
        if result.fun < best_gap:
            best_gap = float(result.fun)
            best_point = result.x.tolist()

    rng = np.random.default_rng(20260904)
    gw_residual = 0.0
    gamma5_hermiticity_residual = 0.0
    for _ in range(1000):
        omega = float(rng.uniform(-math.pi, math.pi))
        momentum = rng.uniform(-math.pi, math.pi, size=3)
        overlap, _ = overlap_matrix(
            omega, momentum, wilson_r, temporal_a4, gammas
        )
        gw_residual = max(
            gw_residual,
            float(
                np.linalg.norm(
                    gamma5 @ overlap
                    + overlap @ gamma5
                    - 2.0 * overlap @ gamma5 @ overlap
                )
            ),
        )

        kinetic, scalar = components(
            omega, momentum, wilson_r, temporal_a4
        )
        wilson = scalar * identity4
        for gamma, coefficient in zip(gammas, kinetic):
            wilson += 1.0j * coefficient * gamma
        gamma5_hermiticity_residual = max(
            gamma5_hermiticity_residual,
            float(np.linalg.norm(wilson.conj().T - gamma5 @ wilson @ gamma5)),
        )

    # The old c_t=1 bound was X^dagger X>=1/2.  Reducing c_t^2 to 4/5
    # subtracts at most (1/5) C^2 sin^2(omega), hence the rigorous inherited-
    # metric bound is >=3/10.  Numerically the exact minimum is 4/5 at p=0,
    # omega=+/-pi/2.
    rigorous_gap_lower = 0.5 - (1.0 - temporal_a4**2)
    weak_field_hop_bound = 3.0 * wilson_r + 4.0 + temporal_a4
    conservative_hop_bound = 43.0 / 5.0
    conservative_link_radius = math.sqrt(rigorous_gap_lower) / conservative_hop_bound

    tau_rows = [branch(value) for value in (0.8, 1.0, tau_a4, 1.5, 2.0)]

    out = {
        "certificate": "URT common Lorentz-cone normalization audit",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "general_matching_equations": {
            "physical_layer_length": "tau in spatial-edge units",
            "fermion_principal_symbol": (
                "i gamma_i k_i+i gamma_0(c_t tau) k_0; unit cone requires c_t tau=1"
            ),
            "Wilson_OS_condition": (
                "temporal hop matrices (I+/-c_t gamma0)/2 are positive iff |c_t|<=1"
            ),
            "combined_consequence_at_r_t_1": "tau>=1",
            "gauge_frame": (
                "M_sp=diag(0_3,1_3), M_el=diag(8 tau^2 I_3,4 I_3)"
            ),
            "gauge_isotropy": "a/b=8 tau^2-4",
            "remaining_modulus": (
                "Every tau>=1 gives a common leading cone and a positive Wilson "
                "reflection kernel after c_t=1/tau and a/b=8tau^2-4."
            ),
            "sampled_branches": tau_rows,
            "status": "E",
        },
        "two_distinguished_branches": {
            "inherited_A4_metric": {
                **a4_branch,
                "exact_tau": "sqrt(5)/2",
                "exact_c_t": "2/sqrt(5)",
                "exact_gauge_ratio": "6:1",
            },
            "unit_layer_metric": {
                **layer_branch,
                "exact_tau": "1",
                "exact_c_t": "1",
                "exact_gauge_ratio": "4:1",
            },
            "compatibility_correction": (
                "The earlier c_t=1 free kernel and the 6:1 gauge action use "
                "different tau branches. They become a common-cone pair only by "
                "changing the fermion coefficient to 2/sqrt(5), or the gauge ratio to 4:1."
            ),
        },
        "corrected_inherited_metric_kernel": {
            "formula": (
                "D_W=i gamma_i sin(p_i)+i(2/sqrt(5))gamma0 C(p)sin(omega)+"
                "r sum_i(1-cos p_i)+1-C(p)cos(omega)"
            ),
            "temporal_hop_eigenvalues": sorted(float(value) for value in projector_eigenvalues),
            "minimum_temporal_hop_eigenvalue_exact": "(1-2/sqrt(5))/2>0",
            "Wilson_OS_cone": "E",
            "unique_doubler_free_zero": (
                "E: the unchanged nonnegative Wilson scalar vanishes only at the origin"
            ),
            "rigorous_XdaggerX_lower_bound": rigorous_gap_lower,
            "rigorous_bound_derivation": (
                "the c_t=1 bound 1/2 loses at most (1-c_t^2)C^2 sin^2(omega)=1/5"
            ),
            "numerical_global_minimum_XdaggerX": best_gap,
            "numerical_minimizer": best_point,
            "multistarts": optimization_rows,
            "expected_exact_numerical_minimum": "4/5 at p=0, omega=+/-pi/2",
            "gamma5_hermiticity_residual": gamma5_hermiticity_residual,
            "GW_residual": gw_residual,
            "weak_field_hop_norm_sum": weak_field_hop_bound,
            "conservative_hop_norm_bound": conservative_hop_bound,
            "conservative_link_gap_radius": conservative_link_radius,
            "status": "E algebra and positive gap; N exact sharp minimum",
        },
        "reflection_positivity_boundary": {
            "Wilson_bilinear": (
                "E for every tau>=1 because the two temporal hop matrices are positive"
            ),
            "overlap_operator": (
                "GW and locality follow from the gap, but the published free-overlap "
                "spectral proof used c_t=r_t=1. Its pole/residue step must be redone "
                "for c_t=2/sqrt(5); it is not established by the Wilson cone alone."
            ),
            "status": "E Wilson; U corrected-overlap OS proof",
        },
        "verdict": {
            "common_cone_exists": "E as a one-parameter family",
            "inherited_metric_common_cone": "E for gauge plus Wilson/GW algebra",
            "unique_physical_time_normalization": "U",
            "corrected_overlap_reflection_positivity": "U",
            "advance": (
                "The gauge/fermion speed mismatch is repaired exactly on either "
                "metric branch, but the physical layer aspect ratio remains a true "
                "continuous modulus. The inherited A4 branch now has a corrected "
                "doubler-free GW kernel with a rigorous gap."
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