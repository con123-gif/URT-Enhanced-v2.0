#!/usr/bin/env python3
"""Is u* = (pi/12 - delta*)/(pi/12) an exact 'floor' of the logistic map?  NumPy + SciPy only."""
import numpy as np
from numpy.polynomial import Polynomial as P
from scipy.optimize import brentq
pi, r2 = np.pi, np.sqrt(2)
rmu, drmu = 206.7682827, 4.6e-6
def sq(d): return np.array([1 + r2*np.cos(d + 2*pi*k/3) for k in range(3)])
def mu_e(d): s = sq(d); return (s[2]/s[1])**2
ds = brentq(lambda d: mu_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: mu_e(d) - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)
u = 1 - ds/(pi/12); su = sds/(pi/12)
print(f"u* = (pi/12 - delta*)/(pi/12) = {u:.11f} +- {su:.1e}   (a match must agree to ~{3*su:.0e})")

f = lambda x, r: r*x*(1-x)
def it(x, r, n):
    for _ in range(n): x = f(x, r)
    return x
def floor(r): return r*r*(4-r)/16          # f(r/4): lowest point the attractor can reach
def cycle3(r, branch):                      # branch 'node' (stable-born, multiplier < 1) or 'saddle'
    g = (lambda F: F(F(F)))(P([0, r, -r])) - P([0, 1])
    pts = sorted(z.real for z in g.roots() if abs(z.imag) < 1e-7 and 1e-6 < z.real < 1)
    pts = [p for p in pts if abs(p - (1 - 1/r)) > 1e-6]
    cyc = []
    for p in pts:
        o = sorted([p, f(p, r), f(f(p, r), r)])
        if not any(abs(o[0]-c[0]) < 1e-9 for c in cyc): cyc.append(o)
    mult = [np.prod([r*(1-2*x) for x in c]) for c in cyc]
    i = int(np.argmin(mult)) if branch == 'node' else int(np.argmax(mult))
    return cyc[i], mult[i]

r_on = 1 + np.sqrt(8)
r_ss3 = brentq(lambda r: it(0.5, r, 3) - 0.5, 3.830, 3.834, xtol=1e-15)
r_flip = brentq(lambda r: cycle3(r, 'node')[1] + 1, 3.8405, 3.8425, xtol=1e-15)
r_ss6 = brentq(lambda r: it(0.5, r, 6) - 0.5, 3.8443, 3.8450, xtol=1e-15)
rows = []
print(f"{'special point of the period-3 window':38s} {'r':>16s} {'floor r^2(4-r)/16':>18s} {'lowest 3-cycle pt':>18s}")
for lab, r in [("onset (saddle-node), r = 1+sqrt8", r_on + 1e-12), ("superstable 3-cycle", r_ss3),
               ("3 -> 6 flip (multiplier -1)", r_flip), ("superstable 6-cycle", r_ss6)]:
    c, m = cycle3(r, 'node')
    rows += [floor(r), c[0]]
    print(f"{lab:38s} {r:16.12f} {floor(r):18.11f} {c[0]:18.11f}")
near = min(rows, key=lambda v: abs(v - u))
print(f"closest of these to u*: {near:.11f}  off {near-u:+.2e} = {(near-u)/su:+.1e} sigma")

r_floor = brentq(lambda r: floor(r) - u, 3.83, 3.84, xtol=1e-15)
r_low = brentq(lambda r: cycle3(r, 'node')[0][0] - u, r_ss3, r_flip, xtol=1e-14)
print(f"the floor equals u* at r = {r_floor:.12f}; the lowest 3-cycle point equals u* at r = {r_low:.12f}"
      f" (3-cycle multiplier there {cycle3(r_low, 'node')[1]:+.6f})")
print("neither r is one of the special points above, so u* is a floor only after choosing r to make it one")
