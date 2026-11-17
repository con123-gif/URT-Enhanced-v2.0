#!/usr/bin/env python3
"""Q161as exact original icosahedral face-source edge energy; fail on any mismatch."""
from itertools import product,combinations
from fractions import Fraction
from sympy import Matrix,Rational,sqrt,simplify,eye,zeros
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(i,j):return simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
faces=[f for f in combinations(range(12),3) if all(d2(i,j)==4 for i,j in combinations(f,2))]
assert len(faces)==20
pairs=[];unused=set(range(12))
while unused:
 i=min(unused)
 js=[j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3))]
 assert len(js)==1
 j=js[0];pairs.append((i,j));unused-={i,j}
M=[[int(set(f).issubset({pairs[i][(x>>i)&1] for i in range(6)}))
 for f in faces] for x in range(64)]
def P(v):return [sum((v[x^(1<<i)^(1<<j)] for i in range(6)
 for j in range(i+1,6)),0)/Fraction(15) for x in range(64)]
def Q(v,i):return [(v[x]+v[x^(1<<i)])/Fraction(2) for x in range(64)]
S=Matrix.hstack(*[Matrix(P([(-1)**x.bit_count()*M[x][j] for x in range(64)])) for j in range(20)])
R=[Matrix.hstack(*[Matrix(Q(list(S[:,j]),i)) for j in range(20)]) for i in range(6)]
U=Matrix.hstack(*[r*Matrix.ones(20,1) for r in R])
B=Matrix(6,20,lambda i,j:(U[:,i].T*R[i][:,j])[0])
A=Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
L=3*eye(20)-A
G=B*B.T;J=Matrix.ones(6,6);I=eye(6)
assert G==Rational(128,16875)*I+Rational(256,50625)*J
T=B.T*G.inv()
assert B*T==I
E=T.T*L*T
assert E==Rational(16875,64)*(I-J/6)
assert L*T*Matrix.ones(6,1)==zeros(20,1)
assert E.eigenvals()=={0:1,Rational(16875,64):5}
Pi=T*B
assert Pi*L==L*Pi and (eye(20)-Pi).rank()==14
print("Q161as EXACT PASS: native B lift T, edge energy (16875/64)(I-J/6), eigenvalues 0,16875/64(x5), 14D invisible")
