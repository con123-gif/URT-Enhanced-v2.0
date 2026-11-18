#!/usr/bin/env python3
import sympy as sp
phi=(1+sp.sqrt(5))/2
omega=sp.simplify(1/phi**2)
assert sp.simplify(omega-(3-sp.sqrt(5))/2)==0 and omega.is_irrational is True
N=24
S=sp.zeros(N)
for j in range(N): S[(j+1)%N,j]=1
assert S**24==sp.eye(N)
assert S.charpoly().as_expr()==sp.Symbol('lambda')**24-1
charges=[sp.Rational(-1),sp.Rational(-2,3),sp.Rational(-1,3),sp.Rational(0),sp.Rational(1,3),sp.Rational(2,3),sp.Rational(1)]
assert sum(sp.simplify(N*(q-r)*omega).is_irrational is True for i,q in enumerate(charges) for r in charges[i+1:])==21
R=sp.zeros(N)
for j in range(N): R[(-j)%N,j]=1
assert R*R==sp.eye(N) and R*S*R==S.T
print("Q161bu EXACT PASS: 21 charged clock spectra disjoint; reversal exact; physical seam OPEN")
