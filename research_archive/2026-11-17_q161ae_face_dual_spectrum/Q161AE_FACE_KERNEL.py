#!/usr/bin/env python3
"""Q161ae exact native icosahedral face-channel dual-spectral selection.
Original operators: Q161z golden-coordinate face incidence M and P,Q;
Q161ac six-channel readout B. No fitted parameters or synthetic matrices.
"""
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
assert len(pairs)==6
M=[[int(set(f).issubset({pairs[i][(x>>i)&1] for i in range(6)})) for f in faces] for x in range(64)]
def P(v):return [sum((v[x^(1<<i)^(1<<j)] for i in range(6) for j in range(i+1,6)),0)/Fraction(15) for x in range(64)]
def Q(v,i):return [(v[x]+v[x^(1<<i)])/Fraction(2) for x in range(64)]
S=Matrix.hstack(*[Matrix(P([(-1)**x.bit_count()*M[x][j] for x in range(64)])) for j in range(20)])
R=[Matrix.hstack(*[Matrix(Q(list(S[:,j]),i)) for j in range(20)]) for i in range(6)]
U=Matrix.hstack(*[r*Matrix.ones(20,1) for r in R])
B=Matrix(6,20,lambda i,j:(U[:,i].T*R[i][:,j])[0])
A=Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
assert all(sum(A[i,j] for j in range(20))==3 for i in range(20))
assert A.eigenvals()=={3:1,1:5,0:4,-2:4,sqrt(5):3,-sqrt(5):3}
assert B.rank()==6 and len(B.nullspace())==14
assert B*A*A-4*B*A+3*B==zeros(6,20)
assert (B*(A-eye(20))).rank()==1
assert (B*(A-3*eye(20))).rank()==5
assert B.T*B*A-A*B.T*B==zeros(20,20)
assert B*B.T==Rational(128,16875)*eye(6)+Rational(256,50625)*Matrix.ones(6,6)
for ev,mult in [(-2,4),(0,4),(sqrt(5),3),(-sqrt(5),3)]:
 E=(A-ev*eye(20)).nullspace()
 assert len(E)==mult and all(all(simplify(z)==0 for z in B*v) for v in E)
print("Q161ae EXACT PASS: native dual A spectrum 3(1),1(5),0(4),-2(4),+/-sqrt5(3 each); B detects 3+1, kernel 14")
