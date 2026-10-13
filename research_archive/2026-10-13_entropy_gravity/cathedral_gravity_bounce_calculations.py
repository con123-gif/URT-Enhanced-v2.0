"""Newton's Cathedral / URT: reproducible finite-state gravity & bounce tests.

This verifies exact identities and computes *conditional* information-geometric
quantities. It does not assume they are spacetime observables.
Python 3, numpy, mpmath, scipy (for physical constants).
"""
import numpy as np
import mpmath as mp
from scipy.constants import m_e, m_p, c, hbar

mp.mp.dps = 45
phi = (1 + mp.sqrt(5)) / 2
D = mp.mpf(3) / 20 - 80 * mp.pi / (1053 * phi)
eta = -mp.log(D)
p = D**2 / (1 + D**2)
kappa = mp.pi / mp.e
sstar = eta / (4 * D)

P3 = np.diag([1.] * 4 + [0.] * 4)
P5 = np.eye(8) - P3
rho_parent = np.eye(8) / 8

def entropy(mat):
    eig = np.linalg.eigvalsh(mat)
    return -sum(v * np.log(v) for v in eig if v > 1e-14)

def kraus(s):
    r = np.exp(-4 * float(D) * s)
    norm = np.sqrt(1 + r*r)
    return (P3 + r*P5) / norm, (r*P3 + P5) / norm

def h2(z):
    return -(z*mp.log(z) + (1-z)*mp.log(1-z))

def p_plus(s):
    return 1 / (1 + mp.exp(8*D*s))

Bplus, Bminus = kraus(float(sstar))
assert np.allclose(Bplus.T @ Bplus + Bminus.T @ Bminus, np.eye(8), atol=1e-13)
probplus = np.trace(Bplus @ rho_parent @ Bplus.T)
probminus = np.trace(Bminus @ rho_parent @ Bminus.T)
assert abs(probplus - .5) < 1e-12 and abs(probminus-.5) < 1e-12
rho_plus = (Bplus @ rho_parent @ Bplus.T) / probplus
rho_minus = (Bminus @ rho_parent @ Bminus.T) / probminus
rho_star = (P3 + float(D)**2*P5)/(4*(1+float(D)**2))
assert np.allclose(rho_plus, rho_star, atol=1e-14)
assert np.allclose((rho_plus + rho_minus)/2, rho_parent, atol=1e-14)
assert abs(entropy(rho_plus) - float(mp.log(4)+h2(p))) < 1e-12

# The critical (s=0) parent is maximally mixed. Its daughter entropy
# has a strict maximum there, even though the underlying map is CPTP.
B0, B0minus = kraus(0)
assert np.allclose(B0, np.eye(8)/np.sqrt(2))
assert abs(float(p_plus(0))-0.5)<1e-14

# Gibbs generator: K(s=eta) = eta*(3P3+5P5).
# An arbitrary block-diagonal perturbation K(x)=K0+x*(v3 P3+v5 P5)
# gives dp/dx=-(v5-v3)*p(1-p). No value for v5-v3 comes from K0.

def gibbs(K):
    evals, U = np.linalg.eigh(K)
    w = np.exp(-evals + np.min(evals))
    return (U * w) @ U.T / sum(w)
K0 = float(eta)*(3*P3 + 5*P5)
Vdiag = P5
h = 1e-5
fdp = (np.trace(P5 @ gibbs(K0+h*Vdiag)) -
       np.trace(P5 @ gibbs(K0-h*Vdiag)))/(2*h)
assert np.isclose(fdp, -float(p*(1-p)), rtol=3e-8)

# Off-diagonal 'gauge/carrier' generator: first derivative of entropy = 0.
X = np.block([[np.zeros((4,4)), np.eye(4)],
              [np.eye(4), np.zeros((4,4))]])
dSdx = (entropy(gibbs(K0+h*X))-entropy(gibbs(K0-h*X)))/(2*h)
assert abs(dSdx)<1e-9
# Exact off-diagonal solution: let q = sqrt(eta^2+(g*x)^2).
# P5 population = (1 - eta*tanh(q)/q)/2.
# Full entropy = ln 4 + H2((1 - tanh(q))/2).
for x in [0., .1, 1.]:
    q = mp.sqrt(eta**2 + mp.mpf(str(x))**2)
    pp = (1 - eta*mp.tanh(q)/q)/2
    S = mp.log(4)+h2((1-mp.tanh(q))/2)
    rhox = gibbs(K0+x*X)
    assert abs(float(pp)-np.trace(P5@rhox))<1e-12
    assert abs(float(S)-entropy(rhox))<1e-12

# Construct a dimensionless, information-geometric bounce *proxy*:
# a_info(s)=1/(2sqrt(p(s)[1-p(s)]))=cosh(4Delta*s).
# H_info(0)=0; dH_info/ds(0)=16 Delta^2>0.
assert mp.almosteq(1/(2*mp.sqrt(p_plus(sstar)*(1-p_plus(sstar)))),
                   mp.cosh(eta))

print('rail gap Delta                =', mp.nstr(D, 19))
print('eta                          =', mp.nstr(eta, 19))
print('critical-to-star s          =', mp.nstr(sstar, 19))
print('p5 at star                   =', mp.nstr(p, 19))
print('variable Sstar/kB            =', mp.nstr(h2(p), 19))
print('daughter state entropy/kB    =', mp.nstr(mp.log(4)+h2(p),19))
print('probabilities + and -        =', probplus, probminus)
print('dp/ds at star               =', mp.nstr(-8*D*p*(1-p), 18))
print('dS/ds /kB at star           =', mp.nstr(-16*eta*D*p*(1-p),18))
print('a_info at star              =', mp.nstr(mp.cosh(eta),17))
print('H_info at bounce            =', 0)
print('dH_info/ds at bounce        =', mp.nstr(16*D**2,19))
print('Verlinde required dp/dx     =', mp.nstr(mp.pi/eta, 17), '* m c/hbar')
print('required generator (v5-v3) = -', mp.nstr(mp.pi/(eta*p*(1-p)),17), '* m c/hbar')
print('max one-cell x /lambda_C    =', mp.nstr((mp.log(2)-h2(p))/(2*mp.pi),18))
print('URT radial logistic exponent=', mp.nstr(8*D/mp.log(kappa),18))
for name, mass in [('electron',m_e),('proton',m_p)]:
    reduced_compton_length = hbar/(mass*c)
    print(f'{name:8} required dp/dx [1/m]  =',
          f'{float(mp.pi/eta)/reduced_compton_length:.9g}')
    print(f'{name:8} one-cell x_max [m]    =',
          f'{float((mp.log(2)-h2(p))/(2*mp.pi))*reduced_compton_length:.9g}')
print('All 8x8 operator checks passed.')