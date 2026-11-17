#!/usr/bin/env python3
"""Q161am: exact left inverse of native Q161af history readout and Q161al edge boundary."""
from itertools import product, combinations
from fractions import Fraction
from sympy import Matrix, sqrt, simplify, eye, zeros
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(i,j): return simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
edges=[(i,j) for i,j in combinations(range(12),2) if d2(i,j)==4]
faces=[f for f in combinations(range(12),3) if all((min(i,j),max(i,j)) in edges for i,j in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
A=Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
I=eye(20)
pairs=[];unused=set(range(12))
while unused:
 i=min(unused);js=[j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3))]
 assert len(js)==1
 j=js[0];pairs.append((i,j));unused-={i,j}
M=[[int(set(f).issubset({pairs[i][(x>>i)&1] for i in range(6)})) for f in faces] for x in range(64)]
def P(v):return [sum((v[x^(1<<i)^(1<<j)] for i in range(6) for j in range(i+1,6)),0)/Fraction(15) for x in range(64)]
def Q(v,i):return [(v[x]+v[x^(1<<i)])/Fraction(2) for x in range(64)]
S=Matrix.hstack(*[Matrix(P([(-1)**x.bit_count()*M[x][j] for x in range(64)])) for j in range(20)])
R=[Matrix.hstack(*[Matrix(Q(list(S[:,j]),i)) for j in range(20)]) for i in range(6)]
U=Matrix.hstack(*[r*Matrix.ones(20,1) for r in R])
B=Matrix(6,20,lambda i,j:(U[:,i].T*R[i][:,j])[0])
D=zeros(30,20)
def cross(u,v):return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
for j,(a,b,c) in enumerate(faces):
 u=[V[b][k]-V[a][k] for k in range(3)];v=[V[c][k]-V[a][k] for k in range(3)]
 if simplify(sum(cross(u,v)[k]*V[a][k] for k in range(3)))<0:b,c=c,b
 for x,y in ((a,b),(b,c),(c,a)):
  D[edges.index((min(x,y),max(x,y))),j]=1 if x<y else -1
one=Matrix.ones(20,1)
assert D.T*D==3*I-A and D*one==zeros(30,1)
L=D.T*D
K=L+one*one.T/20
assert K.det()!=0
Lplus=K.inv()-one*one.T/20
assert Lplus*L==I-one*one.T/20
b0=B*one
assert list(b0)==[__import__('sympy').Rational(16,45)]*6
F=Lplus*D.T
G=(b0.T*b0)[0]
LeftD=F-one*(b0.T*B*F)/G
LeftB=one*b0.T/G
assert LeftD*D+LeftB*B==I
assert (D.col_join(B)).rank()==20
print("Q161am EXACT PASS: B1=(16/45)*1_6; rank([D;B])=20; exact 20-face left inverse")
