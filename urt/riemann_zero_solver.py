"""
Riemann ζ Zero Solver — Hardy Z-function bracket refinement.

The existing `urt.prime_spectral` *matches* the first three G_{13}
Laplacian eigenvalues to the first three Riemann zeros at ~0.001-0.7 %
error.  It does NOT compute the Riemann zeros — those values were
hard-coded.

This module fills that gap: given a search range, it returns the
imaginary parts of the non-trivial zeros of ζ(½ + it) by bracketing
sign changes of the Hardy Z-function and refining via bisection in
mpmath at arbitrary precision.

Used directly by:
  - `urt.prime_spectral` — verification of κ = t₁ / D scaling against
    *computed* zero positions (no longer hard-coded).
  - `urt.riemann_weil`   — cross-checks of the Cathedral spectrum
    against the actual location of ζ zeros.

The first 10 zeros (PDG, 8-digit precision) are:
   t_1  = 14.13472514
   t_2  = 21.02203964
   t_3  = 25.01085758
   t_4  = 30.42487613
   t_5  = 32.93506159
   t_6  = 37.58617816
   t_7  = 40.91871901
   t_8  = 43.32707328
   t_9  = 48.00515088
   t_10 = 49.77383248

CI gate: compute the first 5 zeros at dps=30 precision and verify they
match the canonical values to better than 1e-8.
"""
from __future__ import annotations

from typing import List, Tuple

try:
    import mpmath as mp
except ImportError as exc:  # pragma: no cover
    raise ImportError(
        "urt.riemann_zero_solver requires mpmath.  "
        "Install with: pip install mpmath"
    ) from exc


# ── Canonical first 10 zero imaginary parts (for CI cross-check) ──────────

CANONICAL_ZEROS_FIRST_10: List[float] = [
    14.13472514173469,
    21.02203963877155,
    25.01085758014568,
    30.42487612585951,
    32.93506158773918,
    37.58617815882567,
    40.91871901214749,
    43.32707328091499,
    48.00515088116715,
    49.77383247767230,
]


def _setup(digits: int = 30) -> None:
    mp.mp.dps = digits


def hardy_Z(t):
    """
    Hardy Z(t) = ζ(½ + it) · exp(i·θ(t)) — real-valued on the critical
    line; sign changes ↔ zeros of ζ.
    """
    s = mp.mpc(mp.mpf(1) / 2, t)
    theta = mp.arg(mp.gamma(mp.mpf(1) / 4 + mp.mpc(0, 1) * t / 2)) \
            - t / 2 * mp.log(mp.pi)
    return mp.re(mp.zeta(s) * mp.exp(mp.mpc(0, 1) * theta))


def find_sign_change(t_lo, t_hi, n_samples: int = 64) -> List[Tuple]:
    """Return list of (a, b) bracketing intervals where Z(t) changes sign."""
    ts = [t_lo + (t_hi - t_lo) * i / n_samples for i in range(n_samples + 1)]
    zs = [hardy_Z(t) for t in ts]
    brackets: List[Tuple] = []
    for i in range(n_samples):
        if zs[i] == 0:
            brackets.append((ts[i], ts[i]))
        elif zs[i] * zs[i + 1] < 0:
            brackets.append((ts[i], ts[i + 1]))
    return brackets


def refine_zero(a, b, tol=mp.mpf("1e-20"), max_iter: int = 200):
    """Bisection refinement of a Hardy-Z sign-change interval."""
    f_a = hardy_Z(a)
    for _ in range(max_iter):
        mid = (a + b) / 2
        f_mid = hardy_Z(mid)
        if abs(b - a) < tol or f_mid == 0:
            return mid
        if f_a * f_mid < 0:
            b = mid
        else:
            a = mid
            f_a = f_mid
    return (a + b) / 2


def first_n_zeros(n: int, digits: int = 30,
                  t_start: float = 0.5, t_max: float = 100.0) -> List:
    """
    Return the imaginary parts of the first `n` non-trivial Riemann zeros
    at `digits` decimal precision.
    """
    _setup(digits)
    zeros: List = []
    t = mp.mpf(t_start)
    step = mp.mpf("4.0")
    while len(zeros) < n and t < mp.mpf(t_max):
        brackets = find_sign_change(t, t + step, n_samples=32)
        for a, b in brackets:
            z = refine_zero(a, b)
            if not zeros or z - zeros[-1] > mp.mpf("0.1"):
                zeros.append(z)
            if len(zeros) >= n:
                break
        t += step
    return zeros[:n]


# ── Audit ─────────────────────────────────────────────────────────────────

def riemann_zero_audit_passes(n: int = 5, tol: float = 1e-8) -> bool:
    """
    CI gate: compute the first `n` Riemann zeros and verify they match
    canonical values to within `tol`.
    """
    zs = first_n_zeros(n)
    for computed, canonical in zip(zs, CANONICAL_ZEROS_FIRST_10[:n]):
        if abs(float(computed) - canonical) > tol:
            return False
    return True


# ── Report ────────────────────────────────────────────────────────────────

def print_riemann_zero_report(n: int = 5):
    print("=" * 64)
    print(f"Riemann ζ zeros — Hardy Z bracket refinement (first {n})")
    print("=" * 64)
    print(f"  {'k':>3}  {'t_k (computed)':>25}  {'t_k (canonical)':>20}  err")
    print("-" * 64)
    zs = first_n_zeros(n)
    for k, (z, c) in enumerate(zip(zs, CANONICAL_ZEROS_FIRST_10[:n]), 1):
        err = abs(float(z) - c)
        print(f"  {k:>3}  {mp.nstr(z, 20):>25}  {c:>20.10f}  {err:.2e}")
    print("=" * 64)
    print(f"  audit passes: {riemann_zero_audit_passes(n=n)}")
    print("=" * 64)


if __name__ == "__main__":
    print_riemann_zero_report(5)
