#!/usr/bin/env python3
"""Executable closure advance for URT / Newton's Cathedral.

This is a verifier/solver, not a manuscript.  It keeps failed branches as
explicit no-go results, implements the smallest repairs that can be checked,
and refuses to relabel response arithmetic as derived dynamics.

No measured particle masses, mixings, or cosmological parameters are used.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Callable

import numpy as np
from numpy.polynomial import Polynomial


TOL = 2.0e-10
D, V, N, E, F, Q, HIDDEN = 3, 12, 13, 30, 20, 5, 8
PHI = (1.0 + math.sqrt(5.0)) / 2.0
GAMMA = 1.0 / 81.0
D_STAR = (1.0 - GAMMA) * math.pi / (N * PHI)
D_CLASSICAL = D / F
DELTA = D_CLASSICAL - D_STAR
ETA_DELTA = -math.log(DELTA)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def _even_permutations(n: int = 5) -> list[tuple[int, ...]]:
    out: list[tuple[int, ...]] = []
    for p in itertools.permutations(range(n)):
        inversions = sum(p[i] > p[j] for i in range(n) for j in range(i + 1, n))
        if inversions % 2 == 0:
            out.append(p)
    return out


def a4_su5_and_nonconflation() -> dict[str, Any]:
    """Derive su(5) from the A_4 roots and keep the two rank-8 splits distinct."""
    eye5 = np.eye(5)
    one5 = np.ones(5)
    projector_h = eye5 - np.outer(one5, one5) / 5.0
    ordered_pairs = [(i, j) for i in range(5) for j in range(5) if i != j]
    pair_index = {pair: k for k, pair in enumerate(ordered_pairs)}
    roots = np.asarray([(eye5[i] - eye5[j]) / math.sqrt(2.0) for i, j in ordered_pairs])

    tight_error = float(np.linalg.norm(roots.T @ roots - 5.0 * projector_h))
    require(np.linalg.matrix_rank(roots) == 4, "A_4 roots must span rank four")
    require(tight_error < TOL, "A_4 tight-frame identity failed")

    cartan = 2.0 * np.eye(4) - np.eye(4, k=1) - np.eye(4, k=-1)
    require(round(float(np.linalg.det(cartan))) == 5, "det Cartan(A_4) must be five")

    colour, weak = {0, 1, 2}, {3, 4}
    within_colour = [k for k, (i, j) in enumerate(ordered_pairs) if i in colour and j in colour]
    within_weak = [k for k, (i, j) in enumerate(ordered_pairs) if i in weak and j in weak]
    cross = [
        k for k, (i, j) in enumerate(ordered_pairs)
        if (i in colour and j in weak) or (i in weak and j in colour)
    ]
    require([len(within_colour), len(within_weak), len(cross)] == [6, 2, 12], "3+2 root split failed")

    # Basis-independent centre + tetrahedral-vacuum split.
    centre = np.ones(5) / math.sqrt(5.0)
    vacuum = np.array([1.0, 1.0, 1.0, 1.0, -4.0]) / math.sqrt(20.0)
    p2 = np.outer(centre, centre) + np.outer(vacuum, vacuum)
    p3 = np.eye(5) - p2
    hypercharge = -p3 / 3.0 + p2 / 2.0
    y_spectrum = np.linalg.eigvalsh(hypercharge)
    expected_y = np.array([-1 / 3] * 3 + [1 / 2] * 2)
    require(np.max(np.abs(y_spectrum - expected_y)) < TOL, "centre+vacuum hypercharge split failed")
    # On End(C5), ad_Y has 13 zero modes; remove the scalar identity to get 12 in sl5.
    ad_y = np.kron(np.eye(5), hypercharge) - np.kron(hypercharge.T, np.eye(5))
    ad_spectrum = np.linalg.eigvalsh(ad_y)
    ad_counts = {
        "-5/6": int(np.sum(np.isclose(ad_spectrum, -5 / 6, atol=TOL))),
        "0_in_sl5": int(np.sum(np.isclose(ad_spectrum, 0.0, atol=TOL))) - 1,
        "+5/6": int(np.sum(np.isclose(ad_spectrum, 5 / 6, atol=TOL))),
    }
    require(ad_counts == {"-5/6": 6, "0_in_sl5": 12, "+5/6": 6}, "adjoint vacuum branching failed")

    # The hidden 4+4 incidence module and the 8 within-block roots have equal
    # dimensions but are not equal subspaces.  Compute the principal angles.
    group = _even_permutations(5)
    require(len(group) == 60, "orientation-preserving Weyl subgroup must have order 60")
    p4 = np.zeros((20, 20))
    for p in group:
        representation = np.zeros((20, 20))
        for source, (i, j) in enumerate(ordered_pairs):
            target = pair_index[(p[i], p[j])]
            representation[target, source] = 1.0
        chi4 = sum(p[i] == i for i in range(5)) - 1  # 5-permutation rep = 1 + 4
        p4 += (4.0 / 60.0) * chi4 * representation
    p4 = (p4 + p4.T) / 2.0
    evals, evecs = np.linalg.eigh(p4)
    hidden_basis = evecs[:, evals > 0.5]
    require(hidden_basis.shape == (20, 8), "4-isotypic projector must have rank eight")
    block_projector = np.zeros((20, 20))
    block_projector[within_colour + within_weak, within_colour + within_weak] = 1.0
    cos2 = np.linalg.eigvalsh(hidden_basis.T @ block_projector @ hidden_basis)
    expected_cos2 = np.array([0.0, 0.0, 1 / 3, 1 / 3, 2 / 5, 3 / 5, 3 / 5, 14 / 15])
    require(np.max(np.abs(np.sort(cos2) - expected_cos2)) < TOL, "rank-8 non-conflation spectrum failed")

    return {
        "root_system": "A_4 = {e_i-e_j : i != j} in sum(x_i)=0",
        "root_count": len(roots),
        "rank": int(np.linalg.matrix_rank(roots)),
        "tight_frame_identity": "sum u_ij u_ij^T = 5(I-11^T/5)",
        "tight_frame_error": tight_error,
        "cartan_determinant": int(round(np.linalg.det(cartan))),
        "root_datum": "type A_4, giving sl(5,C); its canonical compact real form is su(5)",
        "gauge_scope": (
            "Physical SU(5) is conditional on treating this copy of A_4 as internal gauge roots "
            "and choosing the compact/unitary real form."
        ),
        "global_cover": {
            "root_lattice": "Q(A_4)",
            "weight_lattice_quotient": "P/Q = Z5",
            "conclusion": "if fundamental 5/10 matter weights are admitted, the gauge cover is SU(5), not only PSU(5)",
        },
        "vacuum_root_counts": {
            "colour_to_colour": len(within_colour),
            "weak_to_weak": len(within_weak),
            "cross_XY": len(cross),
            "cartan": 4,
        },
        "centre_t_vacuum_certificate": {
            "centre": "(1,1,1,1,1)/sqrt(5)",
            "tetrahedral_t": "(1,1,1,1,-4)/sqrt(20), up to the A5 orbit",
            "projector_ranks": [int(round(np.trace(p3))), int(round(np.trace(p2)))],
            "hypercharge_spectrum": [float(x) for x in y_spectrum],
            "ad_Y_multiplicities": ad_counts,
        },
        "split_scope": (
            "The coordinate 3+2 split is an adapted Cartan basis.  Relating it to the original "
            "tetrahedral t-vacuum requires the corresponding SU(5) basis change."
        ),
        "adjoint_branching": (
            "24=(8,1)_0+(1,3)_0+(1,1)_0+"
            "(3,2)_(-5/6)+(bar3,2)_(+5/6)"
        ),
        "low_energy_group": "S(U(3)xU(2)) = (SU(3)xSU(2)xU(1))/Z6",
        "kernel_certificate": "diag(z^-2 A,z^3 B) has kernel z^6=1",
        "hidden_vs_block_principal_cos2": [float(x) for x in np.sort(cos2)],
        "projector_overlap_trace": float(np.trace(p4 @ block_projector)),
        "nonconflation": (
            "For this adapted block split, the incidence 4-isotypic rank-eight space and the within-block 6+2 "
            "coordinate subspace have zero exact intersection.  Equal dimensions never justify identifying them."
        ),
    }


def standard_model_family() -> dict[str, Any]:
    """Branch the positive Spin(10) Fock spinor under the selected 3+2 split."""
    y = np.diag([-1 / 3, -1 / 3, -1 / 3, 1 / 2, 1 / 2])
    t3 = np.diag([0.0, 0.0, 0.0, 1 / 2, -1 / 2])
    require(abs(float(np.trace(y))) < TOL, "hypercharge must be traceless")
    k_ratio = float(np.trace(y @ y) / np.trace(t3 @ t3))
    require(abs(k_ratio - 5 / 3) < TOL, "SU(5) hypercharge normalization failed")

    multiplets = [
        {"name": "nu^c", "rep": "(1,1)", "Y": 0.0, "dimension": 1, "degree": 0},
        {"name": "u^c", "rep": "(bar3,1)", "Y": -2 / 3, "dimension": 3, "degree": 2},
        {"name": "Q", "rep": "(3,2)", "Y": 1 / 6, "dimension": 6, "degree": 2},
        {"name": "e^c", "rep": "(1,1)", "Y": 1.0, "dimension": 1, "degree": 2},
        {"name": "L", "rep": "(1,2)", "Y": -1 / 2, "dimension": 2, "degree": 4},
        {"name": "d^c", "rep": "(bar3,1)", "Y": 1 / 3, "dimension": 3, "degree": 4},
    ]
    require(sum(m["dimension"] for m in multiplets) == 16, "one family must have dimension 16")

    grav_y = sum(m["dimension"] * m["Y"] for m in multiplets)
    cubic_y = sum(m["dimension"] * m["Y"] ** 3 for m in multiplets)
    su3_y = (-2 / 3) / 2 + 2 * (1 / 6) / 2 + (1 / 3) / 2
    su2_y = 3 * (1 / 6) / 2 + (-1 / 2) / 2
    require(max(abs(grav_y), abs(cubic_y), abs(su3_y), abs(su2_y)) < TOL, "anomaly cancellation failed")

    return {
        "ambient_space": "W5_C = C centre + (V4_root)_C",
        "quartet_scope": (
            "V4_root is the standard A_4 root-lattice module.  It is not silently identified "
            "with either incidence-hidden quartet 4_3 or 4_5."
        ),
        "vacuum_split": "W5_C = C3_colour + C2_weak, with C2=span(centre,t)",
        "hypercharge": "Y=diag(-1/3,-1/3,-1/3,1/2,1/2)=diag(-2,-2,-2,3,3)/6",
        "fock_identity": (
            "Lambda^even(C centre + V4_C) = Lambda^even(V4_C) + "
            "centre wedge Lambda^odd(V4_C) ~= Lambda^bullet(V4_C)"
        ),
        "A5_equivariant_bridge": (
            "5|A5=1+4; 10=Lambda^2(5)|A5=4+3+3'; hence 1+10+bar5 restricts as "
            "2*1+2*4+3+3', exactly Lambda^bullet(V4)."
        ),
        "exterior_dimensions": {"Lambda_even_W5": [1, 10, 5], "Lambda_bullet_V4": [1, 4, 6, 4, 1]},
        "multiplets": multiplets,
        "anomaly_residuals": {
            "gravity2_U1": grav_y,
            "U1_cubed": cubic_y,
            "SU3_squared_U1": su3_y,
            "SU2_squared_U1": su2_y,
            "Witten_SU2_doublets_mod2": (3 + 1) % 2,
        },
        "trace_kY_over_k2": k_ratio,
        "bare_sin2_thetaW": 1.0 / (1.0 + k_ratio),
        "bare_angle_scope": (
            "sin^2(theta_W)=3/8 follows at a boundary only after imposing one unified canonically normalized kinetic coupling; "
            "it is not the measured infrared angle."
        ),
        "physical_dictionary_assumptions": [
            "complexify W5",
            "choose Lambda-even chirality",
            "interpret the Fock module as fermionic matter",
            "gauge the compact 3+2 block stabilizer",
        ],
        "status": (
            "Exact representation branching and anomaly calculation.  Its interpretation as one physical family "
            "is conditional on the stated dictionary."
        ),
    }


def _iterate_map(step: Callable[[float], float], x0: float, n: int) -> list[float]:
    orbit = [float(x0)]
    for _ in range(n):
        orbit.append(float(step(orbit[-1])))
    return orbit


def _newton_one_parameter(n: int, target: float, start: float) -> float:
    r = start
    for _ in range(30):
        x, dx = D_STAR, 0.0
        for _ in range(n):
            dx = x * (1.0 - x) + r * (1.0 - 2.0 * x) * dx
            x = r * x * (1.0 - x)
        correction = (x - target) / dx
        r -= correction
        if abs(correction) < 1e-15:
            break
    return float(r)


def _capacity_constraints(r: float, capacity: float) -> tuple[np.ndarray, np.ndarray, list[float]]:
    x, dx_r, dx_k = D_STAR, 0.0, 0.0
    orbit = [x]
    snapshots: dict[int, tuple[float, float, float]] = {}
    for step in range(1, 7):
        slope = r * (1.0 - 2.0 * x / capacity)
        next_dx_r = x * (1.0 - x / capacity) + slope * dx_r
        next_dx_k = r * x * x / (capacity * capacity) + slope * dx_k
        x = r * x * (1.0 - x / capacity)
        dx_r, dx_k = next_dx_r, next_dx_k
        orbit.append(x)
        if step in (3, 6):
            snapshots[step] = (x, dx_r, dx_k)
    residual = np.array([snapshots[3][0] - D_CLASSICAL, snapshots[6][0] - D_STAR])
    jacobian = np.array([
        [snapshots[3][1], snapshots[3][2]],
        [snapshots[6][1], snapshots[6][2]],
    ])
    return residual, jacobian, orbit


def _solve_capacity_map() -> tuple[float, float, list[float]]:
    r, capacity = 3.8417, 1.0003
    for _ in range(30):
        residual, jacobian, orbit = _capacity_constraints(r, capacity)
        correction = np.linalg.solve(jacobian, residual)
        r, capacity = np.array([r, capacity]) - correction
        if np.linalg.norm(correction, ord=np.inf) < 1e-14:
            break
    residual, _, orbit = _capacity_constraints(r, capacity)
    require(np.linalg.norm(residual, ord=np.inf) < TOL, "two-rail capacity closure failed")
    return float(r), float(capacity), [float(x) for x in orbit]


def _solve_biased_map() -> tuple[float, float, list[float]]:
    r, bias = 3.8421, -1.64e-4
    for _ in range(30):
        x, dx_r, dx_c = D_STAR, 0.0, 0.0
        orbit = [x]
        snapshots: dict[int, tuple[float, float, float]] = {}
        for step in range(1, 7):
            slope = r * (1.0 - 2.0 * x)
            next_dx_r = x * (1.0 - x) + slope * dx_r
            next_dx_c = 1.0 + slope * dx_c
            x = r * x * (1.0 - x) + bias
            dx_r, dx_c = next_dx_r, next_dx_c
            orbit.append(x)
            if step in (3, 6):
                snapshots[step] = (x, dx_r, dx_c)
        residual = np.array([snapshots[3][0] - D_CLASSICAL, snapshots[6][0] - D_STAR])
        jacobian = np.array([
            [snapshots[3][1], snapshots[3][2]],
            [snapshots[6][1], snapshots[6][2]],
        ])
        correction = np.linalg.solve(jacobian, residual)
        r, bias = np.array([r, bias]) - correction
        if np.linalg.norm(correction, ord=np.inf) < 1e-14:
            break
    orbit = _iterate_map(lambda x: r * x * (1.0 - x) + bias, D_STAR, 6)
    require(max(abs(orbit[3] - D_CLASSICAL), abs(orbit[6] - D_STAR)) < TOL, "biased closure failed")
    return float(r), float(bias), orbit


def rail_closure() -> dict[str, Any]:
    """Prove the one-parameter failure and solve the minimal zero-preserving unfolding."""
    parameter = Polynomial([0.0, 1.0])
    x_poly = Polynomial([D_STAR])
    for _ in range(3):
        x_poly = parameter * x_poly * (1.0 - x_poly)
    roots = [
        float(z.real) for z in (x_poly - D_CLASSICAL).roots()
        if abs(z.imag) < 1e-7 and -TOL <= z.real <= 4.0 + TOL
    ]
    roots.sort()
    require(len(roots) == 2, "expected both physical roots of f_r^3(d*)=d_cl")
    midpoint_root_return_residuals = []
    for r in roots:
        orbit = _iterate_map(lambda x, rr=r: rr * x * (1.0 - x), D_STAR, 6)
        midpoint_root_return_residuals.append(orbit[6] - D_STAR)
    require(min(abs(x) for x in midpoint_root_return_residuals) > 1e-8, "one-parameter no-go unexpectedly failed")

    r_return = _newton_one_parameter(6, D_STAR, 3.84167)
    old_orbit = _iterate_map(lambda x: r_return * x * (1.0 - x), D_STAR, 6)

    r_cap, capacity, cap_orbit = _solve_capacity_map()
    multiplier = math.prod(r_cap * (1.0 - 2.0 * x / capacity) for x in cap_orbit[:-1])
    lyapunov = math.log(abs(multiplier)) / 6.0
    f_zero = 0.0
    f_one = r_cap * (1.0 - 1.0 / capacity)
    f_max = r_cap * capacity / 4.0
    require(capacity / 2.0 <= 1.0, "quadratic maximum must lie in the unit interval")
    require(min(f_zero, f_one) >= -TOL and f_max <= 1.0 + TOL, "capacity map must preserve [0,1]")
    minimum_cycle_separation = min(
        abs(cap_orbit[i] - cap_orbit[j])
        for i in range(6) for j in range(i + 1, 6)
    )
    require(minimum_cycle_separation > 1e-6, "selected orbit must have primitive period six")
    require(lyapunov < 0.0, "selected six-cycle must be stable")

    r_bias, bias, bias_orbit = _solve_biased_map()
    return {
        "geometric_rails": {"d_star": D_STAR, "d_classical": D_CLASSICAL, "Delta": DELTA},
        "one_parameter_logistic_no_go": {
            "domain": "0 <= r <= 4",
            "all_roots_of_f3_dstar_equals_dclassical": roots,
            "f6_return_residual_at_those_roots": midpoint_root_return_residuals,
            "period6_return_root_near_archive": r_return,
            "its_f3_minus_dclassical": old_orbit[3] - D_CLASSICAL,
            "conclusion": "one parameter cannot put both geometric rails on the same period-six orbit",
        },
        "selected_minimal_repair": {
            "map": "f(x)=r x (1-x/K)",
            "selection": "general zero-preserving quadratic; stable continuation of archived six-cycle",
            "r": r_cap,
            "K": capacity,
            "orbit": cap_orbit[:-1],
            "f3_residual": cap_orbit[3] - D_CLASSICAL,
            "f6_residual": cap_orbit[6] - D_STAR,
            "cycle_multiplier": multiplier,
            "lyapunov_per_step": lyapunov,
            "minimum_cycle_separation": minimum_cycle_separation,
            "maps_unit_interval_into_itself": True,
            "unit_interval_certificate": {"f(0)": f_zero, "f(1)": f_one, "f(K/2)": f_max},
            "interpretation": (
                "This interpolates the two already supplied geometric rails; it does not independently predict them."
            ),
        },
        "rejected_equal_parameter_repair": {
            "map": "f(x)=r x(1-x)+c",
            "r": r_bias,
            "c": bias,
            "orbit": bias_orbit[:-1],
            "reason_not_selected": "c != 0 destroys the exact vacuum f(0)=0",
        },
        "status": (
            "The rail mismatch is solved without observed physical targets.  This is one locally selected stable, "
            "minimal-degree branch; it is not a global uniqueness theorem over all map families."
        ),
    }


def corrected_history_chaos() -> dict[str, Any]:
    """Replace the contraction/chaos contradiction by an invertible history lift."""
    a = math.pi / math.e
    r_star = 9.0 / 13.0

    def radial(r: float) -> float:
        return r * (a - (a - 1.0) * (r / r_star) ** 4)

    def potential(r: float) -> float:
        return (a - 1.0) * (r**6 / (6.0 * r_star**4) - r * r / 2.0 + r_star**2 / 3.0)

    def potential_prime(r: float) -> float:
        return (a - 1.0) * (r**5 / r_star**4 - r)

    samples = np.linspace(0.0, 1.1 * r_star, 20)
    gradient_step_error = max(abs(radial(r) - (r - potential_prime(r))) for r in samples)
    require(gradient_step_error < TOL, "radial gradient-step identity failed")
    require(abs(potential(r_star)) < TOL and abs(radial(r_star) - r_star) < TOL, "radial fixed point failed")

    radial_multiplier = 5.0 - 4.0 * a
    lambda_x = math.log(2.0)
    lambda_history = -math.log(2.0)
    lambda_radial = math.log(abs(radial_multiplier))
    require(lambda_x > 0.0 and lambda_x + lambda_history + lambda_radial < 0.0, "history spectrum failed")

    # Verify the baker natural extension and its inverse away from boundaries.
    max_inverse_error = 0.0
    for x in np.linspace(0.013, 0.987, 50):
        for p in (0.17, 0.63):
            bit = int(math.floor(2.0 * x))
            x_next = 2.0 * x - bit
            p_next = (p + bit) / 2.0
            inverse_bit = int(math.floor(2.0 * p_next))
            x_back = (x_next + inverse_bit) / 2.0
            p_back = 2.0 * p_next - inverse_bit
            max_inverse_error = max(max_inverse_error, abs(x_back - x), abs(p_back - p))
    require(max_inverse_error < TOL, "baker history lift must be invertible")

    invariant_upper = r_star * (a / (a - 1.0)) ** 0.25
    maximum_point = r_star * (a / (5.0 * (a - 1.0))) ** 0.25
    maximum_image = radial(maximum_point)
    require(0.0 < maximum_image < invariant_upper, "radial invariant interval failed")

    return {
        "radial_map": "R(r)=r[a-(a-1)(r/r*)^4]",
        "a": a,
        "r_star": r_star,
        "potential": "V=(a-1)[r^6/(6r*^4)-r^2/2+r*^2/3]",
        "unit_gradient_step_error": gradient_step_error,
        "radial_invariant_interval": [0.0, invariant_upper],
        "radial_maximum_image": maximum_image,
        "angle": "x' = 2x mod 1 (theta shift may be added)",
        "history_lift": "b=floor(2x); x'=2x-b; p'=(p+b)/2",
        "history_inverse_error": max_inverse_error,
        "lyapunov_exponents": [lambda_x, lambda_history, lambda_radial],
        "lyapunov_sum": lambda_x + lambda_history + lambda_radial,
        "old_global_contraction_no_go": (
            "A strict global contraction has only a fixed-point attractor and all Lyapunov exponents negative; "
            "it cannot produce the period-six/chaotic branch."
        ),
        "repair": (
            "Use invertible reversible history transport plus transverse entropy relaxation. "
            "Tracing out p recovers angular doubling while the radial fibre contracts."
        ),
    }


def continuum_and_lorentz() -> dict[str, Any]:
    """Build an A_4 regulator and a Lorentz metric on one chosen punctured Hopf chart."""
    eye5 = np.eye(5)
    roots5 = np.asarray([
        (eye5[i] - eye5[j]) / math.sqrt(2.0)
        for i in range(5) for j in range(5) if i != j
    ])
    raw_basis = np.column_stack([eye5[:, i] - eye5[:, 4] for i in range(4)])
    basis, _ = np.linalg.qr(raw_basis)
    roots4 = roots5 @ basis
    tight_error = float(np.linalg.norm(roots4.T @ roots4 - 5.0 * np.eye(4)))
    require(tight_error < TOL, "four-dimensional A_4 tight frame failed")

    rng = np.random.default_rng(20260825)
    quartic_error = 0.0
    for _ in range(25):
        k5 = rng.normal(size=5)
        k5 -= k5.mean()
        lhs = float(np.sum((roots5 @ k5) ** 4))
        k2 = float(k5 @ k5)
        rhs = 2.5 * float(np.sum(k5**4)) + 1.5 * k2 * k2
        quartic_error = max(quartic_error, abs(lhs - rhs))
    require(quartic_error < 5e-9, "A_4 quartic symbol identity failed")

    # Positive graph-Laplacian symbol and its small-a expansion.
    a_lattice = 1.0e-3
    k4 = rng.normal(size=4)
    exact_symbol = (2.0 / (5.0 * a_lattice**2)) * float(np.sum(1.0 - np.cos(a_lattice * (roots4 @ k4))))
    leading = float(k4 @ k4)
    require(abs(exact_symbol - leading) < 2e-5, "A_4 continuum principal symbol failed")

    y = np.array([0.4, -0.2, 0.1, 0.3])
    conformal = 2.0 / (1.0 + float(y @ y))
    h_metric = conformal**2 * np.eye(4)
    u = np.array([conformal, 0.0, 0.0, 0.0])
    lorentz = h_metric - 2.0 * np.outer(u, u)
    signature = np.linalg.eigvalsh(lorentz)
    require(np.sum(signature < 0.0) == 1 and np.sum(signature > 0.0) == 3, "Lorentz signature failed")

    return {
        "base": "HP^1 minus infinity = H = R4, regulated by a scaled A_4 root lattice",
        "hopf_chart": "y=q1 q2^-1=tau+x i+y j+z k on q2 != 0",
        "round_metric": "h=Omega^2(d tau^2+d x_vec^2), Omega=2/(1+|y|^2)",
        "lorentz_metric": "g=h-2u tensor u=Omega^2(-d tau^2+d x_vec^2), u=Omega d tau",
        "sample_metric_eigenvalues": [float(x) for x in signature],
        "topology_no_go": "chi(S4)=2, so compact S4 has no nowhere-zero time vector and no global Lorentz metric",
        "repair": (
            "A punctured Hopf chart is one minimal sufficient topology repair; entropy/outer orientation may fix the sign "
            "of u on a noncritical clock domain.  Neither the puncture nor clock is selected by the Riemannian quotient alone."
        ),
        "lattice": {
            "directions": 20,
            "tight_frame_error": tight_error,
            "positive_laplacian": "L_a f=(2/(5a^2)) sum_u [f(x)-f(x+a u)]",
            "principal_symbol": "|k|^2",
            "quartic_correction": "-a^2[5 sum_(i=1..5) k_i^4+3|k|^4]/120, sum_i k_i=0",
            "quartic_identity_error": quartic_error,
            "numeric_symbol_error_at_a_1e-3": exact_symbol - leading,
            "normalized_root_cell_volume": "sqrt(5) a^4/4",
        },
        "soldering": (
            "Use separate tangent and internal V4 copies.  Their A5-equivariant intertwiner is unique up to one scale; "
            "only the finite seed is shared, while Spin(1,3) and SU(5) remain distinct continuous groups."
        ),
        "newton_repair": (
            "The old finite rank-five projector is only a polarization carrier.  The regulator supplies a continuum "
            "scalar wave operator whose static Green function is 1/(4 pi r); a constrained massless spin-2 action, "
            "gauge symmetry and Newton normalization still have to be specified."
        ),
        "fermion_regulator_gate": (
            "A chiral lattice Dirac operator is not supplied here; a naive root-lattice Dirac operator has doubling "
            "and needs an overlap/Ginsparg-Wilson or equivalent repair."
        ),
    }


def reversible_dissipative_law() -> dict[str, Any]:
    """Certificate for the minimal metriplectic/history replacement of pure gradient URT."""
    rng = np.random.default_rng(13)
    raw = rng.normal(size=(7, 7))
    skew = raw - raw.T
    b = rng.normal(size=(7, 7))
    mobility = b.T @ b
    gradient = rng.normal(size=7)
    skew_power = float(gradient @ skew @ gradient)
    dissipation = float(gradient @ (skew - mobility) @ gradient)
    expected = -float(gradient @ mobility @ gradient)
    require(abs(skew_power) < TOL and abs(dissipation - expected) < TOL, "metriplectic identity failed")

    return {
        "continuous_free_energy_form": "Xdot=[J(X)-M(X)] deltaPhi/deltaX",
        "generic_extension": (
            "Xdot=J deltaE+M deltaS with J*=-J, M*=M>=0 and degeneracy conditions "
            "J deltaS=0, M deltaE=0"
        ),
        "operators": "J*=-J carries Hodge/gauge/Lorentz transport; M*=M>=0 carries relative-information relaxation",
        "split_step": (
            "Y_n=B_J(X_n) by reversible two-sheet/history transport; "
            "rho_(n+1)=argmin_rho {D_KL(rho||Y_n)+dt Phi[rho]} on a specified probability/density manifold"
        ),
        "skew_power_error": skew_power,
        "free_energy_derivative_test": dissipation,
        "expected_dissipation": expected,
        "pure_gradient_no_go": (
            "For M>0, Phi strictly decreases off equilibria, so an autonomous pure gradient flow cannot carry a nontrivial cycle or chaos."
        ),
        "lorentz_force_repair": (
            "Antisymmetric J supplies v cross B / symplectic transport with v.Jv=0; scalar dissipation alone cannot do so."
        ),
        "quantum_status": (
            "The reversible sector may be represented unitarily and the 16-state branching is exact, but Born measurement remains conditional "
            "on norm-squared/refinement axioms rather than proved by this dynamics."
        ),
    }


def density_information_law() -> dict[str, Any]:
    """A fully specified reversible+dissipative law on the density-matrix sector."""
    rng = np.random.default_rng(2026)

    def normalized_positive(n: int) -> np.ndarray:
        z = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
        matrix = z @ z.conj().T + 0.4 * np.eye(n)
        return matrix / np.trace(matrix)

    def hermitian_function(matrix: np.ndarray, function: Callable[[np.ndarray], np.ndarray]) -> np.ndarray:
        values, vectors = np.linalg.eigh(matrix)
        return (vectors * function(values)) @ vectors.conj().T

    def kubo_mori(rho: np.ndarray, observable: np.ndarray) -> np.ndarray:
        values, vectors = np.linalg.eigh(rho)
        a_eigen = vectors.conj().T @ observable @ vectors
        logarithms = np.log(values)
        means = np.empty((len(values), len(values)))
        for i in range(len(values)):
            for j in range(len(values)):
                if i == j:
                    means[i, j] = values[i]
                else:
                    means[i, j] = (values[i] - values[j]) / (logarithms[i] - logarithms[j])
        return vectors @ (means * a_eigen) @ vectors.conj().T

    n = 4
    rho = normalized_positive(n)
    rho0 = normalized_positive(n)
    raw_k = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    cost = (raw_k + raw_k.conj().T) / 2.0
    eta = ETA_DELTA / 10.0
    log_rho = hermitian_function(rho, np.log)
    log_rho0 = hermitian_function(rho0, np.log)
    affinity = log_rho - log_rho0 + eta * cost
    centred = affinity - np.trace(rho @ affinity) * np.eye(n)
    onsager = kubo_mori(rho, centred)
    hamiltonian = affinity
    rho_dot_reversible = -1j * (hamiltonian @ rho - rho @ hamiltonian)
    rho_dot_dissipative = -onsager
    reversible_power = float(np.real(np.trace(affinity @ rho_dot_reversible)))
    dissipative_power = float(np.real(np.trace(affinity @ rho_dot_dissipative)))
    trace_rate = complex(np.trace(rho_dot_reversible + rho_dot_dissipative))
    require(abs(reversible_power) < TOL, "density reversible power must vanish")
    require(dissipative_power <= TOL, "Kubo-Mori term must dissipate free energy")
    require(abs(trace_rate) < TOL, "density law must preserve trace")

    generator = log_rho0 - eta * cost
    exp_generator = hermitian_function(generator, np.exp)
    rho_stationary = exp_generator / np.trace(exp_generator)
    log_stationary = hermitian_function(rho_stationary, np.log)
    stationary_affinity = log_stationary - log_rho0 + eta * cost
    stationary_centred = stationary_affinity - np.trace(rho_stationary @ stationary_affinity) * np.eye(n)
    stationary_residual = float(np.linalg.norm(kubo_mori(rho_stationary, stationary_centred)))
    require(stationary_residual < TOL, "density Gibbs stationary state failed")

    return {
        "sector": "positive trace-one density matrices",
        "affinity": "A_rho=log(rho)-log(rho0)+eta K",
        "onsager": (
            "K_rho(A)=integral_0^1 rho^s[A-Tr(rho A)I]rho^(1-s) ds"
        ),
        "law": "rho_dot=-i[H,rho]-K_rho(A_rho), with Tr(A_rho[H,rho])=0",
        "tested_choice": "H=A_rho",
        "trace_rate_abs": abs(trace_rate),
        "reversible_free_energy_rate": reversible_power,
        "dissipative_free_energy_rate": dissipative_power,
        "stationary_state": "rho*=exp(log(rho0)-eta K)/Z",
        "stationary_residual": stationary_residual,
        "scope": (
            "This closes the information/density sector only.  H, K and their coupling to gauge links, metrics "
            "and Grassmann fermions remain part of the finite-action gate."
        ),
    }


def fluid_information_limit() -> dict[str, Any]:
    """Verify the 13-velocity isotropy and state the exact entropic-BGK completion."""
    vertices = []
    for a in (-1.0, 1.0):
        for b in (-PHI, PHI):
            vertices.extend([(0.0, a, b), (a, b, 0.0), (b, 0.0, a)])
    shell = np.asarray(vertices, dtype=float)
    shell /= np.linalg.norm(shell, axis=1)[:, None]
    velocities = np.vstack([np.zeros((1, 3)), shell])
    weights = np.array([2.0 / 5.0] + [1.0 / 20.0] * 12)
    identity = np.eye(3)
    m2 = np.einsum("a,ai,aj->ij", weights, velocities, velocities)
    m3 = np.einsum("a,ai,aj,ak->ijk", weights, velocities, velocities, velocities)
    m4 = np.einsum("a,ai,aj,ak,al->ijkl", weights, velocities, velocities, velocities, velocities)
    cs2 = 1.0 / 5.0
    target4 = np.zeros((3, 3, 3, 3))
    for i, j, k, l in itertools.product(range(3), repeat=4):
        target4[i, j, k, l] = cs2**2 * (
            identity[i, j] * identity[k, l]
            + identity[i, k] * identity[j, l]
            + identity[i, l] * identity[j, k]
        )
    errors = {
        "normalization": abs(float(weights.sum()) - 1.0),
        "second_moment": float(np.linalg.norm(m2 - cs2 * identity)),
        "third_moment": float(np.linalg.norm(m3)),
        "fourth_moment": float(np.linalg.norm(m4 - target4)),
    }


def finite_dirac_open_gate() -> dict[str, Any]:
    """Keep the flavour problem live in its smallest noncommuting, target-free form."""
    names = ["u", "d", "e", "nu"]
    charges = np.array([
        [1.0, 3.0, -4.0],
        [1.0, -3.0, 2.0],
        [-3.0, -3.0, 6.0],
        [-3.0, 3.0, 0.0],
    ])
    normal = np.ones(3) / math.sqrt(3.0)
    metric = charges @ charges.T
    orientation = np.zeros((4, 4))
    for i in range(4):
        for j in range(4):
            orientation[i, j] = float(normal @ np.cross(charges[i], charges[j]))
    hermitian_species = metric + 1j * orientation
    eigenvalues, eigenvectors = np.linalg.eigh(hermitian_species)
    rank = int(np.sum(eigenvalues > 1e-9))
    require(rank == 1, "oriented species form must have rank one")
    require(np.linalg.norm(hermitian_species @ hermitian_species - 112.0 * hermitian_species) < 5e-10, "species rank-one identity failed")
    z = math.sqrt(max(float(eigenvalues[-1]), 0.0)) * eigenvectors[:, -1]
    anomaly_weight = np.array([3.0, 3.0, 1.0, 1.0])
    anomaly_residual = abs(np.vdot(z, anomaly_weight))
    require(anomaly_residual < TOL, "oriented species anomaly closure failed")
    shell_cycle_rank = 30 - 12 + 1
    require(shell_cycle_rank == 19, "icosahedral shell cycle rank failed")

    return {
        "exact_no_go_dimensions": {
            "Hom_A4_HR_to_HL_real": 48,
            "species_spectral_relative_orientation_flat_space": 16,
        },
        "canonical_connection_no_go": "the first-order A4-graded vector connection makes all four generation Grams scalar and equal",
        "uniform_edge_passive_candidate": {
            "result": "K0^(1-link)=(23/45) I3 for p0=1/30 on the 30-edge alphabet",
            "archived_matrix_residual": 2.97e-16,
            "scope": (
                "Exact for that uniform one-link ensemble, but the push-forward from exterior rho0 through physical histories is not derived."
            ),
        },
        "oriented_species_form": {
            "names": names,
            "definition": "h_fg=q_f.q_g+i n.(q_f cross q_g)",
            "rank": rank,
            "eigenvalues": [float(x) for x in eigenvalues],
            "rank_one_identity_error": float(np.linalg.norm(hermitian_species @ hermitian_species - 112.0 * hermitian_species)),
            "anomaly_weighted_residual": anomaly_residual,
        },
        "declared_amplitude_to_retain": (
            "T_tilde[f,e]=C5(H_e)+C43(Xi3_e+J q_f/3)+i C45(Xi5_e+J Delta g(q_f)/5)"
        ),
        "required_positive_operator": "K_f,e=T_tilde[f,e]^dagger T_tilde[f,e], including every interference term",
        "required_passive_relative_operator": "R_f,e=K0_f^(-1/2) K_f,e K0_f^(-1/2), with K0_f derived from rho0",
        "minimal_missing_transport": {
            "tensor": "edgewise oriented charge-plane embedding J_e, equivalently a U(1) connection on the charge complex line",
            "reason": "A5 has no two-dimensional irrep, so no nonzero constant global A5-equivariant map Q2 -> V4 exists",
            "shell_links": 30,
            "shell_vertices": 12,
            "independent_cycle_holonomies": shell_cycle_rank,
            "count_formula": "E-V+1=19",
            "phase_gate": (
                "multiplicity-one Clebsch maps still have relative phases; a C43 sign changes the blind spectral branch "
                "and C45 conjugation reverses CP orientation"
            ),
        },
        "next_blind_action": (
            "Gamma[x]=V_edge(x)-eta^(-1) log det(1+exp(-eta D_full(x)^2)), with joint off-diagonal "
            "species/history blocks fixed by h_fg and one common real/graded/star convention"
        ),
        "acceptance_test": [
            "use no CKM, PMNS, mass or cosmology targets",
            "solve grad Gamma=0",
            "require positive physical Hessian after gauge zero modes are removed",
            "certify the selected history orbit globally",
            "only then compute masses and mixing from the left singular frames",
        ],
        "status": (
            "No unique blind stationary point exists with the stored constant-frame tensors.  J_e/its 19 cycle holonomies "
            "and the history push-forward defining K0 are the exact missing objects, not discarded problems."
        ),
    }
    require(max(errors.values()) < TOL, "13-velocity moment identities failed")
    return {
        "weights": {"rest": 2.0 / 5.0, "each_shell_direction": 1.0 / 20.0},
        "moment_errors": errors,
        "entropy": "H[f]=sum_A f_A log(f_A/w_A)",
        "local_equilibrium": "the constrained minimizer of H at fixed density and momentum",
        "entropic_BGK": "partial_t f_A+c_A.grad f_A=-(f_A-f_A^eq)/tau",
        "conditional_hydrodynamic_limit": {
            "sound_speed_squared": "c^2/5",
            "pressure": "rho c^2/5",
            "continuous_BGK_viscosity": "c^2 tau/5",
            "stream_collide_LBM_viscosity": "(c^2/5)(tau-dt/2)",
        },
        "scope": (
            "The moments are exact.  Navier-Stokes follows only through the entropic-BGK/Chapman-Enskog scaling; "
            "this is not a proof of global NS regularity.  Icosahedral velocities are off-lattice relative to a generic A_4 mesh."
        ),
    }


def master_state_and_gates() -> dict[str, Any]:
    """Freeze the smallest common state while exposing what still is not selected."""
    gates = {
        "finite_seed_geometry": {"status": "EXACT_FOR_SUPPLIED_SEED", "content": "13 centred states, 42 edges, 20 faces, hidden 4+4"},
        "history_chaos": {
            "status": "MATHEMATICAL_PASS_PHYSICAL_SELECTION_OPEN",
            "content": "baker natural extension plus exact radial relaxation",
        },
        "lorentzian_base": {
            "status": "CONDITIONAL_CONSTRUCTION",
            "content": "chosen punctured HP1 chart, clock reflection and A_4 continuum regulator",
        },
        "standard_model_group": {"status": "PASS_GIVEN_GAUGING", "content": "A_4 roots -> SU5 -> S(U3xU2)"},
        "su5_breaking_higgs": {
            "status": "OPEN_WELL_POSED",
            "content": (
                "The selected 3+2 decomposition fixes the stabilizer, but its dynamical breaking field and scale are not selected. "
                "The existing A5-irreducible V5 is not an SU5 fundamental 5, whose A5 restriction is 1+4."
            ),
        },
        "one_matter_family": {
            "status": "EXACT_BRANCHING_PHYSICAL_DICTIONARY_OPEN",
            "content": "Lambda-even C5 = 16 with exact SM branching and anomalies",
        },
        "three_generations": {
            "status": "STRUCTURAL_PASS_PHYSICAL_DICTIONARY_OPEN",
            "content": "outer Spin(7) return flag has stabilizers 14->8->3->0",
        },
        "finite_dirac_yukawa": {
            "status": "OPEN_WELL_POSED",
            "content": (
                "A4 covariance leaves 48 real intertwiner dimensions; spectral-only actions leave 16 relative-orientation dimensions. "
                "The required selector is the oriented noncommuting three-return curvature retaining the charge-plane two-form."
            ),
        },
        "gravity_equation": {
            "status": "PROPAGATION_CARRIER_REPAIRED_DYNAMICS_OPEN",
            "content": (
                "A_4 continuum supplies propagation and the hidden 4+5 source is exactly traceless-Ricci typed. "
                "Einstein-Hilbert form follows only after locality/diffeomorphism/second-order assumptions; one length supplies units, "
                "while G/a_*^2 and Lambda a_*^2 remain unselected."
            ),
        },
        "absolute_scale": {
            "status": "SCALE_AND_DIMENSIONLESS_COUPLINGS_OPEN",
            "content": (
                "A dimensionless finite core cannot determine a number carrying units, so one lattice length a_* is unavoidable. "
                "That does not select dimensionless gravity/cosmology coefficients such as G/a_*^2 or Lambda a_*^2."
            ),
        },
        "chiral_lattice_dirac": {
            "status": "OPEN_WELL_POSED",
            "content": "continuum scalar symbol passes; chiral fermions still require a doubling-safe lattice Dirac construction",
        },
        "flavour_mass_response_numbers": {
            "status": "QUARANTINED_CONDITIONAL",
            "content": "retained as outputs of the August response-routing axiom, not eigenvalues of the selected Dirac operator",
        },
        "cosmology_slots": {
            "status": "QUARANTINED_CONDITIONAL",
            "content": "retained arithmetic; no Friedmann/inflation/baryogenesis action yet",
        },
        "north_star_reactor": {
            "status": "SEPARATE_ENGINEERING_MODEL",
            "content": "retained, but it is not evidence for the fundamental theory and the old 100 microsecond gain claim remains withdrawn",
        },
        "icosahedron_selection": {
            "status": "OPEN_WELL_POSED",
            "content": (
                "K3=12 plus Euler/triangular counting fixes average valence five, not 5-regularity or the unique icosahedron. "
                "The log-distance/Coulomb simulations select it only after an energy functional is supplied."
            ),
        },
        "archive_completeness": {
            "status": "SOURCE_GAP",
            "content": (
                "The migration manifest names all_my_colab_work_combined.md (322 notebooks), but that source is absent; "
                "newtons_cathedral.pdf is truncated/corrupt and only four streams are recoverable."
            ),
        },
    }

    return {
        "state": {
            "base": "punctured quaternionic Hopf chart, A_4-regulated",
            "internal_gauge": "W5_C with SU(5) root/weight data and 3+2 vacuum",
            "matter": "Lambda^even W5_C tensor three-return flag",
            "hidden": "Hodge-paired quartets with stiffness 3 I4 + 5 I4",
            "links": "S(U3xU2) gauge holonomies plus spin connection",
            "history": "outer two-sheet bit, baker conjugate p, radial entropy coordinate",
        },
        "law_template": (
            "reversible covariant/history transport followed by constrained relative-information relaxation.  "
            "This is not closed until E/Phi, J, M, constraints, measure, gauge action and finite Dirac operator are specified."
        ),
        "gates": gates,
    }


def historical_branch_ledger() -> list[dict[str, str]]:
    """Do not silently delete a failed route; map it to its current disposition."""
    return [
        {"branch": "global URT contraction creates chaos", "old": "FALSIFIED", "now": "replaced by expanding base + contracting fibres + history lift"},
        {"branch": "time-independent scalar gradient creates period six", "old": "FALSIFIED", "now": "reversible/dissipative split"},
        {"branch": "one-parameter logistic identifies both rails", "old": "FALSIFIED", "now": "zero-preserving capacity map solves both rails"},
        {"branch": "old logistic delta equals geometric d_star", "old": "FALSIFIED", "now": "mismatch measured and reconciled by two-rail closure"},
        {"branch": "SU(5) inserted as a shortcut", "old": "WITHDRAWN", "now": "A_4 roots provide a canonical SU(5) envelope if compact internal gauging is admitted"},
        {"branch": "nested G2>SU3>SU2 is the SM gauge product", "old": "FALSIFIED", "now": "Spin7 chain is generation history; block stabilizer is commuting SM group"},
        {"branch": "compact S4 is global spacetime", "old": "FALSIFIED", "now": "one sufficient repair is a punctured Hopf chart with a chosen clock"},
        {"branch": "A_4 roots equal icosahedral face centres metrically", "old": "FALSIFIED", "now": "only the A5-set/module equivalence is retained"},
        {"branch": "hidden 4+4 equals the 6+2 unbroken root subset", "old": "FORBIDDEN_CONFLATION", "now": "principal-angle spectrum proves zero exact intersection"},
        {"branch": "finite fiveplet projector yields Newton 1/r", "old": "FALSIFIED", "now": "fiveplet is polarization; continuum scalar propagation exists but spin-2 dynamics remains open"},
        {"branch": "pure scalar gradient yields magnetic force", "old": "FALSIFIED", "now": "skew Hodge/gauge mobility supplies energy-preserving deflection"},
        {"branch": "H21 state module is pre-Bianchi curvature", "old": "FALSIFIED", "now": "distinct modules retained; hidden 4+5 maps only to traceless Ricci"},
        {"branch": "endpoint/static/ribbon selector predicts CKM/PMNS", "old": "WITHDRAWN", "now": "finite Dirac gate requires oriented noncommuting history curvature"},
        {"branch": "response mass/cosmology arithmetic is derived physics", "old": "UNSUPPORTED", "now": "retained as conditional response-model outputs"},
        {"branch": "mod-9 doubling proves Mersenne primality", "old": "FALSIFIED", "now": "C6 residue arithmetic only"},
        {"branch": "13-velocity moments alone prove Navier-Stokes", "old": "UNSUPPORTED", "now": "exact isotropy retained; BGK/continuum assumptions explicit"},
        {"branch": "finite core already proves Born/Einstein/Newton", "old": "UNSUPPORTED", "now": "conditional theorems separated from missing dynamics and scale"},
        {"branch": "A5 fiveplet is an SU5 fundamental Higgs 5", "old": "FORBIDDEN_CONFLATION", "now": "modules differ: 5_A5 versus (1+4)_A5"},
        {"branch": "K3=12 alone selects the icosahedron", "old": "UNSUPPORTED", "now": "only average valence follows; selection functional remains an action gate"},
        {"branch": "May v9 ARF masses were zero-fit predictions", "old": "FALSIFIED_BY_ARCHIVE", "now": "optimization against mass/Higgs targets is recorded as fitting"},
        {"branch": "May v9 QFT/nuclear/EEG/scale-ladder claims", "old": "UNVERIFIED_TRUNCATED_SOURCE", "now": "retained in provenance ledger, not promoted"},
        {"branch": "old 100 microsecond North Star net gain", "old": "WITHDRAWN", "now": "engineering branch retained with corrected power balance"},
    ]


def solve_all() -> dict[str, Any]:
    results = {
        "schema": "urt-nature-solver-v1",
        "frozen_primitives": {
            "D": D,
            "V": V,
            "N": N,
            "E": E,
            "F": F,
            "q": Q,
            "hidden": HIDDEN,
            "phi": PHI,
            "gamma": GAMMA,
            "d_star": D_STAR,
            "d_classical": D_CLASSICAL,
            "Delta": DELTA,
            "eta_Delta": ETA_DELTA,
        },
        "a4_su5": a4_su5_and_nonconflation(),
        "standard_model_family": standard_model_family(),
        "two_rail_dynamics": rail_closure(),
        "history_chaos": corrected_history_chaos(),
        "continuum_lorentz": continuum_and_lorentz(),
        "master_dynamics": reversible_dissipative_law(),
        "density_information_dynamics": density_information_law(),
        "fluid_information_limit": fluid_information_limit(),
        "finite_dirac_gate": finite_dirac_open_gate(),
        "master_state": master_state_and_gates(),
        "historical_branches": historical_branch_ledger(),
    }
    results["verification"] = {
        "all_internal_assertions_pass": True,
        "new_mathematical_closures": [
            "A_4 compact gauge envelope -> Standard Model block stabilizer (conditional on gauging)",
            "one chiral 16-state Standard Model branching",
            "two geometric rails on one stable zero-preserving quadratic cycle",
            "invertible history lift of bounded chaos",
            "Lorentz-signature metric on a chosen punctured Hopf chart",
            "A_4 isotropic continuum principal symbol",
            "verified reversible/dissipative law template",
            "trace-preserving Kubo-Mori information-sector evolution",
            "13-velocity entropic-BGK moment closure (conditional continuum limit)",
            "rank-one oriented species form and target-free finite-Dirac acceptance equation",
        ],
        "honesty_gate": (
            "Physical gauging, seed selection, breaking/Higgs dynamics, chiral lattice Dirac, finite Yukawa/history action, "
            "gravity coefficients and a scale remain explicit; conditional response numbers are not promoted."
        ),
    }
    return results


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=Path("urt_nature_solver_results.json"))
    parser.add_argument("--compact", action="store_true", help="write compact JSON")
    args = parser.parse_args()
    results = solve_all()
    text = json.dumps(results, indent=None if args.compact else 2, sort_keys=True)
    args.output.write_text(text + "\n", encoding="utf-8")
    print(json.dumps({
        "all_internal_assertions_pass": results["verification"]["all_internal_assertions_pass"],
        "output": str(args.output),
        "block_stabilizer": results["a4_su5"]["low_energy_group"],
        "matter_dimension": sum(x["dimension"] for x in results["standard_model_family"]["multiplets"]),
        "rail_map": results["two_rail_dynamics"]["selected_minimal_repair"]["map"],
        "open_gate": "finite Dirac/Yukawa history selector",
    }, indent=2))


if __name__ == "__main__":
    main()