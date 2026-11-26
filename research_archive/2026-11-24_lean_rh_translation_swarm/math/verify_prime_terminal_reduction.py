#!/usr/bin/env python3
"""Finite audit of the prime-terminal reduction; not evidence for RH."""

from bisect import bisect_right
from collections import deque
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
LIMIT = 250_000


def primes_up_to(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if sieve[p]:
            sieve[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i, flag in enumerate(sieve) if flag]


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

    primes = primes_up_to(LIMIT)
    logs = [math.log(p) for p in primes]
    prefix_log = [0.0]
    prefix_harm = [0.0]
    for p, lp in zip(primes, logs):
        prefix_log.append(prefix_log[-1] + lp)
        prefix_harm.append(prefix_harm[-1] + lp / p)

    e_at_prime = [prefix_log[i + 1] - p for i, p in enumerate(primes)]
    running_max: deque[int] = deque()
    c = 1.0 - math.log(2.0)
    records: list[tuple[int, float, float]] = []
    min_margin = math.inf
    max_integral_residual = 0.0

    for i in range(1, len(primes)):
        p = primes[i]
        add = i - 1
        while running_max and e_at_prime[running_max[-1]] <= e_at_prime[add]:
            running_max.pop()
        running_max.append(add)
        while running_max and primes[running_max[0]] <= p / 2.0:
            running_max.popleft()

        left = bisect_right(primes, p / 2.0)
        e_left = prefix_log[left] - p / 2.0
        e_terminal_left = prefix_log[i] - p
        node_term = (
            e_at_prime[running_max[0]] - e_terminal_left
            if running_max else -math.inf
        )
        terminal_max = max(0.0, e_left - e_terminal_left, node_term)

        sum_log = prefix_log[i] - prefix_log[left]
        sum_harm = prefix_harm[i] - prefix_harm[left]
        shell_left = 2.0 * sum_log - p * sum_harm
        deficit_left = c * p - shell_left
        margin = terminal_max - deficit_left
        assert margin >= -3e-9, (p, terminal_max, deficit_left, margin)
        min_margin = min(min_margin, margin)
        records.append((p, terminal_max, deficit_left))

        if i % 997 == 0:
            events = [p / 2.0] + primes[left:i] + [float(p)]
            pieces = []
            for a, b in zip(events, events[1:]):
                theta = prefix_log[bisect_right(primes, a)]
                k = theta - e_terminal_left
                pieces.append(p * (k * (1.0 / a - 1.0 / b) - math.log(b / a)))
            integral = math.fsum(pieces)
            residual = abs(integral - deficit_left)
            assert residual <= 2e-8 * max(1.0, abs(deficit_left)), (
                p, integral, deficit_left, residual
            )
            max_integral_residual = max(max_integral_residual, residual)

    alpha = 0.75
    y = 50_000.0
    z = 200_000.0
    next_z = primes[bisect_right(primes, z)]
    terminal_records = [r for r in records if y < r[0] <= next_z]
    constant = max(m / (p ** alpha) for p, m, _ in terminal_records)
    x0 = (2.0 * constant * alpha / c) ** (1.0 / (1.0 - alpha))
    assert y >= x0
    slope_lower = c - constant * alpha * y ** (alpha - 1.0)
    assert slope_lower >= c / 2.0
    for p, terminal_max, deficit_left in terminal_records:
        assert terminal_max <= constant * p ** alpha + 2e-12
        assert deficit_left <= constant * p ** alpha + 3e-9

    def deficit(x: float) -> float:
        lo = bisect_right(primes, x / 2.0)
        hi = bisect_right(primes, x)
        shell = (
            2.0 * (prefix_log[hi] - prefix_log[lo])
            - x * (prefix_harm[hi] - prefix_harm[lo])
        )
        return c * x - shell

    sample_count = 20_001
    worst_sample_slack = math.inf
    for k in range(sample_count):
        x = y + (z - y) * k / (sample_count - 1)
        slack = constant * x ** alpha - deficit(x)
        assert slack >= -2e-8, (x, slack)
        worst_sample_slack = min(worst_sample_slack, slack)

    print(f"PIN: {PIN}")
    print(f"PASS: {len(records)} prime-terminal finite maxima")
    print(f"PASS: {sample_count} real-x transfer samples")
    print(f"minimum terminal-max minus deficit margin = {min_margin:.12g}")
    print(f"maximum layer-cake residual = {max_integral_residual:.12g}")
    print(f"finite audit alpha = {alpha}")
    print(f"finite audit C = {constant:.12g}")
    print(f"monotonicity threshold X0 = {x0:.12g} (< Y={y:.0f})")
    print(f"minimum certified inter-prime slope = {slope_lower:.12g}")
    print(f"minimum sampled shell slack = {worst_sample_slack:.12g}")
    print("LIMIT: finite implementation audit only; terminal criterion is unproved asymptotically")


if __name__ == "__main__":
    main()
