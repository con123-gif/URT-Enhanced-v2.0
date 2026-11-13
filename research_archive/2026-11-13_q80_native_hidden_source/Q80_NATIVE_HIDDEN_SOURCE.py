#!/usr/bin/env python3
"""Q80: exact native hidden-quartet chronology selection in eight Q64 dictionaries."""
import itertools,numpy as np,networkx as nx
from itertools import combinations
from sympy import Matrix,eye,zeros,trace
phi=(1+5**.5)/2
pts=np.array([(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)],float)
pairs=[];rem=set(range(12))
while rem:
 i=min(rem);j=min(rem-{i},key=lambda k:np.linalg.norm(pts[i]+pts[k]));pairs.append((i,j));rem-={i,j}
G=nx.Graph();G.add_edges_from((i,j) for i,j in combinations(range(12),2) if abs(np.linalg.norm(pts[i]-pts[j])-2)<1e-9)
code_of={frozenset(pairs[k][(c>>k)&1] for k in range(6)):c for c in range(64)}
perms=[];total=0
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
 total+=1;p=[m[i] for i in range(12)]
 if np.linalg.det(np.linalg.lstsq(pts,pts[p],rcond=None)[0])>0:
  perms.append(np.array([code_of[frozenset(p[pairs[k][(c>>k)&1]] for k in range(6))] for c in range(64)]))
assert total==120 and len(perms)==60
Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=1
sig=[0]*64
for x in range(32):sig[x]=2*x+1;sig[x+32]=2*x
P=np.zeros((64,64),dtype=np.int64)
for i,j in enumerate(sig):P[i,j]=1
faces=sorted(tuple(t) for t in combinations(range(12),3) if all(G.has_edge(i,j) for i,j in combinations(t,2)))
assert len(faces)==20
C=zeros(20,12)
for f,t in enumerate(faces):
 for v in t:C[f,v]=1
Ph=eye(20)-C*(C.T*C).inv()*C.T
# Native dual-dodecahedral graph and exact spectral projectors (Q79).
L=zeros(20)
for i in range(20):
 L[i,i]=3
 for j in range(20):
  if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert P3*P3==P3 and P5*P5==P5 and P3*P5==zeros(20)
assert trace(P3)==trace(P5)==4 and P3+P5==Ph
M=zeros(64,20)
for h in range(64):
 selected={pairs[k][(h>>k)&1] for k in range(6)}
 for f,t in enumerate(faces):M[h,f]=int(set(t)<=selected)
assert Ph.rank()==8 and M.T*M*Ph==2*Ph
P8=M*Ph*M.T/2
assert P8*P8==P8 and trace(P8)==8
Ds=[(0,2,4,6,10,9),(0,2,7,5,9,10),(0,2,9,10,4,6),(0,2,10,9,7,5),(0,3,4,7,10,8),(0,3,7,4,9,11),(0,3,9,11,4,7),(0,3,10,8,7,4)]
# The original November 7 all-five source is h_s=P_s[(C Plinear Eglobal u)^2].
# Its image is contained in im(P3)+im(P5), so exact annihilation of the entire
# P5 carrier certifies every such source, including u=e0+e3, without fitting.
results=[]
for D in Ds:
 idx=np.array([sum((((h>>j)&1)^(D[j]&1))<<(D[j]//2) for j in range(6)) for h in range(64)])
 assert sorted(idx)==list(range(64))
 inv=np.empty(64,dtype=int);inv[idx]=np.arange(64)
 X=Q[np.ix_(inv,inv)];S=np.zeros((64,64),dtype=np.int64)
 for p in perms:S+=X[np.ix_(p,p)]
 S=S[np.ix_(idx,idx)]
 assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
 comm=S@P-P@S
 assert int(np.sum(comm*comm))==7200
 ph=P8.extract(idx.tolist(),idx.tolist())
 energy=trace(ph*Matrix((comm@comm.T).tolist()))
 left=ph*Matrix(comm.tolist());right=Matrix(comm.tolist())*ph
 ranks=(left.rank(),right.rank())
 # Exact source-resolved operator certificate, stronger than a single probe.
 # Q78's occupancy M and projectors P3/P5 are the original H64 U_h source maps.
 cmat=Matrix(comm.tolist())
 m3=(M*P3).extract(idx.tolist(),list(range(20)))
 m5=(M*P5).extract(idx.tolist(),list(range(20)))
 assert cmat.T*m5==zeros(64,20)
 assert (cmat.T*m3).rank()==4
 results.append((D,int(energy),ranks))
 print('DICT',D,'HIDDEN_ENERGY',energy,'LEFT_RIGHT_RANKS',ranks,flush=True)
assert len(results)==8
assert {x[1] for x in results}=={1296}
assert {x[2] for x in results}=={(4,4)}
print('Q80_EXACT_P5_SOURCE_ANNIHILATION_ALL_EIGHT_PASS')
