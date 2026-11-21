#!/usr/bin/env python3
"""Conditional covariant carrier-density action: exact metric stress and exchange.

Follows native 3D golden-flux bulk E(V,M)=K M^(4/3)V^(-1/3).
The fixed physical gap floor is an EXTRA postulate, not derived by URT.
A metric auxiliary multiplier makes the source/pressure balance precise.
This certificate proves formal identities (SymPy) and native flux/gap checks.
"""
from __future__ import annotations
import math
import numpy as np
import sympy as s

n,nstar,K,lam = s.symbols('n nstar K lam', positive=True, finite=True)
H,V,M = s.symbols('H V M', positive=True, finite=True)
alpha = s.symbols('alpha', positive=True, finite=True)
rho=K*n**s.Rational(4,3)
mu=s.diff(rho,n)
p_bare=s.expand(n*mu-rho)
assert s.simplify(p_bare-rho/s.Integer(3))==0

# Covariant action density L=-rho(n)+lambda*(n-nstar),
# n=sqrt(-g_mn J^m J^n)/sqrt(-g), J densitized contravariant current.
# Variation w.r.t J gives lambda=rho'(n), provided current is timelike.
# Variation w.r.t lambda enforces n=nstar. The bare fluid and multiplier
# metric-stress coefficients in decomposition T=A*u_mu*u_nu+B*g_mu_nu.
bare_A=n*mu
bare_B=n*mu-rho
constraint_A=-n*lam
constraint_B=lam*(n-nstar)-n*lam
A=s.simplify((bare_A+constraint_A).subs({lam:mu,n:nstar}))
B=s.simplify((bare_B+constraint_B).subs({lam:mu,n:nstar}))
assert A==0
assert s.simplify(B+K*nstar**s.Rational(4,3))==0
assert s.simplify(constraint_B.subs(lam,mu).subs(n,nstar)+s.Rational(4,3)*K*nstar**s.Rational(4,3))==0

# FRW minisuperspace: ds^2=-N^2dt^2+a^2(dx^2+dy^2+dz^2);
# J^0=J, n=J/a^3 independent of lapse N.
a,N,J=s.symbols('a N J',positive=True)
nu=J/a**3
Lbare=-N*a**3*K*nu**s.Rational(4,3)
Lcon=N*a**3*lam*(nu-nstar)
L=Lbare+Lcon
# Substitute saddle point AFTER metric variation with current fixed.
sol={J:a**3*nstar,lam:s.Rational(4,3)*K*nstar**s.Rational(1,3)}
E_bare=s.simplify(-s.diff(Lbare,N).subs(sol)/a**3)
E_con=s.simplify(-s.diff(Lcon,N).subs(sol)/a**3)
p_b=s.simplify(s.diff(Lbare,a).subs(sol)/(3*N*a**2))
p_c=s.simplify(s.diff(Lcon,a).subs(sol)/(3*N*a**2))
assert s.simplify(E_bare-K*nstar**s.Rational(4,3))==0
assert E_con==0
assert s.simplify(p_b-K*nstar**s.Rational(4,3)/3)==0
assert s.simplify(p_c+s.Rational(4,3)*K*nstar**s.Rational(4,3))==0
assert s.simplify(p_b+p_c+E_bare)==0
assert s.simplify(L.subs(sol)+N*a**3*K*nstar**s.Rational(4,3))==0

# Original fixed-M first law and energy transfer along the constraint.
E=K*M**s.Rational(4,3)*V**(-s.Rational(1,3))
pressure=s.simplify(-s.diff(E,V))
chemical=s.simplify(s.diff(E,M))
work_coeff=s.simplify(chemical*M/V)
constrained_dEdV=s.simplify((-pressure+work_coeff).subs(M,nstar*V))
assert s.simplify(constrained_dEdV-K*nstar**s.Rational(4,3))==0
assert s.simplify(work_coeff-s.Rational(4,3)*E/V)==0
assert s.simplify(pressure-E/(3*V))==0

# Fixed-density comoving current gives Gamma=3H.
Gamma=3*H
source=s.simplify(mu.subs(n,nstar)*Gamma*nstar)
assert s.simplify(source-4*H*K*nstar**s.Rational(4,3))==0
assert s.simplify(source+3*H*p_c)==0

# Frozen primitive golden phase: conditional homogeneous flux sectors.
phi=(1+math.sqrt(5))/2
f0=2*math.pi/phi**2
for eps in (+1,-1):
    phase=float(np.angle(eps*np.exp(-1j*f0)))
    gap2=1-math.cos(abs(phase)/4)
    gap3=s.Rational(3,2)*gap2
    assert 0<gap2 and 0<gap3
    print(f'flux sector {eps:+d}: theta={abs(phase):.12f}, g3={float(gap3):.12f}')

print('PASS: metric variation of covariant constrained carrier action: T_vac=-rho*g')
print('PASS: bare p=rho/3, multiplier pressure=-4rho/3, multiplier energy=0')
print('PASS: FRW action variation, carrier source Gamma=3H, mechanical/chemical first law')
print('PREDICTION (conditional): exact w=-1 after on-shell elimination of auxiliary fields')
print('OPEN: URT does not derive fixed Omega, density constraint, carrier creation microdynamics or G')
