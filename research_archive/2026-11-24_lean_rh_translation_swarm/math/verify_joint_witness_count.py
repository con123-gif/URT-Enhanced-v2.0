#!/usr/bin/env python3
"""Exact finite controls for the joint-witness premise weakening.

This checks logic and rational exponent algebra only.  It is not a Lean
kernel check and not evidence for the missing arithmetic premise.
"""

from fractions import Fraction
from itertools import product


def joint(polar: tuple[bool, ...], arithmetic: tuple[bool, ...]) -> bool:
    return any(p and a for p, a in zip(polar, arithmetic, strict=True))


def ae_implication(
    polar: tuple[bool, ...], arithmetic: tuple[bool, ...]
) -> bool:
    # Every point has positive mass in this finite control model.
    return all((not p) or a for p, a in zip(polar, arithmetic, strict=True))


def main() -> None:
    sizes_checked = 0
    assignments_checked = 0
    converse_countermodels = 0
    for size in range(1, 8):
        sizes_checked += 1
        for polar in product((False, True), repeat=size):
            for arithmetic in product((False, True), repeat=size):
                assignments_checked += 1
                # Finite positive-atom analogue only: every point has
                # positive mass, so a nonempty polar event plus the a.e.
                # implication yields a joint point.  The actual continuous
                # proof uses the strict weighted-mean lemma, not this test.
                if any(polar) and ae_implication(polar, arithmetic):
                    assert joint(polar, arithmetic)
                if joint(polar, arithmetic) and not ae_implication(
                    polar, arithmetic
                ):
                    converse_countermodels += 1

    # Named four-point countermodel from the mathematical note.
    polar = (True, True, True, True)
    arithmetic = (True, False, False, False)
    assert joint(polar, arithmetic)
    assert not ae_implication(polar, arithmetic)
    assert converse_countermodels > 0

    exponent_checks = 0
    for numerator in range(1, 100):
        epsilon = Fraction(numerator, 10_000)
        eta = 4 * epsilon / 9
        lhs = 1 - eta / 2
        rhs = 1 - 2 * epsilon / 9
        assert lhs == rhs
        exponent_checks += 1

    math_dir = __import__("pathlib").Path(__file__).resolve().parent
    lean_path = math_dir / "2026-11-28_JOINT_WITNESS_COUNT_EQUATION.lean"
    lean = lean_path.read_text(encoding="utf-8")
    forbidden = ("sorry", "admit", "native_decide")
    for token in forbidden:
        assert token not in lean, f"forbidden token in candidate: {token}"
    anchors = (
        "def JointBudgetAt",
        "def JointBudgetOn",
        "theorem joint_of_fiber",
        "hg hpolar",
        "theorem eventually_primeError_on_set",
        "theorem endpoint_from_joint",
        "def CanonicalJointCount",
        "theorem count_escape_grid_from_joint",
        "theorem zeta_line_from_canonical_joint",
        "RHIntegration97.finite_power_scalar",
        "RHDepCountEscape82.zeta_line_from_count_escape_grid",
    )
    for anchor in anchors:
        assert lean.count(anchor) >= 1, f"missing Lean anchor: {anchor}"

    print(
        "JOINT_WITNESS_LOGIC_OK",
        f"sizes={sizes_checked}",
        f"assignments={assignments_checked}",
        f"converse_countermodels={converse_countermodels}",
        f"exponent_checks={exponent_checks}",
        f"lean_anchors={len(anchors)}",
    )


if __name__ == "__main__":
    main()

