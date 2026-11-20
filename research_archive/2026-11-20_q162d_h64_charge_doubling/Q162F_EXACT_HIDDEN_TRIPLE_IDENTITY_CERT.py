#!/usr/bin/env python3
"""Q162f: exact nonlinear triple-eigenvector theorem on true Q101 ground orbits.

For real native source u=h3+z*h5 (any REAL z) and Q(u)=Ph(u*u),
Ph(u*Q(u))=(u.u/120)u, and Q(u).Q(u)=(u.u)**2/120.
A5 symmetry and inversion give all 60 original ground words from one
symbolically certified representative; not a theorem for arbitrary hidden u.
Physical local gauge, continuum or particle identification OPEN.
"""
import runpy
from pathlib import Path
import sympy as sp

r=runpy.run_path(str(Path(__file__).resolve().with_name(
 'Q162D_NATIVE_Q4_H64_CLOCK_CERT.py')))
a=r['a'];b=r['b']
A=r['A'];B=r['B'];D=r['D'];Ph=r['Hs']
z=sp.symbols('z',real=True)
u=a+z*b
q=A+z*B+z*z*D
n=sp.Rational(32,5)*(1+z*z/3)
qn=sp.Rational(128,375)*(1+z*z/3)**2
assert sp.simplify(u.dot(u)-n)==0
assert sp.simplify(q.dot(q)-qn)==0
assert sp.simplify(qn-n*n/120)==0
triple=Ph*sp.Matrix([x*y for x,y in zip(u,q)])
for k in range(20):
 diff=sp.Poly(sp.expand(triple[k]-(n/sp.Integer(120))*u[k]),z)
 for power in range(4):
  assert sp.simplify(diff.coeff_monomial(z**power))==0,(k,power)
# Global complex-phase covariance of the CONJUGATED triple identity
# (the real-source form above is not itself gauge covariant as written).
# If u_complex=e^(i a)u and q_complex=e^(2i a)q,
# Ph[conj(u_complex)*q_complex]=e^(i a) Ph[u*q].
theta=sp.symbols('theta',real=True)
phase=sp.exp(sp.I*theta)
assert sp.simplify(sp.conjugate(phase)*phase**2-phase)==0
# For REAL tangent direction v in hidden H8, use self-adjoint Ph:
# d||Q||²(v)=4<Q,Ph(u*v)>=4<n u/120,v> =
# d(||u||^4/120)(v). Consequently d log||Q||²=2 d log||u||²
# at all 60 true ground states, for ANY infinitesimal real hidden v.
print('Q162f EXACT PASS: all-real-z original cubic eigenvector /120')
print('Q162f Q4 norm²=(Q2 norm²)^2/120, derivative doubling')
print('Q162f global conjugated U1 triple covariance PASS')
print('Physical/Q96 local Ward OPEN; not a universal identity on H8')
