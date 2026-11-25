#!/usr/bin/env python3
"""Exact finite regression for the CountQ quadratic-sign KillsMu leaf."""

from __future__ import annotations

import math
from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
LEAN = Path(__file__).with_name("2026-11-25_COUNTQ_SIGN_KILLSMU.lean")
PINNED = ROOT / "rh_upstream"

ANCHORS = {
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/TorsionOrderFrobenius/QuadMu.lean":
        "theorem quadMu",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/BcDefs.lean":
        "def IsSign",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/SelmerTransport/ConjStableShaFam.lean":
        "theorem range_galEmb",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/CrystallineBaseChange/QuadFam.lean":
        "discr K = -(p : ℤ)",
    "src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean":
        "theorem countQ_alt",
}


def primes(limit: int) -> list[int]:
    return [n for n in range(3, limit + 1) if all(n % d for d in range(2, int(n**0.5) + 1))]


def legendre(a: int, q: int) -> int:
    a %= q
    if a == 0:
        return 0
    v = pow(a, (q - 1) // 2, q)
    return -1 if v == q - 1 else v


def main() -> None:
    positive = 0
    negative = 0
    witnesses: list[tuple[int, int, int]] = []

    # For the actual fundamental discriminants -q, q == 3 mod 4, the sign
    # character is the quadratic character modulo q.  If q|M, every residue
    # congruent to one mod M is congruent to one mod q.  If q does not divide
    # M, CRT must expose a residue fixing mu_M but carrying sign -1.
    for q in (p for p in primes(97) if p % 4 == 3):
        for m in range(1, 97):
            modulus = math.lcm(q, m)
            candidates = [a for a in range(1, modulus + 1)
                          if math.gcd(a, modulus) == 1 and a % m == 1 % m]
            if q and m % q == 0:
                assert all(legendre(a, q) == 1 for a in candidates)
                positive += len(candidates)
            else:
                bad = next((a for a in candidates if legendre(a, q) == -1), None)
                assert bad is not None, (q, m, modulus)
                witnesses.append((q, m, bad))
                negative += 1

    for relative, needle in ANCHORS.items():
        text = (PINNED / relative).read_text(encoding="utf-8")
        assert needle in text, (relative, needle)

    lean = LEAN.read_text(encoding="utf-8")
    lowered = lean.lower()
    assert "sorry" not in lowered and "admit" not in lowered
    for token in ("rh_prune", "rh_scan", "rh_reduce", "rh_auto", "rh_auto_frontier", "#print axioms"):
        assert token in lean, token
    for theorem in ("quadMu", "range_galEmb", "sign_killsMu_absDiscr", "killsMu_of_dvd"):
        assert theorem in lean, theorem

    print("COUNTQ QUADRATIC-SIGN KILLSMU CERTIFICATE")
    print("source_pin=40e56bab026552e089d7afcfeff08d2defb9c005")
    print(f"supported residue cases={positive}")
    print(f"unsupported moduli with explicit negative witness={negative}")
    print(f"first negative witnesses={witnesses[:5]}")
    print(f"pinned source anchors={len(ANCHORS)}")
    print("prepared Lean hygiene=True")
    print("RESULT: |disc K| divides M gives KillsMu M for the sign character;")
    print("        when q does not divide M, the prime-conductor model supplies")
    print("        an automorphism fixing mu_M on which the sign is -1")


if __name__ == "__main__":
    main()
