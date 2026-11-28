#!/usr/bin/env python3
"""Finite logic/algebra controls for canonical selected-record equation.

Not a Lean kernel check and not evidence for the missing prime estimate.
"""

from fractions import Fraction
from itertools import combinations
from pathlib import Path


def subsets(n: int):
    universe = range(n)
    for size in range(n + 1):
        for subset in combinations(universe, size):
            yield frozenset(subset)


def main() -> None:
    inclusion_checks = 0
    count_checks = 0
    for n in range(9):
        all_sets = tuple(subsets(n))
        for source in all_sets:
            for canonical in all_sets:
                inclusion_checks += 1
                if source <= canonical:
                    assert len(source) <= len(canonical)
                    count_checks += 1

    strict_to_weak = 0
    boundary_controls = 0
    for q_num in range(-40, 41):
        for e_num in range(-40, 41):
            q = Fraction(q_num, 7)
            e = Fraction(e_num, 7)
            if q < e:
                assert q <= e
                strict_to_weak += 1
            if q == e:
                assert q <= e and not q < e
                boundary_controls += 1

    exponent_checks = 0
    for numerator in range(1, 100):
        epsilon = Fraction(numerator, 10_000)
        assert 1 - (4 * epsilon / 9) / 2 == 1 - 2 * epsilon / 9
        exponent_checks += 1

    math_dir = Path(__file__).resolve().parent
    lean = (math_dir / "2026-11-28_CANONICAL_SELECTED_RECORD_EQUATION.lean").read_text(
        encoding="utf-8"
    )
    for token in ("sorry", "admit", "native_decide"):
        assert token not in lean, f"forbidden token: {token}"
    anchors = (
        "def SelectedGood",
        "def selectedGoodSet",
        "def CanonicalSelectedCount",
        "theorem selected_count_iff_canonical",
        "RHMathCanonicalCount.countEscape_mono_prime",
        "theorem zeta_line_from_canonical_selected",
        "RHEditorSelected.zeta_line_from_selected_count",
    )
    for anchor in anchors:
        assert anchor in lean, f"missing Lean anchor: {anchor}"

    print(
        "CANONICAL_SELECTED_RECORD_LOGIC_OK",
        f"inclusion_checks={inclusion_checks}",
        f"count_checks={count_checks}",
        f"strict_to_weak={strict_to_weak}",
        f"boundary_controls={boundary_controls}",
        f"exponent_checks={exponent_checks}",
        f"lean_anchors={len(anchors)}",
    )


if __name__ == "__main__":
    main()

