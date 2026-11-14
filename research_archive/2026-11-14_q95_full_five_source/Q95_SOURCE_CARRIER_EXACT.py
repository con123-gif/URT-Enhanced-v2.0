#!/usr/bin/env python3
"""Q95 exact source-shape law on original Q89 span{Z,XY}, native Q94 history geometry."""
from itertools import combinations,product
from sympy import Matrix,eye,ones,Rational,sqrt,simplify
phi=(1+sqrt(5))/2
pm=list(product((-1,1),repeat=2))
V=[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]+[(a*phi,0,b) for a,b in pm]
edge=lambda a,b: simplify(sum((V[a][i]-V[b][i])**2 for i in range(3)))==4
E={t for t in combinations(range(12),2) if edge(*t)}
faces=sorted(t for t in combinations(range(12),3) if all(s in E for s in combinations(t,2)))
assert len(faces)==20
C=Matrix(20,12,lambda f,v: int(v in faces[f]))
Ph=eye(20)-C*(C.T*C).inv()*C.T
A=Matrix(20,20,lambda i,j: int(i!=j and len(set(faces[i])&set(faces[j]))==2))
L=3*eye(20)-A
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
pairs=[];rem=set(range(12))
while rem:
    a=min(rem)
    b=next(b for b in sorted(rem-{a}) if all(simplify(V[a][c]+V[b][c])==0 for c in range(3)))
    pairs.append((a,b))
    rem-={a,b}
M=Matrix(64,20,lambda h,f: int(set(faces[f])<=set(pair[(h>>i)&1] for i,pair in enumerate(pairs))))
Q=Matrix.zeros(64,64)
for h in range(64):
    Q[h,2*h%64]=Q[h,(2*h+1)%64]=Rational(1,2)
P=ones(64,64)/64
R=[eye(64)-P]+[Q**i-P for i in range(1,6)]
Z=Matrix([v[2] for v in V]);XY=Matrix([v[0]*v[1] for v in V])
CZ=C*Z;CXY=C*XY
fA=CZ.multiply_elementwise(CZ)
fB=2*CZ.multiply_elementwise(CXY)
fC=CXY.multiply_elementwise(CXY)
for name,t in [('P3 fA',P3*fA),('P5 fA',P5*fA),('P3 fC',P3*fC),('P5 fB',P5*fB)]:
    assert all(simplify(x)==0 for x in t),name
h3=P3*fB;h5=P5*fC
n3=simplify((h3.T*h3)[0]);n5=simplify((h5.T*h5)[0])
assert n3!=0 and n5!=0
print('Q89 source span: h3=ab P3 fB, h5=b^2 P5 fC; EXACT')
V3=[r.T*M*h3 for r in R]
V5=[r.T*M*h5 for r in R]
def gram(X,Y):
    return Matrix(6,6,lambda i,j: simplify((X[i].T*Y[j])[0]/2))
G3=gram(V3,V3);G5=gram(V5,V5);G35=gram(V3,V5)
assert G35==Matrix.zeros(6,6)
def coefficients(G):
    return [simplify(sum(G[i,i+d] for i in range(6-d))) for d in range(6)]
r3=[simplify(c/n3) for c in coefficients(G3)]
r5=[simplify(c/n5) for c in coefficients(G5)]
assert r3==[Rational(3,2),0,0,0,0,0]
assert r5==[Rational(17,6),Rational(1,2),Rational(17,30),Rational(1,12),Rational(-4,15),0]
print('R3 coeff / n3',r3)
print('R5 coeff / n5',r5)
print('Q95 EXACT SYMBOLIC SOURCE-SHAPE AND ZERO CROSS-RESPONSE: PASS')
