#!/usr/bin/env python3
"""Free Wilson/overlap kernel on the reflected Cathedral lattice.

The minimal reflection closure has cubic spatial slices.  Adjacent slices are
offset by all eight half-cube vectors, whose normalized incidence symbol is

    C(p)=prod_i cos(p_i/2) >= 0  on [-pi,pi]^3.

This permits a local Wilson kernel

 D_W = i sum_i gamma_i sin p_i + i gamma_0 C(p) sin omega
       + r sum_i(1-cos p_i) + 1-C(p)cos omega.

The cross-time term factors through C(p) P_+ and C(p) P_- with
P_+/-=(1+/-gamma_0)/2, so it satisfies the standard free-fermion reflection
cone condition.  The kernel has one massless zero.  With X=D_W-M, 0<M<=1,
the same spectral positivity used in the free-overlap reflection-positivity
proof survives because X^dagger X is affine in cos(omega) and C(p)>=0.

The script checks the Cathedral-selected spatial Wilson coefficient and M=1.
Gauge-field reflection positivity and the chiral determinant measure remain
separate.  No observational target is used.
"""

from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import numpy as np
from scipy.optimize import differential_evolution


def stationarity_polynomial(value: float) -> float:
    return 240.0 * value**3 - 392.0 * value**2 - 28.0 * value + 185.0


def pauli_matrices() -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    identity2 = np.eye(2, dtype=complex)
    sigma1 = np.array([[0.0, 1.0], [1.0, 0.0]], dtype=complex)
    sigma2 = np.array([[0.0, -1.0j], [1.0j, 0.0]], dtype=complex)
    sigma3 = np.array([[1.0, 0.0], [0.0, -1.0]], dtype=complex)
    return identity2, sigma1, sigma2, sigma3


def gamma_matrices() -> tuple[list[np.ndarray], np.ndarray]:
    identity2, sigma1, sigma2, sigma3 = pauli_matrices()
    gamma0 = np.kron(sigma1, identity2)
    gamma1 = np.kron(sigma2, sigma1)
    gamma2 = np.kron(sigma2, sigma2)
    gamma3 = np.kron(sigma2, sigma3)
    gamma5 = np.kron(sigma3, identity2)
    return [gamma0, gamma1, gamma2, gamma3], gamma5


def incidence(spatial_momentum: np.ndarray) -> float:
    return float(np.prod(np.cos(spatial_momentum / 2.0)))


def components(
    omega: float,
    spatial_momentum: np.ndarray,
    wilson_r: float,
) -> tuple[np.ndarray, float, float]:
    c_value = incidence(spatial_momentum)
    kinetic = np.concatenate(
        ([c_value * math.sin(omega)], np.sin(spatial_momentum))
    )
    wilson_scalar = (
        wilson_r * float(np.sum(1.0 - np.cos(spatial_momentum)))
        + 1.0
        - c_value * math.cos(omega)
    )
    return kinetic, wilson_scalar, c_value


def wilson_matrix(
    omega: float,
    spatial_momentum: np.ndarray,
    wilson_r: float,
    gammas: list[np.ndarray],
) -> np.ndarray:
    kinetic, scalar, _ = components(omega, spatial_momentum, wilson_r)
    result = scalar * np.eye(4, dtype=complex)
    for gamma, coefficient in zip(gammas, kinetic):
        result += 1.0j * coefficient * gamma
    return result


