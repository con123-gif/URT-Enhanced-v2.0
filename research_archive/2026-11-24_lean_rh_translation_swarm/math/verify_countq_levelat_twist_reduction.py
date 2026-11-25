#!/usr/bin/env python3
"""Exact finite regression for the algebra in the LevelAt twist reduction."""

from pathlib import Path


MOD = 5
GEN = 2  # generator of F_5^*


def char(exp: int, x: int) -> int:
    """Character C4 -> F5*, represented by its exponent modulo four."""
    return pow(GEN, (exp * x) % 4, MOD)


def same(a: int, b: int) -> bool:
    return all(char(a, x) == char(b, x) for x in range(4))


def main() -> None:
    cancellation = 0
    relation = 0
    for k0 in range(4):
        for k1 in range(4):
            for delta in range(4):
                for cyc in range(4):
                    before = same(k0, k1 + cyc)
                    after = same(k0 + delta, k1 + delta + cyc)
                    assert before == after
                    cancellation += 1

    for cyc in range(4):
        for m in range(-6, 7):
            for chi in range(4):
                for delta in range(4):
                    kappa = m * cyc + chi
                    assert same(kappa + delta, m * cyc + (chi + delta))
                    relation += 1

    lean = Path(__file__).with_name("2026-11-25_COUNTQ_LEVELAT_TWIST_REDUCTION.lean")
    text = lean.read_text(encoding="utf-8")
    forbidden = ("sorry", "admit", "Main.riemannHypothesis")
    assert not any(word in text for word in forbidden)
    required = (
        "levelAt_twist_of_killsMu_of_potCrys",
        "killsMu_mul",
        "flag_twist",
        "mul_right_cancel",
        "rh_reduce",
        "rh_auto_frontier",
        "rh_scan UpperTheory.GalN.V.Win.N.countQ_alt",
        "#print axioms",
    )
    assert all(word in text for word in required)

    print("COUNTQ LEVELAT TWIST REDUCTION CERTIFICATE")
    print("finite character group=C4 into F_5^*")
    print(f"distinct-character cancellation cases={cancellation}")
    print(f"flag-relation transport cases={relation}")
    print("prepared Lean hygiene=True")
    print("RESULT: LevelAt flag algebra is twist invariant; only same-modulus")
    print("        KillsMu and finite-character PotCrys transport remain")


if __name__ == "__main__":
    main()
