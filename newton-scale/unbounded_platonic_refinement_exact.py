#!/usr/bin/env python3
"""Standalone exact Newton–Platonic refinement theorem: no URT/Cathedral imports."""
import sympy as s
import mpmath as mp
phi=(1+s.sqrt(5))/2
N=s.simplify(1/phi**2)
assert s.simplify(N-(3-s.sqrt(5))/2)==0 and N<s.Rational(1,2)
pentagon=[s.Matrix([s.cos(2*s.pi*j/5),s.sin(2*s.pi*j/5)]) for j in range(5)]
for j in range(5):
    p=lambda k:pentagon[k%5]
    intersection=s.simplify(N*p(j)+(1/phi)*p(j+2))
    assert s.simplify(intersection-((1/phi)*p(j+1)+N*p(j+3)))==s.zeros(2,1)
    target=N*s.Matrix([s.cos(2*s.pi*j/5+3*s.pi/5),
                       s.sin(2*s.pi*j/5+3*s.pi/5)])
    assert s.simplify(intersection-target)==s.zeros(2,1)
# Symbolic independent combinatorial spectrum and cube label doubling.
neighbors=[
[8,12,16],[9,12,17],[10,13,16],[11,13,17],
[8,14,18],[9,14,19],[10,15,18],[11,15,19],
[0,4,10],[1,5,11],[2,6,8],[3,7,9],
[0,1,14],[2,3,15],[4,5,12],[6,7,13],
[0,2,17],[1,3,16],[4,6,19],[5,7,18]]
A=s.zeros(20)
for i,adj in enumerate(neighbors):
    for j in adj:A[i,j]=1
assert A==A.T
L=3*s.eye(20)-A
x=s.symbols('x')
assert s.expand(L.charpoly(x).as_expr()-
  x*(x-2)**5*(x-3)**4*(x-5)**4*(x*x-6*x+4)**3)==0
perm=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
D=s.zeros(20)
for j,i in enumerate(perm):D[i,j]=1
Q=L*(L-2*s.eye(20))*(L-3*s.eye(20))*(L-5*s.eye(20))
assert D**4==s.eye(20) and D*L*D.T==L-Q/2
low,high=3-s.sqrt(5),3+s.sqrt(5)
assert s.simplify(low/high-N*N)==0
Plo=Q*(L-high*s.eye(20))/40
Phi=Q*(L-low*s.eye(20))/40
assert D*Plo*D.T==Phi and D*Phi*D.T==Plo
# The two Platonic spectral ratios are related exactly by a square.
assert s.simplify((5-s.sqrt(5))/(5+s.sqrt(5))-N)==0
# Planck length is ONLY an external reference positive threshold.
mp.mp.dps=60
u=mp.mpf(str(s.N(N,55))); planck=mp.mpf("1.616255e-35")
n=0
while u**n>=planck:n+=1
assert n==84 and u**83>planck>u**84
d=s.log(5)/(-s.log(N))
print("EXACT PASS: Platonic pentagram contraction, spectral-square duality")
print("Newton factor:",N,"=",s.N(N,20))
print("Unbounded sequence R_n = R0 * N^n; for any epsilon>0 eventually R_n<epsilon")
print("1m face: first level below Planck-reference number =",n)
print("R83 =",mp.nstr(u**83,20),"metres")
print("R84 =",mp.nstr(u**84,20),"metres")
print("Conditional fivefold fractal Hausdorff dimension =",s.N(d,20))
print("Physical spacetime claim is NOT a consequence of Euclidean geometry.")
