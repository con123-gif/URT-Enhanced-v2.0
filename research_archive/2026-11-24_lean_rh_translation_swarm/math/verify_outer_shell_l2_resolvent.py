#!/usr/bin/env python3
"""Finite regression for the outer-shell weighted L2 resolvent theorem.

The report contains the analytic proof.  These deterministic checks validate
the prime identity, multiplier formula, norm constants and boundary control;
they do not establish an asymptotic prime estimate or RH.
"""

from bisect import bisect_right
import cmath
import math


LIMIT = 200_000
LOG2 = math.log(2.0)
C = 1.0 - LOG2


def sieve(n: int) -> list[int]:
    s = bytearray(b"\x01") * (n + 1)
    s[:2] = b"\x00\x00"
    for p in range(2, math.isqrt(n) + 1):
        if s[p]:
            s[p * p : n + 1 : p] = b"\x00" * (((n - p * p) // p) + 1)
    return [i for i in range(2, n + 1) if s[i]]


PRIMES = sieve(LIMIT)
LOGS = [math.log(p) for p in PRIMES]
THETA_PREFIX = [0.0]
HARM_PREFIX = [0.0]
for p, lp in zip(PRIMES, LOGS):
    THETA_PREFIX.append(THETA_PREFIX[-1] + lp)
    HARM_PREFIX.append(HARM_PREFIX[-1] + lp / p)


def theta(x: float) -> float:
    return THETA_PREFIX[bisect_right(PRIMES, x)]


def deficit(x: float) -> float:
    i = bisect_right(PRIMES, x / 2.0)
    j = bisect_right(PRIMES, x)
    w = 2.0 * (THETA_PREFIX[j] - THETA_PREFIX[i])
    w -= x * (HARM_PREFIX[j] - HARM_PREFIX[i])
    return C * x - w


def integrated_error(x: float) -> float:
    """Exact-on-prime-pieces float evaluation of integral E(t)/t^2 dt."""
    lo = x / 2.0
    hi = x
    events = [lo]
    i = bisect_right(PRIMES, lo)
    j = bisect_right(PRIMES, hi)
    events.extend(float(p) for p in PRIMES[i:j])
    events.append(hi)
    total = 0.0
    for a, b in zip(events, events[1:]):
        if b <= a:
            continue
        mid = (a + b) / 2.0
        th = theta(mid)
        # E(t)=theta(mid)-t on this open interval.
        total += th * (1.0 / a - 1.0 / b) - math.log(b / a)
    return total


def q(alpha: float) -> float:
    return (2.0 ** (1.0 - alpha) - 1.0) / (1.0 - alpha)


def multiplier(alpha: float, xi: float) -> complex:
    z = (1.0 - alpha) - 1j * xi
    return -1.0 + (cmath.exp(z * LOG2) - 1.0) / z


def midpoint_kernel_multiplier(alpha: float, xi: float, n: int = 200_000) -> complex:
    ds = LOG2 / n
    return -1.0 + math.fsum(
        (cmath.exp(((1.0 - alpha) - 1j * xi) * ((k + 0.5) * ds)) * ds).real
        for k in range(n)
    ) + 1j * math.fsum(
        (cmath.exp(((1.0 - alpha) - 1j * xi) * ((k + 0.5) * ds)) * ds).imag
        for k in range(n)
    )


def l2(values: list[float], du: float) -> float:
    return math.sqrt(math.fsum(v * v for v in values) * du)


def discrete_operator(alpha: float, f: list[float], du: float) -> list[float]:
    """Causal midpoint convolution on an equally spaced compact grid."""
    steps = int(round(LOG2 / du))
    out = []
    for i, value in enumerate(f):
        conv = 0.0
        for j in range(steps):
            k = i - j
            if k < 0:
                break
            s = (j + 0.5) * du
            conv += math.exp((1.0 - alpha) * s) * f[k] * du
        out.append(-value + conv)
    return out


def main() -> None:
    # Exact prime-shell identity (1), with only floating logarithm roundoff.
    xs = [2.0, 2.9, 3.0, 37.0, 101.5, 1_000.25, 10_003.75, 199_999.0]
    identity_residual = 0.0
    for x in xs:
        rhs = -(theta(x) - x) + x * integrated_error(x)
        identity_residual = max(identity_residual, abs(deficit(x) - rhs))
    assert identity_residual < 3e-9, identity_residual

    # Multiplier equation and its uniform lower bound.
    multiplier_checks = 0
    quadrature_residual = 0.0
    min_margin = math.inf
    for alpha in (0.51, 0.60, 0.75, 0.90, 0.99):
        qa = q(alpha)
        assert 0.0 < qa < 1.0
        assert abs(abs(multiplier(alpha, 0.0)) - (1.0 - qa)) < 2e-15
        for xi in (0.0, 0.01, 0.1, 1.0, 3.0, 10.0, 50.0):
            m = multiplier(alpha, xi)
            mq = midpoint_kernel_multiplier(alpha, xi, 100_000)
            quadrature_residual = max(quadrature_residual, abs(m - mq))
            margin = abs(m) - (1.0 - qa)
            assert margin >= -3e-13, (alpha, xi, margin)
            min_margin = min(min_margin, margin)
            multiplier_checks += 1
    assert quadrature_residual < 2e-9, quadrature_residual

    # Deterministic compact packets.  The discretization converges to (5).
    du = LOG2 / 256.0
    n = 4096
    us = [(i + 0.5) * du for i in range(n)]
    norm_checks = 0
    min_norm_slack = math.inf
    for alpha in (0.55, 0.70, 0.90):
        qa = q(alpha)
        packets = [
            [math.exp(-((u - 4.0) / 0.8) ** 2) for u in us],
            [math.exp(-((u - 5.0) / 1.3) ** 2) * math.cos(3.0 * u) for u in us],
            [math.exp(-((u - 6.0) / 1.7) ** 4) * math.sin(9.0 * u) for u in us],
        ]
        for f in packets:
            h = discrete_operator(alpha, f, du)
            nf = l2(f, du)
            nh = l2(h, du)
            # Allow the first-order midpoint discretization error explicitly.
            lower_slack = nh - (1.0 - qa) * nf
            upper_slack = (1.0 + qa) * nf - nh
            assert lower_slack > -2e-3 and upper_slack > -2e-3
            min_norm_slack = min(min_norm_slack, lower_slack, upper_slack)
            norm_checks += 1

    # Local collar inequalities (7),(8) on the same packets.
    local_checks = 0
    min_local_slack = math.inf
    alpha = 0.7
    qa = q(alpha)
    f = [math.exp(-((u - 4.0) / 1.2) ** 2) * (1.0 + 0.2 * math.cos(5 * u)) for u in us]
    h = discrete_operator(alpha, f, du)
    shell_steps = int(round(LOG2 / du))
    for start in (768, 1024, 1280, 1536):
        stop = start + 1024
        nf_i = l2(f[start:stop], du)
        nh_i = l2(h[start:stop], du)
        nf_b = l2(f[start - shell_steps : start], du)
        lower_slack = nh_i + qa * nf_b - (1.0 - qa) * nf_i
        upper_slack = (1.0 + qa) * nf_i + qa * nf_b - nh_i
        assert lower_slack > -3e-3 and upper_slack > -3e-3
        min_local_slack = min(min_local_slack, lower_slack, upper_slack)
        local_checks += 2

    # Negative control: collar-only input has zero norm in I but nonzero h in I.
    f = [0.0] * n
    start = 1536
    stop = start + 512
    for i in range(start - shell_steps, start):
        f[i] = 1.0
    h = discrete_operator(alpha, f, du)
    assert l2(f[start:stop], du) == 0.0
    collar_leak = l2(h[start:stop], du)
    assert collar_leak > 0.05

    print(
        "outer-shell L2 resolvent: OK; "
        f"primes={len(PRIMES)}, identity_checks={len(xs)}, "
        f"identity_residual={identity_residual:.3e}, "
        f"multiplier_checks={multiplier_checks}, "
        f"quadrature_residual={quadrature_residual:.3e}, "
        f"min_multiplier_margin={min_margin:.3e}, norm_checks={norm_checks}, "
        f"min_norm_slack={min_norm_slack:.3e}, local_checks={local_checks}, "
        f"min_local_slack={min_local_slack:.3e}, collar_leak={collar_leak:.6f}"
    )


if __name__ == "__main__":
    main()
