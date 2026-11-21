#!/usr/bin/env python3
"""Independent exact symbolic audit of the 3+1D URT oscillator bulk first law.

These results do not derive the microscopic carrier creation rate Γ;
they establish the unique Γ/H ratio required for an effective w=-1.
"""
import sympy as s
M,V,C,H,Gamma=s.symbols('M V C H Gamma',positive=True)
E=C*M**s.Rational(4,3)*V**(-s.Rational(1,3))
rho=s.simplify(E/V)
p=-s.diff(E,V)
mu=s.diff(E,M)
assert s.simplify(p-rho/3)==0
assert s.simplify(mu-4*E/(3*M))==0
# The comoving volume expands at Vdot=3 H V, and the number of carriers
# satisfies Mdot=Gamma M (the proper density obeys ndot+3Hn=Gamma n).
rhodot=s.diff(rho,M)*Gamma*M+s.diff(rho,V)*3*H*V
assert s.simplify(rhodot-s.Rational(4,3)*rho*(Gamma-3*H))==0
source=s.simplify(rhodot+3*H*(rho+p))
assert s.simplify(source-s.Rational(4,3)*Gamma*rho)==0
pc=-s.simplify(source/(3*H))
weff=s.simplify((p+pc)/rho)
assert s.simplify(weff-(s.Rational(1,3)-4*Gamma/(9*H)))==0
assert s.solve(weff+1,Gamma)==[3*H]
assert s.simplify(rhodot.subs(Gamma,3*H))==0
# Scale non-identifiability: ℓ->s ℓ changes the 3D oscillator vacuum
# energy density by s^-4 while leaving theta and all spectra untouched.
ell,d=s.symbols('ell d',positive=True)
unit_energy_density=C/ell**4
assert s.simplify(unit_energy_density.subs(ell,d*ell)/unit_energy_density-d**(-4))==0
print('PASS: exact 3+1 bulk first law, source continuity, necessary/sufficient Gamma=3H, scale ambiguity')
print('w_eff:',weff)
print('P_mech/rho:',s.simplify(p/rho))
print('mu*M/E:',s.simplify(mu*M/E))
print('Source/(rho*Gamma):',s.simplify(source/(rho*Gamma)))
print('PHYSICAL STATUS: source rate and covariant stress action remain independent assumptions')
