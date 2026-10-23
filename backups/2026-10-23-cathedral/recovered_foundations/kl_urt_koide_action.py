"""
kl_urt_koide_action.py -- the KL/URT action on the Z3 generation circulant, written down and solved.

sqrt-mass operator (Hermitian Z3 circulant):  M = v I + s C + s* C^2,  C^3 = I,  s = |s| e^{i delta}
eigenvalues:   sqrt(m_k) = v + 2|s| cos(delta + 2 pi k / 3)            (Koide form)

action (repo's effective URT action: quadratic relative information + one -ln per positive amplitude):
   Gamma[v, s] = (kappa/2) Tr(M^2) - ln v - ln|s| + Gamma_omega[delta]
   Tr(M^2) = 3 v^2 + 6 |s|^2

stationarity:  3 kappa v = 1/v ,  6 kappa |s| = 1/|s|   =>   |s|/v = 1/sqrt(2)   =>   Q = 2/3, any kappa
delta: flat in this action.  Sections 5-7 test every way the action or the repo can fix it.
Inputs: CODATA 2022 (m_e, m_mu/m_e), PDG 2026 (m_tau = 1776.93 +- 0.09 MeV).
"""
import numpy as np
from scipy.optimize import minimize, brentq

C = np.roll(np.eye(3), 1, axis=0)                                   # cyclic shift, C^3 = I
def M(v, s): return v * np.eye(3) + s * C + np.conj(s) * C @ C
Qf = lambda x: np.sum(x ** 2) / np.sum(x) ** 2
r2, w = np.sqrt(2), np.exp(2j * np.pi / 3)
me, rmu, drmu, mt, dmt = 0.51099895069, 206.7682827, 0.0000046, 1776.93, 0.09

print("1) Tr(M^2) = 3v^2 + 6|s|^2 :", np.allclose(np.trace(M(1.3, 0.7 * np.exp(0.4j)) @ M(1.3, 0.7 * np.exp(0.4j))).real, 3 * 1.3**2 + 6 * 0.7**2))
print("2) stationary point of (kappa/2)Tr(M^2) - ln v - ln|s| :")
for kappa in (0.1, 1.0, 47.966978303, 1e3):                         # Gamma separates: solve each gradient = 0
    v = brentq(lambda x: 3 * kappa * x - 1 / x, 1e-9, 1e9, xtol=1e-300, rtol=1e-15)
    r = brentq(lambda x: 6 * kappa * x - 1 / x, 1e-9, 1e9, xtol=1e-300, rtol=1e-15)
    print(f"   kappa={kappa:<14g} |s|/v = {r / v:.12f} (1/sqrt2 = {2 ** -0.5:.12f})   Q = {Qf(np.linalg.eigvalsh(M(v, r * np.exp(0.2j)))):.12f}")
print("3) delta is flat in this action:",
      np.allclose([np.trace(M(1, 0.7 * np.exp(1j * d)) @ M(1, 0.7 * np.exp(1j * d))).real for d in np.linspace(0, 2, 7)], 3 + 6 * 0.49))

# 4) data -------------------------------------------------------------------------------------
def koide(ms):                                   # ms ordered (tau, e, mu) <-> k = 0, 1, 2
    rt = np.sqrt(ms); s = sum(rt[k] * w ** (-k) for k in range(3)) / 3
    return ms.sum() / rt.sum() ** 2, np.angle(s)
def delta_emu(R):                                # Q = 2/3 exact: m_mu/m_e alone fixes delta
    return brentq(lambda d: (1 + r2*np.cos(d + 4*np.pi/3)) / (1 + r2*np.cos(d + 2*np.pi/3)) - np.sqrt(R), .2, .24, xtol=1e-15)
def masses(delta, A=r2):                         # Koide masses normalised to m_e -> (tau, e, mu)
    a = np.array([(1 + A * np.cos(delta + 2 * np.pi * k / 3)) ** 2 for k in range(3)]); return me * a / a[1]
