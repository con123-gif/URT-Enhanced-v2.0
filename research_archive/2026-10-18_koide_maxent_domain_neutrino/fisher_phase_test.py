#!/usr/bin/env python3
"""Information-geometric phase candidates F1-F3 (FISHER_PREREGISTRATION.md, sha256 b89d8921...)."""
import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq
pi, r2 = np.pi, np.sqrt(2)
rmu, drmu = 206.7682827, 4.6e-6
def p(d): return np.array([1 + r2*np.cos(d + 2*pi*k/3) for k in range(3)])/3
def dp(d): return np.array([-r2*np.sin(d + 2*pi*k/3) for k in range(3)])/3
def mu_e(d): s = p(d); return (s[2]/s[1])**2
ds = brentq(lambda d: mu_e(d) - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: mu_e(d) - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)
def lode(x):
    t = np.asarray(x) - np.mean(x); return np.arccos(np.clip(np.sqrt(6)*(t**3).sum()/((t**2).sum())**1.5, -1, 1))/3
end = pi/12
def arclen(metric, a, b):
    # substitution d = end - t^2 removes the integrable 1/sqrt singularity at the massless wall
    f = lambda t: np.sqrt(metric(end - t*t)) * 2*t
    return quad(f, np.sqrt(end - b), np.sqrt(end - a), limit=500, epsabs=1e-13, epsrel=1e-12)[0]
def centre(metric):
    L = arclen(metric, 0, end)
    return brentq(lambda x: arclen(metric, 0, x) - L/2, 1e-6, end - 1e-12, xtol=1e-15)
g_p = lambda d: np.sum(dp(d)**2 / p(d))
def g_q(d):
    q = p(d)**2 / np.sum(p(d)**2); dq = 2*p(d)*dp(d)/np.sum(p(d)**2)    # sum p^2 = 2/3 is constant on the circle
    return np.sum(dq**2 / q)
print(f"target delta* = {ds:.12f} +- {sds:.1e}")
for lab, met in [("F1 Fisher centre, sqrt-mass weights", g_p), ("F2 Fisher centre, mass weights", g_q)]:
    d = centre(met)
    print(f"   {lab:38s} delta = {d:.12f}  off {d-ds:+.3e} ({(d-ds)/sds:+.1e} sigma)  m_mu/m_e = {mu_e(d):.4f}"
          f"  {'PASS' if abs(d-ds) < 3*sds else 'FAIL'}")
qg = (5 - np.sqrt(21))/2                                     # root of q + 1/q = 5 (sum p^2 = 2/3)
w = np.array([1, qg, qg**2]); w /= w.sum()
print(f"   F3 Gibbs over generation index: ratio {qg:.6f} per step; sum p^2 = {np.sum(w**2):.12f};"
      f" delta = {lode(w):.6f}; m_mu/m_e = {(w[1]/w[2])**2:.2f}, m_tau/m_mu = {(w[0]/w[1])**2:.2f}  FAIL"
      f" (measured {rmu:.2f}, 16.82)")
