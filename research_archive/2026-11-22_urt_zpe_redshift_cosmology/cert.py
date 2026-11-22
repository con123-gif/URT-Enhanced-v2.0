"""Conditional entropy-redshift cosmology, 22 November 2026.
Parent 5f54cab9. Native coefficients from 871d8bc core2 nx96,nz12.
No fit, no Cathedral ARFs. Conditional physical diagnostic, not proof
of event horizon selection or a continuum vacuum coefficient.
The previous bare-bulk test did NOT include horizon gravitational redshift.
Use A=4pi R², E=(hbar c/R) chi A/ell², S/kB=sigma A/ell²,
ell²=4 sigma ellP², ellP²=hbar G/c³. Therefore
rho=3 chi c^4/(4 sigma G R²)=3 eta c^4/(8 pi G R²),
eta=2pi chi/sigma. In flat Einstein cosmology the source fraction is
Omega=eta c²/(H² R²). Apparent horizon R=c/H gives Omega=eta.
Both archived finite core2 coefficients give eta>1, inconsistent with
nonnegative other sources if interpreted as an independent component;
if whole source, eta=1 is required and leaves H undetermined.
This uses the earlier declared de Sitter-lapse excitation coefficient,
not an independently derived dynamical lapse.

Alternate conditional closure: postulate the future event horizon
R=a integral_t^infinity c dt'/a(t'), retain constant chi/sigma, assume
separately conserved source and optionally separately conserved dust.
Then Rdot=HR-c, w=-1/3-2 sqrt(Omega/eta)/3, and
dOmega/dln a=-3w Omega(1-Omega) for dust plus source. With source only,
Omega=1, eta>1 implies a~t^p, p=sqrt(eta)/(sqrt(eta)-1)>1;
eta=1 gives de Sitter with arbitrary H. This solves the conditional
expansion law without choosing a magnitude for H. The finite archived
coefficients yield accelerated solutions; neither selects the physical
horizon or proves Lorentz-covariant identification. In particular the
event-horizon prescription is conventional holographic dark-energy
dynamics with the conditional URT coefficient; not newly invented
cosmological equations. The URT result is the same-state coefficient.
Finite trace densities are orientation and cutoff dependent per e2b2b47;
do not claim certified continuum values or compare a finite eta as an
observational prediction. No extra entropy counted as a second source.

Executed locally: python /mnt/data/urt_redshift_cosmology/cert.py exit 0.
plus: eta=1.1730705804, apparent residual matter=-0.1730705804,
event w_inf=-0.9488597117, q_inf=-0.9232895675, power=13.03603653,
Omega_transition=0.4473995481, integral_R0=1.0830838289,
Omega_at_ln_a8=0.9999999998
minus: eta=1.0484081009, apparent residual matter=-0.0484081009,
event w_inf=-0.9844271290, q_inf=-0.9766406935, power=42.80949007,
Omega_transition=0.4365674912, integral_R0=1.0239180147,
Omega_at_ln_a8=0.9999999999
PASS: conditional event-horizon power law integral and expansion checks.
No remote CI claim.
"""
from math import sqrt, pi
from scipy.integrate import quad, solve_ivp
from scipy.optimize import brentq
for name,sigma,chi in [('plus',.030556428769,.005704884685),('minus',.039432894513,.006579746423)]:
    eta=2*pi*chi/sigma
    def w(o):return -1/3-2*sqrt(o/eta)/3
    def q(o):return .5*(1+3*w(o)*o)
    transition=brentq(q,0,1)
    k=sqrt(eta); power=k/(k-1); a=lambda t:(1+t/power)**power
    R0,err=quad(lambda t:1/a(t),0,float('inf'),epsabs=1e-10)
    assert abs(R0-k)<1e-8
    def rhs(x,y):
        o,lnH=y;return [-3*w(o)*o*(1-o),-1.5*(1+w(o)*o)]
    sol=solve_ivp(rhs,(0,8),[.5,0],rtol=1e-10,atol=1e-12)
    assert sol.success and sol.y[0,-1]>.999
    print(f'{name}: eta={eta:.10f}, apparent residual matter={1-eta:.10f}, event w_inf={w(1):.10f}, q_inf={q(1):.10f}, power={power:.8f}, Omega_transition={transition:.10f}, integral_R0={R0:.10f}, Omega_at_ln_a8={sol.y[0,-1]:.10f}')
print('PASS: conditional event-horizon power law integral and expansion checks')
