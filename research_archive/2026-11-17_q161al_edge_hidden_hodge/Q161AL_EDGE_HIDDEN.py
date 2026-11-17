#!/usr/bin/env python3
"""Q161al: original golden icosahedron oriented face-edge Hodge map."""
from itertools import product, combinations
from sympy import Matrix, eye, zeros, sqrt, simplify
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(i,j): return simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
edges=[(i,j) for i,j in combinations(range(12),2) if d2(i,j)==4]
faces=[f for f in combinations(range(12),3) if all((min(i,j),max(i,j)) in edges for i,j in combinations(f,2))]
assert (len(edges),len(faces))==(30,20)
A=Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
I=eye(20)
H=I-4*A/3+2*A**2/15+4*A**3/15-A**4/15
assert H*H==H and H.T==H and H.rank()==8
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def oriented(f):
 a,b,c=f
 u=[V[b][k]-V[a][k] for k in range(3)]
 v=[V[c][k]-V[a][k] for k in range(3)]
 n=cross(u,v)
 return (a,b,c) if simplify(sum(n[k]*V[a][k] for k in range(3)))>0 else (a,c,b)
D=zeros(30,20)
for j,(a,b,c) in enumerate(map(oriented,faces)):
 for u,v in ((a,b),(b,c),(c,a)):
  i=edges.index((min(u,v),max(u,v)))
  D[i,j]=1 if u<v else -1
assert D.rank()==19
assert D*Matrix.ones(20,1)==zeros(30,1)
assert D.T*D==3*I-A
assert (D*H).rank()==8
assert H*D.T*D*H==3*H-H*A
assert (H*D.T*D*H).eigenvals()=={0:12,3:4,5:4}
assert len((D*H).nullspace())==12
print("Q161al EXACT PASS: original face-edge boundary rank 19; hidden rank 8; hidden Gram 3(x4),5(x4),0(x12)")
