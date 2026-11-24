#!/usr/bin/env python3
"""Finite regression for the source-matched QH.pair_exists assembly.

This checks only the cardinality and real-arithmetic witness-extraction steps,
plus one explicit Rows fixture. It is not a Lean replay or analytic proof.
"""

from __future__ import annotations

import math
from pathlib import Path


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCES = {
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairExists.lean":
        "7e63fdeda04264253733059bf951a4c1635cebaa",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PairShare.lean":
        "712579c16be75074705a2c5c00f69e2f5d835cf9",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/RowsOfMem.lean":
        "f9d738eb0e0dce29b14633183dcafe3e0db5cb0d",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/PrimeSetTwoBounds.lean":
        "45616f33334b6ef360b18a8e64c0eb325f9463b8",
    "src/Development/AutomorphicArithmetic/MeanSquareBounds/pairEx.lean":
        "0020840fcf9b97e9e6e834c591e8516b9875e003",
}


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    if n % 2 == 0:
        return n == 2
    p = 3
    while p * p <= n:
        if n % p == 0:
            return False
        p += 2
    return True


def next_prime(n: int) -> int:
    while not is_prime(n):
        n += 1
    return n


def check_half_density_nonempty() -> int:
    checks = 0
    for pcard in range(1, 201):
        for gcard in range(pcard + 1):
            if 2 * gcard >= pcard:
                assert gcard > 0
                checks += 1
    # Negative control: eta=1 makes the lower bound zero.
    pcard, gcard = 7, 0
    assert (1 - 1) * pcard <= gcard
    return checks


def check_cutoffs() -> tuple[int, int]:
    checks = 0
    for eps in (1 / 1000, 1 / 200, 1 / 100, 1 / 53):
        assert 0 < eps < 1 / 52
        for n0 in (1, 3, 10, 50, 200):
            # Work in log Y to avoid constructing astronomically large Y.
            log_y = max(2.0, 5 * math.log(2 * n0) / eps) + 0.25
            z = math.exp(eps * log_y / 5)
            zprime_lower = z * log_y**2
            assert log_y >= 2
            assert z + 1e-10 >= 2 * n0
            assert zprime_lower + 1e-10 >= 2 * z
            checks += 3
    # Negative control: Y=e has log(Y)^2=1, so z'=z need not be >=2z.
    log_y, z = 1.0, 3.0
    zprime_lower = z * log_y**2
    assert zprime_lower < 2 * z
    return checks, 1


def check_n0_lt_q_chain() -> int:
    checks = 0
    for n0 in range(1, 9):
        z = 2.0 * n0
        q = next_prime(math.ceil(math.exp(n0 + 0.1)))
        assert is_prime(q) and q > 0
        assert n0 <= z / 2
        assert z / 2 < math.log(q)
        assert math.log(q) <= q - 1
        assert q - 1 < q
        assert n0 < q
        checks += 6
    return checks


def check_rows_fixture() -> tuple[int, int]:
    z, zprime, q, d = 3.0, 6.0, 11, 263
    assert 0 < z and 2 * z <= zprime
    assert is_prime(q) and q % 8 == 3
    assert math.exp(z / 2) < q <= math.exp(z)
    assert is_prime(d) and d % 16 == 7
    assert math.exp(zprime / 2) < d <= math.exp(zprime)
    # For z=3 the odd-prime product is 3; oddM(z,q)=3*q.
    assert (d + 1) % (3 * q) == 0
    assert z / 2 < math.log(q) <= z
    assert zprime / 2 < math.log(d) <= zprime
    assert q < d
    for p in (3, q):
        assert (d + 1) % p == 0
    positive_checks = 12

    # Negative control: interval bounds alone do not order the primes if the
    # 2z<=z' separation is removed. This does not claim second-set membership.
    z_bad, zprime_bad, q_bad, d_bad = 6.0, 2.0, 251, 7
    assert is_prime(q_bad) and q_bad % 8 == 3
    assert math.exp(z_bad / 2) < q_bad <= math.exp(z_bad)
    assert is_prime(d_bad) and d_bad % 16 == 7
    assert math.exp(zprime_bad / 2) < d_bad <= math.exp(zprime_bad)
    assert q_bad > d_bad and not (2 * z_bad <= zprime_bad)
    return positive_checks, 1


def check_report() -> int:
    report = Path(__file__).with_name("2026-11-24_pair_exists_witness_extraction.md")
    text = report.read_text(encoding="utf-8")
    assert PIN in text
    for path, blob in SOURCES.items():
        assert path in text and blob in text
    anchors = (
        "QH.pair_exists",
        "eta = 1/2",
        "Y0 = max(max(Y1,Y2), exp 2)",
        "2*N0 <= z",
        "2*z <= z*(log Y)^2 <= z'",
        "rows_of_mem z z' q d hz hzz (hG1 hq) (hG2 hd)",
        "(N0:real) <= z/2 < log q <= q-1 < q",
        "QH.pairEx",
        "QH.ind_drop",
        "Failed attempts / limitations",
        "RESUME HERE",
        "not a proof of RH",
    )
    for anchor in anchors:
        assert anchor in text, anchor
    return 1 + len(SOURCES) + len(anchors)


def main() -> None:
    density_checks = check_half_density_nonempty()
    cutoff_checks, cutoff_negative = check_cutoffs()
    lower_bound_checks = check_n0_lt_q_chain()
    rows_checks, rows_negative = check_rows_fixture()
    report_checks = check_report()
    print(
        "pair_exists witness regression: OK; "
        f"sources={len(SOURCES)}, density_checks={density_checks}, "
        f"cutoff_checks={cutoff_checks}, lower_bound_checks={lower_bound_checks}, "
        f"rows_checks={rows_checks}, report_checks={report_checks}, "
        f"negative_controls={1 + cutoff_negative + rows_negative}"
    )


if __name__ == "__main__":
    main()
