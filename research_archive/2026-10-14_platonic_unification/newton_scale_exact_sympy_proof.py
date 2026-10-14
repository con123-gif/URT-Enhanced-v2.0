#!/usr/bin/env python3
"""Exact Newton Scale theorem. Pure integer and algebraic checks with SymPy.
No data files, observed constants, fit, or float tolerance needed.
This proves the finite spectral theorem and a CONDITIONAL infinite IFS,
not the physical hypothesis of measurable sub-Planck distances.
"""
import sympy as S
neighbors=[
 [8,12,16],[9,12,17],[10,13,16],[11,13,17],
 [8,14,18],[9,14,19],[10,15,18],[11,15,19],
 [0,4,10],[1,5,11],[2,6,8],[3,7,9],
 [0,1,14],[2,3,15],[4,5,12],[6,7,13],
 [0,2,17],[1,3,16],[4,6,19],[5,7,18]]
perm=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
cubes=[
 (0,1,2,3,4,5,6,7),
 (0,7,9,10,13,14,17,18),
 (1,6,8,11,13,14,16,19),
 (2,5,8,11,12,15,17,18),
 (3,4,9,10,12,15,16,19)]
I=S.eye(20);A=S.zeros(20)
for i,js in enumerate(neighbors):
    assert len(js)==3
    for j in js:A[i,j]=1
assert A==A.T
L=3*I-A
D=S.zeros(20)
for j,i in enumerate(perm):D[i,j]=1
assert D.T*D==I and D**4==I
for j,verts in enumerate(cubes):
    assert {perm[k] for k in verts}==set(cubes[(2*j)%5])
x=S.symbols("x")
char=x*(x-2)**5*(x-3)**4*(x-5)**4*(x*x-6*x+4)**3
assert S.expand(L.charpoly(x).as_expr()-char)==0
Q=L*(L-2*I)*(L-3*I)*(L-5*I)
assert D*L*D.T==L-Q/2
lo,hi=3-S.sqrt(5),3+S.sqrt(5)
Pm=Q*(L-hi*I)/40
Pp=Q*(L-lo*I)/40
assert Pm*Pm==Pm and Pp*Pp==Pp and Pm*Pp==S.zeros(20)
assert D*Pm*D.T==Pp and D*Pp*D.T==Pm
assert S.trace(Pm)==S.trace(Pp)==3
Newton=(3-S.sqrt(5))/2
phi=(1+S.sqrt(5))/2
assert S.simplify(lo/hi-Newton**2)==0
assert S.simplify(Newton-phi**(-2))==0
assert S.trace(L)==60 and D*L*D.T != L/Newton**2
# The same five labels form a regular four-simplex tight frame.
P=S.eye(5)-S.ones(5)/5
v=[S.sqrt(S.Rational(5,4))*P[:,i] for i in range(5)]
assert all(S.simplify((v[i].T*v[j])[0]
                    -(1 if i==j else -S.Rational(1,4)))==0
           for i in range(5) for j in range(5))
R=[u*u.T for u in v]
assert sum(R,S.zeros(5))==S.Rational(5,4)*P
K=[S.sqrt(S.Rational(4,5))*r for r in R]
assert sum([k.T*k for k in K],S.zeros(5))==P
M=S.Matrix(5,5,lambda i,j:
           S.simplify((v[i].T*K[j].T*K[j]*v[i])[0]))
assert M==S.Rational(3,4)*S.eye(5)+S.ones(5)/20
assert M.eigenvals()=={S.Integer(1):1,S.Rational(3,4):4}
# If the five similarities F_j(z)=Newton*z+(1-Newton)*v_j
# are chosen at each depth, Newton<1/2 ensures disjoint pieces;
# standard IFS theorem gives d_H=log(5)/(-log(Newton)).
assert 0<Newton<S.Rational(1,2)
print("EXACT PASS: cube doubling, polynomial conjugacy, triplet exchange")
print("Newton factor =",Newton,"=",S.N(Newton,18))
print("conditional fractal Hausdorff dimension =",S.N(S.log(5)/(-S.log(Newton)),18))
print("PASS: 5-branch normalized quantum instrument 4/5 vs 1/20")
print("Physical selected H64 cross-level transfer: NOT PROVED")
