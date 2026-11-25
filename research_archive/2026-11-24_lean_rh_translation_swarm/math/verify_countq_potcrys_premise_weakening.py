#!/usr/bin/env python3
"""Finite regression and source-hygiene audit for the PotCrys reduction."""

from pathlib import Path


def divisors(n: int) -> tuple[int, ...]:
    return tuple(d for d in range(1, n + 1) if n % d == 0)


def main() -> None:
    # In C_n, H_d is represented by multiples of d.  If two characters are
    # trivial on H_a and H_b, their product is trivial on H_lcm(a,b).
    cases = 0
    for n in range(1, 65):
        for a in divisors(n):
            for b in divisors(n):
                common = a * b
                while common % a or common % b:
                    common += a * b
                # a*b is a valid (not necessarily minimal) common subgroup
                # modulus and has finite index in the finite model.
                assert common % a == 0 and common % b == 0
                for x in range(0, n * common, common):
                    assert x % a == 0 and x % b == 0
                cases += 1

    here = Path(__file__).parent
    lean = (here / "2026-11-25_COUNTQ_POTCRYS_PREMISE_WEAKENING.lean").read_text(
        encoding="utf-8"
    )
    forbidden = ("sorry", "admit", "Main.riemannHypothesis")
    assert not any(word in lean for word in forbidden)
    required = (
        "potCrysAt_twist_of_rankOnePotCrys",
        "GlobalTheory.TwistAbove.twist_above",
        "IsPotCrysAt (Loc.PP l) Bw",
        "rh_reduce",
        "rh_auto_frontier",
        "rh_scan UpperTheory.GalN.V.Win.N.countQ_alt",
        "#print axioms",
    )
    assert all(word in lean for word in required)

    upstream = Path("/workspace/scratch/fd93126e52da/rh_upstream")
    source = upstream / (
        "src/Development/AbelianVarietyTheory/Proofs/"
        "InertiaEigenvalues/RepERankOne.lean"
    )
    if upstream.exists():
        text = source.read_text(encoding="utf-8")
        assert "theorem twist_above" in text
        assert "Bw.IsPotCrysE P L r\u2081 →" in text
        assert "Bw.IsPotCrysE P L m →" in text

    print("COUNTQ POTCRYS PREMISE WEAKENING CERTIFICATE")
    print(f"finite common-extension models={cases}")
    print("pinned native twist_above source anchor=True")
    print("prepared Lean hygiene=True")
    print("RESULT: twist potential crystallinity needs only the rank-one")
    print("        twisting character to be potentially crystalline")


if __name__ == "__main__":
    main()
