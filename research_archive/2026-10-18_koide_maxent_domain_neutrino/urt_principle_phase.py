#!/usr/bin/env python3
"""URT principle (no repo): (1) logistic period-3 three-cycles as generation triples, whole window;
(2) URT 'edge-of-window' rule applied to the Koide phase window 0 < delta < pi/12."""
import numpy as np
from numpy.polynomial import Polynomial as P
from scipy.optimize import brentq
pi, r2 = np.pi, np.sqrt(2)
me, rmu, drmu, mt = 0.51099895069, 206.7682827, 4.6e-6, 1776.93
def sq(d): return np.array([1 + r2*np.cos(d + 2*pi*k/3) for k in range(3)])
def mu_e(d): s = sq(d); return (s[2]/s[1])**2
def Q(x): x = np.asarray(x, float); return (x**2).sum()/x.sum()**2
ds = brentq(lambda d: mu_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: mu_e(d) - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)

print("(1) logistic map x -> r x(1-x): every period-3 orbit in the period-3 window, points as sqrt-masses")
best, spread = 0, 0
for r in np.linspace(1 + np.sqrt(8) + 1e-9, 3.857, 4001):
    f = P([0, r, -r]); g = f(f(f)) - P([0, 1])
    pts = sorted(z.real for z in g.roots() if abs(z.imag) < 1e-9 and 1e-9 < z.real < 1 - 1/r - 1e-7 or
                 abs(z.imag) < 1e-9 and z.real > 1 - 1/r + 1e-7)
    for i in range(0, len(pts) - 2):
        orb = [pts[i], f(pts[i]), f(f(pts[i]))]
        if abs(f(orb[2]) - orb[0]) < 1e-8:
            best = max(best, Q(orb)); spread = max(spread, max(orb)/min(orb))
print(f"    max Q anywhere = {best:.4f} (Koide 2/3);  max largest/smallest = {spread:.2f} (leptons need sqrt(m_tau/m_e) = {np.sqrt(mt/me):.1f})")
print(f"    bound: a logistic orbit lies in [r^2(4-r)/16, r/4]; at r = 3.8417 that is [0.148, 0.960], ratio <= 6.5")

print("(2) URT edge rule on the phase window: walls delta = 0 (m_e = m_mu) and delta = pi/12 (m_e = 0)")
u_needed = (pi/12 - ds)/(pi/12)
print(f"    actual position: delta* sits a fraction {u_needed:.6f} of the window in from the m_e = 0 wall")
for lab, u in [("wall itself (pure edge)", 0.0), ("delta_cl = 0.15", 0.15),
               ("delta_star = (80/81)pi/(13 phi)", (80/81)*pi/(13*(1+5**.5)/2)), ("midpoint C", 0.148755)]:
    d = (pi/12)*(1 - u)
    print(f"    {lab:34s} delta = {d:.9f}  off {d-ds:+.2e} rad ({(d-ds)/sds:+.1e} sigma)  m_mu/m_e = {mu_e(d):9.3f}  (measured {rmu:.3f})"
          if u > 0 else f"    {lab:34s} delta = pi/12 -> m_e = 0 exactly")
