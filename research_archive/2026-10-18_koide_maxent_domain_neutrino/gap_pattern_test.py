#!/usr/bin/env python3
"""Is the phase gap a geometric angle? (GAP_PREREGISTRATION.md). NumPy + SciPy only."""
import numpy as np
from scipy.optimize import brentq
pi, r2 = np.pi, np.sqrt(2)
phi = (1 + 5**0.5)/2
me, rmu, drmu, mt, dmt = 0.51099895069, 206.7682827, 4.6e-6, 1776.93, 0.09
def sq(d): return np.array([1 + r2*np.cos(d + 2*pi*k/3) for k in range(3)])
ds = brentq(lambda d: (sq(d)[2]/sq(d)[1])**2 - rmu, 0.2, 0.25, xtol=1e-16)
sds = abs(brentq(lambda d: (sq(d)[2]/sq(d)[1])**2 - rmu - drmu, 0.2, 0.25, xtol=1e-16) - ds)
G, sG = pi/4 - 3*ds, 3*sds
base = [70.5288, 90, 109.4712, 116.5651, 138.1897, 20.9052, 31.7175, 37.3774, 41.8103, 54.7356, 58.2825,
        63.4349, 69.0948, 79.1877, 36, 72, 137.5078, np.degrees(1.0)]
exact = {70.5288: np.degrees(np.arccos(1/3)), 109.4712: np.degrees(np.arccos(-1/3)),
         116.5651: np.degrees(np.arccos(-1/np.sqrt(5))), 138.1897: np.degrees(np.arccos(-np.sqrt(5)/3)),
         20.9052: np.degrees(np.arctan(1/phi**2)), 31.7175: np.degrees(np.arctan(1/phi)),
         37.3774: np.degrees(np.arccos(np.sqrt((5+2*np.sqrt(5))/15))), 41.8103: np.degrees(np.arccos(np.sqrt(5)/3)),
         54.7356: np.degrees(np.arccos(1/np.sqrt(3))), 58.2825: np.degrees(np.arctan(phi)),
         63.4349: np.degrees(np.arctan(2)), 69.0948: np.degrees(np.arctan(phi**2)),
         79.1877: np.degrees(np.arccos(np.sqrt((5-2*np.sqrt(5))/15))), 137.5078: 360/phi**2}
cands = sorted({np.radians(exact.get(b, b))*k/m for b in base for k in range(1, 7) for m in range(1, 7)})
cands = np.array(cands)
for lab, x, sx in [("G = pi/4 - 3 delta*", G, sG), ("g = pi/12 - delta*", G/3, sG/3)]:
    i = np.argmin(np.abs(cands - x)); near = cands[i]
    gaps = np.diff(cands[(cands > 0.5*x) & (cands < 2*x)])
    print(f"{lab:22s} = {x:.10f} rad ({np.degrees(x):.7f} deg) +- {sx:.1e}")
    print(f"   nearest of {len(cands)} geometric candidates: {near:.10f}  off {near-x:+.2e} rad = {(near-x)/sx:+.1e} sigma"
          f"  -> {'PASS' if abs(near-x) < 3*sx else 'FAIL'}")
    print(f"   typical spacing of candidates near this value: {np.median(gaps):.2e} rad"
          f" -> a random number lands ~{np.median(gaps)/4:.1e} from one by chance")
r1 = np.log(rmu)/np.log(phi) - 11
r2_pred = -r1*phi
mt_pred = rmu*me*phi**(6 + r2_pred)
print(f"golden residuals: r1 = {r1:+.6f}; pattern r2 = -phi r1 = {r2_pred:+.6f} -> m_tau = {mt_pred:.2f} MeV"
      f" ({(mt_pred-mt)/dmt:+.0f} sigma)  {'PASS' if abs(mt_pred-mt) < 3*dmt else 'FAIL'}")
