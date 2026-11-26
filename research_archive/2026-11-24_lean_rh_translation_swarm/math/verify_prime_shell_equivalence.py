#!/usr/bin/env python3
"""Pinned-source and real-prime regression for the dyadic shell identity.

Finite computation checks implementation/algebra only.  The general bounds
are proved in the companion mathematical note; this is not evidence for RH.
"""

from pathlib import Path
import math
import subprocess


PIN = "40e56bab026552e089d7afcfeff08d2defb9c005"
N = 50_000


def prefix(values):
    out = [0.0]
    for value in values[1:]:
        out.append(out[-1] + value)
    return out


def shell(sum_prefix, harmonic_prefix, x):
    hi = math.floor(x)
    lo = math.floor(x / 2)
    return 2 * (sum_prefix[hi] - sum_prefix[lo]) - x * (
        harmonic_prefix[hi] - harmonic_prefix[lo]
    )


def main() -> None:
    root = Path(__file__).resolve().parents[3]
    upstream = root.parent / "rh_upstream"
    actual = subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=upstream, text=True
    ).strip()
    assert actual == PIN, (actual, PIN)

    prime = bytearray(b"\x01") * (N + 1)
    prime[0:2] = b"\x00\x00"
    for p in range(2, math.isqrt(N) + 1):
        if prime[p]:
            prime[p * p : N + 1 : p] = b"\x00" * (((N - p * p) // p) + 1)

    lam_prime = [0.0] * (N + 1)
    lam_higher = [0.0] * (N + 1)
    for p in range(2, N + 1):
        if not prime[p]:
            continue
        lp = math.log(p)
        lam_prime[p] = lp
        q = p * p
        while q <= N:
            lam_higher[q] = lp
            if q > N // p:
                break
            q *= p

    ones = [0.0] + [1.0] * N
    total = [lam_prime[i] + lam_higher[i] for i in range(N + 1)]
    pref_p, pref_q, pref_l, pref_1 = map(
        prefix, (lam_prime, lam_higher, total, ones)
    )
    hp_p = prefix([0.0] + [lam_prime[i] / i for i in range(1, N + 1)])
    hp_q = prefix([0.0] + [lam_higher[i] / i for i in range(1, N + 1)])
    hp_l = prefix([0.0] + [total[i] / i for i in range(1, N + 1)])
    hp_1 = prefix([0.0] + [1.0 / i for i in range(1, N + 1)])

    c = 1 - math.log(2)
    max_base = 0.0
    max_identity = 0.0
    max_ratio = 0.0
    samples = 0
    for k in range(2, N + 1):
        for frac in (0.0, 0.25, 0.5, 0.75):
            x = k + frac
            if x > N:
                continue
            P = shell(pref_p, hp_p, x)
            Q = shell(pref_q, hp_q, x)
            S = shell(pref_1, hp_1, x)
            B = shell(pref_l, hp_l, x) - S
            max_base = max(max_base, abs(S - c * x))
            max_identity = max(max_identity, abs(B - (P + Q - S)))
            assert Q >= -1e-10
            bound = math.sqrt(x) * math.log(x)
            assert Q <= bound + 1e-9
            max_ratio = max(max_ratio, Q / bound)
            samples += 1

    assert max_base < 1.0
    assert max_identity < 1e-8
    print(f"PIN: {PIN}")
    print(f"PASS: {samples} actual-prime real-x shell checks through {N}")
    print(f"max |S0-(1-log2)x| = {max_base:.12g} (< 1)")
    print(f"max decomposition residual = {max_identity:.12g}")
    print(f"max Q/(sqrt(x) log x) = {max_ratio:.12g} (<= 1)")
    print("LIMIT: finite regression; general proof is the companion derivation")


if __name__ == "__main__":
    main()

