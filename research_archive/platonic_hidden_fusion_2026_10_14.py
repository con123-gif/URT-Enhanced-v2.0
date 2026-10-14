"""Reproduce Platonic incidence kernels and five-cube hidden fusion; requires numpy."""
import itertools as it
import numpy as np
from math import pi,e,sqrt,cos,sin
phi=(1+sqrt(5))/2

def solids():
 c=np.array(list(it.product((-1.,1.),repeat=3)))
 t=np.array([x for x in c if np.prod(x)==1]);o=np.array([[s if i==j else 0 for i in range(3)] for j in range(3) for s in (-1.,1.)])
 I=np.array([[0,a,b*phi] for a in (-1.,1.) for b in (-1.,1.)]+[[a,b*phi,0] for a in (-1.,1.) for b in (-1.,1.)]+[[a*phi,0,b] for a in (-1.,1.) for b in (-1.,1.)])
 D=np.vstack((c,[[0,a/phi,b*phi] for a in (-1.,1.) for b in (-1.,1.)],[[a/phi,b*phi,0] for a in (-1.,1.) for b in (-1.,1.)],[[a*phi,0,b/phi] for a in (-1.,1.) for b in (-1.,1.)]))
 R=np.array([[cos(2*pi*k/5),sin(2*pi*k/5),0] for k in range(5)]+[[0,0,1/phi],[0,0,-1/phi]])
 return dict(tetrahedron=t,cube=c,octahedron=o,icosahedron=I,dodecahedron=D,decahedron=R)

def faces(v):
 out=set()
 for i,j,k in it.combinations(range(len(v)),3):
  n=np.cross(v[j]-v[i],v[k]-v[i]);size=np.linalg.norm(n)
  if size<1e-8:continue
  d=(v-v[i])@(n/size)
  if d.min()<-1e-8 and d.max()>1e-8:continue
  f=tuple(np.where(abs(d)<1e-8)[0])
  if len(f)>=3:out.add(f)
 return sorted(out)

def inc(v):
 f=faces(v);B=np.zeros((len(f),len(v)))
 for i,g in enumerate(f):B[i,list(g)]=1
 return B,f

def adjacency(v,f):
 A=np.zeros((len(v),len(v)))
 for g in f:
  p=v[list(g)];mid=p.mean(0);n=mid/np.linalg.norm(mid);x=p[0]-mid;x/=np.linalg.norm(x);y=np.cross(n,x)
  order=np.array(g)[np.argsort(np.arctan2((p-mid)@y,(p-mid)@x))]
  for i in range(len(order)):
   a,b=order[i],order[(i+1)%len(order)];A[a,b]=A[b,a]=1
 return A

def kern(B):
 u,s,v=np.linalg.svd(B,full_matrices=True)
 return v[np.count_nonzero(s>1e-9):].T

def run():
 V=solids();counts={}
 for name,v in V.items():
  B,f=inc(v);r=int(np.linalg.matrix_rank(B,tol=1e-9))
  counts[name]=(int(len(v)-r),int(len(f)-r))
 assert [counts[x] for x in V]==[(0,0),(4,2),(2,4),(0,8),(8,0),(1,4)]
 D=V['dodecahedron'];B,f=inc(D);A=adjacency(D,f)
 eig,U=np.linalg.eigh(A)
 P=lambda z:(lambda Q:Q@Q.T)(U[:,abs(eig-z)<1e-8])
 P3,P5,Pband=P(0),P(-2),P(1)
 pairs=[];unused=set(range(20))
 for i in range(20):
  if i not in unused:continue
  j=min((j for j in unused if j!=i),key=lambda j:np.linalg.norm(D[i]+D[j]))
  assert np.linalg.norm(D[i]+D[j])<1e-9
  pairs.append((i,j));unused.difference_update((i,j))
 cubes=[]
 for four in it.combinations(range(10),4):
  ids=tuple(sorted(it.chain.from_iterable(pairs[k] for k in four)));v=D[list(ids)]/sqrt(3)
  dots=sorted(round(float(v[i]@v[j]),8) for i in range(8) for j in range(i+1,8))
  if dots==sorted([round(1/3,8)]*12+[round(-1/3,8)]*12+[-1.]*4):cubes.append(ids)
 assert len(cubes)==5
 avg=np.zeros((20,20));odd=np.zeros((20,20));blocks=[];tetra=[];member=np.zeros(20)
 for ids in cubes:
  v=D[list(ids)];C,f=inc(v);K=kern(C);G=adjacency(v,f);assert K.shape==(8,4)
  E=np.zeros((20,8))
  for j,i in enumerate(ids):E[i,j]=1
  member[list(ids)]+=1;W=E@K;blocks.append(W);avg+=W@W.T/5
  signs={0:1};queue=[0]
  while queue:
   i=queue.pop(0)
   for j in np.where(G[i]>0)[0]:
    j=int(j)
    if j not in signs:signs[j]=-signs[i];queue.append(j)
  z=E@np.array([signs[i] for i in range(8)])/sqrt(8)
  assert np.linalg.norm(C@(E.T@z))<1e-9
  tetra.append(z);odd+=np.outer(z,z)/5
 assert np.all(member==2)
 assert all(len(set(a)&set(b))==2 for a,b in it.combinations(cubes,2))
 assert np.linalg.matrix_rank(np.concatenate(blocks,axis=1),tol=1e-9)==13
 assert np.linalg.matrix_rank(np.stack(tetra,axis=1),tol=1e-9)==4
 err=np.linalg.norm(avg-(P3/4+P5/4+2*Pband/5));terr=np.linalg.norm(odd-P3/4)
 assert err<1e-10 and terr<1e-10
 delta=3/20-80*pi/(1053*phi);rho=np.diag([1.]*4+[delta**2]*4)/(4*(1+delta**2))
 angle=2*pi/phi**2;k=pi/e;R=np.array([[cos(angle),-sin(angle)],[sin(angle),cos(angle)]]);Z=np.zeros((2,2))
 S=np.block([[k*R,Z],[Z,R/k]]);J=np.block([[Z,np.eye(2)],[-np.eye(2),Z]])
 assert abs(np.trace(rho)-1)<1e-12 and np.linalg.norm(S.T@J@S-J)<1e-12
 return dict(hidden_counts=counts,nested_cubes=5,combined_rank=13,odd_tetra_rank=4,
             cube_projector_error=float(err),tetra_projector_error=float(terr),
             urt_symplectic_error=float(np.linalg.norm(S.T@J@S-J)),delta=delta)
if __name__=='__main__':
 import json
 print(json.dumps(run(),indent=2))
