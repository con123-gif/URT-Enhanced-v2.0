#!/usr/bin/env python3
"""Executable countermodel: logarithmic gaps do not control the shell."""

from bisect import bisect_right
import math
from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
TERMS = 200_000


def main() -> None:
    repo = Path(__file__).resolve().parents[3]
    upstream = repo.parent / "rh_upstream"
    actual = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=upstream, text=True
    ).strip()
    assert actual == PIN, (actual, PIN)

    q = [16]
    gaps = []
    for _ in range(TERMS):
        current = q[-1]
        gap = math.floor(math.log(current)) + 3
        gaps.append(gap)
        q.append(current + gap)

    logs = [math.log(v) for v in q]
    prefix_log = [0.0]
    prefix_harmonic = [0.0]
    for value, lv in zip(q, logs):
        prefix_log.append(prefix_log[-1] + lv)
        prefix_harmonic.append(prefix_harmonic[-1] + lv / value)

    min_drift = math.inf
    max_gap_ratio = 0.0
    max_growth_ratio = 0.0
    for n, gap in enumerate(gaps):
        current = q[n]
        nxt = q[n + 1]
        assert gap <= 3.0 * math.log(current) + 1e-12
        assert gap <= current / 2.0
        drift = gap - math.log(nxt)
        assert drift >= 1.5 - 1e-12
        min_drift = min(min_drift, drift)
        max_gap_ratio = max(max_gap_ratio, gap / math.log(current))

    for n, value in enumerate(q):
        envelope = 16.0 * (n + 2) * math.log(16.0 * (n + 2))
        assert value <= envelope + 1e-9
        max_growth_ratio = max(max_growth_ratio, value / envelope)

    c = 1.0 - math.log(2.0)
    min_shell_slack = math.inf
    checked_shells = 0
    max_normalized_deficit = 0.0
    # Check a dense tail plus logarithmically spread earlier points.
    indices = set(range(100, len(q), 997))
    indices.update(range(max(100, len(q) - 10_000), len(q)))
    for n in sorted(indices):
        x = q[n]
        left = bisect_right(q, x / 2.0)
        right = n + 1
        sum_log = prefix_log[right] - prefix_log[left]
        sum_harmonic = prefix_harmonic[right] - prefix_harmonic[left]
        shell = 2.0 * sum_log - x * sum_harmonic
        deficit = c * x - shell
        lower = x / (12.0 * math.log(x)) - (7.0 / 3.0) * math.log(x)
        slack = deficit - lower
        assert slack >= -2e-8, (n, x, deficit, lower, slack)
        min_shell_slack = min(min_shell_slack, slack)
        max_normalized_deficit = max(
            max_normalized_deficit, deficit * math.log(x) / x
        )
        checked_shells += 1

    # The lower bound eventually dominates C*x^alpha for every alpha<1.
    alpha = 0.75
    ratios = []
    for n in range(len(q) - 10_000, len(q), 1000):
        x = q[n]
        lower = x / (12.0 * math.log(x)) - (7.0 / 3.0) * math.log(x)
        ratios.append(lower / x**alpha)
    assert all(a < b for a, b in zip(ratios, ratios[1:]))

    print(f"PIN: {PIN}")
    print(f"PASS: {len(gaps)} logarithmic-gap recurrence checks")
    print(f"last support point = {q[-1]}")
    print(f"minimum one-step error drift = {min_drift:.12g} (>= 1.5)")
    print(f"maximum gap/log(q) = {max_gap_ratio:.12g} (<= 3)")
    print(f"maximum q_n/envelope = {max_growth_ratio:.12g} (<= 1)")
    print(f"PASS: {checked_shells} exact weighted-shell checks")
    print(f"minimum shell lower-bound slack = {min_shell_slack:.12g}")
    print(
        "largest deficit*log(x)/x in checked shells = "
        f"{max_normalized_deficit:.12g}"
    )
    print(
        "alpha=0.75 lower-bound ratio increased from "
        f"{ratios[0]:.12g} to {ratios[-1]:.12g}"
    )
    print("LIMIT: countermodel to gap-only inference; not a model of primes")


if __name__ == "__main__":
    main()
