#!/usr/bin/env python3
"""Check of the attached phase formula delta = 2/9 - (Delta)^2/36  (18 Oct 2026). NumPy + SciPy only."""
import itertools
import numpy as np
from scipy.optimize import brentq

pi, r2 = np.pi, np.sqrt(2)
phi = (1 + 5 ** 0.5) / 2
me, rmu, drmu = 0.51099895069, 206.7682827, 4.6e-6


def sq(d):
    return np.array([1 + r2 * np.cos(d + 2 * pi * k / 3) for k in range(3)])


def mu_e(d):
    s = sq(d)
    return (s[2] / s[1]) ** 2


ds = brentq(lambda d: mu_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: mu_e(d) - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)
D_exact = 3 / 20 - 80 * pi / (1053 * phi)                 # the framework's Delta = delta_cl - delta_star
print(f"target  delta* = {ds:.12f} +- {sds:.2e}   (needs 2/9 - delta* = {2/9-ds:.4e})")
print(f"framework Delta = 3/20 - 80pi/(1053 phi) = {D_exact:.10f}   (attachment uses 0.0025)")
for lab, D in [("attachment, Delta rounded to 0.0025", 0.0025), ("framework's exact Delta", D_exact)]:
    d = 2 / 9 - D ** 2 / 36
    z = (d - ds) / sds
    print(f"   {lab:38s} delta = {d:.12f}  off {d-ds:+.3e} rad = {z:+.1f} sigma;"
          f"  m_mu/m_e = {mu_e(d):.7f} ({(mu_e(d)-rmu)/drmu:+.1f} sigma)")
print("   the attachment's '7e-9 precision' is the relative size of the miss; the measurement allows 1.8e-9")

# what divisor would actually be needed, and how many simple divisors land in the 3-sigma window
for lab, D in [("0.0025", 0.0025), ("exact", D_exact)]:
    need = D ** 2 / (2 / 9 - ds)
    win = need * 3 * sds / (2 / 9 - ds)
    cands = sorted({a * b for a, b in itertools.product([1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 13, 20, 30], repeat=2)})
    hit = [c for c in cands if abs(c - need) < win]
    print(f"   Delta = {lab}: needed divisor {need:.3f} +- {win:.3f} (3 sigma); 36 is {(36-need)/win*3:+.1f} sigma;"
          f" products of Cathedral integers in window: {hit}")

# the 2/9 itself: a label count in a gauge structure, and what a holonomy would actually give
m = np.arange(9)
counts = np.bincount(m % 5, minlength=5)
print(f"Z5 channel multiplicities of the 9 exhaust labels: {counts.tolist()}  -> weights {counts/9}")
print("   phi_k multiplies whole rows: shown last turn that it changes no spectrum (1e-12), so this count is not dynamical")
w = 2 / 9
for lab, d in [("phase = w (radians), as asserted", w), ("Peierls/holonomy phase 2 pi w", 2 * pi * w)]:
    dd = d % (2 * pi / 3)
    dd = min(dd, 2 * pi / 3 - dd)
    print(f"   {lab:38s} delta = {d:.6f} -> folded {dd:.6f}  ({'on' if dd < pi/12 else 'off'} the physical arc)")
