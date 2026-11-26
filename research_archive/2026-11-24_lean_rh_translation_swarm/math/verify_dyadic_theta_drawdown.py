#!/usr/bin/env python3
"""Actual-prime regression for the dyadic theta-drawdown identity.

Finite computation checks implementation and endpoint conventions only.  It
does not prove the asymptotic drawdown bound or RH.
"""

from bisect import bisect_left, bisect_right
import math
from pathlib import Path
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
N = 200_000


def prefix(values):
    out = [0.0]
    for value in values:
        out.append(out[-1] + value)
    return out


class RangeMax:
    def __init__(self, values):
        size = 1
        while size < len(values):
            size *= 2
        self.size = size
        self.data = [-math.inf] * (2 * size)
        self.data[size : size + len(values)] = values
        for i in range(size - 1, 0, -1):
            self.data[i] = max(self.data[2 * i], self.data[2 * i + 1])

    def query(self, left, right):
        """Maximum on the half-open index interval [left,right)."""
        if left >= right:
            return -math.inf
        left += self.size
        right += self.size
        ans = -math.inf
        while left < right:
            if left & 1:
                ans = max(ans, self.data[left])
                left += 1
            if right & 1:
                right -= 1
                ans = max(ans, self.data[right])
            left //= 2
            right //= 2
        return ans


def main() -> None:
    repo = Path(__file__).resolve().parents[3]
    upstream = repo.parent / "rh_upstream"
    actual = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=upstream, text=True
    ).strip()
    assert actual == PIN, (actual, PIN)

    is_prime = bytearray(b"\x01") * (N + 1)
    is_prime[0:2] = b"\x00\x00"
    for p in range(2, math.isqrt(N) + 1):
        if is_prime[p]:
            is_prime[p * p : N + 1 : p] = b"\x00" * (
                ((N - p * p) // p) + 1
            )
    primes = [p for p in range(2, N + 1) if is_prime[p]]
    logs = [math.log(p) for p in primes]
    theta_prefix = prefix(logs)
    harmonic_prefix = prefix(lp / p for p, lp in zip(primes, logs))

    # At a prime p, theta is right-continuous and includes log p.
    prime_error = [theta_prefix[i + 1] - p for i, p in enumerate(primes)]
    range_max = RangeMax(prime_error)
    c = 1.0 - math.log(2.0)

    def theta_and_harmonic(u):
        k = bisect_right(primes, u)
        return theta_prefix[k], harmonic_prefix[k]

    def shell_data(x):
        a = x / 2.0
        ia = bisect_right(primes, a)
        ix = bisect_right(primes, x)
        theta_a = theta_prefix[ia]
        theta_x = theta_prefix[ix]
        harmonic_a = harmonic_prefix[ia]
        harmonic_x = harmonic_prefix[ix]
        prime_shell = 2.0 * (theta_x - theta_a) - x * (
            harmonic_x - harmonic_a
        )
        shell_deficit = c * x - prime_shell

        error_x = theta_x - x
        error_a = theta_a - a
        left = bisect_left(primes, a)
        right = ix
        node_peak = range_max.query(left, right)
        max_drawdown = max(0.0, error_a - error_x, node_peak - error_x)
        return prime_shell, shell_deficit, max_drawdown, ia, ix

    samples = 0
    max_identity_residual = 0.0
    min_drawdown_slack = math.inf
    max_bruteforce_residual = 0.0
    for k in range(2, N + 1):
        # One real sample per integer keeps the regression bounded while
        # exercising both integer and noninteger endpoint conventions.
        x = k + (0.25 if k < N else 0.0)
        if x > N:
            continue
        prime_shell, deficit, drawdown, ia, ix = shell_data(x)

        # Independent direct summation of the layer-cake shell on a sparse
        # deterministic subsequence.
        if k % 997 == 0 or k < 100:
            direct = math.fsum(
                (2.0 - x / p) * math.log(p) for p in primes[ia:ix]
            )
            max_identity_residual = max(
                max_identity_residual, abs(prime_shell - direct)
            )

            # Dense event candidates independently check that the continuum
            # maximum is attained at x/2, a prime node, or x.
            theta_x, _ = theta_and_harmonic(x)
            error_x = theta_x - x
            candidates = [0.0]
            theta_a, _ = theta_and_harmonic(x / 2.0)
            candidates.append(theta_a - x / 2.0 - error_x)
            candidates.extend(
                theta_prefix[j + 1] - primes[j] - error_x
                for j in range(ia, ix)
            )
            brute = max(candidates)
            max_bruteforce_residual = max(
                max_bruteforce_residual, abs(brute - drawdown)
            )

        # Equation (3) averages E(t)-E(x) against a probability kernel;
        # hence its value cannot exceed the exact prime-node maximum.
        slack = drawdown - deficit
        min_drawdown_slack = min(min_drawdown_slack, slack)
        assert slack >= -2e-8, (x, deficit, drawdown, slack)
        samples += 1

    assert max_identity_residual < 1e-8
    assert max_bruteforce_residual < 1e-12

    # Logical strictness control: E(u)=u^beta is increasing, hence its
    # drawdown is zero, while E(u)/u^alpha grows without bound for beta>alpha.
    alpha = 0.6
    beta = 0.8
    xs = [10.0**j for j in range(1, 13)]
    assert all((x / 2.0) ** beta - x**beta <= 0.0 for x in xs)
    ratios = [x ** (beta - alpha) for x in xs]
    assert all(a < b for a, b in zip(ratios, ratios[1:]))

    print(f"PIN: {PIN}")
    print(f"PASS: {samples} actual-prime drawdown checks through {N}")
    print(f"max direct layer-cake residual = {max_identity_residual:.12g}")
    print(f"max prime-node maximum residual = {max_bruteforce_residual:.12g}")
    print(f"minimum (max drawdown - shell deficit) = {min_drawdown_slack:.12g}")
    print(
        "increasing-bias control: drawdown <= 0 while normalized error ratio "
        f"reaches {ratios[-1]:.12g}"
    )
    print("LIMIT: finite regression; the RH-scale drawdown bound remains open")


if __name__ == "__main__":
    main()
