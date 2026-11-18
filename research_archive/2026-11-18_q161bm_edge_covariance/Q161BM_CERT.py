#!/usr/bin/env python3
"""Q161bl: native Q101 nonlinear face covariance classified by dodecahedral distance."""
import sympy as S
from itertools import product, combinations
from collections import deque, defaultdict
r=S.sqrt(5); phi=(1+r)/2
v=S.Matrix([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
edges=[(i,j) for i,j in combinations(range(12),2) if S.simplify(sum((v[i,k]-v[j,k])**2 for k in range(3)))==4]
faces=[f for f in combinations(range(12),3) if all(e in edges for e in combinations(f,2))]
assert len(edges)==30 and len(faces)==20
C=S.Matrix(20,12,lambda i,j:int(j in faces[i]))
opp={i:next(j for j in range(12) if all(v[i,k]+v[j,k]==0 for k in range(3))) for i in range(12)}
Kv=S.Matrix(12,12,lambda i,j:int(i==opp[j]))
Pl=(v*(v.T*v).inv()*v.T+(S.eye(12)+Kv)/2-S.ones(12,12)/12).applyfunc(S.simplify)
assert (Pl*Pl-Pl).applyfunc(S.simplify)==S.zeros(12)
A=S.Matrix(12,12,lambda i,j:int((min(i,j),max(i,j)) in edges))
assert C.T*C==5*S.eye(12)+2*A
F=(C*Pl).applyfunc(S.simplify)
mean=S.zeros(20,1); second=S.zeros(20); n=0
for bits in range(4096):
 x=S.Matrix([1-2*((bits>>i)&1) for i in range(12)])
 if sum(x)!=4 or sum(x[i]*x[j] for i,j in edges)!=-6: continue
 z=(F*x).applyfunc(S.simplify).applyfunc(lambda y:S.simplify(y*y))
 assert S.simplify(sum(z)-12)==0
 mean+=z; second+=z*z.T; n+=1
assert n==30
mean=(mean/n).applyfunc(S.simplify)
assert mean==S.ones(20,1)*S.Rational(3,5)
cov=(second/n-mean*mean.T).applyfunc(S.simplify)
adj={i:[j for j in range(20) if j!=i and len(set(faces[i])&set(faces[j]))==2] for i in range(20)}
assert all(len(adj[i])==3 for i in adj)
counts=defaultdict(lambda:defaultdict(int))
for i in range(20):
 d={i:0}; q=deque([i])
 while q:
  u=q.popleft()
  for w in adj[u]:
   if w not in d:d[w]=d[u]+1;q.append(w)
 assert len(d)==20
 for j in range(20):
  if not set(faces[i])&set(faces[j]):counts[d[j]][str(cov[i,j])]+=1
expected={3:{str(S.Rational(16,375)):120},4:{str(S.Rational(4,375)-4*r/75):60},5:{str(-S.Rational(16,125)):20}}
assert dict(counts)==expected,(dict(counts),expected)
assert (cov*S.ones(20,1)).applyfunc(S.simplify)==S.zeros(20,1)
print("Q161bl EXACT PASS; 30 original Q101 histories; disjoint dual distances",dict(counts))


# Q161bm: exact native oriented-edge covariance transport.
Adual=S.Matrix(20,20,lambda i,j:int(i!=j and len(set(faces[i])&set(faces[j]))==2))
L=3*S.eye(20)-Adual
D=S.zeros(30,20)
for e,(a,b) in enumerate(edges):
 fs=[i for i,f in enumerate(faces) if a in f and b in f]
 assert len(fs)==2
 D[e,fs[0]]=1; D[e,fs[1]]=-1
assert D.T*D==L
edge_energy=S.simplify(S.trace(D*cov*D.T))
edge_second=S.simplify(S.trace((D*cov*D.T)**2))
assert S.simplify(edge_energy-(S.Rational(1232,25)-16*r/5))==0
assert S.simplify(edge_second-(S.Rational(1759232,9375)-512*r/25))==0
assert S.simplify(S.trace(cov)-S.Rational(416,25))==0
print("Q161bm EXACT PASS: 30 original Q101 histories; edge energy",edge_energy,"edge second",edge_second)
