#!/usr/bin/env python3
"""Exact volume-uniform overlap-kernel gap from triangular admissibility.

Let S_1,S_2,S_3 be unitary spatial covariant shifts and let V be the
reference future shift.  The repaired triangle and square faces imply

    ||[S_i,S_j]|| <= epsilon,       ||[S_i,V]|| <= 2 epsilon,

while their future average A obeys

    ||A-(1+S_3)(1+S_2)(1+S_1)V/8|| <= 3 epsilon/2.

For c_t=1 this verifier expands the coherent Wilson kernel Y exactly in the
free word/Clifford algebra.  It verifies a rational Gram certificate

    Y^dagger Y - 1/2 = W^dagger Q W + E,

where Q is positive definite by an exact rational congruence and strict
diagonal dominance.  Sorting every word in E with only the displayed local
commutators gives ||E|| <= C_sos epsilon.  Clock and coherence perturbations
then yield, for every surviving c_t,

    X^dagger X >= g_clock - (C_sos+6 B) epsilon,

with all constants rational and g_clock>0.  Thus a strictly positive,
volume-independent admissibility radius exists for every compact gauge group
in the fermion representation.  No global gauge fixing, small-link chart,
Abelian hypothesis, or topological-sector restriction is used.

This is a theorem about the conditional lattice regulator.  It is not
empirical evidence, a continuum-limit construction, a reflection-positivity
proof for the interacting fermion measure, or a theorem of nature.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Any


R = Fraction(355508034923519, 10**15)
M = Fraction(790940592107124, 10**15)
TARGET = Fraction(1, 2)
C_MIN_RATIONAL_LOWER = Fraction(977902941999603, 10**15)

Word = tuple[int, ...]
Term = tuple[Word, int]
Poly = dict[Term, Fraction]


def fraction_string(value: Fraction) -> str:
    return f"{value.numerator}/{value.denominator}"


def reduce_word(word: Word) -> Word:
    """Apply only exact adjacent inverse cancellations."""
    stack: list[int] = []
    for letter in word:
        if stack and stack[-1] == -letter:
            stack.pop()
        else:
            stack.append(letter)
    return tuple(stack)


def clifford_product(left: int, right: int) -> tuple[int, int]:
    """Multiply ordered Euclidean gamma monomials encoded as bit masks."""
    inversions = 0
    for index in range(4):
        if (left >> index) & 1:
            inversions += (right & ((1 << index) - 1)).bit_count()
    return (-1 if inversions % 2 else 1), left ^ right


def clifford_adjoint(mask: int) -> int:
    degree = mask.bit_count()
    return -1 if (degree * (degree - 1) // 2) % 2 else 1


def add(poly: Poly, word: Word, mask: int, coefficient: Fraction) -> None:
    if not coefficient:
        return
    key = (reduce_word(word), mask)
    value = poly.get(key, Fraction(0)) + coefficient
    if value:
        poly[key] = value
    elif key in poly:
        del poly[key]


def plus(*polynomials: Poly) -> Poly:
    out: Poly = {}
    for polynomial in polynomials:
        for (word, mask), coefficient in polynomial.items():
            add(out, word, mask, coefficient)
    return out


def scale(poly: Poly, coefficient: Fraction) -> Poly:
    return {
        key: coefficient * value
        for key, value in poly.items()
        if coefficient * value
    }


def multiply(left: Poly, right: Poly) -> Poly:
    out: Poly = {}
    for (left_word, left_mask), left_coefficient in left.items():
        for (right_word, right_mask), right_coefficient in right.items():
            sign, mask = clifford_product(left_mask, right_mask)
            add(
                out,
                left_word + right_word,
                mask,
                left_coefficient * right_coefficient * sign,
            )
    return out


def adjoint(poly: Poly) -> Poly:
    out: Poly = {}
    for (word, mask), coefficient in poly.items():
        add(
            out,
            tuple(-letter for letter in reversed(word)),
            mask,
            coefficient * clifford_adjoint(mask),
        )
    return out


def mono(
    word: Word = (),
    mask: int = 0,
    coefficient: Fraction = Fraction(1),
) -> Poly:
    out: Poly = {}
    add(out, word, mask, coefficient)
    return out


def coherent_kernel() -> Poly:
    """Return Y at c_t=1 in the word/Clifford algebra.

    Generator 1 is V; generators 2,3,4 are S_1,S_2,S_3.  Clifford mask
    bits 0,1,2,3 encode gamma_0,gamma_1,gamma_2,gamma_3.
    """
    spatial_and_onsite = mono(coefficient=1 - M + 3 * R)
    for generator in (2, 3, 4):
        spatial_and_onsite = plus(
            spatial_and_onsite,
            mono((generator,), 0, -R / 2),
            mono((-generator,), 0, -R / 2),
            mono((generator,), 1 << (generator - 1), Fraction(1, 2)),
            mono((-generator,), 1 << (generator - 1), Fraction(-1, 2)),
        )

    # A_0=P_rev V=(1+S_3)(1+S_2)(1+S_1)V/8.
    future: Poly = {}
    for bits in itertools.product((0, 1), repeat=3):
        word = tuple(
            generator
            for generator, present in zip((4, 3, 2), bits)
            if present
        ) + (1,)
        add(future, word, 0, Fraction(1, 8))

    temporal_scalar = scale(plus(future, adjoint(future)), Fraction(-1, 2))
    temporal_vector: Poly = {}
    antisymmetric = plus(future, scale(adjoint(future), -1))
    for (word, _), coefficient in antisymmetric.items():
        add(temporal_vector, word, 1, coefficient / 2)
    return plus(spatial_and_onsite, temporal_scalar, temporal_vector)


def canonical_word(word: Word) -> Word:
    """Commute generators and collect powers in the order V,S1,S2,S3."""
    powers = [0, 0, 0, 0]
    for letter in word:
        powers[abs(letter) - 1] += 1 if letter > 0 else -1
    out: list[int] = []
    for generator, power in enumerate(powers, start=1):
        out.extend(([generator] if power > 0 else [-generator]) * abs(power))
    return tuple(out)


def exponent(word: Word) -> tuple[int, int, int, int]:
    powers = [0, 0, 0, 0]
    for letter in word:
        powers[abs(letter) - 1] += 1 if letter > 0 else -1
    return tuple(powers)  # type: ignore[return-value]


def canonicalize(poly: Poly) -> Poly:
    out: Poly = {}
    for (word, mask), coefficient in poly.items():
        add(out, canonical_word(word), mask, coefficient)
    return out


def scalar_laurent(poly: Poly) -> dict[tuple[int, int, int, int], Fraction]:
    out: dict[tuple[int, int, int, int], Fraction] = defaultdict(Fraction)
    for (word, mask), coefficient in poly.items():
        if mask:
            raise RuntimeError(("uncancelled Clifford coefficient", word, mask))
        out[exponent(word)] += coefficient
    return {key: value for key, value in out.items() if value}


def monomial_basis() -> list[tuple[int, int, int, int]]:
    return list(itertools.product(range(2), range(3), range(3), range(3)))


def difference(left: tuple[int, ...], right: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(right[index] - left[index] for index in range(4))


def certificate_payload_hash(certificate: dict[str, Any]) -> str:
    body = {key: value for key, value in certificate.items() if key != "payload_sha256"}
    canonical = json.dumps(body, separators=(",", ":"), sort_keys=True).encode()
    return hashlib.sha256(canonical).hexdigest()


def unpack_symmetric_upper(values: list[int], size: int, denominator: int) -> list[list[Fraction]]:
    expected = size * (size + 1) // 2
    if len(values) != expected:
        raise RuntimeError(("upper-triangle length", len(values), expected))
    out = [[Fraction(0) for _ in range(size)] for _ in range(size)]
    cursor = 0
    for row in range(size):
        for column in range(row, size):
            value = Fraction(values[cursor], denominator)
            cursor += 1
            out[row][column] = value
            out[column][row] = value
    return out


def unpack_upper(values: list[int], size: int, denominator: int) -> list[list[Fraction]]:
    expected = size * (size + 1) // 2
    if len(values) != expected:
        raise RuntimeError(("upper-triangle length", len(values), expected))
    out = [[Fraction(0) for _ in range(size)] for _ in range(size)]
    cursor = 0
    for row in range(size):
        for column in range(row, size):
            out[row][column] = Fraction(values[cursor], denominator)
            cursor += 1
    return out


def coefficient_groups(
    basis: list[tuple[int, int, int, int]],
) -> dict[tuple[int, int, int, int], list[tuple[int, int]]]:
    groups: dict[tuple[int, int, int, int], list[tuple[int, int]]] = defaultdict(list)
    for left_index, left in enumerate(basis):
        for right_index, right in enumerate(basis):
            groups[difference(left, right)].append((left_index, right_index))
    return groups


def repair_gram_coefficients(
    q_matrix: list[list[Fraction]],
    target: dict[tuple[int, int, int, int], Fraction],
    basis: list[tuple[int, int, int, int]],
) -> int:
    """Project rounded Q onto the affine Laurent-coefficient constraints."""
    groups = coefficient_groups(basis)
    repaired_groups = 0
    for diff in sorted(groups):
        negative = tuple(-entry for entry in diff)
        if diff < negative:
            continue
        pairs = groups[diff]
        current = sum((q_matrix[i][j] for i, j in pairs), Fraction(0))
        residual = target.get(diff, Fraction(0)) - current
        if residual:
            repaired_groups += 1
        correction = residual / len(pairs)
        for i, j in pairs:
            q_matrix[i][j] += correction
            if i != j:
                q_matrix[j][i] += correction

    for diff, pairs in groups.items():
        value = sum((q_matrix[i][j] for i, j in pairs), Fraction(0))
        if value != target.get(diff, Fraction(0)):
            raise RuntimeError(("Gram coefficient mismatch", diff))
    return repaired_groups


def matrix_product(
    left: list[list[Fraction]], right: list[list[Fraction]]
) -> list[list[Fraction]]:
    rows = len(left)
    inner = len(right)
    columns = len(right[0])
    if len(left[0]) != inner:
        raise RuntimeError("matrix shape mismatch")
    return [
        [
            sum((left[row][k] * right[k][column] for k in range(inner)), Fraction(0))
            for column in range(columns)
        ]
        for row in range(rows)
    ]


def transpose(matrix: list[list[Fraction]]) -> list[list[Fraction]]:
    return [list(row) for row in zip(*matrix)]


def verify_positive_gram(
    q_matrix: list[list[Fraction]], r_matrix: list[list[Fraction]]
) -> dict[str, Any]:
    size = len(q_matrix)
    if any(r_matrix[index][index] == 0 for index in range(size)):
        raise RuntimeError("rational congruence is singular")
    h_matrix = matrix_product(transpose(r_matrix), matrix_product(q_matrix, r_matrix))
    if any(
        h_matrix[i][j] != h_matrix[j][i]
        for i in range(size)
        for j in range(size)
    ):
        raise RuntimeError("congruence is not symmetric")
    margins = [
        h_matrix[i][i]
        - sum((abs(h_matrix[i][j]) for j in range(size) if j != i), Fraction(0))
        for i in range(size)
    ]
    minimum_margin = min(margins)
    if minimum_margin <= 0:
        raise RuntimeError(("diagonal-dominance failure", minimum_margin))
    return {
        "congruence_is_invertible": True,
        "congruence_is_exactly_symmetric": True,
        "all_rows_strictly_diagonally_dominant": True,
        "minimum_diagonal_dominance_margin_exact": fraction_string(minimum_margin),
        "minimum_diagonal_dominance_margin_numeric": float(minimum_margin),
        "minimum_diagonal_exact": fraction_string(
            min(h_matrix[i][i] for i in range(size))
        ),
        "maximum_off_diagonal_numeric": max(
            float(abs(h_matrix[i][j]))
            for i in range(size)
            for j in range(size)
            if i != j
        ),
        "Gershgorin_conclusion": "H=R^T Q R>0 exactly, hence Q>0 exactly",
    }


def basis_word(item: tuple[int, int, int, int]) -> Word:
    return tuple(
        generator
        for generator, power in enumerate(item, start=1)
        for _ in range(power)
    )


def gram_polynomial(
    q_matrix: list[list[Fraction]],
    basis: list[tuple[int, int, int, int]],
) -> Poly:
    out: Poly = {}
    words = [basis_word(item) for item in basis]
    for i, left in enumerate(words):
        left_adjoint = tuple(-letter for letter in reversed(left))
        for j, right in enumerate(words):
            add(out, left_adjoint + right, 0, q_matrix[i][j])
    return out


def weighted_swap_cost(word: Word) -> int:
    """Count a sorting path: spatial/spatial costs 1, V/spatial costs 2."""
    cost = 0
    for left_index, left in enumerate(word):
        for right in word[left_index + 1 :]:
            if abs(left) > abs(right):
                cost += 2 if 1 in (abs(left), abs(right)) else 1
    return cost


def noncommutative_error_bound(poly: Poly) -> tuple[Fraction, dict[str, int]]:
    canonical: Poly = {}
    constant = Fraction(0)
    noncanonical_terms = 0
    maximum_cost = 0
    for (word, mask), coefficient in poly.items():
        add(canonical, canonical_word(word), mask, coefficient)
        cost = weighted_swap_cost(word)
        if cost:
            noncanonical_terms += 1
            maximum_cost = max(maximum_cost, cost)
            constant += abs(coefficient) * cost
    if canonical:
        raise RuntimeError(("commutative remainder did not cancel", len(canonical)))
    return constant, {
        "reduced_word_Clifford_term_count": len(poly),
        "noncanonical_term_count": noncanonical_terms,
        "maximum_weighted_swap_cost": maximum_cost,
    }


def polynomial_hash(poly: Poly) -> str:
    rows = [
        [list(word), mask, coefficient.numerator, coefficient.denominator]
        for (word, mask), coefficient in sorted(poly.items())
    ]
    return hashlib.sha256(
        json.dumps(rows, separators=(",", ":")).encode()
    ).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--certificate",
        type=Path,
        default=Path(__file__).with_name("urt_volume_uniform_sos_gap_certificate.json"),
    )
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    if certificate_payload_hash(certificate) != certificate["payload_sha256"]:
        raise RuntimeError("certificate payload hash mismatch")
    if certificate["matrix_size"] != 54:
        raise RuntimeError("unexpected Gram matrix size")

    kernel = coherent_kernel()
    kernel_gram = multiply(adjoint(kernel), kernel)
    q_polynomial = plus(kernel_gram, mono(coefficient=-TARGET))
    commuting = canonicalize(q_polynomial)
    target = scalar_laurent(commuting)
    basis = monomial_basis()
    if len(basis) != certificate["matrix_size"]:
        raise RuntimeError("basis size mismatch")

    q_matrix = unpack_symmetric_upper(
        certificate["q_upper_rounded_numerators"],
        certificate["matrix_size"],
        certificate["q_rounding_denominator"],
    )
    repaired_groups = repair_gram_coefficients(q_matrix, target, basis)
    r_matrix = unpack_upper(
        certificate["r_upper_numerators"],
        certificate["matrix_size"],
        certificate["r_rounding_denominator"],
    )
    positivity = verify_positive_gram(q_matrix, r_matrix)

    gram = gram_polynomial(q_matrix, basis)
    remainder = plus(q_polynomial, scale(gram, -1))
    commutator_constant, word_diagnostics = noncommutative_error_bound(remainder)

    clock_min_squared = 2 * M - M * M
    if C_MIN_RATIONAL_LOWER**2 >= clock_min_squared:
        raise RuntimeError("purported c_min lower bound is not strict")
    operator_norm_bound = 6 + 6 * R - M
    clock_gap_lower = (
        TARGET
        - 2 * operator_norm_bound * (1 - C_MIN_RATIONAL_LOWER)
    )
    if clock_gap_lower <= 0:
        raise RuntimeError("clock-uniform base gap is not positive")
    epsilon_coefficient = commutator_constant + 6 * operator_norm_bound
    epsilon_threshold = clock_gap_lower / epsilon_coefficient
    if epsilon_threshold <= 0:
        raise RuntimeError("admissibility radius is not positive")

    out: dict[str, Any] = {
        "certificate": "URT exact volume-uniform compact-group overlap-gap theorem",
        "date": "2026-09-04",
        "observational_targets_used": False,
        "frozen_parameters": {
            "r_exact": fraction_string(R),
            "r_numeric": float(R),
            "M_exact": fraction_string(M),
            "M_numeric": float(M),
            "surviving_clock_interval": "sqrt(2M-M^2)<=c_t<=1",
            "c_t_min_numeric": math.sqrt(float(clock_min_squared)),
            "strict_rational_lower_bound_for_c_t_min": fraction_string(
                C_MIN_RATIONAL_LOWER
            ),
            "lower_bound_square_check": (
                "c_lower^2 < 2M-M^2 verified exactly"
            ),
        },
        "local_hypotheses": {
            "face_bound": (
                "||I-rho(U_f)||<=epsilon for every repaired elementary "
                "spatial square and future/spatial triangle"
            ),
            "derived_commutators": [
                "||[S_i,S_j]||<=epsilon",
                "||[S_i,V]||<=2 epsilon",
            ],
            "future_coherence": (
                "||A-(1+S_3)(1+S_2)(1+S_1)V/8||<=3 epsilon/2"
            ),
            "scope": (
                "all lattice volumes, every compact gauge group in a unitary "
                "fermion representation, and every topology satisfying the "
                "local face bound"
            ),
        },
        "exact_SOS_certificate": {
            "identity": "Y_1^dagger Y_1-1/2=W^dagger Q W+E",
            "monomial_basis": (
                "W_k=V^k0 S_1^k1 S_2^k2 S_3^k3, "
                "k in {0,1}x{0,1,2}^3"
            ),
            "basis_size": len(basis),
            "coherent_kernel_term_count": len(kernel),
            "kernel_gram_term_count": len(kernel_gram),
            "commuting_Laurent_coefficient_count": len(target),
            "rounded_Gram_groups_repaired_exactly": repaired_groups,
            "all_Laurent_coefficients_match_exactly": True,
            "certificate_payload_sha256": certificate["payload_sha256"],
            "q_polynomial_sha256": polynomial_hash(q_polynomial),
            **positivity,
            "status": "E exact rational sum-of-squares certificate",
        },
        "noncommutative_remainder": {
            **word_diagnostics,
            "sorting_rule": (
                "each spatial/spatial inversion costs epsilon; each "
                "V/spatial inversion costs 2 epsilon; inverse commutators "
                "have the same norm"
            ),
            "canonical_coefficient_sum_is_exactly_zero": True,
            "C_sos_exact": fraction_string(commutator_constant),
            "C_sos_numeric": float(commutator_constant),
            "conclusion": "Y_1^dagger Y_1>=1/2-C_sos epsilon",
            "status": "E exact rational word bound",
        },
        "clock_and_coherence_perturbation": {
            "uniform_kernel_norm_B_exact": fraction_string(operator_norm_bound),
            "uniform_kernel_norm_B_numeric": float(operator_norm_bound),
            "clock_bound": "||Y_c-Y_1||<=1-c",
            "coherence_bound": "||X_c-Y_c||<=3 epsilon",
            "clock_uniform_gap_constant_exact": fraction_string(clock_gap_lower),
            "clock_uniform_gap_constant_numeric": float(clock_gap_lower),
            "epsilon_coefficient_exact": fraction_string(epsilon_coefficient),
            "epsilon_coefficient_numeric": float(epsilon_coefficient),
            "final_operator_inequality": (
                "X_c^dagger X_c>=g_clock-(C_sos+6B)epsilon"
            ),
            "status": "E",
        },
        "theorem": {
            "strict_admissibility_radius_exact": fraction_string(epsilon_threshold),
            "strict_admissibility_radius_numeric": float(epsilon_threshold),
            "statement": (
                "If every repaired face obeys the local norm bound with "
                "epsilon below the displayed strict radius, then X_c^dagger "
                "X_c has the displayed positive volume-uniform lower bound "
                "for every surviving c_t.  The polar overlap is therefore "
                "well-defined and exponentially local by the standard gap argument."
            ),
            "volume_uniform_kernel_gap_established": True,
            "compact_non_Abelian_groups_included": True,
            "global_gauge_fixing_required": False,
            "topologically_trivial_sector_required": False,
            "status": "E conditional lattice theorem",
        },
        "remaining_boundary": {
            "interacting_fermion_reflection_positivity": "U",
            "reflection_positive_weight_enforcing_strict_admissibility": (
                "U; an analytic positive-character weight cannot enforce an "
                "open exclusion by the Creutz obstruction"
            ),
            "chiral_gauge_measure_global_integrability": "U",
            "continuum_limit_and_universality": "U",
            "empirical_validation": "not supplied by a mathematical gap proof",
            "theory_of_nature": False,
            "next_gate": (
                "construct or rule out a reflection-positive nonanalytic "
                "admissibility implementation compatible with the fermion measure"
            ),
        },
        "literature_method": {
            "reference": {
                "authors": "P. Hernandez, K. Jansen, M. Luscher",
                "title": "Locality properties of Neuberger's lattice Dirac operator",
                "arXiv": "hep-lat/9808010",
                "url": "https://arxiv.org/abs/hep-lat/9808010",
            },
            "relation": (
                "The proof follows the HJL local-commutator strategy, but its "
                "rational Gram certificate and triangular coherent product are "
                "specific to the Cathedral stencil."
            ),
        },
    }

    rendered = json.dumps(out, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")


if __name__ == "__main__":
    main()