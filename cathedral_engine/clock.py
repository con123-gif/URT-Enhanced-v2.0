"""Clock Fourier analysis: the sigma_1 history clock (Q69/Q83) and the native 24-track clock (2026-11-07).

sigma_1 clock.  P[i, sigma(i)] = 1, so (P v)[i] = v[sigma(i)].  sigma_1 has cycles 4 + 5 x 12, hence P^12 = I and
only even 24-clock modes k = 2m occur (multiplicities 6 for k = 0, 6, 12, 18 and 5 otherwise).  Mode energies
of a real vector y come from its autocorrelation a_t = <y, P^t y>:

    E_k(y) = (1/N) sum_{t<N} cos(2 pi k t / 24) a_t        (N = order of P, here 12; k even),

and E_k = E_{-k}.  Mode classes closed under k -> -k have projectors Pi_K = (1/N) sum_t c_K(t) P^t with
c_K(t) = sum_{k in K} cos(2 pi k t/24); ``mode_class_projector`` returns them exactly and reports whether they
are rational.  These are clock Fourier modes; they are *not* the A5 quartet branch weights (4,2,2,0) of Q82.

Native 24-track clock.  The 2026-11-07 action uses the charge-q Wilson Laplacian on Z_24 with uniform link
phase theta = 2 pi / phi^2.  Its eigenvectors are the 24 plane waves (exact, theta-independent); its
eigenvalues 2 - 2 cos(2 pi m/24 + q theta) involve the transcendental phase and are returned in floating point
only, labelled as such.
"""
from __future__ import annotations

from fractions import Fraction
from math import cos, pi, sqrt

from .fields import RadicalTower, TE
from .linalg import perm_compose, perm_cycles, perm_power

__all__ = ["perm_order", "cos_2pi_over_24", "autocorrelation", "mode_energies", "mode_class_projector",
           "native_clock_spectrum", "clock_multiplicities"]


def perm_order(perm) -> int:
    from math import lcm
    o = 1
    for c in perm_cycles(perm):
        o = lcm(o, len(c))
    return o


def cos_2pi_over_24(j: int, tower: RadicalTower | None = None):
    """Exact cos(2 pi j / 24): a Fraction when rational, else an element of ``tower`` (sqrt2, sqrt3 adjoined)."""
    j %= 24
    sign = 1
    if j > 12:
        j = 24 - j
    if j > 6:
        j, sign = 12 - j, -1
    if j == 5:
        # cos(75deg) = (sqrt6 - sqrt2)/4
        if tower is None:
            raise ValueError("irrational cosine needs a tower")
        s2, s3 = tower.sqrt(2, "sqrt2"), tower.sqrt(3, "sqrt3")
        return sign * (s2 * s3 - s2) / 4
    if j == 1:
        if tower is None:
            raise ValueError("irrational cosine needs a tower")
        s2, s3 = tower.sqrt(2, "sqrt2"), tower.sqrt(3, "sqrt3")
        return sign * (s2 * s3 + s2) / 4
    if j == 3:
        if tower is None:
            raise ValueError("irrational cosine needs a tower")
        return sign * tower.sqrt(2, "sqrt2") / 2
    if j == 2:
        if tower is None:
            raise ValueError("irrational cosine needs a tower")
        return sign * tower.sqrt(3, "sqrt3") / 2
    vals = {0: Fraction(1), 4: Fraction(1, 2), 6: Fraction(0)}
    return sign * vals[j]


def autocorrelation(y, perm, n: int | None = None):
    """a_t = <y, P^t y>, t = 0..n-1 (exact in the field of y)."""
    n = perm_order(perm) if n is None else n
    out, cur = [], list(range(len(perm)))
    for _ in range(n):
        s = y[0] * y[cur[0]]
        for i in range(1, len(y)):
            if y[i] and y[cur[i]]:
                s = s + y[i] * y[cur[i]]
        out.append(s)
        cur = perm_compose(cur, perm)          # P^{t+1}: index map composed with sigma
    return out


def mode_energies(y, perm, tower: RadicalTower | None = None) -> dict:
    """E_k for every 24-clock mode k (period of P must divide 24); exact; odd k vanish when P^12 = I."""
    n = perm_order(perm)
    assert 24 % n == 0, "clock period must divide 24"
    a = autocorrelation(y, perm, n)
    step = 24 // n
    out = {}
    for k in range(24):
        if k % step:
            out[k] = 0 * a[0]
            continue
        s = 0 * a[0]
        for t in range(n):
            c = cos_2pi_over_24(k * t, tower)
            if c:
                s = s + a[t] * c
        out[k] = s / n
    return out


def mode_class_projector(perm, K, tower: RadicalTower | None = None):
    """Pi_K = (1/n) sum_t c_K(t) P^t for a mode set K (24-clock labels, closed under negation).
    Returns (matrix as list of lists, rational?)."""
    K = set(k % 24 for k in K)
    assert all((-k) % 24 in K for k in K), "mode class must be closed under k -> -k"
    n = perm_order(perm)
    step = 24 // n
    dim = len(perm)
    own = tower is None
    if own:
        tower = RadicalTower(128)
    coeffs = []
    for t in range(n):
        c = Fraction(0)
        for k in K:
            if k % step:
                continue
            ck = cos_2pi_over_24(k * t, tower)
            c = c + ck
        coeffs.append(c / n)
    rational = all(isinstance(c, Fraction) or (isinstance(c, TE) and c.rational() is not None) for c in coeffs)
    if rational:
        coeffs = [c if isinstance(c, Fraction) else c.rational() for c in coeffs]
    elif own:
        raise ValueError(f"mode class {sorted(K)} has an irrational projector; pass a tower")
    Z = Fraction(0)
    Pm = [[Z] * dim for _ in range(dim)]
    for t, c in enumerate(coeffs):
        if not c:
            continue
        pt = perm_power(perm, t)
        for i in range(dim):
            Pm[i][pt[i]] = Pm[i][pt[i]] + c
    return Pm, rational


def clock_multiplicities(perm) -> dict:
    """Multiplicity of each 24-clock mode in the permutation's spectrum (from its cycle lengths)."""
    mult = {k: 0 for k in range(24)}
    for c in perm_cycles(perm):
        L = len(c)
        assert 24 % L == 0
        for j in range(L):
            mult[(24 // L) * j] += 1
    return mult


def native_clock_spectrum(charge: int, theta: float | None = None, n: int = 24) -> list:
    """FLOAT (transcendental phase): eigenvalues 2 - 2 cos(2 pi m/n + q theta) of the original clock_laplacian."""
    if theta is None:
        phi = (1 + sqrt(5)) / 2
        theta = 2 * pi / phi ** 2
    return [2 - 2 * cos(2 * pi * m / n + charge * theta) for m in range(n)]
