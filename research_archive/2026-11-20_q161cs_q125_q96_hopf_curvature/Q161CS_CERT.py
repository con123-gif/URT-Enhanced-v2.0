#!/usr/bin/env python3
"""Exact Q125 Hopf/Q96 charge-weighted Berry curvature on native CP1 chart."""
import sympy as s
z,w=s.symbols("z w")
d=1+z*w
p=s.Matrix([1,z]); n=s.Matrix([-w,1])
P=p*s.Matrix([[1,w]])/d
N=n*s.Matrix([[-z,1]])/d
assert s.simplify(P+N-s.eye(2))==s.zeros(2)
assert s.simplify(P*P-P)==s.zeros(2)
C=s.simplify(P.diff(z)*P.diff(w)-P.diff(w)*P.diff(z))
assert s.simplify(s.trace(P*C)+1/d**2)==0
assert s.simplify(s.trace(N*C)-1/d**2)==0
charges=[(s.Rational(2,3),-s.Rational(1,3))]*3+[(s.Integer(0),-s.Integer(1))]
Q=s.zeros(8); F=s.zeros(8)
for k,(qp,qn) in enumerate(charges):
    Q[2*k:2*k+2,2*k:2*k+2]=qp*P+qn*N
    F[2*k:2*k+2,2*k:2*k+2]=C
assert s.simplify(s.trace(Q*F)+4/d**2)==0
r=s.symbols("r",positive=True)
assert s.integrate(2*r/(1+r*r)**2,(r,0,s.oo))==1
print("Q161CS EXACT PASS: original Q125/Q96 weighted Hopf curvature -4/(1+zw)^2, Chern magnitude 4")
