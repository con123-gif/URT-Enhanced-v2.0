#!/usr/bin/env python3
"""Conditional carrier-creation thermodynamics of same URT magnetic vacuum.
Exact symbolic d-dimensional first-law identity; numerical original 2D graph
thermodynamic limit check. No fitted or cosmological constants.
"""
import math
import sympy as s
from scipy.linalg import eigvalsh
from URT_ZPE_METRIC_RESPONSE_CERT import components,PHI,THETA

V,M,k=s.symbols('V M k',positive=True)
d=s.symbols('d',integer=True,positive=True)
E=k*M**(1+1/d)/V**(1/d)
rho=E/V
pressure=-s.diff(E,V)
chemical=s.diff(E,M)
effective=s.simplify(pressure-chemical*M/V)
assert s.simplify(pressure-rho/d)==0
assert s.simplify(chemical-(1+1/d)*E/M)==0
assert s.simplify(effective+rho)==0
assert s.simplify(pressure-chemical*M/V+rho)==0
print('EXACT for d spatial dimensions: E=k*M^(1+1/d)*V^(-1/d)')
print('P_mech=rho/d; mu=(1+1/d)*E/M; P_co_growth=P_mech-mu*M/V=-rho')
print('Note: P_co_growth is an effective derivative along site creation, not necessarily physical gravitational stress')

# E_M at fixed edge length ell=1 is the native connected-lattice Tr sqrt(L).
# With known thermodynamic limit E_N=u N^2 + O(N), the secant rate -> u.
for eps in (-1,1):
    rows=[]
    prev=None
    for N in (4,6,8,10,12,14):
        X,Y,_=components(N,eps)
        energy=float((eigvalsh(X+Y)**.5).sum())
        per_site=energy/N**2
        if prev is not None:
            lastN,lastE=prev
            slope=(energy-lastE)/(N**2-lastN**2)
            rows.append((N,per_site,slope, -slope/per_site))
            assert energy>lastE and slope>0
        prev=(N,energy)
    # The secant effective pressure is -dE/dV at fixed microscopic ell=1.
    # The exact asymptotic theorem (u limit with O(N) surface correction) gives P_eff/rho -> -1;
    # finite values need not be exactly -1 due to boundary effects.
    for N,u,secant,relative in rows:
        print(f'eps={eps:+d} N={N:2d} E/M={u:.10f} growth_deriv={secant:.10f} co_growth_P/rho={relative:.8f}')
    assert abs(rows[-1][3]+1)<.04  # finite-size convergence diagnostic, not an error-bound theorem
    assert abs(rows[-1][3]+1)<abs(rows[0][3]+1)
print('PASS: exact continuum thermodynamic identity, native flux graph growth trends')
print('CONDITIONAL: carrier creation with constant proper spacing is an extra physical hypothesis')
