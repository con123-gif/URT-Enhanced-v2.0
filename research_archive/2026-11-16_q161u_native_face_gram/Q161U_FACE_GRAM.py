#!/usr/bin/env python3
"""Q161u: exact Gram spectrum of original Q161t face-to-history incidence and Q161a Q/P."""
from itertools import product, combinations
from sympy import Matrix, sqrt, simplify, Rational, factor, symbols
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
par=Matrix([(-1)**s.bit_count() for s in range(64)])
def P(v):
 return Matrix([sum((v[x^(1<<i)^(1<<j)]
   for i in range(6) for j in range(i+1,6)),0)/15 for x in range(64)])
def Q(v):
 return Matrix([(v[2*(x%32)]+v[2*(x%32)+1])/2 for x in range(64)])
R=Matrix.hstack(*[Q(P(Matrix([par[x]*M[x,j] for x in range(64)])))
 for j in range(20)])
active=[j for j in range(20) if R[:,j]!=Matrix.zeros(64,1)]
assert active==[0,1,2,3,4,5,6,13,14,15]
assert active==[j for j,f in enumerate(faces)
 if any(v in f for v in pairs[0])]
assert M.rank()==20 and R.rank()==10
B=R[:,active]; G=B.T*B
lam=symbols('lambda')
expected=(25*lam-2)**4*(225*lam-268)*(225*lam-8)*(50625*lam**2-1350*lam+4)**2/50682163238525390625
assert G==G.T and factor(G.charpoly(lam).as_expr()-expected)==0
assert G.det()==Rational(548864,50682163238525390625)
assert all(G[i,i]==Rational(4,25) for i in range(10))
print('Q161u PASS: native QP face response rank 10; inactive 10 faces avoid antipodal bit-0 pair')
print('exact characteristic polynomial:',factor(G.charpoly(lam).as_expr()))
print('determinant:',G.det())
print('Physical five-solid/24-clock source and Q96 Ward remain open')
