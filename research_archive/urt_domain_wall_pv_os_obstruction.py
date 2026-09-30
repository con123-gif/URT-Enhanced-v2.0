#!/usr/bin/env python3
"""Exact Pauli--Villars reflection obstruction inside the certified gap domain.

The standard domain-wall representation of the overlap determinant divides
by a five-dimensional Pauli--Villars determinant.  Under time reflection the
PV quadratic kernel D^dagger D is exchanged with D D^dagger.  They agree in
the free case, but gauge curvature makes the Wilson kernel non-normal.

This verifier exhibits that obstruction on the repaired Cathedral stencil.
Set S_2=S_3=I and impose the finite Weyl relation

    S V = q V S,       q=exp(2 pi i/N).

Choose the four future types with first sign minus as V and the four with
first sign plus as S V.  Bottom triangles are then flat; the corresponding
top triangles carry q (or q inverse), and every other repaired face is flat.
The future average is exactly A=(1+S)V/2.

All words are reduced exactly in the basis V^a S^b times an ordered Clifford
monomial.  For the coherent c_t=1 Wilson kernel Y, the normality defect

    Y^dagger Y-Y Y^dagger

has 18 nonzero coefficients, all divisible by q-1.  In particular, the
coefficient of S gamma_0 is exactly -(q-1)/4, independent of r and M.  The
Weyl/Clifford monomials are linearly independent for N>4, so the defect is
nonzero for every nontrivial flux.

At N=5601, every relevant face deviation is at most |q-1| and

    |q-1|=2 sin(pi/N) < 2(355/113)/N < epsilon_*.

Thus the PV obstruction occurs strictly inside the newly certified
volume-uniform overlap-gap domain.  It invalidates the simple domain-wall/PV
reflection-positivity proof route; it does not prove that the gauge-covariant
overlap fermion itself violates reflection positivity.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Any


R = Fraction(355508034923519, 10**15)
M = Fraction(790940592107124, 10**15)
EPSILON_STAR = Fraction(
    394924599595820227835064176865,
    351998414917049746226536404412312,
)
N_FLUX = 5601
PI_UPPER = Fraction(355, 113)

Laurent = dict[int, Fraction]
Key = tuple[int, int, int]
Poly = dict[Key, Laurent]


def lclean(poly: Laurent) -> Laurent:
    return {power: coefficient for power, coefficient in poly.items() if coefficient}


def ladd(left: Laurent, right: Laurent) -> Laurent:
    out: dict[int, Fraction] = defaultdict(Fraction)
    for power, coefficient in left.items():
        out[power] += coefficient
    for power, coefficient in right.items():
        out[power] += coefficient
    return lclean(dict(out))


def lscale(poly: Laurent, coefficient: Fraction) -> Laurent:
    return lclean({power: coefficient * value for power, value in poly.items()})


def lshift(poly: Laurent, power: int) -> Laurent:
    return {index + power: value for index, value in poly.items()}


def lmul(left: Laurent, right: Laurent) -> Laurent:
    out: dict[int, Fraction] = defaultdict(Fraction)
    for left_power, left_coefficient in left.items():
        for right_power, right_coefficient in right.items():
            out[left_power + right_power] += left_coefficient * right_coefficient
    return lclean(dict(out))


def lconjugate(poly: Laurent) -> Laurent:
    return {-power: coefficient for power, coefficient in poly.items()}


def levaluate_one(poly: Laurent) -> Fraction:
    return sum(poly.values(), Fraction(0))


def lstring(poly: Laurent) -> str:
    if not poly:
        return "0"
    parts = []
    for power in sorted(poly, reverse=True):
        coefficient = poly[power]
        parts.append(f"({coefficient})*q^{power}")
    return " + ".join(parts)


def clifford_product(left: int, right: int) -> tuple[int, int]:
    inversions = 0
    for index in range(4):
        if (left >> index) & 1:
            inversions += (right & ((1 << index) - 1)).bit_count()
    return (-1 if inversions % 2 else 1), left ^ right


def clifford_adjoint(mask: int) -> int:
    degree = mask.bit_count()
    return -1 if (degree * (degree - 1) // 2) % 2 else 1


def add(poly: Poly, key: Key, coefficient: Laurent) -> None:
    value = ladd(poly.get(key, {}), coefficient)
    if value:
        poly[key] = value
    elif key in poly:
        del poly[key]


def monomial(
    a: int,
    b: int,
    mask: int,
    coefficient: Fraction,
    q_power: int = 0,
) -> Poly:
    return {(a, b, mask): {q_power: coefficient}} if coefficient else {}


def plus(*polynomials: Poly) -> Poly:
    out: Poly = {}
    for polynomial in polynomials:
        for key, coefficient in polynomial.items():
            add(out, key, coefficient)
    return out


def scale(poly: Poly, coefficient: Fraction) -> Poly:
    return {
        key: lscale(value, coefficient)
        for key, value in poly.items()
        if lscale(value, coefficient)
    }


def multiply(left: Poly, right: Poly) -> Poly:
    """Use (V^a S^b)(V^u S^v)=q^(bu)V^(a+u)S^(b+v)."""
    out: Poly = {}
    for (a, b, left_mask), left_coefficient in left.items():
        for (u, v, right_mask), right_coefficient in right.items():
            sign, mask = clifford_product(left_mask, right_mask)
            coefficient = lshift(lmul(left_coefficient, right_coefficient), b * u)
            add(out, (a + u, b + v, mask), lscale(coefficient, sign))
    return out


def adjoint(poly: Poly) -> Poly:
    """Use (V^a S^b)^dagger=q^(ab)V^(-a)S^(-b)."""
    out: Poly = {}
    for (a, b, mask), coefficient in poly.items():
        transformed = lshift(lconjugate(coefficient), a * b)
        transformed = lscale(transformed, clifford_adjoint(mask))
        add(out, (-a, -b, mask), transformed)
    return out


def reduced_cathedral_kernel() -> Poly:
    """Set S_2=S_3=I in the coherent c_t=1 Cathedral kernel."""
    kernel = monomial(0, 0, 0, 1 - M + R)
    kernel = plus(
        kernel,
        monomial(0, 1, 0, -R / 2),
        monomial(0, -1, 0, -R / 2),
        monomial(0, 1, 2, Fraction(1, 2)),
        monomial(0, -1, 2, Fraction(-1, 2)),
    )

    # A=(1+S)V/2 = V/2 + q VS/2 in canonical V^a S^b order.
    future = plus(
        monomial(1, 0, 0, Fraction(1, 2)),
        monomial(1, 1, 0, Fraction(1, 2), q_power=1),
    )
    future_adjoint = adjoint(future)
    temporal_scalar = scale(plus(future, future_adjoint), Fraction(-1, 2))
    temporal_vector: Poly = {}
    for (a, b, _), coefficient in plus(future, scale(future_adjoint, -1)).items():
        add(temporal_vector, (a, b, 1), lscale(coefficient, Fraction(1, 2)))
    return plus(kernel, temporal_scalar, temporal_vector)


def polynomial_hash(poly: Poly) -> str:
    rows = [
        [a, b, mask, [[power, value.numerator, value.denominator] for power, value in sorted(coefficient.items())]]
        for (a, b, mask), coefficient in sorted(poly.items())
    ]
    return hashlib.sha256(json.dumps(rows, separators=(",", ":")).encode()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    kernel = reduced_cathedral_kernel()
    left_gram = multiply(adjoint(kernel), kernel)
    right_gram = multiply(kernel, adjoint(kernel))
    defect = plus(left_gram, scale(right_gram, -1))

    if not defect:
        raise RuntimeError("normality defect unexpectedly vanished")
    if any(levaluate_one(coefficient) != 0 for coefficient in defect.values()):
        raise RuntimeError("a defect coefficient is not divisible by q-1")

    witness_key = (0, 1, 1)  # S gamma_0
    expected_witness = {0: Fraction(1, 4), 1: Fraction(-1, 4)}
    if defect.get(witness_key) != expected_witness:
        raise RuntimeError(("witness mismatch", defect.get(witness_key)))

    rational_flux_upper = 2 * PI_UPPER / N_FLUX
    if not rational_flux_upper < EPSILON_STAR:
        raise RuntimeError("chosen flux is not certified admissible")

    out: dict[str, Any] = {
        "certificate": "URT exact domain-wall Pauli-Villars OS-route obstruction",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "Weyl_background": {
            "relations": [
                "S V=q V S",
                "q=exp(2 pi i/N)",
                "S_2=S_3=I",
            ],
            "finite_matrix_realization": (
                "N-dimensional clock and shift unitaries; V^a S^b are "
                "Hilbert-Schmidt orthogonal modulo N"
            ),
            "future_type_assignment": (
                "V_b=V when b_1=-1 and V_b=S V when b_1=0; dependence on "
                "b_2,b_3 is trivial"
            ),
            "face_audit": {
                "spatial_squares": "flat",
                "axis_2_and_axis_3_triangles": "flat",
                "axis_1_bottom_triangles": "flat because V_plus=S V_minus",
                "axis_1_top_triangles": (
                    "holonomy q or q^-1 because V_minus S and S V_minus differ"
                ),
                "maximum_repaired_face_deviation": "|q-1|",
                "future_average": "A=(V+S V)/2=(1+S)V/2",
            },
            "N": N_FLUX,
            "linear_independence_condition": "N>4",
            "face_deviation": "|q-1|=2 sin(pi/N)",
            "strict_rational_upper_bound": f"2*(355/113)/{N_FLUX}",
            "strict_rational_upper_bound_numeric": float(rational_flux_upper),
            "certified_epsilon_star_exact": (
                f"{EPSILON_STAR.numerator}/{EPSILON_STAR.denominator}"
            ),
            "certified_epsilon_star_numeric": float(EPSILON_STAR),
            "exact_margin_below_epsilon_star": (
                f"{(EPSILON_STAR-rational_flux_upper).numerator}/"
                f"{(EPSILON_STAR-rational_flux_upper).denominator}"
            ),
            "strictly_inside_certified_gap_domain": True,
        },
        "exact_normality_defect": {
            "definition": "Y^dagger Y-Y Y^dagger",
            "kernel_term_count": len(kernel),
            "nonzero_Weyl_Clifford_coefficient_count": len(defect),
            "every_coefficient_vanishes_at_q=1": True,
            "witness_monomial": "S gamma_0",
            "witness_coefficient": "-(q-1)/4",
            "witness_independent_of_r_and_M": True,
            "defect_nonzero_for_q_not_equal_1": True,
            "defect_sha256": polynomial_hash(defect),
            "status": "E exact Laurent/Weyl/Clifford calculation",
        },
        "Pauli_Villars_consequence": {
            "PV_kernel": "Y^dagger Y",
            "reflected_kernel": "Y Y^dagger",
            "reflection_invariant_on_background": False,
            "reason": (
                "time/spatial covariant shifts do not commute; the obstruction "
                "is nonzero even at arbitrarily weak admissible flux"
            ),
            "simple_domain_wall_PV_OS_proof_available": False,
            "overlap_fermion_OS_violation_proved": False,
            "status": "F for the PV proof route; U for the overlap measure itself",
        },
        "literature_resolution": {
            "early_proceedings": {
                "authors": "Y. Kikukawa",
                "title": "Analytic progress on exact lattice chiral symmetry",
                "arXiv": "hep-lat/0111035",
                "claim_boundary": (
                    "a domain-wall positivity argument was sketched, with the "
                    "detailed gauge proof cited only as 'in preparation'"
                ),
            },
            "later_detailed_analysis": {
                "authors": "Y. Kikukawa and K. Usui",
                "title": "Reflection positivity of free overlap fermions",
                "arXiv": "1005.3751",
                "url": "https://arxiv.org/abs/1005.3751",
                "conclusion": (
                    "free and nongauge cases are proved; with gauge interaction "
                    "the PV bosonic positivity condition fails because covariant "
                    "time/spatial differences do not commute, and the overlap "
                    "case is left open"
                ),
            },
        },
        "verdict": {
            "volume_uniform_overlap_gap_retained": True,
            "domain_wall_PV_shortcut_closed": True,
            "interacting_overlap_reflection_positivity": "U",
            "controlled_alternative": (
                "retain an explicit finite Wilson/domain-wall regulator, at the "
                "cost of not having the exact polar-overlap theory"
            ),
            "next_gate": (
                "directly factor the gauge-covariant polar-overlap cross-boundary "
                "kernel or construct a gauge-invariant negative OS observable"
            ),
            "theory_of_nature": False,
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()