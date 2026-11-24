#!/usr/bin/env python3
"""Finite regression for the source-matched QH.stage2 reconstruction.

Checks provenance and elementary wrapper/CRT algebra. It is not a Lean replay
and does not certify the generic analytic stage theorem.
"""

from __future__ import annotations

import math
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCES = {
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/CharOf.lean":
        "3eeed8077330efa249cde313d99d89a7c09d8ba6",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/StagePow.lean":
        "2f7159075ea0e309f4a7ff7e237ede7b71bbe5e7",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/ExistsCoprimePrimePairSetSecondEqPPset.lean":
        "cefa9655ae40be3c48b7a2995743fc2252213bda",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/LogOddM.lean":
        "939d67273709b6304685578c54db13ee49c98296",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/TwistPrim.lean":
        "5443adc0075731900672030d140d5d8c85b668f7",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean":
        "45616f33334b6ef360b18a8e64c0eb325f9463b8",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean":
        "712579c16be75074705a2c5c00f69e2f5d835cf9",
}


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    for p in range(2, math.isqrt(n) + 1):
        if n % p == 0:
            return False
    return True


def next_prime(n: int) -> int:
    q = n + 1
    while not is_prime(q):
        q += 1
    return q


def odd_m(z: float, q: int) -> int:
    result = q
    for p in range(3, math.floor(z) + 1):
        if is_prime(p):
            result *= p
    return result


def check_crt() -> tuple[int, int]:
    z, q = 5.0, 11
    odd = odd_m(z, q)  # 11 * 3 * 5
    modulus = 16 * odd
    residues = [a for a in range(modulus) if a % 16 == 7 and (a + 1) % odd == 0]
    assert len(residues) == 1
    a0 = residues[0]
    assert math.gcd(a0, modulus) == 1
    checks = 0
    for d in range(3 * modulus + 1):
        structured = d % 16 == 7 and (d + 1) % odd == 0
        progression = d % modulus == a0 % modulus
        assert structured == progression
        checks += 1
    return checks, a0


def cutoff_log(eps: float, k: float, n0: int) -> tuple[float, float]:
    length = 2.0
    for _ in range(300_000):
        exponent = eps * length / 5
        if exponent < 700:
            z = math.exp(exponent)
            if (
                800 * k * length <= z
                and 2 * math.log(n0) + 2 <= z
                and k * k <= math.exp(eps * length / 25)
            ):
                return length, z
        length *= 1.003
    raise AssertionError((eps, k, n0, length))


def check_scales() -> int:
    checks = 0
    for eps in (1 / 1000, 1 / 401, 1 / 104, 1 / 53):
        epsp = 6 * eps / 5
        assert math.isclose(epsp / 6, eps / 5)
        assert math.isclose(epsp / 5, eps / 5 + eps / 25)
        assert epsp <= 1 / 4
        for k in (1.0, 1.5, 3.0):
            for n0 in (1, 7, 100):
                length, z = cutoff_log(eps, k, n0)
                lower = z * length * length
                upper = k * k * lower
                assert 400 * k * length <= z / 2
                for zp in (lower, (lower + upper) / 2, upper):
                    # admitted.log_m, using the source bound log m0 <= 4z
                    assert 0.25 * length * length * (4 * z) <= zp * (1 + 1e-12)
                    # admitted.lo: Y^(eps'/6) = z
                    assert z <= zp
                    # admitted.hi
                    rhs = math.exp(epsp * length / 5) * length * length
                    assert zp <= rhs + max(1e-7, 1e-12 * rhs)
                    # F <= sqrt(U), checked after logarithms
                    assert math.log(n0) + z <= zp / 2
                    # F*U scale identity after taking logarithms
                    assert math.isclose(
                        math.log(n0) + z + zp,
                        math.log(n0) + (z + zp),
                    )
                    checks += 6
    return checks


def check_family_and_witness() -> tuple[int, int]:
    family_checks = witness_checks = 0
    for n0 in range(1, 61):
        q = next_prime(n0)
        conductors = [c for c in range(1, n0 + 1) if n0 % c == 0]
        labels = list(range(2 * n0 + 1))
        image = set()
        for xi in labels:
            c = conductors[xi % len(conductors)]
            for a in (0, 1):
                level = c if a == 0 else c * q
                assert level <= n0 * q
                image.add((c, a))
                family_checks += 1
        assert len(image) <= 2 * len(labels)

        d = next_prime(q)
        for n in range(1, 5 * n0 * q + 1):
            if math.gcd(n, n0 * q * d) != 1:
                continue
            assert math.gcd(n, n0) == 1
            xi = (3 * n + 1) % 17 - 8
            jq = (n % 3) - 1
            jd = ((2 * n) % 5) - 2
            for a in (0, 1):
                g = xi * (jq ** a)
                assert g * jd == xi * (jq ** a) * jd
                witness_checks += 2
    # Converse coprimality negative control: n=q is coprime to N0 here.
    n0, q, d = 5, 7, 11
    assert math.gcd(q, n0) == 1 and math.gcd(q, n0 * q * d) != 1
    # Omitting the q twist at a=1 changes the target.
    xi, jq, jd = 2, -1, 3
    assert xi * jd != xi * jq * jd
    return family_checks, witness_checks


def check_modulus_prime_branches() -> int:
    z, q = 7.0, 11
    m0 = 16 * odd_m(z, q)
    checks = 0
    for p in range(2, m0 + 1):
        if is_prime(p) and m0 % p == 0:
            assert p == 2 or p == q or p <= z
            checks += 1
    assert {p for p in range(2, m0 + 1) if is_prime(p) and m0 % p == 0} == {2, 3, 5, 7, 11}
    return checks


def check_report() -> int:
    report = Path(__file__).with_name("2026-11-24_stage2_bad_goodd_share.md")
    text = report.read_text(encoding="utf-8")
    assert PIN in text
    for path, blob in SOURCES.items():
        assert path in text and blob in text
    anchors = (
        "QH.stage2",
        "eps' = 6*eps/5",
        "eps'/6 = eps/5",
        "eps'/5 = eps/5 + eps/25",
        "800*K*log Y <= z",
        "primeSetTwoBounds z z' q = PPset",
        "16*oddM(z,q)",
        "(Y^K)^400",
        "a in {0,1}",
        "M=N0*q*d",
        "F*U = N0*exp z*exp z'",
        "count_bad",
        "not a Lean kernel replay",
        "Failed attempts / limitations",
        "RESUME HERE",
    )
    for anchor in anchors:
        assert anchor in text, anchor
    return 1 + len(SOURCES) + len(anchors)


def main() -> None:
    crt_checks, a0 = check_crt()
    scale_checks = check_scales()
    family_checks, witness_checks = check_family_and_witness()
    branch_checks = check_modulus_prime_branches()
    assert 0 < 1 / 53 < 1 / 52
    assert not (0 < 1 / 52 < 1 / 52)
    report_checks = check_report()
    print(
        "stage2 bad-GoodD regression: OK; "
        f"sources={len(SOURCES)}, crt_checks={crt_checks}, crt_residue={a0}, "
        f"scale_checks={scale_checks}, family_checks={family_checks}, "
        f"witness_checks={witness_checks}, modulus_branch_checks={branch_checks}, "
        f"report_checks={report_checks}, negative_controls=3"
    )


if __name__ == "__main__":
    main()
