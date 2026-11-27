#!/usr/bin/env python3
"""Executable finite-state certificate for exact modular filters on OEIS A116150.

This is a reduction certificate, not a proof of the source's least-next-prime question.
The transition state after index n is (a(n), 3^n, (-2)^n) modulo q.  Returning
to an earlier complete state proves the residue pattern repeats forever because the
transition is deterministic.
"""

from __future__ import annotations

import json


def direct(n: int) -> int:
    return sum(3**j + (-2) ** j for j in range(1, n + 1))


def closed(n: int) -> int:
    numerator = 9 * 3**n + 4 * (-2) ** n - 13
    assert numerator % 6 == 0
    return numerator // 6


def state(n: int, q: int) -> tuple[int, int, int]:
    return (direct(n) % q, pow(3, n, q), pow(-2, n, q))


def step(s: tuple[int, int, int], q: int) -> tuple[int, int, int]:
    a, p3, pm2 = s
    p3 = 3 * p3 % q
    pm2 = -2 * pm2 % q
    return ((a + p3 + pm2) % q, p3, pm2)


def certify_cycle(q: int, start: int) -> dict[str, object]:
    initial = state(start, q)
    s = initial
    residues: list[int] = []
    period = None
    for length in range(1, q**3 + 2):
        residues.append(s[0])
        s = step(s, q)
        if s == initial:
            period = length
            break
    assert period is not None, (q, start)
    assert state(start + period, q) == initial
    for i in range(period):
        assert state(start + i, q) == (
            residues[i],
            pow(3, start + i, q),
            pow(-2, start + i, q),
        )
    zeros = [start + i for i, value in enumerate(residues) if value == 0]
    return {"modulus": q, "start": start, "period": period, "zero_residues": zeros}


def main() -> None:
    for n in range(0, 101):
        assert direct(n) == closed(n)
    for n in range(0, 98):
        assert direct(n + 3) == 2 * direct(n + 2) + 5 * direct(n + 1) - 6 * direct(n)

    specs = [(2, 1), (3, 1)] + [
        (q, 0)
        for q in [5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
    ]
    cycles = [certify_cycle(q, start) for q, start in specs]

    # Independent transition check of the Lean invariant over a large prefix.
    parity_state = state(0, 2)
    assert parity_state[0] == 0
    for n in range(1, 10_001):
        parity_state = step(parity_state, 2)
        assert parity_state[0] == n % 2

    print(
        json.dumps(
            {
                "source": "A116150: sum_{j=1}^n (3^j + (-2)^j)",
                "closed_form": "(9*3^n + 4*(-2)^n - 13)/6",
                "recurrence": "a(n+3)=2*a(n+2)+5*a(n+1)-6*a(n)",
                "parity_prefix_checked_through": 10_000,
                "cycles": cycles,
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
