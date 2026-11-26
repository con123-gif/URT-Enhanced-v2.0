#!/usr/bin/env python3
"""Finite audit of the positive mean-square terminal criterion; not RH evidence."""

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
LIMIT = 80_000
Y = 50_000.0
Z = 60_000.0
ALPHA = 0.75


def primes_up_to(n: int) -> list[int]:
    sieve = bytearray(b"\x01") * (n + 1)
    sieve[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if sieve[p]:
            sieve[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i, flag in enumerate(sieve) if flag]


def positive_square_piece(p: float, a: float, b: float, level: float) -> float:
    """Integral_a^b p/t^2 * max(level-t,0)^2 dt."""
    upper = min(b, level)
    if upper <= a:
        return 0.0
    value = p * (
        level * level * (1.0 / a - 1.0 / upper)
        - 2.0 * level * math.log(upper / a)
        + (upper - a)
    )
    # Cancellation near a zero crossing may leave a tiny negative float.
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

    primes = primes_up_to(LIMIT)
    logs = [math.log(p) for p in primes]
    prefix_log = [0.0]
    prefix_harm = [0.0]
    for p, lp in zip(primes, logs):
        prefix_log.append(prefix_log[-1] + lp)
        prefix_harm.append(prefix_harm[-1] + lp / p)

    c = 1.0 - math.log(2.0)
    next_z = primes[bisect_right(primes, Z)]
    terminal_indices = [
        i for i, p in enumerate(primes) if Y < p <= next_z
    ]
    records: list[tuple[int, float, float, float]] = []
    max_signed_residual = 0.0
    min_cauchy_margin = math.inf

    for i in terminal_indices:
        p = primes[i]
        left = bisect_right(primes, p / 2.0)
        e_terminal_left = prefix_log[i] - p

        a = p / 2.0
        theta = prefix_log[left]
        positive_square_pieces = []
        signed_pieces = []
        maximum = max(0.0, theta - a - e_terminal_left)
        for j in range(left, i):
            b = float(primes[j])
            level = theta - e_terminal_left
            positive_square_pieces.append(
                positive_square_piece(float(p), a, b, level)
            )
            signed_pieces.append(
                p * (level * (1.0 / a - 1.0 / b) - math.log(b / a))
            )
            theta += logs[j]
            a = b
            maximum = max(maximum, theta - a - e_terminal_left)

        level = theta - e_terminal_left
        positive_square_pieces.append(
            positive_square_piece(float(p), a, float(p), level)
        )
        signed_pieces.append(
            p * (level * (1.0 / a - 1.0 / p) - math.log(p / a))
        )
        positive_variance = math.fsum(positive_square_pieces)
        signed_integral = math.fsum(signed_pieces)

        sum_log = prefix_log[i] - prefix_log[left]
        sum_harm = prefix_harm[i] - prefix_harm[left]
        shell_left = 2.0 * sum_log - p * sum_harm
        deficit_left = c * p - shell_left
        residual = abs(signed_integral - deficit_left)
        assert residual <= 3e-8 * max(1.0, abs(deficit_left)), (
            p, signed_integral, deficit_left, residual
        )
        max_signed_residual = max(max_signed_residual, residual)

        rms_positive = math.sqrt(positive_variance)
        assert deficit_left <= rms_positive + 3e-8, (
            p, deficit_left, rms_positive
        )
        assert rms_positive <= maximum + 3e-8, (p, rms_positive, maximum)
        min_cauchy_margin = min(min_cauchy_margin, rms_positive - deficit_left)
        records.append((p, deficit_left, rms_positive, maximum))

    c_rms = max(rms / p ** ALPHA for p, _, rms, _ in records)
    c_max = max(maximum / p ** ALPHA for p, _, _, maximum in records)
    assert c_rms <= c_max + 1e-12
    x0 = (2.0 * c_rms * ALPHA / c) ** (1.0 / (1.0 - ALPHA))
    assert Y >= x0
    slope_lower = c - c_rms * ALPHA * Y ** (ALPHA - 1.0)
    assert slope_lower >= c / 2.0

    def deficit(x: float) -> float:
        lo = bisect_right(primes, x / 2.0)
        hi = bisect_right(primes, x)
        shell = (
            2.0 * (prefix_log[hi] - prefix_log[lo])
            - x * (prefix_harm[hi] - prefix_harm[lo])
        )
        return c * x - shell

    sample_count = 20_001
    min_shell_slack = math.inf
    for k in range(sample_count):
        x = Y + (Z - Y) * k / (sample_count - 1)
        slack = c_rms * x ** ALPHA - deficit(x)
        assert slack >= -4e-8, (x, slack)
        min_shell_slack = min(min_shell_slack, slack)

    print(f"PIN: {PIN}")
    print(f"PASS: {len(records)} complete prime-terminal positive-L2 checks")
    print(f"PASS: {sample_count} real-x transfer samples")
    print(f"maximum signed layer-cake residual = {max_signed_residual:.12g}")
    print(f"minimum positive-L2 minus deficit margin = {min_cauchy_margin:.12g}")
    print(f"finite audit C_L2 = {c_rms:.12g}")
    print(f"finite audit C_max = {c_max:.12g}")
    print(f"C_L2/C_max = {c_rms / c_max:.12g}")
    print(f"monotonicity threshold X0 = {x0:.12g} (< Y={Y:.0f})")
    print(f"minimum certified inter-prime slope = {slope_lower:.12g}")
    print(f"minimum sampled shell slack = {min_shell_slack:.12g}")
    print("LIMIT: finite formula audit only; no asymptotic positive-L2 theorem proved")


if __name__ == "__main__":
    main()