Q0, d0 = koide(np.array([mt, me, me * rmu])); Q1, d1 = koide(np.array([mt + dmt, me, me * rmu]))
ds = delta_emu(rmu); dds = abs(delta_emu(rmu + drmu) - ds)
print(f"4) three masses, Q free : Q = {Q0:.9f} +- {abs(Q1-Q0):.1e} (2/3 at {(Q0-2/3)/abs(Q1-Q0):+.2f} sig),  delta = {d0:.9f} +- {abs(d1-d0):.1e}")
print(f"   Q = 2/3 exact (derived above): m_mu/m_e alone gives delta* = {ds:.12f} +- {dds:.0e},  3 delta* = {3*ds:.9f} rad")
p = masses(2 / 9)
print(f"   delta = 2/9 exact as well   : m_mu/m_e = {p[2]/me:.7f} vs {rmu} -> {(p[2]/me - rmu)/drmu:+.0f} sigma.  2/9 - delta* = {2/9 - ds:.3e} (relative {(2/9-ds)/ds:.1e})")
print(f"   Koide m_tau from e, mu       : {masses(ds)[0]:.3f} MeV  ({(masses(ds)[0]-mt)/dmt:+.2f} sigma)")
qb = brentq(lambda q: masses(q / 3, np.sqrt(6*q - 2))[2] / me - rmu, 0.6, 0.7, xtol=1e-15)   # law 3 delta = Q, Q free
print(f"   alternative law 3delta = Q   : needs Q = {qb:.10f}, predicts m_tau = {masses(qb/3, np.sqrt(6*qb-2))[0]:.3f} MeV")

# 5) every delta-dependent term the action can carry, at the Koide point --------------------------
d = np.linspace(1e-6, np.pi / 3 - 1e-6, 200001); v0, s0 = 1.0, 2 ** -0.5
detM = v0**3 - 3 * v0 * s0**2 + 2 * s0**3 * np.cos(3 * d)
trM3 = 3 * v0**3 + 18 * v0 * s0**2 + 6 * s0**3 * np.cos(3 * d)
print("5) delta selected by each candidate term (folded to 0..60 deg):")
print(f"   -ln|det M| (one log per eigen-amplitude) : {np.degrees(d[np.argmin(-np.log(np.abs(detM)))]):.3f} deg")
print(f"   +/- Tr M^3 (symmetric three-return)      : {np.degrees(d[np.argmin(trM3)]):.3f} or {np.degrees(d[np.argmax(trM3)]):.3f} deg")
print(f"   omega alone (oriented, ~ sin 3delta)     : {np.degrees(d[np.argmax(np.sin(3 * d))]):.3f} deg")
print(f"   complex cubic coupling g e^(i beta) s^3  : 3 delta = -beta, beta free.  Needed: beta = -{3*ds:.9f} rad, tan(beta) = -{np.tan(3*ds):.9f}")

# 6) the repo's own omega (charge-plane words, urt_dirac_selection_audit.py) -----------------------
q = {'u': [1, 3, -4], 'd': [1, -3, 2], 'e': [-3, -3, 6], 'nu': [-3, 3, 0]}          # (3(B-L), 6 T3R, -6 Q)
n = np.ones(3) / np.sqrt(3); b1 = np.array([1, -1, 0]) / r2; b2 = np.cross(n, b1)
z = {k: b1 @ np.array(x, float) + 1j * b2 @ np.array(x, float) for k, x in q.items()}
H = np.array([[np.conj(z[a]) * z[b] for b in q] for a in q])                          # g + i omega
loops = [np.angle(H[i, j] * H[j, k] * H[k, i]) for i in range(4) for j in range(4) for k in range(4) if len({i, j, k}) == 3]
print(f"6) h = g + i omega has rank {np.linalg.matrix_rank(H, 1e-9)}; largest holonomy on any ordered three-species loop = {max(map(abs, loops)):.1e} rad")
for g in ('u', 'd', 'nu'):
    ph = np.angle(np.conj(z['e']) * z[g])
    print(f"   3 delta = arg(z_e* z_{g:<2}) = {np.degrees(ph):+8.3f} deg -> cos 3delta = {np.cos(ph):+.4f}   (need {np.cos(3*ds):+.4f})")