def overlap_matrix(
    omega: float,
    spatial_momentum: np.ndarray,
    wilson_r: float,
    mass: float,
    gammas: list[np.ndarray],
) -> tuple[np.ndarray, float]:
    kinetic, scalar, _ = components(omega, spatial_momentum, wilson_r)
    norm_squared = float(np.dot(kinetic, kinetic) + (scalar - mass) ** 2)
    x_matrix = wilson_matrix(omega, spatial_momentum, wilson_r, gammas) - mass * np.eye(4)
    overlap = 0.5 * (np.eye(4) + x_matrix / math.sqrt(norm_squared))
    return overlap, norm_squared


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    polynomial_roots = np.roots([240.0, -392.0, -28.0, 185.0])
    admissible_roots = [
        float(root.real)
        for root in polynomial_roots
        if abs(root.imag) < 1.0e-12 and 1.1 < root.real < 1.3
    ]
    if len(admissible_roots) != 1:
        raise RuntimeError(f"unexpected Wilson roots: {polynomial_roots}")
    wilson_r = admissible_roots[0]
    overlap_mass = 1.0
    gammas, gamma5 = gamma_matrices()
    identity4 = np.eye(4, dtype=complex)

    clifford_residual = 0.0
    for i in range(4):
        for j in range(4):
            target = 2.0 * identity4 if i == j else np.zeros((4, 4), dtype=complex)
            clifford_residual = max(
                clifford_residual,
                float(np.linalg.norm(gammas[i] @ gammas[j] + gammas[j] @ gammas[i] - target)),
            )

    # The eight half-cube offsets factor exactly into the product of cosines.
    rng = np.random.default_rng(20260904)
    incidence_identity_residual = 0.0
    for _ in range(1000):
        momentum = rng.uniform(-math.pi, math.pi, size=3)
        direct = 0.0j
        for signs in np.ndindex(2, 2, 2):
            epsilon = np.array([1.0 if bit else -1.0 for bit in signs])
            direct += np.exp(0.5j * float(np.dot(epsilon, momentum)))
        direct /= 8.0
        incidence_identity_residual = max(
            incidence_identity_residual, abs(direct - incidence(momentum))
        )

    axis = np.linspace(-math.pi, math.pi, 65)
    incidence_minimum = 1.0
    incidence_maximum = 0.0
    cross_block_minimum = math.inf
    projector_plus = 0.5 * (identity4 + gammas[0])
    projector_minus = 0.5 * (identity4 - gammas[0])
    projector_residual = max(
        float(np.linalg.norm(projector_plus @ projector_plus - projector_plus)),
        float(np.linalg.norm(projector_minus @ projector_minus - projector_minus)),
        float(np.linalg.norm(projector_plus @ projector_minus)),
    )
    # A product grid suffices to audit the already exact sign identity.
    for p1 in axis:
        for p2 in axis:
            for p3 in axis:
                c_value = incidence(np.array([p1, p2, p3]))
                incidence_minimum = min(incidence_minimum, c_value)
                incidence_maximum = max(incidence_maximum, c_value)
                cross_block_minimum = min(
                    cross_block_minimum,
                    float(np.min(np.linalg.eigvalsh(c_value * projector_plus))),
                    float(np.min(np.linalg.eigvalsh(c_value * projector_minus))),
                )

    # Global numerical gap audit for X^dagger X, supplementing the exact no-zero proof.
    def kernel_square(point: np.ndarray) -> float:
        omega = float(point[0])
        momentum = np.asarray(point[1:])
        kinetic, scalar, _ = components(omega, momentum, wilson_r)
        return float(np.dot(kinetic, kinetic) + (scalar - overlap_mass) ** 2)

    optimization_rows = []
    best_gap = math.inf
    best_point: list[float] | None = None
    for seed in range(12):
        result = differential_evolution(
            kernel_square,
            [(-math.pi, math.pi)] * 4,
            seed=20260904 + seed,
            popsize=14,
            tol=1.0e-11,
            polish=True,
            workers=1,
        )
        optimization_rows.append(
            {"seed": seed, "minimum": float(result.fun), "point": result.x.tolist()}
        )
        if result.fun < best_gap:
            best_gap = float(result.fun)
            best_point = result.x.tolist()

    # The key continuation positivity matrix at imaginary energy.  For
    # A=r B+1-M, C>0, its lower eigenvalue is
    # C sinh(E)-sqrt(S^2+(A-C cosh(E))^2), nonnegative for E>=E1.
    spectral_rows = []
    minimum_spectral_factor = math.inf
    for _ in range(500):
        momentum = rng.uniform(-0.98 * math.pi, 0.98 * math.pi, size=3)
        c_value = incidence(momentum)
        b_value = float(np.sum(1.0 - np.cos(momentum)))
        s_squared = float(np.sum(np.sin(momentum) ** 2))
        a_value = wilson_r * b_value + 1.0 - overlap_mass
        if a_value <= 1.0e-12 or c_value <= 1.0e-12:
            continue
        cosh_threshold = (s_squared + a_value**2 + c_value**2) / (
            2.0 * a_value * c_value
        )
        cosh_threshold = max(cosh_threshold, 1.0)
        threshold = math.acosh(cosh_threshold)
        row_minimum = math.inf
        for offset in (0.0, 0.01, 0.1, 1.0, 3.0):
            energy = threshold + offset
            lower = c_value * math.sinh(energy) - math.sqrt(
                s_squared + (a_value - c_value * math.cosh(energy)) ** 2
            )
            row_minimum = min(row_minimum, lower)
            minimum_spectral_factor = min(minimum_spectral_factor, lower)
        spectral_rows.append(
            {
                "C": c_value,
                "A": a_value,
                "E1": threshold,
                "minimum_lower_eigenvalue_E_ge_E1": row_minimum,
            }
        )

    gw_residual = 0.0
    gamma5_hermiticity_residual = 0.0
    overlap_zero_norm = float(np.linalg.norm(overlap_matrix(0.0, np.zeros(3), wilson_r, overlap_mass, gammas)[0]))
    for _ in range(500):
        omega = float(rng.uniform(-math.pi, math.pi))
        momentum = rng.uniform(-math.pi, math.pi, size=3)
        d_w = wilson_matrix(omega, momentum, wilson_r, gammas)
        gamma5_hermiticity_residual = max(
            gamma5_hermiticity_residual,
            float(np.linalg.norm(d_w.conj().T - gamma5 @ d_w @ gamma5)),
        )
        d_overlap, _ = overlap_matrix(
            omega, momentum, wilson_r, overlap_mass, gammas
        )
        gw_residual = max(
            gw_residual,
            float(
                np.linalg.norm(
                    gamma5 @ d_overlap
                    + d_overlap @ gamma5
                    - 2.0 * d_overlap @ gamma5 @ d_overlap
                )
            ),
        )

    chemical_rows = []
    for chemical_potential in (0.0, 0.1, 0.5, 1.0):
        chemical_rows.append(
            {
                "mu": chemical_potential,
                "forward_minus_reflected_backward_coefficient": (
                    math.exp(chemical_potential) - math.exp(-chemical_potential)
                ),
                "equals_2_sinh_mu_residual": abs(
                    math.exp(chemical_potential)
                    - math.exp(-chemical_potential)
                    - 2.0 * math.sinh(chemical_potential)
                ),
            }
        )

    out = {
        "certificate": "URT reflection-positive free Wilson/overlap kernel",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "lattice_slicing": {
            "spatial_slice": "Z^3 generated by the six q=1 vectors +/-u_i",
            "adjacent_slice_offset": "Z^3+(1/2,1/2,1/2)",
            "future_links": "all eight (1; epsilon_1/2,epsilon_2/2,epsilon_3/2)",
            "normalized_incidence": "C(p)=product_i cos(p_i/2)",
            "incidence_identity_residual": incidence_identity_residual,
            "grid_minimum_C": incidence_minimum,
            "grid_maximum_C": incidence_maximum,
            "status": "E",
        },
        "Wilson_kernel": {
            "formula": (
                "D_W=i gamma_i sin(p_i)+i gamma_0 C(p)sin(omega)+"
                "r sum_i(1-cos(p_i))+1-C(p)cos(omega)"
            ),
            "spatial_Wilson_r": wilson_r,
            "r_polynomial_residual": abs(stationarity_polynomial(wilson_r)),
            "temporal_Wilson_r": 1,
            "clifford_residual": clifford_residual,
            "gamma5_hermiticity_residual": gamma5_hermiticity_residual,
            "finite_range": "six spatial nearest links plus eight links to each adjacent slice",
            "continuum_symbol": "D_W=i gamma_mu p_mu+O(|p|^2) in layer coordinates",
        },
        "reflection_cone_factorization": {
            "temporal_identity": (
                "1-C cos(omega)+i gamma0 C sin(omega)="
                "1-C[P_- exp(i omega)+P_+ exp(-i omega)]"
            ),
            "P_plus_minus": "(I+/-gamma0)/2",
            "projector_residual": projector_residual,
            "minimum_eigenvalue_of_C_P_plus_minus_on_grid": cross_block_minimum,
            "proof": (
                "C is a positive convolution operator, so C P_+/- has the square-"
                "root factorization required for the cross-reflection Grassmann cone; "
                "all spatial terms lie within A_+ plus its reflection."
            ),
            "status": "E for the free Wilson bilinear",
        },
        "doubler_theorem": {
            "scalar_nonnegative": (
                "r sum(1-cos p_i)+1-C cos omega >=0 for r>0 because 0<=C<=1"
            ),
            "unique_zero": (
                "The scalar vanishes only at p=0, omega=0; hence D_W has exactly "
                "one massless zero regardless of any additional kinetic zeros."
            ),
            "status": "E",
        },
        "overlap_kernel": {
            "X": "D_W-M with M=1",
            "mass": overlap_mass,
            "exact_no_zero_cases": [
                "p_i=0, omega=0: X=-I",
                "p_i=0, omega=pi: scalar X=+1",
                "any spatial corner with k>=1: scalar X=2 r k>0",
                "away from kinetic zeros X^dagger X is strictly positive",
            ],
            "numerical_global_minimum_XdaggerX": best_gap,
            "numerical_minimizer": best_point,
            "multistarts": optimization_rows,
            "overlap_zero_norm_at_origin": overlap_zero_norm,
            "GW_maximum_residual": gw_residual,
            "status": "E algebra/GW and no-zero proof; N for displayed global gap",
        },
        "overlap_reflection_spectral_factor": {
            "identity": (
                "XdaggerX(iE,p)=S^2+A^2+C^2-2AC cosh(E), "
                "A=r sum(1-cos p_i)+1-M"
            ),
            "threshold": "cosh(E1)=(S^2+A^2+C^2)/(2AC)>=1",
            "positive_matrix": (
                "for E>=E1, the least eigenvalue of -gamma0 X(iE,p) is "
                "C sinh(E)-sqrt(S^2+(A-C cosh(E))^2)>=0"
            ),
            "sample_count": len(spectral_rows),
            "minimum_sampled_lower_eigenvalue": minimum_spectral_factor,
            "scope": (
                "This is the key spectral factor in the published free-overlap proof. "
                "The remaining Grassmann-cone steps transfer unchanged for the free "
                "translation-invariant kernel; gauge links are not covered."
            ),
            "primary_reference": {
                "authors": "Y. Kikukawa and K. Usui",
                "title": "Reflection Positivity of Free Overlap Fermions",
                "arXiv": "1005.3751",
            },
            "status": "E conditional on the standard finite-volume cone closure",
        },
        "chemical_potential_boundary": {
            "standard_insertion": "forward/backward temporal factors exp(+/-mu)",
            "unmodified_reflection_condition": "exp(mu)=exp(-mu)",
            "unique_real_solution": "mu=0",
            "rows": chemical_rows,
            "scope_warning": (
                "A nonzero-density theory can use a modified thermal reflection, but "
                "it no longer obeys the vacuum Euclidean reflection used here."
            ),
            "status": "E conditional on vacuum OS reflection",
        },
        "verdict": {
            "local_translation_invariant_reflection_kernel": "E",
            "free_Wilson_reflection_positivity": "E",
            "single_massless_species": "E",
            "Ginsparg_Wilson_overlap": "E",
            "free_overlap_reflection_positivity": "E conditional",
            "vacuum_reflection_selects_mu_zero": "E conditional",
            "gauge_interacting_chiral_measure": "U",
            "advance": (
                "The two-coset repair supplies the previously missing free local, "
                "doubler-free and reflection-positive fermion layer.  It is compatible "
                "with the URT-selected spatial Wilson coefficient.  The remaining hard "
                "gate is the gauge-covariant chiral determinant/measure."
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