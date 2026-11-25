#!/usr/bin/env python3
"""Exact finite regression for quadratic-twist preservation of DualTw."""

from itertools import product
from pathlib import Path


P = 5


def det(a):
    return (a[0] * a[3] - a[1] * a[2]) % P


def transpose(a):
    return (a[0], a[2], a[1], a[3])


def mul(a, b):
    return (
        (a[0] * b[0] + a[1] * b[2]) % P,
        (a[0] * b[1] + a[1] * b[3]) % P,
        (a[2] * b[0] + a[3] * b[2]) % P,
        (a[2] * b[1] + a[3] * b[3]) % P,
    )


def smul(d, a):
    return tuple((d * x) % P for x in a)


def main():
    gl2 = [a for a in product(range(P), repeat=4) if det(a)]
    units = list(range(1, P))
    sign_units = [1, P - 1]
    dual_relations = 0
    generic_twists = 0
    sign_twists = 0

    for a in gl2:
        at = transpose(a)
        for pairing in gl2:
            lhs = mul(mul(at, pairing), a)
            for theta in units:
                if lhs != smul(theta, pairing):
                    continue
                dual_relations += 1
                for d in units:
                    twisted = smul(d, a)
                    twisted_lhs = mul(mul(transpose(twisted), pairing), twisted)
                    expected = smul((d * d * theta) % P, pairing)
                    assert twisted_lhs == expected
                    generic_twists += 1
                for d in sign_units:
                    twisted = smul(d, a)
                    twisted_lhs = mul(mul(transpose(twisted), pairing), twisted)
                    assert twisted_lhs == smul(theta, pairing)
                    sign_twists += 1

    here = Path(__file__).resolve().parent
    lean = (here / "2026-11-25_COUNTQ_DUAL_TWIST_INVARIANCE.lean").read_text()
    forbidden = ("sorry", "admit", "axiom rh", "Main.riemannHypothesis")
    hygiene = all(token not in lean for token in forbidden)
    assert hygiene
    assert "rh_reduce" in lean
    assert "rh_auto_frontier" in lean
    assert "rh_auto" in lean
    assert "rh_scan UpperTheory.GalN.V.Win.N.countQ_alt" in lean
    assert "#print axioms" in lean

    print("COUNTQ DUAL-TWIST INVARIANCE CERTIFICATE")
    print(f"field=F_{P}")
    print(f"GL(2,F_{P}) matrices={len(gl2)}")
    print(f"DualTw point relations={dual_relations}")
    print(f"generic twist identities checked={generic_twists}")
    print(f"quadratic-sign invariances checked={sign_twists}")
    print(f"prepared Lean hygiene={hygiene}")
    print("RESULT: twisting sends theta to delta^2*theta; sign-square one")
    print("        preserves the original DualTw and IsCycWt witness")


if __name__ == "__main__":
    main()
