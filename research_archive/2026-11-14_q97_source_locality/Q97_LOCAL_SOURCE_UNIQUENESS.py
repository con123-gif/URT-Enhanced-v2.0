#!/usr/bin/env python3
"""Q97 exact native A5 face-local quadratic source classification, no ARF fitting."""
from itertools import combinations,product
from sympy import Matrix,eye,Rational,sqrt,simplify,zeros
phi=(1+sqrt(5))/2
pm=list(product((-1,1),repeat=2))
V=[(0,a,b*phi) for a,b in pm]+[(a,b*phi,0) for a,b in pm]+[(a*phi,0,b) for a,b in pm]
edge=lambda a,b: simplify(sum((V[a][i]-V[b][i])**2 for i in range(3)))==4
E={t for t in combinations(range(12),2) if edge(*t)}
faces=sorted(t for t in combinations(range(12),3) if all(s in E for s in combinations(t,2)))
assert len(E)==30 and len(faces)==20
C=Matrix(20,12,lambda f,v: int(v in faces[f]))
Ph=eye(20)-C*(C.T*C).inv()*C.T
assert Ph.rank()==8 and Ph*C==zeros(20,12)
A=Matrix(20,20,lambda i,j: int(i!=j and len(set(faces[i])&set(faces[j]))==2))
L=3*eye(20)-A
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert P3.rank()==P5.rank()==4 and P3+P5==Ph
# Face stabilizer C3: exactly two quadratic monomial orbits.
monomials=[(0,0),(1,1),(2,2),(0,1),(0,2),(1,2)]
rot=lambda m: tuple(sorted(((v+1)%3 for v in m)))
orbits=[];todo=set(monomials)
while todo:
    m=min(todo);cyc={m,rot(m),rot(rot(m))}
    assert len(cyc)==3 and cyc<=todo
    todo-=cyc;orbits.append(cyc)
assert len(orbits)==2
# Vertex-diagonal invariant lies in im(C) and is killed by Ph.
for i in range(12):
    sq=Matrix([int(i in f) for f in faces])
    assert Ph*sq==zeros(20,1)
# Vertex-pair orbit remains and spans both entire hidden quartets.
B=[];B3=[];B5=[]
for i,j in combinations(range(12),2):
    b=Matrix([int(i in f and j in f) for f in faces])
    assert Ph*(2*b)==2*Ph*b
    B.append(Ph*b);B3.append(P3*b);B5.append(P5*b)
assert Matrix.hstack(*B).rank()==8
assert Matrix.hstack(*B3).rank()==4
assert Matrix.hstack(*B5).rank()==4
print("Q97 original 20 faces, 30 edges, C3 quadratic invariant dimension 2")
print("Ph C = 0, so only one source map survives: PhF=(b/2)Ph(Cx)^2")
print("Projector image ranks: hidden 8, quartet3 4, quartet5 4")
print("Q97 NATIVE FACE-LOCAL QUADRATIC UNIQUENESS: EXACT PASS")
