#!/usr/bin/env python3
"""Q161t: exact original icosahedral face-incidence parity-source capacity."""
from itertools import product, combinations
from sympy import Matrix, sqrt, simplify, Rational
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
   +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
   +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(a,b): return simplify(sum((x-y)**2 for x,y in zip(a,b)))
faces=[f for f in combinations(range(12),3)
       if all(d2(V[i],V[j])==4 for i,j in combinations(f,2))]
assert len(faces)==20
pairs=[]; unused=set(range(12))
while unused:
    i=min(unused)
    js=[j for j in unused-{i}
        if all(simplify(V[i][k]+V[j][k])==0 for k in range(3))]
    assert len(js)==1
    j=js[0]; pairs.append((i,j)); unused-={i,j}
M=Matrix(64,20,lambda s,f:int(set(faces[f]).issubset(
    {pairs[i][(s>>i)&1] for i in range(6)})))
O=Matrix(64,64,lambda x,y:Rational(int(x==y)-int((x^1)==y),2))
par=Matrix([(-1)**s.bit_count() for s in range(64)])
def P(v):
    return Matrix([sum((v[x^(1<<i)^(1<<j)]
        for i in range(6) for j in range(i+1,6)),0)/15 for x in range(64)])
def Q(v):
    return Matrix([(v[2*(x%32)]+v[2*(x%32)+1])/2 for x in range(64)])
A=O*M
R=Matrix.hstack(*[Q(P(Matrix([par[x]*M[x,j] for x in range(64)])))
                  for j in range(20)])
assert M.rank()==20
assert A.rank()==10 and R.rank()==10
assert R==Matrix.hstack(*[Q(P(Matrix([par[x]*A[x,j] for x in range(64)])))
                         for j in range(20)])
active=[j for j in range(20) if R[:,j]!=Matrix.zeros(64,1)]
assert active==[0,1,2,3,4,5,6,13,14,15]
assert M.T*par==Matrix.zeros(20,1)
print("Q161t exact: rank M=20, rank odd(M)=10, rank QP D_M parity=10, nullity=10")
print("Active face columns:",active)
print("PHYSICAL IDENTIFICATION PENDING: five-solid/24-clock source amplitudes and Q96 Ward not tested")
