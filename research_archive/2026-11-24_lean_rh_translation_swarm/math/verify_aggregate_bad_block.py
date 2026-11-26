#!/usr/bin/env python3
"""Finite audit of the bounded-bad-terminal block extraction theorem."""

from bisect import bisect_right
import math
from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
SOURCE_BLOBS = {
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/CharFamily.lean":
        "81c8dfd66d910d083d5bc88c664c7917fdbdfe96",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/landauWindow.lean":
        "7915058f10b33a52652290cd887cbccdc00e676a",
    "src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean":
        "2ed00ad3aa862f3e522686557fb8f559b17fc002",
}
X = 5_000.0
A = 1.2
ALPHA = 0.75
C = 0.09
M = 3


def primes_up_to(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if sieve[p]:
            sieve[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i, flag in enumerate(sieve) if flag]


def positive_square_piece(p: float, a: float, b: float, level: float) -> float:
    upper = min(b, level)
    if upper <= a:
        return 0.0
    value = p * (
        level * level * (1.0 / a - 1.0 / upper)
        - 2.0 * level * math.log(upper / a)
        + (upper - a)
    )
    return max(0.0, value)


def main() -> None:
    repo = Path(__file__).resolve().parents[3]
    upstream = repo.parent / "rh_upstream"
    actual = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=upstream, text=True
    ).strip()
    assert actual == PIN, (actual, PIN)
    for path, expected in SOURCE_BLOBS.items():
        blob = subprocess.check_output(
            ["git", "hash-object", path], cwd=upstream, text=True
        ).strip()
        assert blob == expected, (path, blob, expected)

    upper = X**A
    primes = primes_up_to(100_000)
    logs = [math.log(p) for p in primes]
    prefix_log = [0.0]
    prefix_harm = [0.0]
    for p, lp in zip(primes, logs):
        prefix_log.append(prefix_log[-1] + lp)
        prefix_harm.append(prefix_harm[-1] + lp / p)

    normalized = []
    for i, p in enumerate(primes):
        if not (X < p <= upper):
            continue
        left = bisect_right(primes, p / 2.0)
        e_terminal_left = prefix_log[i] - p
        a = p / 2.0
        theta = prefix_log[left]
        pieces = []
        for j in range(left, i):
            b = float(primes[j])
            pieces.append(
                positive_square_piece(float(p), a, b, theta - e_terminal_left)
            )
            theta += logs[j]
            a = b
        pieces.append(
            positive_square_piece(float(p), a, float(p), theta - e_terminal_left)
        )
        variance = math.fsum(pieces)
        normalized.append((p, variance / p ** (2.0 * ALPHA)))

    bad = [p for p, value in normalized if value > C * C]
    assert len(bad) <= M, (bad, M)

    boundaries = [X] + [float(p) for p in bad] + [upper]
    gaps = list(zip(boundaries, boundaries[1:]))
    y, r = max(gaps, key=lambda pair: math.log(pair[1] / pair[0]))
    guaranteed_log_gap = (A - 1.0) * math.log(X) / (M + 1.0)
    actual_log_gap = math.log(r / y)
    assert actual_log_gap + 1e-14 >= guaranteed_log_gap

    eta = (A - 1.0) / (A * (M + 1.0))
    delta = eta / 2.0
    z = y ** (1.0 + delta)
    next_z = primes[bisect_right(primes, z)]
    # This finite sample has more reserve than the asymptotic factor-three
    # argument needs; the general theorem obtains this once X is large.
    assert 3.0 * z < r
    assert next_z < r
    assert not any(y < p <= next_z for p in bad)

    c = 1.0 - math.log(2.0)
    assert y ** (1.0 - ALPHA) >= 2.0 * C * ALPHA / c
    terminal = {p: value for p, value in normalized}
    for p in primes:
        if y < p <= next_z:
            assert terminal[p] <= C * C + 1e-12

    def deficit(x: float) -> float:
        lo = bisect_right(primes, x / 2.0)
        hi = bisect_right(primes, x)
        shell = (
            2.0 * (prefix_log[hi] - prefix_log[lo])
            - x * (prefix_harm[hi] - prefix_harm[lo])
        )
        return c * x - shell

    sample_count = 20_001
    min_slack = math.inf
    for k in range(sample_count):
        point = y + (z - y) * k / (sample_count - 1)
        slack = C * point**ALPHA - deficit(point)
        assert slack >= -4e-8, (point, slack)
        min_slack = min(min_slack, slack)

    print(f"PIN: {PIN}")
    print(f"PASS: {len(normalized)} actual-prime terminal variances")
    print(f"bad terminals = {bad} (count {len(bad)} <= M={M})")
    print(f"largest bad-free gap = ({y:.12g}, {r:.12g})")
    print(f"actual/guaranteed log-gap ratio = {actual_log_gap / guaranteed_log_gap:.12g}")
    print(f"fixed extracted delta = {delta:.12g}")
    print(f"extracted window = [{y:.12g}, {z:.12g}]")
    print(f"next prime after window = {next_z} < gap endpoint {r:.12g}")
    print(f"PASS: {sample_count} extracted-window shell samples")
    print(f"minimum sampled shell slack = {min_slack:.12g}")
    print("LIMIT: finite audit only; bounded asymptotic bad-count premise is unproved")


if __name__ == "__main__":
    main()
