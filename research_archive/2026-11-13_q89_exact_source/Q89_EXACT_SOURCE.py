#!/usr/bin/env python3
"""Q89: exact three native source constraints; Q88 row-space result is a separate prerequisite."""
import itertools
import sympy as s
phi=(1+s.sqrt(5))/2
verts=[
 [(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],
 list(itertools.product((-1,1),repeat=3)),
 [(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],
 list(itertools.product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a/phi,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b/phi) for a,b in itertools.product((-1,1),repeat=2)],
 [(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)]
]
def moments(v):
 out=[]
 for X,Y,Z in v:
  n=s.sqrt(X*X+Y*Y+Z*Z);x,y,z=X/n,Y/n,Z/n
  out.append([x,y,z,(x*x-y*y)/s.sqrt(2),(x*x+y*y-2*z*z)/s.sqrt(6),s.sqrt(2)*x*y,s.sqrt(2)*x*z,s.sqrt(2)*y*z])
 return s.Matrix(out)
E=s.Matrix.vstack(*(moments(v) for v in verts))
I=moments(verts[-1])
G=s.simplify(E.T*E);H=s.simplify(I.T*I)
blocks=[[0,7],[1,6],[2,5],[3],[4]]
R=s.zeros(8)
for b in blocks:
 if len(b)==1:R[b[0],b[0]]=1/s.sqrt(G[b[0],b[0]])
 else:
  B=G.extract(b,b);d=s.sqrt(B.det())
  T=(B+d*s.eye(2)).inv()*s.sqrt(s.trace(B)+2*d)
  for i in range(2):
   for j in range(2):R[b[i],b[j]]=T[i,j]
J=s.diag(*[1/s.sqrt(H[i,i]) for i in range(8)])
u=s.zeros(50,1);u[0]=u[3]=1
x=I*J*R*E.T*u
V=verts[-1]
def d2(i,j):return s.simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
faces=[f for f in itertools.combinations(range(12),3) if all(d2(i,j)==4 for i,j in itertools.combinations(f,2))]
assert len(faces)==20
C=s.zeros(20,12)
for k,f in enumerate(faces):
 for i in f:C[k,i]=1
f=s.Matrix([(C.row(i).dot(x))**2 for i in range(20)])
rows=[
 (2,0,-1,0,-1,0,-2,1,1,0,-1,0,-1,1,1,0,-1,-1,1,1),
 (1,-1,-1,1,0,1,-1,-1,1,0,1,0,-1,1,0,-1,0,-2,2,0),
 (0,2,-1,-1,0,-2,0,1,0,1,-1,-1,0,1,0,1,1,1,-1,-1)
]
for k,row in enumerate(rows):
 v=sum(row[i]*f[i] for i in range(20))
 z=s.simplify(s.radsimp(v))
 assert z==0,f'constraint {k} nonzero: {z}'
 print(f'constraint {k}: EXACT ZERO',flush=True)
print('Q89_EXACT_SOURCE_ALL_THREE_PASS')
